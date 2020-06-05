#!/bin/sh
name=$(awk -F'[ ="]+' '$1 == "name" { print $2 }' Cargo.toml)
cargo build && openocd -f openocd.cfg -c "program ./target/thumbv7m-none-eabi/debug/$name verify reset exit"