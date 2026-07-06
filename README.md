# Alpine Linux aarch64 QEMU 虚拟机

使用 QEMU 运行 Alpine Linux aarch64 虚拟机，支持 EFI 启动和 VirtIO 网络。

## 环境要求

- QEMU（支持 aarch64 架构）
- `qemu-efi-aarch64`（提供 EFI 固件）
- `curl`

## 快速开始

### 1. 安装

下载 Alpine ISO 镜像并创建虚拟磁盘，然后启动安装向导：

```bash
chmod +x install.sh
./install.sh
```

### 2. 运行

安装完成后，使用以下命令启动虚拟机：

```bash
chmod +x run.sh
./run.sh
```

## 虚拟机配置

| 参数 | 值 |
|------|-----|
| 架构 | aarch64 |
| CPU | 2 核（cpu max） |
| 内存 | 2 GB |
| 磁盘 | 20 GB qcow2（VirtIO） |
| 网络 | VirtIO + 用户模式网络 |
| SSH 端口转发 | 宿主机 2222 → 虚拟机 22 |

## SSH 连接

运行虚拟机后，可通过以下命令连接：

```bash
ssh -p 2222 root@localhost
```

## 文件说明

- `install.sh` — 下载 Alpine ISO、创建磁盘并启动安装
- `run.sh` — 启动已安装的虚拟机（含 SSH 端口转发）
- `alpine-virt-3.24.1-aarch64.iso` — Alpine Linux 安装镜像
- `alpine.qcow2` — 虚拟磁盘文件
