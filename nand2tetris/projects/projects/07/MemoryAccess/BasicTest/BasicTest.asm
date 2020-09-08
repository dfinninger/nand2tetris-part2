// Push(constant,10)
@10
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
// Push(constant,21)
@21
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,22)
@22
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(argument,2)
@ARG // accessing memory segment
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
// Pop(argument,1)
@ARG // accessing memory segment
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
// Push(constant,36)
@36
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(this,6)
@THIS // accessing memory segment
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
// Push(constant,42)
@42
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,45)
@45
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(that,5)
@THAT // accessing memory segment
D=M
@5
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
// Push(constant,510)
@510
D=A
@SP
A=M
M=D
@SP
M=M+1
// Pop(temp,6)
@5 // accessing memory segment
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
// Push(that,5)
@THAT // accessing memory segment
D=M
@5
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
// Push(this,6)
@THIS // accessing memory segment
D=M
@6
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// Push(this,6)
@THIS // accessing memory segment
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
// Push(temp,6)
@5 // accessing memory segment
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

