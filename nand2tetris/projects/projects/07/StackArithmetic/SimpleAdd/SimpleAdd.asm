// Push(constant,7)
@7
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,8)
@8
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

