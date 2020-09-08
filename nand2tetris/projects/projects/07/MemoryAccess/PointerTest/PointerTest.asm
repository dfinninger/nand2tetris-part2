// Push(constant,3030)
@3030
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(pointer,0)
@3 // accessing memory segment
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
// Push(constant,3040)
@3040
D=A
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
// Push(constant,32)
@32
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(this,2)
@THIS // accessing memory segment
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
// Push(constant,46)
@46
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(that,6)
@THAT // accessing memory segment
D=M
@6
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
// Push(pointer,0)
@3 // accessing memory segment
D=A
@0
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
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
// Push(this,2)
@THIS // accessing memory segment
D=M
@2
A=D+A
D=M
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
// Push(that,6)
@THAT // accessing memory segment
D=M
@6
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

