#!/bin/bash

mkdir -p {.,b,proc}/src
touch {.,b,proc}/src/lib.rs

cat > Cargo.toml << END
[package]
name = "a"
version = "0.1.0"
edition = "2024"

[dependencies]
b = { path = "b" }
proc = { path = "proc" }
END

cat > b/Cargo.toml << END
[package]
name = "b"
version = "0.1.0"
edition = "2024"
END

cat > proc/Cargo.toml << END
[package]
name = "proc"
version = "0.1.0"
edition = "2024"

[lib]
proc-macro = true

[dependencies]
b = { path = "../b" }
END

cargo +nightly check -v -p a
