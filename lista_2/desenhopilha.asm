	
#  ----
#  |  |
#  ----
#  |a0|
#  ----
#  |ra| <---- sp
#  ----
#


# empilahar
addi sp, sp, -8
sw ra, 0(sp)
sw a0, 4(sp)

# desempilhar
lw ra, 0(sp)
lw a0, 4(sp)
addi sp, sp, 8