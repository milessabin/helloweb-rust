# Format all Haskell source files
fmt:
    cargo fmt

# Check formatting (for CI)
fmt-check:
    cargo fmt -- --check

# Build the project
build:
    cargo build

# Run tests
test:
    cargo test

# Run application
run:
    cargo run

# Build docker image
build-docker:
    docker build --no-cache -t ghcr.io/milessabin/helloweb-rust:latest .

# Run dockerized
run-docker:
    docker run -p 8080:8080 ghcr.io/milessabin/helloweb-rust:latest

# Clean build artifacts
clean:
    cargo clean

# Full CI check (check formatting + build + test)
ci: fmt-check build test
