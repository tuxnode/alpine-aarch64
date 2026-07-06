#!/bin/bash

URL="https://dl-cdn.alpinelinux.org/alpine/v3.24/releases/aarch64/alpine-virt-3.24.1-aarch64.iso"

if ! command -v curl &> /dev/null; then
    echo "Install curl first!!!"
    exit 1
fi

curl -L -C - --fail -o "$URL"

qemu-img create -f qcow2 alpine.qcow2 20G

EFI_PATH="/usr/share/qemu-efi-aarch64/QEMU_EFI.fd"

qemu-system-aarch64 \
  -M virt \
  -cpu max \
  -smp 2 \
  -m 2G \
  -bios "$EFI_PATH" \
  -drive file=alpine.qcow2,if=virtio,format=qcow2 \
  -cdrom alpine-virt-3.24.1-aarch64.iso \
  -net nic,model=virtio \
  -net user \
  -nographic
