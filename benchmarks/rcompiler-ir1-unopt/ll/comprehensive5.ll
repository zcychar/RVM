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
  call void @printlnInt.(i32 1500)
  call void @testMemoryAccessPatterns.()
  call void @testMultiDimensionalArrayAccess.()
  call void @testDataLayoutOptimization.()
  call void @testMemoryStridePatterns.()
  call void @testCacheConsciousAlgorithms.()
  call void @printlnInt.(i32 1599)
  call void @exit.(i32 0)
  ret void
}
define void @testMemoryAccessPatterns.() {
entry:
  %large_array = alloca [4096 x i32] 
  %fill.idx = alloca i32 
  %sequential_sum = alloca i32 
  %strided_sum = alloca i32 
  %random_sum = alloca i32 
  %backward_sum = alloca i32 
  call void @printlnInt.(i32 1501)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 4096
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [4096 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeLargeArray.([4096 x i32]* %large_array)
  %rcc.tmp.14 = call i32 @sequentialAccess.([4096 x i32]* %large_array)
  store i32 %rcc.tmp.14, ptr %sequential_sum
  %rcc.tmp.16 = load i32, ptr %sequential_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @stridedAccess.([4096 x i32]* %large_array, i32 8)
  store i32 %rcc.tmp.18, ptr %strided_sum
  %rcc.tmp.20 = load i32, ptr %strided_sum
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @randomAccess.([4096 x i32]* %large_array)
  store i32 %rcc.tmp.22, ptr %random_sum
  %rcc.tmp.24 = load i32, ptr %random_sum
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @backwardAccess.([4096 x i32]* %large_array)
  store i32 %rcc.tmp.26, ptr %backward_sum
  %rcc.tmp.28 = load i32, ptr %backward_sum
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1502)
  ret void
}
define void @initializeLargeArray.([4096 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [4096 x i32]* 
  %i = alloca i32 
  %seed = alloca i32 
  store [4096 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 0, ptr %i
  store i32 98765, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 4096
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %seed
  %rcc.tmp.10 = mul i32 %rcc.tmp.9, 1103
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 4721
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 1048583
  store i32 %rcc.tmp.12, ptr %seed
  %rcc.tmp.14 = load i32, ptr %seed
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %seed
  %rcc.tmp.18 = sub i32 0, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [4096 x i32]*, ptr %arr..tmp
  %rcc.tmp.25 = getelementptr [4096 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 1000
  store i32 %rcc.tmp.27, ptr %rcc.tmp.25
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @sequentialAccess.([4096 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [4096 x i32]* 
  %sum = alloca i32 
  %i = alloca i32 
  store [4096 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 4096
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %sum
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [4096 x i32]*, ptr %arr..tmp
  %rcc.tmp.13 = getelementptr [4096 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.9, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %sum
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %sum
  ret i32 %rcc.tmp.21
}
define i32 @stridedAccess.([4096 x i32]* %arr.tmp, i32 %stride.tmp) {
entry:
  %arr..tmp = alloca [4096 x i32]* 
  %stride..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [4096 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %stride.tmp, ptr %stride..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 4096
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %sum
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [4096 x i32]*, ptr %arr..tmp
  %rcc.tmp.14 = getelementptr [4096 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.10, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %sum
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %stride..tmp
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %sum
  ret i32 %rcc.tmp.23
}
define i32 @randomAccess.([4096 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [4096 x i32]* 
  %sum = alloca i32 
  %seed = alloca i32 
  %iteration = alloca i32 
  %index = alloca i32 
  store [4096 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 0, ptr %sum
  store i32 54321, ptr %seed
  store i32 0, ptr %iteration
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %iteration
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 1000
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %seed
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 1103
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 4721
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 1048583
  store i32 %rcc.tmp.13, ptr %seed
  %rcc.tmp.15 = load i32, ptr %seed
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 0
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %seed
  %rcc.tmp.19 = sub i32 0, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.23 = load i32, ptr %seed
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 4096
  store i32 %rcc.tmp.24, ptr %index
  %rcc.tmp.26 = load i32, ptr %sum
  %rcc.tmp.27 = load i32, ptr %index
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [4096 x i32]*, ptr %arr..tmp
  %rcc.tmp.30 = getelementptr [4096 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.26, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %sum
  %rcc.tmp.34 = load i32, ptr %iteration
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %iteration
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %sum
  ret i32 %rcc.tmp.38
}
define i32 @backwardAccess.([4096 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [4096 x i32]* 
  %sum = alloca i32 
  %i = alloca i32 
  store [4096 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 0, ptr %sum
  store i32 4095, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp sge i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %sum
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [4096 x i32]*, ptr %arr..tmp
  %rcc.tmp.13 = getelementptr [4096 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.9, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %sum
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = sub i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %sum
  ret i32 %rcc.tmp.21
}
define void @testMultiDimensionalArrayAccess.() {
entry:
  %matrix = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %row_major_sum = alloca i32 
  %column_major_sum = alloca i32 
  %diagonal_sum = alloca i32 
  %block_sum = alloca i32 
  call void @printlnInt.(i32 1503)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1024
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1024 x i32], ptr %matrix, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeMatrix32x32.([1024 x i32]* %matrix)
  %rcc.tmp.14 = call i32 @rowMajorAccess.([1024 x i32]* %matrix)
  store i32 %rcc.tmp.14, ptr %row_major_sum
  %rcc.tmp.16 = load i32, ptr %row_major_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @columnMajorAccess.([1024 x i32]* %matrix)
  store i32 %rcc.tmp.18, ptr %column_major_sum
  %rcc.tmp.20 = load i32, ptr %column_major_sum
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @diagonalAccess.([1024 x i32]* %matrix)
  store i32 %rcc.tmp.22, ptr %diagonal_sum
  %rcc.tmp.24 = load i32, ptr %diagonal_sum
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @blockAccess.([1024 x i32]* %matrix)
  store i32 %rcc.tmp.26, ptr %block_sum
  %rcc.tmp.28 = load i32, ptr %block_sum
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1504)
  ret void
}
define void @initializeMatrix32x32.([1024 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [1024 x i32]* 
  %i = alloca i32 
  %j = alloca i32 
  store [1024 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 32
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.10 = load i32, ptr %j
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 32
  br i1 %rcc.tmp.11, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 32
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [1024 x i32]*, ptr %matrix..tmp
  %rcc.tmp.20 = getelementptr [1024 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = mul i32 %rcc.tmp.22, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %rcc.tmp.20
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @rowMajorAccess.([1024 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [1024 x i32]* 
  %sum = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [1024 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 32
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %j
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 32
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load i32, ptr %sum
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = mul i32 %rcc.tmp.16, 32
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1024 x i32]*, ptr %matrix..tmp
  %rcc.tmp.22 = getelementptr [1024 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.15, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %sum
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.34 = load i32, ptr %sum
  ret i32 %rcc.tmp.34
}
define i32 @columnMajorAccess.([1024 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [1024 x i32]* 
  %sum = alloca i32 
  %j = alloca i32 
  %i = alloca i32 
  store [1024 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %j
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 32
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 32
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load i32, ptr %sum
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = mul i32 %rcc.tmp.16, 32
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1024 x i32]*, ptr %matrix..tmp
  %rcc.tmp.22 = getelementptr [1024 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.15, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %sum
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.34 = load i32, ptr %sum
  ret i32 %rcc.tmp.34
}
define i32 @diagonalAccess.([1024 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [1024 x i32]* 
  %sum = alloca i32 
  %i = alloca i32 
  store [1024 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 32
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %sum
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 32
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [1024 x i32]*, ptr %matrix..tmp
  %rcc.tmp.16 = getelementptr [1024 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.9, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %sum
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 32
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.30 = load i32, ptr %sum
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = mul i32 %rcc.tmp.31, 32
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = sub i32 31, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.32, %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [1024 x i32]*, ptr %matrix..tmp
  %rcc.tmp.38 = getelementptr [1024 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.30, %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %sum
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.46 = load i32, ptr %sum
  ret i32 %rcc.tmp.46
}
define i32 @blockAccess.([1024 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [1024 x i32]* 
  %sum = alloca i32 
  %block_size = alloca i32 
  %block_i = alloca i32 
  %block_j = alloca i32 
  %i = alloca i32 
  %end_i = alloca i32 
  %j = alloca i32 
  %end_j = alloca i32 
  store [1024 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %sum
  store i32 8, ptr %block_size
  store i32 0, ptr %block_i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %block_i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 32
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %block_j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %block_j
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 32
  br i1 %rcc.tmp.13, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.16 = load i32, ptr %block_i
  store i32 %rcc.tmp.16, ptr %i
  %rcc.tmp.18 = load i32, ptr %block_i
  %rcc.tmp.19 = load i32, ptr %block_size
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %end_i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %end_i
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 32
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.cond.3], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.33 = load i32, ptr %block_j
  store i32 %rcc.tmp.33, ptr %j
  %rcc.tmp.35 = load i32, ptr %block_j
  %rcc.tmp.36 = load i32, ptr %block_size
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %end_j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = load i32, ptr %end_j
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.44, 32
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.47 = phi i1 [0, %while.cond.4], [%rcc.tmp.45, %and.rhs.2]
  br i1 %rcc.tmp.47, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.50 = load i32, ptr %sum
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = mul i32 %rcc.tmp.51, 32
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [1024 x i32]*, ptr %matrix..tmp
  %rcc.tmp.57 = getelementptr [1024 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.50, %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %sum
  %rcc.tmp.61 = load i32, ptr %j
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.69 = load i32, ptr %block_j
  %rcc.tmp.70 = load i32, ptr %block_size
  %rcc.tmp.71 = add i32 %rcc.tmp.69, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %block_j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.74 = load i32, ptr %block_i
  %rcc.tmp.75 = load i32, ptr %block_size
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %block_i
  br label %while.cond
while.end:
  %rcc.tmp.79 = load i32, ptr %sum
  ret i32 %rcc.tmp.79
}
define void @testDataLayoutOptimization.() {
entry:
  %soa_result = alloca i32 
  %aos_result = alloca i32 
  %hybrid_result = alloca i32 
  call void @printlnInt.(i32 1505)
  %rcc.tmp.2 = call i32 @testStructureOfArrays.()
  store i32 %rcc.tmp.2, ptr %soa_result
  %rcc.tmp.4 = load i32, ptr %soa_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @testArrayOfStructures.()
  store i32 %rcc.tmp.6, ptr %aos_result
  %rcc.tmp.8 = load i32, ptr %aos_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @testHybridDataLayout.()
  store i32 %rcc.tmp.10, ptr %hybrid_result
  %rcc.tmp.12 = load i32, ptr %hybrid_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 1506)
  ret void
}
define i32 @testStructureOfArrays.() {
entry:
  %x_coords = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %y_coords = alloca [1000 x i32] 
  %fill.idx.2 = alloca i32 
  %z_coords = alloca [1000 x i32] 
  %fill.idx.3 = alloca i32 
  %i = alloca i32 
  %sum_x = alloca i32 
  %sum_y = alloca i32 
  %sum_z = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1000 x i32], ptr %x_coords, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 1000
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %y_coords, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.25 = load i32, ptr %fill.idx.3
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 1000
  br i1 %rcc.tmp.26, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = getelementptr [1000 x i32], ptr %z_coords, i32 0, i32 %rcc.tmp.28
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.31, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 1000
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [1000 x i32], ptr %x_coords, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %i
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [1000 x i32], ptr %y_coords, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = mul i32 %rcc.tmp.48, 2
  store i32 %rcc.tmp.49, ptr %rcc.tmp.47
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [1000 x i32], ptr %z_coords, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = mul i32 %rcc.tmp.54, 3
  store i32 %rcc.tmp.55, ptr %rcc.tmp.53
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %sum_x
  store i32 0, ptr %sum_y
  store i32 0, ptr %sum_z
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 1000
  br i1 %rcc.tmp.67, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.70 = load i32, ptr %sum_x
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [1000 x i32], ptr %x_coords, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = mul i32 %rcc.tmp.74, 2
  %rcc.tmp.76 = add i32 %rcc.tmp.70, %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %sum_x
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = icmp slt i32 %rcc.tmp.84, 1000
  br i1 %rcc.tmp.85, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.88 = load i32, ptr %sum_y
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [1000 x i32], ptr %y_coords, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = mul i32 %rcc.tmp.92, 3
  %rcc.tmp.94 = add i32 %rcc.tmp.88, %rcc.tmp.93
  store i32 %rcc.tmp.94, ptr %sum_y
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.102, 1000
  br i1 %rcc.tmp.103, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.106 = load i32, ptr %sum_z
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = getelementptr [1000 x i32], ptr %z_coords, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = mul i32 %rcc.tmp.110, 4
  %rcc.tmp.112 = add i32 %rcc.tmp.106, %rcc.tmp.111
  store i32 %rcc.tmp.112, ptr %sum_z
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.118 = load i32, ptr %sum_x
  %rcc.tmp.119 = load i32, ptr %sum_y
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %sum_z
  %rcc.tmp.122 = add i32 %rcc.tmp.120, %rcc.tmp.121
  ret i32 %rcc.tmp.122
}
define i32 @testArrayOfStructures.() {
entry:
  %aos_data = alloca [3000 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %sum = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %z = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 3000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 1000
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = mul i32 %rcc.tmp.18, 3
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = mul i32 %rcc.tmp.24, 3
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = mul i32 %rcc.tmp.29, 2
  store i32 %rcc.tmp.30, ptr %rcc.tmp.28
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = mul i32 %rcc.tmp.32, 3
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 2
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = mul i32 %rcc.tmp.37, 3
  store i32 %rcc.tmp.38, ptr %rcc.tmp.36
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 1000
  br i1 %rcc.tmp.48, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = mul i32 %rcc.tmp.51, 3
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %x
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 3
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %y
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = mul i32 %rcc.tmp.64, 3
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 2
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [3000 x i32], ptr %aos_data, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %z
  %rcc.tmp.71 = load i32, ptr %sum
  %rcc.tmp.72 = load i32, ptr %x
  %rcc.tmp.73 = load i32, ptr %x
  %rcc.tmp.74 = mul i32 %rcc.tmp.72, %rcc.tmp.73
  %rcc.tmp.75 = srem i32 %rcc.tmp.74, 1073741824
  %rcc.tmp.76 = load i32, ptr %y
  %rcc.tmp.77 = load i32, ptr %y
  %rcc.tmp.78 = mul i32 %rcc.tmp.76, %rcc.tmp.77
  %rcc.tmp.79 = srem i32 %rcc.tmp.78, 1073741824
  %rcc.tmp.80 = add i32 %rcc.tmp.75, %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %z
  %rcc.tmp.82 = load i32, ptr %z
  %rcc.tmp.83 = mul i32 %rcc.tmp.81, %rcc.tmp.82
  %rcc.tmp.84 = srem i32 %rcc.tmp.83, 1073741824
  %rcc.tmp.85 = add i32 %rcc.tmp.80, %rcc.tmp.84
  %rcc.tmp.86 = srem i32 %rcc.tmp.85, 1073741824
  %rcc.tmp.87 = add i32 %rcc.tmp.71, %rcc.tmp.86
  %rcc.tmp.88 = srem i32 %rcc.tmp.87, 1073741824
  store i32 %rcc.tmp.88, ptr %sum
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.94 = load i32, ptr %sum
  ret i32 %rcc.tmp.94
}
define i32 @testHybridDataLayout.() {
entry:
  %block1_x = alloca [250 x i32] 
  %fill.idx = alloca i32 
  %block1_y = alloca [250 x i32] 
  %fill.idx.2 = alloca i32 
  %block1_z = alloca [250 x i32] 
  %fill.idx.3 = alloca i32 
  %block2_x = alloca [250 x i32] 
  %fill.idx.4 = alloca i32 
  %block2_y = alloca [250 x i32] 
  %fill.idx.5 = alloca i32 
  %block2_z = alloca [250 x i32] 
  %fill.idx.6 = alloca i32 
  %i = alloca i32 
  %sum = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 250
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [250 x i32], ptr %block1_x, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 250
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [250 x i32], ptr %block1_y, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.25 = load i32, ptr %fill.idx.3
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 250
  br i1 %rcc.tmp.26, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = getelementptr [250 x i32], ptr %block1_z, i32 0, i32 %rcc.tmp.28
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.31, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.36 = load i32, ptr %fill.idx.4
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 250
  br i1 %rcc.tmp.37, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.39 = load i32, ptr %fill.idx.4
  %rcc.tmp.40 = getelementptr [250 x i32], ptr %block2_x, i32 0, i32 %rcc.tmp.39
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.42, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.47 = load i32, ptr %fill.idx.5
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 250
  br i1 %rcc.tmp.48, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.50 = load i32, ptr %fill.idx.5
  %rcc.tmp.51 = getelementptr [250 x i32], ptr %block2_y, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.53, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.58 = load i32, ptr %fill.idx.6
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.58, 250
  br i1 %rcc.tmp.59, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.61 = load i32, ptr %fill.idx.6
  %rcc.tmp.62 = getelementptr [250 x i32], ptr %block2_z, i32 0, i32 %rcc.tmp.61
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.64, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.69, 250
  br i1 %rcc.tmp.70, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = getelementptr [250 x i32], ptr %block1_x, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %i
  store i32 %rcc.tmp.76, ptr %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [250 x i32], ptr %block1_y, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = mul i32 %rcc.tmp.81, 2
  store i32 %rcc.tmp.82, ptr %rcc.tmp.80
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [250 x i32], ptr %block1_z, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = mul i32 %rcc.tmp.87, 3
  store i32 %rcc.tmp.88, ptr %rcc.tmp.86
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [250 x i32], ptr %block2_x, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 250
  store i32 %rcc.tmp.94, ptr %rcc.tmp.92
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [250 x i32], ptr %block2_y, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 250
  %rcc.tmp.101 = mul i32 %rcc.tmp.100, 2
  store i32 %rcc.tmp.101, ptr %rcc.tmp.98
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = getelementptr [250 x i32], ptr %block2_z, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 250
  %rcc.tmp.108 = mul i32 %rcc.tmp.107, 3
  store i32 %rcc.tmp.108, ptr %rcc.tmp.105
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 1
  store i32 %rcc.tmp.111, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = icmp slt i32 %rcc.tmp.117, 250
  br i1 %rcc.tmp.118, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.121 = load i32, ptr %sum
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [250 x i32], ptr %block1_x, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 0
  %rcc.tmp.128 = getelementptr [250 x i32], ptr %block1_y, i32 0, i32 %rcc.tmp.127
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.128
  %rcc.tmp.130 = add i32 %rcc.tmp.125, %rcc.tmp.129
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 0
  %rcc.tmp.133 = getelementptr [250 x i32], ptr %block1_z, i32 0, i32 %rcc.tmp.132
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  %rcc.tmp.135 = add i32 %rcc.tmp.130, %rcc.tmp.134
  %rcc.tmp.136 = add i32 %rcc.tmp.121, %rcc.tmp.135
  store i32 %rcc.tmp.136, ptr %sum
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.144 = load i32, ptr %i
  %rcc.tmp.145 = icmp slt i32 %rcc.tmp.144, 250
  br i1 %rcc.tmp.145, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.148 = load i32, ptr %sum
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = getelementptr [250 x i32], ptr %block2_x, i32 0, i32 %rcc.tmp.150
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %i
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = getelementptr [250 x i32], ptr %block2_y, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.155
  %rcc.tmp.157 = add i32 %rcc.tmp.152, %rcc.tmp.156
  %rcc.tmp.158 = load i32, ptr %i
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 0
  %rcc.tmp.160 = getelementptr [250 x i32], ptr %block2_z, i32 0, i32 %rcc.tmp.159
  %rcc.tmp.161 = load i32, ptr %rcc.tmp.160
  %rcc.tmp.162 = add i32 %rcc.tmp.157, %rcc.tmp.161
  %rcc.tmp.163 = add i32 %rcc.tmp.148, %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %sum
  %rcc.tmp.165 = load i32, ptr %i
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.169 = load i32, ptr %sum
  ret i32 %rcc.tmp.169
}
define void @testMemoryStridePatterns.() {
entry:
  %test_array = alloca [2048 x i32] 
  %fill.idx = alloca i32 
  %stride_1_sum = alloca i32 
  %stride_2_sum = alloca i32 
  %stride_4_sum = alloca i32 
  %stride_8_sum = alloca i32 
  %stride_16_sum = alloca i32 
  %complex_stride_sum = alloca i32 
  call void @printlnInt.(i32 1507)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2048
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2048 x i32], ptr %test_array, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeStrideTestArray.([2048 x i32]* %test_array)
  %rcc.tmp.14 = call i32 @processWithStride.([2048 x i32]* %test_array, i32 1)
  store i32 %rcc.tmp.14, ptr %stride_1_sum
  %rcc.tmp.16 = load i32, ptr %stride_1_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @processWithStride.([2048 x i32]* %test_array, i32 2)
  store i32 %rcc.tmp.18, ptr %stride_2_sum
  %rcc.tmp.20 = load i32, ptr %stride_2_sum
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @processWithStride.([2048 x i32]* %test_array, i32 4)
  store i32 %rcc.tmp.22, ptr %stride_4_sum
  %rcc.tmp.24 = load i32, ptr %stride_4_sum
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @processWithStride.([2048 x i32]* %test_array, i32 8)
  store i32 %rcc.tmp.26, ptr %stride_8_sum
  %rcc.tmp.28 = load i32, ptr %stride_8_sum
  call void @printlnInt.(i32 %rcc.tmp.28)
  %rcc.tmp.30 = call i32 @processWithStride.([2048 x i32]* %test_array, i32 16)
  store i32 %rcc.tmp.30, ptr %stride_16_sum
  %rcc.tmp.32 = load i32, ptr %stride_16_sum
  call void @printlnInt.(i32 %rcc.tmp.32)
  %rcc.tmp.34 = call i32 @processWithComplexStride.([2048 x i32]* %test_array)
  store i32 %rcc.tmp.34, ptr %complex_stride_sum
  %rcc.tmp.36 = load i32, ptr %complex_stride_sum
  call void @printlnInt.(i32 %rcc.tmp.36)
  call void @printlnInt.(i32 1508)
  ret void
}
define void @initializeStrideTestArray.([2048 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [2048 x i32]* 
  %i = alloca i32 
  store [2048 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2048
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [2048 x i32]*, ptr %arr..tmp
  %rcc.tmp.11 = getelementptr [2048 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 100
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.11
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @processWithStride.([2048 x i32]* %arr.tmp, i32 %stride.tmp) {
entry:
  %arr..tmp = alloca [2048 x i32]* 
  %stride..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [2048 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %stride.tmp, ptr %stride..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 2048
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %sum
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [2048 x i32]*, ptr %arr..tmp
  %rcc.tmp.14 = getelementptr [2048 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = mul i32 %rcc.tmp.15, %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.10, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %sum
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %stride..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.26 = load i32, ptr %sum
  ret i32 %rcc.tmp.26
}
define i32 @processWithComplexStride.([2048 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [2048 x i32]* 
  %sum = alloca i32 
  %i = alloca i32 
  %stride = alloca i32 
  store [2048 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  store i32 1, ptr %stride
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 2048
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %sum
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [2048 x i32]*, ptr %arr..tmp
  %rcc.tmp.14 = getelementptr [2048 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.10, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %sum
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %stride
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %i
  %rcc.tmp.22 = load i32, ptr %stride
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 1
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  store i32 4, ptr %stride
  br label %if.merge
if.else:
  %rcc.tmp.27 = load i32, ptr %stride
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 4
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  store i32 2, ptr %stride
  br label %if.merge.2
if.else.2:
  store i32 1, ptr %stride
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.36 = load i32, ptr %sum
  ret i32 %rcc.tmp.36
}
define void @testCacheConsciousAlgorithms.() {
entry:
  %matrix_mult_result = alloca i32 
  %sort_result = alloca i32 
  %data_processing_result = alloca i32 
  %temporal_result = alloca i32 
  call void @printlnInt.(i32 1509)
  %rcc.tmp.2 = call i32 @cacheObliviousMatrixMultiplication.()
  store i32 %rcc.tmp.2, ptr %matrix_mult_result
  %rcc.tmp.4 = load i32, ptr %matrix_mult_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @cacheConsciousSort.()
  store i32 %rcc.tmp.6, ptr %sort_result
  %rcc.tmp.8 = load i32, ptr %sort_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @cacheAwareDataProcessing.()
  store i32 %rcc.tmp.10, ptr %data_processing_result
  %rcc.tmp.12 = load i32, ptr %data_processing_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @temporalLocalityOptimization.()
  store i32 %rcc.tmp.14, ptr %temporal_result
  %rcc.tmp.16 = load i32, ptr %temporal_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 1510)
  ret void
}
define i32 @cacheObliviousMatrixMultiplication.() {
entry:
  %matrix_a = alloca [64 x i32] 
  %fill.idx = alloca i32 
  %matrix_b = alloca [64 x i32] 
  %fill.idx.2 = alloca i32 
  %matrix_c = alloca [64 x i32] 
  %fill.idx.3 = alloca i32 
  %i = alloca i32 
  %sum = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 64
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [64 x i32], ptr %matrix_a, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 64
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [64 x i32], ptr %matrix_b, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.25 = load i32, ptr %fill.idx.3
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 64
  br i1 %rcc.tmp.26, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = getelementptr [64 x i32], ptr %matrix_c, i32 0, i32 %rcc.tmp.28
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.31, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 64
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [64 x i32], ptr %matrix_a, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = srem i32 %rcc.tmp.43, 10
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %rcc.tmp.42
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [64 x i32], ptr %matrix_b, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = mul i32 %rcc.tmp.50, 2
  %rcc.tmp.52 = srem i32 %rcc.tmp.51, 10
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %rcc.tmp.49
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [64 x i32], ptr %matrix_c, i32 0, i32 %rcc.tmp.56
  store i32 0, ptr %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %i
  br label %while.cond
while.end:
  call void @cacheObliviousMultiplyRecursive.([64 x i32]* %matrix_a, [64 x i32]* %matrix_b, [64 x i32]* %matrix_c, i32 8, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0)
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.67, 64
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.71 = load i32, ptr %sum
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [64 x i32], ptr %matrix_c, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = add i32 %rcc.tmp.71, %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %sum
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.82 = load i32, ptr %sum
  ret i32 %rcc.tmp.82
}
define void @cacheObliviousMultiplyRecursive.([64 x i32]* %a.tmp, [64 x i32]* %b.tmp, [64 x i32]* %c.tmp, i32 %size.tmp, i32 %a_row.tmp, i32 %a_col.tmp, i32 %b_row.tmp, i32 %b_col.tmp, i32 %c_row.tmp, i32 %c_col.tmp) {
entry:
  %a..tmp = alloca [64 x i32]* 
  %b..tmp = alloca [64 x i32]* 
  %c..tmp = alloca [64 x i32]* 
  %size..tmp = alloca i32 
  %a_row..tmp = alloca i32 
  %a_col..tmp = alloca i32 
  %b_row..tmp = alloca i32 
  %b_col..tmp = alloca i32 
  %c_row..tmp = alloca i32 
  %c_col..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %half_size = alloca i32 
  store [64 x i32]* %a.tmp, ptr %a..tmp
  store [64 x i32]* %b.tmp, ptr %b..tmp
  store [64 x i32]* %c.tmp, ptr %c..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %a_row.tmp, ptr %a_row..tmp
  store i32 %a_col.tmp, ptr %a_col..tmp
  store i32 %b_row.tmp, ptr %b_row..tmp
  store i32 %b_col.tmp, ptr %b_col..tmp
  store i32 %c_row.tmp, ptr %c_row..tmp
  store i32 %c_col.tmp, ptr %c_col..tmp
  %rcc.tmp.11 = load i32, ptr %size..tmp
  %rcc.tmp.12 = icmp sle i32 %rcc.tmp.11, 2
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.30 = load i32, ptr %k
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.35 = load i32, ptr %c_row..tmp
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = mul i32 %rcc.tmp.37, 8
  %rcc.tmp.39 = load i32, ptr %c_col..tmp
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.38, %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [64 x i32]*, ptr %c..tmp
  %rcc.tmp.45 = getelementptr [64 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %c_row..tmp
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = mul i32 %rcc.tmp.48, 8
  %rcc.tmp.50 = load i32, ptr %c_col..tmp
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.49, %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [64 x i32]*, ptr %c..tmp
  %rcc.tmp.56 = getelementptr [64 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %a_row..tmp
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.58, %rcc.tmp.59
  %rcc.tmp.61 = mul i32 %rcc.tmp.60, 8
  %rcc.tmp.62 = load i32, ptr %a_col..tmp
  %rcc.tmp.63 = load i32, ptr %k
  %rcc.tmp.64 = add i32 %rcc.tmp.62, %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.61, %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [64 x i32]*, ptr %a..tmp
  %rcc.tmp.68 = getelementptr [64 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %b_row..tmp
  %rcc.tmp.71 = load i32, ptr %k
  %rcc.tmp.72 = add i32 %rcc.tmp.70, %rcc.tmp.71
  %rcc.tmp.73 = mul i32 %rcc.tmp.72, 8
  %rcc.tmp.74 = load i32, ptr %b_col..tmp
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  %rcc.tmp.77 = add i32 %rcc.tmp.73, %rcc.tmp.76
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = load [64 x i32]*, ptr %b..tmp
  %rcc.tmp.80 = getelementptr [64 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = mul i32 %rcc.tmp.69, %rcc.tmp.81
  %rcc.tmp.83 = add i32 %rcc.tmp.57, %rcc.tmp.82
  store i32 %rcc.tmp.83, ptr %rcc.tmp.45
  %rcc.tmp.85 = load i32, ptr %k
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  br label %while.cond
while.end:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.99 = load i32, ptr %size..tmp
  %rcc.tmp.100 = sdiv i32 %rcc.tmp.99, 2
  store i32 %rcc.tmp.100, ptr %half_size
  %rcc.tmp.102 = load [64 x i32]*, ptr %a..tmp
  %rcc.tmp.103 = load [64 x i32]*, ptr %b..tmp
  %rcc.tmp.104 = load [64 x i32]*, ptr %c..tmp
  %rcc.tmp.105 = load i32, ptr %half_size
  %rcc.tmp.106 = load i32, ptr %a_row..tmp
  %rcc.tmp.107 = load i32, ptr %a_col..tmp
  %rcc.tmp.108 = load i32, ptr %b_row..tmp
  %rcc.tmp.109 = load i32, ptr %b_col..tmp
  %rcc.tmp.110 = load i32, ptr %c_row..tmp
  %rcc.tmp.111 = load i32, ptr %c_col..tmp
  call void @cacheObliviousMultiplyRecursive.([64 x i32]* %rcc.tmp.102, [64 x i32]* %rcc.tmp.103, [64 x i32]* %rcc.tmp.104, i32 %rcc.tmp.105, i32 %rcc.tmp.106, i32 %rcc.tmp.107, i32 %rcc.tmp.108, i32 %rcc.tmp.109, i32 %rcc.tmp.110, i32 %rcc.tmp.111)
  %rcc.tmp.113 = load [64 x i32]*, ptr %a..tmp
  %rcc.tmp.114 = load [64 x i32]*, ptr %b..tmp
  %rcc.tmp.115 = load [64 x i32]*, ptr %c..tmp
  %rcc.tmp.116 = load i32, ptr %half_size
  %rcc.tmp.117 = load i32, ptr %a_row..tmp
  %rcc.tmp.118 = load i32, ptr %a_col..tmp
  %rcc.tmp.119 = load i32, ptr %half_size
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %b_row..tmp
  %rcc.tmp.122 = load i32, ptr %half_size
  %rcc.tmp.123 = add i32 %rcc.tmp.121, %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %b_col..tmp
  %rcc.tmp.125 = load i32, ptr %c_row..tmp
  %rcc.tmp.126 = load i32, ptr %c_col..tmp
  call void @cacheObliviousMultiplyRecursive.([64 x i32]* %rcc.tmp.113, [64 x i32]* %rcc.tmp.114, [64 x i32]* %rcc.tmp.115, i32 %rcc.tmp.116, i32 %rcc.tmp.117, i32 %rcc.tmp.120, i32 %rcc.tmp.123, i32 %rcc.tmp.124, i32 %rcc.tmp.125, i32 %rcc.tmp.126)
  ret void
}
define i32 @cacheConsciousSort.() {
entry:
  %test_data = alloca [512 x i32] 
  %fill.idx = alloca i32 
  %comparisons = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 512
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [512 x i32], ptr %test_data, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeSortTestData.([512 x i32]* %test_data)
  %rcc.tmp.13 = call i32 @cacheConsciousMergeSort.([512 x i32]* %test_data, i32 0, i32 511)
  store i32 %rcc.tmp.13, ptr %comparisons
  %rcc.tmp.15 = load i32, ptr %comparisons
  ret i32 %rcc.tmp.15
}
define void @initializeSortTestData.([512 x i32]* %arr.tmp) {
entry:
  %arr..tmp = alloca [512 x i32]* 
  %seed = alloca i32 
  %i = alloca i32 
  store [512 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 13579, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 512
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %seed
  %rcc.tmp.10 = mul i32 %rcc.tmp.9, 1103
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 4721
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 1048583
  store i32 %rcc.tmp.12, ptr %seed
  %rcc.tmp.14 = load i32, ptr %seed
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %seed
  %rcc.tmp.18 = sub i32 0, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.25 = getelementptr [512 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %seed
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 1000
  store i32 %rcc.tmp.27, ptr %rcc.tmp.25
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @cacheConsciousMergeSort.([512 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [512 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %size = alloca i32 
  %mid = alloca i32 
  %left_comparisons = alloca i32 
  %right_comparisons = alloca i32 
  %merge_comparisons = alloca i32 
  store [512 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.4 = load i32, ptr %left..tmp
  %rcc.tmp.5 = load i32, ptr %right..tmp
  %rcc.tmp.6 = icmp sge i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %right..tmp
  %rcc.tmp.11 = load i32, ptr %left..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %size
  %rcc.tmp.15 = load i32, ptr %size
  %rcc.tmp.16 = icmp sle i32 %rcc.tmp.15, 16
  br i1 %rcc.tmp.16, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.18 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.19 = load i32, ptr %left..tmp
  %rcc.tmp.20 = load i32, ptr %right..tmp
  %rcc.tmp.21 = call i32 @insertionSort.([512 x i32]* %rcc.tmp.18, i32 %rcc.tmp.19, i32 %rcc.tmp.20)
  ret i32 %rcc.tmp.21
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.24 = load i32, ptr %left..tmp
  %rcc.tmp.25 = load i32, ptr %right..tmp
  %rcc.tmp.26 = load i32, ptr %left..tmp
  %rcc.tmp.27 = sub i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = sdiv i32 %rcc.tmp.27, 2
  %rcc.tmp.29 = add i32 %rcc.tmp.24, %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %mid
  %rcc.tmp.31 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.32 = load i32, ptr %left..tmp
  %rcc.tmp.33 = load i32, ptr %mid
  %rcc.tmp.34 = call i32 @cacheConsciousMergeSort.([512 x i32]* %rcc.tmp.31, i32 %rcc.tmp.32, i32 %rcc.tmp.33)
  store i32 %rcc.tmp.34, ptr %left_comparisons
  %rcc.tmp.36 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.37 = load i32, ptr %mid
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = load i32, ptr %right..tmp
  %rcc.tmp.40 = call i32 @cacheConsciousMergeSort.([512 x i32]* %rcc.tmp.36, i32 %rcc.tmp.38, i32 %rcc.tmp.39)
  store i32 %rcc.tmp.40, ptr %right_comparisons
  %rcc.tmp.42 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.43 = load i32, ptr %left..tmp
  %rcc.tmp.44 = load i32, ptr %mid
  %rcc.tmp.45 = load i32, ptr %right..tmp
  %rcc.tmp.46 = call i32 @cacheFriendlyMerge.([512 x i32]* %rcc.tmp.42, i32 %rcc.tmp.43, i32 %rcc.tmp.44, i32 %rcc.tmp.45)
  store i32 %rcc.tmp.46, ptr %merge_comparisons
  %rcc.tmp.48 = load i32, ptr %left_comparisons
  %rcc.tmp.49 = load i32, ptr %right_comparisons
  %rcc.tmp.50 = add i32 %rcc.tmp.48, %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %merge_comparisons
  %rcc.tmp.52 = add i32 %rcc.tmp.50, %rcc.tmp.51
  ret i32 %rcc.tmp.52
}
define i32 @insertionSort.([512 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [512 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %comparisons = alloca i32 
  %i = alloca i32 
  %key = alloca i32 
  %j = alloca i32 
  store [512 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  store i32 0, ptr %comparisons
  %rcc.tmp.5 = load i32, ptr %left..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 1
  store i32 %rcc.tmp.6, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %right..tmp
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.17 = getelementptr [512 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %key
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = sub i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = load i32, ptr %left..tmp
  %rcc.tmp.26 = icmp sge i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.31 = getelementptr [512 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %key
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.32, %rcc.tmp.33
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.cond.2], [%rcc.tmp.34, %and.rhs]
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.43 = getelementptr [512 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.47 = getelementptr [512 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %rcc.tmp.43
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = sub i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %j
  %rcc.tmp.53 = load i32, ptr %comparisons
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %comparisons
  br label %while.cond.2
while.end.2:
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = load i32, ptr %left..tmp
  %rcc.tmp.59 = icmp sge i32 %rcc.tmp.57, %rcc.tmp.58
  br i1 %rcc.tmp.59, label %if.then, label %if.else
if.then:
  %rcc.tmp.61 = load i32, ptr %comparisons
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %comparisons
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.70 = getelementptr [512 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %key
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.77 = load i32, ptr %comparisons
  ret i32 %rcc.tmp.77
}
define i32 @cacheFriendlyMerge.([512 x i32]* %arr.tmp, i32 %left.tmp, i32 %mid.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [512 x i32]* 
  %left..tmp = alloca i32 
  %mid..tmp = alloca i32 
  %right..tmp = alloca i32 
  %left_size = alloca i32 
  %right_size = alloca i32 
  %left_temp = alloca [128 x i32] 
  %fill.idx = alloca i32 
  %right_temp = alloca [128 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %comparisons = alloca i32 
  store [512 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %mid.tmp, ptr %mid..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.5 = load i32, ptr %mid..tmp
  %rcc.tmp.6 = load i32, ptr %left..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %left_size
  %rcc.tmp.10 = load i32, ptr %right..tmp
  %rcc.tmp.11 = load i32, ptr %mid..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %right_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.16 = load i32, ptr %fill.idx
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 128
  br i1 %rcc.tmp.17, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.19 = load i32, ptr %fill.idx
  %rcc.tmp.20 = getelementptr [128 x i32], ptr %left_temp, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.27 = load i32, ptr %fill.idx.2
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 128
  br i1 %rcc.tmp.28, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.30 = load i32, ptr %fill.idx.2
  %rcc.tmp.31 = getelementptr [128 x i32], ptr %right_temp, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %left_size
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 128
  br label %sc.merge
sc.merge:
  %rcc.tmp.45 = phi i1 [0, %while.cond], [%rcc.tmp.43, %and.rhs]
  br i1 %rcc.tmp.45, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [128 x i32], ptr %left_temp, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %left..tmp
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.51, %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.56 = getelementptr [512 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %rcc.tmp.50
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = load i32, ptr %right_size
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.66
  br i1 %rcc.tmp.67, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.69, 128
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.72 = phi i1 [0, %while.cond.2], [%rcc.tmp.70, %and.rhs.2]
  br i1 %rcc.tmp.72, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [128 x i32], ptr %right_temp, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %mid..tmp
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = load i32, ptr %j
  %rcc.tmp.81 = add i32 %rcc.tmp.79, %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.84 = getelementptr [512 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %rcc.tmp.77
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  store i32 0, ptr %j
  %rcc.tmp.93 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.93, ptr %k
  store i32 0, ptr %comparisons
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = load i32, ptr %left_size
  %rcc.tmp.99 = icmp slt i32 %rcc.tmp.97, %rcc.tmp.98
  br i1 %rcc.tmp.99, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.101 = load i32, ptr %j
  %rcc.tmp.102 = load i32, ptr %right_size
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.101, %rcc.tmp.102
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.105 = phi i1 [0, %while.cond.3], [%rcc.tmp.103, %and.rhs.3]
  br i1 %rcc.tmp.105, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = icmp slt i32 %rcc.tmp.107, 128
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.110 = phi i1 [0, %sc.merge.3], [%rcc.tmp.108, %and.rhs.4]
  br i1 %rcc.tmp.110, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.112 = load i32, ptr %j
  %rcc.tmp.113 = icmp slt i32 %rcc.tmp.112, 128
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.115 = phi i1 [0, %sc.merge.4], [%rcc.tmp.113, %and.rhs.5]
  br i1 %rcc.tmp.115, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.118 = load i32, ptr %comparisons
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %comparisons
  %rcc.tmp.121 = load i32, ptr %i
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [128 x i32], ptr %left_temp, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = load i32, ptr %j
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = getelementptr [128 x i32], ptr %right_temp, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  %rcc.tmp.129 = icmp sle i32 %rcc.tmp.124, %rcc.tmp.128
  br i1 %rcc.tmp.129, label %if.then, label %if.else
if.then:
  %rcc.tmp.131 = load i32, ptr %k
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 0
  %rcc.tmp.133 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.134 = getelementptr [512 x i32], ptr %rcc.tmp.133, i32 0, i32 %rcc.tmp.132
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [128 x i32], ptr %left_temp, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.138, ptr %rcc.tmp.134
  %rcc.tmp.140 = load i32, ptr %i
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 1
  store i32 %rcc.tmp.141, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.144 = load i32, ptr %k
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.147 = getelementptr [512 x i32], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.148 = load i32, ptr %j
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 0
  %rcc.tmp.150 = getelementptr [128 x i32], ptr %right_temp, i32 0, i32 %rcc.tmp.149
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.150
  store i32 %rcc.tmp.151, ptr %rcc.tmp.147
  %rcc.tmp.153 = load i32, ptr %j
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %j
  br label %if.merge
if.merge:
  %rcc.tmp.157 = load i32, ptr %k
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 1
  store i32 %rcc.tmp.158, ptr %k
  br label %while.cond.3
while.end.3:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.162 = load i32, ptr %i
  %rcc.tmp.163 = load i32, ptr %left_size
  %rcc.tmp.164 = icmp slt i32 %rcc.tmp.162, %rcc.tmp.163
  br i1 %rcc.tmp.164, label %and.rhs.6, label %sc.merge.6
and.rhs.6:
  %rcc.tmp.166 = load i32, ptr %i
  %rcc.tmp.167 = icmp slt i32 %rcc.tmp.166, 128
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.169 = phi i1 [0, %while.cond.4], [%rcc.tmp.167, %and.rhs.6]
  br i1 %rcc.tmp.169, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.172 = load i32, ptr %k
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 0
  %rcc.tmp.174 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.175 = getelementptr [512 x i32], ptr %rcc.tmp.174, i32 0, i32 %rcc.tmp.173
  %rcc.tmp.176 = load i32, ptr %i
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 0
  %rcc.tmp.178 = getelementptr [128 x i32], ptr %left_temp, i32 0, i32 %rcc.tmp.177
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.178
  store i32 %rcc.tmp.179, ptr %rcc.tmp.175
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 1
  store i32 %rcc.tmp.182, ptr %i
  %rcc.tmp.184 = load i32, ptr %k
  %rcc.tmp.185 = add i32 %rcc.tmp.184, 1
  store i32 %rcc.tmp.185, ptr %k
  br label %while.cond.4
while.end.4:
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.189 = load i32, ptr %j
  %rcc.tmp.190 = load i32, ptr %right_size
  %rcc.tmp.191 = icmp slt i32 %rcc.tmp.189, %rcc.tmp.190
  br i1 %rcc.tmp.191, label %and.rhs.7, label %sc.merge.7
and.rhs.7:
  %rcc.tmp.193 = load i32, ptr %j
  %rcc.tmp.194 = icmp slt i32 %rcc.tmp.193, 128
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.196 = phi i1 [0, %while.cond.5], [%rcc.tmp.194, %and.rhs.7]
  br i1 %rcc.tmp.196, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.199 = load i32, ptr %k
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 0
  %rcc.tmp.201 = load [512 x i32]*, ptr %arr..tmp
  %rcc.tmp.202 = getelementptr [512 x i32], ptr %rcc.tmp.201, i32 0, i32 %rcc.tmp.200
  %rcc.tmp.203 = load i32, ptr %j
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 0
  %rcc.tmp.205 = getelementptr [128 x i32], ptr %right_temp, i32 0, i32 %rcc.tmp.204
  %rcc.tmp.206 = load i32, ptr %rcc.tmp.205
  store i32 %rcc.tmp.206, ptr %rcc.tmp.202
  %rcc.tmp.208 = load i32, ptr %j
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %j
  %rcc.tmp.211 = load i32, ptr %k
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 1
  store i32 %rcc.tmp.212, ptr %k
  br label %while.cond.5
while.end.5:
  %rcc.tmp.215 = load i32, ptr %comparisons
  ret i32 %rcc.tmp.215
}
define i32 @cacheAwareDataProcessing.() {
entry:
  %data_grid = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %result = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1024
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %data_grid, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeDataGrid.([1024 x i32]* %data_grid)
  %rcc.tmp.13 = call i32 @processDataInBlocks.([1024 x i32]* %data_grid)
  store i32 %rcc.tmp.13, ptr %result
  %rcc.tmp.15 = load i32, ptr %result
  ret i32 %rcc.tmp.15
}
define void @initializeDataGrid.([1024 x i32]* %grid.tmp) {
entry:
  %grid..tmp = alloca [1024 x i32]* 
  %i = alloca i32 
  store [1024 x i32]* %grid.tmp, ptr %grid..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1024
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load [1024 x i32]*, ptr %grid..tmp
  %rcc.tmp.10 = getelementptr [1024 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 50
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %rcc.tmp.10
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @processDataInBlocks.([1024 x i32]* %grid.tmp) {
entry:
  %grid..tmp = alloca [1024 x i32]* 
  %total_sum = alloca i32 
  %block_size = alloca i32 
  %grid_size = alloca i32 
  %block_row = alloca i32 
  %block_col = alloca i32 
  %row = alloca i32 
  %end_row = alloca i32 
  %col = alloca i32 
  %end_col = alloca i32 
  %index = alloca i32 
  store [1024 x i32]* %grid.tmp, ptr %grid..tmp
  store i32 0, ptr %total_sum
  store i32 8, ptr %block_size
  store i32 32, ptr %grid_size
  store i32 0, ptr %block_row
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %block_row
  %rcc.tmp.8 = load i32, ptr %grid_size
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %block_col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %block_col
  %rcc.tmp.15 = load i32, ptr %grid_size
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %block_row
  store i32 %rcc.tmp.19, ptr %row
  %rcc.tmp.21 = load i32, ptr %block_row
  %rcc.tmp.22 = load i32, ptr %block_size
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %end_row
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.26 = load i32, ptr %row
  %rcc.tmp.27 = load i32, ptr %end_row
  %rcc.tmp.28 = icmp ult i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.30 = load i32, ptr %row
  %rcc.tmp.31 = load i32, ptr %grid_size
  %rcc.tmp.32 = icmp ult i32 %rcc.tmp.30, %rcc.tmp.31
  br label %sc.merge
sc.merge:
  %rcc.tmp.34 = phi i1 [0, %while.cond.3], [%rcc.tmp.32, %and.rhs]
  br i1 %rcc.tmp.34, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.37 = load i32, ptr %block_col
  store i32 %rcc.tmp.37, ptr %col
  %rcc.tmp.39 = load i32, ptr %block_col
  %rcc.tmp.40 = load i32, ptr %block_size
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %end_col
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.44 = load i32, ptr %col
  %rcc.tmp.45 = load i32, ptr %end_col
  %rcc.tmp.46 = icmp ult i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.48 = load i32, ptr %col
  %rcc.tmp.49 = load i32, ptr %grid_size
  %rcc.tmp.50 = icmp ult i32 %rcc.tmp.48, %rcc.tmp.49
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.52 = phi i1 [0, %while.cond.4], [%rcc.tmp.50, %and.rhs.2]
  br i1 %rcc.tmp.52, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.55 = load i32, ptr %row
  %rcc.tmp.56 = load i32, ptr %grid_size
  %rcc.tmp.57 = mul i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %col
  %rcc.tmp.59 = add i32 %rcc.tmp.57, %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %index
  %rcc.tmp.61 = load i32, ptr %index
  %rcc.tmp.62 = load [1024 x i32]*, ptr %grid..tmp
  %rcc.tmp.63 = getelementptr [1024 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %index
  %rcc.tmp.65 = load [1024 x i32]*, ptr %grid..tmp
  %rcc.tmp.66 = getelementptr [1024 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = mul i32 %rcc.tmp.67, 2
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %rcc.tmp.63
  %rcc.tmp.71 = load i32, ptr %total_sum
  %rcc.tmp.72 = load i32, ptr %index
  %rcc.tmp.73 = load [1024 x i32]*, ptr %grid..tmp
  %rcc.tmp.74 = getelementptr [1024 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = add i32 %rcc.tmp.71, %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %total_sum
  %rcc.tmp.78 = load i32, ptr %col
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %col
  br label %while.cond.4
while.end.4:
  %rcc.tmp.82 = load i32, ptr %row
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %row
  br label %while.cond.3
while.end.3:
  %rcc.tmp.86 = load i32, ptr %block_col
  %rcc.tmp.87 = load i32, ptr %block_size
  %rcc.tmp.88 = add i32 %rcc.tmp.86, %rcc.tmp.87
  store i32 %rcc.tmp.88, ptr %block_col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.91 = load i32, ptr %block_row
  %rcc.tmp.92 = load i32, ptr %block_size
  %rcc.tmp.93 = add i32 %rcc.tmp.91, %rcc.tmp.92
  store i32 %rcc.tmp.93, ptr %block_row
  br label %while.cond
while.end:
  %rcc.tmp.96 = load i32, ptr %total_sum
  ret i32 %rcc.tmp.96
}
define i32 @temporalLocalityOptimization.() {
entry:
  %working_set = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %total_operations = alloca i32 
  %iteration = alloca i32 
  %pass_operations = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 256
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [256 x i32], ptr %working_set, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeWorkingSet.([256 x i32]* %working_set)
  store i32 0, ptr %total_operations
  store i32 0, ptr %iteration
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %iteration
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 100
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = call i32 @processWorkingSet.([256 x i32]* %working_set)
  store i32 %rcc.tmp.20, ptr %pass_operations
  %rcc.tmp.22 = load i32, ptr %total_operations
  %rcc.tmp.23 = load i32, ptr %pass_operations
  %rcc.tmp.24 = add i32 %rcc.tmp.22, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %total_operations
  %rcc.tmp.26 = load i32, ptr %iteration
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %iteration
  br label %while.cond
while.end:
  %rcc.tmp.30 = load i32, ptr %total_operations
  ret i32 %rcc.tmp.30
}
define void @initializeWorkingSet.([256 x i32]* %working_set.tmp) {
entry:
  %working_set..tmp = alloca [256 x i32]* 
  %i = alloca i32 
  store [256 x i32]* %working_set.tmp, ptr %working_set..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 256
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.11 = getelementptr [256 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %rcc.tmp.11
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @processWorkingSet.([256 x i32]* %working_set.tmp) {
entry:
  %working_set..tmp = alloca [256 x i32]* 
  %operations = alloca i32 
  %i = alloca i32 
  store [256 x i32]* %working_set.tmp, ptr %working_set..tmp
  store i32 0, ptr %operations
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 256
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.12 = getelementptr [256 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.16 = getelementptr [256 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %rcc.tmp.12
  %rcc.tmp.20 = load i32, ptr %operations
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %operations
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 256
  br i1 %rcc.tmp.30, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.36 = getelementptr [256 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.40 = getelementptr [256 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = mul i32 %rcc.tmp.41, 2
  store i32 %rcc.tmp.42, ptr %rcc.tmp.36
  %rcc.tmp.44 = load i32, ptr %operations
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %operations
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.53, 256
  br i1 %rcc.tmp.54, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.60 = getelementptr [256 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = srem i32 %rcc.tmp.61, 2
  %rcc.tmp.63 = icmp eq i32 %rcc.tmp.62, 0
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.68 = getelementptr [256 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = load [256 x i32]*, ptr %working_set..tmp
  %rcc.tmp.72 = getelementptr [256 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = sdiv i32 %rcc.tmp.73, 2
  store i32 %rcc.tmp.74, ptr %rcc.tmp.68
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.78 = load i32, ptr %operations
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %operations
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.85 = load i32, ptr %operations
  ret i32 %rcc.tmp.85
}
