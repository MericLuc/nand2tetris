// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

  // Variables declaration
  @black
  M=-1

  @white
  M=0

  @curColor
  M=0

  @currentPxLoc
  M=0

  // Infinite loop waiting for keyboard events
(LOOP)
  @SCREEN
  D=A
  @currentPxLoc
  M=D

  @KBD
  D=M
  @KB_EVT_PRESSED
  D;JGT
  @KB_EVT_NONE
  D;JEQ

  // Get color to display
(KB_EVT_PRESSED)
  @black
  D=M
  @curColor
  M=D
  @DRAW
  0;JMP

  // Get color to display
(KB_EVT_NONE)
  @white
  D=M
  @curColor
  M=D
  @DRAW
  0;JMP

  // Paint screen depending on keyboard event
(DRAW)
  @curColor
  D=M

  @currentPxLoc
  A=M
  M=D

  @currentPxLoc
  M=M+1
  D=M

  @KBD
  D=A-D
  @DRAW
  D;JGT

  @LOOP
  0;JMP