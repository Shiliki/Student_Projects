.386P
.model flat

extern _WriteConsoleA@20:near
extern _ExitProcess@4:near
extern _GetStdHandle@4:near

.data
handle	dword	?
written	dword	?
msg		dword	?

.code

; Precond:
; ebx = message to be printed
; ecx = number of bytes in message

_writeline PROC near
	mov		msg, ebx
	push	-11
	call	_GetStdHandle@4
	mov		handle, eax

	push	0
	push	offset written
	push	15
	push	offset msg
	push	handle
	call	_WriteConsoleA@20

	push	0
	call	_ExitProcess@4

_writeline ENDP
END