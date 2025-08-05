#!/bin/bash
# OFFICAL APT-SWARM BUILD SCRIPT
# MAINTAINER: Nagol12344 
# THIS SCRIPT IS MADE FOR GITHUB ACTIONS, IT DOESNT CARE ABOUT YOUR SYSTEM AND WILL JUST INSTAL PACKAGES 
# YOU HAVE BEEN WARNED

sudo apt-get update
sudo apt-get install -y libwebkit2gtk-4.1-dev build-essential curl wget file libxdo-dev libssl-dev libayatana-appindicator3-dev librsvg2-dev

cd build

cargo install tauri-cli --version "^2.0.0" --locked
cargo tauri build

mkdir -p ../built
cp -r src-tauri/target/release/bundle/deb/*.deb ../built/

echo "version=$(cat src-tauri/tauri.conf.json | grep "version" | sed -n 's/.*"version": *"\([^"]*\)".*/\1/p')" >> $GITHUB_ENV