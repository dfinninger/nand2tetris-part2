// Sun Oct 04 11:37:52 PDT 2020

// initialize
@256
D=A
@SP
M=D



@Main.default$1
D=A

@SP
A=M

M=D

@SP
M=M+1



@LCL
D=M

@SP
A=M

M=D

@SP
M=M+1



@ARG
D=M

@SP
A=M

M=D

@SP
M=M+1



@THIS
D=M

@SP
A=M

M=D

@SP
M=M+1



@THAT
D=M

@SP
A=M

M=D

@SP
M=M+1



// ARG = SP-n-5
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D

// LCL = SP
@SP
D=M
@LCL
M=D

// goto f
@Sys.init
0;JMP

(Main.default$1)

// end initialization

// == Function(Main.fibonacci,0) ==
(Main.fibonacci)
// == Push(argument,0) ==
@ARG // accessing memory segment
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(constant,2) ==
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Arithmetic(lt) ==
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_2
D;JLT
@SP
A=M
M=0
@CMP_END_2
0;JMP
(CMP_TRUE_2)
@SP
A=M
M=-1
(CMP_END_2)
@SP
M=M+1
// == IfGoto(IF_TRUE) ==
@SP
M=M-1
@SP
A=M
D=M
@Main.Main.fibonacci$IF_TRUE
D;JNE
// == Goto(IF_FALSE) ==
@Main.Main.fibonacci$IF_FALSE
0;JMP
// == Label(IF_TRUE) ==
(Main.Main.fibonacci$IF_TRUE)
// == Push(argument,0) ==
@ARG // accessing memory segment
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Return() ==
// FRAME = LCL
@LCL
D=M
@R7
M=D
// RET = *(FRAME-5)
@5
A=D-A
D=M
@R14
M=D
// *ARG = pop()
// pop stack into D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// SP = ARG+1
@ARG
D=M
@SP
M=D+1
// THAT = *(FRAME-1)
@R7
D=M
@1
A=D-A // subtract offset
D=M   // load pointer value into D
@THAT
M=D
// THIS = *(FRAME-2)
@R7
D=M
@2
A=D-A // subtract offset
D=M   // load pointer value into D
@THIS
M=D
// ARG = *(FRAME-3)
@R7
D=M
@3
A=D-A // subtract offset
D=M   // load pointer value into D
@ARG
M=D
// LCL = *(FRAME-4)
@R7
D=M
@4
A=D-A // subtract offset
D=M   // load pointer value into D
@LCL
M=D
// goto RET
@R14
A=M
0;JMP
// == Label(IF_FALSE) ==
(Main.Main.fibonacci$IF_FALSE)
// == Push(argument,0) ==
@ARG // accessing memory segment
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(constant,2) ==
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Arithmetic(sub) ==
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// == Call(Main.fibonacci,1) ==
@Main.Main.fibonacci$3
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto f
@Main.fibonacci
0;JMP
(Main.Main.fibonacci$3)
// == Push(argument,0) ==
@ARG // accessing memory segment
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(constant,1) ==
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Arithmetic(sub) ==
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M-D
@SP
M=M+1
// == Call(Main.fibonacci,1) ==
@Main.Main.fibonacci$4
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto f
@Main.fibonacci
0;JMP
(Main.Main.fibonacci$4)
// == Arithmetic(add) ==
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M+D
@SP
M=M+1
// == Return() ==
// FRAME = LCL
@LCL
D=M
@R7
M=D
// RET = *(FRAME-5)
@5
A=D-A
D=M
@R14
M=D
// *ARG = pop()
// pop stack into D
@SP
M=M-1
A=M
D=M
@ARG
A=M
M=D
// SP = ARG+1
@ARG
D=M
@SP
M=D+1
// THAT = *(FRAME-1)
@R7
D=M
@1
A=D-A // subtract offset
D=M   // load pointer value into D
@THAT
M=D
// THIS = *(FRAME-2)
@R7
D=M
@2
A=D-A // subtract offset
D=M   // load pointer value into D
@THIS
M=D
// ARG = *(FRAME-3)
@R7
D=M
@3
A=D-A // subtract offset
D=M   // load pointer value into D
@ARG
M=D
// LCL = *(FRAME-4)
@R7
D=M
@4
A=D-A // subtract offset
D=M   // load pointer value into D
@LCL
M=D
// goto RET
@R14
A=M
0;JMP


// initialize
@256
D=A
@SP
M=D



@Sys.default$1
D=A

@SP
A=M

M=D

@SP
M=M+1



@LCL
D=M

@SP
A=M

M=D

@SP
M=M+1



@ARG
D=M

@SP
A=M

M=D

@SP
M=M+1



@THIS
D=M

@SP
A=M

M=D

@SP
M=M+1



@THAT
D=M

@SP
A=M

M=D

@SP
M=M+1



// ARG = SP-n-5
@SP
D=M
@0
D=D-A
@5
D=D-A
@ARG
M=D

// LCL = SP
@SP
D=M
@LCL
M=D

// goto f
@Sys.init
0;JMP

(Sys.default$1)

// end initialization

// == Function(Sys.init,0) ==
(Sys.init)
// == Push(constant,4) ==
@4
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Call(Main.fibonacci,1) ==
@Sys.Sys.init$2
D=A
@SP
A=M
M=D
@SP
M=M+1
@LCL
D=M
@SP
A=M
M=D
@SP
M=M+1
@ARG
D=M
@SP
A=M
M=D
@SP
M=M+1
@THIS
D=M
@SP
A=M
M=D
@SP
M=M+1
@THAT
D=M
@SP
A=M
M=D
@SP
M=M+1
// ARG = SP-n-5
@SP
D=M
@1
D=D-A
@5
D=D-A
@ARG
M=D
// LCL = SP
@SP
D=M
@LCL
M=D
// goto f
@Main.fibonacci
0;JMP
(Sys.Sys.init$2)
// == Label(WHILE) ==
(Sys.Sys.init$WHILE)
// == Goto(WHILE) ==
@Sys.Sys.init$WHILE
0;JMP
