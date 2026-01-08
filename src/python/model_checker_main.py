import ctypes
import threading
import time

# Import the WASI model_checker_select function
# In Python WASM, we need to use ctypes to call WASI imports
# This is a placeholder - Python WASI may not support custom imports easily
# For now, we'll create a simplified version

def make_a_choice(options):
    """Placeholder for model_checker_select - returns 0 for determinism"""
    return 0

def maybe_sleep():
    if make_a_choice(2) == 1:
        time.sleep(1)

def main():
    cnt = [0]  # Use list to allow modification in nested function
    
    def increment1():
        x = cnt[0]
        maybe_sleep()
        cnt[0] = x + 1
    
    def increment2():
        x = cnt[0]
        maybe_sleep()
        cnt[0] = x + 1
    
    t1 = threading.Thread(target=increment1)
    t2 = threading.Thread(target=increment2)
    
    t1.start()
    t2.start()
    
    t1.join()
    t2.join()
    
    print(f"Total: {cnt[0]}")

if __name__ == "__main__":
    main()
