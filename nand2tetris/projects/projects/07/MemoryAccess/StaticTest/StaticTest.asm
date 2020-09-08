// Push(constant,111)
@111
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,333)
@333
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,888)
@888
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(static,8)
@SP
M=M-1
@SP
A=M
D=M
@Xxx.8
M=D
// Pop(static,3)
@SP
M=M-1
@SP
A=M
D=M
@Xxx.3
M=D
// Pop(static,1)
@SP
M=M-1
@SP
A=M
D=M
@Xxx.1
M=D
// Push(static,3)
@Xxx.3
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push(static,1)
@Xxx.1
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
// Push(static,8)
@Xxx.8
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

