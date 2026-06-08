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
  call void @printlnInt.(i32 1800)
  call void @testClassicDynamicProgramming.()
  call void @testSequenceAlignmentDP.()
  call void @testOptimizationProblems.()
  call void @testGameTheoryDP.()
  call void @testAdvancedDPPatterns.()
  call void @printlnInt.(i32 1899)
  call void @exit.(i32 0)
  ret void
}
define void @testClassicDynamicProgramming.() {
entry:
  %fib_result = alloca i32 
  %sequence = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %lis_result = alloca i32 
  %coin_change_result = alloca i32 
  %array = alloca [150 x i32] 
  %fill.idx.2 = alloca i32 
  %max_sum_result = alloca i32 
  %robber_result = alloca i32 
  call void @printlnInt.(i32 1801)
  %rcc.tmp.2 = call i32 @fibonacciDP.(i32 45)
  store i32 %rcc.tmp.2, ptr %fib_result
  %rcc.tmp.4 = load i32, ptr %fib_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 100
  br i1 %rcc.tmp.9, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = getelementptr [100 x i32], ptr %sequence, i32 0, i32 %rcc.tmp.11
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.14, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeSequence.([100 x i32]* %sequence, i32 100)
  %rcc.tmp.18 = call i32 @longestIncreasingSubsequence.([100 x i32]* %sequence, i32 100)
  store i32 %rcc.tmp.18, ptr %lis_result
  %rcc.tmp.20 = load i32, ptr %lis_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @coinChangeDP.(i32 247)
  store i32 %rcc.tmp.22, ptr %coin_change_result
  %rcc.tmp.24 = load i32, ptr %coin_change_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.28 = load i32, ptr %fill.idx.2
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 150
  br i1 %rcc.tmp.29, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.31 = load i32, ptr %fill.idx.2
  %rcc.tmp.32 = getelementptr [150 x i32], ptr %array, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.34, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  call void @initializeArray.([150 x i32]* %array, i32 150)
  %rcc.tmp.38 = call i32 @maximumSubarraySum.([150 x i32]* %array, i32 150)
  store i32 %rcc.tmp.38, ptr %max_sum_result
  %rcc.tmp.40 = load i32, ptr %max_sum_result
  call void @printlnInt.(i32 %rcc.tmp.40)
  %rcc.tmp.42 = call i32 @houseRobberDP.([150 x i32]* %array, i32 150)
  store i32 %rcc.tmp.42, ptr %robber_result
  %rcc.tmp.44 = load i32, ptr %robber_result
  call void @printlnInt.(i32 %rcc.tmp.44)
  call void @printlnInt.(i32 1802)
  ret void
}
define i32 @fibonacciDP.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %dp = alloca [46 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 1
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %n..tmp
  ret i32 %rcc.tmp.5
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 46
  br i1 %rcc.tmp.11, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.13 = load i32, ptr %fill.idx
  %rcc.tmp.14 = getelementptr [46 x i32], ptr %dp, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.19 = getelementptr [46 x i32], ptr %dp, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [46 x i32], ptr %dp, i32 0, i32 1
  store i32 1, ptr %rcc.tmp.21
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = load i32, ptr %n..tmp
  %rcc.tmp.27 = icmp sle i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [46 x i32], ptr %dp, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = sub i32 %rcc.tmp.33, 1
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [46 x i32], ptr %dp, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = sub i32 %rcc.tmp.38, 2
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [46 x i32], ptr %dp, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.37, %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %rcc.tmp.32
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %n..tmp
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [46 x i32], ptr %dp, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  ret i32 %rcc.tmp.52
}
define void @initializeSequence.([100 x i32]* %sequence.tmp, i32 %size.tmp) {
entry:
  %sequence..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %sequence..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %sequence.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 145, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %seed
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 1664
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 101223
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 214647
  store i32 %rcc.tmp.16, ptr %seed
  %rcc.tmp.18 = load i32, ptr %seed
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = sub i32 0, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [100 x i32], ptr %sequence..local, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %seed
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 1000
  store i32 %rcc.tmp.30, ptr %rcc.tmp.28
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @longestIncreasingSubsequence.([100 x i32]* %sequence.tmp, i32 %size.tmp) {
entry:
  %sequence..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %dp = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %max_length = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %sequence..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %sequence.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 100
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.10
  store i32 1, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 1, ptr %max_length
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [100 x i32], ptr %sequence..local, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [100 x i32], ptr %sequence..local, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.41 = load i32, ptr %j
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp sgt i32 %rcc.tmp.45, %rcc.tmp.49
  br label %sc.merge
sc.merge:
  %rcc.tmp.52 = phi i1 [0, %while.body.2], [%rcc.tmp.50, %and.rhs]
  br i1 %rcc.tmp.52, label %if.then, label %if.else
if.then:
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %rcc.tmp.56
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %max_length
  %rcc.tmp.74 = icmp sgt i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  store i32 %rcc.tmp.79, ptr %max_length
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.87 = load i32, ptr %max_length
  ret i32 %rcc.tmp.87
}
define i32 @coinChangeDP.(i32 %amount.tmp) {
entry:
  %amount..tmp = alloca i32 
  %coins = alloca [5 x i32] 
  %dp = alloca [248 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %coin_idx = alloca i32 
  %coin = alloca i32 
  store i32 %amount.tmp, ptr %amount..tmp
  %rcc.tmp.2 = getelementptr [5 x i32], ptr %coins, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [5 x i32], ptr %coins, i32 0, i32 1
  store i32 5, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [5 x i32], ptr %coins, i32 0, i32 2
  store i32 10, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [5 x i32], ptr %coins, i32 0, i32 3
  store i32 25, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [5 x i32], ptr %coins, i32 0, i32 4
  store i32 50, ptr %rcc.tmp.10
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.14 = load i32, ptr %fill.idx
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 248
  br i1 %rcc.tmp.15, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.17 = load i32, ptr %fill.idx
  %rcc.tmp.18 = getelementptr [248 x i32], ptr %dp, i32 0, i32 %rcc.tmp.17
  store i32 9999, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.23 = getelementptr [248 x i32], ptr %dp, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.23
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = load i32, ptr %amount..tmp
  %rcc.tmp.29 = icmp sle i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %coin_idx
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %coin_idx
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.34, 5
  br i1 %rcc.tmp.35, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.38 = load i32, ptr %coin_idx
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [5 x i32], ptr %coins, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %coin
  %rcc.tmp.43 = load i32, ptr %coin
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = icmp sle i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = load i32, ptr %coin
  %rcc.tmp.49 = sub i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [248 x i32], ptr %dp, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [248 x i32], ptr %dp, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.53, %rcc.tmp.57
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %while.body.2], [%rcc.tmp.58, %and.rhs]
  br i1 %rcc.tmp.60, label %if.then, label %if.else
if.then:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [248 x i32], ptr %dp, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = load i32, ptr %coin
  %rcc.tmp.67 = sub i32 %rcc.tmp.65, %rcc.tmp.66
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [248 x i32], ptr %dp, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %rcc.tmp.64
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.75 = load i32, ptr %coin_idx
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %coin_idx
  br label %while.cond.2
while.end.2:
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.83 = load i32, ptr %amount..tmp
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [248 x i32], ptr %dp, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  ret i32 %rcc.tmp.86
}
define void @initializeArray.([150 x i32]* %array.tmp, i32 %size.tmp) {
entry:
  %array..local = alloca [150 x i32] 
  %size..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [150 x i32]* %array..local to i8*
  %rcc.tmp.2 = bitcast [150 x i32]* %array.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 600, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 321, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %seed
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 1665
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 904223
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 143647
  store i32 %rcc.tmp.16, ptr %seed
  %rcc.tmp.18 = load i32, ptr %seed
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = sub i32 0, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 3
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %seed
  %rcc.tmp.34 = srem i32 %rcc.tmp.33, 100
  %rcc.tmp.35 = sub i32 0, %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %rcc.tmp.32
  br label %if.merge.2
if.else.2:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %seed
  %rcc.tmp.42 = srem i32 %rcc.tmp.41, 100
  store i32 %rcc.tmp.42, ptr %rcc.tmp.40
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @maximumSubarraySum.([150 x i32]* %array.tmp, i32 %size.tmp) {
entry:
  %array..local = alloca [150 x i32] 
  %size..tmp = alloca i32 
  %max_so_far = alloca i32 
  %max_ending_here = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [150 x i32]* %array..local to i8*
  %rcc.tmp.2 = bitcast [150 x i32]* %array.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 600, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.5 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.6, ptr %max_so_far
  %rcc.tmp.8 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 0
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %max_ending_here
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %max_ending_here
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.18, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.23, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %max_ending_here
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.30, %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %max_ending_here
  br label %if.merge
if.else:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [150 x i32], ptr %array..local, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %max_ending_here
  br label %if.merge
if.merge:
  %rcc.tmp.44 = load i32, ptr %max_ending_here
  %rcc.tmp.45 = load i32, ptr %max_so_far
  %rcc.tmp.46 = icmp sgt i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.48 = load i32, ptr %max_ending_here
  store i32 %rcc.tmp.48, ptr %max_so_far
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.56 = load i32, ptr %max_so_far
  ret i32 %rcc.tmp.56
}
define i32 @houseRobberDP.([150 x i32]* %houses.tmp, i32 %size.tmp) {
entry:
  %houses..local = alloca [150 x i32] 
  %size..tmp = alloca i32 
  %dp = alloca [150 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %rob_current = alloca i32 
  %skip_current = alloca i32 
  %rcc.tmp.1 = bitcast [150 x i32]* %houses..local to i8*
  %rcc.tmp.2 = bitcast [150 x i32]* %houses.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 600, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.5 = load i32, ptr %size..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %size..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 0
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  ret i32 %rcc.tmp.14
if.else.2:
  br label %if.merge.2
if.merge.2:
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.19 = load i32, ptr %fill.idx
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 150
  br i1 %rcc.tmp.20, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.22 = load i32, ptr %fill.idx
  %rcc.tmp.23 = getelementptr [150 x i32], ptr %dp, i32 0, i32 %rcc.tmp.22
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.25, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.28 = getelementptr [150 x i32], ptr %dp, i32 0, i32 0
  %rcc.tmp.29 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %rcc.tmp.28
  %rcc.tmp.32 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 1
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.33, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.38 = getelementptr [150 x i32], ptr %dp, i32 0, i32 1
  %rcc.tmp.39 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 1
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %rcc.tmp.38
  br label %if.merge.3
if.else.3:
  %rcc.tmp.43 = getelementptr [150 x i32], ptr %dp, i32 0, i32 1
  %rcc.tmp.44 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 0
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %rcc.tmp.43
  br label %if.merge.3
if.merge.3:
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = load i32, ptr %size..tmp
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = sub i32 %rcc.tmp.55, 2
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [150 x i32], ptr %dp, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [150 x i32], ptr %houses..local, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.59, %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %rob_current
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [150 x i32], ptr %dp, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %skip_current
  %rcc.tmp.72 = load i32, ptr %rob_current
  %rcc.tmp.73 = load i32, ptr %skip_current
  %rcc.tmp.74 = icmp sgt i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [150 x i32], ptr %dp, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %rob_current
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  br label %if.merge.4
if.else.4:
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [150 x i32], ptr %dp, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %skip_current
  store i32 %rcc.tmp.85, ptr %rcc.tmp.84
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.92 = load i32, ptr %size..tmp
  %rcc.tmp.93 = sub i32 %rcc.tmp.92, 1
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [150 x i32], ptr %dp, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  ret i32 %rcc.tmp.96
}
define void @testSequenceAlignmentDP.() {
entry:
  %string1 = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %string2 = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %edit_distance = alloca i32 
  %lcs_result = alloca i32 
  %palindrome_result = alloca i32 
  %reconstruction_result = alloca i32 
  call void @printlnInt.(i32 1803)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 50
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [50 x i32], ptr %string1, i32 0, i32 %rcc.tmp.7
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
  %rcc.tmp.19 = getelementptr [50 x i32], ptr %string2, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  call void @initializeStrings.([50 x i32]* %string1, [50 x i32]* %string2, i32 30, i32 35)
  %rcc.tmp.25 = call i32 @editDistanceDP.([50 x i32]* %string1, [50 x i32]* %string2, i32 30, i32 35)
  store i32 %rcc.tmp.25, ptr %edit_distance
  %rcc.tmp.27 = load i32, ptr %edit_distance
  call void @printlnInt.(i32 %rcc.tmp.27)
  %rcc.tmp.29 = call i32 @longestCommonSubsequenceDP.([50 x i32]* %string1, [50 x i32]* %string2, i32 30, i32 35)
  store i32 %rcc.tmp.29, ptr %lcs_result
  %rcc.tmp.31 = load i32, ptr %lcs_result
  call void @printlnInt.(i32 %rcc.tmp.31)
  %rcc.tmp.33 = call i32 @palindromePartitioningDP.([50 x i32]* %string1, i32 30)
  store i32 %rcc.tmp.33, ptr %palindrome_result
  %rcc.tmp.35 = load i32, ptr %palindrome_result
  call void @printlnInt.(i32 %rcc.tmp.35)
  %rcc.tmp.37 = call i32 @stringReconstructionDP.([50 x i32]* %string1, i32 30)
  store i32 %rcc.tmp.37, ptr %reconstruction_result
  %rcc.tmp.39 = load i32, ptr %reconstruction_result
  call void @printlnInt.(i32 %rcc.tmp.39)
  call void @printlnInt.(i32 1804)
  ret void
}
define void @initializeStrings.([50 x i32]* %string1.tmp, [50 x i32]* %string2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %string1..local = alloca [50 x i32] 
  %string2..local = alloca [50 x i32] 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  %rcc.tmp.121 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 30
  %rcc.tmp.122 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 30
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.123, ptr %rcc.tmp.122
  %rcc.tmp.125 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 31
  %rcc.tmp.126 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 31
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %rcc.tmp.126
  %rcc.tmp.129 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 32
  %rcc.tmp.130 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 32
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %rcc.tmp.130
  %rcc.tmp.133 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 33
  %rcc.tmp.134 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 33
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.135, ptr %rcc.tmp.134
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 34
  %rcc.tmp.138 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 34
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 35
  %rcc.tmp.142 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 35
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  %rcc.tmp.145 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 36
  %rcc.tmp.146 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 36
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  %rcc.tmp.149 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 37
  %rcc.tmp.150 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 37
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 38
  %rcc.tmp.154 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 38
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.155, ptr %rcc.tmp.154
  %rcc.tmp.157 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 39
  %rcc.tmp.158 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 39
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 40
  %rcc.tmp.162 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 40
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 41
  %rcc.tmp.166 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 41
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 42
  %rcc.tmp.170 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 42
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.169
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 43
  %rcc.tmp.174 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 43
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.173
  store i32 %rcc.tmp.175, ptr %rcc.tmp.174
  %rcc.tmp.177 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 44
  %rcc.tmp.178 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 44
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.177
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 45
  %rcc.tmp.182 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 45
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.181
  store i32 %rcc.tmp.183, ptr %rcc.tmp.182
  %rcc.tmp.185 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 46
  %rcc.tmp.186 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 46
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.187, ptr %rcc.tmp.186
  %rcc.tmp.189 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 47
  %rcc.tmp.190 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 47
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.191, ptr %rcc.tmp.190
  %rcc.tmp.193 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 48
  %rcc.tmp.194 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 48
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.195, ptr %rcc.tmp.194
  %rcc.tmp.197 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 49
  %rcc.tmp.198 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 49
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.197
  store i32 %rcc.tmp.199, ptr %rcc.tmp.198
  %rcc.tmp.201 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 0
  %rcc.tmp.202 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 0
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.201
  store i32 %rcc.tmp.203, ptr %rcc.tmp.202
  %rcc.tmp.205 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 1
  %rcc.tmp.206 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 1
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.205
  store i32 %rcc.tmp.207, ptr %rcc.tmp.206
  %rcc.tmp.209 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 2
  %rcc.tmp.210 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 2
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.209
  store i32 %rcc.tmp.211, ptr %rcc.tmp.210
  %rcc.tmp.213 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 3
  %rcc.tmp.214 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 3
  %rcc.tmp.215 = load i32, ptr %rcc.tmp.213
  store i32 %rcc.tmp.215, ptr %rcc.tmp.214
  %rcc.tmp.217 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 4
  %rcc.tmp.218 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 4
  %rcc.tmp.219 = load i32, ptr %rcc.tmp.217
  store i32 %rcc.tmp.219, ptr %rcc.tmp.218
  %rcc.tmp.221 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 5
  %rcc.tmp.222 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 5
  %rcc.tmp.223 = load i32, ptr %rcc.tmp.221
  store i32 %rcc.tmp.223, ptr %rcc.tmp.222
  %rcc.tmp.225 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 6
  %rcc.tmp.226 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 6
  %rcc.tmp.227 = load i32, ptr %rcc.tmp.225
  store i32 %rcc.tmp.227, ptr %rcc.tmp.226
  %rcc.tmp.229 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 7
  %rcc.tmp.230 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 7
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.229
  store i32 %rcc.tmp.231, ptr %rcc.tmp.230
  %rcc.tmp.233 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 8
  %rcc.tmp.234 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 8
  %rcc.tmp.235 = load i32, ptr %rcc.tmp.233
  store i32 %rcc.tmp.235, ptr %rcc.tmp.234
  %rcc.tmp.237 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 9
  %rcc.tmp.238 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 9
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.237
  store i32 %rcc.tmp.239, ptr %rcc.tmp.238
  %rcc.tmp.241 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 10
  %rcc.tmp.242 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 10
  %rcc.tmp.243 = load i32, ptr %rcc.tmp.241
  store i32 %rcc.tmp.243, ptr %rcc.tmp.242
  %rcc.tmp.245 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 11
  %rcc.tmp.246 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 11
  %rcc.tmp.247 = load i32, ptr %rcc.tmp.245
  store i32 %rcc.tmp.247, ptr %rcc.tmp.246
  %rcc.tmp.249 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 12
  %rcc.tmp.250 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 12
  %rcc.tmp.251 = load i32, ptr %rcc.tmp.249
  store i32 %rcc.tmp.251, ptr %rcc.tmp.250
  %rcc.tmp.253 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 13
  %rcc.tmp.254 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 13
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.253
  store i32 %rcc.tmp.255, ptr %rcc.tmp.254
  %rcc.tmp.257 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 14
  %rcc.tmp.258 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 14
  %rcc.tmp.259 = load i32, ptr %rcc.tmp.257
  store i32 %rcc.tmp.259, ptr %rcc.tmp.258
  %rcc.tmp.261 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 15
  %rcc.tmp.262 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 15
  %rcc.tmp.263 = load i32, ptr %rcc.tmp.261
  store i32 %rcc.tmp.263, ptr %rcc.tmp.262
  %rcc.tmp.265 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 16
  %rcc.tmp.266 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 16
  %rcc.tmp.267 = load i32, ptr %rcc.tmp.265
  store i32 %rcc.tmp.267, ptr %rcc.tmp.266
  %rcc.tmp.269 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 17
  %rcc.tmp.270 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 17
  %rcc.tmp.271 = load i32, ptr %rcc.tmp.269
  store i32 %rcc.tmp.271, ptr %rcc.tmp.270
  %rcc.tmp.273 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 18
  %rcc.tmp.274 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 18
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.273
  store i32 %rcc.tmp.275, ptr %rcc.tmp.274
  %rcc.tmp.277 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 19
  %rcc.tmp.278 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 19
  %rcc.tmp.279 = load i32, ptr %rcc.tmp.277
  store i32 %rcc.tmp.279, ptr %rcc.tmp.278
  %rcc.tmp.281 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 20
  %rcc.tmp.282 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 20
  %rcc.tmp.283 = load i32, ptr %rcc.tmp.281
  store i32 %rcc.tmp.283, ptr %rcc.tmp.282
  %rcc.tmp.285 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 21
  %rcc.tmp.286 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 21
  %rcc.tmp.287 = load i32, ptr %rcc.tmp.285
  store i32 %rcc.tmp.287, ptr %rcc.tmp.286
  %rcc.tmp.289 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 22
  %rcc.tmp.290 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 22
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.289
  store i32 %rcc.tmp.291, ptr %rcc.tmp.290
  %rcc.tmp.293 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 23
  %rcc.tmp.294 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 23
  %rcc.tmp.295 = load i32, ptr %rcc.tmp.293
  store i32 %rcc.tmp.295, ptr %rcc.tmp.294
  %rcc.tmp.297 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 24
  %rcc.tmp.298 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 24
  %rcc.tmp.299 = load i32, ptr %rcc.tmp.297
  store i32 %rcc.tmp.299, ptr %rcc.tmp.298
  %rcc.tmp.301 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 25
  %rcc.tmp.302 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 25
  %rcc.tmp.303 = load i32, ptr %rcc.tmp.301
  store i32 %rcc.tmp.303, ptr %rcc.tmp.302
  %rcc.tmp.305 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 26
  %rcc.tmp.306 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 26
  %rcc.tmp.307 = load i32, ptr %rcc.tmp.305
  store i32 %rcc.tmp.307, ptr %rcc.tmp.306
  %rcc.tmp.309 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 27
  %rcc.tmp.310 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 27
  %rcc.tmp.311 = load i32, ptr %rcc.tmp.309
  store i32 %rcc.tmp.311, ptr %rcc.tmp.310
  %rcc.tmp.313 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 28
  %rcc.tmp.314 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 28
  %rcc.tmp.315 = load i32, ptr %rcc.tmp.313
  store i32 %rcc.tmp.315, ptr %rcc.tmp.314
  %rcc.tmp.317 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 29
  %rcc.tmp.318 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 29
  %rcc.tmp.319 = load i32, ptr %rcc.tmp.317
  store i32 %rcc.tmp.319, ptr %rcc.tmp.318
  %rcc.tmp.321 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 30
  %rcc.tmp.322 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 30
  %rcc.tmp.323 = load i32, ptr %rcc.tmp.321
  store i32 %rcc.tmp.323, ptr %rcc.tmp.322
  %rcc.tmp.325 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 31
  %rcc.tmp.326 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 31
  %rcc.tmp.327 = load i32, ptr %rcc.tmp.325
  store i32 %rcc.tmp.327, ptr %rcc.tmp.326
  %rcc.tmp.329 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 32
  %rcc.tmp.330 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 32
  %rcc.tmp.331 = load i32, ptr %rcc.tmp.329
  store i32 %rcc.tmp.331, ptr %rcc.tmp.330
  %rcc.tmp.333 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 33
  %rcc.tmp.334 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 33
  %rcc.tmp.335 = load i32, ptr %rcc.tmp.333
  store i32 %rcc.tmp.335, ptr %rcc.tmp.334
  %rcc.tmp.337 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 34
  %rcc.tmp.338 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 34
  %rcc.tmp.339 = load i32, ptr %rcc.tmp.337
  store i32 %rcc.tmp.339, ptr %rcc.tmp.338
  %rcc.tmp.341 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 35
  %rcc.tmp.342 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 35
  %rcc.tmp.343 = load i32, ptr %rcc.tmp.341
  store i32 %rcc.tmp.343, ptr %rcc.tmp.342
  %rcc.tmp.345 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 36
  %rcc.tmp.346 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 36
  %rcc.tmp.347 = load i32, ptr %rcc.tmp.345
  store i32 %rcc.tmp.347, ptr %rcc.tmp.346
  %rcc.tmp.349 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 37
  %rcc.tmp.350 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 37
  %rcc.tmp.351 = load i32, ptr %rcc.tmp.349
  store i32 %rcc.tmp.351, ptr %rcc.tmp.350
  %rcc.tmp.353 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 38
  %rcc.tmp.354 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 38
  %rcc.tmp.355 = load i32, ptr %rcc.tmp.353
  store i32 %rcc.tmp.355, ptr %rcc.tmp.354
  %rcc.tmp.357 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 39
  %rcc.tmp.358 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 39
  %rcc.tmp.359 = load i32, ptr %rcc.tmp.357
  store i32 %rcc.tmp.359, ptr %rcc.tmp.358
  %rcc.tmp.361 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 40
  %rcc.tmp.362 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 40
  %rcc.tmp.363 = load i32, ptr %rcc.tmp.361
  store i32 %rcc.tmp.363, ptr %rcc.tmp.362
  %rcc.tmp.365 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 41
  %rcc.tmp.366 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 41
  %rcc.tmp.367 = load i32, ptr %rcc.tmp.365
  store i32 %rcc.tmp.367, ptr %rcc.tmp.366
  %rcc.tmp.369 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 42
  %rcc.tmp.370 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 42
  %rcc.tmp.371 = load i32, ptr %rcc.tmp.369
  store i32 %rcc.tmp.371, ptr %rcc.tmp.370
  %rcc.tmp.373 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 43
  %rcc.tmp.374 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 43
  %rcc.tmp.375 = load i32, ptr %rcc.tmp.373
  store i32 %rcc.tmp.375, ptr %rcc.tmp.374
  %rcc.tmp.377 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 44
  %rcc.tmp.378 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 44
  %rcc.tmp.379 = load i32, ptr %rcc.tmp.377
  store i32 %rcc.tmp.379, ptr %rcc.tmp.378
  %rcc.tmp.381 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 45
  %rcc.tmp.382 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 45
  %rcc.tmp.383 = load i32, ptr %rcc.tmp.381
  store i32 %rcc.tmp.383, ptr %rcc.tmp.382
  %rcc.tmp.385 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 46
  %rcc.tmp.386 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 46
  %rcc.tmp.387 = load i32, ptr %rcc.tmp.385
  store i32 %rcc.tmp.387, ptr %rcc.tmp.386
  %rcc.tmp.389 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 47
  %rcc.tmp.390 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 47
  %rcc.tmp.391 = load i32, ptr %rcc.tmp.389
  store i32 %rcc.tmp.391, ptr %rcc.tmp.390
  %rcc.tmp.393 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 48
  %rcc.tmp.394 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 48
  %rcc.tmp.395 = load i32, ptr %rcc.tmp.393
  store i32 %rcc.tmp.395, ptr %rcc.tmp.394
  %rcc.tmp.397 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 49
  %rcc.tmp.398 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 49
  %rcc.tmp.399 = load i32, ptr %rcc.tmp.397
  store i32 %rcc.tmp.399, ptr %rcc.tmp.398
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  store i32 98, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.406 = load i32, ptr %i
  %rcc.tmp.407 = load i32, ptr %len1..tmp
  %rcc.tmp.408 = icmp slt i32 %rcc.tmp.406, %rcc.tmp.407
  br i1 %rcc.tmp.408, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.411 = load i32, ptr %seed
  %rcc.tmp.412 = mul i32 %rcc.tmp.411, 166
  %rcc.tmp.413 = add i32 %rcc.tmp.412, 101390
  %rcc.tmp.414 = srem i32 %rcc.tmp.413, 274847
  store i32 %rcc.tmp.414, ptr %seed
  %rcc.tmp.416 = load i32, ptr %seed
  %rcc.tmp.417 = icmp slt i32 %rcc.tmp.416, 0
  br i1 %rcc.tmp.417, label %if.then, label %if.else
if.then:
  %rcc.tmp.419 = load i32, ptr %seed
  %rcc.tmp.420 = sub i32 0, %rcc.tmp.419
  store i32 %rcc.tmp.420, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.424 = load i32, ptr %i
  %rcc.tmp.425 = add i32 %rcc.tmp.424, 0
  %rcc.tmp.426 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 %rcc.tmp.425
  %rcc.tmp.427 = load i32, ptr %seed
  %rcc.tmp.428 = srem i32 %rcc.tmp.427, 26
  %rcc.tmp.429 = add i32 65, %rcc.tmp.428
  store i32 %rcc.tmp.429, ptr %rcc.tmp.426
  %rcc.tmp.431 = load i32, ptr %i
  %rcc.tmp.432 = add i32 %rcc.tmp.431, 1
  store i32 %rcc.tmp.432, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.437 = load i32, ptr %i
  %rcc.tmp.438 = load i32, ptr %len2..tmp
  %rcc.tmp.439 = icmp slt i32 %rcc.tmp.437, %rcc.tmp.438
  br i1 %rcc.tmp.439, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.442 = load i32, ptr %seed
  %rcc.tmp.443 = mul i32 %rcc.tmp.442, 166
  %rcc.tmp.444 = add i32 %rcc.tmp.443, 101390
  %rcc.tmp.445 = srem i32 %rcc.tmp.444, 274847
  store i32 %rcc.tmp.445, ptr %seed
  %rcc.tmp.447 = load i32, ptr %seed
  %rcc.tmp.448 = icmp slt i32 %rcc.tmp.447, 0
  br i1 %rcc.tmp.448, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.450 = load i32, ptr %seed
  %rcc.tmp.451 = sub i32 0, %rcc.tmp.450
  store i32 %rcc.tmp.451, ptr %seed
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.455 = load i32, ptr %i
  %rcc.tmp.456 = load i32, ptr %len1..tmp
  %rcc.tmp.457 = icmp slt i32 %rcc.tmp.455, %rcc.tmp.456
  br i1 %rcc.tmp.457, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.459 = load i32, ptr %seed
  %rcc.tmp.460 = srem i32 %rcc.tmp.459, 3
  %rcc.tmp.461 = icmp eq i32 %rcc.tmp.460, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.463 = phi i1 [0, %if.merge.2], [%rcc.tmp.461, %and.rhs]
  br i1 %rcc.tmp.463, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.465 = load i32, ptr %i
  %rcc.tmp.466 = add i32 %rcc.tmp.465, 0
  %rcc.tmp.467 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 %rcc.tmp.466
  %rcc.tmp.468 = load i32, ptr %i
  %rcc.tmp.469 = add i32 %rcc.tmp.468, 0
  %rcc.tmp.470 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 %rcc.tmp.469
  %rcc.tmp.471 = load i32, ptr %rcc.tmp.470
  store i32 %rcc.tmp.471, ptr %rcc.tmp.467
  br label %if.merge.3
if.else.3:
  %rcc.tmp.474 = load i32, ptr %i
  %rcc.tmp.475 = add i32 %rcc.tmp.474, 0
  %rcc.tmp.476 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 %rcc.tmp.475
  %rcc.tmp.477 = load i32, ptr %seed
  %rcc.tmp.478 = srem i32 %rcc.tmp.477, 26
  %rcc.tmp.479 = add i32 65, %rcc.tmp.478
  store i32 %rcc.tmp.479, ptr %rcc.tmp.476
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.482 = load i32, ptr %i
  %rcc.tmp.483 = add i32 %rcc.tmp.482, 1
  store i32 %rcc.tmp.483, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @editDistanceDP.([50 x i32]* %string1.tmp, [50 x i32]* %string2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %string1..local = alloca [50 x i32] 
  %string2..local = alloca [50 x i32] 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %dp = alloca [1800 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %insert = alloca i32 
  %delete = alloca i32 
  %replace = alloca i32 
  %min_val = alloca i32 
  %rcc.tmp.1 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  %rcc.tmp.121 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 30
  %rcc.tmp.122 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 30
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.123, ptr %rcc.tmp.122
  %rcc.tmp.125 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 31
  %rcc.tmp.126 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 31
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %rcc.tmp.126
  %rcc.tmp.129 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 32
  %rcc.tmp.130 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 32
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %rcc.tmp.130
  %rcc.tmp.133 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 33
  %rcc.tmp.134 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 33
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.135, ptr %rcc.tmp.134
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 34
  %rcc.tmp.138 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 34
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 35
  %rcc.tmp.142 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 35
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  %rcc.tmp.145 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 36
  %rcc.tmp.146 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 36
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  %rcc.tmp.149 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 37
  %rcc.tmp.150 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 37
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 38
  %rcc.tmp.154 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 38
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.155, ptr %rcc.tmp.154
  %rcc.tmp.157 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 39
  %rcc.tmp.158 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 39
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 40
  %rcc.tmp.162 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 40
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 41
  %rcc.tmp.166 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 41
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 42
  %rcc.tmp.170 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 42
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.169
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 43
  %rcc.tmp.174 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 43
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.173
  store i32 %rcc.tmp.175, ptr %rcc.tmp.174
  %rcc.tmp.177 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 44
  %rcc.tmp.178 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 44
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.177
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 45
  %rcc.tmp.182 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 45
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.181
  store i32 %rcc.tmp.183, ptr %rcc.tmp.182
  %rcc.tmp.185 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 46
  %rcc.tmp.186 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 46
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.187, ptr %rcc.tmp.186
  %rcc.tmp.189 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 47
  %rcc.tmp.190 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 47
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.191, ptr %rcc.tmp.190
  %rcc.tmp.193 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 48
  %rcc.tmp.194 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 48
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.195, ptr %rcc.tmp.194
  %rcc.tmp.197 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 49
  %rcc.tmp.198 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 49
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.197
  store i32 %rcc.tmp.199, ptr %rcc.tmp.198
  %rcc.tmp.201 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 0
  %rcc.tmp.202 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 0
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.201
  store i32 %rcc.tmp.203, ptr %rcc.tmp.202
  %rcc.tmp.205 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 1
  %rcc.tmp.206 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 1
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.205
  store i32 %rcc.tmp.207, ptr %rcc.tmp.206
  %rcc.tmp.209 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 2
  %rcc.tmp.210 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 2
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.209
  store i32 %rcc.tmp.211, ptr %rcc.tmp.210
  %rcc.tmp.213 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 3
  %rcc.tmp.214 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 3
  %rcc.tmp.215 = load i32, ptr %rcc.tmp.213
  store i32 %rcc.tmp.215, ptr %rcc.tmp.214
  %rcc.tmp.217 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 4
  %rcc.tmp.218 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 4
  %rcc.tmp.219 = load i32, ptr %rcc.tmp.217
  store i32 %rcc.tmp.219, ptr %rcc.tmp.218
  %rcc.tmp.221 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 5
  %rcc.tmp.222 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 5
  %rcc.tmp.223 = load i32, ptr %rcc.tmp.221
  store i32 %rcc.tmp.223, ptr %rcc.tmp.222
  %rcc.tmp.225 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 6
  %rcc.tmp.226 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 6
  %rcc.tmp.227 = load i32, ptr %rcc.tmp.225
  store i32 %rcc.tmp.227, ptr %rcc.tmp.226
  %rcc.tmp.229 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 7
  %rcc.tmp.230 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 7
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.229
  store i32 %rcc.tmp.231, ptr %rcc.tmp.230
  %rcc.tmp.233 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 8
  %rcc.tmp.234 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 8
  %rcc.tmp.235 = load i32, ptr %rcc.tmp.233
  store i32 %rcc.tmp.235, ptr %rcc.tmp.234
  %rcc.tmp.237 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 9
  %rcc.tmp.238 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 9
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.237
  store i32 %rcc.tmp.239, ptr %rcc.tmp.238
  %rcc.tmp.241 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 10
  %rcc.tmp.242 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 10
  %rcc.tmp.243 = load i32, ptr %rcc.tmp.241
  store i32 %rcc.tmp.243, ptr %rcc.tmp.242
  %rcc.tmp.245 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 11
  %rcc.tmp.246 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 11
  %rcc.tmp.247 = load i32, ptr %rcc.tmp.245
  store i32 %rcc.tmp.247, ptr %rcc.tmp.246
  %rcc.tmp.249 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 12
  %rcc.tmp.250 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 12
  %rcc.tmp.251 = load i32, ptr %rcc.tmp.249
  store i32 %rcc.tmp.251, ptr %rcc.tmp.250
  %rcc.tmp.253 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 13
  %rcc.tmp.254 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 13
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.253
  store i32 %rcc.tmp.255, ptr %rcc.tmp.254
  %rcc.tmp.257 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 14
  %rcc.tmp.258 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 14
  %rcc.tmp.259 = load i32, ptr %rcc.tmp.257
  store i32 %rcc.tmp.259, ptr %rcc.tmp.258
  %rcc.tmp.261 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 15
  %rcc.tmp.262 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 15
  %rcc.tmp.263 = load i32, ptr %rcc.tmp.261
  store i32 %rcc.tmp.263, ptr %rcc.tmp.262
  %rcc.tmp.265 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 16
  %rcc.tmp.266 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 16
  %rcc.tmp.267 = load i32, ptr %rcc.tmp.265
  store i32 %rcc.tmp.267, ptr %rcc.tmp.266
  %rcc.tmp.269 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 17
  %rcc.tmp.270 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 17
  %rcc.tmp.271 = load i32, ptr %rcc.tmp.269
  store i32 %rcc.tmp.271, ptr %rcc.tmp.270
  %rcc.tmp.273 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 18
  %rcc.tmp.274 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 18
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.273
  store i32 %rcc.tmp.275, ptr %rcc.tmp.274
  %rcc.tmp.277 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 19
  %rcc.tmp.278 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 19
  %rcc.tmp.279 = load i32, ptr %rcc.tmp.277
  store i32 %rcc.tmp.279, ptr %rcc.tmp.278
  %rcc.tmp.281 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 20
  %rcc.tmp.282 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 20
  %rcc.tmp.283 = load i32, ptr %rcc.tmp.281
  store i32 %rcc.tmp.283, ptr %rcc.tmp.282
  %rcc.tmp.285 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 21
  %rcc.tmp.286 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 21
  %rcc.tmp.287 = load i32, ptr %rcc.tmp.285
  store i32 %rcc.tmp.287, ptr %rcc.tmp.286
  %rcc.tmp.289 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 22
  %rcc.tmp.290 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 22
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.289
  store i32 %rcc.tmp.291, ptr %rcc.tmp.290
  %rcc.tmp.293 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 23
  %rcc.tmp.294 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 23
  %rcc.tmp.295 = load i32, ptr %rcc.tmp.293
  store i32 %rcc.tmp.295, ptr %rcc.tmp.294
  %rcc.tmp.297 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 24
  %rcc.tmp.298 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 24
  %rcc.tmp.299 = load i32, ptr %rcc.tmp.297
  store i32 %rcc.tmp.299, ptr %rcc.tmp.298
  %rcc.tmp.301 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 25
  %rcc.tmp.302 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 25
  %rcc.tmp.303 = load i32, ptr %rcc.tmp.301
  store i32 %rcc.tmp.303, ptr %rcc.tmp.302
  %rcc.tmp.305 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 26
  %rcc.tmp.306 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 26
  %rcc.tmp.307 = load i32, ptr %rcc.tmp.305
  store i32 %rcc.tmp.307, ptr %rcc.tmp.306
  %rcc.tmp.309 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 27
  %rcc.tmp.310 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 27
  %rcc.tmp.311 = load i32, ptr %rcc.tmp.309
  store i32 %rcc.tmp.311, ptr %rcc.tmp.310
  %rcc.tmp.313 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 28
  %rcc.tmp.314 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 28
  %rcc.tmp.315 = load i32, ptr %rcc.tmp.313
  store i32 %rcc.tmp.315, ptr %rcc.tmp.314
  %rcc.tmp.317 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 29
  %rcc.tmp.318 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 29
  %rcc.tmp.319 = load i32, ptr %rcc.tmp.317
  store i32 %rcc.tmp.319, ptr %rcc.tmp.318
  %rcc.tmp.321 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 30
  %rcc.tmp.322 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 30
  %rcc.tmp.323 = load i32, ptr %rcc.tmp.321
  store i32 %rcc.tmp.323, ptr %rcc.tmp.322
  %rcc.tmp.325 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 31
  %rcc.tmp.326 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 31
  %rcc.tmp.327 = load i32, ptr %rcc.tmp.325
  store i32 %rcc.tmp.327, ptr %rcc.tmp.326
  %rcc.tmp.329 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 32
  %rcc.tmp.330 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 32
  %rcc.tmp.331 = load i32, ptr %rcc.tmp.329
  store i32 %rcc.tmp.331, ptr %rcc.tmp.330
  %rcc.tmp.333 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 33
  %rcc.tmp.334 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 33
  %rcc.tmp.335 = load i32, ptr %rcc.tmp.333
  store i32 %rcc.tmp.335, ptr %rcc.tmp.334
  %rcc.tmp.337 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 34
  %rcc.tmp.338 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 34
  %rcc.tmp.339 = load i32, ptr %rcc.tmp.337
  store i32 %rcc.tmp.339, ptr %rcc.tmp.338
  %rcc.tmp.341 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 35
  %rcc.tmp.342 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 35
  %rcc.tmp.343 = load i32, ptr %rcc.tmp.341
  store i32 %rcc.tmp.343, ptr %rcc.tmp.342
  %rcc.tmp.345 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 36
  %rcc.tmp.346 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 36
  %rcc.tmp.347 = load i32, ptr %rcc.tmp.345
  store i32 %rcc.tmp.347, ptr %rcc.tmp.346
  %rcc.tmp.349 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 37
  %rcc.tmp.350 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 37
  %rcc.tmp.351 = load i32, ptr %rcc.tmp.349
  store i32 %rcc.tmp.351, ptr %rcc.tmp.350
  %rcc.tmp.353 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 38
  %rcc.tmp.354 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 38
  %rcc.tmp.355 = load i32, ptr %rcc.tmp.353
  store i32 %rcc.tmp.355, ptr %rcc.tmp.354
  %rcc.tmp.357 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 39
  %rcc.tmp.358 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 39
  %rcc.tmp.359 = load i32, ptr %rcc.tmp.357
  store i32 %rcc.tmp.359, ptr %rcc.tmp.358
  %rcc.tmp.361 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 40
  %rcc.tmp.362 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 40
  %rcc.tmp.363 = load i32, ptr %rcc.tmp.361
  store i32 %rcc.tmp.363, ptr %rcc.tmp.362
  %rcc.tmp.365 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 41
  %rcc.tmp.366 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 41
  %rcc.tmp.367 = load i32, ptr %rcc.tmp.365
  store i32 %rcc.tmp.367, ptr %rcc.tmp.366
  %rcc.tmp.369 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 42
  %rcc.tmp.370 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 42
  %rcc.tmp.371 = load i32, ptr %rcc.tmp.369
  store i32 %rcc.tmp.371, ptr %rcc.tmp.370
  %rcc.tmp.373 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 43
  %rcc.tmp.374 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 43
  %rcc.tmp.375 = load i32, ptr %rcc.tmp.373
  store i32 %rcc.tmp.375, ptr %rcc.tmp.374
  %rcc.tmp.377 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 44
  %rcc.tmp.378 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 44
  %rcc.tmp.379 = load i32, ptr %rcc.tmp.377
  store i32 %rcc.tmp.379, ptr %rcc.tmp.378
  %rcc.tmp.381 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 45
  %rcc.tmp.382 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 45
  %rcc.tmp.383 = load i32, ptr %rcc.tmp.381
  store i32 %rcc.tmp.383, ptr %rcc.tmp.382
  %rcc.tmp.385 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 46
  %rcc.tmp.386 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 46
  %rcc.tmp.387 = load i32, ptr %rcc.tmp.385
  store i32 %rcc.tmp.387, ptr %rcc.tmp.386
  %rcc.tmp.389 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 47
  %rcc.tmp.390 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 47
  %rcc.tmp.391 = load i32, ptr %rcc.tmp.389
  store i32 %rcc.tmp.391, ptr %rcc.tmp.390
  %rcc.tmp.393 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 48
  %rcc.tmp.394 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 48
  %rcc.tmp.395 = load i32, ptr %rcc.tmp.393
  store i32 %rcc.tmp.395, ptr %rcc.tmp.394
  %rcc.tmp.397 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 49
  %rcc.tmp.398 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 49
  %rcc.tmp.399 = load i32, ptr %rcc.tmp.397
  store i32 %rcc.tmp.399, ptr %rcc.tmp.398
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.405 = load i32, ptr %fill.idx
  %rcc.tmp.406 = icmp slt i32 %rcc.tmp.405, 1800
  br i1 %rcc.tmp.406, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.408 = load i32, ptr %fill.idx
  %rcc.tmp.409 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.408
  store i32 0, ptr %rcc.tmp.409
  %rcc.tmp.411 = add i32 %rcc.tmp.408, 1
  store i32 %rcc.tmp.411, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.416 = load i32, ptr %i
  %rcc.tmp.417 = load i32, ptr %len1..tmp
  %rcc.tmp.418 = icmp sle i32 %rcc.tmp.416, %rcc.tmp.417
  br i1 %rcc.tmp.418, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.421 = load i32, ptr %i
  %rcc.tmp.422 = load i32, ptr %len2..tmp
  %rcc.tmp.423 = add i32 %rcc.tmp.422, 1
  %rcc.tmp.424 = mul i32 %rcc.tmp.421, %rcc.tmp.423
  %rcc.tmp.425 = add i32 %rcc.tmp.424, 0
  %rcc.tmp.426 = add i32 %rcc.tmp.425, 0
  %rcc.tmp.427 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.426
  %rcc.tmp.428 = load i32, ptr %i
  store i32 %rcc.tmp.428, ptr %rcc.tmp.427
  %rcc.tmp.430 = load i32, ptr %i
  %rcc.tmp.431 = add i32 %rcc.tmp.430, 1
  store i32 %rcc.tmp.431, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.436 = load i32, ptr %j
  %rcc.tmp.437 = load i32, ptr %len2..tmp
  %rcc.tmp.438 = icmp sle i32 %rcc.tmp.436, %rcc.tmp.437
  br i1 %rcc.tmp.438, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.441 = load i32, ptr %len2..tmp
  %rcc.tmp.442 = add i32 %rcc.tmp.441, 1
  %rcc.tmp.443 = mul i32 0, %rcc.tmp.442
  %rcc.tmp.444 = load i32, ptr %j
  %rcc.tmp.445 = add i32 %rcc.tmp.443, %rcc.tmp.444
  %rcc.tmp.446 = add i32 %rcc.tmp.445, 0
  %rcc.tmp.447 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.446
  %rcc.tmp.448 = load i32, ptr %j
  store i32 %rcc.tmp.448, ptr %rcc.tmp.447
  %rcc.tmp.450 = load i32, ptr %j
  %rcc.tmp.451 = add i32 %rcc.tmp.450, 1
  store i32 %rcc.tmp.451, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 1, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.456 = load i32, ptr %i
  %rcc.tmp.457 = load i32, ptr %len1..tmp
  %rcc.tmp.458 = icmp sle i32 %rcc.tmp.456, %rcc.tmp.457
  br i1 %rcc.tmp.458, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 1, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.463 = load i32, ptr %j
  %rcc.tmp.464 = load i32, ptr %len2..tmp
  %rcc.tmp.465 = icmp sle i32 %rcc.tmp.463, %rcc.tmp.464
  br i1 %rcc.tmp.465, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.468 = load i32, ptr %i
  %rcc.tmp.469 = sub i32 %rcc.tmp.468, 1
  %rcc.tmp.470 = add i32 %rcc.tmp.469, 0
  %rcc.tmp.471 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 %rcc.tmp.470
  %rcc.tmp.472 = load i32, ptr %rcc.tmp.471
  %rcc.tmp.473 = load i32, ptr %j
  %rcc.tmp.474 = sub i32 %rcc.tmp.473, 1
  %rcc.tmp.475 = add i32 %rcc.tmp.474, 0
  %rcc.tmp.476 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 %rcc.tmp.475
  %rcc.tmp.477 = load i32, ptr %rcc.tmp.476
  %rcc.tmp.478 = icmp eq i32 %rcc.tmp.472, %rcc.tmp.477
  br i1 %rcc.tmp.478, label %if.then, label %if.else
if.then:
  %rcc.tmp.480 = load i32, ptr %i
  %rcc.tmp.481 = load i32, ptr %len2..tmp
  %rcc.tmp.482 = add i32 %rcc.tmp.481, 1
  %rcc.tmp.483 = mul i32 %rcc.tmp.480, %rcc.tmp.482
  %rcc.tmp.484 = load i32, ptr %j
  %rcc.tmp.485 = add i32 %rcc.tmp.483, %rcc.tmp.484
  %rcc.tmp.486 = add i32 %rcc.tmp.485, 0
  %rcc.tmp.487 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.486
  %rcc.tmp.488 = load i32, ptr %i
  %rcc.tmp.489 = sub i32 %rcc.tmp.488, 1
  %rcc.tmp.490 = load i32, ptr %len2..tmp
  %rcc.tmp.491 = add i32 %rcc.tmp.490, 1
  %rcc.tmp.492 = mul i32 %rcc.tmp.489, %rcc.tmp.491
  %rcc.tmp.493 = load i32, ptr %j
  %rcc.tmp.494 = sub i32 %rcc.tmp.493, 1
  %rcc.tmp.495 = add i32 %rcc.tmp.492, %rcc.tmp.494
  %rcc.tmp.496 = add i32 %rcc.tmp.495, 0
  %rcc.tmp.497 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.496
  %rcc.tmp.498 = load i32, ptr %rcc.tmp.497
  store i32 %rcc.tmp.498, ptr %rcc.tmp.487
  br label %if.merge
if.else:
  %rcc.tmp.501 = load i32, ptr %i
  %rcc.tmp.502 = load i32, ptr %len2..tmp
  %rcc.tmp.503 = add i32 %rcc.tmp.502, 1
  %rcc.tmp.504 = mul i32 %rcc.tmp.501, %rcc.tmp.503
  %rcc.tmp.505 = load i32, ptr %j
  %rcc.tmp.506 = sub i32 %rcc.tmp.505, 1
  %rcc.tmp.507 = add i32 %rcc.tmp.504, %rcc.tmp.506
  %rcc.tmp.508 = add i32 %rcc.tmp.507, 0
  %rcc.tmp.509 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.508
  %rcc.tmp.510 = load i32, ptr %rcc.tmp.509
  %rcc.tmp.511 = add i32 %rcc.tmp.510, 1
  store i32 %rcc.tmp.511, ptr %insert
  %rcc.tmp.513 = load i32, ptr %i
  %rcc.tmp.514 = sub i32 %rcc.tmp.513, 1
  %rcc.tmp.515 = load i32, ptr %len2..tmp
  %rcc.tmp.516 = add i32 %rcc.tmp.515, 1
  %rcc.tmp.517 = mul i32 %rcc.tmp.514, %rcc.tmp.516
  %rcc.tmp.518 = load i32, ptr %j
  %rcc.tmp.519 = add i32 %rcc.tmp.517, %rcc.tmp.518
  %rcc.tmp.520 = add i32 %rcc.tmp.519, 0
  %rcc.tmp.521 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.520
  %rcc.tmp.522 = load i32, ptr %rcc.tmp.521
  %rcc.tmp.523 = add i32 %rcc.tmp.522, 1
  store i32 %rcc.tmp.523, ptr %delete
  %rcc.tmp.525 = load i32, ptr %i
  %rcc.tmp.526 = sub i32 %rcc.tmp.525, 1
  %rcc.tmp.527 = load i32, ptr %len2..tmp
  %rcc.tmp.528 = add i32 %rcc.tmp.527, 1
  %rcc.tmp.529 = mul i32 %rcc.tmp.526, %rcc.tmp.528
  %rcc.tmp.530 = load i32, ptr %j
  %rcc.tmp.531 = sub i32 %rcc.tmp.530, 1
  %rcc.tmp.532 = add i32 %rcc.tmp.529, %rcc.tmp.531
  %rcc.tmp.533 = add i32 %rcc.tmp.532, 0
  %rcc.tmp.534 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.533
  %rcc.tmp.535 = load i32, ptr %rcc.tmp.534
  %rcc.tmp.536 = add i32 %rcc.tmp.535, 1
  store i32 %rcc.tmp.536, ptr %replace
  %rcc.tmp.538 = load i32, ptr %insert
  %rcc.tmp.539 = load i32, ptr %delete
  %rcc.tmp.540 = icmp slt i32 %rcc.tmp.538, %rcc.tmp.539
  br i1 %rcc.tmp.540, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.542 = load i32, ptr %insert
  br label %if.merge.2
if.else.2:
  %rcc.tmp.544 = load i32, ptr %delete
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.546 = phi i32 [%rcc.tmp.542, %if.then.2], [%rcc.tmp.544, %if.else.2]
  store i32 %rcc.tmp.546, ptr %min_val
  %rcc.tmp.548 = load i32, ptr %replace
  %rcc.tmp.549 = load i32, ptr %min_val
  %rcc.tmp.550 = icmp slt i32 %rcc.tmp.548, %rcc.tmp.549
  br i1 %rcc.tmp.550, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.552 = load i32, ptr %i
  %rcc.tmp.553 = load i32, ptr %len2..tmp
  %rcc.tmp.554 = add i32 %rcc.tmp.553, 1
  %rcc.tmp.555 = mul i32 %rcc.tmp.552, %rcc.tmp.554
  %rcc.tmp.556 = load i32, ptr %j
  %rcc.tmp.557 = add i32 %rcc.tmp.555, %rcc.tmp.556
  %rcc.tmp.558 = add i32 %rcc.tmp.557, 0
  %rcc.tmp.559 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.558
  %rcc.tmp.560 = load i32, ptr %replace
  store i32 %rcc.tmp.560, ptr %rcc.tmp.559
  br label %if.merge.3
if.else.3:
  %rcc.tmp.563 = load i32, ptr %i
  %rcc.tmp.564 = load i32, ptr %len2..tmp
  %rcc.tmp.565 = add i32 %rcc.tmp.564, 1
  %rcc.tmp.566 = mul i32 %rcc.tmp.563, %rcc.tmp.565
  %rcc.tmp.567 = load i32, ptr %j
  %rcc.tmp.568 = add i32 %rcc.tmp.566, %rcc.tmp.567
  %rcc.tmp.569 = add i32 %rcc.tmp.568, 0
  %rcc.tmp.570 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.569
  %rcc.tmp.571 = load i32, ptr %min_val
  store i32 %rcc.tmp.571, ptr %rcc.tmp.570
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.575 = load i32, ptr %j
  %rcc.tmp.576 = add i32 %rcc.tmp.575, 1
  store i32 %rcc.tmp.576, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.579 = load i32, ptr %i
  %rcc.tmp.580 = add i32 %rcc.tmp.579, 1
  store i32 %rcc.tmp.580, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.583 = load i32, ptr %len1..tmp
  %rcc.tmp.584 = load i32, ptr %len2..tmp
  %rcc.tmp.585 = add i32 %rcc.tmp.584, 1
  %rcc.tmp.586 = mul i32 %rcc.tmp.583, %rcc.tmp.585
  %rcc.tmp.587 = load i32, ptr %len2..tmp
  %rcc.tmp.588 = add i32 %rcc.tmp.586, %rcc.tmp.587
  %rcc.tmp.589 = add i32 %rcc.tmp.588, 0
  %rcc.tmp.590 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.589
  %rcc.tmp.591 = load i32, ptr %rcc.tmp.590
  ret i32 %rcc.tmp.591
}
define i32 @longestCommonSubsequenceDP.([50 x i32]* %string1.tmp, [50 x i32]* %string2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %string1..local = alloca [50 x i32] 
  %string2..local = alloca [50 x i32] 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %dp = alloca [1800 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %from_left = alloca i32 
  %from_top = alloca i32 
  %rcc.tmp.1 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  %rcc.tmp.121 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 30
  %rcc.tmp.122 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 30
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.123, ptr %rcc.tmp.122
  %rcc.tmp.125 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 31
  %rcc.tmp.126 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 31
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %rcc.tmp.126
  %rcc.tmp.129 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 32
  %rcc.tmp.130 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 32
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %rcc.tmp.130
  %rcc.tmp.133 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 33
  %rcc.tmp.134 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 33
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.135, ptr %rcc.tmp.134
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 34
  %rcc.tmp.138 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 34
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 35
  %rcc.tmp.142 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 35
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  %rcc.tmp.145 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 36
  %rcc.tmp.146 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 36
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  %rcc.tmp.149 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 37
  %rcc.tmp.150 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 37
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 38
  %rcc.tmp.154 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 38
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.155, ptr %rcc.tmp.154
  %rcc.tmp.157 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 39
  %rcc.tmp.158 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 39
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 40
  %rcc.tmp.162 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 40
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 41
  %rcc.tmp.166 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 41
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 42
  %rcc.tmp.170 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 42
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.169
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 43
  %rcc.tmp.174 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 43
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.173
  store i32 %rcc.tmp.175, ptr %rcc.tmp.174
  %rcc.tmp.177 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 44
  %rcc.tmp.178 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 44
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.177
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 45
  %rcc.tmp.182 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 45
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.181
  store i32 %rcc.tmp.183, ptr %rcc.tmp.182
  %rcc.tmp.185 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 46
  %rcc.tmp.186 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 46
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.187, ptr %rcc.tmp.186
  %rcc.tmp.189 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 47
  %rcc.tmp.190 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 47
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.191, ptr %rcc.tmp.190
  %rcc.tmp.193 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 48
  %rcc.tmp.194 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 48
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.195, ptr %rcc.tmp.194
  %rcc.tmp.197 = getelementptr [50 x i32], ptr %string1.tmp, i32 0, i32 49
  %rcc.tmp.198 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 49
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.197
  store i32 %rcc.tmp.199, ptr %rcc.tmp.198
  %rcc.tmp.201 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 0
  %rcc.tmp.202 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 0
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.201
  store i32 %rcc.tmp.203, ptr %rcc.tmp.202
  %rcc.tmp.205 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 1
  %rcc.tmp.206 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 1
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.205
  store i32 %rcc.tmp.207, ptr %rcc.tmp.206
  %rcc.tmp.209 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 2
  %rcc.tmp.210 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 2
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.209
  store i32 %rcc.tmp.211, ptr %rcc.tmp.210
  %rcc.tmp.213 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 3
  %rcc.tmp.214 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 3
  %rcc.tmp.215 = load i32, ptr %rcc.tmp.213
  store i32 %rcc.tmp.215, ptr %rcc.tmp.214
  %rcc.tmp.217 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 4
  %rcc.tmp.218 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 4
  %rcc.tmp.219 = load i32, ptr %rcc.tmp.217
  store i32 %rcc.tmp.219, ptr %rcc.tmp.218
  %rcc.tmp.221 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 5
  %rcc.tmp.222 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 5
  %rcc.tmp.223 = load i32, ptr %rcc.tmp.221
  store i32 %rcc.tmp.223, ptr %rcc.tmp.222
  %rcc.tmp.225 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 6
  %rcc.tmp.226 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 6
  %rcc.tmp.227 = load i32, ptr %rcc.tmp.225
  store i32 %rcc.tmp.227, ptr %rcc.tmp.226
  %rcc.tmp.229 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 7
  %rcc.tmp.230 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 7
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.229
  store i32 %rcc.tmp.231, ptr %rcc.tmp.230
  %rcc.tmp.233 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 8
  %rcc.tmp.234 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 8
  %rcc.tmp.235 = load i32, ptr %rcc.tmp.233
  store i32 %rcc.tmp.235, ptr %rcc.tmp.234
  %rcc.tmp.237 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 9
  %rcc.tmp.238 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 9
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.237
  store i32 %rcc.tmp.239, ptr %rcc.tmp.238
  %rcc.tmp.241 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 10
  %rcc.tmp.242 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 10
  %rcc.tmp.243 = load i32, ptr %rcc.tmp.241
  store i32 %rcc.tmp.243, ptr %rcc.tmp.242
  %rcc.tmp.245 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 11
  %rcc.tmp.246 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 11
  %rcc.tmp.247 = load i32, ptr %rcc.tmp.245
  store i32 %rcc.tmp.247, ptr %rcc.tmp.246
  %rcc.tmp.249 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 12
  %rcc.tmp.250 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 12
  %rcc.tmp.251 = load i32, ptr %rcc.tmp.249
  store i32 %rcc.tmp.251, ptr %rcc.tmp.250
  %rcc.tmp.253 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 13
  %rcc.tmp.254 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 13
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.253
  store i32 %rcc.tmp.255, ptr %rcc.tmp.254
  %rcc.tmp.257 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 14
  %rcc.tmp.258 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 14
  %rcc.tmp.259 = load i32, ptr %rcc.tmp.257
  store i32 %rcc.tmp.259, ptr %rcc.tmp.258
  %rcc.tmp.261 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 15
  %rcc.tmp.262 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 15
  %rcc.tmp.263 = load i32, ptr %rcc.tmp.261
  store i32 %rcc.tmp.263, ptr %rcc.tmp.262
  %rcc.tmp.265 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 16
  %rcc.tmp.266 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 16
  %rcc.tmp.267 = load i32, ptr %rcc.tmp.265
  store i32 %rcc.tmp.267, ptr %rcc.tmp.266
  %rcc.tmp.269 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 17
  %rcc.tmp.270 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 17
  %rcc.tmp.271 = load i32, ptr %rcc.tmp.269
  store i32 %rcc.tmp.271, ptr %rcc.tmp.270
  %rcc.tmp.273 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 18
  %rcc.tmp.274 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 18
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.273
  store i32 %rcc.tmp.275, ptr %rcc.tmp.274
  %rcc.tmp.277 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 19
  %rcc.tmp.278 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 19
  %rcc.tmp.279 = load i32, ptr %rcc.tmp.277
  store i32 %rcc.tmp.279, ptr %rcc.tmp.278
  %rcc.tmp.281 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 20
  %rcc.tmp.282 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 20
  %rcc.tmp.283 = load i32, ptr %rcc.tmp.281
  store i32 %rcc.tmp.283, ptr %rcc.tmp.282
  %rcc.tmp.285 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 21
  %rcc.tmp.286 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 21
  %rcc.tmp.287 = load i32, ptr %rcc.tmp.285
  store i32 %rcc.tmp.287, ptr %rcc.tmp.286
  %rcc.tmp.289 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 22
  %rcc.tmp.290 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 22
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.289
  store i32 %rcc.tmp.291, ptr %rcc.tmp.290
  %rcc.tmp.293 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 23
  %rcc.tmp.294 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 23
  %rcc.tmp.295 = load i32, ptr %rcc.tmp.293
  store i32 %rcc.tmp.295, ptr %rcc.tmp.294
  %rcc.tmp.297 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 24
  %rcc.tmp.298 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 24
  %rcc.tmp.299 = load i32, ptr %rcc.tmp.297
  store i32 %rcc.tmp.299, ptr %rcc.tmp.298
  %rcc.tmp.301 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 25
  %rcc.tmp.302 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 25
  %rcc.tmp.303 = load i32, ptr %rcc.tmp.301
  store i32 %rcc.tmp.303, ptr %rcc.tmp.302
  %rcc.tmp.305 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 26
  %rcc.tmp.306 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 26
  %rcc.tmp.307 = load i32, ptr %rcc.tmp.305
  store i32 %rcc.tmp.307, ptr %rcc.tmp.306
  %rcc.tmp.309 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 27
  %rcc.tmp.310 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 27
  %rcc.tmp.311 = load i32, ptr %rcc.tmp.309
  store i32 %rcc.tmp.311, ptr %rcc.tmp.310
  %rcc.tmp.313 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 28
  %rcc.tmp.314 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 28
  %rcc.tmp.315 = load i32, ptr %rcc.tmp.313
  store i32 %rcc.tmp.315, ptr %rcc.tmp.314
  %rcc.tmp.317 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 29
  %rcc.tmp.318 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 29
  %rcc.tmp.319 = load i32, ptr %rcc.tmp.317
  store i32 %rcc.tmp.319, ptr %rcc.tmp.318
  %rcc.tmp.321 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 30
  %rcc.tmp.322 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 30
  %rcc.tmp.323 = load i32, ptr %rcc.tmp.321
  store i32 %rcc.tmp.323, ptr %rcc.tmp.322
  %rcc.tmp.325 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 31
  %rcc.tmp.326 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 31
  %rcc.tmp.327 = load i32, ptr %rcc.tmp.325
  store i32 %rcc.tmp.327, ptr %rcc.tmp.326
  %rcc.tmp.329 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 32
  %rcc.tmp.330 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 32
  %rcc.tmp.331 = load i32, ptr %rcc.tmp.329
  store i32 %rcc.tmp.331, ptr %rcc.tmp.330
  %rcc.tmp.333 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 33
  %rcc.tmp.334 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 33
  %rcc.tmp.335 = load i32, ptr %rcc.tmp.333
  store i32 %rcc.tmp.335, ptr %rcc.tmp.334
  %rcc.tmp.337 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 34
  %rcc.tmp.338 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 34
  %rcc.tmp.339 = load i32, ptr %rcc.tmp.337
  store i32 %rcc.tmp.339, ptr %rcc.tmp.338
  %rcc.tmp.341 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 35
  %rcc.tmp.342 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 35
  %rcc.tmp.343 = load i32, ptr %rcc.tmp.341
  store i32 %rcc.tmp.343, ptr %rcc.tmp.342
  %rcc.tmp.345 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 36
  %rcc.tmp.346 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 36
  %rcc.tmp.347 = load i32, ptr %rcc.tmp.345
  store i32 %rcc.tmp.347, ptr %rcc.tmp.346
  %rcc.tmp.349 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 37
  %rcc.tmp.350 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 37
  %rcc.tmp.351 = load i32, ptr %rcc.tmp.349
  store i32 %rcc.tmp.351, ptr %rcc.tmp.350
  %rcc.tmp.353 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 38
  %rcc.tmp.354 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 38
  %rcc.tmp.355 = load i32, ptr %rcc.tmp.353
  store i32 %rcc.tmp.355, ptr %rcc.tmp.354
  %rcc.tmp.357 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 39
  %rcc.tmp.358 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 39
  %rcc.tmp.359 = load i32, ptr %rcc.tmp.357
  store i32 %rcc.tmp.359, ptr %rcc.tmp.358
  %rcc.tmp.361 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 40
  %rcc.tmp.362 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 40
  %rcc.tmp.363 = load i32, ptr %rcc.tmp.361
  store i32 %rcc.tmp.363, ptr %rcc.tmp.362
  %rcc.tmp.365 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 41
  %rcc.tmp.366 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 41
  %rcc.tmp.367 = load i32, ptr %rcc.tmp.365
  store i32 %rcc.tmp.367, ptr %rcc.tmp.366
  %rcc.tmp.369 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 42
  %rcc.tmp.370 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 42
  %rcc.tmp.371 = load i32, ptr %rcc.tmp.369
  store i32 %rcc.tmp.371, ptr %rcc.tmp.370
  %rcc.tmp.373 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 43
  %rcc.tmp.374 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 43
  %rcc.tmp.375 = load i32, ptr %rcc.tmp.373
  store i32 %rcc.tmp.375, ptr %rcc.tmp.374
  %rcc.tmp.377 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 44
  %rcc.tmp.378 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 44
  %rcc.tmp.379 = load i32, ptr %rcc.tmp.377
  store i32 %rcc.tmp.379, ptr %rcc.tmp.378
  %rcc.tmp.381 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 45
  %rcc.tmp.382 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 45
  %rcc.tmp.383 = load i32, ptr %rcc.tmp.381
  store i32 %rcc.tmp.383, ptr %rcc.tmp.382
  %rcc.tmp.385 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 46
  %rcc.tmp.386 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 46
  %rcc.tmp.387 = load i32, ptr %rcc.tmp.385
  store i32 %rcc.tmp.387, ptr %rcc.tmp.386
  %rcc.tmp.389 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 47
  %rcc.tmp.390 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 47
  %rcc.tmp.391 = load i32, ptr %rcc.tmp.389
  store i32 %rcc.tmp.391, ptr %rcc.tmp.390
  %rcc.tmp.393 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 48
  %rcc.tmp.394 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 48
  %rcc.tmp.395 = load i32, ptr %rcc.tmp.393
  store i32 %rcc.tmp.395, ptr %rcc.tmp.394
  %rcc.tmp.397 = getelementptr [50 x i32], ptr %string2.tmp, i32 0, i32 49
  %rcc.tmp.398 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 49
  %rcc.tmp.399 = load i32, ptr %rcc.tmp.397
  store i32 %rcc.tmp.399, ptr %rcc.tmp.398
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.405 = load i32, ptr %fill.idx
  %rcc.tmp.406 = icmp slt i32 %rcc.tmp.405, 1800
  br i1 %rcc.tmp.406, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.408 = load i32, ptr %fill.idx
  %rcc.tmp.409 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.408
  store i32 0, ptr %rcc.tmp.409
  %rcc.tmp.411 = add i32 %rcc.tmp.408, 1
  store i32 %rcc.tmp.411, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.416 = load i32, ptr %i
  %rcc.tmp.417 = load i32, ptr %len1..tmp
  %rcc.tmp.418 = icmp sle i32 %rcc.tmp.416, %rcc.tmp.417
  br i1 %rcc.tmp.418, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.423 = load i32, ptr %j
  %rcc.tmp.424 = load i32, ptr %len2..tmp
  %rcc.tmp.425 = icmp sle i32 %rcc.tmp.423, %rcc.tmp.424
  br i1 %rcc.tmp.425, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.428 = load i32, ptr %i
  %rcc.tmp.429 = sub i32 %rcc.tmp.428, 1
  %rcc.tmp.430 = add i32 %rcc.tmp.429, 0
  %rcc.tmp.431 = getelementptr [50 x i32], ptr %string1..local, i32 0, i32 %rcc.tmp.430
  %rcc.tmp.432 = load i32, ptr %rcc.tmp.431
  %rcc.tmp.433 = load i32, ptr %j
  %rcc.tmp.434 = sub i32 %rcc.tmp.433, 1
  %rcc.tmp.435 = add i32 %rcc.tmp.434, 0
  %rcc.tmp.436 = getelementptr [50 x i32], ptr %string2..local, i32 0, i32 %rcc.tmp.435
  %rcc.tmp.437 = load i32, ptr %rcc.tmp.436
  %rcc.tmp.438 = icmp eq i32 %rcc.tmp.432, %rcc.tmp.437
  br i1 %rcc.tmp.438, label %if.then, label %if.else
if.then:
  %rcc.tmp.440 = load i32, ptr %i
  %rcc.tmp.441 = load i32, ptr %len2..tmp
  %rcc.tmp.442 = add i32 %rcc.tmp.441, 1
  %rcc.tmp.443 = mul i32 %rcc.tmp.440, %rcc.tmp.442
  %rcc.tmp.444 = load i32, ptr %j
  %rcc.tmp.445 = add i32 %rcc.tmp.443, %rcc.tmp.444
  %rcc.tmp.446 = add i32 %rcc.tmp.445, 0
  %rcc.tmp.447 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.446
  %rcc.tmp.448 = load i32, ptr %i
  %rcc.tmp.449 = sub i32 %rcc.tmp.448, 1
  %rcc.tmp.450 = load i32, ptr %len2..tmp
  %rcc.tmp.451 = add i32 %rcc.tmp.450, 1
  %rcc.tmp.452 = mul i32 %rcc.tmp.449, %rcc.tmp.451
  %rcc.tmp.453 = load i32, ptr %j
  %rcc.tmp.454 = sub i32 %rcc.tmp.453, 1
  %rcc.tmp.455 = add i32 %rcc.tmp.452, %rcc.tmp.454
  %rcc.tmp.456 = add i32 %rcc.tmp.455, 0
  %rcc.tmp.457 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.456
  %rcc.tmp.458 = load i32, ptr %rcc.tmp.457
  %rcc.tmp.459 = add i32 %rcc.tmp.458, 1
  store i32 %rcc.tmp.459, ptr %rcc.tmp.447
  br label %if.merge
if.else:
  %rcc.tmp.462 = load i32, ptr %i
  %rcc.tmp.463 = load i32, ptr %len2..tmp
  %rcc.tmp.464 = add i32 %rcc.tmp.463, 1
  %rcc.tmp.465 = mul i32 %rcc.tmp.462, %rcc.tmp.464
  %rcc.tmp.466 = load i32, ptr %j
  %rcc.tmp.467 = sub i32 %rcc.tmp.466, 1
  %rcc.tmp.468 = add i32 %rcc.tmp.465, %rcc.tmp.467
  %rcc.tmp.469 = add i32 %rcc.tmp.468, 0
  %rcc.tmp.470 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.469
  %rcc.tmp.471 = load i32, ptr %rcc.tmp.470
  store i32 %rcc.tmp.471, ptr %from_left
  %rcc.tmp.473 = load i32, ptr %i
  %rcc.tmp.474 = sub i32 %rcc.tmp.473, 1
  %rcc.tmp.475 = load i32, ptr %len2..tmp
  %rcc.tmp.476 = add i32 %rcc.tmp.475, 1
  %rcc.tmp.477 = mul i32 %rcc.tmp.474, %rcc.tmp.476
  %rcc.tmp.478 = load i32, ptr %j
  %rcc.tmp.479 = add i32 %rcc.tmp.477, %rcc.tmp.478
  %rcc.tmp.480 = add i32 %rcc.tmp.479, 0
  %rcc.tmp.481 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.480
  %rcc.tmp.482 = load i32, ptr %rcc.tmp.481
  store i32 %rcc.tmp.482, ptr %from_top
  %rcc.tmp.484 = load i32, ptr %from_left
  %rcc.tmp.485 = load i32, ptr %from_top
  %rcc.tmp.486 = icmp sgt i32 %rcc.tmp.484, %rcc.tmp.485
  br i1 %rcc.tmp.486, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.488 = load i32, ptr %i
  %rcc.tmp.489 = load i32, ptr %len2..tmp
  %rcc.tmp.490 = add i32 %rcc.tmp.489, 1
  %rcc.tmp.491 = mul i32 %rcc.tmp.488, %rcc.tmp.490
  %rcc.tmp.492 = load i32, ptr %j
  %rcc.tmp.493 = add i32 %rcc.tmp.491, %rcc.tmp.492
  %rcc.tmp.494 = add i32 %rcc.tmp.493, 0
  %rcc.tmp.495 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.494
  %rcc.tmp.496 = load i32, ptr %from_left
  store i32 %rcc.tmp.496, ptr %rcc.tmp.495
  br label %if.merge.2
if.else.2:
  %rcc.tmp.499 = load i32, ptr %i
  %rcc.tmp.500 = load i32, ptr %len2..tmp
  %rcc.tmp.501 = add i32 %rcc.tmp.500, 1
  %rcc.tmp.502 = mul i32 %rcc.tmp.499, %rcc.tmp.501
  %rcc.tmp.503 = load i32, ptr %j
  %rcc.tmp.504 = add i32 %rcc.tmp.502, %rcc.tmp.503
  %rcc.tmp.505 = add i32 %rcc.tmp.504, 0
  %rcc.tmp.506 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.505
  %rcc.tmp.507 = load i32, ptr %from_top
  store i32 %rcc.tmp.507, ptr %rcc.tmp.506
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.511 = load i32, ptr %j
  %rcc.tmp.512 = add i32 %rcc.tmp.511, 1
  store i32 %rcc.tmp.512, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.515 = load i32, ptr %i
  %rcc.tmp.516 = add i32 %rcc.tmp.515, 1
  store i32 %rcc.tmp.516, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.519 = load i32, ptr %len1..tmp
  %rcc.tmp.520 = load i32, ptr %len2..tmp
  %rcc.tmp.521 = add i32 %rcc.tmp.520, 1
  %rcc.tmp.522 = mul i32 %rcc.tmp.519, %rcc.tmp.521
  %rcc.tmp.523 = load i32, ptr %len2..tmp
  %rcc.tmp.524 = add i32 %rcc.tmp.522, %rcc.tmp.523
  %rcc.tmp.525 = add i32 %rcc.tmp.524, 0
  %rcc.tmp.526 = getelementptr [1800 x i32], ptr %dp, i32 0, i32 %rcc.tmp.525
  %rcc.tmp.527 = load i32, ptr %rcc.tmp.526
  ret i32 %rcc.tmp.527
}
define i32 @palindromePartitioningDP.([50 x i32]* %string.tmp, i32 %length.tmp) {
entry:
  %string..local = alloca [50 x i32] 
  %length..tmp = alloca i32 
  %dp = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %is_palindrome = alloca [2500 x i1] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %j.2 = alloca i32 
  %rcc.tmp.1 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  %rcc.tmp.121 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 30
  %rcc.tmp.122 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 30
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.123, ptr %rcc.tmp.122
  %rcc.tmp.125 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 31
  %rcc.tmp.126 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 31
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %rcc.tmp.126
  %rcc.tmp.129 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 32
  %rcc.tmp.130 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 32
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %rcc.tmp.130
  %rcc.tmp.133 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 33
  %rcc.tmp.134 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 33
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.135, ptr %rcc.tmp.134
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 34
  %rcc.tmp.138 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 34
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 35
  %rcc.tmp.142 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 35
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  %rcc.tmp.145 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 36
  %rcc.tmp.146 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 36
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  %rcc.tmp.149 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 37
  %rcc.tmp.150 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 37
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 38
  %rcc.tmp.154 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 38
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.155, ptr %rcc.tmp.154
  %rcc.tmp.157 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 39
  %rcc.tmp.158 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 39
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 40
  %rcc.tmp.162 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 40
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 41
  %rcc.tmp.166 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 41
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 42
  %rcc.tmp.170 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 42
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.169
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 43
  %rcc.tmp.174 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 43
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.173
  store i32 %rcc.tmp.175, ptr %rcc.tmp.174
  %rcc.tmp.177 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 44
  %rcc.tmp.178 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 44
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.177
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 45
  %rcc.tmp.182 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 45
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.181
  store i32 %rcc.tmp.183, ptr %rcc.tmp.182
  %rcc.tmp.185 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 46
  %rcc.tmp.186 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 46
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.187, ptr %rcc.tmp.186
  %rcc.tmp.189 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 47
  %rcc.tmp.190 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 47
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.191, ptr %rcc.tmp.190
  %rcc.tmp.193 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 48
  %rcc.tmp.194 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 48
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.195, ptr %rcc.tmp.194
  %rcc.tmp.197 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 49
  %rcc.tmp.198 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 49
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.197
  store i32 %rcc.tmp.199, ptr %rcc.tmp.198
  store i32 %length.tmp, ptr %length..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.204 = load i32, ptr %fill.idx
  %rcc.tmp.205 = icmp slt i32 %rcc.tmp.204, 50
  br i1 %rcc.tmp.205, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.207 = load i32, ptr %fill.idx
  %rcc.tmp.208 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.207
  store i32 0, ptr %rcc.tmp.208
  %rcc.tmp.210 = add i32 %rcc.tmp.207, 1
  store i32 %rcc.tmp.210, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.215 = load i32, ptr %fill.idx.2
  %rcc.tmp.216 = icmp slt i32 %rcc.tmp.215, 2500
  br i1 %rcc.tmp.216, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.218 = load i32, ptr %fill.idx.2
  %rcc.tmp.219 = getelementptr [2500 x i1], ptr %is_palindrome, i32 0, i32 %rcc.tmp.218
  store i1 0, ptr %rcc.tmp.219
  %rcc.tmp.221 = add i32 %rcc.tmp.218, 1
  store i32 %rcc.tmp.221, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.226 = load i32, ptr %i
  %rcc.tmp.227 = load i32, ptr %length..tmp
  %rcc.tmp.228 = icmp slt i32 %rcc.tmp.226, %rcc.tmp.227
  br i1 %rcc.tmp.228, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.233 = load i32, ptr %j
  %rcc.tmp.234 = load i32, ptr %length..tmp
  %rcc.tmp.235 = icmp slt i32 %rcc.tmp.233, %rcc.tmp.234
  br i1 %rcc.tmp.235, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.238 = load i32, ptr %i
  %rcc.tmp.239 = load i32, ptr %j
  %rcc.tmp.240 = icmp eq i32 %rcc.tmp.238, %rcc.tmp.239
  br i1 %rcc.tmp.240, label %if.then, label %if.else
if.then:
  %rcc.tmp.242 = load i32, ptr %i
  %rcc.tmp.243 = load i32, ptr %length..tmp
  %rcc.tmp.244 = mul i32 %rcc.tmp.242, %rcc.tmp.243
  %rcc.tmp.245 = load i32, ptr %j
  %rcc.tmp.246 = add i32 %rcc.tmp.244, %rcc.tmp.245
  %rcc.tmp.247 = add i32 %rcc.tmp.246, 0
  %rcc.tmp.248 = getelementptr [2500 x i1], ptr %is_palindrome, i32 0, i32 %rcc.tmp.247
  store i1 1, ptr %rcc.tmp.248
  br label %if.merge
if.else:
  %rcc.tmp.251 = load i32, ptr %i
  %rcc.tmp.252 = add i32 %rcc.tmp.251, 1
  %rcc.tmp.253 = load i32, ptr %j
  %rcc.tmp.254 = icmp eq i32 %rcc.tmp.252, %rcc.tmp.253
  br i1 %rcc.tmp.254, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.256 = load i32, ptr %i
  %rcc.tmp.257 = load i32, ptr %length..tmp
  %rcc.tmp.258 = mul i32 %rcc.tmp.256, %rcc.tmp.257
  %rcc.tmp.259 = load i32, ptr %j
  %rcc.tmp.260 = add i32 %rcc.tmp.258, %rcc.tmp.259
  %rcc.tmp.261 = add i32 %rcc.tmp.260, 0
  %rcc.tmp.262 = getelementptr [2500 x i1], ptr %is_palindrome, i32 0, i32 %rcc.tmp.261
  %rcc.tmp.263 = load i32, ptr %i
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %rcc.tmp.265
  %rcc.tmp.267 = load i32, ptr %j
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.268
  %rcc.tmp.270 = load i32, ptr %rcc.tmp.269
  %rcc.tmp.271 = icmp eq i32 %rcc.tmp.266, %rcc.tmp.270
  store i1 %rcc.tmp.271, ptr %rcc.tmp.262
  br label %if.merge.2
if.else.2:
  %rcc.tmp.274 = load i32, ptr %i
  %rcc.tmp.275 = load i32, ptr %j
  %rcc.tmp.276 = icmp slt i32 %rcc.tmp.274, %rcc.tmp.275
  br i1 %rcc.tmp.276, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.278 = load i32, ptr %i
  %rcc.tmp.279 = load i32, ptr %length..tmp
  %rcc.tmp.280 = mul i32 %rcc.tmp.278, %rcc.tmp.279
  %rcc.tmp.281 = load i32, ptr %j
  %rcc.tmp.282 = add i32 %rcc.tmp.280, %rcc.tmp.281
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 0
  %rcc.tmp.284 = getelementptr [2500 x i1], ptr %is_palindrome, i32 0, i32 %rcc.tmp.283
  %rcc.tmp.285 = load i32, ptr %i
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 0
  %rcc.tmp.287 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.286
  %rcc.tmp.288 = load i32, ptr %rcc.tmp.287
  %rcc.tmp.289 = load i32, ptr %j
  %rcc.tmp.290 = add i32 %rcc.tmp.289, 0
  %rcc.tmp.291 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.290
  %rcc.tmp.292 = load i32, ptr %rcc.tmp.291
  %rcc.tmp.293 = icmp eq i32 %rcc.tmp.288, %rcc.tmp.292
  br i1 %rcc.tmp.293, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.295 = load i32, ptr %i
  %rcc.tmp.296 = add i32 %rcc.tmp.295, 1
  %rcc.tmp.297 = load i32, ptr %length..tmp
  %rcc.tmp.298 = mul i32 %rcc.tmp.296, %rcc.tmp.297
  %rcc.tmp.299 = load i32, ptr %j
  %rcc.tmp.300 = sub i32 %rcc.tmp.299, 1
  %rcc.tmp.301 = add i32 %rcc.tmp.298, %rcc.tmp.300
  %rcc.tmp.302 = add i32 %rcc.tmp.301, 0
  %rcc.tmp.303 = getelementptr [2500 x i1], ptr %is_palindrome, i32 0, i32 %rcc.tmp.302
  %rcc.tmp.304 = load i1, ptr %rcc.tmp.303
  br label %sc.merge
sc.merge:
  %rcc.tmp.306 = phi i1 [0, %if.then.3], [%rcc.tmp.304, %and.rhs]
  store i1 %rcc.tmp.306, ptr %rcc.tmp.284
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.312 = load i32, ptr %j
  %rcc.tmp.313 = add i32 %rcc.tmp.312, 1
  store i32 %rcc.tmp.313, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.316 = load i32, ptr %i
  %rcc.tmp.317 = add i32 %rcc.tmp.316, 1
  store i32 %rcc.tmp.317, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.322 = load i32, ptr %i
  %rcc.tmp.323 = load i32, ptr %length..tmp
  %rcc.tmp.324 = icmp slt i32 %rcc.tmp.322, %rcc.tmp.323
  br i1 %rcc.tmp.324, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.327 = load i32, ptr %i
  %rcc.tmp.328 = add i32 %rcc.tmp.327, 0
  %rcc.tmp.329 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.328
  %rcc.tmp.330 = load i32, ptr %i
  store i32 %rcc.tmp.330, ptr %rcc.tmp.329
  store i32 0, ptr %j.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.334 = load i32, ptr %j.2
  %rcc.tmp.335 = load i32, ptr %i
  %rcc.tmp.336 = icmp sle i32 %rcc.tmp.334, %rcc.tmp.335
  br i1 %rcc.tmp.336, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.339 = load i32, ptr %j.2
  %rcc.tmp.340 = load i32, ptr %length..tmp
  %rcc.tmp.341 = mul i32 %rcc.tmp.339, %rcc.tmp.340
  %rcc.tmp.342 = load i32, ptr %i
  %rcc.tmp.343 = add i32 %rcc.tmp.341, %rcc.tmp.342
  %rcc.tmp.344 = add i32 %rcc.tmp.343, 0
  %rcc.tmp.345 = getelementptr [2500 x i1], ptr %is_palindrome, i32 0, i32 %rcc.tmp.344
  %rcc.tmp.346 = load i1, ptr %rcc.tmp.345
  br i1 %rcc.tmp.346, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.348 = load i32, ptr %j.2
  %rcc.tmp.349 = icmp eq i32 %rcc.tmp.348, 0
  br i1 %rcc.tmp.349, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.351 = load i32, ptr %i
  %rcc.tmp.352 = add i32 %rcc.tmp.351, 0
  %rcc.tmp.353 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.352
  store i32 0, ptr %rcc.tmp.353
  br label %if.merge.5
if.else.5:
  %rcc.tmp.356 = load i32, ptr %j.2
  %rcc.tmp.357 = sub i32 %rcc.tmp.356, 1
  %rcc.tmp.358 = add i32 %rcc.tmp.357, 0
  %rcc.tmp.359 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.358
  %rcc.tmp.360 = load i32, ptr %rcc.tmp.359
  %rcc.tmp.361 = add i32 %rcc.tmp.360, 1
  %rcc.tmp.362 = load i32, ptr %i
  %rcc.tmp.363 = add i32 %rcc.tmp.362, 0
  %rcc.tmp.364 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.363
  %rcc.tmp.365 = load i32, ptr %rcc.tmp.364
  %rcc.tmp.366 = icmp slt i32 %rcc.tmp.361, %rcc.tmp.365
  br i1 %rcc.tmp.366, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.368 = load i32, ptr %i
  %rcc.tmp.369 = add i32 %rcc.tmp.368, 0
  %rcc.tmp.370 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.369
  %rcc.tmp.371 = load i32, ptr %j.2
  %rcc.tmp.372 = sub i32 %rcc.tmp.371, 1
  %rcc.tmp.373 = add i32 %rcc.tmp.372, 0
  %rcc.tmp.374 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.373
  %rcc.tmp.375 = load i32, ptr %rcc.tmp.374
  %rcc.tmp.376 = add i32 %rcc.tmp.375, 1
  store i32 %rcc.tmp.376, ptr %rcc.tmp.370
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.383 = load i32, ptr %j.2
  %rcc.tmp.384 = add i32 %rcc.tmp.383, 1
  store i32 %rcc.tmp.384, ptr %j.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.387 = load i32, ptr %i
  %rcc.tmp.388 = add i32 %rcc.tmp.387, 1
  store i32 %rcc.tmp.388, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.391 = load i32, ptr %length..tmp
  %rcc.tmp.392 = sub i32 %rcc.tmp.391, 1
  %rcc.tmp.393 = add i32 %rcc.tmp.392, 0
  %rcc.tmp.394 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.393
  %rcc.tmp.395 = load i32, ptr %rcc.tmp.394
  ret i32 %rcc.tmp.395
}
define i32 @stringReconstructionDP.([50 x i32]* %string.tmp, i32 %length.tmp) {
entry:
  %string..local = alloca [50 x i32] 
  %length..tmp = alloca i32 
  %dp = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  %rcc.tmp.121 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 30
  %rcc.tmp.122 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 30
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.123, ptr %rcc.tmp.122
  %rcc.tmp.125 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 31
  %rcc.tmp.126 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 31
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %rcc.tmp.126
  %rcc.tmp.129 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 32
  %rcc.tmp.130 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 32
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %rcc.tmp.130
  %rcc.tmp.133 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 33
  %rcc.tmp.134 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 33
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.135, ptr %rcc.tmp.134
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 34
  %rcc.tmp.138 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 34
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 35
  %rcc.tmp.142 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 35
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  %rcc.tmp.145 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 36
  %rcc.tmp.146 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 36
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  %rcc.tmp.149 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 37
  %rcc.tmp.150 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 37
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 38
  %rcc.tmp.154 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 38
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.155, ptr %rcc.tmp.154
  %rcc.tmp.157 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 39
  %rcc.tmp.158 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 39
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 40
  %rcc.tmp.162 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 40
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 41
  %rcc.tmp.166 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 41
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 42
  %rcc.tmp.170 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 42
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.169
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 43
  %rcc.tmp.174 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 43
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.173
  store i32 %rcc.tmp.175, ptr %rcc.tmp.174
  %rcc.tmp.177 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 44
  %rcc.tmp.178 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 44
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.177
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 45
  %rcc.tmp.182 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 45
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.181
  store i32 %rcc.tmp.183, ptr %rcc.tmp.182
  %rcc.tmp.185 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 46
  %rcc.tmp.186 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 46
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.187, ptr %rcc.tmp.186
  %rcc.tmp.189 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 47
  %rcc.tmp.190 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 47
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.191, ptr %rcc.tmp.190
  %rcc.tmp.193 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 48
  %rcc.tmp.194 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 48
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.195, ptr %rcc.tmp.194
  %rcc.tmp.197 = getelementptr [50 x i32], ptr %string.tmp, i32 0, i32 49
  %rcc.tmp.198 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 49
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.197
  store i32 %rcc.tmp.199, ptr %rcc.tmp.198
  store i32 %length.tmp, ptr %length..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.204 = load i32, ptr %fill.idx
  %rcc.tmp.205 = icmp slt i32 %rcc.tmp.204, 50
  br i1 %rcc.tmp.205, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.207 = load i32, ptr %fill.idx
  %rcc.tmp.208 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.207
  store i32 0, ptr %rcc.tmp.208
  %rcc.tmp.210 = add i32 %rcc.tmp.207, 1
  store i32 %rcc.tmp.210, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.213 = getelementptr [50 x i32], ptr %dp, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.213
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.217 = load i32, ptr %i
  %rcc.tmp.218 = load i32, ptr %length..tmp
  %rcc.tmp.219 = icmp sle i32 %rcc.tmp.217, %rcc.tmp.218
  br i1 %rcc.tmp.219, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.222 = load i32, ptr %i
  %rcc.tmp.223 = icmp sge i32 %rcc.tmp.222, 1
  br i1 %rcc.tmp.223, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.225 = load i32, ptr %i
  %rcc.tmp.226 = sub i32 %rcc.tmp.225, 1
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 0
  %rcc.tmp.228 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.227
  %rcc.tmp.229 = load i32, ptr %rcc.tmp.228
  %rcc.tmp.230 = icmp sge i32 %rcc.tmp.229, 65
  br label %sc.merge
sc.merge:
  %rcc.tmp.232 = phi i1 [0, %while.body], [%rcc.tmp.230, %and.rhs]
  br i1 %rcc.tmp.232, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.234 = load i32, ptr %i
  %rcc.tmp.235 = sub i32 %rcc.tmp.234, 1
  %rcc.tmp.236 = add i32 %rcc.tmp.235, 0
  %rcc.tmp.237 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.236
  %rcc.tmp.238 = load i32, ptr %rcc.tmp.237
  %rcc.tmp.239 = icmp sle i32 %rcc.tmp.238, 90
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.241 = phi i1 [0, %sc.merge], [%rcc.tmp.239, %and.rhs.2]
  br i1 %rcc.tmp.241, label %if.then, label %if.else
if.then:
  %rcc.tmp.243 = load i32, ptr %i
  %rcc.tmp.244 = add i32 %rcc.tmp.243, 0
  %rcc.tmp.245 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.244
  %rcc.tmp.246 = load i32, ptr %i
  %rcc.tmp.247 = add i32 %rcc.tmp.246, 0
  %rcc.tmp.248 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.247
  %rcc.tmp.249 = load i32, ptr %rcc.tmp.248
  %rcc.tmp.250 = load i32, ptr %i
  %rcc.tmp.251 = sub i32 %rcc.tmp.250, 1
  %rcc.tmp.252 = add i32 %rcc.tmp.251, 0
  %rcc.tmp.253 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.252
  %rcc.tmp.254 = load i32, ptr %rcc.tmp.253
  %rcc.tmp.255 = add i32 %rcc.tmp.249, %rcc.tmp.254
  store i32 %rcc.tmp.255, ptr %rcc.tmp.245
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.259 = load i32, ptr %i
  %rcc.tmp.260 = icmp sge i32 %rcc.tmp.259, 2
  br i1 %rcc.tmp.260, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.262 = load i32, ptr %i
  %rcc.tmp.263 = sub i32 %rcc.tmp.262, 2
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %rcc.tmp.265
  %rcc.tmp.267 = icmp sge i32 %rcc.tmp.266, 65
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.269 = phi i1 [0, %if.merge], [%rcc.tmp.267, %and.rhs.3]
  br i1 %rcc.tmp.269, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.271 = load i32, ptr %i
  %rcc.tmp.272 = sub i32 %rcc.tmp.271, 2
  %rcc.tmp.273 = add i32 %rcc.tmp.272, 0
  %rcc.tmp.274 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.273
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.274
  %rcc.tmp.276 = icmp sle i32 %rcc.tmp.275, 90
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.278 = phi i1 [0, %sc.merge.3], [%rcc.tmp.276, %and.rhs.4]
  br i1 %rcc.tmp.278, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.280 = load i32, ptr %i
  %rcc.tmp.281 = sub i32 %rcc.tmp.280, 1
  %rcc.tmp.282 = add i32 %rcc.tmp.281, 0
  %rcc.tmp.283 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.282
  %rcc.tmp.284 = load i32, ptr %rcc.tmp.283
  %rcc.tmp.285 = icmp sge i32 %rcc.tmp.284, 65
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.287 = phi i1 [0, %sc.merge.4], [%rcc.tmp.285, %and.rhs.5]
  br i1 %rcc.tmp.287, label %and.rhs.6, label %sc.merge.6
and.rhs.6:
  %rcc.tmp.289 = load i32, ptr %i
  %rcc.tmp.290 = sub i32 %rcc.tmp.289, 1
  %rcc.tmp.291 = add i32 %rcc.tmp.290, 0
  %rcc.tmp.292 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.291
  %rcc.tmp.293 = load i32, ptr %rcc.tmp.292
  %rcc.tmp.294 = icmp sle i32 %rcc.tmp.293, 90
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.296 = phi i1 [0, %sc.merge.5], [%rcc.tmp.294, %and.rhs.6]
  br i1 %rcc.tmp.296, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.298 = load i32, ptr %i
  %rcc.tmp.299 = add i32 %rcc.tmp.298, 0
  %rcc.tmp.300 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.299
  %rcc.tmp.301 = load i32, ptr %i
  %rcc.tmp.302 = add i32 %rcc.tmp.301, 0
  %rcc.tmp.303 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.302
  %rcc.tmp.304 = load i32, ptr %rcc.tmp.303
  %rcc.tmp.305 = load i32, ptr %i
  %rcc.tmp.306 = sub i32 %rcc.tmp.305, 2
  %rcc.tmp.307 = add i32 %rcc.tmp.306, 0
  %rcc.tmp.308 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.307
  %rcc.tmp.309 = load i32, ptr %rcc.tmp.308
  %rcc.tmp.310 = add i32 %rcc.tmp.304, %rcc.tmp.309
  store i32 %rcc.tmp.310, ptr %rcc.tmp.300
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.314 = load i32, ptr %i
  %rcc.tmp.315 = icmp sge i32 %rcc.tmp.314, 3
  br i1 %rcc.tmp.315, label %and.rhs.7, label %sc.merge.7
and.rhs.7:
  %rcc.tmp.317 = load i32, ptr %i
  %rcc.tmp.318 = sub i32 %rcc.tmp.317, 3
  %rcc.tmp.319 = add i32 %rcc.tmp.318, 0
  %rcc.tmp.320 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.319
  %rcc.tmp.321 = load i32, ptr %rcc.tmp.320
  %rcc.tmp.322 = icmp sge i32 %rcc.tmp.321, 65
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.324 = phi i1 [0, %if.merge.2], [%rcc.tmp.322, %and.rhs.7]
  br i1 %rcc.tmp.324, label %and.rhs.8, label %sc.merge.8
and.rhs.8:
  %rcc.tmp.326 = load i32, ptr %i
  %rcc.tmp.327 = sub i32 %rcc.tmp.326, 3
  %rcc.tmp.328 = add i32 %rcc.tmp.327, 0
  %rcc.tmp.329 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.328
  %rcc.tmp.330 = load i32, ptr %rcc.tmp.329
  %rcc.tmp.331 = icmp sle i32 %rcc.tmp.330, 90
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.333 = phi i1 [0, %sc.merge.7], [%rcc.tmp.331, %and.rhs.8]
  br i1 %rcc.tmp.333, label %and.rhs.9, label %sc.merge.9
and.rhs.9:
  %rcc.tmp.335 = load i32, ptr %i
  %rcc.tmp.336 = sub i32 %rcc.tmp.335, 2
  %rcc.tmp.337 = add i32 %rcc.tmp.336, 0
  %rcc.tmp.338 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.337
  %rcc.tmp.339 = load i32, ptr %rcc.tmp.338
  %rcc.tmp.340 = icmp sge i32 %rcc.tmp.339, 65
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.342 = phi i1 [0, %sc.merge.8], [%rcc.tmp.340, %and.rhs.9]
  br i1 %rcc.tmp.342, label %and.rhs.10, label %sc.merge.10
and.rhs.10:
  %rcc.tmp.344 = load i32, ptr %i
  %rcc.tmp.345 = sub i32 %rcc.tmp.344, 2
  %rcc.tmp.346 = add i32 %rcc.tmp.345, 0
  %rcc.tmp.347 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.346
  %rcc.tmp.348 = load i32, ptr %rcc.tmp.347
  %rcc.tmp.349 = icmp sle i32 %rcc.tmp.348, 90
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.351 = phi i1 [0, %sc.merge.9], [%rcc.tmp.349, %and.rhs.10]
  br i1 %rcc.tmp.351, label %and.rhs.11, label %sc.merge.11
and.rhs.11:
  %rcc.tmp.353 = load i32, ptr %i
  %rcc.tmp.354 = sub i32 %rcc.tmp.353, 1
  %rcc.tmp.355 = add i32 %rcc.tmp.354, 0
  %rcc.tmp.356 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.355
  %rcc.tmp.357 = load i32, ptr %rcc.tmp.356
  %rcc.tmp.358 = icmp sge i32 %rcc.tmp.357, 65
  br label %sc.merge.11
sc.merge.11:
  %rcc.tmp.360 = phi i1 [0, %sc.merge.10], [%rcc.tmp.358, %and.rhs.11]
  br i1 %rcc.tmp.360, label %and.rhs.12, label %sc.merge.12
and.rhs.12:
  %rcc.tmp.362 = load i32, ptr %i
  %rcc.tmp.363 = sub i32 %rcc.tmp.362, 1
  %rcc.tmp.364 = add i32 %rcc.tmp.363, 0
  %rcc.tmp.365 = getelementptr [50 x i32], ptr %string..local, i32 0, i32 %rcc.tmp.364
  %rcc.tmp.366 = load i32, ptr %rcc.tmp.365
  %rcc.tmp.367 = icmp sle i32 %rcc.tmp.366, 90
  br label %sc.merge.12
sc.merge.12:
  %rcc.tmp.369 = phi i1 [0, %sc.merge.11], [%rcc.tmp.367, %and.rhs.12]
  br i1 %rcc.tmp.369, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.371 = load i32, ptr %i
  %rcc.tmp.372 = add i32 %rcc.tmp.371, 0
  %rcc.tmp.373 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.372
  %rcc.tmp.374 = load i32, ptr %i
  %rcc.tmp.375 = add i32 %rcc.tmp.374, 0
  %rcc.tmp.376 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.375
  %rcc.tmp.377 = load i32, ptr %rcc.tmp.376
  %rcc.tmp.378 = load i32, ptr %i
  %rcc.tmp.379 = sub i32 %rcc.tmp.378, 3
  %rcc.tmp.380 = add i32 %rcc.tmp.379, 0
  %rcc.tmp.381 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.380
  %rcc.tmp.382 = load i32, ptr %rcc.tmp.381
  %rcc.tmp.383 = sdiv i32 %rcc.tmp.382, 2
  %rcc.tmp.384 = add i32 %rcc.tmp.377, %rcc.tmp.383
  store i32 %rcc.tmp.384, ptr %rcc.tmp.373
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.388 = load i32, ptr %i
  %rcc.tmp.389 = add i32 %rcc.tmp.388, 1
  store i32 %rcc.tmp.389, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.392 = load i32, ptr %length..tmp
  %rcc.tmp.393 = add i32 %rcc.tmp.392, 0
  %rcc.tmp.394 = getelementptr [50 x i32], ptr %dp, i32 0, i32 %rcc.tmp.393
  %rcc.tmp.395 = load i32, ptr %rcc.tmp.394
  ret i32 %rcc.tmp.395
}
define void @testOptimizationProblems.() {
entry:
  %knapsack_result = alloca i32 
  %unbounded_knapsack_result = alloca i32 
  %scheduling_result = alloca i32 
  %partition_result = alloca i32 
  %matrix_chain_result = alloca i32 
  call void @printlnInt.(i32 1805)
  %rcc.tmp.2 = call i32 @knapsackDP.(i32 50, i32 100)
  store i32 %rcc.tmp.2, ptr %knapsack_result
  %rcc.tmp.4 = load i32, ptr %knapsack_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @unboundedKnapsackDP.(i32 50, i32 100)
  store i32 %rcc.tmp.6, ptr %unbounded_knapsack_result
  %rcc.tmp.8 = load i32, ptr %unbounded_knapsack_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @jobSchedulingDP.(i32 30)
  store i32 %rcc.tmp.10, ptr %scheduling_result
  %rcc.tmp.12 = load i32, ptr %scheduling_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @partitionProblemDP.(i32 40)
  store i32 %rcc.tmp.14, ptr %partition_result
  %rcc.tmp.16 = load i32, ptr %partition_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @matrixChainMultiplicationDP.(i32 20)
  store i32 %rcc.tmp.18, ptr %matrix_chain_result
  %rcc.tmp.20 = load i32, ptr %matrix_chain_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 1806)
  ret void
}
define i32 @knapsackDP.(i32 %num_items.tmp, i32 %capacity.tmp) {
entry:
  %num_items..tmp = alloca i32 
  %capacity..tmp = alloca i32 
  %weights = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %values = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %dp = alloca [5151 x i32] 
  %fill.idx.3 = alloca i32 
  %w = alloca i32 
  %take_value = alloca i32 
  store i32 %num_items.tmp, ptr %num_items..tmp
  store i32 %capacity.tmp, ptr %capacity..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %values, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  store i32 111, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %num_items..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %seed
  %rcc.tmp.34 = mul i32 %rcc.tmp.33, 525
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 390422
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 483647
  store i32 %rcc.tmp.36, ptr %seed
  %rcc.tmp.38 = load i32, ptr %seed
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  %rcc.tmp.41 = load i32, ptr %seed
  %rcc.tmp.42 = sub i32 0, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %seed
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 20
  %rcc.tmp.51 = add i32 1, %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %rcc.tmp.48
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [50 x i32], ptr %values, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %seed
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 50
  %rcc.tmp.58 = add i32 10, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %rcc.tmp.55
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.66 = load i32, ptr %fill.idx.3
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 5151
  br i1 %rcc.tmp.67, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.69 = load i32, ptr %fill.idx.3
  %rcc.tmp.70 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.69
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.72, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 1, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = load i32, ptr %num_items..tmp
  %rcc.tmp.79 = icmp sle i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 1, ptr %w
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.84 = load i32, ptr %w
  %rcc.tmp.85 = load i32, ptr %capacity..tmp
  %rcc.tmp.86 = icmp sle i32 %rcc.tmp.84, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = load i32, ptr %capacity..tmp
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  %rcc.tmp.92 = mul i32 %rcc.tmp.89, %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %w
  %rcc.tmp.94 = add i32 %rcc.tmp.92, %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = sub i32 %rcc.tmp.97, 1
  %rcc.tmp.99 = load i32, ptr %capacity..tmp
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  %rcc.tmp.101 = mul i32 %rcc.tmp.98, %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %w
  %rcc.tmp.103 = add i32 %rcc.tmp.101, %rcc.tmp.102
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.106, ptr %rcc.tmp.96
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = sub i32 %rcc.tmp.108, 1
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %w
  %rcc.tmp.114 = icmp sle i32 %rcc.tmp.112, %rcc.tmp.113
  br i1 %rcc.tmp.114, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = sub i32 %rcc.tmp.116, 1
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = getelementptr [50 x i32], ptr %values, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %i
  %rcc.tmp.122 = sub i32 %rcc.tmp.121, 1
  %rcc.tmp.123 = load i32, ptr %capacity..tmp
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  %rcc.tmp.125 = mul i32 %rcc.tmp.122, %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %w
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = sub i32 %rcc.tmp.127, 1
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = sub i32 %rcc.tmp.126, %rcc.tmp.131
  %rcc.tmp.133 = add i32 %rcc.tmp.125, %rcc.tmp.132
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  %rcc.tmp.137 = add i32 %rcc.tmp.120, %rcc.tmp.136
  store i32 %rcc.tmp.137, ptr %take_value
  %rcc.tmp.139 = load i32, ptr %take_value
  %rcc.tmp.140 = load i32, ptr %i
  %rcc.tmp.141 = load i32, ptr %capacity..tmp
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 1
  %rcc.tmp.143 = mul i32 %rcc.tmp.140, %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %w
  %rcc.tmp.145 = add i32 %rcc.tmp.143, %rcc.tmp.144
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.147
  %rcc.tmp.149 = icmp sgt i32 %rcc.tmp.139, %rcc.tmp.148
  br i1 %rcc.tmp.149, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = load i32, ptr %capacity..tmp
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  %rcc.tmp.154 = mul i32 %rcc.tmp.151, %rcc.tmp.153
  %rcc.tmp.155 = load i32, ptr %w
  %rcc.tmp.156 = add i32 %rcc.tmp.154, %rcc.tmp.155
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 0
  %rcc.tmp.158 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.157
  %rcc.tmp.159 = load i32, ptr %take_value
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.165 = load i32, ptr %w
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %w
  br label %while.cond.3
while.end.3:
  %rcc.tmp.169 = load i32, ptr %i
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.173 = load i32, ptr %num_items..tmp
  %rcc.tmp.174 = load i32, ptr %capacity..tmp
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 1
  %rcc.tmp.176 = mul i32 %rcc.tmp.173, %rcc.tmp.175
  %rcc.tmp.177 = load i32, ptr %capacity..tmp
  %rcc.tmp.178 = add i32 %rcc.tmp.176, %rcc.tmp.177
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 0
  %rcc.tmp.180 = getelementptr [5151 x i32], ptr %dp, i32 0, i32 %rcc.tmp.179
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  ret i32 %rcc.tmp.181
}
define i32 @unboundedKnapsackDP.(i32 %num_items.tmp, i32 %capacity.tmp) {
entry:
  %num_items..tmp = alloca i32 
  %capacity..tmp = alloca i32 
  %weights = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %values = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %dp = alloca [101 x i32] 
  %fill.idx.3 = alloca i32 
  %w = alloca i32 
  %new_value = alloca i32 
  store i32 %num_items.tmp, ptr %num_items..tmp
  store i32 %capacity.tmp, ptr %capacity..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %values, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  store i32 222, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %num_items..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %seed
  %rcc.tmp.34 = mul i32 %rcc.tmp.33, 1664
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 904223
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 83647
  store i32 %rcc.tmp.36, ptr %seed
  %rcc.tmp.38 = load i32, ptr %seed
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  %rcc.tmp.41 = load i32, ptr %seed
  %rcc.tmp.42 = sub i32 0, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %seed
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 15
  %rcc.tmp.51 = add i32 1, %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %rcc.tmp.48
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [50 x i32], ptr %values, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %seed
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 40
  %rcc.tmp.58 = add i32 5, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %rcc.tmp.55
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.66 = load i32, ptr %fill.idx.3
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 101
  br i1 %rcc.tmp.67, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.69 = load i32, ptr %fill.idx.3
  %rcc.tmp.70 = getelementptr [101 x i32], ptr %dp, i32 0, i32 %rcc.tmp.69
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.72, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 1, ptr %w
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.77 = load i32, ptr %w
  %rcc.tmp.78 = load i32, ptr %capacity..tmp
  %rcc.tmp.79 = icmp sle i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = load i32, ptr %num_items..tmp
  %rcc.tmp.86 = icmp slt i32 %rcc.tmp.84, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %w
  %rcc.tmp.94 = icmp sle i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %values, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %w
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [50 x i32], ptr %weights, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = sub i32 %rcc.tmp.100, %rcc.tmp.104
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = getelementptr [101 x i32], ptr %dp, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.107
  %rcc.tmp.109 = add i32 %rcc.tmp.99, %rcc.tmp.108
  store i32 %rcc.tmp.109, ptr %new_value
  %rcc.tmp.111 = load i32, ptr %new_value
  %rcc.tmp.112 = load i32, ptr %w
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = getelementptr [101 x i32], ptr %dp, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = icmp sgt i32 %rcc.tmp.111, %rcc.tmp.115
  br i1 %rcc.tmp.116, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.118 = load i32, ptr %w
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [101 x i32], ptr %dp, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %new_value
  store i32 %rcc.tmp.121, ptr %rcc.tmp.120
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 1
  store i32 %rcc.tmp.128, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.131 = load i32, ptr %w
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  store i32 %rcc.tmp.132, ptr %w
  br label %while.cond.2
while.end.2:
  %rcc.tmp.135 = load i32, ptr %capacity..tmp
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [101 x i32], ptr %dp, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  ret i32 %rcc.tmp.138
}
define i32 @jobSchedulingDP.(i32 %num_jobs.tmp) {
entry:
  %num_jobs..tmp = alloca i32 
  %profits = alloca [30 x i32] 
  %fill.idx = alloca i32 
  %deadlines = alloca [30 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %j = alloca i32 
  %temp_profit = alloca i32 
  %temp_deadline = alloca i32 
  %schedule = alloca [20 x i1] 
  %fill.idx.3 = alloca i32 
  %total_profit = alloca i32 
  %slot = alloca i32 
  store i32 %num_jobs.tmp, ptr %num_jobs..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 30
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 30
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  store i32 33, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = load i32, ptr %num_jobs..tmp
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.32 = load i32, ptr %seed
  %rcc.tmp.33 = mul i32 %rcc.tmp.32, 1664
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 904223
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 83647
  store i32 %rcc.tmp.35, ptr %seed
  %rcc.tmp.37 = load i32, ptr %seed
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 0
  br i1 %rcc.tmp.38, label %if.then, label %if.else
if.then:
  %rcc.tmp.40 = load i32, ptr %seed
  %rcc.tmp.41 = sub i32 0, %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %seed
  %rcc.tmp.49 = srem i32 %rcc.tmp.48, 100
  %rcc.tmp.50 = add i32 10, %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %rcc.tmp.47
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %seed
  %rcc.tmp.56 = srem i32 %rcc.tmp.55, 20
  %rcc.tmp.57 = add i32 1, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %rcc.tmp.54
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = load i32, ptr %num_jobs..tmp
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = load i32, ptr %num_jobs..tmp
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = sub i32 %rcc.tmp.74, %rcc.tmp.75
  %rcc.tmp.77 = sub i32 %rcc.tmp.76, 1
  %rcc.tmp.78 = icmp slt i32 %rcc.tmp.73, %rcc.tmp.77
  br i1 %rcc.tmp.78, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.81 = load i32, ptr %j
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = icmp slt i32 %rcc.tmp.84, %rcc.tmp.89
  br i1 %rcc.tmp.90, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.94
  store i32 %rcc.tmp.95, ptr %temp_profit
  %rcc.tmp.97 = load i32, ptr %j
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %j
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  store i32 %rcc.tmp.104, ptr %rcc.tmp.99
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %temp_profit
  store i32 %rcc.tmp.110, ptr %rcc.tmp.109
  %rcc.tmp.112 = load i32, ptr %j
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  store i32 %rcc.tmp.115, ptr %temp_deadline
  %rcc.tmp.117 = load i32, ptr %j
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.120 = load i32, ptr %j
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %rcc.tmp.119
  %rcc.tmp.126 = load i32, ptr %j
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %temp_deadline
  store i32 %rcc.tmp.130, ptr %rcc.tmp.129
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.134 = load i32, ptr %j
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  store i32 %rcc.tmp.135, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.144 = load i32, ptr %fill.idx.3
  %rcc.tmp.145 = icmp slt i32 %rcc.tmp.144, 20
  br i1 %rcc.tmp.145, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.147 = load i32, ptr %fill.idx.3
  %rcc.tmp.148 = getelementptr [20 x i1], ptr %schedule, i32 0, i32 %rcc.tmp.147
  store i1 0, ptr %rcc.tmp.148
  %rcc.tmp.150 = add i32 %rcc.tmp.147, 1
  store i32 %rcc.tmp.150, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %total_profit
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.156 = load i32, ptr %i
  %rcc.tmp.157 = load i32, ptr %num_jobs..tmp
  %rcc.tmp.158 = icmp slt i32 %rcc.tmp.156, %rcc.tmp.157
  br i1 %rcc.tmp.158, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.161 = load i32, ptr %i
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 0
  %rcc.tmp.163 = getelementptr [30 x i32], ptr %deadlines, i32 0, i32 %rcc.tmp.162
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.163
  %rcc.tmp.165 = sub i32 %rcc.tmp.164, 1
  store i32 %rcc.tmp.165, ptr %slot
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.168 = load i32, ptr %slot
  %rcc.tmp.169 = icmp sge i32 %rcc.tmp.168, 0
  br i1 %rcc.tmp.169, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.172 = load i32, ptr %slot
  %rcc.tmp.173 = icmp slt i32 %rcc.tmp.172, 20
  br i1 %rcc.tmp.173, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.175 = load i32, ptr %slot
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 0
  %rcc.tmp.177 = getelementptr [20 x i1], ptr %schedule, i32 0, i32 %rcc.tmp.176
  %rcc.tmp.178 = load i1, ptr %rcc.tmp.177
  %rcc.tmp.179 = xor i1 %rcc.tmp.178, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.181 = phi i1 [0, %while.body.5], [%rcc.tmp.179, %and.rhs]
  br i1 %rcc.tmp.181, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.183 = load i32, ptr %slot
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 0
  %rcc.tmp.185 = getelementptr [20 x i1], ptr %schedule, i32 0, i32 %rcc.tmp.184
  store i1 1, ptr %rcc.tmp.185
  %rcc.tmp.187 = load i32, ptr %total_profit
  %rcc.tmp.188 = load i32, ptr %i
  %rcc.tmp.189 = add i32 %rcc.tmp.188, 0
  %rcc.tmp.190 = getelementptr [30 x i32], ptr %profits, i32 0, i32 %rcc.tmp.189
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.190
  %rcc.tmp.192 = add i32 %rcc.tmp.187, %rcc.tmp.191
  store i32 %rcc.tmp.192, ptr %total_profit
  br label %while.linker.5
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.196 = load i32, ptr %slot
  %rcc.tmp.197 = sub i32 %rcc.tmp.196, 1
  store i32 %rcc.tmp.197, ptr %slot
  br label %while.cond.5
while.end.5:
  %rcc.tmp.200 = load i32, ptr %i
  %rcc.tmp.201 = add i32 %rcc.tmp.200, 1
  store i32 %rcc.tmp.201, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.204 = load i32, ptr %total_profit
  ret i32 %rcc.tmp.204
}
define i32 @partitionProblemDP.(i32 %num_elements.tmp) {
entry:
  %num_elements..tmp = alloca i32 
  %elements = alloca [40 x i32] 
  %fill.idx = alloca i32 
  %total_sum = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %target = alloca i32 
  %dp = alloca [1001 x i1] 
  %fill.idx.2 = alloca i32 
  %j = alloca i32 
  store i32 %num_elements.tmp, ptr %num_elements..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 40
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [40 x i32], ptr %elements, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %total_sum
  store i32 0, ptr %i
  store i32 44, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %num_elements..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %seed
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 1664
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 904223
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 83647
  store i32 %rcc.tmp.25, ptr %seed
  %rcc.tmp.27 = load i32, ptr %seed
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %seed
  %rcc.tmp.31 = sub i32 0, %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [40 x i32], ptr %elements, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %seed
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 50
  %rcc.tmp.40 = add i32 1, %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %rcc.tmp.37
  %rcc.tmp.42 = load i32, ptr %total_sum
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [40 x i32], ptr %elements, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = add i32 %rcc.tmp.42, %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %total_sum
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.53 = load i32, ptr %total_sum
  %rcc.tmp.54 = srem i32 %rcc.tmp.53, 2
  %rcc.tmp.55 = icmp ne i32 %rcc.tmp.54, 0
  br i1 %rcc.tmp.55, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.59 = load i32, ptr %total_sum
  %rcc.tmp.60 = sdiv i32 %rcc.tmp.59, 2
  store i32 %rcc.tmp.60, ptr %target
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.64 = load i32, ptr %fill.idx.2
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 1001
  br i1 %rcc.tmp.65, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.67 = load i32, ptr %fill.idx.2
  %rcc.tmp.68 = getelementptr [1001 x i1], ptr %dp, i32 0, i32 %rcc.tmp.67
  store i1 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.70, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.73 = getelementptr [1001 x i1], ptr %dp, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.73
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = load i32, ptr %num_elements..tmp
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.82 = load i32, ptr %target
  store i32 %rcc.tmp.82, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [40 x i32], ptr %elements, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = icmp sge i32 %rcc.tmp.85, %rcc.tmp.89
  br i1 %rcc.tmp.90, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.93 = load i32, ptr %j
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [1001 x i1], ptr %dp, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %j
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [1001 x i1], ptr %dp, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i1, ptr %rcc.tmp.98
  br i1 %rcc.tmp.99, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.101 = load i32, ptr %j
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = getelementptr [40 x i32], ptr %elements, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = sub i32 %rcc.tmp.101, %rcc.tmp.105
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [1001 x i1], ptr %dp, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i1, ptr %rcc.tmp.108
  br label %sc.merge
sc.merge:
  %rcc.tmp.111 = phi i1 [1, %while.body.3], [%rcc.tmp.109, %or.rhs]
  store i1 %rcc.tmp.111, ptr %rcc.tmp.95
  %rcc.tmp.113 = load i32, ptr %j
  %rcc.tmp.114 = sub i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.121 = load i32, ptr %target
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [1001 x i1], ptr %dp, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i1, ptr %rcc.tmp.123
  br i1 %rcc.tmp.124, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 1
if.else.3:
  ret i32 0
if.merge.3:
  ret i32 undef
}
define i32 @matrixChainMultiplicationDP.(i32 %num_matrices.tmp) {
entry:
  %num_matrices..tmp = alloca i32 
  %dimensions = alloca [21 x i32] 
  %fill.idx = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %dp = alloca [400 x i32] 
  %fill.idx.2 = alloca i32 
  %length = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %cost = alloca i32 
  store i32 %num_matrices.tmp, ptr %num_matrices..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 21
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [21 x i32], ptr %dimensions, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 55, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %num_matrices..tmp
  %rcc.tmp.18 = icmp sle i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 1664
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 904223
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 83647
  store i32 %rcc.tmp.24, ptr %seed
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %seed
  %rcc.tmp.30 = sub i32 0, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [21 x i32], ptr %dimensions, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %seed
  %rcc.tmp.38 = srem i32 %rcc.tmp.37, 50
  %rcc.tmp.39 = add i32 10, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.36
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.47 = load i32, ptr %fill.idx.2
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 400
  br i1 %rcc.tmp.48, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.50 = load i32, ptr %fill.idx.2
  %rcc.tmp.51 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.53, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 2, ptr %length
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.58 = load i32, ptr %length
  %rcc.tmp.59 = load i32, ptr %num_matrices..tmp
  %rcc.tmp.60 = icmp sle i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 1, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = load i32, ptr %num_matrices..tmp
  %rcc.tmp.67 = load i32, ptr %length
  %rcc.tmp.68 = sub i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  %rcc.tmp.70 = icmp sle i32 %rcc.tmp.65, %rcc.tmp.69
  br i1 %rcc.tmp.70, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = load i32, ptr %length
  %rcc.tmp.75 = add i32 %rcc.tmp.73, %rcc.tmp.74
  %rcc.tmp.76 = sub i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %j
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = sub i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = mul i32 %rcc.tmp.79, 20
  %rcc.tmp.81 = load i32, ptr %j
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = add i32 %rcc.tmp.80, %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.84
  store i32 999999, ptr %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %i
  store i32 %rcc.tmp.87, ptr %k
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.90 = load i32, ptr %k
  %rcc.tmp.91 = load i32, ptr %j
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.90, %rcc.tmp.91
  br i1 %rcc.tmp.92, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = sub i32 %rcc.tmp.95, 1
  %rcc.tmp.97 = mul i32 %rcc.tmp.96, 20
  %rcc.tmp.98 = load i32, ptr %k
  %rcc.tmp.99 = sub i32 %rcc.tmp.98, 1
  %rcc.tmp.100 = add i32 %rcc.tmp.97, %rcc.tmp.99
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %k
  %rcc.tmp.105 = mul i32 %rcc.tmp.104, 20
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = sub i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = add i32 %rcc.tmp.105, %rcc.tmp.107
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = add i32 %rcc.tmp.103, %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = sub i32 %rcc.tmp.113, 1
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = getelementptr [21 x i32], ptr %dimensions, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.118 = load i32, ptr %k
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [21 x i32], ptr %dimensions, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  %rcc.tmp.122 = mul i32 %rcc.tmp.117, %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %j
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [21 x i32], ptr %dimensions, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = mul i32 %rcc.tmp.122, %rcc.tmp.126
  %rcc.tmp.128 = add i32 %rcc.tmp.112, %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %cost
  %rcc.tmp.130 = load i32, ptr %cost
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = sub i32 %rcc.tmp.131, 1
  %rcc.tmp.133 = mul i32 %rcc.tmp.132, 20
  %rcc.tmp.134 = load i32, ptr %j
  %rcc.tmp.135 = sub i32 %rcc.tmp.134, 1
  %rcc.tmp.136 = add i32 %rcc.tmp.133, %rcc.tmp.135
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  %rcc.tmp.140 = icmp slt i32 %rcc.tmp.130, %rcc.tmp.139
  br i1 %rcc.tmp.140, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = sub i32 %rcc.tmp.142, 1
  %rcc.tmp.144 = mul i32 %rcc.tmp.143, 20
  %rcc.tmp.145 = load i32, ptr %j
  %rcc.tmp.146 = sub i32 %rcc.tmp.145, 1
  %rcc.tmp.147 = add i32 %rcc.tmp.144, %rcc.tmp.146
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 0
  %rcc.tmp.149 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.150 = load i32, ptr %cost
  store i32 %rcc.tmp.150, ptr %rcc.tmp.149
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.154 = load i32, ptr %k
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %k
  br label %while.cond.4
while.end.4:
  %rcc.tmp.158 = load i32, ptr %i
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 1
  store i32 %rcc.tmp.159, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.162 = load i32, ptr %length
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 1
  store i32 %rcc.tmp.163, ptr %length
  br label %while.cond.2
while.end.2:
  %rcc.tmp.166 = load i32, ptr %num_matrices..tmp
  %rcc.tmp.167 = sub i32 %rcc.tmp.166, 1
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 0
  %rcc.tmp.169 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.168
  %rcc.tmp.170 = load i32, ptr %rcc.tmp.169
  ret i32 %rcc.tmp.170
}
define void @testGameTheoryDP.() {
entry:
  %game_result = alloca i32 
  %coin_game_result = alloca i32 
  %nim_result = alloca i32 
  call void @printlnInt.(i32 1807)
  %rcc.tmp.2 = call i32 @optimalGameStrategyDP.(i32 20)
  store i32 %rcc.tmp.2, ptr %game_result
  %rcc.tmp.4 = load i32, ptr %game_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @coinGameDP.(i32 30)
  store i32 %rcc.tmp.6, ptr %coin_game_result
  %rcc.tmp.8 = load i32, ptr %coin_game_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @nimGameDP.(i32 25)
  store i32 %rcc.tmp.10, ptr %nim_result
  %rcc.tmp.12 = load i32, ptr %nim_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 1808)
  ret void
}
define i32 @optimalGameStrategyDP.(i32 %num_coins.tmp) {
entry:
  %num_coins..tmp = alloca i32 
  %coins = alloca [20 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %dp = alloca [400 x i32] 
  %fill.idx.2 = alloca i32 
  %length = alloca i32 
  %j = alloca i32 
  %choose_i = alloca i32 
  %choose_j = alloca i32 
  store i32 %num_coins.tmp, ptr %num_coins..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 20
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [20 x i32], ptr %coins, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  store i32 66, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %num_coins..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 1664
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 904223
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 83647
  store i32 %rcc.tmp.24, ptr %seed
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %seed
  %rcc.tmp.30 = sub i32 0, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [20 x i32], ptr %coins, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %seed
  %rcc.tmp.38 = srem i32 %rcc.tmp.37, 100
  %rcc.tmp.39 = add i32 1, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.36
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.47 = load i32, ptr %fill.idx.2
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 400
  br i1 %rcc.tmp.48, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.50 = load i32, ptr %fill.idx.2
  %rcc.tmp.51 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.53, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = load i32, ptr %num_coins..tmp
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 20
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [20 x i32], ptr %coins, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.68
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 2, ptr %length
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.80 = load i32, ptr %length
  %rcc.tmp.81 = load i32, ptr %num_coins..tmp
  %rcc.tmp.82 = icmp sle i32 %rcc.tmp.80, %rcc.tmp.81
  br i1 %rcc.tmp.82, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = load i32, ptr %num_coins..tmp
  %rcc.tmp.89 = load i32, ptr %length
  %rcc.tmp.90 = sub i32 %rcc.tmp.88, %rcc.tmp.89
  %rcc.tmp.91 = icmp sle i32 %rcc.tmp.87, %rcc.tmp.90
  br i1 %rcc.tmp.91, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = load i32, ptr %length
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = sub i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %j
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [20 x i32], ptr %coins, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  %rcc.tmp.105 = mul i32 %rcc.tmp.104, 20
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = add i32 %rcc.tmp.105, %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = sub i32 %rcc.tmp.102, %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %choose_i
  %rcc.tmp.113 = load i32, ptr %j
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [20 x i32], ptr %coins, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = mul i32 %rcc.tmp.117, 20
  %rcc.tmp.119 = load i32, ptr %j
  %rcc.tmp.120 = sub i32 %rcc.tmp.119, 1
  %rcc.tmp.121 = add i32 %rcc.tmp.118, %rcc.tmp.120
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = sub i32 %rcc.tmp.116, %rcc.tmp.124
  store i32 %rcc.tmp.125, ptr %choose_j
  %rcc.tmp.127 = load i32, ptr %choose_i
  %rcc.tmp.128 = load i32, ptr %choose_j
  %rcc.tmp.129 = icmp sgt i32 %rcc.tmp.127, %rcc.tmp.128
  br i1 %rcc.tmp.129, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = mul i32 %rcc.tmp.131, 20
  %rcc.tmp.133 = load i32, ptr %j
  %rcc.tmp.134 = add i32 %rcc.tmp.132, %rcc.tmp.133
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %choose_i
  store i32 %rcc.tmp.137, ptr %rcc.tmp.136
  br label %if.merge.2
if.else.2:
  %rcc.tmp.140 = load i32, ptr %i
  %rcc.tmp.141 = mul i32 %rcc.tmp.140, 20
  %rcc.tmp.142 = load i32, ptr %j
  %rcc.tmp.143 = add i32 %rcc.tmp.141, %rcc.tmp.142
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 0
  %rcc.tmp.145 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.144
  %rcc.tmp.146 = load i32, ptr %choose_j
  store i32 %rcc.tmp.146, ptr %rcc.tmp.145
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.153 = load i32, ptr %length
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %length
  br label %while.cond.3
while.end.3:
  %rcc.tmp.157 = load i32, ptr %num_coins..tmp
  %rcc.tmp.158 = sub i32 %rcc.tmp.157, 1
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 0
  %rcc.tmp.160 = getelementptr [400 x i32], ptr %dp, i32 0, i32 %rcc.tmp.159
  %rcc.tmp.161 = load i32, ptr %rcc.tmp.160
  ret i32 %rcc.tmp.161
}
define i32 @coinGameDP.(i32 %num_coins.tmp) {
entry:
  %num_coins..tmp = alloca i32 
  %coins = alloca [30 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %dp = alloca [900 x i32] 
  %fill.idx.2 = alloca i32 
  %length = alloca i32 
  %j = alloca i32 
  %take_left = alloca i32 
  %take_right = alloca i32 
  store i32 %num_coins.tmp, ptr %num_coins..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 30
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  store i32 77, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %num_coins..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 1664
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 904223
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 83647
  store i32 %rcc.tmp.24, ptr %seed
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %seed
  %rcc.tmp.30 = sub i32 0, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %seed
  %rcc.tmp.38 = srem i32 %rcc.tmp.37, 50
  %rcc.tmp.39 = add i32 1, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.36
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.47 = load i32, ptr %fill.idx.2
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 900
  br i1 %rcc.tmp.48, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.50 = load i32, ptr %fill.idx.2
  %rcc.tmp.51 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.53, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = load i32, ptr %num_coins..tmp
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 30
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.68
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  %rcc.tmp.76 = load i32, ptr %num_coins..tmp
  %rcc.tmp.77 = icmp slt i32 %rcc.tmp.75, %rcc.tmp.76
  br i1 %rcc.tmp.77, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = icmp sgt i32 %rcc.tmp.82, %rcc.tmp.87
  br i1 %rcc.tmp.88, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = mul i32 %rcc.tmp.90, 30
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  %rcc.tmp.94 = add i32 %rcc.tmp.91, %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %rcc.tmp.96
  br label %if.merge.3
if.else.3:
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = mul i32 %rcc.tmp.103, 30
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  %rcc.tmp.107 = add i32 %rcc.tmp.104, %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 1
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.114, ptr %rcc.tmp.109
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 1
  store i32 %rcc.tmp.120, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 3, ptr %length
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.125 = load i32, ptr %length
  %rcc.tmp.126 = load i32, ptr %num_coins..tmp
  %rcc.tmp.127 = icmp sle i32 %rcc.tmp.125, %rcc.tmp.126
  br i1 %rcc.tmp.127, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = load i32, ptr %num_coins..tmp
  %rcc.tmp.134 = load i32, ptr %length
  %rcc.tmp.135 = sub i32 %rcc.tmp.133, %rcc.tmp.134
  %rcc.tmp.136 = icmp sle i32 %rcc.tmp.132, %rcc.tmp.135
  br i1 %rcc.tmp.136, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.139 = load i32, ptr %i
  %rcc.tmp.140 = load i32, ptr %length
  %rcc.tmp.141 = add i32 %rcc.tmp.139, %rcc.tmp.140
  %rcc.tmp.142 = sub i32 %rcc.tmp.141, 1
  store i32 %rcc.tmp.142, ptr %j
  %rcc.tmp.144 = load i32, ptr %i
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 2
  %rcc.tmp.150 = mul i32 %rcc.tmp.149, 30
  %rcc.tmp.151 = load i32, ptr %j
  %rcc.tmp.152 = add i32 %rcc.tmp.150, %rcc.tmp.151
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 0
  %rcc.tmp.154 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.153
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %i
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 1
  %rcc.tmp.158 = mul i32 %rcc.tmp.157, 30
  %rcc.tmp.159 = load i32, ptr %j
  %rcc.tmp.160 = sub i32 %rcc.tmp.159, 1
  %rcc.tmp.161 = add i32 %rcc.tmp.158, %rcc.tmp.160
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 0
  %rcc.tmp.163 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.162
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.163
  %rcc.tmp.165 = icmp slt i32 %rcc.tmp.155, %rcc.tmp.164
  br i1 %rcc.tmp.165, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.167 = load i32, ptr %i
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 2
  %rcc.tmp.169 = mul i32 %rcc.tmp.168, 30
  %rcc.tmp.170 = load i32, ptr %j
  %rcc.tmp.171 = add i32 %rcc.tmp.169, %rcc.tmp.170
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 0
  %rcc.tmp.173 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.172
  %rcc.tmp.174 = load i32, ptr %rcc.tmp.173
  br label %if.merge.4
if.else.4:
  %rcc.tmp.176 = load i32, ptr %i
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 1
  %rcc.tmp.178 = mul i32 %rcc.tmp.177, 30
  %rcc.tmp.179 = load i32, ptr %j
  %rcc.tmp.180 = sub i32 %rcc.tmp.179, 1
  %rcc.tmp.181 = add i32 %rcc.tmp.178, %rcc.tmp.180
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.183
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.186 = phi i32 [%rcc.tmp.174, %if.then.4], [%rcc.tmp.184, %if.else.4]
  %rcc.tmp.187 = add i32 %rcc.tmp.147, %rcc.tmp.186
  store i32 %rcc.tmp.187, ptr %take_left
  %rcc.tmp.189 = load i32, ptr %j
  %rcc.tmp.190 = add i32 %rcc.tmp.189, 0
  %rcc.tmp.191 = getelementptr [30 x i32], ptr %coins, i32 0, i32 %rcc.tmp.190
  %rcc.tmp.192 = load i32, ptr %rcc.tmp.191
  %rcc.tmp.193 = load i32, ptr %i
  %rcc.tmp.194 = mul i32 %rcc.tmp.193, 30
  %rcc.tmp.195 = load i32, ptr %j
  %rcc.tmp.196 = sub i32 %rcc.tmp.195, 2
  %rcc.tmp.197 = add i32 %rcc.tmp.194, %rcc.tmp.196
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 0
  %rcc.tmp.199 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.198
  %rcc.tmp.200 = load i32, ptr %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %i
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 1
  %rcc.tmp.203 = mul i32 %rcc.tmp.202, 30
  %rcc.tmp.204 = load i32, ptr %j
  %rcc.tmp.205 = sub i32 %rcc.tmp.204, 1
  %rcc.tmp.206 = add i32 %rcc.tmp.203, %rcc.tmp.205
  %rcc.tmp.207 = add i32 %rcc.tmp.206, 0
  %rcc.tmp.208 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.207
  %rcc.tmp.209 = load i32, ptr %rcc.tmp.208
  %rcc.tmp.210 = icmp slt i32 %rcc.tmp.200, %rcc.tmp.209
  br i1 %rcc.tmp.210, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.212 = load i32, ptr %i
  %rcc.tmp.213 = mul i32 %rcc.tmp.212, 30
  %rcc.tmp.214 = load i32, ptr %j
  %rcc.tmp.215 = sub i32 %rcc.tmp.214, 2
  %rcc.tmp.216 = add i32 %rcc.tmp.213, %rcc.tmp.215
  %rcc.tmp.217 = add i32 %rcc.tmp.216, 0
  %rcc.tmp.218 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.217
  %rcc.tmp.219 = load i32, ptr %rcc.tmp.218
  br label %if.merge.5
if.else.5:
  %rcc.tmp.221 = load i32, ptr %i
  %rcc.tmp.222 = add i32 %rcc.tmp.221, 1
  %rcc.tmp.223 = mul i32 %rcc.tmp.222, 30
  %rcc.tmp.224 = load i32, ptr %j
  %rcc.tmp.225 = sub i32 %rcc.tmp.224, 1
  %rcc.tmp.226 = add i32 %rcc.tmp.223, %rcc.tmp.225
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 0
  %rcc.tmp.228 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.227
  %rcc.tmp.229 = load i32, ptr %rcc.tmp.228
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.231 = phi i32 [%rcc.tmp.219, %if.then.5], [%rcc.tmp.229, %if.else.5]
  %rcc.tmp.232 = add i32 %rcc.tmp.192, %rcc.tmp.231
  store i32 %rcc.tmp.232, ptr %take_right
  %rcc.tmp.234 = load i32, ptr %take_left
  %rcc.tmp.235 = load i32, ptr %take_right
  %rcc.tmp.236 = icmp sgt i32 %rcc.tmp.234, %rcc.tmp.235
  br i1 %rcc.tmp.236, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.238 = load i32, ptr %i
  %rcc.tmp.239 = mul i32 %rcc.tmp.238, 30
  %rcc.tmp.240 = load i32, ptr %j
  %rcc.tmp.241 = add i32 %rcc.tmp.239, %rcc.tmp.240
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 0
  %rcc.tmp.243 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.242
  %rcc.tmp.244 = load i32, ptr %take_left
  store i32 %rcc.tmp.244, ptr %rcc.tmp.243
  br label %if.merge.6
if.else.6:
  %rcc.tmp.247 = load i32, ptr %i
  %rcc.tmp.248 = mul i32 %rcc.tmp.247, 30
  %rcc.tmp.249 = load i32, ptr %j
  %rcc.tmp.250 = add i32 %rcc.tmp.248, %rcc.tmp.249
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 0
  %rcc.tmp.252 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.251
  %rcc.tmp.253 = load i32, ptr %take_right
  store i32 %rcc.tmp.253, ptr %rcc.tmp.252
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.256 = load i32, ptr %i
  %rcc.tmp.257 = add i32 %rcc.tmp.256, 1
  store i32 %rcc.tmp.257, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.260 = load i32, ptr %length
  %rcc.tmp.261 = add i32 %rcc.tmp.260, 1
  store i32 %rcc.tmp.261, ptr %length
  br label %while.cond.3
while.end.3:
  %rcc.tmp.264 = load i32, ptr %num_coins..tmp
  %rcc.tmp.265 = sub i32 %rcc.tmp.264, 1
  %rcc.tmp.266 = add i32 %rcc.tmp.265, 0
  %rcc.tmp.267 = getelementptr [900 x i32], ptr %dp, i32 0, i32 %rcc.tmp.266
  %rcc.tmp.268 = load i32, ptr %rcc.tmp.267
  ret i32 %rcc.tmp.268
}
define i32 @nimGameDP.(i32 %num_piles.tmp) {
entry:
  %num_piles..tmp = alloca i32 
  %piles = alloca [25 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %nim_sum = alloca i32 
  %winning_moves = alloca i32 
  %target = alloca i32 
  store i32 %num_piles.tmp, ptr %num_piles..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 25
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [25 x i32], ptr %piles, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  store i32 88, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %num_piles..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 1664
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 904223
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 83647
  store i32 %rcc.tmp.24, ptr %seed
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %seed
  %rcc.tmp.30 = sub i32 0, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [25 x i32], ptr %piles, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %seed
  %rcc.tmp.38 = srem i32 %rcc.tmp.37, 20
  %rcc.tmp.39 = add i32 1, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.36
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %nim_sum
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = load i32, ptr %num_piles..tmp
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.53 = load i32, ptr %nim_sum
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [25 x i32], ptr %piles, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = xor i32 %rcc.tmp.53, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %nim_sum
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %winning_moves
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = load i32, ptr %num_piles..tmp
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.67, %rcc.tmp.68
  br i1 %rcc.tmp.69, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.72 = load i32, ptr %nim_sum
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = getelementptr [25 x i32], ptr %piles, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = xor i32 %rcc.tmp.72, %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %target
  %rcc.tmp.79 = load i32, ptr %target
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = getelementptr [25 x i32], ptr %piles, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = icmp slt i32 %rcc.tmp.79, %rcc.tmp.83
  br i1 %rcc.tmp.84, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.86 = load i32, ptr %winning_moves
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [25 x i32], ptr %piles, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %target
  %rcc.tmp.92 = sub i32 %rcc.tmp.90, %rcc.tmp.91
  %rcc.tmp.93 = add i32 %rcc.tmp.86, %rcc.tmp.92
  store i32 %rcc.tmp.93, ptr %winning_moves
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  store i32 %rcc.tmp.98, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.101 = load i32, ptr %winning_moves
  ret i32 %rcc.tmp.101
}
define void @testAdvancedDPPatterns.() {
entry:
  %digit_dp_result = alloca i32 
  %bitmask_dp_result = alloca i32 
  %tree_dp_result = alloca i32 
  call void @printlnInt.(i32 1809)
  %rcc.tmp.2 = call i32 @digitDP.(i32 12345)
  store i32 %rcc.tmp.2, ptr %digit_dp_result
  %rcc.tmp.4 = load i32, ptr %digit_dp_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @bitmaskDP.(i32 15)
  store i32 %rcc.tmp.6, ptr %bitmask_dp_result
  %rcc.tmp.8 = load i32, ptr %bitmask_dp_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @treeDP.(i32 20)
  store i32 %rcc.tmp.10, ptr %tree_dp_result
  %rcc.tmp.12 = load i32, ptr %tree_dp_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 1810)
  ret void
}
define i32 @digitDP.(i32 %number.tmp) {
entry:
  %number..tmp = alloca i32 
  %digits = alloca [10 x i32] 
  %digit_count = alloca i32 
  %temp = alloca i32 
  %i = alloca i32 
  %swap_temp = alloca i32 
  %dp = alloca [100 x i32] 
  %fill.idx = alloca i32 
  store i32 %number.tmp, ptr %number..tmp
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %digits, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [10 x i32], ptr %digits, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %digits, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [10 x i32], ptr %digits, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %digits, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [10 x i32], ptr %digits, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %digits, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %digits, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %digits, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %digits, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.20
  store i32 0, ptr %digit_count
  %rcc.tmp.23 = load i32, ptr %number..tmp
  store i32 %rcc.tmp.23, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %temp
  %rcc.tmp.27 = icmp sgt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %digit_count
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %digits, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %temp
  %rcc.tmp.34 = srem i32 %rcc.tmp.33, 10
  store i32 %rcc.tmp.34, ptr %rcc.tmp.32
  %rcc.tmp.36 = load i32, ptr %temp
  %rcc.tmp.37 = sdiv i32 %rcc.tmp.36, 10
  store i32 %rcc.tmp.37, ptr %temp
  %rcc.tmp.39 = load i32, ptr %digit_count
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %digit_count
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load i32, ptr %digit_count
  %rcc.tmp.47 = sdiv i32 %rcc.tmp.46, 2
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.45, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [10 x i32], ptr %digits, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %swap_temp
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [10 x i32], ptr %digits, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %digit_count
  %rcc.tmp.60 = sub i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = sub i32 %rcc.tmp.60, %rcc.tmp.61
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [10 x i32], ptr %digits, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  store i32 %rcc.tmp.65, ptr %rcc.tmp.58
  %rcc.tmp.67 = load i32, ptr %digit_count
  %rcc.tmp.68 = sub i32 %rcc.tmp.67, 1
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = sub i32 %rcc.tmp.68, %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [10 x i32], ptr %digits, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %swap_temp
  store i32 %rcc.tmp.73, ptr %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.81 = load i32, ptr %fill.idx
  %rcc.tmp.82 = icmp slt i32 %rcc.tmp.81, 100
  br i1 %rcc.tmp.82, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.84 = load i32, ptr %fill.idx
  %rcc.tmp.85 = getelementptr [100 x i32], ptr %dp, i32 0, i32 %rcc.tmp.84
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.87, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.90 = load i32, ptr %digit_count
  %rcc.tmp.91 = call i32 @digitDPRecursive.([10 x i32]* %digits, i32 %rcc.tmp.90, i32 0, i32 0, i1 1, [100 x i32]* %dp)
  ret i32 %rcc.tmp.91
}
define i32 @digitDPRecursive.([10 x i32]* %digits.tmp, i32 %digit_count.tmp, i32 %pos.tmp, i32 %sum_mod.tmp, i1 %tight.tmp, [100 x i32]* %dp.tmp) {
entry:
  %digits..local = alloca [10 x i32] 
  %digit_count..tmp = alloca i32 
  %pos..tmp = alloca i32 
  %sum_mod..tmp = alloca i32 
  %tight..tmp = alloca i1 
  %dp..local = alloca [100 x i32] 
  %state = alloca i32 
  %limit = alloca i32 
  %result = alloca i32 
  %digit = alloca i32 
  %new_sum_mod = alloca i32 
  %new_tight = alloca i1 
  %rcc.tmp.1 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [10 x i32], ptr %digits.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  store i32 %digit_count.tmp, ptr %digit_count..tmp
  store i32 %pos.tmp, ptr %pos..tmp
  store i32 %sum_mod.tmp, ptr %sum_mod..tmp
  store i1 %tight.tmp, ptr %tight..tmp
  %rcc.tmp.45 = bitcast [100 x i32]* %dp..local to i8*
  %rcc.tmp.46 = bitcast [100 x i32]* %dp.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.45, i8* %rcc.tmp.46, i32 400, i1 0)
  %rcc.tmp.48 = load i32, ptr %pos..tmp
  %rcc.tmp.49 = load i32, ptr %digit_count..tmp
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %if.then, label %if.else
if.then:
  %rcc.tmp.52 = load i32, ptr %sum_mod..tmp
  %rcc.tmp.53 = icmp eq i32 %rcc.tmp.52, 0
  br i1 %rcc.tmp.53, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  ret i32 0
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.59 = load i32, ptr %pos..tmp
  %rcc.tmp.60 = mul i32 %rcc.tmp.59, 10
  %rcc.tmp.61 = load i32, ptr %sum_mod..tmp
  %rcc.tmp.62 = mul i32 %rcc.tmp.61, 2
  %rcc.tmp.63 = add i32 %rcc.tmp.60, %rcc.tmp.62
  %rcc.tmp.64 = load i1, ptr %tight..tmp
  br i1 %rcc.tmp.64, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.68 = phi i32 [1, %if.then.3], [0, %if.else.3]
  %rcc.tmp.69 = add i32 %rcc.tmp.63, %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %state
  %rcc.tmp.71 = load i32, ptr %state
  %rcc.tmp.72 = icmp slt i32 %rcc.tmp.71, 100
  br i1 %rcc.tmp.72, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.74 = load i32, ptr %state
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [100 x i32], ptr %dp..local, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = icmp ne i32 %rcc.tmp.77, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.80 = phi i1 [0, %if.merge.3], [%rcc.tmp.78, %and.rhs]
  br i1 %rcc.tmp.80, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.82 = load i32, ptr %state
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [100 x i32], ptr %dp..local, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  ret i32 %rcc.tmp.85
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.88 = load i1, ptr %tight..tmp
  br i1 %rcc.tmp.88, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.90 = load i32, ptr %pos..tmp
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [10 x i32], ptr %digits..local, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.96 = phi i32 [%rcc.tmp.93, %if.then.5], [9, %if.else.5]
  store i32 %rcc.tmp.96, ptr %limit
  store i32 0, ptr %result
  store i32 0, ptr %digit
  br label %while.cond
while.cond:
  %rcc.tmp.101 = load i32, ptr %digit
  %rcc.tmp.102 = load i32, ptr %limit
  %rcc.tmp.103 = icmp sle i32 %rcc.tmp.101, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.106 = load i32, ptr %sum_mod..tmp
  %rcc.tmp.107 = load i32, ptr %digit
  %rcc.tmp.108 = add i32 %rcc.tmp.106, %rcc.tmp.107
  %rcc.tmp.109 = srem i32 %rcc.tmp.108, 3
  store i32 %rcc.tmp.109, ptr %new_sum_mod
  %rcc.tmp.111 = load i1, ptr %tight..tmp
  br i1 %rcc.tmp.111, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.113 = load i32, ptr %digit
  %rcc.tmp.114 = load i32, ptr %limit
  %rcc.tmp.115 = icmp eq i32 %rcc.tmp.113, %rcc.tmp.114
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.117 = phi i1 [0, %while.body], [%rcc.tmp.115, %and.rhs.2]
  store i1 %rcc.tmp.117, ptr %new_tight
  %rcc.tmp.119 = load i32, ptr %result
  %rcc.tmp.120 = load i32, ptr %digit_count..tmp
  %rcc.tmp.121 = load i32, ptr %pos..tmp
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  %rcc.tmp.123 = load i32, ptr %new_sum_mod
  %rcc.tmp.124 = load i1, ptr %new_tight
  %rcc.tmp.125 = call i32 @digitDPRecursive.([10 x i32]* %digits..local, i32 %rcc.tmp.120, i32 %rcc.tmp.122, i32 %rcc.tmp.123, i1 %rcc.tmp.124, [100 x i32]* %dp..local)
  %rcc.tmp.126 = add i32 %rcc.tmp.119, %rcc.tmp.125
  store i32 %rcc.tmp.126, ptr %result
  %rcc.tmp.128 = load i32, ptr %digit
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  store i32 %rcc.tmp.129, ptr %digit
  br label %while.cond
while.end:
  %rcc.tmp.132 = load i32, ptr %state
  %rcc.tmp.133 = icmp slt i32 %rcc.tmp.132, 100
  br i1 %rcc.tmp.133, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.135 = load i32, ptr %state
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [100 x i32], ptr %dp..local, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %result
  store i32 %rcc.tmp.138, ptr %rcc.tmp.137
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.142 = load i32, ptr %result
  ret i32 %rcc.tmp.142
}
define i32 @bitmaskDP.(i32 %num_cities.tmp) {
entry:
  %num_cities..tmp = alloca i32 
  %distances = alloca [225 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %seed = alloca i32 
  %j = alloca i32 
  %total_states = alloca i32 
  %shift = alloca i32 
  %min_cost = alloca i32 
  %mask = alloca i32 
  %visited_count = alloca i32 
  %cost = alloca i32 
  store i32 %num_cities.tmp, ptr %num_cities..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 225
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [225 x i32], ptr %distances, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  store i32 99, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %num_cities..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = load i32, ptr %num_cities..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %num_cities..tmp
  %rcc.tmp.34 = mul i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [225 x i32], ptr %distances, i32 0, i32 %rcc.tmp.37
  store i32 0, ptr %rcc.tmp.38
  br label %if.merge
if.else:
  %rcc.tmp.41 = load i32, ptr %seed
  %rcc.tmp.42 = mul i32 %rcc.tmp.41, 1664
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 904223
  %rcc.tmp.44 = srem i32 %rcc.tmp.43, 83647
  store i32 %rcc.tmp.44, ptr %seed
  %rcc.tmp.46 = load i32, ptr %seed
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.46, 0
  br i1 %rcc.tmp.47, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.49 = load i32, ptr %seed
  %rcc.tmp.50 = sub i32 0, %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %seed
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = load i32, ptr %num_cities..tmp
  %rcc.tmp.56 = mul i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [225 x i32], ptr %distances, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %seed
  %rcc.tmp.62 = srem i32 %rcc.tmp.61, 100
  %rcc.tmp.63 = add i32 1, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %rcc.tmp.60
  br label %if.merge
if.merge:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %i
  br label %while.cond
while.end:
  store i32 1, ptr %total_states
  store i32 0, ptr %shift
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.77 = load i32, ptr %shift
  %rcc.tmp.78 = load i32, ptr %num_cities..tmp
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.82 = load i32, ptr %shift
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %shift
  br label %while.cond.3
while.end.3:
  store i32 999999, ptr %min_cost
  store i32 1, ptr %mask
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.89 = load i32, ptr %mask
  %rcc.tmp.90 = icmp slt i32 %rcc.tmp.89, 32768
  br i1 %rcc.tmp.90, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.92 = load i32, ptr %mask
  %rcc.tmp.93 = load i32, ptr %total_states
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.92, %rcc.tmp.93
  br label %sc.merge
sc.merge:
  %rcc.tmp.96 = phi i1 [0, %while.cond.4], [%rcc.tmp.94, %and.rhs]
  br i1 %rcc.tmp.96, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.99 = load i32, ptr %mask
  %rcc.tmp.100 = call i32 @countSetBits.(i32 %rcc.tmp.99)
  store i32 %rcc.tmp.100, ptr %visited_count
  %rcc.tmp.102 = load i32, ptr %visited_count
  %rcc.tmp.103 = load i32, ptr %num_cities..tmp
  %rcc.tmp.104 = icmp eq i32 %rcc.tmp.102, %rcc.tmp.103
  br i1 %rcc.tmp.104, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.106 = load i32, ptr %mask
  %rcc.tmp.107 = and i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = icmp ne i32 %rcc.tmp.107, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.110 = phi i1 [0, %while.body.4], [%rcc.tmp.108, %and.rhs.2]
  br i1 %rcc.tmp.110, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.112 = load i32, ptr %mask
  %rcc.tmp.113 = load i32, ptr %num_cities..tmp
  %rcc.tmp.114 = call i32 @calculateTourCost.(i32 %rcc.tmp.112, [225 x i32]* %distances, i32 %rcc.tmp.113)
  store i32 %rcc.tmp.114, ptr %cost
  %rcc.tmp.116 = load i32, ptr %cost
  %rcc.tmp.117 = load i32, ptr %min_cost
  %rcc.tmp.118 = icmp slt i32 %rcc.tmp.116, %rcc.tmp.117
  br i1 %rcc.tmp.118, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.120 = load i32, ptr %cost
  store i32 %rcc.tmp.120, ptr %min_cost
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.126 = load i32, ptr %mask
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %mask
  br label %while.cond.4
while.end.4:
  %rcc.tmp.130 = load i32, ptr %min_cost
  ret i32 %rcc.tmp.130
}
define i32 @countSetBits.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %count = alloca i32 
  %temp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 0, ptr %count
  %rcc.tmp.3 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.3, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %temp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %count
  %rcc.tmp.11 = load i32, ptr %temp
  %rcc.tmp.12 = and i32 %rcc.tmp.11, 1
  %rcc.tmp.13 = add i32 %rcc.tmp.10, %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %count
  %rcc.tmp.15 = load i32, ptr %temp
  %rcc.tmp.16 = sdiv i32 %rcc.tmp.15, 2
  store i32 %rcc.tmp.16, ptr %temp
  br label %while.cond
while.end:
  %rcc.tmp.19 = load i32, ptr %count
  ret i32 %rcc.tmp.19
}
define i32 @calculateTourCost.(i32 %mask.tmp, [225 x i32]* %distances.tmp, i32 %num_cities.tmp) {
entry:
  %mask..tmp = alloca i32 
  %distances..local = alloca [225 x i32] 
  %num_cities..tmp = alloca i32 
  %cost = alloca i32 
  %prev_city = alloca i32 
  %city = alloca i32 
  store i32 %mask.tmp, ptr %mask..tmp
  %rcc.tmp.2 = bitcast [225 x i32]* %distances..local to i8*
  %rcc.tmp.3 = bitcast [225 x i32]* %distances.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.2, i8* %rcc.tmp.3, i32 900, i1 0)
  store i32 %num_cities.tmp, ptr %num_cities..tmp
  store i32 0, ptr %cost
  store i32 0, ptr %prev_city
  store i32 1, ptr %city
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %city
  %rcc.tmp.11 = load i32, ptr %num_cities..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %mask..tmp
  %rcc.tmp.16 = load i32, ptr %city
  %rcc.tmp.17 = shl i32 1, %rcc.tmp.16
  %rcc.tmp.18 = and i32 %rcc.tmp.15, %rcc.tmp.17
  %rcc.tmp.19 = icmp ne i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %cost
  %rcc.tmp.22 = load i32, ptr %prev_city
  %rcc.tmp.23 = load i32, ptr %num_cities..tmp
  %rcc.tmp.24 = mul i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %city
  %rcc.tmp.26 = add i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [225 x i32], ptr %distances..local, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.21, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %cost
  %rcc.tmp.32 = load i32, ptr %city
  store i32 %rcc.tmp.32, ptr %prev_city
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %city
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %city
  br label %while.cond
while.end:
  %rcc.tmp.40 = load i32, ptr %cost
  %rcc.tmp.41 = load i32, ptr %prev_city
  %rcc.tmp.42 = load i32, ptr %num_cities..tmp
  %rcc.tmp.43 = mul i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [225 x i32], ptr %distances..local, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.40, %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %cost
  %rcc.tmp.50 = load i32, ptr %cost
  ret i32 %rcc.tmp.50
}
define i32 @treeDP.(i32 %num_nodes.tmp) {
entry:
  %num_nodes..tmp = alloca i32 
  %tree = alloca [400 x i32] 
  %fill.idx = alloca i32 
  %node_values = alloca [20 x i32] 
  %fill.idx.2 = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %parent = alloca i32 
  %include_dp = alloca [20 x i32] 
  %fill.idx.3 = alloca i32 
  %exclude_dp = alloca [20 x i32] 
  %fill.idx.4 = alloca i32 
  store i32 %num_nodes.tmp, ptr %num_nodes..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 400
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [400 x i32], ptr %tree, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = sub i32 0, 1
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = add i32 %rcc.tmp.7, 1
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
  %rcc.tmp.20 = getelementptr [20 x i32], ptr %node_values, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 111, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %seed
  %rcc.tmp.34 = mul i32 %rcc.tmp.33, 1664
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 904223
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 83647
  store i32 %rcc.tmp.36, ptr %seed
  %rcc.tmp.38 = load i32, ptr %seed
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  %rcc.tmp.41 = load i32, ptr %seed
  %rcc.tmp.42 = sub i32 0, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [20 x i32], ptr %node_values, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %seed
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 50
  %rcc.tmp.51 = add i32 1, %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %rcc.tmp.48
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  store i32 1, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.59, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = sub i32 %rcc.tmp.64, 1
  %rcc.tmp.66 = sdiv i32 %rcc.tmp.65, 2
  store i32 %rcc.tmp.66, ptr %parent
  %rcc.tmp.68 = load i32, ptr %parent
  %rcc.tmp.69 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.70 = mul i32 %rcc.tmp.68, %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.70, %rcc.tmp.71
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [400 x i32], ptr %tree, i32 0, i32 %rcc.tmp.73
  store i32 1, ptr %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.78 = mul i32 %rcc.tmp.76, %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %parent
  %rcc.tmp.80 = add i32 %rcc.tmp.78, %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = getelementptr [400 x i32], ptr %tree, i32 0, i32 %rcc.tmp.81
  store i32 1, ptr %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.90 = load i32, ptr %fill.idx.3
  %rcc.tmp.91 = icmp slt i32 %rcc.tmp.90, 20
  br i1 %rcc.tmp.91, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.93 = load i32, ptr %fill.idx.3
  %rcc.tmp.94 = getelementptr [20 x i32], ptr %include_dp, i32 0, i32 %rcc.tmp.93
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.96, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.101 = load i32, ptr %fill.idx.4
  %rcc.tmp.102 = icmp slt i32 %rcc.tmp.101, 20
  br i1 %rcc.tmp.102, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.104 = load i32, ptr %fill.idx.4
  %rcc.tmp.105 = getelementptr [20 x i32], ptr %exclude_dp, i32 0, i32 %rcc.tmp.104
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = add i32 %rcc.tmp.104, 1
  store i32 %rcc.tmp.107, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.110 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.111 = sub i32 0, 1
  %rcc.tmp.112 = call i32 @treeDPRecursive.([400 x i32]* %tree, [20 x i32]* %node_values, i32 %rcc.tmp.110, i32 0, i32 %rcc.tmp.111, [20 x i32]* %include_dp, [20 x i32]* %exclude_dp)
  ret i32 %rcc.tmp.112
}
define i32 @treeDPRecursive.([400 x i32]* %tree.tmp, [20 x i32]* %node_values.tmp, i32 %num_nodes.tmp, i32 %node.tmp, i32 %parent.tmp, [20 x i32]* %include_dp.tmp, [20 x i32]* %exclude_dp.tmp) {
entry:
  %tree..local = alloca [400 x i32] 
  %node_values..local = alloca [20 x i32] 
  %num_nodes..tmp = alloca i32 
  %node..tmp = alloca i32 
  %parent..tmp = alloca i32 
  %include_dp..local = alloca [20 x i32] 
  %exclude_dp..local = alloca [20 x i32] 
  %child = alloca i32 
  %child_result = alloca i32 
  %rcc.tmp.1 = bitcast [400 x i32]* %tree..local to i8*
  %rcc.tmp.2 = bitcast [400 x i32]* %tree.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 1600, i1 0)
  %rcc.tmp.4 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 0
  %rcc.tmp.5 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.4
  store i32 %rcc.tmp.6, ptr %rcc.tmp.5
  %rcc.tmp.8 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 1
  %rcc.tmp.9 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 1
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 2
  %rcc.tmp.13 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 2
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.12
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 3
  %rcc.tmp.17 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 3
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.18, ptr %rcc.tmp.17
  %rcc.tmp.20 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 4
  %rcc.tmp.21 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 4
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 5
  %rcc.tmp.25 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 5
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.26, ptr %rcc.tmp.25
  %rcc.tmp.28 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 6
  %rcc.tmp.29 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 6
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.28
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 7
  %rcc.tmp.33 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 7
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 8
  %rcc.tmp.37 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 8
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.36
  store i32 %rcc.tmp.38, ptr %rcc.tmp.37
  %rcc.tmp.40 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 9
  %rcc.tmp.41 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 9
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 10
  %rcc.tmp.45 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 10
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.44
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 11
  %rcc.tmp.49 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 11
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.48
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 12
  %rcc.tmp.53 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 12
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.54, ptr %rcc.tmp.53
  %rcc.tmp.56 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 13
  %rcc.tmp.57 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 13
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  %rcc.tmp.60 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 14
  %rcc.tmp.61 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 14
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.60
  store i32 %rcc.tmp.62, ptr %rcc.tmp.61
  %rcc.tmp.64 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 15
  %rcc.tmp.65 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 15
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.64
  store i32 %rcc.tmp.66, ptr %rcc.tmp.65
  %rcc.tmp.68 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 16
  %rcc.tmp.69 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 16
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.68
  store i32 %rcc.tmp.70, ptr %rcc.tmp.69
  %rcc.tmp.72 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 17
  %rcc.tmp.73 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 17
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.72
  store i32 %rcc.tmp.74, ptr %rcc.tmp.73
  %rcc.tmp.76 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 18
  %rcc.tmp.77 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 18
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.76
  store i32 %rcc.tmp.78, ptr %rcc.tmp.77
  %rcc.tmp.80 = getelementptr [20 x i32], ptr %node_values.tmp, i32 0, i32 19
  %rcc.tmp.81 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 19
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.82, ptr %rcc.tmp.81
  store i32 %num_nodes.tmp, ptr %num_nodes..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %parent.tmp, ptr %parent..tmp
  %rcc.tmp.87 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 0
  %rcc.tmp.88 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 0
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.87
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  %rcc.tmp.91 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 1
  %rcc.tmp.92 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 1
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.91
  store i32 %rcc.tmp.93, ptr %rcc.tmp.92
  %rcc.tmp.95 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 2
  %rcc.tmp.96 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 2
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.95
  store i32 %rcc.tmp.97, ptr %rcc.tmp.96
  %rcc.tmp.99 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 3
  %rcc.tmp.100 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 3
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.101, ptr %rcc.tmp.100
  %rcc.tmp.103 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 4
  %rcc.tmp.104 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 4
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.103
  store i32 %rcc.tmp.105, ptr %rcc.tmp.104
  %rcc.tmp.107 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 5
  %rcc.tmp.108 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 5
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.107
  store i32 %rcc.tmp.109, ptr %rcc.tmp.108
  %rcc.tmp.111 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 6
  %rcc.tmp.112 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 6
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.111
  store i32 %rcc.tmp.113, ptr %rcc.tmp.112
  %rcc.tmp.115 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 7
  %rcc.tmp.116 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 7
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.115
  store i32 %rcc.tmp.117, ptr %rcc.tmp.116
  %rcc.tmp.119 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 8
  %rcc.tmp.120 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 8
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.119
  store i32 %rcc.tmp.121, ptr %rcc.tmp.120
  %rcc.tmp.123 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 9
  %rcc.tmp.124 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 9
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.125, ptr %rcc.tmp.124
  %rcc.tmp.127 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 10
  %rcc.tmp.128 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 10
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.129, ptr %rcc.tmp.128
  %rcc.tmp.131 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 11
  %rcc.tmp.132 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 11
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.133, ptr %rcc.tmp.132
  %rcc.tmp.135 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 12
  %rcc.tmp.136 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 12
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.135
  store i32 %rcc.tmp.137, ptr %rcc.tmp.136
  %rcc.tmp.139 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 13
  %rcc.tmp.140 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 13
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.139
  store i32 %rcc.tmp.141, ptr %rcc.tmp.140
  %rcc.tmp.143 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 14
  %rcc.tmp.144 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 14
  %rcc.tmp.145 = load i32, ptr %rcc.tmp.143
  store i32 %rcc.tmp.145, ptr %rcc.tmp.144
  %rcc.tmp.147 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 15
  %rcc.tmp.148 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 15
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.147
  store i32 %rcc.tmp.149, ptr %rcc.tmp.148
  %rcc.tmp.151 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 16
  %rcc.tmp.152 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 16
  %rcc.tmp.153 = load i32, ptr %rcc.tmp.151
  store i32 %rcc.tmp.153, ptr %rcc.tmp.152
  %rcc.tmp.155 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 17
  %rcc.tmp.156 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 17
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.155
  store i32 %rcc.tmp.157, ptr %rcc.tmp.156
  %rcc.tmp.159 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 18
  %rcc.tmp.160 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 18
  %rcc.tmp.161 = load i32, ptr %rcc.tmp.159
  store i32 %rcc.tmp.161, ptr %rcc.tmp.160
  %rcc.tmp.163 = getelementptr [20 x i32], ptr %include_dp.tmp, i32 0, i32 19
  %rcc.tmp.164 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 19
  %rcc.tmp.165 = load i32, ptr %rcc.tmp.163
  store i32 %rcc.tmp.165, ptr %rcc.tmp.164
  %rcc.tmp.167 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 0
  %rcc.tmp.168 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 0
  %rcc.tmp.169 = load i32, ptr %rcc.tmp.167
  store i32 %rcc.tmp.169, ptr %rcc.tmp.168
  %rcc.tmp.171 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 1
  %rcc.tmp.172 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 1
  %rcc.tmp.173 = load i32, ptr %rcc.tmp.171
  store i32 %rcc.tmp.173, ptr %rcc.tmp.172
  %rcc.tmp.175 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 2
  %rcc.tmp.176 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 2
  %rcc.tmp.177 = load i32, ptr %rcc.tmp.175
  store i32 %rcc.tmp.177, ptr %rcc.tmp.176
  %rcc.tmp.179 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 3
  %rcc.tmp.180 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 3
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.179
  store i32 %rcc.tmp.181, ptr %rcc.tmp.180
  %rcc.tmp.183 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 4
  %rcc.tmp.184 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 4
  %rcc.tmp.185 = load i32, ptr %rcc.tmp.183
  store i32 %rcc.tmp.185, ptr %rcc.tmp.184
  %rcc.tmp.187 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 5
  %rcc.tmp.188 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 5
  %rcc.tmp.189 = load i32, ptr %rcc.tmp.187
  store i32 %rcc.tmp.189, ptr %rcc.tmp.188
  %rcc.tmp.191 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 6
  %rcc.tmp.192 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 6
  %rcc.tmp.193 = load i32, ptr %rcc.tmp.191
  store i32 %rcc.tmp.193, ptr %rcc.tmp.192
  %rcc.tmp.195 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 7
  %rcc.tmp.196 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 7
  %rcc.tmp.197 = load i32, ptr %rcc.tmp.195
  store i32 %rcc.tmp.197, ptr %rcc.tmp.196
  %rcc.tmp.199 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 8
  %rcc.tmp.200 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 8
  %rcc.tmp.201 = load i32, ptr %rcc.tmp.199
  store i32 %rcc.tmp.201, ptr %rcc.tmp.200
  %rcc.tmp.203 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 9
  %rcc.tmp.204 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 9
  %rcc.tmp.205 = load i32, ptr %rcc.tmp.203
  store i32 %rcc.tmp.205, ptr %rcc.tmp.204
  %rcc.tmp.207 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 10
  %rcc.tmp.208 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 10
  %rcc.tmp.209 = load i32, ptr %rcc.tmp.207
  store i32 %rcc.tmp.209, ptr %rcc.tmp.208
  %rcc.tmp.211 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 11
  %rcc.tmp.212 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 11
  %rcc.tmp.213 = load i32, ptr %rcc.tmp.211
  store i32 %rcc.tmp.213, ptr %rcc.tmp.212
  %rcc.tmp.215 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 12
  %rcc.tmp.216 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 12
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.215
  store i32 %rcc.tmp.217, ptr %rcc.tmp.216
  %rcc.tmp.219 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 13
  %rcc.tmp.220 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 13
  %rcc.tmp.221 = load i32, ptr %rcc.tmp.219
  store i32 %rcc.tmp.221, ptr %rcc.tmp.220
  %rcc.tmp.223 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 14
  %rcc.tmp.224 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 14
  %rcc.tmp.225 = load i32, ptr %rcc.tmp.223
  store i32 %rcc.tmp.225, ptr %rcc.tmp.224
  %rcc.tmp.227 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 15
  %rcc.tmp.228 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 15
  %rcc.tmp.229 = load i32, ptr %rcc.tmp.227
  store i32 %rcc.tmp.229, ptr %rcc.tmp.228
  %rcc.tmp.231 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 16
  %rcc.tmp.232 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 16
  %rcc.tmp.233 = load i32, ptr %rcc.tmp.231
  store i32 %rcc.tmp.233, ptr %rcc.tmp.232
  %rcc.tmp.235 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 17
  %rcc.tmp.236 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 17
  %rcc.tmp.237 = load i32, ptr %rcc.tmp.235
  store i32 %rcc.tmp.237, ptr %rcc.tmp.236
  %rcc.tmp.239 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 18
  %rcc.tmp.240 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 18
  %rcc.tmp.241 = load i32, ptr %rcc.tmp.239
  store i32 %rcc.tmp.241, ptr %rcc.tmp.240
  %rcc.tmp.243 = getelementptr [20 x i32], ptr %exclude_dp.tmp, i32 0, i32 19
  %rcc.tmp.244 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 19
  %rcc.tmp.245 = load i32, ptr %rcc.tmp.243
  store i32 %rcc.tmp.245, ptr %rcc.tmp.244
  %rcc.tmp.247 = load i32, ptr %node..tmp
  %rcc.tmp.248 = add i32 %rcc.tmp.247, 0
  %rcc.tmp.249 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.248
  %rcc.tmp.250 = load i32, ptr %node..tmp
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 0
  %rcc.tmp.252 = getelementptr [20 x i32], ptr %node_values..local, i32 0, i32 %rcc.tmp.251
  %rcc.tmp.253 = load i32, ptr %rcc.tmp.252
  store i32 %rcc.tmp.253, ptr %rcc.tmp.249
  %rcc.tmp.255 = load i32, ptr %node..tmp
  %rcc.tmp.256 = add i32 %rcc.tmp.255, 0
  %rcc.tmp.257 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.256
  store i32 0, ptr %rcc.tmp.257
  store i32 0, ptr %child
  br label %while.cond
while.cond:
  %rcc.tmp.261 = load i32, ptr %child
  %rcc.tmp.262 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.263 = icmp slt i32 %rcc.tmp.261, %rcc.tmp.262
  br i1 %rcc.tmp.263, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.266 = load i32, ptr %node..tmp
  %rcc.tmp.267 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.268 = mul i32 %rcc.tmp.266, %rcc.tmp.267
  %rcc.tmp.269 = load i32, ptr %child
  %rcc.tmp.270 = add i32 %rcc.tmp.268, %rcc.tmp.269
  %rcc.tmp.271 = add i32 %rcc.tmp.270, 0
  %rcc.tmp.272 = getelementptr [400 x i32], ptr %tree..local, i32 0, i32 %rcc.tmp.271
  %rcc.tmp.273 = load i32, ptr %rcc.tmp.272
  %rcc.tmp.274 = icmp eq i32 %rcc.tmp.273, 1
  br i1 %rcc.tmp.274, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.276 = load i32, ptr %child
  %rcc.tmp.277 = load i32, ptr %parent..tmp
  %rcc.tmp.278 = icmp ne i32 %rcc.tmp.276, %rcc.tmp.277
  br label %sc.merge
sc.merge:
  %rcc.tmp.280 = phi i1 [0, %while.body], [%rcc.tmp.278, %and.rhs]
  br i1 %rcc.tmp.280, label %if.then, label %if.else
if.then:
  %rcc.tmp.282 = load i32, ptr %num_nodes..tmp
  %rcc.tmp.283 = load i32, ptr %child
  %rcc.tmp.284 = load i32, ptr %node..tmp
  %rcc.tmp.285 = call i32 @treeDPRecursive.([400 x i32]* %tree..local, [20 x i32]* %node_values..local, i32 %rcc.tmp.282, i32 %rcc.tmp.283, i32 %rcc.tmp.284, [20 x i32]* %include_dp..local, [20 x i32]* %exclude_dp..local)
  store i32 %rcc.tmp.285, ptr %child_result
  %rcc.tmp.287 = load i32, ptr %node..tmp
  %rcc.tmp.288 = add i32 %rcc.tmp.287, 0
  %rcc.tmp.289 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.288
  %rcc.tmp.290 = load i32, ptr %node..tmp
  %rcc.tmp.291 = add i32 %rcc.tmp.290, 0
  %rcc.tmp.292 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.291
  %rcc.tmp.293 = load i32, ptr %rcc.tmp.292
  %rcc.tmp.294 = load i32, ptr %child
  %rcc.tmp.295 = add i32 %rcc.tmp.294, 0
  %rcc.tmp.296 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.295
  %rcc.tmp.297 = load i32, ptr %rcc.tmp.296
  %rcc.tmp.298 = add i32 %rcc.tmp.293, %rcc.tmp.297
  store i32 %rcc.tmp.298, ptr %rcc.tmp.289
  %rcc.tmp.300 = load i32, ptr %node..tmp
  %rcc.tmp.301 = add i32 %rcc.tmp.300, 0
  %rcc.tmp.302 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.301
  %rcc.tmp.303 = load i32, ptr %node..tmp
  %rcc.tmp.304 = add i32 %rcc.tmp.303, 0
  %rcc.tmp.305 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.304
  %rcc.tmp.306 = load i32, ptr %rcc.tmp.305
  %rcc.tmp.307 = load i32, ptr %child
  %rcc.tmp.308 = add i32 %rcc.tmp.307, 0
  %rcc.tmp.309 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.308
  %rcc.tmp.310 = load i32, ptr %rcc.tmp.309
  %rcc.tmp.311 = load i32, ptr %child
  %rcc.tmp.312 = add i32 %rcc.tmp.311, 0
  %rcc.tmp.313 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.312
  %rcc.tmp.314 = load i32, ptr %rcc.tmp.313
  %rcc.tmp.315 = icmp sgt i32 %rcc.tmp.310, %rcc.tmp.314
  br i1 %rcc.tmp.315, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.317 = load i32, ptr %child
  %rcc.tmp.318 = add i32 %rcc.tmp.317, 0
  %rcc.tmp.319 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.318
  %rcc.tmp.320 = load i32, ptr %rcc.tmp.319
  br label %if.merge.2
if.else.2:
  %rcc.tmp.322 = load i32, ptr %child
  %rcc.tmp.323 = add i32 %rcc.tmp.322, 0
  %rcc.tmp.324 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.323
  %rcc.tmp.325 = load i32, ptr %rcc.tmp.324
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.327 = phi i32 [%rcc.tmp.320, %if.then.2], [%rcc.tmp.325, %if.else.2]
  %rcc.tmp.328 = add i32 %rcc.tmp.306, %rcc.tmp.327
  store i32 %rcc.tmp.328, ptr %rcc.tmp.302
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.332 = load i32, ptr %child
  %rcc.tmp.333 = add i32 %rcc.tmp.332, 1
  store i32 %rcc.tmp.333, ptr %child
  br label %while.cond
while.end:
  %rcc.tmp.336 = load i32, ptr %node..tmp
  %rcc.tmp.337 = add i32 %rcc.tmp.336, 0
  %rcc.tmp.338 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.337
  %rcc.tmp.339 = load i32, ptr %rcc.tmp.338
  %rcc.tmp.340 = load i32, ptr %node..tmp
  %rcc.tmp.341 = add i32 %rcc.tmp.340, 0
  %rcc.tmp.342 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.341
  %rcc.tmp.343 = load i32, ptr %rcc.tmp.342
  %rcc.tmp.344 = icmp sgt i32 %rcc.tmp.339, %rcc.tmp.343
  br i1 %rcc.tmp.344, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.346 = load i32, ptr %node..tmp
  %rcc.tmp.347 = add i32 %rcc.tmp.346, 0
  %rcc.tmp.348 = getelementptr [20 x i32], ptr %include_dp..local, i32 0, i32 %rcc.tmp.347
  %rcc.tmp.349 = load i32, ptr %rcc.tmp.348
  ret i32 %rcc.tmp.349
if.else.3:
  %rcc.tmp.351 = load i32, ptr %node..tmp
  %rcc.tmp.352 = add i32 %rcc.tmp.351, 0
  %rcc.tmp.353 = getelementptr [20 x i32], ptr %exclude_dp..local, i32 0, i32 %rcc.tmp.352
  %rcc.tmp.354 = load i32, ptr %rcc.tmp.353
  ret i32 %rcc.tmp.354
if.merge.3:
  ret i32 undef
}
