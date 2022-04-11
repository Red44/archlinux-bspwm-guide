#!/bin/bash
sudo pacman -Syu
yay -S java8-openjfx javafx-scenebuilder anydesk-bin arduino-pinoccio insomnia-bin jetbrains-toolbox python-injector python-node-semver python-patch-ng python-pluginbase python-py3nvml python-pynput termius
sudo pacman -Sy android-file-transfer clang cmake docker easy-rsa github-cli hdparm java-openjfx java11-openjfx jdk-openjdk jdk8-openjdk npm opencv python-pip rust-analyzer rustup virtualbox virtualbox-host-modules-arch visual-studio-code-bin w3m
rustup default stable
rustup toolchain install beta nightly stable-gnu x86_64-pc-windows-gnu i686-pc-windows-msvc
sudo npm install -g yarn
