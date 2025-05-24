# DlOS Information
An operating system maded for learn the OS stuff

# Current features
- Print to screen
- Basic bootloader
- Reading from disk
- "Hello World" kernel

# Build/run instruction
- To compile the boot sector use:
```sh
fasm bootSect.asm
fasm kernel.asm
cat bootSect.bin kernel.bin > OS.bin
```
- To run the operating system use (qemu example, you can use your vm):
```sh
qemu-system-i386 -fda OS.bin
```
