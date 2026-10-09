# Minimal_ARM_ASM

Minimal project made for faster start with my new experiments on ARM Cortex-M microcontrollers boards.

## Dependencies

- `arm-none-eabi-gcc` (toolchain)
- `arm-none-eabi-gdb` 
- `openocd`
- `make`

On arch linux: `sudo pacman -S arm-none-eabi-gcc arm-none-eabi-gdb openocd base-devel`

## Build

```bash
make            # compilation
make upload     # upload with openocd
make debug      # upload and open port localhost:3333 for gdb
```

Additional make options:

```bash
TARGET=your_target_file_name    # e.g. blink.elf
CPU=your_cpu                    # e.g. cortex-m0plus
OCD_MCU=openocd_target_cfg      # e.g. stm32g0x.cfg
OCD_INTERFACE=your_debugger     # e.g. stlink.cfg
LINK_SCRIPT=your_linker_script  # e.g. linker.ld
```

## Made for NUCLEO-G071RB board, but with adjusted MEMORY part of the link.ld file and make options should work with any ARM Cortex-M board.
