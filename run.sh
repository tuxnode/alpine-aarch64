#!/bin/bash

EFI_PATH="/usr/share/qemu-efi-aarch64/QEMU_EFI.fd"
LOG_FILE="$(dirname "$0")/qemu.log"

nohup qemu-system-aarch64 \
  -M virt \
  -cpu max \
  -smp 2 \
  -m 2G \
  -bios "$EFI_PATH" \
  -drive file=alpine.qcow2,if=virtio,format=qcow2 \
  -net nic,model=virtio \
  -net user,hostfwd=tcp::2222-:22 \
  -nographic \
  -serial file:"$LOG_FILE" \
  -monitor none \
  > /dev/null 2>&1 &

echo "QEMU started, PID: $!"
echo "Serial log: $LOG_FILE"
