.386P
.model flat
extern _ExitProcess@4:near
extern _WriteConsoleA@20:near

.data

prev	dword	1
curr	dword	1
next	dword	0
n		dword	?
i		byte	3

.code
main PROC near
_main:
	mov		n, 5
	mov		eax, n

	mov		ebx, prev
	mov		ecx, curr
	; mov		eax, next

	mov		eax, next
	add		eax, prev
	mov		next, eax
	mov		prev, ecx
	mov		curr, eax

	jnz		_main

	push	0
	call	_ExitProcess@4

main ENDP
END