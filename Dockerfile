# Build stage
FROM rust:1.91 AS builder

WORKDIR /build

# Add musl target
RUN rustup target add x86_64-unknown-linux-musl

# Copy manifests
COPY Cargo.toml Cargo.lock ./

# Copy git directory for version information
COPY .git ./.git

# Copy source code and build script
COPY src ./src
COPY build.rs ./

# Build for musl
RUN cargo build --release --target x86_64-unknown-linux-musl

# Runtime stage
FROM alpine:latest

# Copy the binary from builder
COPY --from=builder /build/target/x86_64-unknown-linux-musl/release/helloweb /opt/helloweb

# Expose the port the app runs on
EXPOSE 8080

# Run the binary
CMD ["/opt/helloweb"]

LABEL org.opencontainers.image.source=https://github.com/milessabin/helloweb-rust
LABEL org.opencontainers.image.description="HelloWeb Rust Server Image"
