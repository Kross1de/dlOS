;;; 
;;; Simple Boot Sector that prints a character using BIOS int 0x10/ AH 0x0e
;;;
	
	mov ax, 0x0e54		; prints a 'T'?
	int 0x10		; BIOS video interrupts

here:
	jmp here		; jump repeatedly to label 'here'; neverending
	
	times 510-($-$$) db 0	; pads out 0s until we reach 510th byte

	dw 0xaa55		; BIOS magic number; BOOT magic number
