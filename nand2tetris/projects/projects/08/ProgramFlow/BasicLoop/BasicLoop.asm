// Push(constant,0)
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(local,0)
@LCL // accessing memory segment
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
// Label(LOOP_START)
(Xxx.LOOP_START)
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
// Push(local,0)
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
// Pop(local,0)
@LCL // accessing memory segment
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
// IfGoto(LOOP_START)
@SP
M=M-1
@SP
A=M
D=M
@Xxx.LOOP_START
D;JNE
// Push(local,0)
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
