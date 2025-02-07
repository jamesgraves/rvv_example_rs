# copy bytes from source to destination
# arguments:
# a0 = destination buffer
# a1 = source buffer
# a2 = number of bytes to copy
memcpy:
	mv          a3, a0                   # Copy destination
loop:
	vsetvli     t0, a2, e8, m8, ta, ma   # Vectors of 8b
	vle8.v      v0, (a1)                 # Load bytes
	add         a1, a1, t0               # Bump pointer
	sub         a2, a2, t0               # Decrement count
	vse8.v      v0, (a3)                 # Store bytes
	add         a3, a3, t0               # Bump pointer
	bnez        a2, loop                 # Any more?
	ret                                  # Return
