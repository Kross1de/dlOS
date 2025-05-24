;;; 
;;; Simple Boot Sector that prints characters using BIOS interrupts
;;;
	org 0x7c00		; 'origin' of Boot code; helps make sure addresses don't changei

	;; Set video mode
	mov ah, 0x00		; int 0x10 ah 0x00 = set video mode
	mov al, 0x01		; 40x25 text mode
	int 0x10

	;; Change color/Palette
	mov ah, 0x0B
	mov bh, 0x00
	mov bl, 0x01
	int 0x10

	;; Tele-type output
	mov ah, 0x0e		; int 10/ ah 0x0e BIOS teletype output
	
	mov bx, testString	; moving memory address at testString into BX register
	call print_string
	
	mov bx, string2
	call print_string

	mov dx, 0x12AB
	call print_hex

	;; End pgm
	jmp $			; keep jumping to here; neverending loop
	
	;; Included files
	include 'printStr.asm'
	include 'printHex.asm'
	
	;; Variables
testString:	db 'Char test: Testing', 0xA, 0xD, 0 	; 0/null to null terminate
string2:	db 'Hex test: ', 0

	;; Boot sector magic
	times 510-($-$$) db 0	; pads out 0s until we reach 510th byte

	dw 0xaa55		; BIOS magic number in 511th and 512th bytes
