# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

A simple Rust web application built with Axum that serves a "Hello World" message and version information. The project uses the `built` crate to embed git version information at compile time.

## Build and Run Commands

```bash
# Build the project
cargo build

# Build for release
cargo build --release

# Run the application (binds to 0.0.0.0:8080)
cargo run

# Run tests
cargo test

# Check code without building
cargo check

# Format code
cargo fmt

# Run linter
cargo clippy
```

## Architecture

**Single-file web server** (`src/main.rs`):
- Uses Axum web framework with Tokio async runtime
- Two routes:
  - `GET /` → Returns "Hello World!"
  - `GET /version` → Returns git version from build metadata
- Server binds to `0.0.0.0:8080` on startup

**Build-time code generation** (`build.rs`):
- Uses the `built` crate to generate build metadata at compile time
- Generates `built.rs` file in `OUT_DIR` containing git version and other build info
- This metadata is included via the `built_info` module in `main.rs`

## Key Dependencies

- **axum** (0.8.6): Web framework for routing and serving HTTP
- **tokio** (1.48.0): Async runtime with multi-threaded support
- **built** (0.8.0): Build-time information generator with git2 support
