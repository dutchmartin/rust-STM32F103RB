#!/bin/sh
name=$(awk -F'[ ="]+' '$1 == "name" { print $2 }' Cargo.toml)
cargo build --release && openocd -f openocd.cfg -c "program ./target/thumbv7m-none-eabi/release/$name verify reset exit"