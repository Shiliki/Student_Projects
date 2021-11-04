.386P
.model flat
extern _ExitProcess@4:near
extern _WriteConsoleA@20:near

.data

prev	dword	1
curr	dword	1
next	dword	0

; Assigning a random value for n for testing purposes.
; In a normal function call, this would be an unassigned value.
n		dword	10
i		dword	3

.code
main PROC near
_main:
	mov		eax, n

_loop:
	; Save prev and curr
	mov		ebx, prev
	mov		ecx, curr

	; Add prev and curr, save to next (next = prev + curr)
	mov		edx, ebx
	add		edx, ecx
	mov		next, edx

	; prev = curr, curr = next
	mov		prev, ecx
	mov		curr, edx

	inc		i
	cmp		eax, i
	jnz		_loop
	; End loop

	mov		eax, next
	push	0
	call	_ExitProcess@4

main ENDP
END