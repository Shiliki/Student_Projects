.386P
.model flat
extern _ExitProcess@4:near

.data
	fahren		real8	30.0
	celsius		real8	?
	r8_mult		real8	0.555555555555555555556
	r8_sub		real8	32.0

.code
main PROC near
_main:
; C = (F - 32) x 5 / 9, F = C x 9 / 5 + 32
	push	ebp
	mov		ebp, esp
	
	fld		fahren
	fsub	r8_sub
	fmul	r8_mult

	fst		ebp
	
	push	0
	call	_ExitProcess@4

main ENDP
END