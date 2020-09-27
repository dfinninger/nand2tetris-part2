// Push(argument,1)
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
// Pop(pointer,1)
@3 // accessing memory segment
D=A
@1
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
// Push(constant,0)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(that,0)
@THAT // accessing memory segment
D=M
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
// Push(constant,1)
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(that,1)
@THAT // accessing memory segment
D=M
@1
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
// Push(argument,0)
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
// Push(constant,2)
@2
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(sub)
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
// Pop(argument,0)
@ARG // accessing memory segment
D=M
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
// Label(MAIN_LOOP_START)
(default.default$MAIN_LOOP_START)
// Push(argument,0)
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
// IfGoto(COMPUTE_ELEMENT)
@SP
M=M-1
@SP
A=M
D=M
@default.default$COMPUTE_ELEMENT
D;JNE
// Goto(END_PROGRAM)
@default.default$END_PROGRAM
0;JMP
// Label(COMPUTE_ELEMENT)
(default.default$COMPUTE_ELEMENT)
// Push(that,0)
@THAT // accessing memory segment
D=M
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push(that,1)
@THAT // accessing memory segment
D=M
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(add)
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
// Pop(that,2)
@THAT // accessing memory segment
D=M
@2
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
// Push(pointer,1)
@3 // accessing memory segment
D=A
@1
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,1)
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(add)
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
// Pop(pointer,1)
@3 // accessing memory segment
D=A
@1
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
// Push(argument,0)
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
// Push(constant,1)
@1
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(sub)
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
// Pop(argument,0)
@ARG // accessing memory segment
D=M
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
// Goto(MAIN_LOOP_START)
@default.default$MAIN_LOOP_START
0;JMP
// Label(END_PROGRAM)
(default.default$END_PROGRAM)
