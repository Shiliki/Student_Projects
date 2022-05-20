.386P
.model flat

extern _ExitProcess@4:near
extern _GetStdHandle@4:near
extern _WriteConsoleA@20:near
extern _ExitProcess@4:near

extern _writeline:near

.data
prompt		byte	'abc', 10
msg			byte	'test', 10
handle		dword	?
written		dword	?

.code
main PROC near
_main:
	;mov		bh, [prompt]
	;mov		ecx, 4
	;call	_writeline

	mov		msg, bh
	;mov		numchars, ecx
	push	-11
	call	_GetStdHandle@4
	mov			handle, eax

	; WriteConsole(handle, &msg[0], 13, &written, 0)
	push	0
	push	offset written
	push	13
	push	offset msg
	push	handle
	call	_WriteConsoleA@20
	push	0
	call	_ExitProcess@4

main ENDP

END