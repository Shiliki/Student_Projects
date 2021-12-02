.386P
.model flat

include 'writeline.asm'

extern _ExitProcess@4:near
extern _GetStdHandle@4:near
extern _WriteConsoleA@20:near
extern _ExitProcess@4:near

extern _writeline

.data
ent		byte	'Enter a number:', 10
;dp		byte	'Hello World!', 10
handle	dword	?
written	dword	?

.code
main PROC near
_main:
	;push	-11
	;call	_GetStdHandle@4
	;mov		handle, eax

	;push	0
	;push	offset written
	;push	15
	;push	offset ent
	;push	handle
	;call	_WriteConsoleA@20

	push	0
	call	_ExitProcess@4

main ENDP
END