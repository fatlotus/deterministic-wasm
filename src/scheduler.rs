use tokio::sync::oneshot;
use std::sync::{Arc, Mutex};
use std::io::Write;
use std::cmp::Reverse;
use std::collections::{VecDeque, BinaryHeap, HashMap};
use wasmtime::{Linker, InstancePre};

pub struct DelayedThread {
    pub wake_time: u64,
    pub tx: oneshot::Sender<i32>,
}

impl PartialEq for DelayedThread {
    fn eq(&self, other: &Self) -> bool {
        self.wake_time == other.wake_time
    }
}

impl Eq for DelayedThread {}

impl PartialOrd for DelayedThread {
    fn partial_cmp(&self, other: &Self) -> Option<std::cmp::Ordering> {
        Some(self.cmp(other))
    }
}

impl Ord for DelayedThread {
    fn cmp(&self, other: &Self) -> std::cmp::Ordering {
        self.wake_time.cmp(&other.wake_time)
    }
}

#[derive(Debug, Clone, Default)]
pub struct ExecutionTrace {
    pub choices: Vec<i32>,
}

pub struct ExecutionTraceState {
    pub current_trace: ExecutionTrace,
    pub trace_index: usize,
    pub new_traces: tokio::sync::mpsc::UnboundedSender<ExecutionTrace>,
}

pub struct Scheduler {
    pub paused_threads: VecDeque<oneshot::Sender<i32>>,
    pub delayed_threads: BinaryHeap<Reverse<DelayedThread>>,
    pub futex_blocked_threads: HashMap<i32, Vec<oneshot::Sender<i32>>>,
    pub next_thread_id: i32,
    pub current_time: u64,
    pub call_count: u64,
    pub exited: Option<i32>,
}

#[derive(Clone)]
pub struct DeterministicThread {
    pub scheduler: Arc<Mutex<Scheduler>>,
    pub linker: Option<Arc<Linker<DeterministicThread>>>,
    pub instance: Option<InstancePre<DeterministicThread>>,
    pub stdout: Arc<Mutex<Box<dyn Write + Send>>>,
    pub args: Vec<String>,
    pub envs: Vec<(String, String)>,
    pub wasi_fs: Option<Arc<crate::vfs::WasiFs>>,
    pub trace_state: Option<Arc<Mutex<ExecutionTraceState>>>,
}

pub async fn call_scheduler(state: &mut DeterministicThread) {
    let (tx, wake_time) = {
        let mut scheduler = state.scheduler.lock().unwrap();
        scheduler.call_count += 1;
        {
            eprintln!("[Host] Calling scheduler (paused={}, delayed={})", 
                scheduler.paused_threads.len(),
                scheduler.delayed_threads.len());
        }

        if scheduler.exited.is_some() {
            return;
        }

        if let Some(tx) = scheduler.paused_threads.pop_front() {
            (Some(tx), None)
        } else if let Some(Reverse(delayed)) = scheduler.delayed_threads.pop() {
            let wake_time = delayed.wake_time;
            scheduler.current_time = wake_time;
            (Some(delayed.tx), Some(wake_time))
        } else {
            (None, None)
        }
    };

    if let Some(tx) = tx {
        if let Some(_time) = wake_time {
            // let mut stdout = state.stdout.lock().unwrap();
            // let _ = writeln!(stdout, "[Host] Advancing time to {} to wake thread", time);
        }
        let _ = tx.send(0);
    } else {
        // let mut stdout = state.stdout.lock().unwrap();
        // let _ = writeln!(stdout, "[Host] No more threads to run");
    }
}
