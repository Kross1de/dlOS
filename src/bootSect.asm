;;; 
;;; Simple Boot Sector that prints characters using BIOS int 0x10/ AH 0x0e and labels/loop
;;;
	org 0x7c00		; 'origin' of Boot code; helps make sure addresses don't change

	mov ah, 0x0e		; int 10/ ah 0x0e BIOS teletype output
	mov bx, testString	; moving memory address at testString into BX register

	jmp print_string

print_string:
	mov al, [bx]		; move character value at address in bx into al
	cmp al, 0
	je end_pgm		; jump if equal (al == 0)
	int 0x10		; print character in al
	add bx, 1 		; move 1 byte forward/ get next character
	jmp print_string 	; loop
	
	;; Variables
testString:	db 'TEST', 0 	; 0/null to null terminate

end_pgm:	
	jmp $			; keep jumping to here; neverending loop

	;; Boot sector magic
	times 510-($-$$) db 0	; pads out 0s until we reach 510th byte

	dw 0xaa55		; BIOS magic number in 511th and 512th bytes
