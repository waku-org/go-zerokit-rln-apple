#!/bin/bash

export RUSTFLAGS="-Ccodegen-units=1"

rustup default stable

cargo install cross --git https://github.com/cross-rs/cross --branch main

pushd zerokit/rln

cargo clean

cargo install cargo-lipo
rustup target add aarch64-apple-ios x86_64-apple-ios x86_64-apple-darwin aarch64-apple-darwin
cargo build --release --target=x86_64-apple-darwin --lib
cargo build --release --target=aarch64-apple-darwin --lib
#cargo build --release --target=x86_64-apple-ios --lib
#cargo build --release --target=aarch64-apple-ios --lib
cargo lipo --release

popd

DIRECTORY=./libs
TOOLS_DIR=`dirname $0`
COMPILE_DIR=${TOOLS_DIR}/../zerokit/target
rm -rf $COMPILE_DIR/x86_64-apple-ios $COMPILE_DIR/aarch64-apple-ios
for platform in `ls ${COMPILE_DIR} | grep -v release | grep -v debug | grep -v CACHEDIR.TAG`
do
  PLATFORM_DIR=${DIRECTORY}/$platform
  mkdir -p ${PLATFORM_DIR}
  cp ${COMPILE_DIR}/$platform/release/librln.a ${PLATFORM_DIR}
done
