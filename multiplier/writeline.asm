.386P
.model flat

extern _WriteConsoleA@20:near
extern _GetStdHandle@4:near

.data
handle		dword	?
written		dword	?
msg			byte	'abc'
numchars	dword	4

.code

; Precond:
; bh = message to be printed
; ecx = number of bytes in message

_writeline PROC near
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
	
	pop		eax
	ret

_writeline ENDP
END