use anyhow::{Context, Result};
use std::path::PathBuf;
use clap::Parser;
use std::fs;

#[derive(Parser)]
#[command(author, version, about, long_about = None)]
struct Cli {
    /// Input WASM/WAT file
    input: PathBuf,

    /// Output WASM/WAT file
    #[arg(short, long)]
    output: PathBuf,
}

fn main() -> Result<()> {
    let cli = Cli::parse();

    let input_bytes = fs::read(&cli.input)
        .with_context(|| format!("Failed to read input file: {:?}", cli.input))?;

    // If input is WAT, convert to binary first (wat crate handles both binary and text transparently usually, 
    // but walrus expects binary. `wat::parse_bytes` does the job).
    let wasm_bytes = wat::parse_bytes(&input_bytes)
        .with_context(|| "Failed to parse input file as WASM/WAT")?;

    // Transform
    let transformed_wasm = deterministic_wasm::wasm_transform::transform_wasm(&wasm_bytes)
        .with_context(|| "Failed to transform WASM")?;

    // Write output
    fs::write(&cli.output, transformed_wasm)
        .with_context(|| format!("Failed to write output file: {:?}", cli.output))?;

    println!("Successfully transformed {:?} -> {:?}", cli.input, cli.output);
    Ok(())
}
