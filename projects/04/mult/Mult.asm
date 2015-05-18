// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// *** Pseudo code:
//    set R2 to 0
//    loop through R0 to 0 backward and add R1 to R2 each time 

// *** Example:
// 8 * 5 = 40;
// R1 | 5 | 4 | 3  | 2  | 1  | 0
// R2 | 0 | 8 | 16 | 24 | 32 | 40


// *** Machine code:

//set R2 to 0
@R2
M=0

// Check zero case for either R0 or R1 

//R0
@R0
D = M

@END
D; JEQ

//R1
@R1
D = M

@END
D; JEQ


(LOOP)
  // Decrement R1
  @R1
  M = M-1

  //set D to R0
  @R0
  D = M
 
  // Add R2 by R0
  @R2  
  M = M+D
  
  // Set D to R1 to check it 
  @R1
  D = M

  // Check loop condition
  @LOOP
  D; JGT

  // Exit
  @END
  0; JMP
  
(END)
  @END
  0; JMP

