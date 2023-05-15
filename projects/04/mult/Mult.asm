// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

  // Initialize required variables (i: counter, mul: multiplication result)
@mul
M=0

@i
M=0

  // Our ALU does not provide the multiplication operation
  // so we need to add R0 R1 times
(LOOP)
  // if ( i >= R1 ) break;
  @i
  D=M
  @R1
  D=D-M
  @STOP
  D;JGE

  @i
  M=M+1

  @R0
  D=M
  @mul
  M=M+D

  @LOOP
  0;JMP

  // Stop the loop after R1 iterations, then perform R2 = mul
(STOP)
  @mul
  D=M
  @R2
  M=D

  // Infinite loop to end the program
(END)
  @END
  0;JMP