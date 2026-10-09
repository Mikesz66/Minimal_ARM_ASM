ASM := arm-none-eabi-as
LINKER := arm-none-eabi-ld
GDB := arm-none-eabi-gdb
OPENOCD := openocd

TARGET  ?= main.elf
CPU	?= cortex-m0plus
OCD_MCU	?= stm32g0x.cfg
OCD_INTERFACE ?= stlink.cfg
LINK_SCRIPT ?= link.ld

ASMFLAGS := -mcpu=$(CPU) -mthumb
LDFLAGS  := -T$(LINK_SCRIPT) -nostdlib
OPENOCD_FLAGS := -f interface/$(OCD_INTERFACE) -f target/$(OCD_MCU)
OPENOCD_UPLOAD := -c "program $(TARGET) verify reset exit"

SRCS := $(wildcard *.s)
OBJS := $(patsubst %.s,build/%.o,$(SRCS))

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LINKER) $(LDFLAGS) $^ -o $@

build/%.o: %.s
	@mkdir -p $(@D)

	$(ASM) $(ASMFLAGS) $< -o $@

upload: $(TARGET)
	$(OPENOCD) $(OPENOCD_FLAGS) $(OPENOCD_UPLOAD)

debug: upload
	$(OPENOCD) $(OPENOCD_FLAGS)
