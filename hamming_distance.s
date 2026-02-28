
.section .text
.globl get_hamming_distance

get_hamming_distance:
    # %rdi string 1 add
    # %rsi string 2 add
    # %rdx comparison length

    # %rax store the total Hamming distance
    xorq %rax, %rax        
    # %rcx is our loop index (i = 0)
    xorq %rcx, %rcx         

 # If index = length, done
loop_start:
    cmpq %rdx, %rcx        
    je done

    # Loads one byte from each string with indexed addressing
    movb (%rdi, %rcx), %r8b 
    movb (%rsi, %rcx), %r9b 
    
    # bits that differ become 1
    xorb %r8b, %r9b         

bit_count_loop:

    # Check if any differing bits remain in this byte
    testb %r9b, %r9b       
    # If 0, move to the next character
    jz next_char            
    
     # Shift right; the least significant bit into carry flag
    shrb $1, %r9b          
    # If carry flag is 0, distance stays
    jnc bit_count_loop      
    
    # Bit was 1, increment Hamming distance
    incq %rax               
    jmp bit_count_loop

#  Next character index
next_char:
    incq %rcx               
    jmp loop_start

# Return %rax value to C wrapper
done:
    ret                     

.section .note.GNU-stack,"",@progbits
