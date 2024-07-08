# RISC-V simple mru program
#
# Yunusov Roman, 2020
#
# sra rd rs1 rs2
#
.macro push %s
    sw zero, 0(%s)
.end_macro

/*.macro pop %d
    sra %d, zero, zero
.end_macro*/

            .text

start:      mv a1, zero              # a0 = 0
mru:        addi a1, a1, 1           # a0 = 1
            push a1
            addi a1, a1, 1              # a0 = 2
            mv a2, zero
            mv a3, zero
            mv a0, zero
            sra a3, a2, a2
