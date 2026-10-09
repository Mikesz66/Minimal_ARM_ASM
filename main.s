.syntax unified
.thumb

.global Reset_Handler

.section .isr_vectors, "a", %progbits
.word _estack
.word Reset_Handler

.section .text, "ax", %progbits
.thumb_func
Reset_Handler:
	movs	r0, #1
	movs	r1, #0
	movs	r2, #0
loop:
	adds	r2, r0, r1
	mov	r0, r1
	mov 	r1, r2
	b loop
