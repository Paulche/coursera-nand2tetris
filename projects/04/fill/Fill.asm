// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

// Load constants
// Last address
@24575
D = A
@last_address
M = D

// Screen state, 0 - filled with white pixels or with black otherwise.
@state
M = 0

(MAIN_LOOP)
  // Pseudo code: 
  // if (key is pressed)
  //   if (state is 0) 
  //     jump GET_BLACK
  //   end
  // else 
  //   if (state is 1)
  //     jump GET_WHITE 
  //   end
  // end
  //
  
  // Probe keyboard
  @KBD
  D = M

  @IF_TRUE
  D; JNE

  @IF_FALSE
  0; JMP

  (IF_TRUE)
    @state
    D = M

    @GET_BLACK
    D; JEQ

    @MAIN_LOOP
    0; JMP
   
  (IF_FALSE)
    @state
    D = M

    @GET_WHITE
    D; JNE

    @MAIN_LOOP
    0; JMP

(GET_BLACK)
  //Load variables
  @SCREEN
  D = A
  @address
  M = D

  // assert state variable
  @state
  M  = 1

  (LOOP0)
    // Fill next 16 pixels
    @address
    A = M
    M = -1

    @address
    M = M+1

    D = M

    @last_address
    D = D - M

    @LOOP0
    D; JLE

  @MAIN_LOOP
  0; JMP

(GET_WHITE)
  //Load variables
  @SCREEN
  D = A
  @address
  M = D

  // assert state variable
  @state
  M  = 0

  (LOOP1)
    // Fill next 16 pixels
    @address
    A = M
    M = 0

    @address
    M = M+1

    D = M

    @last_address
    D = D - M

    @LOOP1
    D; JLE

  @MAIN_LOOP
  0; JMP
