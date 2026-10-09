ENTRY(Reset_Handler)

MEMORY
{
	FLASH (rx)	: ORIGIN = 0x08000000, LENGTH = 128K
	RAM   (rwx)	: ORIGIN = 0x20000000, LENGTH = 36K
}

_estack = ORIGIN(RAM) + LENGTH(RAM);

SECTIONS
{
	.isr_vectors :
	{
		KEEP(*(.isr_vectors))
	} > FLASH

	.text :
	{
		*(.text*)
	} > FLASH
}
