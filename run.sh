#!/bin/bash

EFI_PATH="/usr/share/qemu-efi-aarch64/QEMU_EFI.fd"

qemu-system-aarch64 \
  -M virt \
  -cpu max \
  -smp 2 \
  -m 2G \
  -bios "$EFI_PATH" \
  -drive file=alpine.qcow2,if=virtio,format=qcow2 \
  -net nic,model=virtio \
  -net user,hostfwd=tcp::2222-:22 \
  -nographic
