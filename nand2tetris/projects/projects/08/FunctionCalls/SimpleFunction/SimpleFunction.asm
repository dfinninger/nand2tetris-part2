// Sun Sep 27 15:16:17 PDT 2020
// == Function(SimpleFunction.test,2) ==
(SimpleFunction.test)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Push(local,0) ==
@LCL // accessing memory segment
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(local,1) ==
@LCL // accessing memory segment
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// == Arithmetic(not) ==
@SP
M=M-1
@SP
A=M
M=!M
@SP
M=M+1
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
