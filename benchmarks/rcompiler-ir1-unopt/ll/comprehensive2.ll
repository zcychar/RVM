declare void @llvm.memcpy.p0.p0.i32(i8*, i8*, i32, i1)
declare i32 @printf(i8*, ...)
declare i32 @scanf(i8*, ...)
define void @exit.(i32 %code) {
entry:
  ret void
}
@.str.d = private unnamed_addr constant [3 x i8] c"%d\00"
@.str.d_ln = private unnamed_addr constant [4 x i8] c"%d\0A\00"
define void @printInt.(i32 %arg0) {
entry:
  %0 = call i32 @printf(i8* getelementptr ([3 x i8], [3 x i8]* @.str.d, i32 0, i32 0), i32 %arg0)
  ret void
}
define void @printlnInt.(i32 %arg0) {
entry:
  %0 = call i32 @printf(i8* getelementptr ([4 x i8], [4 x i8]* @.str.d_ln, i32 0, i32 0), i32 %arg0)
  ret void
}
define i32 @getInt.() {
entry:
  %0 = alloca i32
  %1 = call i32 @scanf(i8* getelementptr ([3 x i8], [3 x i8]* @.str.d, i32 0, i32 0), i32* %0)
  %2 = load i32, i32* %0
  ret i32 %2
}
define void @main() {
entry:
  call void @printlnInt.(i32 2000)
  call void @performComplexControlFlowTest.()
  call void @performGraphAlgorithms.()
  call void @performDynamicProgramming.()
  call void @performStateMachineSimulation.()
  call void @performSearchAlgorithms.()
  call void @printlnInt.(i32 2999)
  call void @exit.(i32 0)
  ret void
}
define void @performComplexControlFlowTest.() {
entry:
  %result1 = alloca i32 
  %result2 = alloca i32 
  %result3 = alloca i32 
  %result4 = alloca i32 
  call void @printlnInt.(i32 2001)
  %rcc.tmp.2 = call i32 @complexNestedLoops.(i32 100)
  store i32 %rcc.tmp.2, ptr %result1
  %rcc.tmp.4 = load i32, ptr %result1
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @multipleBranchingPatterns.(i32 1000)
  store i32 %rcc.tmp.6, ptr %result2
  %rcc.tmp.8 = load i32, ptr %result2
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @earlyExitPatterns.(i32 500)
  store i32 %rcc.tmp.10, ptr %result3
  %rcc.tmp.12 = load i32, ptr %result3
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @simulateSwitchBehavior.(i32 200)
  store i32 %rcc.tmp.14, ptr %result4
  %rcc.tmp.16 = load i32, ptr %result4
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 2002)
  ret void
}
define i32 @complexNestedLoops.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %total = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %inner_sum = alloca i32 
  %k = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %total
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %limit..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i32 0, ptr %inner_sum
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load i32, ptr %limit..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.20 = load i32, ptr %k
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.20, 50
  br i1 %rcc.tmp.21, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = add i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %k
  %rcc.tmp.28 = add i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 3
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, 0
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %j
  %rcc.tmp.34 = mul i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 5
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load i32, ptr %k
  %rcc.tmp.39 = load i32, ptr %inner_sum
  %rcc.tmp.40 = add i32 %rcc.tmp.39, %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %inner_sum
  %rcc.tmp.42 = load i32, ptr %inner_sum
  %rcc.tmp.43 = icmp sgt i32 %rcc.tmp.42, 1000
  br i1 %rcc.tmp.43, label %if.then.3, label %if.else.3
if.then.3:
  br label %while.linker.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.48 = load i32, ptr %k
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 2
  store i32 %rcc.tmp.49, ptr %k
  br label %while.cond.3
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = add i32 %rcc.tmp.53, %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %k
  %rcc.tmp.57 = add i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = srem i32 %rcc.tmp.57, 7
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 0
  br i1 %rcc.tmp.59, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.61 = load i32, ptr %k
  %rcc.tmp.62 = sdiv i32 %rcc.tmp.61, 2
  %rcc.tmp.63 = load i32, ptr %inner_sum
  %rcc.tmp.64 = sub i32 %rcc.tmp.63, %rcc.tmp.62
  store i32 %rcc.tmp.64, ptr %inner_sum
  %rcc.tmp.66 = load i32, ptr %inner_sum
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 0
  br i1 %rcc.tmp.67, label %if.then.5, label %if.else.5
if.then.5:
  store i32 0, ptr %inner_sum
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge
if.merge:
  %rcc.tmp.75 = load i32, ptr %k
  %rcc.tmp.76 = srem i32 %rcc.tmp.75, 2
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 0
  br i1 %rcc.tmp.77, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.79 = load i32, ptr %k
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %k
  br label %if.merge.6
if.else.6:
  %rcc.tmp.83 = load i32, ptr %k
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 3
  store i32 %rcc.tmp.84, ptr %k
  br label %if.merge.6
if.merge.6:
  br label %while.cond.3
while.end.3:
  %rcc.tmp.88 = load i32, ptr %inner_sum
  %rcc.tmp.89 = load i32, ptr %total
  %rcc.tmp.90 = add i32 %rcc.tmp.89, %rcc.tmp.88
  store i32 %rcc.tmp.90, ptr %total
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = srem i32 %rcc.tmp.92, 3
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.93, 0
  br i1 %rcc.tmp.94, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.96 = load i32, ptr %j
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 2
  store i32 %rcc.tmp.97, ptr %j
  br label %if.merge.7
if.else.7:
  %rcc.tmp.100 = load i32, ptr %j
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %j
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.104 = load i32, ptr %total
  %rcc.tmp.105 = icmp sgt i32 %rcc.tmp.104, 50000
  br i1 %rcc.tmp.105, label %if.then.8, label %if.else.8
if.then.8:
  br label %while.linker.2
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %while.cond.2
while.end.2:
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = srem i32 %rcc.tmp.110, 10
  %rcc.tmp.112 = icmp eq i32 %rcc.tmp.111, 0
  br i1 %rcc.tmp.112, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 5
  store i32 %rcc.tmp.115, ptr %i
  br label %if.merge.9
if.else.9:
  %rcc.tmp.118 = load i32, ptr %i
  %rcc.tmp.119 = srem i32 %rcc.tmp.118, 5
  %rcc.tmp.120 = icmp eq i32 %rcc.tmp.119, 0
  br i1 %rcc.tmp.120, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 3
  store i32 %rcc.tmp.123, ptr %i
  br label %if.merge.10
if.else.10:
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %i
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.131 = load i32, ptr %total
  %rcc.tmp.132 = icmp sgt i32 %rcc.tmp.131, 100000
  br i1 %rcc.tmp.132, label %if.then.11, label %if.else.11
if.then.11:
  br label %while.linker
if.else.11:
  br label %if.merge.11
if.merge.11:
  br label %while.cond
while.end:
  %rcc.tmp.137 = load i32, ptr %total
  %rcc.tmp.138 = srem i32 %rcc.tmp.137, 10000
  ret i32 %rcc.tmp.138
}
define i32 @multipleBranchingPatterns.(i32 %iterations.tmp) {
entry:
  %iterations..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  %value = alloca i32 
  %temp = alloca i32 
  %j = alloca i32 
  store i32 %iterations.tmp, ptr %iterations..tmp
  store i32 0, ptr %result
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %iterations..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 17
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 23
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 100
  store i32 %rcc.tmp.13, ptr %value
  %rcc.tmp.15 = load i32, ptr %value
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 10
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %value
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 5
  br i1 %rcc.tmp.19, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.21 = load i32, ptr %value
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 2
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 0
  br i1 %rcc.tmp.23, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.25 = load i32, ptr %value
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 3
  %rcc.tmp.27 = load i32, ptr %result
  %rcc.tmp.28 = add i32 %rcc.tmp.27, %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %result
  br label %if.merge.3
if.else.3:
  %rcc.tmp.31 = load i32, ptr %value
  %rcc.tmp.32 = mul i32 %rcc.tmp.31, 5
  %rcc.tmp.33 = load i32, ptr %result
  %rcc.tmp.34 = add i32 %rcc.tmp.33, %rcc.tmp.32
  store i32 %rcc.tmp.34, ptr %result
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.38 = load i32, ptr %value
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 3
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.39, 0
  br i1 %rcc.tmp.40, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.42 = load i32, ptr %value
  %rcc.tmp.43 = mul i32 %rcc.tmp.42, 2
  %rcc.tmp.44 = load i32, ptr %result
  %rcc.tmp.45 = add i32 %rcc.tmp.44, %rcc.tmp.43
  store i32 %rcc.tmp.45, ptr %result
  br label %if.merge.4
if.else.4:
  %rcc.tmp.48 = load i32, ptr %value
  %rcc.tmp.49 = mul i32 %rcc.tmp.48, 4
  %rcc.tmp.50 = load i32, ptr %result
  %rcc.tmp.51 = add i32 %rcc.tmp.50, %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %result
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.56 = load i32, ptr %value
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.56, 30
  br i1 %rcc.tmp.57, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.59 = load i32, ptr %value
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 20
  br i1 %rcc.tmp.60, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.62 = load i32, ptr %value
  %rcc.tmp.63 = call i32 @complexCalculation.(i32 %rcc.tmp.62)
  %rcc.tmp.64 = load i32, ptr %result
  %rcc.tmp.65 = add i32 %rcc.tmp.64, %rcc.tmp.63
  store i32 %rcc.tmp.65, ptr %result
  br label %if.merge.6
if.else.6:
  %rcc.tmp.68 = load i32, ptr %value
  %rcc.tmp.69 = call i32 @simpleCalculation.(i32 %rcc.tmp.68)
  %rcc.tmp.70 = load i32, ptr %result
  %rcc.tmp.71 = add i32 %rcc.tmp.70, %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %result
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  %rcc.tmp.75 = load i32, ptr %value
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.75, 60
  br i1 %rcc.tmp.76, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.78 = load i32, ptr %value
  %rcc.tmp.79 = call i32 @isSpecialNumber.(i32 %rcc.tmp.78)
  %rcc.tmp.80 = icmp eq i32 %rcc.tmp.79, 1
  br i1 %rcc.tmp.80, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.82 = load i32, ptr %value
  %rcc.tmp.83 = call i32 @processSpecialNumber.(i32 %rcc.tmp.82)
  %rcc.tmp.84 = load i32, ptr %result
  %rcc.tmp.85 = add i32 %rcc.tmp.84, %rcc.tmp.83
  store i32 %rcc.tmp.85, ptr %result
  br label %if.merge.8
if.else.8:
  %rcc.tmp.88 = load i32, ptr %value
  %rcc.tmp.89 = call i32 @processNormalNumber.(i32 %rcc.tmp.88)
  %rcc.tmp.90 = load i32, ptr %result
  %rcc.tmp.91 = add i32 %rcc.tmp.90, %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %result
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.95 = load i32, ptr %value
  %rcc.tmp.96 = icmp slt i32 %rcc.tmp.95, 80
  br i1 %rcc.tmp.96, label %if.then.9, label %if.else.9
if.then.9:
  store i32 0, ptr %temp
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.101 = load i32, ptr %j
  %rcc.tmp.102 = load i32, ptr %value
  %rcc.tmp.103 = srem i32 %rcc.tmp.102, 10
  %rcc.tmp.104 = icmp slt i32 %rcc.tmp.101, %rcc.tmp.103
  br i1 %rcc.tmp.104, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.107 = load i32, ptr %j
  %rcc.tmp.108 = load i32, ptr %j
  %rcc.tmp.109 = mul i32 %rcc.tmp.107, %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %temp
  %rcc.tmp.111 = add i32 %rcc.tmp.110, %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %temp
  %rcc.tmp.113 = load i32, ptr %j
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.117 = load i32, ptr %temp
  %rcc.tmp.118 = load i32, ptr %result
  %rcc.tmp.119 = add i32 %rcc.tmp.118, %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %result
  br label %if.merge.9
if.else.9:
  %rcc.tmp.122 = load i32, ptr %value
  %rcc.tmp.123 = load i32, ptr %value
  %rcc.tmp.124 = mul i32 %rcc.tmp.122, %rcc.tmp.123
  %rcc.tmp.125 = srem i32 %rcc.tmp.124, 17
  %rcc.tmp.126 = load i32, ptr %value
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 13
  %rcc.tmp.128 = srem i32 %rcc.tmp.127, 7
  %rcc.tmp.129 = add i32 %rcc.tmp.125, %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %result
  %rcc.tmp.131 = add i32 %rcc.tmp.130, %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %result
  br label %if.merge.9
if.merge.9:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.5
if.merge.5:
  br label %if.merge
if.merge:
  %rcc.tmp.137 = load i32, ptr %i
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 1
  store i32 %rcc.tmp.138, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.141 = load i32, ptr %result
  %rcc.tmp.142 = srem i32 %rcc.tmp.141, 10000
  ret i32 %rcc.tmp.142
}
define i32 @complexCalculation.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  %temp = alloca i32 
  %result = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.2, ptr %temp
  store i32 0, ptr %result
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %temp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %temp
  %rcc.tmp.11 = srem i32 %rcc.tmp.10, 10
  %rcc.tmp.12 = load i32, ptr %result
  %rcc.tmp.13 = add i32 %rcc.tmp.12, %rcc.tmp.11
  store i32 %rcc.tmp.13, ptr %result
  %rcc.tmp.15 = load i32, ptr %temp
  %rcc.tmp.16 = sdiv i32 %rcc.tmp.15, 10
  store i32 %rcc.tmp.16, ptr %temp
  br label %while.cond
