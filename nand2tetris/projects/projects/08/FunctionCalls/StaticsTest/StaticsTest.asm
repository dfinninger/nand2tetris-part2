
// initialize
@256
D=A
@SP
M=D



@Class1.Class1.get$1
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

(Class1.Class1.get$1)

// end initialization

// Sun Oct 04 12:01:29 PDT 2020
// == Function(Class1.set,0) ==
(Class1.set)
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
// == Pop(static,0) ==
@SP
M=M-1
@SP
A=M
D=M
@Class1.0
M=D
// == Push(argument,1) ==
@ARG // accessing memory segment
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Pop(static,1) ==
@SP
M=M-1
@SP
A=M
D=M
@Class1.1
M=D
// == Push(constant,0) ==
@0
D=A
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
// == Function(Class1.get,0) ==
(Class1.get)
// == Push(static,0) ==
@Class1.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(static,1) ==
@Class1.1
D=M
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

// == Function(Sys.init,0) ==
(Sys.init)
// == Push(constant,6) ==
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Push(constant,8) ==
@8
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Call(Class1.set,2) ==
@Sys.Sys.init$1
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
@2
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
@Class1.set
0;JMP
(Sys.Sys.init$1)
// == Pop(temp,0) ==
@5 // accessing memory segment
D=A
@0
A=D+A
D=A
@R13 // store computed address
M=D  // in REG_13
@SP
M=M-1
@SP
A=M
D=M
@R13 // store D into
A=M  // address saved in
M=D  // REG_13
// == Push(constant,23) ==
@23
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Push(constant,15) ==
@15
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Call(Class2.set,2) ==
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
@2
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
@Class2.set
0;JMP
(Sys.Sys.init$2)
// == Pop(temp,0) ==
@5 // accessing memory segment
D=A
@0
A=D+A
D=A
@R13 // store computed address
M=D  // in REG_13
@SP
M=M-1
@SP
A=M
D=M
@R13 // store D into
A=M  // address saved in
M=D  // REG_13
// == Call(Class1.get,0) ==
@Sys.Sys.init$3
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
@Class1.get
0;JMP
(Sys.Sys.init$3)
// == Call(Class2.get,0) ==
@Sys.Sys.init$4
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
@Class2.get
0;JMP
(Sys.Sys.init$4)
// == Label(WHILE) ==
(Sys.Sys.init$WHILE)
// == Goto(WHILE) ==
@Sys.Sys.init$WHILE
0;JMP

// == Function(Class2.set,0) ==
(Class2.set)
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
// == Pop(static,0) ==
@SP
M=M-1
@SP
A=M
D=M
@Class2.0
M=D
// == Push(argument,1) ==
@ARG // accessing memory segment
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Pop(static,1) ==
@SP
M=M-1
@SP
A=M
D=M
@Class2.1
M=D
// == Push(constant,0) ==
@0
D=A
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
// == Function(Class2.get,0) ==
(Class2.get)
// == Push(static,0) ==
@Class2.0
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(static,1) ==
@Class2.1
D=M
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
