;;; 
;;; Simple Boot Sector that prints a character using BIOS int 0x10/ AH 0x0e
;;;
	org 0x7c00		; 'origin' of Boot code; helps make sure addresses don't change

	mov ah, 0x0e		; int 10/ ah 0x0e BIOS teletype output
	mov bx, testString	; moving memory address at testString into BX register
	mov al, [bx]	 	; character we want to print; memory at address bx
	int 0x10		; BIOS video interrupts
	
	mov al, [bx+1]		; add 1 byte offset to bx address, move into al; 'E'
	int 0x10
	add bx, 2		; adds 1 byte/moves forward 1 byte at address bx
	mov al, [bx]		; 'S'
	int 0x10
	mov al, [bx+1]		; add 1 byte offset to bx address, mov into al; 'T'
	int 0x10

testString:	db 'TEST', 0 	; 0/null to null terminate

	jmp $			; keep jumping to here; neverending loop
	
	times 510-($-$$) db 0	; pads out 0s until we reach 510th byte

	dw 0xaa55		; BIOS magic number in 511th and 512th bytes
