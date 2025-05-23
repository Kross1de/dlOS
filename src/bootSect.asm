;;; 
;;; Simple Boot Sector that prints a character using BIOS int 0x10/ AH 0x0e
;;;
	org 0x7c00		; 'origin' of Boot code; helps make sure addresses don't change

	mov ah, 0x0e		; int 10/ ah 0x0e BIOS teletype output
	mov al, [testString] 	; character we want to print; memory at address testString
	int 0x10		; BIOS video interrupts



testString:	db 'T', 0 	; 0/null to null terminate

	jmp $			; keep jumping to here; neverending loop
	
	times 510-($-$$) db 0	; pads out 0s until we reach 510th byte

	dw 0xaa55		; BIOS magic number; BOOT magic number