while.end:
  %rcc.tmp.19 = load i32, ptr %result
  %rcc.tmp.20 = load i32, ptr %result
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  ret i32 %rcc.tmp.21
}
define i32 @simpleCalculation.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 2
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 1
  ret i32 %rcc.tmp.4
}
define i32 @isSpecialNumber.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 7
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %value..tmp
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 11
  %rcc.tmp.8 = icmp eq i32 %rcc.tmp.7, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  %rcc.tmp.11 = zext i1 %rcc.tmp.10 to i32
  ret i32 %rcc.tmp.11
}
define i32 @processSpecialNumber.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  %result = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.2, ptr %result
  %rcc.tmp.4 = load i32, ptr %value..tmp
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 7
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %result
  %rcc.tmp.9 = mul i32 %rcc.tmp.8, 7
  store i32 %rcc.tmp.9, ptr %result
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.13 = load i32, ptr %value..tmp
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 11
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %result
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 11
  store i32 %rcc.tmp.18, ptr %result
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.22 = load i32, ptr %result
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 1000
  ret i32 %rcc.tmp.23
}
define i32 @processNormalNumber.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 3
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 7
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 100
  ret i32 %rcc.tmp.5
}
define i32 @earlyExitPatterns.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %found_count = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %found_in_row = alloca i32 
  %value = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %found_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %limit..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i32 0, ptr %found_in_row
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load i32, ptr %limit..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = mul i32 %rcc.tmp.18, 31
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = mul i32 %rcc.tmp.20, 17
  %rcc.tmp.22 = add i32 %rcc.tmp.19, %rcc.tmp.21
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 100
  store i32 %rcc.tmp.23, ptr %value
  %rcc.tmp.25 = load i32, ptr %value
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 42
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %found_in_row
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %found_in_row
  %rcc.tmp.31 = load i32, ptr %found_count
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %found_count
  %rcc.tmp.34 = load i32, ptr %found_count
  %rcc.tmp.35 = icmp sgt i32 %rcc.tmp.34, 20
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load i32, ptr %found_count
  ret i32 %rcc.tmp.37
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.41 = load i32, ptr %value
  %rcc.tmp.42 = icmp sgt i32 %rcc.tmp.41, 95
  br i1 %rcc.tmp.42, label %if.then.3, label %if.else.3
if.then.3:
  br label %while.linker.2
if.else.3:
  %rcc.tmp.45 = load i32, ptr %value
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 5
  br i1 %rcc.tmp.46, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 10
  store i32 %rcc.tmp.49, ptr %j
  br label %while.cond.2
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.55 = load i32, ptr %found_in_row
  %rcc.tmp.56 = icmp sgt i32 %rcc.tmp.55, 3
  br i1 %rcc.tmp.56, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.58 = load i32, ptr %value
  %rcc.tmp.59 = srem i32 %rcc.tmp.58, 13
  %rcc.tmp.60 = icmp eq i32 %rcc.tmp.59, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.62 = phi i1 [0, %if.merge], [%rcc.tmp.60, %and.rhs]
  br i1 %rcc.tmp.62, label %if.then.5, label %if.else.5
