# RISC-V simple mru program
# заполнить буффер 1, 2, 3, 4, 5, 6, 7, 8
# добавить 9(должно заменить 8), 2(должно обновить последний элемент), 10(должно заменить два)
# Yunusov Roman, 2020
#
# sra rd rs1 rs2
#
.macro push %s
    sw zero, 0(%s)
.end_macro

.macro pop %d
    sra %d, zero, zero
.end_macro

            .text

start:      mv a1, zero              # a1 = 0
mru:        addi a1, a1, 1           # a1 = 1
            push a1
            addi a1, a1, 1           # a1 = 2
            push a1
            addi a1, a1, 1           # a1 = 3
            push a1
            addi a1, a1, 1           # a1 = 4
            push a1
            addi a1, a1, 1           # a1 = 5
            push a1
            addi a1, a1, 1           # a1 = 6
            push a1
            addi a1, a1, 1           # a1 = 7
            push a1
            addi a1, a1, 1           # a1 = 8
            push a1
            mv a2, zero
            mv a3, zero
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 1
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 2
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 3
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 4
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 5
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 6
            sra a3, a2, a2
            addi a2, a2, 1           # a2 = 7
            sra a3, a2, a2
            addi a1, a1, 1           # a1 = 9
            push a1
            sra a3, a2, a2
            mv a1, zero
            mv a2, zero
            addi a1, a1, 2               # a1 = 2, хотим его загрузить = обновить most recently used
            addi a2, a2, 1               # a2 = 1, оттуда потом считаем
            push a1
            addi a1, a1, 9              # a1 = 11, хотим его загрузить
            push a1
            sra a3, a2, a2
