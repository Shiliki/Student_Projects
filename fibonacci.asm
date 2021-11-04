.386P
.model flat
extern _ExitProcess@4:near
extern _WriteConsoleA@20:near

.data

prev	dword	1
curr	dword	1
next	dword	0
n		dword	8
i		dword	3

.code
main PROC near
_main:
	mov		eax, n
	cmp		eax, i
	jz		_endloop

	mov		ebx, prev
	mov		edx, curr
	mov		ecx, next

	add		ecx, ebx
	mov		eax, ecx

	mov		next, ecx
	mov		prev, edx
	mov		curr, ecx

	inc		i
	jmp		_main
	
_endloop:
	push	0
	call	_ExitProcess@4
main ENDP
END