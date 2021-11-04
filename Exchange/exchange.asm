.386P
.model flat
extern _ExitProcess@4:near

.data

number1		word	10
number2		word	20
number3		word	30
number4		word	40

.code
main PROC near
_main:
	; Move variables into registers for xchg usage.
	mov		ax, number1
	mov		bx, number2
	mov		cx, number3
	mov		dx, number4

	; Exchange numbers 1 and 4.
	xchg	ax, dx
	mov		number1, ax
	mov		number4, dx

	; Exchange numbers 2 and 3.
	xchg	bx, cx
	mov		number2, bx
	mov		number3, cx

	push	0
	call	_ExitProcess@4

main ENDP
END