// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

@i 
M=0     // we'll track how many times we've looped r1 w/ i
@R2
M=0     // 0 out product

@R0
D=M
@END
D;JEQ   // r0 * 0 error, prod already 0, exit
@R1
D=M
@END
D;JEQ   // r1 * 0 error, prod already 0, exit

(LOOP)
    @i
    D=M 
    @R1
    D=D-M 
    @END
    D;JEQ // if i-r1 = 0 go to END
    @R0
    D=M   // D = R0
    @R2
    M=D+M // R2 = D+D
    @i 
    M=M+1
    @LOOP
    0;JMP // GOTO LOOP 
(END)
    @END
    0;JMP // infin
