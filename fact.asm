	# int fact(int x)

	.align
fact:    addi    r7  r7 $-4      # allocate stack space
	addi    r2  r0 $4       # index from sp to return address field
	sw      r1  r7 r2       # save return address

	addi    r2  r0 $8       # index from sp to x, r2 = 0 + 8 = 8
	lw      r3  r7 r2       # r3 = x, load into r3 the value of sp + 8


	addi	r5  r0 $0		#r5 = 0
	addi	r6	r0 $1		#r6 = 1, this is tentative answer
	cmp		r0	r3 r5		#see if x = 0
	be		:done			#branch if we're finished	

	addi	r3	r3 $-1		#r3 = x - 1


#pasted from main.asm

	addi    r7  r7 $-4      # allocate space for return val and 1 arg
	addi    r2  r0 $4       # index from sp to 1st arg, r2 = 0 + 4 = 4
	sw      r3  r7 r2       # store in stack frame/pass the parameter 
							# store the value of r3 in r7(sp) + r2


	call    r1  fact         # call fact


	# note: at this point we have no idea what's in any register
	#       (except r0 and r7)
	addi    r2  r0 $4       # index from sp to return value
	lw      r3  r7 r2       # fetch return value into r3
	addi    r7  r7 $4       # restore stack pointer

#ended paste main.asm

	#r3 contains (x - 1)! 

	addi    r2  r0 $8       # index from sp to x, r2 = 0 + 8 = 8
	lw      r5  r7 r2       # r5 = x, load into r5 the value of sp + 8
							

	mul		r6	r5	r3		#r6 : r5 = x, r3 = (x-1)!






done:
	addi    r4  r0 $8       # index from sp to fact
	sw      r6  r7 r4       # fact = x

	
	addi    r2  r0 $4       # index from sp to return address
	lw      r1  r7 r2       # fetch return address
	addi    r7  r7 $4       # restore stack pointer
	jr      r0  r0 r1       # return

	

