// Push(constant,17)
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,17)
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(eq)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_1
D;JEQ
@SP
A=M
M=0
@CMP_END_1
0;JMP
(CMP_TRUE_1)
@SP
A=M
M=-1
(CMP_END_1)
@SP
M=M+1
// Push(constant,17)
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,16)
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(eq)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_2
D;JEQ
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
// Push(constant,16)
@16
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,17)
@17
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(eq)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_3
D;JEQ
@SP
A=M
M=0
@CMP_END_3
0;JMP
(CMP_TRUE_3)
@SP
A=M
M=-1
(CMP_END_3)
@SP
M=M+1
// Push(constant,892)
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,891)
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(lt)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_4
D;JLT
@SP
A=M
M=0
@CMP_END_4
0;JMP
(CMP_TRUE_4)
@SP
A=M
M=-1
(CMP_END_4)
@SP
M=M+1
// Push(constant,891)
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,892)
@892
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(lt)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_5
D;JLT
@SP
A=M
M=0
@CMP_END_5
0;JMP
(CMP_TRUE_5)
@SP
A=M
M=-1
(CMP_END_5)
@SP
M=M+1
// Push(constant,891)
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,891)
@891
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(lt)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_6
D;JLT
@SP
A=M
M=0
@CMP_END_6
0;JMP
(CMP_TRUE_6)
@SP
A=M
M=-1
(CMP_END_6)
@SP
M=M+1
// Push(constant,32767)
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,32766)
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(gt)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_7
D;JGT
@SP
A=M
M=0
@CMP_END_7
0;JMP
(CMP_TRUE_7)
@SP
A=M
M=-1
(CMP_END_7)
@SP
M=M+1
// Push(constant,32766)
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,32767)
@32767
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(gt)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_8
D;JGT
@SP
A=M
M=0
@CMP_END_8
0;JMP
(CMP_TRUE_8)
@SP
A=M
M=-1
(CMP_END_8)
@SP
M=M+1
// Push(constant,32766)
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,32766)
@32766
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(gt)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
D=M-D
@CMP_TRUE_9
D;JGT
@SP
A=M
M=0
@CMP_END_9
0;JMP
(CMP_TRUE_9)
@SP
A=M
M=-1
(CMP_END_9)
@SP
M=M+1
// Push(constant,57)
@57
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,31)
@31
D=A
@SP
A=M
M=D
@SP
M=M+1
// Push(constant,53)
@53
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
// Push(constant,112)
@112
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
// Arithmetic(neg)
@SP
M=M-1
@SP
A=M
M=-M
@SP
M=M+1
// Arithmetic(and)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M&D
@SP
M=M+1
// Push(constant,82)
@82
D=A
@SP
A=M
M=D
@SP
M=M+1
// Arithmetic(or)
@SP
M=M-1
A=M
D=M
@SP
M=M-1
A=M
M=M|D
@SP
M=M+1
// Arithmetic(not)
@SP
M=M-1
@SP
A=M
M=!M
@SP
M=M+1

