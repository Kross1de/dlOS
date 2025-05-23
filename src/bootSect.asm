;;; 
;;; Simple Boot Sector that prints a character using BIOS int 0x10/ AH 0x0e
;;;

	mov ah, 0x0e		; int 10/ ah 0x0e BIOS teletype output
	mov al, 'T'		; character we want to print
	int 0x10		; BIOS video interrupts

	mov al, 'E'
	int 0x10
	mov al, 'S'
	int 0x10
	mov al, 'T'
	int 0x10

here:
	jmp here		; jump repeatedly to label 'here'; neverending
	
	times 510-($-$$) db 0	; pads out 0s until we reach 510th byte

	dw 0xaa55		; BIOS magic number; BOOT magic number