if.then.5:
  br label %while.linker.2
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.70 = load i32, ptr %found_in_row
  %rcc.tmp.71 = icmp sgt i32 %rcc.tmp.70, 5
  br i1 %rcc.tmp.71, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.73 = load i32, ptr %found_count
  ret i32 %rcc.tmp.73
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.80 = load i32, ptr %found_count
  ret i32 %rcc.tmp.80
}
define i32 @simulateSwitchBehavior.(i32 %iterations.tmp) {
entry:
  %iterations..tmp = alloca i32 
  %total = alloca i32 
  %i = alloca i32 
  %case_value = alloca i32 
  store i32 %iterations.tmp, ptr %iterations..tmp
  store i32 0, ptr %total
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %iterations..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = srem i32 %rcc.tmp.10, 16
  store i32 %rcc.tmp.11, ptr %case_value
  %rcc.tmp.13 = load i32, ptr %case_value
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 0
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = call i32 @processCase0.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = load i32, ptr %total
  %rcc.tmp.19 = add i32 %rcc.tmp.18, %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %total
  br label %if.merge
if.else:
  %rcc.tmp.22 = load i32, ptr %case_value
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 1
  br i1 %rcc.tmp.23, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = call i32 @processCase1.(i32 %rcc.tmp.25)
  %rcc.tmp.27 = load i32, ptr %total
  %rcc.tmp.28 = add i32 %rcc.tmp.27, %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %total
  br label %if.merge.2
if.else.2:
  %rcc.tmp.31 = load i32, ptr %case_value
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 2
  br i1 %rcc.tmp.32, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = call i32 @processCase2.(i32 %rcc.tmp.34)
  %rcc.tmp.36 = load i32, ptr %total
  %rcc.tmp.37 = add i32 %rcc.tmp.36, %rcc.tmp.35
  store i32 %rcc.tmp.37, ptr %total
  br label %if.merge.3
if.else.3:
  %rcc.tmp.40 = load i32, ptr %case_value
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.40, 3
  br i1 %rcc.tmp.41, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = call i32 @processCase3.(i32 %rcc.tmp.43)
  %rcc.tmp.45 = load i32, ptr %total
  %rcc.tmp.46 = add i32 %rcc.tmp.45, %rcc.tmp.44
  store i32 %rcc.tmp.46, ptr %total
  br label %if.merge.4
if.else.4:
  %rcc.tmp.49 = load i32, ptr %case_value
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.49, 4
  br i1 %rcc.tmp.50, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = call i32 @processCase4.(i32 %rcc.tmp.52)
  %rcc.tmp.54 = load i32, ptr %total
  %rcc.tmp.55 = add i32 %rcc.tmp.54, %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %total
  br label %if.merge.5
if.else.5:
  %rcc.tmp.58 = load i32, ptr %case_value
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 5
  br i1 %rcc.tmp.59, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = call i32 @processCase5.(i32 %rcc.tmp.61)
  %rcc.tmp.63 = load i32, ptr %total
  %rcc.tmp.64 = add i32 %rcc.tmp.63, %rcc.tmp.62
  store i32 %rcc.tmp.64, ptr %total
  br label %if.merge.6
if.else.6:
  %rcc.tmp.67 = load i32, ptr %case_value
  %rcc.tmp.68 = icmp eq i32 %rcc.tmp.67, 6
  br i1 %rcc.tmp.68, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = call i32 @processCase6.(i32 %rcc.tmp.70)
  %rcc.tmp.72 = load i32, ptr %total
  %rcc.tmp.73 = add i32 %rcc.tmp.72, %rcc.tmp.71
  store i32 %rcc.tmp.73, ptr %total
  br label %if.merge.7
if.else.7:
  %rcc.tmp.76 = load i32, ptr %case_value
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 7
  br i1 %rcc.tmp.77, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = call i32 @processCase7.(i32 %rcc.tmp.79)
  %rcc.tmp.81 = load i32, ptr %total
  %rcc.tmp.82 = add i32 %rcc.tmp.81, %rcc.tmp.80
  store i32 %rcc.tmp.82, ptr %total
  br label %if.merge.8
if.else.8:
  %rcc.tmp.85 = load i32, ptr %case_value
  %rcc.tmp.86 = icmp eq i32 %rcc.tmp.85, 8
  br i1 %rcc.tmp.86, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = call i32 @processCase8.(i32 %rcc.tmp.88)
  %rcc.tmp.90 = load i32, ptr %total
  %rcc.tmp.91 = add i32 %rcc.tmp.90, %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %total
  br label %if.merge.9
if.else.9:
  %rcc.tmp.94 = load i32, ptr %case_value
  %rcc.tmp.95 = icmp eq i32 %rcc.tmp.94, 9
  br i1 %rcc.tmp.95, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = call i32 @processCase9.(i32 %rcc.tmp.97)
  %rcc.tmp.99 = load i32, ptr %total
  %rcc.tmp.100 = add i32 %rcc.tmp.99, %rcc.tmp.98
  store i32 %rcc.tmp.100, ptr %total
  br label %if.merge.10
if.else.10:
  %rcc.tmp.103 = load i32, ptr %case_value
  %rcc.tmp.104 = icmp eq i32 %rcc.tmp.103, 10
  br i1 %rcc.tmp.104, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = call i32 @processCase10.(i32 %rcc.tmp.106)
  %rcc.tmp.108 = load i32, ptr %total
  %rcc.tmp.109 = add i32 %rcc.tmp.108, %rcc.tmp.107
  store i32 %rcc.tmp.109, ptr %total
  br label %if.merge.11
if.else.11:
  %rcc.tmp.112 = load i32, ptr %case_value
  %rcc.tmp.113 = icmp eq i32 %rcc.tmp.112, 11
  br i1 %rcc.tmp.113, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = call i32 @processCase11.(i32 %rcc.tmp.115)
  %rcc.tmp.117 = load i32, ptr %total
  %rcc.tmp.118 = add i32 %rcc.tmp.117, %rcc.tmp.116
  store i32 %rcc.tmp.118, ptr %total
  br label %if.merge.12
if.else.12:
  %rcc.tmp.121 = load i32, ptr %case_value
  %rcc.tmp.122 = icmp eq i32 %rcc.tmp.121, 12
  br i1 %rcc.tmp.122, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = call i32 @processCase12.(i32 %rcc.tmp.124)
  %rcc.tmp.126 = load i32, ptr %total
  %rcc.tmp.127 = add i32 %rcc.tmp.126, %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %total
  br label %if.merge.13
if.else.13:
  %rcc.tmp.130 = load i32, ptr %case_value
  %rcc.tmp.131 = icmp eq i32 %rcc.tmp.130, 13
  br i1 %rcc.tmp.131, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = call i32 @processCase13.(i32 %rcc.tmp.133)
  %rcc.tmp.135 = load i32, ptr %total
  %rcc.tmp.136 = add i32 %rcc.tmp.135, %rcc.tmp.134
  store i32 %rcc.tmp.136, ptr %total
  br label %if.merge.14
if.else.14:
  %rcc.tmp.139 = load i32, ptr %case_value
  %rcc.tmp.140 = icmp eq i32 %rcc.tmp.139, 14
  br i1 %rcc.tmp.140, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = call i32 @processCase14.(i32 %rcc.tmp.142)
  %rcc.tmp.144 = load i32, ptr %total
  %rcc.tmp.145 = add i32 %rcc.tmp.144, %rcc.tmp.143
  store i32 %rcc.tmp.145, ptr %total
  br label %if.merge.15
if.else.15:
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = call i32 @processCase15.(i32 %rcc.tmp.148)
  %rcc.tmp.150 = load i32, ptr %total
  %rcc.tmp.151 = add i32 %rcc.tmp.150, %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %total
  br label %if.merge.15
if.merge.15:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.168 = load i32, ptr %i
  %rcc.tmp.169 = add i32 %rcc.tmp.168, 1
  store i32 %rcc.tmp.169, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.172 = load i32, ptr %total
  %rcc.tmp.173 = srem i32 %rcc.tmp.172, 10000
  ret i32 %rcc.tmp.173
}
define i32 @processCase0.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 2
  ret i32 %rcc.tmp.3
}
define i32 @processCase1.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 3
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 1
  ret i32 %rcc.tmp.4
}
define i32 @processCase2.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = load i32, ptr %value..tmp
  %rcc.tmp.4 = mul i32 %rcc.tmp.2, %rcc.tmp.3
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 100
  ret i32 %rcc.tmp.5
}
define i32 @processCase3.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = add i32 %rcc.tmp.2, 5
  %rcc.tmp.4 = mul i32 %rcc.tmp.3, 2
  ret i32 %rcc.tmp.4
}
define i32 @processCase4.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = sdiv i32 %rcc.tmp.2, 2
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 10
  ret i32 %rcc.tmp.4
}
define i32 @processCase5.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 7
  %rcc.tmp.4 = load i32, ptr %value..tmp
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 11
  %rcc.tmp.6 = add i32 %rcc.tmp.3, %rcc.tmp.5
  ret i32 %rcc.tmp.6
}
define i32 @processCase6.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 7
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 23
  ret i32 %rcc.tmp.4
}
define i32 @processCase7.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = add i32 %rcc.tmp.2, 3
  %rcc.tmp.4 = load i32, ptr %value..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 7
  %rcc.tmp.6 = mul i32 %rcc.tmp.3, %rcc.tmp.5
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 50
  ret i32 %rcc.tmp.7
}
define i32 @processCase8.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = xor i32 %rcc.tmp.2, 42
  ret i32 %rcc.tmp.3
}
define i32 @processCase9.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 13
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 17
  ret i32 %rcc.tmp.4
}
define i32 @processCase10.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = load i32, ptr %value..tmp
  %rcc.tmp.4 = sdiv i32 %rcc.tmp.3, 3
  %rcc.tmp.5 = add i32 %rcc.tmp.2, %rcc.tmp.4
  ret i32 %rcc.tmp.5
}
define i32 @processCase11.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 19
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 31
  ret i32 %rcc.tmp.4
}
define i32 @processCase12.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 2
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 1
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 25
  ret i32 %rcc.tmp.5
}
define i32 @processCase13.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 6
  %rcc.tmp.4 = load i32, ptr %value..tmp
  %rcc.tmp.5 = mul i32 %rcc.tmp.3, %rcc.tmp.4
  %rcc.tmp.6 = srem i32 %rcc.tmp.5, 8
  ret i32 %rcc.tmp.6
}
define i32 @processCase14.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = add i32 %rcc.tmp.2, 47
  ret i32 %rcc.tmp.3
}
define i32 @processCase15.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 37
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 41
  ret i32 %rcc.tmp.4
}
define void @performGraphAlgorithms.() {
entry:
  %traversal_result = alloca i32 
  %path_result = alloca i32 
  %connectivity_result = alloca i32 
  call void @printlnInt.(i32 2003)
  %rcc.tmp.2 = call i32 @performGraphTraversal.()
  store i32 %rcc.tmp.2, ptr %traversal_result
  %rcc.tmp.4 = load i32, ptr %traversal_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @performShortestPath.()
  store i32 %rcc.tmp.6, ptr %path_result
  %rcc.tmp.8 = load i32, ptr %path_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @performConnectivityTest.()
  store i32 %rcc.tmp.10, ptr %connectivity_result
  %rcc.tmp.12 = load i32, ptr %connectivity_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 2004)
  ret void
}
define i32 @performGraphTraversal.() {
entry:
  %graph_size = alloca i32 
  %adjacency_matrix = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %visited = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %dfs_result = alloca i32 
  %bfs_result = alloca i32 
  store i32 50, ptr %graph_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %adjacency_matrix, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 50
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [50 x i32], ptr %visited, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.24 = load i32, ptr %graph_size
  call void @initializeRandomGraph.([2500 x i32]* %adjacency_matrix, i32 %rcc.tmp.24)
  %rcc.tmp.26 = load i32, ptr %graph_size
  %rcc.tmp.27 = call i32 @depthFirstSearch.([2500 x i32]* %adjacency_matrix, [50 x i32]* %visited, i32 %rcc.tmp.26, i32 0)
  store i32 %rcc.tmp.27, ptr %dfs_result
  %rcc.tmp.29 = load i32, ptr %graph_size
  call void @resetArray.([50 x i32]* %visited, i32 %rcc.tmp.29)
  %rcc.tmp.31 = load i32, ptr %graph_size
  %rcc.tmp.32 = call i32 @breadthFirstSearch.([2500 x i32]* %adjacency_matrix, [50 x i32]* %visited, i32 %rcc.tmp.31, i32 0)
  store i32 %rcc.tmp.32, ptr %bfs_result
  %rcc.tmp.34 = load i32, ptr %dfs_result
  %rcc.tmp.35 = load i32, ptr %bfs_result
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  ret i32 %rcc.tmp.36
}
define void @initializeRandomGraph.([2500 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 12345, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %j
  %rcc.tmp.20 = icmp ne i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  call void @update.(i32* %seed)
  %rcc.tmp.23 = load i32, ptr %seed
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 100
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 20
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = load i32, ptr %size..tmp
  %rcc.tmp.29 = mul i32 %rcc.tmp.27, %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.33 = getelementptr [2500 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  store i32 1, ptr %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = mul i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.41 = getelementptr [2500 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  store i32 1, ptr %rcc.tmp.41
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @resetArray.([50 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..tmp = alloca [50 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [50 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load [50 x i32]*, ptr %arr..tmp
  %rcc.tmp.12 = getelementptr [50 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @depthFirstSearch.([2500 x i32]* %matrix.tmp, [50 x i32]* %visited.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %visited..tmp = alloca [50 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %stack = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %stack_top = alloca i32 
  %visit_count = alloca i32 
  %current = alloca i32 
  %neighbor = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store [50 x i32]* %visited.tmp, ptr %visited..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 1000
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [1000 x i32], ptr %stack, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %stack_top
  store i32 0, ptr %visit_count
  %rcc.tmp.18 = load i32, ptr %stack_top
  %rcc.tmp.19 = getelementptr [1000 x i32], ptr %stack, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %start..tmp
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %stack_top
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %stack_top
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %stack_top
  %rcc.tmp.27 = icmp sgt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %stack_top
  %rcc.tmp.31 = sub i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %stack_top
  %rcc.tmp.33 = load i32, ptr %stack_top
  %rcc.tmp.34 = getelementptr [1000 x i32], ptr %stack, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %current
  %rcc.tmp.37 = load i32, ptr %current
  %rcc.tmp.38 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.39 = getelementptr [50 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.40, 0
  br i1 %rcc.tmp.41, label %if.then, label %if.else
if.then:
  %rcc.tmp.43 = load i32, ptr %current
  %rcc.tmp.44 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  store i32 1, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %visit_count
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %visit_count
  store i32 0, ptr %neighbor
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.52 = load i32, ptr %neighbor
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.52, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.57 = load i32, ptr %current
  %rcc.tmp.58 = load i32, ptr %size..tmp
  %rcc.tmp.59 = mul i32 %rcc.tmp.57, %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %neighbor
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.63 = getelementptr [2500 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = icmp eq i32 %rcc.tmp.64, 1
  br i1 %rcc.tmp.65, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.67 = load i32, ptr %neighbor
  %rcc.tmp.68 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.69 = getelementptr [50 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = icmp eq i32 %rcc.tmp.70, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.73 = phi i1 [0, %while.body.2], [%rcc.tmp.71, %and.rhs]
  br i1 %rcc.tmp.73, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.75 = load i32, ptr %stack_top
  %rcc.tmp.76 = getelementptr [1000 x i32], ptr %stack, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %neighbor
  store i32 %rcc.tmp.77, ptr %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %stack_top
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %stack_top
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.84 = load i32, ptr %neighbor
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %neighbor
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.91 = load i32, ptr %visit_count
  ret i32 %rcc.tmp.91
}
define i32 @breadthFirstSearch.([2500 x i32]* %matrix.tmp, [50 x i32]* %visited.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %visited..tmp = alloca [50 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %queue = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %queue_front = alloca i32 
  %queue_rear = alloca i32 
  %visit_count = alloca i32 
  %current = alloca i32 
  %neighbor = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store [50 x i32]* %visited.tmp, ptr %visited..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 50
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %queue_front
  store i32 0, ptr %queue_rear
  store i32 0, ptr %visit_count
  %rcc.tmp.19 = load i32, ptr %queue_rear
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %start..tmp
  store i32 %rcc.tmp.21, ptr %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %queue_rear
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %queue_rear
  %rcc.tmp.26 = load i32, ptr %start..tmp
  %rcc.tmp.27 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.28 = getelementptr [50 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  store i32 1, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %visit_count
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %visit_count
  br label %while.cond
while.cond:
  %rcc.tmp.34 = load i32, ptr %queue_front
  %rcc.tmp.35 = load i32, ptr %queue_rear
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.39 = load i32, ptr %queue_front
  %rcc.tmp.40 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %current
  %rcc.tmp.43 = load i32, ptr %queue_front
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %queue_front
  store i32 0, ptr %neighbor
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.48 = load i32, ptr %neighbor
  %rcc.tmp.49 = load i32, ptr %size..tmp
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.53 = load i32, ptr %current
  %rcc.tmp.54 = load i32, ptr %size..tmp
  %rcc.tmp.55 = mul i32 %rcc.tmp.53, %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %neighbor
  %rcc.tmp.57 = add i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.59 = getelementptr [2500 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 1
  br i1 %rcc.tmp.61, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.63 = load i32, ptr %neighbor
  %rcc.tmp.64 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = icmp eq i32 %rcc.tmp.66, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.69 = phi i1 [0, %while.body.2], [%rcc.tmp.67, %and.rhs]
  br i1 %rcc.tmp.69, label %if.then, label %if.else
if.then:
  %rcc.tmp.71 = load i32, ptr %neighbor
  %rcc.tmp.72 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  store i32 1, ptr %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %visit_count
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %visit_count
  %rcc.tmp.78 = load i32, ptr %queue_rear
  %rcc.tmp.79 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %neighbor
  store i32 %rcc.tmp.80, ptr %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %queue_rear
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %queue_rear
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.87 = load i32, ptr %neighbor
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %neighbor
  br label %while.cond.2
while.end.2:
  br label %while.cond
while.end:
  %rcc.tmp.92 = load i32, ptr %visit_count
  ret i32 %rcc.tmp.92
}
define i32 @performShortestPath.() {
entry:
  %graph_size = alloca i32 
  %distance_matrix = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %total_distance = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 50, ptr %graph_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %distance_matrix, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = load i32, ptr %graph_size
  call void @initializeDistanceMatrix.([2500 x i32]* %distance_matrix, i32 %rcc.tmp.13)
  %rcc.tmp.15 = load i32, ptr %graph_size
  call void @floydWarshall.([2500 x i32]* %distance_matrix, i32 %rcc.tmp.15)
  store i32 0, ptr %total_distance
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = load i32, ptr %graph_size
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = load i32, ptr %graph_size
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %j
  %rcc.tmp.34 = icmp ne i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = load i32, ptr %graph_size
  %rcc.tmp.38 = mul i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.38, %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [2500 x i32], ptr %distance_matrix, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 1000000
  br label %sc.merge
sc.merge:
  %rcc.tmp.45 = phi i1 [0, %while.body.2], [%rcc.tmp.43, %and.rhs]
  br i1 %rcc.tmp.45, label %if.then, label %if.else
if.then:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = load i32, ptr %graph_size
  %rcc.tmp.49 = mul i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = add i32 %rcc.tmp.49, %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [2500 x i32], ptr %distance_matrix, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %total_distance
  %rcc.tmp.55 = add i32 %rcc.tmp.54, %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %total_distance
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.67 = load i32, ptr %total_distance
  %rcc.tmp.68 = srem i32 %rcc.tmp.67, 10000
  ret i32 %rcc.tmp.68
}
define void @initializeDistanceMatrix.([2500 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %infinity = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 1000000, ptr %infinity
  store i32 54321, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = mul i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.29 = getelementptr [2500 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  store i32 0, ptr %rcc.tmp.29
  br label %if.merge
if.else:
  call void @update.(i32* %seed)
  %rcc.tmp.33 = load i32, ptr %seed
  %rcc.tmp.34 = srem i32 %rcc.tmp.33, 100
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.34, 30
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = load i32, ptr %size..tmp
  %rcc.tmp.39 = mul i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.43 = getelementptr [2500 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %seed
  %rcc.tmp.45 = srem i32 %rcc.tmp.44, 20
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %rcc.tmp.43
  br label %if.merge.2
if.else.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = load i32, ptr %size..tmp
  %rcc.tmp.51 = mul i32 %rcc.tmp.49, %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = add i32 %rcc.tmp.51, %rcc.tmp.52
  %rcc.tmp.54 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.55 = getelementptr [2500 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %infinity
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @floydWarshall.([2500 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %k = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %current_distance = alloca i32 
  %new_distance = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %k
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.19 = load i32, ptr %j
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %size..tmp
  %rcc.tmp.26 = mul i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.30 = getelementptr [2500 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %current_distance
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = load i32, ptr %size..tmp
  %rcc.tmp.35 = mul i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %k
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.39 = getelementptr [2500 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %k
  %rcc.tmp.42 = load i32, ptr %size..tmp
  %rcc.tmp.43 = mul i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.47 = getelementptr [2500 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.40, %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %new_distance
  %rcc.tmp.51 = load i32, ptr %new_distance
  %rcc.tmp.52 = load i32, ptr %current_distance
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then, label %if.else
if.then:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load i32, ptr %size..tmp
  %rcc.tmp.57 = mul i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %j
  %rcc.tmp.59 = add i32 %rcc.tmp.57, %rcc.tmp.58
  %rcc.tmp.60 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.61 = getelementptr [2500 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %new_distance
  store i32 %rcc.tmp.62, ptr %rcc.tmp.61
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.74 = load i32, ptr %k
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %k
  br label %while.cond
while.end:
  ret void
}
define i32 @performConnectivityTest.() {
entry:
  %graph_size = alloca i32 
  %adjacency_matrix = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %component_count = alloca i32 
  store i32 50, ptr %graph_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %adjacency_matrix, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = load i32, ptr %graph_size
  call void @initializeRandomGraph.([2500 x i32]* %adjacency_matrix, i32 %rcc.tmp.13)
  %rcc.tmp.15 = load i32, ptr %graph_size
  %rcc.tmp.16 = call i32 @countConnectedComponents.([2500 x i32]* %adjacency_matrix, i32 %rcc.tmp.15)
  store i32 %rcc.tmp.16, ptr %component_count
  %rcc.tmp.18 = load i32, ptr %component_count
  ret i32 %rcc.tmp.18
}
define i32 @countConnectedComponents.([2500 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %visited = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %component_count = alloca i32 
  %vertex = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %visited, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %component_count
  store i32 0, ptr %vertex
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %vertex
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %vertex
  %rcc.tmp.23 = getelementptr [50 x i32], ptr %visited, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %component_count
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %component_count
  %rcc.tmp.30 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = load i32, ptr %vertex
  call void @dfsMarkComponent.([2500 x i32]* %rcc.tmp.30, [50 x i32]* %visited, i32 %rcc.tmp.31, i32 %rcc.tmp.32)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %vertex
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %vertex
  br label %while.cond
while.end:
  %rcc.tmp.40 = load i32, ptr %component_count
  ret i32 %rcc.tmp.40
}
define void @dfsMarkComponent.([2500 x i32]* %matrix.tmp, [50 x i32]* %visited.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %matrix..tmp = alloca [2500 x i32]* 
  %visited..tmp = alloca [50 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %neighbor = alloca i32 
  store [2500 x i32]* %matrix.tmp, ptr %matrix..tmp
  store [50 x i32]* %visited.tmp, ptr %visited..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  %rcc.tmp.5 = load i32, ptr %start..tmp
  %rcc.tmp.6 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.7 = getelementptr [50 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  store i32 1, ptr %rcc.tmp.7
  store i32 0, ptr %neighbor
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %neighbor
  %rcc.tmp.12 = load i32, ptr %size..tmp
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %start..tmp
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = mul i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %neighbor
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.22 = getelementptr [2500 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 1
  br i1 %rcc.tmp.24, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.26 = load i32, ptr %neighbor
  %rcc.tmp.27 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.28 = getelementptr [50 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.32 = phi i1 [0, %while.body], [%rcc.tmp.30, %and.rhs]
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  %rcc.tmp.34 = load [2500 x i32]*, ptr %matrix..tmp
  %rcc.tmp.35 = load [50 x i32]*, ptr %visited..tmp
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = load i32, ptr %neighbor
  call void @dfsMarkComponent.([2500 x i32]* %rcc.tmp.34, [50 x i32]* %rcc.tmp.35, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.41 = load i32, ptr %neighbor
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %neighbor
  br label %while.cond
while.end:
  ret void
}
define void @performDynamicProgramming.() {
entry:
  %lcs_result = alloca i32 
  %knapsack_result = alloca i32 
  %edit_result = alloca i32 
  call void @printlnInt.(i32 2005)
  %rcc.tmp.2 = call i32 @longestCommonSubsequence.()
  store i32 %rcc.tmp.2, ptr %lcs_result
  %rcc.tmp.4 = load i32, ptr %lcs_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @knapsackProblem.()
  store i32 %rcc.tmp.6, ptr %knapsack_result
  %rcc.tmp.8 = load i32, ptr %knapsack_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @editDistance.()
  store i32 %rcc.tmp.10, ptr %edit_result
  %rcc.tmp.12 = load i32, ptr %edit_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 2006)
  ret void
}
define i32 @longestCommonSubsequence.() {
entry:
  %string1_length = alloca i32 
  %string2_length = alloca i32 
  %string1 = alloca [30 x i32] 
  %fill.idx = alloca i32 
  %string2 = alloca [25 x i32] 
  %fill.idx.2 = alloca i32 
  %dp_table = alloca [806 x i32] 
  %fill.idx.3 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %option1 = alloca i32 
  %option2 = alloca i32 
  store i32 30, ptr %string1_length
  store i32 25, ptr %string2_length
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 30
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [30 x i32], ptr %string1, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 25
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [25 x i32], ptr %string2, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 806
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @initializeStrings.([30 x i32]* %string1, [25 x i32]* %string2, i32 17, i32 23)
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = load i32, ptr %string1_length
  %rcc.tmp.41 = icmp sle i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.46 = load i32, ptr %j
  %rcc.tmp.47 = load i32, ptr %string2_length
  %rcc.tmp.48 = icmp sle i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = sub i32 %rcc.tmp.51, 1
  %rcc.tmp.53 = getelementptr [30 x i32], ptr %string1, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = sub i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = getelementptr [25 x i32], ptr %string2, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.54, %rcc.tmp.58
  br i1 %rcc.tmp.59, label %if.then, label %if.else
if.then:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = load i32, ptr %string2_length
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  %rcc.tmp.64 = mul i32 %rcc.tmp.61, %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = sub i32 %rcc.tmp.68, 1
  %rcc.tmp.70 = load i32, ptr %string2_length
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = mul i32 %rcc.tmp.69, %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = sub i32 %rcc.tmp.73, 1
  %rcc.tmp.75 = add i32 %rcc.tmp.72, %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %rcc.tmp.67
  br label %if.merge
if.else:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = load i32, ptr %string2_length
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = mul i32 %rcc.tmp.82, %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %j
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  store i32 %rcc.tmp.89, ptr %option1
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = load i32, ptr %string2_length
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  %rcc.tmp.94 = mul i32 %rcc.tmp.91, %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %j
  %rcc.tmp.96 = sub i32 %rcc.tmp.95, 1
  %rcc.tmp.97 = add i32 %rcc.tmp.94, %rcc.tmp.96
  %rcc.tmp.98 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.98
  store i32 %rcc.tmp.99, ptr %option2
  %rcc.tmp.101 = load i32, ptr %option1
  %rcc.tmp.102 = load i32, ptr %option2
  %rcc.tmp.103 = icmp sgt i32 %rcc.tmp.101, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = load i32, ptr %string2_length
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = mul i32 %rcc.tmp.105, %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %j
  %rcc.tmp.110 = add i32 %rcc.tmp.108, %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %option1
  store i32 %rcc.tmp.112, ptr %rcc.tmp.111
  br label %if.merge.2
if.else.2:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = load i32, ptr %string2_length
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  %rcc.tmp.118 = mul i32 %rcc.tmp.115, %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %j
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %option2
  store i32 %rcc.tmp.122, ptr %rcc.tmp.121
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.126 = load i32, ptr %j
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.134 = load i32, ptr %string1_length
  %rcc.tmp.135 = load i32, ptr %string2_length
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 1
  %rcc.tmp.137 = mul i32 %rcc.tmp.134, %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %string2_length
  %rcc.tmp.139 = add i32 %rcc.tmp.137, %rcc.tmp.138
  %rcc.tmp.140 = getelementptr [806 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.140
  ret i32 %rcc.tmp.141
}
define void @initializeStrings.([30 x i32]* %str1.tmp, [25 x i32]* %str2.tmp, i32 %seed1.tmp, i32 %seed2.tmp) {
entry:
  %str1..tmp = alloca [30 x i32]* 
  %str2..tmp = alloca [25 x i32]* 
  %seed1..tmp = alloca i32 
  %seed2..tmp = alloca i32 
  %current_seed = alloca i32 
  %i = alloca i32 
  %current_seed.2 = alloca i32 
  %j = alloca i32 
  store [30 x i32]* %str1.tmp, ptr %str1..tmp
  store [25 x i32]* %str2.tmp, ptr %str2..tmp
  store i32 %seed1.tmp, ptr %seed1..tmp
  store i32 %seed2.tmp, ptr %seed2..tmp
  %rcc.tmp.5 = load i32, ptr %seed1..tmp
  store i32 %rcc.tmp.5, ptr %current_seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 30
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update.(i32* %current_seed)
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load [30 x i32]*, ptr %str1..tmp
  %rcc.tmp.16 = getelementptr [30 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %current_seed
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 26
  store i32 %rcc.tmp.18, ptr %rcc.tmp.16
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.24 = load i32, ptr %seed2..tmp
  store i32 %rcc.tmp.24, ptr %current_seed.2
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 25
  br i1 %rcc.tmp.29, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  call void @update.(i32* %current_seed.2)
  %rcc.tmp.33 = load i32, ptr %j
  %rcc.tmp.34 = load [25 x i32]*, ptr %str2..tmp
  %rcc.tmp.35 = getelementptr [25 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %current_seed.2
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 26
  store i32 %rcc.tmp.37, ptr %rcc.tmp.35
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %j
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @knapsackProblem.() {
entry:
  %item_count = alloca i32 
  %capacity = alloca i32 
  %weights = alloca [20 x i32] 
  %fill.idx = alloca i32 
  %values = alloca [20 x i32] 
  %fill.idx.2 = alloca i32 
  %dp_table = alloca [2121 x i32] 
  %fill.idx.3 = alloca i32 
  %i = alloca i32 
  %w = alloca i32 
  %without_item = alloca i32 
  %with_item = alloca i32 
  store i32 20, ptr %item_count
  store i32 100, ptr %capacity
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 20
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [20 x i32], ptr %weights, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 20
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [20 x i32], ptr %values, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 2121
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.36 = load i32, ptr %item_count
  call void @initializeKnapsackItems.([20 x i32]* %weights, [20 x i32]* %values, i32 %rcc.tmp.36)
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = load i32, ptr %item_count
  %rcc.tmp.42 = icmp sle i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %w
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.47 = load i32, ptr %w
  %rcc.tmp.48 = load i32, ptr %capacity
  %rcc.tmp.49 = icmp sle i32 %rcc.tmp.47, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = sub i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = load i32, ptr %capacity
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  %rcc.tmp.56 = mul i32 %rcc.tmp.53, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %w
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %without_item
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = sub i32 %rcc.tmp.62, 1
  %rcc.tmp.64 = getelementptr [20 x i32], ptr %weights, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %w
  %rcc.tmp.67 = icmp sle i32 %rcc.tmp.65, %rcc.tmp.66
  br i1 %rcc.tmp.67, label %if.then, label %if.else
if.then:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = sub i32 %rcc.tmp.69, 1
  %rcc.tmp.71 = getelementptr [20 x i32], ptr %values, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = sub i32 %rcc.tmp.73, 1
  %rcc.tmp.75 = load i32, ptr %capacity
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  %rcc.tmp.77 = mul i32 %rcc.tmp.74, %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %w
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = sub i32 %rcc.tmp.79, 1
  %rcc.tmp.81 = getelementptr [20 x i32], ptr %weights, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = sub i32 %rcc.tmp.78, %rcc.tmp.83
  %rcc.tmp.85 = add i32 %rcc.tmp.77, %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = add i32 %rcc.tmp.72, %rcc.tmp.87
  store i32 %rcc.tmp.88, ptr %with_item
  %rcc.tmp.90 = load i32, ptr %with_item
  %rcc.tmp.91 = load i32, ptr %without_item
  %rcc.tmp.92 = icmp sgt i32 %rcc.tmp.90, %rcc.tmp.91
  br i1 %rcc.tmp.92, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = load i32, ptr %capacity
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  %rcc.tmp.97 = mul i32 %rcc.tmp.94, %rcc.tmp.96
  %rcc.tmp.98 = load i32, ptr %w
  %rcc.tmp.99 = add i32 %rcc.tmp.97, %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %with_item
  store i32 %rcc.tmp.101, ptr %rcc.tmp.100
  br label %if.merge.2
if.else.2:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = load i32, ptr %capacity
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  %rcc.tmp.107 = mul i32 %rcc.tmp.104, %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %w
  %rcc.tmp.109 = add i32 %rcc.tmp.107, %rcc.tmp.108
  %rcc.tmp.110 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %without_item
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = load i32, ptr %capacity
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  %rcc.tmp.118 = mul i32 %rcc.tmp.115, %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %w
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %without_item
  store i32 %rcc.tmp.122, ptr %rcc.tmp.121
  br label %if.merge
if.merge:
  %rcc.tmp.125 = load i32, ptr %w
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 1
  store i32 %rcc.tmp.126, ptr %w
  br label %while.cond.2
while.end.2:
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.133 = load i32, ptr %item_count
  %rcc.tmp.134 = load i32, ptr %capacity
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  %rcc.tmp.136 = mul i32 %rcc.tmp.133, %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %capacity
  %rcc.tmp.138 = add i32 %rcc.tmp.136, %rcc.tmp.137
  %rcc.tmp.139 = getelementptr [2121 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  ret i32 %rcc.tmp.140
}
define void @initializeKnapsackItems.([20 x i32]* %weights.tmp, [20 x i32]* %values.tmp, i32 %count.tmp) {
entry:
  %weights..tmp = alloca [20 x i32]* 
  %values..tmp = alloca [20 x i32]* 
  %count..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  store [20 x i32]* %weights.tmp, ptr %weights..tmp
  store [20 x i32]* %values.tmp, ptr %values..tmp
  store i32 %count.tmp, ptr %count..tmp
  store i32 98765, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update.(i32* %seed)
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load [20 x i32]*, ptr %weights..tmp
  %rcc.tmp.15 = getelementptr [20 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %seed
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 20
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %rcc.tmp.15
  call void @update.(i32* %seed)
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load [20 x i32]*, ptr %values..tmp
  %rcc.tmp.23 = getelementptr [20 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %seed
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 50
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %rcc.tmp.23
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @editDistance.() {
entry:
  %string1_length = alloca i32 
  %string2_length = alloca i32 
  %string1 = alloca [15 x i32] 
  %string2 = alloca [12 x i32] 
  %dp_table = alloca [208 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %insert_cost = alloca i32 
  %delete_cost = alloca i32 
  %replace_cost = alloca i32 
  %min_cost = alloca i32 
  store i32 15, ptr %string1_length
  store i32 12, ptr %string2_length
  %rcc.tmp.3 = getelementptr [15 x i32], ptr %string1, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [15 x i32], ptr %string1, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [15 x i32], ptr %string1, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [15 x i32], ptr %string1, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [15 x i32], ptr %string1, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [15 x i32], ptr %string1, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [15 x i32], ptr %string1, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [15 x i32], ptr %string1, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [15 x i32], ptr %string1, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [15 x i32], ptr %string1, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [15 x i32], ptr %string1, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [15 x i32], ptr %string1, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [15 x i32], ptr %string1, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [15 x i32], ptr %string1, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [15 x i32], ptr %string1, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [12 x i32], ptr %string2, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [12 x i32], ptr %string2, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [12 x i32], ptr %string2, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [12 x i32], ptr %string2, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [12 x i32], ptr %string2, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [12 x i32], ptr %string2, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [12 x i32], ptr %string2, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [12 x i32], ptr %string2, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [12 x i32], ptr %string2, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [12 x i32], ptr %string2, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [12 x i32], ptr %string2, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [12 x i32], ptr %string2, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.55
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.59 = load i32, ptr %fill.idx
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 208
  br i1 %rcc.tmp.60, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.62 = load i32, ptr %fill.idx
  %rcc.tmp.63 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.62
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.65, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.68 = load i32, ptr %string1_length
  %rcc.tmp.69 = load i32, ptr %string2_length
  call void @initializeEditStrings.([15 x i32]* %string1, [12 x i32]* %string2, i32 %rcc.tmp.68, i32 %rcc.tmp.69)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = load i32, ptr %string1_length
  %rcc.tmp.75 = icmp sle i32 %rcc.tmp.73, %rcc.tmp.74
  br i1 %rcc.tmp.75, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = load i32, ptr %string2_length
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  %rcc.tmp.81 = mul i32 %rcc.tmp.78, %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %i
  store i32 %rcc.tmp.84, ptr %rcc.tmp.83
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = load i32, ptr %string2_length
  %rcc.tmp.94 = icmp sle i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.97 = load i32, ptr %string2_length
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  %rcc.tmp.99 = mul i32 0, %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %j
  %rcc.tmp.101 = add i32 %rcc.tmp.99, %rcc.tmp.100
  %rcc.tmp.102 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %j
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  store i32 %rcc.tmp.106, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 1, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = load i32, ptr %string1_length
  %rcc.tmp.113 = icmp sle i32 %rcc.tmp.111, %rcc.tmp.112
  br i1 %rcc.tmp.113, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 1, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.118 = load i32, ptr %j
  %rcc.tmp.119 = load i32, ptr %string2_length
  %rcc.tmp.120 = icmp sle i32 %rcc.tmp.118, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = sub i32 %rcc.tmp.123, 1
  %rcc.tmp.125 = getelementptr [15 x i32], ptr %string1, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %j
  %rcc.tmp.128 = sub i32 %rcc.tmp.127, 1
  %rcc.tmp.129 = getelementptr [12 x i32], ptr %string2, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  %rcc.tmp.131 = icmp eq i32 %rcc.tmp.126, %rcc.tmp.130
  br i1 %rcc.tmp.131, label %if.then, label %if.else
if.then:
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = load i32, ptr %string2_length
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  %rcc.tmp.136 = mul i32 %rcc.tmp.133, %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %j
  %rcc.tmp.138 = add i32 %rcc.tmp.136, %rcc.tmp.137
  %rcc.tmp.139 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %i
  %rcc.tmp.141 = sub i32 %rcc.tmp.140, 1
  %rcc.tmp.142 = load i32, ptr %string2_length
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 1
  %rcc.tmp.144 = mul i32 %rcc.tmp.141, %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %j
  %rcc.tmp.146 = sub i32 %rcc.tmp.145, 1
  %rcc.tmp.147 = add i32 %rcc.tmp.144, %rcc.tmp.146
  %rcc.tmp.148 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  store i32 %rcc.tmp.149, ptr %rcc.tmp.139
  br label %if.merge
if.else:
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = load i32, ptr %string2_length
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  %rcc.tmp.155 = mul i32 %rcc.tmp.152, %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %j
  %rcc.tmp.157 = sub i32 %rcc.tmp.156, 1
  %rcc.tmp.158 = add i32 %rcc.tmp.155, %rcc.tmp.157
  %rcc.tmp.159 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %rcc.tmp.159
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %insert_cost
  %rcc.tmp.163 = load i32, ptr %i
  %rcc.tmp.164 = sub i32 %rcc.tmp.163, 1
  %rcc.tmp.165 = load i32, ptr %string2_length
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  %rcc.tmp.167 = mul i32 %rcc.tmp.164, %rcc.tmp.166
  %rcc.tmp.168 = load i32, ptr %j
  %rcc.tmp.169 = add i32 %rcc.tmp.167, %rcc.tmp.168
  %rcc.tmp.170 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.169
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.170
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 1
  store i32 %rcc.tmp.172, ptr %delete_cost
  %rcc.tmp.174 = load i32, ptr %i
  %rcc.tmp.175 = sub i32 %rcc.tmp.174, 1
  %rcc.tmp.176 = load i32, ptr %string2_length
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 1
  %rcc.tmp.178 = mul i32 %rcc.tmp.175, %rcc.tmp.177
  %rcc.tmp.179 = load i32, ptr %j
  %rcc.tmp.180 = sub i32 %rcc.tmp.179, 1
  %rcc.tmp.181 = add i32 %rcc.tmp.178, %rcc.tmp.180
  %rcc.tmp.182 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.181
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.182
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 1
  store i32 %rcc.tmp.184, ptr %replace_cost
  %rcc.tmp.186 = load i32, ptr %insert_cost
  %rcc.tmp.187 = load i32, ptr %delete_cost
  %rcc.tmp.188 = load i32, ptr %replace_cost
  %rcc.tmp.189 = call i32 @findMinimum.(i32 %rcc.tmp.186, i32 %rcc.tmp.187, i32 %rcc.tmp.188)
  store i32 %rcc.tmp.189, ptr %min_cost
  %rcc.tmp.191 = load i32, ptr %i
  %rcc.tmp.192 = load i32, ptr %string2_length
  %rcc.tmp.193 = add i32 %rcc.tmp.192, 1
  %rcc.tmp.194 = mul i32 %rcc.tmp.191, %rcc.tmp.193
  %rcc.tmp.195 = load i32, ptr %j
  %rcc.tmp.196 = add i32 %rcc.tmp.194, %rcc.tmp.195
  %rcc.tmp.197 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.196
  %rcc.tmp.198 = load i32, ptr %min_cost
  store i32 %rcc.tmp.198, ptr %rcc.tmp.197
  br label %if.merge
if.merge:
  %rcc.tmp.201 = load i32, ptr %j
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 1
  store i32 %rcc.tmp.202, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.205 = load i32, ptr %i
  %rcc.tmp.206 = add i32 %rcc.tmp.205, 1
  store i32 %rcc.tmp.206, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.209 = load i32, ptr %string1_length
  %rcc.tmp.210 = load i32, ptr %string2_length
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 1
  %rcc.tmp.212 = mul i32 %rcc.tmp.209, %rcc.tmp.211
  %rcc.tmp.213 = load i32, ptr %string2_length
  %rcc.tmp.214 = add i32 %rcc.tmp.212, %rcc.tmp.213
  %rcc.tmp.215 = getelementptr [208 x i32], ptr %dp_table, i32 0, i32 %rcc.tmp.214
  %rcc.tmp.216 = load i32, ptr %rcc.tmp.215
  ret i32 %rcc.tmp.216
}
define void @initializeEditStrings.([15 x i32]* %str1.tmp, [12 x i32]* %str2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %str1..tmp = alloca [15 x i32]* 
  %str2..tmp = alloca [12 x i32]* 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %seed1 = alloca i32 
  %seed2 = alloca i32 
  %i = alloca i32 
  store [15 x i32]* %str1.tmp, ptr %str1..tmp
  store [12 x i32]* %str2.tmp, ptr %str2..tmp
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  store i32 11111, ptr %seed1
  store i32 22222, ptr %seed2
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %len1..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update.(i32* %seed1)
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = load [15 x i32]*, ptr %str1..tmp
  %rcc.tmp.17 = getelementptr [15 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %seed1
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 10
  store i32 %rcc.tmp.19, ptr %rcc.tmp.17
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = load i32, ptr %len2..tmp
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  call void @update.(i32* %seed2)
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = load [12 x i32]*, ptr %str2..tmp
  %rcc.tmp.35 = getelementptr [12 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %seed2
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 10
  store i32 %rcc.tmp.37, ptr %rcc.tmp.35
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @findMinimum.(i32 %a.tmp, i32 %b.tmp, i32 %c.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  %c..tmp = alloca i32 
  %min = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  store i32 %c.tmp, ptr %c..tmp
  %rcc.tmp.4 = load i32, ptr %a..tmp
  store i32 %rcc.tmp.4, ptr %min
  %rcc.tmp.6 = load i32, ptr %b..tmp
  %rcc.tmp.7 = load i32, ptr %min
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %b..tmp
  store i32 %rcc.tmp.10, ptr %min
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %c..tmp
  %rcc.tmp.15 = load i32, ptr %min
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.18 = load i32, ptr %c..tmp
  store i32 %rcc.tmp.18, ptr %min
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.22 = load i32, ptr %min
  ret i32 %rcc.tmp.22
}
define void @performStateMachineSimulation.() {
entry:
  %fsa_result = alloca i32 
  %traffic_result = alloca i32 
  call void @printlnInt.(i32 2007)
  %rcc.tmp.2 = call i32 @finiteStateAutomaton.()
  store i32 %rcc.tmp.2, ptr %fsa_result
  %rcc.tmp.4 = load i32, ptr %fsa_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @trafficLightSimulation.()
  store i32 %rcc.tmp.6, ptr %traffic_result
  %rcc.tmp.8 = load i32, ptr %traffic_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  call void @printlnInt.(i32 2008)
  ret void
}
define i32 @finiteStateAutomaton.() {
entry:
  %input_length = alloca i32 
  %input_sequence = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %current_state = alloca i32 
  %accepted_count = alloca i32 
  %i = alloca i32 
  %input_symbol = alloca i32 
  store i32 1000, ptr %input_length
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %input_sequence, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %current_state
  store i32 0, ptr %accepted_count
  %rcc.tmp.15 = load i32, ptr %input_length
  call void @generateInputSequence.([1000 x i32]* %input_sequence, i32 %rcc.tmp.15)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %input_length
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = getelementptr [1000 x i32], ptr %input_sequence, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %input_symbol
  %rcc.tmp.28 = load i32, ptr %current_state
  %rcc.tmp.29 = load i32, ptr %input_symbol
  %rcc.tmp.30 = call i32 @stateTransition.(i32 %rcc.tmp.28, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %current_state
  %rcc.tmp.32 = load i32, ptr %current_state
  %rcc.tmp.33 = call i32 @isAcceptingState.(i32 %rcc.tmp.32)
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 1
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %accepted_count
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %accepted_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %accepted_count
  ret i32 %rcc.tmp.45
}
define void @generateInputSequence.([1000 x i32]* %sequence.tmp, i32 %length.tmp) {
entry:
  %sequence..tmp = alloca [1000 x i32]* 
  %length..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %sequence.tmp, ptr %sequence..tmp
  store i32 %length.tmp, ptr %length..tmp
  store i32 13579, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %length..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update.(i32* %seed)
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load [1000 x i32]*, ptr %sequence..tmp
  %rcc.tmp.14 = getelementptr [1000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %seed
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 4
  store i32 %rcc.tmp.16, ptr %rcc.tmp.14
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @stateTransition.(i32 %current_state.tmp, i32 %input.tmp) {
entry:
  %current_state..tmp = alloca i32 
  %input..tmp = alloca i32 
  store i32 %current_state.tmp, ptr %current_state..tmp
  store i32 %input.tmp, ptr %input..tmp
  %rcc.tmp.3 = load i32, ptr %current_state..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %input..tmp
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  %rcc.tmp.10 = load i32, ptr %input..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 2
if.else.3:
  %rcc.tmp.14 = load i32, ptr %input..tmp
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 2
  br i1 %rcc.tmp.15, label %if.then.4, label %if.else.4
if.then.4:
  ret i32 3
if.else.4:
  ret i32 0
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.22 = load i32, ptr %current_state..tmp
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 1
  br i1 %rcc.tmp.23, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.25 = load i32, ptr %input..tmp
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %if.then.6, label %if.else.6
if.then.6:
  ret i32 0
if.else.6:
  %rcc.tmp.29 = load i32, ptr %input..tmp
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, 1
  br i1 %rcc.tmp.30, label %if.then.7, label %if.else.7
if.then.7:
  ret i32 4
if.else.7:
  %rcc.tmp.33 = load i32, ptr %input..tmp
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 2
  br i1 %rcc.tmp.34, label %if.then.8, label %if.else.8
if.then.8:
  ret i32 5
if.else.8:
  ret i32 1
if.merge.8:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  %rcc.tmp.41 = load i32, ptr %current_state..tmp
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.41, 2
  br i1 %rcc.tmp.42, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.44 = load i32, ptr %input..tmp
  %rcc.tmp.45 = icmp eq i32 %rcc.tmp.44, 0
  br i1 %rcc.tmp.45, label %if.then.10, label %if.else.10
if.then.10:
  ret i32 6
if.else.10:
  %rcc.tmp.48 = load i32, ptr %input..tmp
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 1
  br i1 %rcc.tmp.49, label %if.then.11, label %if.else.11
if.then.11:
  ret i32 0
if.else.11:
  %rcc.tmp.52 = load i32, ptr %input..tmp
  %rcc.tmp.53 = icmp eq i32 %rcc.tmp.52, 2
  br i1 %rcc.tmp.53, label %if.then.12, label %if.else.12
if.then.12:
  ret i32 7
if.else.12:
  ret i32 2
if.merge.12:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.else.9:
  %rcc.tmp.60 = load i32, ptr %current_state..tmp
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 3
  br i1 %rcc.tmp.61, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.63 = load i32, ptr %input..tmp
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 0
  br i1 %rcc.tmp.64, label %if.then.14, label %if.else.14
if.then.14:
  ret i32 7
if.else.14:
  %rcc.tmp.67 = load i32, ptr %input..tmp
  %rcc.tmp.68 = icmp eq i32 %rcc.tmp.67, 1
  br i1 %rcc.tmp.68, label %if.then.15, label %if.else.15
if.then.15:
  ret i32 6
if.else.15:
  %rcc.tmp.71 = load i32, ptr %input..tmp
  %rcc.tmp.72 = icmp eq i32 %rcc.tmp.71, 2
  br i1 %rcc.tmp.72, label %if.then.16, label %if.else.16
if.then.16:
  ret i32 0
if.else.16:
  ret i32 3
if.merge.16:
  br label %if.merge.15
if.merge.15:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.13
if.else.13:
  %rcc.tmp.79 = load i32, ptr %current_state..tmp
  %rcc.tmp.80 = icmp eq i32 %rcc.tmp.79, 4
  br i1 %rcc.tmp.80, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.82 = load i32, ptr %input..tmp
  %rcc.tmp.83 = icmp eq i32 %rcc.tmp.82, 0
  br i1 %rcc.tmp.83, label %if.then.18, label %if.else.18
if.then.18:
  ret i32 2
if.else.18:
  %rcc.tmp.86 = load i32, ptr %input..tmp
  %rcc.tmp.87 = icmp eq i32 %rcc.tmp.86, 1
  br i1 %rcc.tmp.87, label %if.then.19, label %if.else.19
if.then.19:
  ret i32 1
if.else.19:
  %rcc.tmp.90 = load i32, ptr %input..tmp
  %rcc.tmp.91 = icmp eq i32 %rcc.tmp.90, 2
  br i1 %rcc.tmp.91, label %if.then.20, label %if.else.20
if.then.20:
  ret i32 4
if.else.20:
  ret i32 5
if.merge.20:
  br label %if.merge.19
if.merge.19:
  br label %if.merge.18
if.merge.18:
  br label %if.merge.17
if.else.17:
  %rcc.tmp.98 = load i32, ptr %current_state..tmp
  %rcc.tmp.99 = icmp eq i32 %rcc.tmp.98, 5
  br i1 %rcc.tmp.99, label %if.then.21, label %if.else.21
if.then.21:
  %rcc.tmp.101 = load i32, ptr %input..tmp
  %rcc.tmp.102 = icmp eq i32 %rcc.tmp.101, 0
  br i1 %rcc.tmp.102, label %if.then.22, label %if.else.22
if.then.22:
  ret i32 4
if.else.22:
  %rcc.tmp.105 = load i32, ptr %input..tmp
  %rcc.tmp.106 = icmp eq i32 %rcc.tmp.105, 1
  br i1 %rcc.tmp.106, label %if.then.23, label %if.else.23
if.then.23:
  ret i32 3
if.else.23:
  %rcc.tmp.109 = load i32, ptr %input..tmp
  %rcc.tmp.110 = icmp eq i32 %rcc.tmp.109, 2
  br i1 %rcc.tmp.110, label %if.then.24, label %if.else.24
if.then.24:
  ret i32 1
if.else.24:
  ret i32 6
if.merge.24:
  br label %if.merge.23
if.merge.23:
  br label %if.merge.22
if.merge.22:
  br label %if.merge.21
if.else.21:
  %rcc.tmp.117 = load i32, ptr %current_state..tmp
  %rcc.tmp.118 = icmp eq i32 %rcc.tmp.117, 6
  br i1 %rcc.tmp.118, label %if.then.25, label %if.else.25
if.then.25:
  %rcc.tmp.120 = load i32, ptr %input..tmp
  %rcc.tmp.121 = icmp eq i32 %rcc.tmp.120, 0
  br i1 %rcc.tmp.121, label %if.then.26, label %if.else.26
if.then.26:
  ret i32 5
if.else.26:
  %rcc.tmp.124 = load i32, ptr %input..tmp
  %rcc.tmp.125 = icmp eq i32 %rcc.tmp.124, 1
  br i1 %rcc.tmp.125, label %if.then.27, label %if.else.27
if.then.27:
  ret i32 7
if.else.27:
  %rcc.tmp.128 = load i32, ptr %input..tmp
  %rcc.tmp.129 = icmp eq i32 %rcc.tmp.128, 2
  br i1 %rcc.tmp.129, label %if.then.28, label %if.else.28
if.then.28:
  ret i32 2
if.else.28:
  ret i32 4
if.merge.28:
  br label %if.merge.27
if.merge.27:
  br label %if.merge.26
if.merge.26:
  br label %if.merge.25
if.else.25:
  %rcc.tmp.136 = load i32, ptr %input..tmp
  %rcc.tmp.137 = icmp eq i32 %rcc.tmp.136, 0
  br i1 %rcc.tmp.137, label %if.then.29, label %if.else.29
if.then.29:
  ret i32 3
if.else.29:
  %rcc.tmp.140 = load i32, ptr %input..tmp
  %rcc.tmp.141 = icmp eq i32 %rcc.tmp.140, 1
  br i1 %rcc.tmp.141, label %if.then.30, label %if.else.30
if.then.30:
  ret i32 5
if.else.30:
  %rcc.tmp.144 = load i32, ptr %input..tmp
  %rcc.tmp.145 = icmp eq i32 %rcc.tmp.144, 2
  br i1 %rcc.tmp.145, label %if.then.31, label %if.else.31
if.then.31:
  ret i32 6
if.else.31:
  ret i32 7
if.merge.31:
  br label %if.merge.30
if.merge.30:
  br label %if.merge.29
if.merge.29:
  br label %if.merge.25
if.merge.25:
  br label %if.merge.21
if.merge.21:
  br label %if.merge.17
if.merge.17:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.5
if.merge.5:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @isAcceptingState.(i32 %state.tmp) {
entry:
  %state..tmp = alloca i32 
  store i32 %state.tmp, ptr %state..tmp
  %rcc.tmp.2 = load i32, ptr %state..tmp
  %rcc.tmp.3 = icmp eq i32 %rcc.tmp.2, 3
  br i1 %rcc.tmp.3, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.5 = load i32, ptr %state..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 5
  br label %sc.merge
sc.merge:
  %rcc.tmp.8 = phi i1 [1, %entry], [%rcc.tmp.6, %or.rhs]
  br i1 %rcc.tmp.8, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.10 = load i32, ptr %state..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 7
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.13 = phi i1 [1, %sc.merge], [%rcc.tmp.11, %or.rhs.2]
  %rcc.tmp.14 = zext i1 %rcc.tmp.13 to i32
  ret i32 %rcc.tmp.14
}
define i32 @trafficLightSimulation.() {
entry:
  %simulation_time = alloca i32 
  %north_south_state = alloca i32 
  %east_west_state = alloca i32 
  %time_in_state = alloca i32 
  %state_changes = alloca i32 
  %time = alloca i32 
  %new_ns_state = alloca i32 
  %new_ew_state = alloca i32 
  store i32 1000, ptr %simulation_time
  store i32 0, ptr %north_south_state
  store i32 2, ptr %east_west_state
  store i32 0, ptr %time_in_state
  store i32 0, ptr %state_changes
  store i32 0, ptr %time
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %time
  %rcc.tmp.9 = load i32, ptr %simulation_time
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %time_in_state
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %time_in_state
  %rcc.tmp.16 = load i32, ptr %north_south_state
  %rcc.tmp.17 = load i32, ptr %east_west_state
  %rcc.tmp.18 = load i32, ptr %time_in_state
  %rcc.tmp.19 = load i32, ptr %time
  %rcc.tmp.20 = call i32 @shouldChangeState.(i32 %rcc.tmp.16, i32 %rcc.tmp.17, i32 %rcc.tmp.18, i32 %rcc.tmp.19)
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.20, 1
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load i32, ptr %north_south_state
  %rcc.tmp.24 = call i32 @getNextTrafficState.(i32 %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %new_ns_state
  %rcc.tmp.26 = load i32, ptr %east_west_state
  %rcc.tmp.27 = call i32 @getNextTrafficState.(i32 %rcc.tmp.26)
  store i32 %rcc.tmp.27, ptr %new_ew_state
  %rcc.tmp.29 = load i32, ptr %new_ns_state
  store i32 %rcc.tmp.29, ptr %north_south_state
  %rcc.tmp.31 = load i32, ptr %new_ew_state
  store i32 %rcc.tmp.31, ptr %east_west_state
  store i32 0, ptr %time_in_state
  %rcc.tmp.34 = load i32, ptr %state_changes
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %state_changes
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.39 = load i32, ptr %time
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %time
  br label %while.cond
while.end:
  %rcc.tmp.43 = load i32, ptr %state_changes
  ret i32 %rcc.tmp.43
}
define i32 @shouldChangeState.(i32 %ns_state.tmp, i32 %ew_state.tmp, i32 %time_in_state.tmp, i32 %current_time.tmp) {
entry:
  %ns_state..tmp = alloca i32 
  %ew_state..tmp = alloca i32 
  %time_in_state..tmp = alloca i32 
  %current_time..tmp = alloca i32 
  %traffic_factor = alloca i32 
  %green_duration = alloca i32 
  %red_duration = alloca i32 
  store i32 %ns_state.tmp, ptr %ns_state..tmp
  store i32 %ew_state.tmp, ptr %ew_state..tmp
  store i32 %time_in_state.tmp, ptr %time_in_state..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  %rcc.tmp.5 = load i32, ptr %current_time..tmp
  %rcc.tmp.6 = srem i32 %rcc.tmp.5, 100
  %rcc.tmp.7 = sdiv i32 %rcc.tmp.6, 10
  store i32 %rcc.tmp.7, ptr %traffic_factor
  %rcc.tmp.9 = load i32, ptr %ns_state..tmp
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 2
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %traffic_factor
  %rcc.tmp.13 = add i32 30, %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %green_duration
  %rcc.tmp.15 = load i32, ptr %time_in_state..tmp
  %rcc.tmp.16 = load i32, ptr %green_duration
  %rcc.tmp.17 = icmp sge i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = zext i1 %rcc.tmp.17 to i32
  ret i32 %rcc.tmp.18
if.else:
  %rcc.tmp.20 = load i32, ptr %ns_state..tmp
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.20, 1
  br i1 %rcc.tmp.21, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.23 = load i32, ptr %time_in_state..tmp
  %rcc.tmp.24 = icmp sge i32 %rcc.tmp.23, 5
  %rcc.tmp.25 = zext i1 %rcc.tmp.24 to i32
  ret i32 %rcc.tmp.25
if.else.2:
  %rcc.tmp.27 = load i32, ptr %traffic_factor
  %rcc.tmp.28 = add i32 35, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %red_duration
  %rcc.tmp.30 = load i32, ptr %time_in_state..tmp
  %rcc.tmp.31 = load i32, ptr %red_duration
  %rcc.tmp.32 = icmp sge i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = zext i1 %rcc.tmp.32 to i32
  ret i32 %rcc.tmp.33
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @getNextTrafficState.(i32 %current_state.tmp) {
entry:
  %current_state..tmp = alloca i32 
  store i32 %current_state.tmp, ptr %current_state..tmp
  %rcc.tmp.2 = load i32, ptr %current_state..tmp
  %rcc.tmp.3 = icmp eq i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 2
if.else:
  %rcc.tmp.6 = load i32, ptr %current_state..tmp
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 1
  br i1 %rcc.tmp.7, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  ret i32 1
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define void @performSearchAlgorithms.() {
entry:
  %binary_result = alloca i32 
  %pattern_result = alloca i32 
  call void @printlnInt.(i32 2009)
  %rcc.tmp.2 = call i32 @performBinarySearchTests.()
  store i32 %rcc.tmp.2, ptr %binary_result
  %rcc.tmp.4 = load i32, ptr %binary_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @performPatternMatching.()
  store i32 %rcc.tmp.6, ptr %pattern_result
  %rcc.tmp.8 = load i32, ptr %pattern_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  call void @printlnInt.(i32 2010)
  ret void
}
define i32 @performBinarySearchTests.() {
entry:
  %array_size = alloca i32 
  %sorted_array = alloca [500 x i32] 
  %fill.idx = alloca i32 
  %search_results = alloca i32 
  %target = alloca i32 
  %result = alloca i32 
  %result.2 = alloca i32 
  %result.3 = alloca i32 
  store i32 500, ptr %array_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [500 x i32], ptr %sorted_array, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %search_results
  %rcc.tmp.14 = load i32, ptr %array_size
  call void @initializeSortedArray.([500 x i32]* %sorted_array, i32 %rcc.tmp.14)
  store i32 0, ptr %target
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %target
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 100
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %array_size
  %rcc.tmp.23 = load i32, ptr %target
  %rcc.tmp.24 = mul i32 %rcc.tmp.23, 10
  %rcc.tmp.25 = call i32 @binarySearch.([500 x i32]* %sorted_array, i32 %rcc.tmp.22, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %result
  %rcc.tmp.27 = load i32, ptr %result
  %rcc.tmp.28 = sub i32 0, 1
  %rcc.tmp.29 = icmp ne i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %search_results
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %search_results
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %target
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %target
  br label %while.cond
while.end:
  store i32 0, ptr %target
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.42 = load i32, ptr %target
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 50
  br i1 %rcc.tmp.43, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.46 = load i32, ptr %array_size
  %rcc.tmp.47 = load i32, ptr %target
  %rcc.tmp.48 = mul i32 %rcc.tmp.47, 20
  %rcc.tmp.49 = call i32 @binarySearchFirst.([500 x i32]* %sorted_array, i32 %rcc.tmp.46, i32 %rcc.tmp.48)
  store i32 %rcc.tmp.49, ptr %result.2
  %rcc.tmp.51 = load i32, ptr %result.2
  %rcc.tmp.52 = sub i32 0, 1
  %rcc.tmp.53 = icmp ne i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.55 = load i32, ptr %result.2
  %rcc.tmp.56 = load i32, ptr %search_results
  %rcc.tmp.57 = add i32 %rcc.tmp.56, %rcc.tmp.55
  store i32 %rcc.tmp.57, ptr %search_results
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.61 = load i32, ptr %target
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %target
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %target
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.67 = load i32, ptr %target
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.67, 50
  br i1 %rcc.tmp.68, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.71 = load i32, ptr %array_size
  %rcc.tmp.72 = load i32, ptr %target
  %rcc.tmp.73 = mul i32 %rcc.tmp.72, 20
  %rcc.tmp.74 = call i32 @binarySearchLast.([500 x i32]* %sorted_array, i32 %rcc.tmp.71, i32 %rcc.tmp.73)
  store i32 %rcc.tmp.74, ptr %result.3
  %rcc.tmp.76 = load i32, ptr %result.3
  %rcc.tmp.77 = sub i32 0, 1
  %rcc.tmp.78 = icmp ne i32 %rcc.tmp.76, %rcc.tmp.77
  br i1 %rcc.tmp.78, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.80 = load i32, ptr %result.3
  %rcc.tmp.81 = load i32, ptr %search_results
  %rcc.tmp.82 = add i32 %rcc.tmp.81, %rcc.tmp.80
  store i32 %rcc.tmp.82, ptr %search_results
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.86 = load i32, ptr %target
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %target
  br label %while.cond.3
while.end.3:
  %rcc.tmp.90 = load i32, ptr %search_results
  %rcc.tmp.91 = srem i32 %rcc.tmp.90, 10000
  ret i32 %rcc.tmp.91
}
define void @initializeSortedArray.([500 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..tmp = alloca [500 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [500 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load [500 x i32]*, ptr %arr..tmp
  %rcc.tmp.12 = getelementptr [500 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = sdiv i32 %rcc.tmp.13, 5
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 10
  store i32 %rcc.tmp.15, ptr %rcc.tmp.12
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @binarySearch.([500 x i32]* %arr.tmp, i32 %size.tmp, i32 %target.tmp) {
entry:
  %arr..local = alloca [500 x i32] 
  %size..tmp = alloca i32 
  %target..tmp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %mid = alloca i32 
  %rcc.tmp.1 = bitcast [500 x i32]* %arr..local to i8*
  %rcc.tmp.2 = bitcast [500 x i32]* %arr.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 2000, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 %target.tmp, ptr %target..tmp
  store i32 0, ptr %left
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  store i32 %rcc.tmp.9, ptr %right
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %left
  %rcc.tmp.13 = load i32, ptr %right
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %left
  %rcc.tmp.18 = load i32, ptr %right
  %rcc.tmp.19 = load i32, ptr %left
  %rcc.tmp.20 = sub i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = sdiv i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = add i32 %rcc.tmp.17, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %mid
  %rcc.tmp.24 = load i32, ptr %mid
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [500 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %target..tmp
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %mid
  ret i32 %rcc.tmp.31
if.else:
  %rcc.tmp.33 = load i32, ptr %mid
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [500 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %target..tmp
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %mid
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %left
  br label %if.merge.2
if.else.2:
  %rcc.tmp.44 = load i32, ptr %mid
  %rcc.tmp.45 = sub i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %right
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.50 = sub i32 0, 1
  ret i32 %rcc.tmp.50
}
define i32 @binarySearchFirst.([500 x i32]* %arr.tmp, i32 %size.tmp, i32 %target.tmp) {
entry:
  %arr..local = alloca [500 x i32] 
  %size..tmp = alloca i32 
  %target..tmp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %result = alloca i32 
  %mid = alloca i32 
  %rcc.tmp.1 = bitcast [500 x i32]* %arr..local to i8*
  %rcc.tmp.2 = bitcast [500 x i32]* %arr.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 2000, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 %target.tmp, ptr %target..tmp
  store i32 0, ptr %left
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  store i32 %rcc.tmp.9, ptr %right
  %rcc.tmp.11 = sub i32 0, 1
  store i32 %rcc.tmp.11, ptr %result
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %left
  %rcc.tmp.15 = load i32, ptr %right
  %rcc.tmp.16 = icmp sle i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %left
  %rcc.tmp.20 = load i32, ptr %right
  %rcc.tmp.21 = load i32, ptr %left
  %rcc.tmp.22 = sub i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = sdiv i32 %rcc.tmp.22, 2
  %rcc.tmp.24 = add i32 %rcc.tmp.19, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %mid
  %rcc.tmp.26 = load i32, ptr %mid
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [500 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %target..tmp
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then, label %if.else
if.then:
  %rcc.tmp.33 = load i32, ptr %mid
  store i32 %rcc.tmp.33, ptr %result
  %rcc.tmp.35 = load i32, ptr %mid
  %rcc.tmp.36 = sub i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %right
  br label %if.merge
if.else:
  %rcc.tmp.39 = load i32, ptr %mid
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [500 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %target..tmp
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.42, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load i32, ptr %mid
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %left
  br label %if.merge.2
if.else.2:
  %rcc.tmp.50 = load i32, ptr %mid
  %rcc.tmp.51 = sub i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %right
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.56 = load i32, ptr %result
  ret i32 %rcc.tmp.56
}
define i32 @binarySearchLast.([500 x i32]* %arr.tmp, i32 %size.tmp, i32 %target.tmp) {
entry:
  %arr..local = alloca [500 x i32] 
  %size..tmp = alloca i32 
  %target..tmp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %result = alloca i32 
  %mid = alloca i32 
  %rcc.tmp.1 = bitcast [500 x i32]* %arr..local to i8*
  %rcc.tmp.2 = bitcast [500 x i32]* %arr.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 2000, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 %target.tmp, ptr %target..tmp
  store i32 0, ptr %left
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  store i32 %rcc.tmp.9, ptr %right
  %rcc.tmp.11 = sub i32 0, 1
  store i32 %rcc.tmp.11, ptr %result
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %left
  %rcc.tmp.15 = load i32, ptr %right
  %rcc.tmp.16 = icmp sle i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %left
  %rcc.tmp.20 = load i32, ptr %right
  %rcc.tmp.21 = load i32, ptr %left
  %rcc.tmp.22 = sub i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = sdiv i32 %rcc.tmp.22, 2
  %rcc.tmp.24 = add i32 %rcc.tmp.19, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %mid
  %rcc.tmp.26 = load i32, ptr %mid
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [500 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %target..tmp
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then, label %if.else
if.then:
  %rcc.tmp.33 = load i32, ptr %mid
  store i32 %rcc.tmp.33, ptr %result
  %rcc.tmp.35 = load i32, ptr %mid
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %left
  br label %if.merge
if.else:
  %rcc.tmp.39 = load i32, ptr %mid
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [500 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %target..tmp
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.42, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load i32, ptr %mid
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %left
  br label %if.merge.2
if.else.2:
  %rcc.tmp.50 = load i32, ptr %mid
  %rcc.tmp.51 = sub i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %right
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.56 = load i32, ptr %result
  ret i32 %rcc.tmp.56
}
define i32 @performPatternMatching.() {
entry:
  %text_length = alloca i32 
  %pattern_length = alloca i32 
  %text = alloca [200 x i32] 
  %fill.idx = alloca i32 
  %pattern = alloca [10 x i32] 
  %naive_matches = alloca i32 
  %kmp_matches = alloca i32 
  store i32 200, ptr %text_length
  store i32 10, ptr %pattern_length
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 200
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [200 x i32], ptr %text, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %text_length
  %rcc.tmp.35 = load i32, ptr %pattern_length
  call void @initializeTextAndPattern.([200 x i32]* %text, [10 x i32]* %pattern, i32 %rcc.tmp.34, i32 %rcc.tmp.35)
  %rcc.tmp.37 = load i32, ptr %text_length
  %rcc.tmp.38 = load i32, ptr %pattern_length
  %rcc.tmp.39 = call i32 @naivePatternMatching.([200 x i32]* %text, [10 x i32]* %pattern, i32 %rcc.tmp.37, i32 %rcc.tmp.38)
  store i32 %rcc.tmp.39, ptr %naive_matches
  %rcc.tmp.41 = load i32, ptr %text_length
  %rcc.tmp.42 = load i32, ptr %pattern_length
  %rcc.tmp.43 = call i32 @kmpPatternMatching.([200 x i32]* %text, [10 x i32]* %pattern, i32 %rcc.tmp.41, i32 %rcc.tmp.42)
  store i32 %rcc.tmp.43, ptr %kmp_matches
  %rcc.tmp.45 = load i32, ptr %naive_matches
  %rcc.tmp.46 = load i32, ptr %kmp_matches
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  ret i32 %rcc.tmp.47
}
define void @initializeTextAndPattern.([200 x i32]* %text.tmp, [10 x i32]* %pattern.tmp, i32 %text_len.tmp, i32 %pattern_len.tmp) {
entry:
  %text..tmp = alloca [200 x i32]* 
  %pattern..tmp = alloca [10 x i32]* 
  %text_len..tmp = alloca i32 
  %pattern_len..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  store [200 x i32]* %text.tmp, ptr %text..tmp
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store i32 24681, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %text_len..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update.(i32* %seed)
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load [200 x i32]*, ptr %text..tmp
  %rcc.tmp.16 = getelementptr [200 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %seed
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 5
  store i32 %rcc.tmp.18, ptr %rcc.tmp.16
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  call void @update.(i32* %seed)
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %seed
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 5
  store i32 %rcc.tmp.36, ptr %rcc.tmp.34
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @naivePatternMatching.([200 x i32]* %text.tmp, [10 x i32]* %pattern.tmp, i32 %text_len.tmp, i32 %pattern_len.tmp) {
entry:
  %text..tmp = alloca [200 x i32]* 
  %pattern..tmp = alloca [10 x i32]* 
  %text_len..tmp = alloca i32 
  %pattern_len..tmp = alloca i32 
  %matches = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %match_found = alloca i32 
  store [200 x i32]* %text.tmp, ptr %text..tmp
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store i32 0, ptr %matches
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %text_len..tmp
  %rcc.tmp.10 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.9, %rcc.tmp.10
  %rcc.tmp.12 = icmp sle i32 %rcc.tmp.8, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i32 1, ptr %match_found
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = add i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = load [200 x i32]*, ptr %text..tmp
  %rcc.tmp.27 = getelementptr [200 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp ne i32 %rcc.tmp.28, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %if.then, label %if.else
if.then:
  store i32 0, ptr %match_found
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.42 = load i32, ptr %match_found
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.42, 1
  br i1 %rcc.tmp.43, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.45 = load i32, ptr %matches
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %matches
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.54 = load i32, ptr %matches
  ret i32 %rcc.tmp.54
}
define i32 @kmpPatternMatching.([200 x i32]* %text.tmp, [10 x i32]* %pattern.tmp, i32 %text_len.tmp, i32 %pattern_len.tmp) {
entry:
  %text..tmp = alloca [200 x i32]* 
  %pattern..tmp = alloca [10 x i32]* 
  %text_len..tmp = alloca i32 
  %pattern_len..tmp = alloca i32 
  %lps = alloca [10 x i32] 
  %matches = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [200 x i32]* %text.tmp, ptr %text..tmp
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  %rcc.tmp.5 = getelementptr [10 x i32], ptr %lps, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %lps, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [10 x i32], ptr %lps, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [10 x i32], ptr %lps, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [10 x i32], ptr %lps, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %lps, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [10 x i32], ptr %lps, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %lps, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [10 x i32], ptr %lps, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %lps, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.23
  store i32 0, ptr %matches
  %rcc.tmp.26 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.27 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.28 = bitcast [10 x i32]* %lps to [10 x i32]*
  call void @computeLPSArray.([10 x i32]* %rcc.tmp.26, i32 %rcc.tmp.27, [10 x i32]* %rcc.tmp.28)
  store i32 0, ptr %i
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = load i32, ptr %text_len..tmp
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.40 = getelementptr [10 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = load [200 x i32]*, ptr %text..tmp
  %rcc.tmp.44 = getelementptr [200 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.41, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then, label %if.else
if.then:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %j
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.60 = load i32, ptr %matches
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %matches
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = sub i32 %rcc.tmp.63, 1
  %rcc.tmp.65 = getelementptr [10 x i32], ptr %lps, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %j
  br label %if.merge.2
if.else.2:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = load i32, ptr %text_len..tmp
  %rcc.tmp.71 = icmp slt i32 %rcc.tmp.69, %rcc.tmp.70
  br i1 %rcc.tmp.71, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.75 = getelementptr [10 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = load [200 x i32]*, ptr %text..tmp
  %rcc.tmp.79 = getelementptr [200 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = icmp ne i32 %rcc.tmp.76, %rcc.tmp.80
  br label %sc.merge
sc.merge:
  %rcc.tmp.83 = phi i1 [0, %if.else.2], [%rcc.tmp.81, %and.rhs]
  br i1 %rcc.tmp.83, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = icmp ne i32 %rcc.tmp.85, 0
  br i1 %rcc.tmp.86, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.88 = load i32, ptr %j
  %rcc.tmp.89 = sub i32 %rcc.tmp.88, 1
  %rcc.tmp.90 = getelementptr [10 x i32], ptr %lps, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %j
  br label %if.merge.4
if.else.4:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %i
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.102 = load i32, ptr %matches
  ret i32 %rcc.tmp.102
}
define void @computeLPSArray.([10 x i32]* %pattern.tmp, i32 %pattern_len.tmp, [10 x i32]* %lps.tmp) {
entry:
  %pattern..tmp = alloca [10 x i32]* 
  %pattern_len..tmp = alloca i32 
  %lps..tmp = alloca [10 x i32]* 
  %len = alloca i32 
  %i = alloca i32 
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store [10 x i32]* %lps.tmp, ptr %lps..tmp
  store i32 0, ptr %len
  store i32 1, ptr %i
  %rcc.tmp.6 = load [10 x i32]*, ptr %lps..tmp
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %rcc.tmp.6, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.7
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.17 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %len
  %rcc.tmp.20 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.21 = getelementptr [10 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  %rcc.tmp.25 = load i32, ptr %len
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %len
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load [10 x i32]*, ptr %lps..tmp
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %len
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.37 = load i32, ptr %len
  %rcc.tmp.38 = icmp ne i32 %rcc.tmp.37, 0
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %len
  %rcc.tmp.41 = sub i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = load [10 x i32]*, ptr %lps..tmp
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %len
  br label %if.merge.2
if.else.2:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = load [10 x i32]*, ptr %lps..tmp
  %rcc.tmp.49 = getelementptr [10 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  ret void
}
define void @update.(i32* %seed.tmp) {
entry:
  %seed..tmp = alloca i32* 
  store i32* %seed.tmp, ptr %seed..tmp
  %rcc.tmp.2 = load i32*, ptr %seed..tmp
  %rcc.tmp.3 = load i32*, ptr %seed..tmp
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 1103
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 4721
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 1048583
  store i32 %rcc.tmp.7, ptr %rcc.tmp.2
  %rcc.tmp.9 = load i32*, ptr %seed..tmp
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  %rcc.tmp.13 = load i32*, ptr %seed..tmp
  %rcc.tmp.14 = load i32*, ptr %seed..tmp
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = sub i32 0, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %rcc.tmp.13
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
