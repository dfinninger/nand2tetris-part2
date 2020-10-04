// Sun Sep 27 16:08:03 PDT 2020
// == Function(Sys.init,0) ==
(Sys.init)
// == Push(constant,4000) ==
@4000
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(pointer,0) ==
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
// == Push(constant,5000) ==
@5000
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(pointer,1) ==
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
// == Call(Sys.main,0) ==
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
@Sys.main
0;JMP
(Sys.Sys.init$1)
// == Pop(temp,1) ==
@5 // accessing memory segment
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
// == Label(LOOP) ==
(Sys.Sys.init$LOOP)
// == Goto(LOOP) ==
@Sys.Sys.init$LOOP
0;JMP
// == Function(Sys.main,5) ==
(Sys.main)
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
@0
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Push(constant,4001) ==
@4001
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(pointer,0) ==
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
// == Push(constant,5001) ==
@5001
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(pointer,1) ==
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
// == Push(constant,200) ==
@200
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(local,1) ==
@LCL // accessing memory segment
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
// == Push(constant,40) ==
@40
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(local,2) ==
@LCL // accessing memory segment
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
// == Push(constant,6) ==
@6
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(local,3) ==
@LCL // accessing memory segment
D=M
@3
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
// == Push(constant,123) ==
@123
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Call(Sys.add12,1) ==
@Sys.Sys.main$2
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
@Sys.add12
0;JMP
(Sys.Sys.main$2)
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
// == Push(local,2) ==
@LCL // accessing memory segment
D=M
@2
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(local,3) ==
@LCL // accessing memory segment
D=M
@3
A=D+A
D=M
@SP
A=M
M=D
@SP
M=M+1
// == Push(local,4) ==
@LCL // accessing memory segment
D=M
@4
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
// == Function(Sys.add12,0) ==
(Sys.add12)
// == Push(constant,4002) ==
@4002
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(pointer,0) ==
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
// == Push(constant,5002) ==
@5002
D=A
@SP
A=M
M=D
@SP
M=M+1
// == Pop(pointer,1) ==
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
// == Push(constant,12) ==
@12
D=A
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
