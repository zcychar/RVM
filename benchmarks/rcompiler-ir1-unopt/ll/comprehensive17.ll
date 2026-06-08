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
  call void @printlnInt.(i32 1700)
  call void @performBasicMatrixOperations.()
  call void @performAdvancedMatrixAlgorithms.()
  call void @performSparseMatrixOperations.()
  call void @performMatrixPerformanceBenchmarks.()
  call void @testMatrixEdgeCases.()
  call void @printlnInt.(i32 1799)
  call void @exit.(i32 0)
  ret void
}
define void @performBasicMatrixOperations.() {
entry:
  %matrix_a = alloca [400 x i32] 
  %fill.idx = alloca i32 
  %matrix_b = alloca [400 x i32] 
  %fill.idx.2 = alloca i32 
  %result_matrix = alloca [400 x i32] 
  %fill.idx.3 = alloca i32 
  %matrix_size = alloca i32 
  %addition_sum = alloca i32 
  %subtraction_sum = alloca i32 
  %multiplication_sum = alloca i32 
  %transpose_sum = alloca i32 
  %small_matrix = alloca [16 x i32] 
  %determinant = alloca i32 
  call void @printlnInt.(i32 1701)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 400
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [400 x i32], ptr %matrix_a, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 400
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [400 x i32], ptr %matrix_b, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 400
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [400 x i32], ptr %result_matrix, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 20, ptr %matrix_size
  %rcc.tmp.36 = load i32, ptr %matrix_size
  call void @initializeMatrices.([400 x i32]* %matrix_a, [400 x i32]* %matrix_b, i32 %rcc.tmp.36)
  call void @printlnInt.(i32 1702)
  %rcc.tmp.39 = load i32, ptr %matrix_size
  call void @matrixAddition.([400 x i32]* %matrix_a, [400 x i32]* %matrix_b, [400 x i32]* %result_matrix, i32 %rcc.tmp.39)
  %rcc.tmp.41 = load i32, ptr %matrix_size
  %rcc.tmp.42 = call i32 @calculateMatrixSum.([400 x i32]* %result_matrix, i32 %rcc.tmp.41)
  store i32 %rcc.tmp.42, ptr %addition_sum
  %rcc.tmp.44 = load i32, ptr %addition_sum
  call void @printlnInt.(i32 %rcc.tmp.44)
  call void @printlnInt.(i32 1703)
  %rcc.tmp.47 = load i32, ptr %matrix_size
  call void @matrixSubtraction.([400 x i32]* %matrix_a, [400 x i32]* %matrix_b, [400 x i32]* %result_matrix, i32 %rcc.tmp.47)
  %rcc.tmp.49 = load i32, ptr %matrix_size
  %rcc.tmp.50 = call i32 @calculateMatrixSum.([400 x i32]* %result_matrix, i32 %rcc.tmp.49)
  store i32 %rcc.tmp.50, ptr %subtraction_sum
  %rcc.tmp.52 = load i32, ptr %subtraction_sum
  call void @printlnInt.(i32 %rcc.tmp.52)
  call void @printlnInt.(i32 1704)
  %rcc.tmp.55 = load i32, ptr %matrix_size
  call void @matrixMultiplication.([400 x i32]* %matrix_a, [400 x i32]* %matrix_b, [400 x i32]* %result_matrix, i32 %rcc.tmp.55)
  %rcc.tmp.57 = load i32, ptr %matrix_size
  %rcc.tmp.58 = call i32 @calculateMatrixSum.([400 x i32]* %result_matrix, i32 %rcc.tmp.57)
  store i32 %rcc.tmp.58, ptr %multiplication_sum
  %rcc.tmp.60 = load i32, ptr %multiplication_sum
  call void @printlnInt.(i32 %rcc.tmp.60)
  call void @printlnInt.(i32 1705)
  %rcc.tmp.63 = load i32, ptr %matrix_size
  call void @matrixTranspose.([400 x i32]* %matrix_a, [400 x i32]* %result_matrix, i32 %rcc.tmp.63)
  %rcc.tmp.65 = load i32, ptr %matrix_size
  %rcc.tmp.66 = call i32 @calculateMatrixSum.([400 x i32]* %result_matrix, i32 %rcc.tmp.65)
  store i32 %rcc.tmp.66, ptr %transpose_sum
  %rcc.tmp.68 = load i32, ptr %transpose_sum
  call void @printlnInt.(i32 %rcc.tmp.68)
  call void @printlnInt.(i32 1706)
  %rcc.tmp.71 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.99
  %rcc.tmp.101 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.101
  call void @initializeSmallMatrix.([16 x i32]* %small_matrix)
  %rcc.tmp.104 = call i32 @calculateDeterminant4x4.([16 x i32]* %small_matrix)
  store i32 %rcc.tmp.104, ptr %determinant
  %rcc.tmp.106 = load i32, ptr %determinant
  call void @printlnInt.(i32 %rcc.tmp.106)
  ret void
}
define void @initializeMatrices.([400 x i32]* %matrix_a.tmp, [400 x i32]* %matrix_b.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [400 x i32]* 
  %matrix_b..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %index = alloca i32 
  store [400 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [400 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %row
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %col
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %row
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %col
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %index
  %rcc.tmp.24 = load i32, ptr %row
  %rcc.tmp.25 = load i32, ptr %col
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %index
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [400 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.31 = getelementptr [400 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %row
  %rcc.tmp.33 = load i32, ptr %col
  %rcc.tmp.34 = add i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 10
  store i32 %rcc.tmp.35, ptr %rcc.tmp.31
  br label %if.merge
if.else:
  %rcc.tmp.38 = load i32, ptr %index
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [400 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.41 = getelementptr [400 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %row
  %rcc.tmp.43 = mul i32 %rcc.tmp.42, 2
  %rcc.tmp.44 = load i32, ptr %col
  %rcc.tmp.45 = mul i32 %rcc.tmp.44, 3
  %rcc.tmp.46 = add i32 %rcc.tmp.43, %rcc.tmp.45
  %rcc.tmp.47 = srem i32 %rcc.tmp.46, 7
  store i32 %rcc.tmp.47, ptr %rcc.tmp.41
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %row
  %rcc.tmp.51 = load i32, ptr %col
  %rcc.tmp.52 = icmp sle i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.54 = load i32, ptr %index
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [400 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.57 = getelementptr [400 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %row
  %rcc.tmp.59 = load i32, ptr %col
  %rcc.tmp.60 = mul i32 %rcc.tmp.58, %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 5
  store i32 %rcc.tmp.61, ptr %rcc.tmp.57
  %rcc.tmp.63 = load i32, ptr %col
  %rcc.tmp.64 = load i32, ptr %size..tmp
  %rcc.tmp.65 = mul i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %row
  %rcc.tmp.67 = add i32 %rcc.tmp.65, %rcc.tmp.66
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [400 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.70 = getelementptr [400 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %row
  %rcc.tmp.72 = load i32, ptr %col
  %rcc.tmp.73 = mul i32 %rcc.tmp.71, %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 5
  store i32 %rcc.tmp.74, ptr %rcc.tmp.70
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.78 = load i32, ptr %col
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.82 = load i32, ptr %row
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %row
  br label %while.cond
while.end:
  ret void
}
define void @matrixAddition.([400 x i32]* %matrix_a.tmp, [400 x i32]* %matrix_b.tmp, [400 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [400 x i32]* 
  %matrix_b..tmp = alloca [400 x i32]* 
  %result..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %total_elements = alloca i32 
  store [400 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [400 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [400 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.6, %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %total_elements
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load i32, ptr %total_elements
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.19 = getelementptr [400 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [400 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.23 = getelementptr [400 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [400 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.28 = getelementptr [400 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.24, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %rcc.tmp.19
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @matrixSubtraction.([400 x i32]* %matrix_a.tmp, [400 x i32]* %matrix_b.tmp, [400 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [400 x i32]* 
  %matrix_b..tmp = alloca [400 x i32]* 
  %result..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %index = alloca i32 
  store [400 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [400 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [400 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %row
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %col
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %row
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %col
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %index
  %rcc.tmp.25 = load i32, ptr %index
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.28 = getelementptr [400 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %index
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [400 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.32 = getelementptr [400 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %index
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [400 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.37 = getelementptr [400 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = sub i32 %rcc.tmp.33, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.28
  %rcc.tmp.41 = load i32, ptr %col
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.45 = load i32, ptr %row
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %row
  br label %while.cond
while.end:
  ret void
}
define void @matrixMultiplication.([400 x i32]* %matrix_a.tmp, [400 x i32]* %matrix_b.tmp, [400 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [400 x i32]* 
  %matrix_b..tmp = alloca [400 x i32]* 
  %result..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %block_size = alloca i32 
  %row_block = alloca i32 
  %col_block = alloca i32 
  %k_block = alloca i32 
  store [400 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [400 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [400 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = mul i32 %rcc.tmp.8, %rcc.tmp.9
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.17 = getelementptr [400 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  store i32 4, ptr %block_size
  store i32 0, ptr %row_block
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %row_block
  %rcc.tmp.27 = load i32, ptr %size..tmp
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %col_block
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.33 = load i32, ptr %col_block
  %rcc.tmp.34 = load i32, ptr %size..tmp
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %k_block
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.40 = load i32, ptr %k_block
  %rcc.tmp.41 = load i32, ptr %size..tmp
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.45 = load [400 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.46 = load [400 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.47 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.48 = load i32, ptr %size..tmp
  %rcc.tmp.49 = load i32, ptr %row_block
  %rcc.tmp.50 = load i32, ptr %col_block
  %rcc.tmp.51 = load i32, ptr %k_block
  %rcc.tmp.52 = load i32, ptr %block_size
  call void @processMatrixBlock.([400 x i32]* %rcc.tmp.45, [400 x i32]* %rcc.tmp.46, [400 x i32]* %rcc.tmp.47, i32 %rcc.tmp.48, i32 %rcc.tmp.49, i32 %rcc.tmp.50, i32 %rcc.tmp.51, i32 %rcc.tmp.52)
  %rcc.tmp.54 = load i32, ptr %k_block
  %rcc.tmp.55 = load i32, ptr %block_size
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %k_block
  br label %while.cond.4
while.end.4:
  %rcc.tmp.59 = load i32, ptr %col_block
  %rcc.tmp.60 = load i32, ptr %block_size
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %col_block
  br label %while.cond.3
while.end.3:
  %rcc.tmp.64 = load i32, ptr %row_block
  %rcc.tmp.65 = load i32, ptr %block_size
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %row_block
  br label %while.cond.2
while.end.2:
  ret void
}
define void @processMatrixBlock.([400 x i32]* %matrix_a.tmp, [400 x i32]* %matrix_b.tmp, [400 x i32]* %result.tmp, i32 %size.tmp, i32 %row_start.tmp, i32 %col_start.tmp, i32 %k_start.tmp, i32 %block_size.tmp) {
entry:
  %matrix_a..tmp = alloca [400 x i32]* 
  %matrix_b..tmp = alloca [400 x i32]* 
  %result..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %row_start..tmp = alloca i32 
  %col_start..tmp = alloca i32 
  %k_start..tmp = alloca i32 
  %block_size..tmp = alloca i32 
  %row_end = alloca i32 
  %col_end = alloca i32 
  %k_end = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %result_index = alloca i32 
  %a_index = alloca i32 
  %b_index = alloca i32 
  store [400 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [400 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [400 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %row_start.tmp, ptr %row_start..tmp
  store i32 %col_start.tmp, ptr %col_start..tmp
  store i32 %k_start.tmp, ptr %k_start..tmp
  store i32 %block_size.tmp, ptr %block_size..tmp
  %rcc.tmp.9 = load i32, ptr %row_start..tmp
  %rcc.tmp.10 = load i32, ptr %block_size..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.9, %rcc.tmp.10
  %rcc.tmp.12 = load i32, ptr %size..tmp
  %rcc.tmp.13 = call i32 @minValue.(i32 %rcc.tmp.11, i32 %rcc.tmp.12)
  store i32 %rcc.tmp.13, ptr %row_end
  %rcc.tmp.15 = load i32, ptr %col_start..tmp
  %rcc.tmp.16 = load i32, ptr %block_size..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = call i32 @minValue.(i32 %rcc.tmp.17, i32 %rcc.tmp.18)
  store i32 %rcc.tmp.19, ptr %col_end
  %rcc.tmp.21 = load i32, ptr %k_start..tmp
  %rcc.tmp.22 = load i32, ptr %block_size..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = call i32 @minValue.(i32 %rcc.tmp.23, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %k_end
  %rcc.tmp.27 = load i32, ptr %row_start..tmp
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %row_end
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.35 = load i32, ptr %col_start..tmp
  store i32 %rcc.tmp.35, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = load i32, ptr %col_end
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.43 = load i32, ptr %k_start..tmp
  store i32 %rcc.tmp.43, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.46 = load i32, ptr %k
  %rcc.tmp.47 = load i32, ptr %k_end
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = load i32, ptr %size..tmp
  %rcc.tmp.53 = mul i32 %rcc.tmp.51, %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = add i32 %rcc.tmp.53, %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %result_index
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = load i32, ptr %size..tmp
  %rcc.tmp.59 = mul i32 %rcc.tmp.57, %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %k
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %a_index
  %rcc.tmp.63 = load i32, ptr %k
  %rcc.tmp.64 = load i32, ptr %size..tmp
  %rcc.tmp.65 = mul i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.65, %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %b_index
  %rcc.tmp.69 = load i32, ptr %result_index
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.72 = getelementptr [400 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %result_index
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.76 = getelementptr [400 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %a_index
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [400 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.81 = getelementptr [400 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %b_index
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = load [400 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.86 = getelementptr [400 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = mul i32 %rcc.tmp.82, %rcc.tmp.87
  %rcc.tmp.89 = add i32 %rcc.tmp.77, %rcc.tmp.88
  store i32 %rcc.tmp.89, ptr %rcc.tmp.72
  %rcc.tmp.91 = load i32, ptr %k
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.95 = load i32, ptr %j
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @minValue.(i32 %a.tmp, i32 %b.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load i32, ptr %a..tmp
  %rcc.tmp.4 = load i32, ptr %b..tmp
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %a..tmp
  ret i32 %rcc.tmp.7
if.else:
  %rcc.tmp.9 = load i32, ptr %b..tmp
  ret i32 %rcc.tmp.9
if.merge:
  ret i32 undef
}
define void @matrixTranspose.([400 x i32]* %matrix.tmp, [400 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [400 x i32]* 
  %result..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %original_index = alloca i32 
  %transposed_index = alloca i32 
  store [400 x i32]* %matrix.tmp, ptr %matrix..tmp
  store [400 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %row
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %col
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %row
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %col
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %original_index
  %rcc.tmp.24 = load i32, ptr %col
  %rcc.tmp.25 = load i32, ptr %size..tmp
  %rcc.tmp.26 = mul i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %row
  %rcc.tmp.28 = add i32 %rcc.tmp.26, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %transposed_index
  %rcc.tmp.30 = load i32, ptr %transposed_index
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.33 = getelementptr [400 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %original_index
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.37 = getelementptr [400 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %rcc.tmp.33
  %rcc.tmp.40 = load i32, ptr %col
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.44 = load i32, ptr %row
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %row
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateMatrixSum.([400 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  %total_elements = alloca i32 
  store [400 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  %rcc.tmp.5 = load i32, ptr %size..tmp
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = mul i32 %rcc.tmp.5, %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %total_elements
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %total_elements
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %sum
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.19 = getelementptr [400 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.15, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %sum
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.27 = load i32, ptr %sum
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 1000000
  ret i32 %rcc.tmp.28
}
define void @initializeSmallMatrix.([16 x i32]* %matrix.tmp) {
entry:
  %matrix..local = alloca [16 x i32] 
  %rcc.tmp.1 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 0
  store i32 4, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 1
  store i32 3, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 2
  store i32 2, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 3
  store i32 1, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 4
  store i32 3, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 5
  store i32 4, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 6
  store i32 1, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 7
  store i32 2, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 8
  store i32 2, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 9
  store i32 1, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 10
  store i32 4, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 11
  store i32 3, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 12
  store i32 1, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 13
  store i32 2, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 14
  store i32 3, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 15
  store i32 4, ptr %rcc.tmp.95
  ret void
}
define i32 @calculateDeterminant4x4.([16 x i32]* %matrix.tmp) {
entry:
  %matrix..local = alloca [16 x i32] 
  %determinant = alloca i32 
  %col = alloca i32 
  %cofactor = alloca i32 
  %rcc.tmp.1 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  store i32 0, ptr %determinant
  store i32 0, ptr %col
  br label %while.cond
while.cond:
  %rcc.tmp.68 = load i32, ptr %col
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.68, 4
  br i1 %rcc.tmp.69, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.72 = load i32, ptr %col
  %rcc.tmp.73 = call i32 @calculateCofactor4x4.([16 x i32]* %matrix..local, i32 0, i32 %rcc.tmp.72)
  store i32 %rcc.tmp.73, ptr %cofactor
  %rcc.tmp.75 = load i32, ptr %col
  %rcc.tmp.76 = srem i32 %rcc.tmp.75, 2
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 0
  br i1 %rcc.tmp.77, label %if.then, label %if.else
if.then:
  %rcc.tmp.79 = load i32, ptr %determinant
  %rcc.tmp.80 = load i32, ptr %col
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %cofactor
  %rcc.tmp.85 = mul i32 %rcc.tmp.83, %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.79, %rcc.tmp.85
  store i32 %rcc.tmp.86, ptr %determinant
  br label %if.merge
if.else:
  %rcc.tmp.89 = load i32, ptr %determinant
  %rcc.tmp.90 = load i32, ptr %col
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %cofactor
  %rcc.tmp.95 = mul i32 %rcc.tmp.93, %rcc.tmp.94
  %rcc.tmp.96 = sub i32 %rcc.tmp.89, %rcc.tmp.95
  store i32 %rcc.tmp.96, ptr %determinant
  br label %if.merge
if.merge:
  %rcc.tmp.99 = load i32, ptr %col
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %col
  br label %while.cond
while.end:
  %rcc.tmp.103 = load i32, ptr %determinant
  ret i32 %rcc.tmp.103
}
define i32 @calculateCofactor4x4.([16 x i32]* %matrix.tmp, i32 %exclude_row.tmp, i32 %exclude_col.tmp) {
entry:
  %matrix..local = alloca [16 x i32] 
  %exclude_row..tmp = alloca i32 
  %exclude_col..tmp = alloca i32 
  %minor_matrix = alloca [9 x i32] 
  %minor_index = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %rcc.tmp.1 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  store i32 %exclude_row.tmp, ptr %exclude_row..tmp
  store i32 %exclude_col.tmp, ptr %exclude_col..tmp
  %rcc.tmp.67 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.83
  store i32 0, ptr %minor_index
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.88 = load i32, ptr %row
  %rcc.tmp.89 = icmp slt i32 %rcc.tmp.88, 4
  br i1 %rcc.tmp.89, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.92 = load i32, ptr %row
  %rcc.tmp.93 = load i32, ptr %exclude_row..tmp
  %rcc.tmp.94 = icmp ne i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %if.then, label %if.else
if.then:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.98 = load i32, ptr %col
  %rcc.tmp.99 = icmp slt i32 %rcc.tmp.98, 4
  br i1 %rcc.tmp.99, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.102 = load i32, ptr %col
  %rcc.tmp.103 = load i32, ptr %exclude_col..tmp
  %rcc.tmp.104 = icmp ne i32 %rcc.tmp.102, %rcc.tmp.103
  br i1 %rcc.tmp.104, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.106 = load i32, ptr %minor_index
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [9 x i32], ptr %minor_matrix, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %row
  %rcc.tmp.110 = mul i32 %rcc.tmp.109, 4
  %rcc.tmp.111 = load i32, ptr %col
  %rcc.tmp.112 = add i32 %rcc.tmp.110, %rcc.tmp.111
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  store i32 %rcc.tmp.115, ptr %rcc.tmp.108
  %rcc.tmp.117 = load i32, ptr %minor_index
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %minor_index
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.122 = load i32, ptr %col
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %col
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.128 = load i32, ptr %row
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  store i32 %rcc.tmp.129, ptr %row
  br label %while.cond
while.end:
  %rcc.tmp.132 = call i32 @calculateDeterminant3x3.([9 x i32]* %minor_matrix)
  ret i32 %rcc.tmp.132
}
define i32 @calculateDeterminant3x3.([9 x i32]* %matrix.tmp) {
entry:
  %matrix..local = alloca [9 x i32] 
  %term1 = alloca i32 
  %term2 = alloca i32 
  %term3 = alloca i32 
  %rcc.tmp.1 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = mul i32 %rcc.tmp.40, %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = mul i32 %rcc.tmp.45, %rcc.tmp.47
  %rcc.tmp.49 = sub i32 %rcc.tmp.43, %rcc.tmp.48
  %rcc.tmp.50 = mul i32 %rcc.tmp.38, %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %term1
  %rcc.tmp.52 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = mul i32 %rcc.tmp.55, %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = mul i32 %rcc.tmp.60, %rcc.tmp.62
  %rcc.tmp.64 = sub i32 %rcc.tmp.58, %rcc.tmp.63
  %rcc.tmp.65 = mul i32 %rcc.tmp.53, %rcc.tmp.64
  store i32 %rcc.tmp.65, ptr %term2
  %rcc.tmp.67 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = mul i32 %rcc.tmp.70, %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = mul i32 %rcc.tmp.75, %rcc.tmp.77
  %rcc.tmp.79 = sub i32 %rcc.tmp.73, %rcc.tmp.78
  %rcc.tmp.80 = mul i32 %rcc.tmp.68, %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %term3
  %rcc.tmp.82 = load i32, ptr %term1
  %rcc.tmp.83 = load i32, ptr %term2
  %rcc.tmp.84 = sub i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %term3
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  ret i32 %rcc.tmp.86
}
define void @performAdvancedMatrixAlgorithms.() {
entry:
  %base_matrix = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %matrix_size = alloca i32 
  %power_result = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %power_sum = alloca i32 
  %rotation_matrix = alloca [64 x i32] 
  %fill.idx.3 = alloca i32 
  %rotation_sum = alloca i32 
  %diagonal_sum = alloca i32 
  %trace = alloca i32 
  %norm = alloca i32 
  call void @printlnInt.(i32 1710)
  call void @printlnInt.(i32 1711)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [100 x i32], ptr %base_matrix, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 10, ptr %matrix_size
  %rcc.tmp.15 = load i32, ptr %matrix_size
  call void @initializeMatrixForPower.([100 x i32]* %base_matrix, i32 %rcc.tmp.15)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 100
  br i1 %rcc.tmp.20, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.22 = load i32, ptr %fill.idx.2
  %rcc.tmp.23 = getelementptr [100 x i32], ptr %power_result, i32 0, i32 %rcc.tmp.22
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.25, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.28 = load i32, ptr %matrix_size
  call void @matrixPower.([100 x i32]* %base_matrix, [100 x i32]* %power_result, i32 %rcc.tmp.28, i32 3)
  %rcc.tmp.30 = load i32, ptr %matrix_size
  %rcc.tmp.31 = call i32 @calculateMatrixSum100.([100 x i32]* %power_result, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %power_sum
  %rcc.tmp.33 = load i32, ptr %power_sum
  call void @printlnInt.(i32 %rcc.tmp.33)
  call void @printlnInt.(i32 1712)
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.38 = load i32, ptr %fill.idx.3
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 64
  br i1 %rcc.tmp.39, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.41 = load i32, ptr %fill.idx.3
  %rcc.tmp.42 = getelementptr [64 x i32], ptr %rotation_matrix, i32 0, i32 %rcc.tmp.41
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.44, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @initializeRotationMatrix.([64 x i32]* %rotation_matrix)
  call void @rotateMatrix90Degrees.([64 x i32]* %rotation_matrix, i32 8)
  %rcc.tmp.49 = call i32 @calculateMatrixSum64.([64 x i32]* %rotation_matrix)
  store i32 %rcc.tmp.49, ptr %rotation_sum
  %rcc.tmp.51 = load i32, ptr %rotation_sum
  call void @printlnInt.(i32 %rcc.tmp.51)
  call void @printlnInt.(i32 1713)
  %rcc.tmp.54 = load i32, ptr %matrix_size
  %rcc.tmp.55 = call i32 @calculateDiagonalSums.([100 x i32]* %base_matrix, i32 %rcc.tmp.54)
  store i32 %rcc.tmp.55, ptr %diagonal_sum
  %rcc.tmp.57 = load i32, ptr %diagonal_sum
  call void @printlnInt.(i32 %rcc.tmp.57)
  call void @printlnInt.(i32 1714)
  %rcc.tmp.60 = load i32, ptr %matrix_size
  %rcc.tmp.61 = call i32 @calculateMatrixTrace.([100 x i32]* %base_matrix, i32 %rcc.tmp.60)
  store i32 %rcc.tmp.61, ptr %trace
  %rcc.tmp.63 = load i32, ptr %matrix_size
  %rcc.tmp.64 = call i32 @calculateMatrixNorm.([100 x i32]* %base_matrix, i32 %rcc.tmp.63)
  store i32 %rcc.tmp.64, ptr %norm
  %rcc.tmp.66 = load i32, ptr %trace
  %rcc.tmp.67 = load i32, ptr %norm
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  call void @printlnInt.(i32 %rcc.tmp.68)
  ret void
}
define void @initializeMatrixForPower.([100 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %index = alloca i32 
  store [100 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %row
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %col
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %row
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %col
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %index
  %rcc.tmp.23 = load i32, ptr %row
  %rcc.tmp.24 = load i32, ptr %col
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %index
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.30 = getelementptr [100 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  store i32 2, ptr %rcc.tmp.30
  br label %if.merge
if.else:
  %rcc.tmp.33 = load i32, ptr %row
  %rcc.tmp.34 = load i32, ptr %col
  %rcc.tmp.35 = sub i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = call i32 @absValue.(i32 %rcc.tmp.35)
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.36, 1
  br i1 %rcc.tmp.37, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.39 = load i32, ptr %index
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  store i32 1, ptr %rcc.tmp.42
  br label %if.merge.2
if.else.2:
  %rcc.tmp.45 = load i32, ptr %index
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.48 = getelementptr [100 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  store i32 0, ptr %rcc.tmp.48
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.52 = load i32, ptr %col
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.56 = load i32, ptr %row
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %row
  br label %while.cond
while.end:
  ret void
}
define void @matrixPower.([100 x i32]* %base.tmp, [100 x i32]* %result.tmp, i32 %size.tmp, i32 %power.tmp) {
entry:
  %base..tmp = alloca [100 x i32]* 
  %result..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %power..tmp = alloca i32 
  %temp_matrix = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %current_power = alloca i32 
  store [100 x i32]* %base.tmp, ptr %base..tmp
  store [100 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %power.tmp, ptr %power..tmp
  %rcc.tmp.5 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.6 = load i32, ptr %size..tmp
  call void @initializeIdentityMatrix.([100 x i32]* %rcc.tmp.5, i32 %rcc.tmp.6)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 100
  br i1 %rcc.tmp.11, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.13 = load i32, ptr %fill.idx
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %temp_matrix, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %current_power
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %current_power
  %rcc.tmp.22 = load i32, ptr %power..tmp
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.27 = load [100 x i32]*, ptr %base..tmp
  %rcc.tmp.28 = load i32, ptr %size..tmp
  call void @matrixMultiplication100.([100 x i32]* %rcc.tmp.26, [100 x i32]* %rcc.tmp.27, [100 x i32]* %temp_matrix, i32 %rcc.tmp.28)
  %rcc.tmp.30 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.31 = load i32, ptr %size..tmp
  call void @copyMatrix100.([100 x i32]* %temp_matrix, [100 x i32]* %rcc.tmp.30, i32 %rcc.tmp.31)
  %rcc.tmp.33 = load i32, ptr %current_power
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %current_power
  br label %while.cond
while.end:
  ret void
}
define void @initializeIdentityMatrix.([100 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %diag = alloca i32 
  store [100 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %diag
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %diag
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.28 = load i32, ptr %diag
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = mul i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %diag
  %rcc.tmp.32 = add i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  store i32 1, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %diag
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %diag
  br label %while.cond.2
while.end.2:
  ret void
}
define void @matrixMultiplication100.([100 x i32]* %matrix_a.tmp, [100 x i32]* %matrix_b.tmp, [100 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [100 x i32]* 
  %matrix_b..tmp = alloca [100 x i32]* 
  %result..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store [100 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [100 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [100 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
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
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.26 = getelementptr [100 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.26
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
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = mul i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = mul i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %j
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.50 = getelementptr [100 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = mul i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %k
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [100 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.59 = getelementptr [100 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %k
  %rcc.tmp.62 = load i32, ptr %size..tmp
  %rcc.tmp.63 = mul i32 %rcc.tmp.61, %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [100 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.68 = getelementptr [100 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = mul i32 %rcc.tmp.60, %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.51, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %rcc.tmp.42
  %rcc.tmp.73 = load i32, ptr %k
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @copyMatrix100.([100 x i32]* %source.tmp, [100 x i32]* %dest.tmp, i32 %size.tmp) {
entry:
  %source..tmp = alloca [100 x i32]* 
  %dest..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %source.tmp, ptr %source..tmp
  store [100 x i32]* %dest.tmp, ptr %dest..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [100 x i32]*, ptr %dest..tmp
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [100 x i32]*, ptr %source..tmp
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.16
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateMatrixSum100.([100 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %sum
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.17 = getelementptr [100 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.13, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %sum
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load i32, ptr %sum
  %rcc.tmp.26 = srem i32 %rcc.tmp.25, 100000
  ret i32 %rcc.tmp.26
}
define void @initializeRotationMatrix.([64 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [64 x i32]* 
  %i = alloca i32 
  %j = alloca i32 
  store [64 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 8
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.10 = load i32, ptr %j
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 8
  br i1 %rcc.tmp.11, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 8
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [64 x i32]*, ptr %matrix..tmp
  %rcc.tmp.20 = getelementptr [64 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 10
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = add i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
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
define void @rotateMatrix90Degrees.([64 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [64 x i32]* 
  %size..tmp = alloca i32 
  %temp_matrix = alloca [64 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %old_index = alloca i32 
  %new_index = alloca i32 
  store [64 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 64
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [64 x i32], ptr %temp_matrix, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [64 x i32], ptr %temp_matrix, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [64 x i32]*, ptr %matrix..tmp
  %rcc.tmp.29 = getelementptr [64 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %rcc.tmp.25
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %size..tmp
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = load i32, ptr %size..tmp
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.45, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = load i32, ptr %size..tmp
  %rcc.tmp.52 = mul i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %old_index
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = load i32, ptr %size..tmp
  %rcc.tmp.58 = mul i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %size..tmp
  %rcc.tmp.60 = sub i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = sub i32 %rcc.tmp.60, %rcc.tmp.61
  %rcc.tmp.63 = add i32 %rcc.tmp.58, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %new_index
  %rcc.tmp.65 = load i32, ptr %new_index
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [64 x i32]*, ptr %matrix..tmp
  %rcc.tmp.68 = getelementptr [64 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %old_index
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [64 x i32], ptr %temp_matrix, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.68
  %rcc.tmp.74 = load i32, ptr %j
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @calculateMatrixSum64.([64 x i32]* %matrix.tmp) {
entry:
  %matrix..local = alloca [64 x i32] 
  %sum = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  %rcc.tmp.121 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 30
  %rcc.tmp.122 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 30
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.123, ptr %rcc.tmp.122
  %rcc.tmp.125 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 31
  %rcc.tmp.126 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 31
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.127, ptr %rcc.tmp.126
  %rcc.tmp.129 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 32
  %rcc.tmp.130 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 32
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.131, ptr %rcc.tmp.130
  %rcc.tmp.133 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 33
  %rcc.tmp.134 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 33
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.135, ptr %rcc.tmp.134
  %rcc.tmp.137 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 34
  %rcc.tmp.138 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 34
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.137
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 35
  %rcc.tmp.142 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 35
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  %rcc.tmp.145 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 36
  %rcc.tmp.146 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 36
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  %rcc.tmp.149 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 37
  %rcc.tmp.150 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 37
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 38
  %rcc.tmp.154 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 38
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.155, ptr %rcc.tmp.154
  %rcc.tmp.157 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 39
  %rcc.tmp.158 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 39
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 40
  %rcc.tmp.162 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 40
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 41
  %rcc.tmp.166 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 41
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 42
  %rcc.tmp.170 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 42
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.169
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 43
  %rcc.tmp.174 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 43
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.173
  store i32 %rcc.tmp.175, ptr %rcc.tmp.174
  %rcc.tmp.177 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 44
  %rcc.tmp.178 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 44
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.177
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 45
  %rcc.tmp.182 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 45
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.181
  store i32 %rcc.tmp.183, ptr %rcc.tmp.182
  %rcc.tmp.185 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 46
  %rcc.tmp.186 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 46
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.187, ptr %rcc.tmp.186
  %rcc.tmp.189 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 47
  %rcc.tmp.190 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 47
  %rcc.tmp.191 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.191, ptr %rcc.tmp.190
  %rcc.tmp.193 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 48
  %rcc.tmp.194 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 48
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.195, ptr %rcc.tmp.194
  %rcc.tmp.197 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 49
  %rcc.tmp.198 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 49
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.197
  store i32 %rcc.tmp.199, ptr %rcc.tmp.198
  %rcc.tmp.201 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 50
  %rcc.tmp.202 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 50
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.201
  store i32 %rcc.tmp.203, ptr %rcc.tmp.202
  %rcc.tmp.205 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 51
  %rcc.tmp.206 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 51
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.205
  store i32 %rcc.tmp.207, ptr %rcc.tmp.206
  %rcc.tmp.209 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 52
  %rcc.tmp.210 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 52
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.209
  store i32 %rcc.tmp.211, ptr %rcc.tmp.210
  %rcc.tmp.213 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 53
  %rcc.tmp.214 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 53
  %rcc.tmp.215 = load i32, ptr %rcc.tmp.213
  store i32 %rcc.tmp.215, ptr %rcc.tmp.214
  %rcc.tmp.217 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 54
  %rcc.tmp.218 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 54
  %rcc.tmp.219 = load i32, ptr %rcc.tmp.217
  store i32 %rcc.tmp.219, ptr %rcc.tmp.218
  %rcc.tmp.221 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 55
  %rcc.tmp.222 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 55
  %rcc.tmp.223 = load i32, ptr %rcc.tmp.221
  store i32 %rcc.tmp.223, ptr %rcc.tmp.222
  %rcc.tmp.225 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 56
  %rcc.tmp.226 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 56
  %rcc.tmp.227 = load i32, ptr %rcc.tmp.225
  store i32 %rcc.tmp.227, ptr %rcc.tmp.226
  %rcc.tmp.229 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 57
  %rcc.tmp.230 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 57
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.229
  store i32 %rcc.tmp.231, ptr %rcc.tmp.230
  %rcc.tmp.233 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 58
  %rcc.tmp.234 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 58
  %rcc.tmp.235 = load i32, ptr %rcc.tmp.233
  store i32 %rcc.tmp.235, ptr %rcc.tmp.234
  %rcc.tmp.237 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 59
  %rcc.tmp.238 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 59
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.237
  store i32 %rcc.tmp.239, ptr %rcc.tmp.238
  %rcc.tmp.241 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 60
  %rcc.tmp.242 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 60
  %rcc.tmp.243 = load i32, ptr %rcc.tmp.241
  store i32 %rcc.tmp.243, ptr %rcc.tmp.242
  %rcc.tmp.245 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 61
  %rcc.tmp.246 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 61
  %rcc.tmp.247 = load i32, ptr %rcc.tmp.245
  store i32 %rcc.tmp.247, ptr %rcc.tmp.246
  %rcc.tmp.249 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 62
  %rcc.tmp.250 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 62
  %rcc.tmp.251 = load i32, ptr %rcc.tmp.249
  store i32 %rcc.tmp.251, ptr %rcc.tmp.250
  %rcc.tmp.253 = getelementptr [64 x i32], ptr %matrix.tmp, i32 0, i32 63
  %rcc.tmp.254 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 63
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.253
  store i32 %rcc.tmp.255, ptr %rcc.tmp.254
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.260 = load i32, ptr %i
  %rcc.tmp.261 = icmp slt i32 %rcc.tmp.260, 64
  br i1 %rcc.tmp.261, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.264 = load i32, ptr %sum
  %rcc.tmp.265 = load i32, ptr %i
  %rcc.tmp.266 = add i32 %rcc.tmp.265, 0
  %rcc.tmp.267 = getelementptr [64 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.266
  %rcc.tmp.268 = load i32, ptr %rcc.tmp.267
  %rcc.tmp.269 = add i32 %rcc.tmp.264, %rcc.tmp.268
  store i32 %rcc.tmp.269, ptr %sum
  %rcc.tmp.271 = load i32, ptr %i
  %rcc.tmp.272 = add i32 %rcc.tmp.271, 1
  store i32 %rcc.tmp.272, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.275 = load i32, ptr %sum
  %rcc.tmp.276 = srem i32 %rcc.tmp.275, 100000
  ret i32 %rcc.tmp.276
}
define i32 @calculateDiagonalSums.([100 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %main_diagonal_sum = alloca i32 
  %anti_diagonal_sum = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %main_diagonal_sum
  store i32 0, ptr %anti_diagonal_sum
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
  %rcc.tmp.12 = load i32, ptr %main_diagonal_sum
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = mul i32 %rcc.tmp.13, %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.12, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %main_diagonal_sum
  %rcc.tmp.24 = load i32, ptr %anti_diagonal_sum
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = load i32, ptr %size..tmp
  %rcc.tmp.27 = mul i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %size..tmp
  %rcc.tmp.29 = sub i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = sub i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.27, %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.24, %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %anti_diagonal_sum
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.43 = load i32, ptr %main_diagonal_sum
  %rcc.tmp.44 = load i32, ptr %anti_diagonal_sum
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  ret i32 %rcc.tmp.45
}
define i32 @calculateMatrixTrace.([100 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %trace = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %trace
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
  %rcc.tmp.11 = load i32, ptr %trace
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = mul i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.11, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %trace
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.27 = load i32, ptr %trace
  ret i32 %rcc.tmp.27
}
define i32 @calculateMatrixNorm.([100 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %norm_squared = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %norm_squared
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %norm_squared
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.17 = getelementptr [100 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [100 x i32]*, ptr %matrix..tmp
  %rcc.tmp.22 = getelementptr [100 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = mul i32 %rcc.tmp.18, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.13, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %norm_squared
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.31 = load i32, ptr %norm_squared
  %rcc.tmp.32 = call i32 @approximateSquareRoot.(i32 %rcc.tmp.31)
  ret i32 %rcc.tmp.32
}
define i32 @approximateSquareRoot.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %result = alloca i32 
  %mid = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 1
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %value..tmp
  ret i32 %rcc.tmp.5
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %left
  %rcc.tmp.9 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.9, ptr %right
  store i32 1, ptr %result
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %left
  %rcc.tmp.14 = load i32, ptr %right
  %rcc.tmp.15 = icmp sle i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %left
  %rcc.tmp.19 = load i32, ptr %right
  %rcc.tmp.20 = load i32, ptr %left
  %rcc.tmp.21 = sub i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = sdiv i32 %rcc.tmp.21, 2
  %rcc.tmp.23 = add i32 %rcc.tmp.18, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %mid
  %rcc.tmp.25 = load i32, ptr %mid
  %rcc.tmp.26 = load i32, ptr %value..tmp
  %rcc.tmp.27 = load i32, ptr %mid
  %rcc.tmp.28 = sdiv i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = icmp sle i32 %rcc.tmp.25, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.31 = load i32, ptr %mid
  store i32 %rcc.tmp.31, ptr %result
  %rcc.tmp.33 = load i32, ptr %mid
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %left
  br label %if.merge.2
if.else.2:
  %rcc.tmp.37 = load i32, ptr %mid
  %rcc.tmp.38 = sub i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %right
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.42 = load i32, ptr %result
  ret i32 %rcc.tmp.42
}
define i32 @absValue.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = icmp slt i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %value..tmp
  %rcc.tmp.6 = sub i32 0, %rcc.tmp.5
  ret i32 %rcc.tmp.6
if.else:
  %rcc.tmp.8 = load i32, ptr %value..tmp
  ret i32 %rcc.tmp.8
if.merge:
  ret i32 undef
}
define void @performSparseMatrixOperations.() {
entry:
  %sparse_rows = alloca [200 x i32] 
  %fill.idx = alloca i32 
  %sparse_cols = alloca [200 x i32] 
  %fill.idx.2 = alloca i32 
  %sparse_values = alloca [200 x i32] 
  %fill.idx.3 = alloca i32 
  %sparse_count = alloca i32 
  %sparse2_rows = alloca [200 x i32] 
  %fill.idx.4 = alloca i32 
  %sparse2_cols = alloca [200 x i32] 
  %fill.idx.5 = alloca i32 
  %sparse2_values = alloca [200 x i32] 
  %fill.idx.6 = alloca i32 
  %sparse2_count = alloca i32 
  %result_rows = alloca [400 x i32] 
  %fill.idx.7 = alloca i32 
  %result_cols = alloca [400 x i32] 
  %fill.idx.8 = alloca i32 
  %result_values = alloca [400 x i32] 
  %fill.idx.9 = alloca i32 
  %result_count = alloca i32 
  %transpose_rows = alloca [200 x i32] 
  %fill.idx.10 = alloca i32 
  %transpose_cols = alloca [200 x i32] 
  %fill.idx.11 = alloca i32 
  %transpose_values = alloca [200 x i32] 
  %fill.idx.12 = alloca i32 
  %transpose_sum = alloca i32 
  %mult_result = alloca i32 
  call void @printlnInt.(i32 1720)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 200
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [200 x i32], ptr %sparse_rows, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 200
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %sparse_cols, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 200
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %sparse_values, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %sparse_count
  %rcc.tmp.36 = call i32 @createSparseMatrix.([200 x i32]* %sparse_rows, [200 x i32]* %sparse_cols, [200 x i32]* %sparse_values)
  store i32 %rcc.tmp.36, ptr %sparse_count
  %rcc.tmp.38 = load i32, ptr %sparse_count
  call void @printlnInt.(i32 %rcc.tmp.38)
  call void @printlnInt.(i32 1721)
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.43 = load i32, ptr %fill.idx.4
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.43, 200
  br i1 %rcc.tmp.44, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.46 = load i32, ptr %fill.idx.4
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %sparse2_rows, i32 0, i32 %rcc.tmp.46
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.49, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.54 = load i32, ptr %fill.idx.5
  %rcc.tmp.55 = icmp slt i32 %rcc.tmp.54, 200
  br i1 %rcc.tmp.55, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.57 = load i32, ptr %fill.idx.5
  %rcc.tmp.58 = getelementptr [200 x i32], ptr %sparse2_cols, i32 0, i32 %rcc.tmp.57
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.60, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.65 = load i32, ptr %fill.idx.6
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.65, 200
  br i1 %rcc.tmp.66, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.68 = load i32, ptr %fill.idx.6
  %rcc.tmp.69 = getelementptr [200 x i32], ptr %sparse2_values, i32 0, i32 %rcc.tmp.68
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.71, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.74 = call i32 @createSparseMatrix2.([200 x i32]* %sparse2_rows, [200 x i32]* %sparse2_cols, [200 x i32]* %sparse2_values)
  store i32 %rcc.tmp.74, ptr %sparse2_count
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.78 = load i32, ptr %fill.idx.7
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.78, 400
  br i1 %rcc.tmp.79, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.81 = load i32, ptr %fill.idx.7
  %rcc.tmp.82 = getelementptr [400 x i32], ptr %result_rows, i32 0, i32 %rcc.tmp.81
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.84, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.89 = load i32, ptr %fill.idx.8
  %rcc.tmp.90 = icmp slt i32 %rcc.tmp.89, 400
  br i1 %rcc.tmp.90, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.92 = load i32, ptr %fill.idx.8
  %rcc.tmp.93 = getelementptr [400 x i32], ptr %result_cols, i32 0, i32 %rcc.tmp.92
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.95, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.100 = load i32, ptr %fill.idx.9
  %rcc.tmp.101 = icmp slt i32 %rcc.tmp.100, 400
  br i1 %rcc.tmp.101, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.103 = load i32, ptr %fill.idx.9
  %rcc.tmp.104 = getelementptr [400 x i32], ptr %result_values, i32 0, i32 %rcc.tmp.103
  store i32 0, ptr %rcc.tmp.104
  %rcc.tmp.106 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.106, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  %rcc.tmp.109 = load i32, ptr %sparse_count
  %rcc.tmp.110 = load i32, ptr %sparse2_count
  %rcc.tmp.111 = call i32 @sparseMatrixAddition.([200 x i32]* %sparse_rows, [200 x i32]* %sparse_cols, [200 x i32]* %sparse_values, i32 %rcc.tmp.109, [200 x i32]* %sparse2_rows, [200 x i32]* %sparse2_cols, [200 x i32]* %sparse2_values, i32 %rcc.tmp.110, [400 x i32]* %result_rows, [400 x i32]* %result_cols, [400 x i32]* %result_values)
  store i32 %rcc.tmp.111, ptr %result_count
  %rcc.tmp.113 = load i32, ptr %result_count
  call void @printlnInt.(i32 %rcc.tmp.113)
  call void @printlnInt.(i32 1722)
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.118 = load i32, ptr %fill.idx.10
  %rcc.tmp.119 = icmp slt i32 %rcc.tmp.118, 200
  br i1 %rcc.tmp.119, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.121 = load i32, ptr %fill.idx.10
  %rcc.tmp.122 = getelementptr [200 x i32], ptr %transpose_rows, i32 0, i32 %rcc.tmp.121
  store i32 0, ptr %rcc.tmp.122
  %rcc.tmp.124 = add i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.124, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.129 = load i32, ptr %fill.idx.11
  %rcc.tmp.130 = icmp slt i32 %rcc.tmp.129, 200
  br i1 %rcc.tmp.130, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.132 = load i32, ptr %fill.idx.11
  %rcc.tmp.133 = getelementptr [200 x i32], ptr %transpose_cols, i32 0, i32 %rcc.tmp.132
  store i32 0, ptr %rcc.tmp.133
  %rcc.tmp.135 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.135, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.140 = load i32, ptr %fill.idx.12
  %rcc.tmp.141 = icmp slt i32 %rcc.tmp.140, 200
  br i1 %rcc.tmp.141, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.143 = load i32, ptr %fill.idx.12
  %rcc.tmp.144 = getelementptr [200 x i32], ptr %transpose_values, i32 0, i32 %rcc.tmp.143
  store i32 0, ptr %rcc.tmp.144
  %rcc.tmp.146 = add i32 %rcc.tmp.143, 1
  store i32 %rcc.tmp.146, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  %rcc.tmp.149 = load i32, ptr %sparse_count
  call void @sparseMatrixTranspose.([200 x i32]* %sparse_rows, [200 x i32]* %sparse_cols, [200 x i32]* %sparse_values, i32 %rcc.tmp.149, [200 x i32]* %transpose_rows, [200 x i32]* %transpose_cols, [200 x i32]* %transpose_values)
  %rcc.tmp.151 = load i32, ptr %sparse_count
  %rcc.tmp.152 = call i32 @calculateSparseSum.([200 x i32]* %transpose_values, i32 %rcc.tmp.151)
  store i32 %rcc.tmp.152, ptr %transpose_sum
  %rcc.tmp.154 = load i32, ptr %transpose_sum
  call void @printlnInt.(i32 %rcc.tmp.154)
  call void @printlnInt.(i32 1723)
  %rcc.tmp.157 = load i32, ptr %sparse_count
  %rcc.tmp.158 = load i32, ptr %sparse_count
  %rcc.tmp.159 = call i32 @sparseMatrixMultiplication.([200 x i32]* %sparse_rows, [200 x i32]* %sparse_cols, [200 x i32]* %sparse_values, i32 %rcc.tmp.157, [200 x i32]* %transpose_rows, [200 x i32]* %transpose_cols, [200 x i32]* %transpose_values, i32 %rcc.tmp.158)
  store i32 %rcc.tmp.159, ptr %mult_result
  %rcc.tmp.161 = load i32, ptr %mult_result
  call void @printlnInt.(i32 %rcc.tmp.161)
  ret void
}
define i32 @createSparseMatrix.([200 x i32]* %rows.tmp, [200 x i32]* %cols.tmp, [200 x i32]* %values.tmp) {
entry:
  %rows..tmp = alloca [200 x i32]* 
  %cols..tmp = alloca [200 x i32]* 
  %values..tmp = alloca [200 x i32]* 
  %count = alloca i32 
  %matrix_size = alloca i32 
  %i = alloca i32 
  store [200 x i32]* %rows.tmp, ptr %rows..tmp
  store [200 x i32]* %cols.tmp, ptr %cols..tmp
  store [200 x i32]* %values.tmp, ptr %values..tmp
  store i32 0, ptr %count
  store i32 30, ptr %matrix_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %matrix_size
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.12 = load i32, ptr %count
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.15 = phi i1 [0, %while.cond], [%rcc.tmp.13, %and.rhs]
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %count
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [200 x i32]*, ptr %rows..tmp
  %rcc.tmp.21 = getelementptr [200 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %i
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %count
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [200 x i32]*, ptr %cols..tmp
  %rcc.tmp.27 = getelementptr [200 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %i
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %count
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.33 = getelementptr [200 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 10
  store i32 %rcc.tmp.35, ptr %rcc.tmp.33
  %rcc.tmp.37 = load i32, ptr %count
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %count
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = load i32, ptr %matrix_size
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.45 = load i32, ptr %count
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 200
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.48 = phi i1 [0, %while.body], [%rcc.tmp.46, %and.rhs.2]
  br i1 %rcc.tmp.48, label %if.then, label %if.else
if.then:
  %rcc.tmp.50 = load i32, ptr %count
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [200 x i32]*, ptr %rows..tmp
  %rcc.tmp.53 = getelementptr [200 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %i
  store i32 %rcc.tmp.54, ptr %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %count
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %cols..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %rcc.tmp.59
  %rcc.tmp.63 = load i32, ptr %count
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.66 = getelementptr [200 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 5
  store i32 %rcc.tmp.68, ptr %rcc.tmp.66
  %rcc.tmp.70 = load i32, ptr %count
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = srem i32 %rcc.tmp.75, 3
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 0
  br i1 %rcc.tmp.77, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 5
  %rcc.tmp.81 = load i32, ptr %matrix_size
  %rcc.tmp.82 = icmp slt i32 %rcc.tmp.80, %rcc.tmp.81
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.84 = phi i1 [0, %if.merge], [%rcc.tmp.82, %and.rhs.3]
  br i1 %rcc.tmp.84, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.86 = load i32, ptr %count
  %rcc.tmp.87 = icmp slt i32 %rcc.tmp.86, 200
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.89 = phi i1 [0, %sc.merge.3], [%rcc.tmp.87, %and.rhs.4]
  br i1 %rcc.tmp.89, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.91 = load i32, ptr %count
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = load [200 x i32]*, ptr %rows..tmp
  %rcc.tmp.94 = getelementptr [200 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.95 = load i32, ptr %i
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = load i32, ptr %count
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = load [200 x i32]*, ptr %cols..tmp
  %rcc.tmp.100 = getelementptr [200 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 5
  store i32 %rcc.tmp.102, ptr %rcc.tmp.100
  %rcc.tmp.104 = load i32, ptr %count
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.107 = getelementptr [200 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = mul i32 %rcc.tmp.108, 2
  store i32 %rcc.tmp.109, ptr %rcc.tmp.107
  %rcc.tmp.111 = load i32, ptr %count
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.112, ptr %count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  store i32 %rcc.tmp.117, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.120 = load i32, ptr %count
  ret i32 %rcc.tmp.120
}
define i32 @createSparseMatrix2.([200 x i32]* %rows.tmp, [200 x i32]* %cols.tmp, [200 x i32]* %values.tmp) {
entry:
  %rows..tmp = alloca [200 x i32]* 
  %cols..tmp = alloca [200 x i32]* 
  %values..tmp = alloca [200 x i32]* 
  %count = alloca i32 
  %matrix_size = alloca i32 
  %i = alloca i32 
  store [200 x i32]* %rows.tmp, ptr %rows..tmp
  store [200 x i32]* %cols.tmp, ptr %cols..tmp
  store [200 x i32]* %values.tmp, ptr %values..tmp
  store i32 0, ptr %count
  store i32 30, ptr %matrix_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %matrix_size
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.12 = load i32, ptr %count
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.15 = phi i1 [0, %while.cond], [%rcc.tmp.13, %and.rhs]
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %matrix_size
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.24 = load i32, ptr %count
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 200
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.27 = phi i1 [0, %while.body], [%rcc.tmp.25, %and.rhs.2]
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %count
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %rows..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %i
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %count
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %cols..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %matrix_size
  %rcc.tmp.40 = sub i32 %rcc.tmp.39, 1
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = sub i32 %rcc.tmp.40, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %rcc.tmp.38
  %rcc.tmp.44 = load i32, ptr %count
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 3
  store i32 %rcc.tmp.49, ptr %rcc.tmp.47
  %rcc.tmp.51 = load i32, ptr %count
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 4
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.57, 0
  br i1 %rcc.tmp.58, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.60 = load i32, ptr %count
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.60, 200
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.63 = phi i1 [0, %if.merge], [%rcc.tmp.61, %and.rhs.3]
  br i1 %rcc.tmp.63, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.65 = load i32, ptr %count
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [200 x i32]*, ptr %rows..tmp
  %rcc.tmp.68 = getelementptr [200 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %i
  store i32 %rcc.tmp.69, ptr %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %count
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [200 x i32]*, ptr %cols..tmp
  %rcc.tmp.74 = getelementptr [200 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = sdiv i32 %rcc.tmp.75, 2
  store i32 %rcc.tmp.76, ptr %rcc.tmp.74
  %rcc.tmp.78 = load i32, ptr %count
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.81 = getelementptr [200 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = mul i32 %rcc.tmp.82, 3
  store i32 %rcc.tmp.83, ptr %rcc.tmp.81
  %rcc.tmp.85 = load i32, ptr %count
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.94 = load i32, ptr %count
  ret i32 %rcc.tmp.94
}
define i32 @sparseMatrixAddition.([200 x i32]* %rows1.tmp, [200 x i32]* %cols1.tmp, [200 x i32]* %values1.tmp, i32 %count1.tmp, [200 x i32]* %rows2.tmp, [200 x i32]* %cols2.tmp, [200 x i32]* %values2.tmp, i32 %count2.tmp, [400 x i32]* %result_rows.tmp, [400 x i32]* %result_cols.tmp, [400 x i32]* %result_values.tmp) {
entry:
  %rows1..tmp = alloca [200 x i32]* 
  %cols1..tmp = alloca [200 x i32]* 
  %values1..tmp = alloca [200 x i32]* 
  %count1..tmp = alloca i32 
  %rows2..tmp = alloca [200 x i32]* 
  %cols2..tmp = alloca [200 x i32]* 
  %values2..tmp = alloca [200 x i32]* 
  %count2..tmp = alloca i32 
  %result_rows..tmp = alloca [400 x i32]* 
  %result_cols..tmp = alloca [400 x i32]* 
  %result_values..tmp = alloca [400 x i32]* 
  %result_count = alloca i32 
  %i1 = alloca i32 
  %i2 = alloca i32 
  %pos1 = alloca i32 
  %pos2 = alloca i32 
  store [200 x i32]* %rows1.tmp, ptr %rows1..tmp
  store [200 x i32]* %cols1.tmp, ptr %cols1..tmp
  store [200 x i32]* %values1.tmp, ptr %values1..tmp
  store i32 %count1.tmp, ptr %count1..tmp
  store [200 x i32]* %rows2.tmp, ptr %rows2..tmp
  store [200 x i32]* %cols2.tmp, ptr %cols2..tmp
  store [200 x i32]* %values2.tmp, ptr %values2..tmp
  store i32 %count2.tmp, ptr %count2..tmp
  store [400 x i32]* %result_rows.tmp, ptr %result_rows..tmp
  store [400 x i32]* %result_cols.tmp, ptr %result_cols..tmp
  store [400 x i32]* %result_values.tmp, ptr %result_values..tmp
  store i32 0, ptr %result_count
  store i32 0, ptr %i1
  store i32 0, ptr %i2
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i1
  %rcc.tmp.17 = load i32, ptr %count1..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.20 = load i32, ptr %i2
  %rcc.tmp.21 = load i32, ptr %count2..tmp
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.20, %rcc.tmp.21
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %while.cond], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.26 = load i32, ptr %result_count
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 400
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.29 = phi i1 [0, %sc.merge], [%rcc.tmp.27, %and.rhs.2]
  br i1 %rcc.tmp.29, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.32 = load i32, ptr %i1
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [200 x i32]*, ptr %rows1..tmp
  %rcc.tmp.35 = getelementptr [200 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = mul i32 %rcc.tmp.36, 100
  %rcc.tmp.38 = load i32, ptr %i1
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [200 x i32]*, ptr %cols1..tmp
  %rcc.tmp.41 = getelementptr [200 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.37, %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %pos1
  %rcc.tmp.45 = load i32, ptr %i2
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [200 x i32]*, ptr %rows2..tmp
  %rcc.tmp.48 = getelementptr [200 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = mul i32 %rcc.tmp.49, 100
  %rcc.tmp.51 = load i32, ptr %i2
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [200 x i32]*, ptr %cols2..tmp
  %rcc.tmp.54 = getelementptr [200 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.50, %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %pos2
  %rcc.tmp.58 = load i32, ptr %pos1
  %rcc.tmp.59 = load i32, ptr %pos2
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %if.then, label %if.else
if.then:
  %rcc.tmp.62 = load i32, ptr %result_count
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [400 x i32]*, ptr %result_rows..tmp
  %rcc.tmp.65 = getelementptr [400 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %i1
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = load [200 x i32]*, ptr %rows1..tmp
  %rcc.tmp.69 = getelementptr [200 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %rcc.tmp.65
  %rcc.tmp.72 = load i32, ptr %result_count
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [400 x i32]*, ptr %result_cols..tmp
  %rcc.tmp.75 = getelementptr [400 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %i1
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = load [200 x i32]*, ptr %cols1..tmp
  %rcc.tmp.79 = getelementptr [200 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %rcc.tmp.75
  %rcc.tmp.82 = load i32, ptr %result_count
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = load [400 x i32]*, ptr %result_values..tmp
  %rcc.tmp.85 = getelementptr [400 x i32], ptr %rcc.tmp.84, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.86 = load i32, ptr %i1
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = load [200 x i32]*, ptr %values1..tmp
  %rcc.tmp.89 = getelementptr [200 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.90, ptr %rcc.tmp.85
  %rcc.tmp.92 = load i32, ptr %result_count
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %result_count
  %rcc.tmp.95 = load i32, ptr %i1
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %i1
  br label %if.merge
if.else:
  %rcc.tmp.99 = load i32, ptr %pos1
  %rcc.tmp.100 = load i32, ptr %pos2
  %rcc.tmp.101 = icmp sgt i32 %rcc.tmp.99, %rcc.tmp.100
  br i1 %rcc.tmp.101, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.103 = load i32, ptr %result_count
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = load [400 x i32]*, ptr %result_rows..tmp
  %rcc.tmp.106 = getelementptr [400 x i32], ptr %rcc.tmp.105, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.107 = load i32, ptr %i2
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = load [200 x i32]*, ptr %rows2..tmp
  %rcc.tmp.110 = getelementptr [200 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %rcc.tmp.106
  %rcc.tmp.113 = load i32, ptr %result_count
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = load [400 x i32]*, ptr %result_cols..tmp
  %rcc.tmp.116 = getelementptr [400 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %i2
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = load [200 x i32]*, ptr %cols2..tmp
  %rcc.tmp.120 = getelementptr [200 x i32], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  store i32 %rcc.tmp.121, ptr %rcc.tmp.116
  %rcc.tmp.123 = load i32, ptr %result_count
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = load [400 x i32]*, ptr %result_values..tmp
  %rcc.tmp.126 = getelementptr [400 x i32], ptr %rcc.tmp.125, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.127 = load i32, ptr %i2
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = load [200 x i32]*, ptr %values2..tmp
  %rcc.tmp.130 = getelementptr [200 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  store i32 %rcc.tmp.131, ptr %rcc.tmp.126
  %rcc.tmp.133 = load i32, ptr %result_count
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 1
  store i32 %rcc.tmp.134, ptr %result_count
  %rcc.tmp.136 = load i32, ptr %i2
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 1
  store i32 %rcc.tmp.137, ptr %i2
  br label %if.merge.2
if.else.2:
  %rcc.tmp.140 = load i32, ptr %result_count
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 0
  %rcc.tmp.142 = load [400 x i32]*, ptr %result_rows..tmp
  %rcc.tmp.143 = getelementptr [400 x i32], ptr %rcc.tmp.142, i32 0, i32 %rcc.tmp.141
  %rcc.tmp.144 = load i32, ptr %i1
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = load [200 x i32]*, ptr %rows1..tmp
  %rcc.tmp.147 = getelementptr [200 x i32], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.147
  store i32 %rcc.tmp.148, ptr %rcc.tmp.143
  %rcc.tmp.150 = load i32, ptr %result_count
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = load [400 x i32]*, ptr %result_cols..tmp
  %rcc.tmp.153 = getelementptr [400 x i32], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.154 = load i32, ptr %i1
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = load [200 x i32]*, ptr %cols1..tmp
  %rcc.tmp.157 = getelementptr [200 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.158 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.158, ptr %rcc.tmp.153
  %rcc.tmp.160 = load i32, ptr %result_count
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = load [400 x i32]*, ptr %result_values..tmp
  %rcc.tmp.163 = getelementptr [400 x i32], ptr %rcc.tmp.162, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.164 = load i32, ptr %i1
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 0
  %rcc.tmp.166 = load [200 x i32]*, ptr %values1..tmp
  %rcc.tmp.167 = getelementptr [200 x i32], ptr %rcc.tmp.166, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.168 = load i32, ptr %rcc.tmp.167
  %rcc.tmp.169 = load i32, ptr %i2
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = load [200 x i32]*, ptr %values2..tmp
  %rcc.tmp.172 = getelementptr [200 x i32], ptr %rcc.tmp.171, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.173 = load i32, ptr %rcc.tmp.172
  %rcc.tmp.174 = add i32 %rcc.tmp.168, %rcc.tmp.173
  store i32 %rcc.tmp.174, ptr %rcc.tmp.163
  %rcc.tmp.176 = load i32, ptr %result_count
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 1
  store i32 %rcc.tmp.177, ptr %result_count
  %rcc.tmp.179 = load i32, ptr %i1
  %rcc.tmp.180 = add i32 %rcc.tmp.179, 1
  store i32 %rcc.tmp.180, ptr %i1
  %rcc.tmp.182 = load i32, ptr %i2
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 1
  store i32 %rcc.tmp.183, ptr %i2
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.189 = load i32, ptr %i1
  %rcc.tmp.190 = load i32, ptr %count1..tmp
  %rcc.tmp.191 = icmp slt i32 %rcc.tmp.189, %rcc.tmp.190
  br i1 %rcc.tmp.191, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.193 = load i32, ptr %result_count
  %rcc.tmp.194 = icmp slt i32 %rcc.tmp.193, 400
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.196 = phi i1 [0, %while.cond.2], [%rcc.tmp.194, %and.rhs.3]
  br i1 %rcc.tmp.196, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.199 = load i32, ptr %result_count
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 0
  %rcc.tmp.201 = load [400 x i32]*, ptr %result_rows..tmp
  %rcc.tmp.202 = getelementptr [400 x i32], ptr %rcc.tmp.201, i32 0, i32 %rcc.tmp.200
  %rcc.tmp.203 = load i32, ptr %i1
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 0
  %rcc.tmp.205 = load [200 x i32]*, ptr %rows1..tmp
  %rcc.tmp.206 = getelementptr [200 x i32], ptr %rcc.tmp.205, i32 0, i32 %rcc.tmp.204
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.206
  store i32 %rcc.tmp.207, ptr %rcc.tmp.202
  %rcc.tmp.209 = load i32, ptr %result_count
  %rcc.tmp.210 = add i32 %rcc.tmp.209, 0
  %rcc.tmp.211 = load [400 x i32]*, ptr %result_cols..tmp
  %rcc.tmp.212 = getelementptr [400 x i32], ptr %rcc.tmp.211, i32 0, i32 %rcc.tmp.210
  %rcc.tmp.213 = load i32, ptr %i1
  %rcc.tmp.214 = add i32 %rcc.tmp.213, 0
  %rcc.tmp.215 = load [200 x i32]*, ptr %cols1..tmp
  %rcc.tmp.216 = getelementptr [200 x i32], ptr %rcc.tmp.215, i32 0, i32 %rcc.tmp.214
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  store i32 %rcc.tmp.217, ptr %rcc.tmp.212
  %rcc.tmp.219 = load i32, ptr %result_count
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 0
  %rcc.tmp.221 = load [400 x i32]*, ptr %result_values..tmp
  %rcc.tmp.222 = getelementptr [400 x i32], ptr %rcc.tmp.221, i32 0, i32 %rcc.tmp.220
  %rcc.tmp.223 = load i32, ptr %i1
  %rcc.tmp.224 = add i32 %rcc.tmp.223, 0
  %rcc.tmp.225 = load [200 x i32]*, ptr %values1..tmp
  %rcc.tmp.226 = getelementptr [200 x i32], ptr %rcc.tmp.225, i32 0, i32 %rcc.tmp.224
  %rcc.tmp.227 = load i32, ptr %rcc.tmp.226
  store i32 %rcc.tmp.227, ptr %rcc.tmp.222
  %rcc.tmp.229 = load i32, ptr %result_count
  %rcc.tmp.230 = add i32 %rcc.tmp.229, 1
  store i32 %rcc.tmp.230, ptr %result_count
  %rcc.tmp.232 = load i32, ptr %i1
  %rcc.tmp.233 = add i32 %rcc.tmp.232, 1
  store i32 %rcc.tmp.233, ptr %i1
  br label %while.cond.2
while.end.2:
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.237 = load i32, ptr %i2
  %rcc.tmp.238 = load i32, ptr %count2..tmp
  %rcc.tmp.239 = icmp slt i32 %rcc.tmp.237, %rcc.tmp.238
  br i1 %rcc.tmp.239, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.241 = load i32, ptr %result_count
  %rcc.tmp.242 = icmp slt i32 %rcc.tmp.241, 400
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.244 = phi i1 [0, %while.cond.3], [%rcc.tmp.242, %and.rhs.4]
  br i1 %rcc.tmp.244, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.247 = load i32, ptr %result_count
  %rcc.tmp.248 = add i32 %rcc.tmp.247, 0
  %rcc.tmp.249 = load [400 x i32]*, ptr %result_rows..tmp
  %rcc.tmp.250 = getelementptr [400 x i32], ptr %rcc.tmp.249, i32 0, i32 %rcc.tmp.248
  %rcc.tmp.251 = load i32, ptr %i2
  %rcc.tmp.252 = add i32 %rcc.tmp.251, 0
  %rcc.tmp.253 = load [200 x i32]*, ptr %rows2..tmp
  %rcc.tmp.254 = getelementptr [200 x i32], ptr %rcc.tmp.253, i32 0, i32 %rcc.tmp.252
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.254
  store i32 %rcc.tmp.255, ptr %rcc.tmp.250
  %rcc.tmp.257 = load i32, ptr %result_count
  %rcc.tmp.258 = add i32 %rcc.tmp.257, 0
  %rcc.tmp.259 = load [400 x i32]*, ptr %result_cols..tmp
  %rcc.tmp.260 = getelementptr [400 x i32], ptr %rcc.tmp.259, i32 0, i32 %rcc.tmp.258
  %rcc.tmp.261 = load i32, ptr %i2
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 0
  %rcc.tmp.263 = load [200 x i32]*, ptr %cols2..tmp
  %rcc.tmp.264 = getelementptr [200 x i32], ptr %rcc.tmp.263, i32 0, i32 %rcc.tmp.262
  %rcc.tmp.265 = load i32, ptr %rcc.tmp.264
  store i32 %rcc.tmp.265, ptr %rcc.tmp.260
  %rcc.tmp.267 = load i32, ptr %result_count
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = load [400 x i32]*, ptr %result_values..tmp
  %rcc.tmp.270 = getelementptr [400 x i32], ptr %rcc.tmp.269, i32 0, i32 %rcc.tmp.268
  %rcc.tmp.271 = load i32, ptr %i2
  %rcc.tmp.272 = add i32 %rcc.tmp.271, 0
  %rcc.tmp.273 = load [200 x i32]*, ptr %values2..tmp
  %rcc.tmp.274 = getelementptr [200 x i32], ptr %rcc.tmp.273, i32 0, i32 %rcc.tmp.272
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.274
  store i32 %rcc.tmp.275, ptr %rcc.tmp.270
  %rcc.tmp.277 = load i32, ptr %result_count
  %rcc.tmp.278 = add i32 %rcc.tmp.277, 1
  store i32 %rcc.tmp.278, ptr %result_count
  %rcc.tmp.280 = load i32, ptr %i2
  %rcc.tmp.281 = add i32 %rcc.tmp.280, 1
  store i32 %rcc.tmp.281, ptr %i2
  br label %while.cond.3
while.end.3:
  %rcc.tmp.284 = load i32, ptr %result_count
  ret i32 %rcc.tmp.284
}
define void @sparseMatrixTranspose.([200 x i32]* %rows.tmp, [200 x i32]* %cols.tmp, [200 x i32]* %values.tmp, i32 %count.tmp, [200 x i32]* %trans_rows.tmp, [200 x i32]* %trans_cols.tmp, [200 x i32]* %trans_values.tmp) {
entry:
  %rows..tmp = alloca [200 x i32]* 
  %cols..tmp = alloca [200 x i32]* 
  %values..tmp = alloca [200 x i32]* 
  %count..tmp = alloca i32 
  %trans_rows..tmp = alloca [200 x i32]* 
  %trans_cols..tmp = alloca [200 x i32]* 
  %trans_values..tmp = alloca [200 x i32]* 
  %i = alloca i32 
  %swapped = alloca i32 
  %pos1 = alloca i32 
  %pos2 = alloca i32 
  %temp_row = alloca i32 
  %temp_col = alloca i32 
  %temp_val = alloca i32 
  store [200 x i32]* %rows.tmp, ptr %rows..tmp
  store [200 x i32]* %cols.tmp, ptr %cols..tmp
  store [200 x i32]* %values.tmp, ptr %values..tmp
  store i32 %count.tmp, ptr %count..tmp
  store [200 x i32]* %trans_rows.tmp, ptr %trans_rows..tmp
  store [200 x i32]* %trans_cols.tmp, ptr %trans_cols..tmp
  store [200 x i32]* %trans_values.tmp, ptr %trans_values..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %count..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [200 x i32]*, ptr %cols..tmp
  %rcc.tmp.22 = getelementptr [200 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.18
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.28 = getelementptr [200 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %rows..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %rcc.tmp.28
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %trans_values..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.42 = getelementptr [200 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %rcc.tmp.38
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  store i32 1, ptr %swapped
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.51 = load i32, ptr %swapped
  %rcc.tmp.52 = icmp eq i32 %rcc.tmp.51, 1
  br i1 %rcc.tmp.52, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %swapped
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = load i32, ptr %count..tmp
  %rcc.tmp.60 = sub i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.67 = getelementptr [200 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = mul i32 %rcc.tmp.68, 100
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.73 = getelementptr [200 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.69, %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %pos1
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.81 = getelementptr [200 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = mul i32 %rcc.tmp.82, 100
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  %rcc.tmp.87 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.88 = getelementptr [200 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = add i32 %rcc.tmp.83, %rcc.tmp.89
  store i32 %rcc.tmp.90, ptr %pos2
  %rcc.tmp.92 = load i32, ptr %pos1
  %rcc.tmp.93 = load i32, ptr %pos2
  %rcc.tmp.94 = icmp sgt i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %if.then, label %if.else
if.then:
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.99 = getelementptr [200 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %temp_row
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.105 = getelementptr [200 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.106, ptr %temp_col
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = load [200 x i32]*, ptr %trans_values..tmp
  %rcc.tmp.111 = getelementptr [200 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  store i32 %rcc.tmp.112, ptr %temp_val
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.117 = getelementptr [200 x i32], ptr %rcc.tmp.116, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %i
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 1
  %rcc.tmp.121 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.122 = getelementptr [200 x i32], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %rcc.tmp.117
  %rcc.tmp.125 = load i32, ptr %i
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.128 = getelementptr [200 x i32], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 0
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  %rcc.tmp.132 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.133 = getelementptr [200 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  store i32 %rcc.tmp.134, ptr %rcc.tmp.128
  %rcc.tmp.136 = load i32, ptr %i
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = load [200 x i32]*, ptr %trans_values..tmp
  %rcc.tmp.139 = getelementptr [200 x i32], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.140 = load i32, ptr %i
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 0
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 1
  %rcc.tmp.143 = load [200 x i32]*, ptr %trans_values..tmp
  %rcc.tmp.144 = getelementptr [200 x i32], ptr %rcc.tmp.143, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.145 = load i32, ptr %rcc.tmp.144
  store i32 %rcc.tmp.145, ptr %rcc.tmp.139
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 0
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 1
  %rcc.tmp.150 = load [200 x i32]*, ptr %trans_rows..tmp
  %rcc.tmp.151 = getelementptr [200 x i32], ptr %rcc.tmp.150, i32 0, i32 %rcc.tmp.149
  %rcc.tmp.152 = load i32, ptr %temp_row
  store i32 %rcc.tmp.152, ptr %rcc.tmp.151
  %rcc.tmp.154 = load i32, ptr %i
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 1
  %rcc.tmp.157 = load [200 x i32]*, ptr %trans_cols..tmp
  %rcc.tmp.158 = getelementptr [200 x i32], ptr %rcc.tmp.157, i32 0, i32 %rcc.tmp.156
  %rcc.tmp.159 = load i32, ptr %temp_col
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = load i32, ptr %i
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 0
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 1
  %rcc.tmp.164 = load [200 x i32]*, ptr %trans_values..tmp
  %rcc.tmp.165 = getelementptr [200 x i32], ptr %rcc.tmp.164, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.166 = load i32, ptr %temp_val
  store i32 %rcc.tmp.166, ptr %rcc.tmp.165
  store i32 1, ptr %swapped
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.171 = load i32, ptr %i
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 1
  store i32 %rcc.tmp.172, ptr %i
  br label %while.cond.3
while.end.3:
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @calculateSparseSum.([200 x i32]* %values.tmp, i32 %count.tmp) {
entry:
  %values..tmp = alloca [200 x i32]* 
  %count..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [200 x i32]* %values.tmp, ptr %values..tmp
  store i32 %count.tmp, ptr %count..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %count..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %sum
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.15 = getelementptr [200 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.11, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %sum
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %sum
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 100000
  ret i32 %rcc.tmp.24
}
define i32 @sparseMatrixMultiplication.([200 x i32]* %rows1.tmp, [200 x i32]* %cols1.tmp, [200 x i32]* %values1.tmp, i32 %count1.tmp, [200 x i32]* %rows2.tmp, [200 x i32]* %cols2.tmp, [200 x i32]* %values2.tmp, i32 %count2.tmp) {
entry:
  %rows1..tmp = alloca [200 x i32]* 
  %cols1..tmp = alloca [200 x i32]* 
  %values1..tmp = alloca [200 x i32]* 
  %count1..tmp = alloca i32 
  %rows2..tmp = alloca [200 x i32]* 
  %cols2..tmp = alloca [200 x i32]* 
  %values2..tmp = alloca [200 x i32]* 
  %count2..tmp = alloca i32 
  %result_sum = alloca i32 
  %i = alloca i32 
  %row = alloca i32 
  %mid_col = alloca i32 
  %val1 = alloca i32 
  %j = alloca i32 
  %col = alloca i32 
  %val2 = alloca i32 
  store [200 x i32]* %rows1.tmp, ptr %rows1..tmp
  store [200 x i32]* %cols1.tmp, ptr %cols1..tmp
  store [200 x i32]* %values1.tmp, ptr %values1..tmp
  store i32 %count1.tmp, ptr %count1..tmp
  store [200 x i32]* %rows2.tmp, ptr %rows2..tmp
  store [200 x i32]* %cols2.tmp, ptr %cols2..tmp
  store [200 x i32]* %values2.tmp, ptr %values2..tmp
  store i32 %count2.tmp, ptr %count2..tmp
  store i32 0, ptr %result_sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %count1..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [200 x i32]*, ptr %rows1..tmp
  %rcc.tmp.20 = getelementptr [200 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %row
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [200 x i32]*, ptr %cols1..tmp
  %rcc.tmp.26 = getelementptr [200 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %mid_col
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %values1..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %val1
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = load i32, ptr %count2..tmp
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.42 = load i32, ptr %j
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [200 x i32]*, ptr %rows2..tmp
  %rcc.tmp.45 = getelementptr [200 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %mid_col
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %if.then, label %if.else
if.then:
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [200 x i32]*, ptr %cols2..tmp
  %rcc.tmp.53 = getelementptr [200 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %col
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %values2..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %val2
  %rcc.tmp.62 = load i32, ptr %result_sum
  %rcc.tmp.63 = load i32, ptr %val1
  %rcc.tmp.64 = load i32, ptr %val2
  %rcc.tmp.65 = mul i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.62, %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %result_sum
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.78 = load i32, ptr %result_sum
  %rcc.tmp.79 = srem i32 %rcc.tmp.78, 100000
  ret i32 %rcc.tmp.79
}
define void @performMatrixPerformanceBenchmarks.() {
entry:
  call void @printlnInt.(i32 1730)
  call void @printlnInt.(i32 1731)
  call void @performLargeMatrixBenchmark.()
  call void @printlnInt.(i32 1732)
  call void @performRepeatedOperationsBenchmark.()
  call void @printlnInt.(i32 1733)
  call void @performMemoryAccessBenchmark.()
  ret void
}
define void @performLargeMatrixBenchmark.() {
entry:
  %large_matrix_a = alloca [625 x i32] 
  %fill.idx = alloca i32 
  %large_matrix_b = alloca [625 x i32] 
  %fill.idx.2 = alloca i32 
  %large_result = alloca [625 x i32] 
  %fill.idx.3 = alloca i32 
  %large_size = alloca i32 
  %start_time = alloca i32 
  %round = alloca i32 
  %result_sum = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 625
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [625 x i32], ptr %large_matrix_a, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 625
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [625 x i32], ptr %large_matrix_b, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.25 = load i32, ptr %fill.idx.3
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 625
  br i1 %rcc.tmp.26, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = getelementptr [625 x i32], ptr %large_result, i32 0, i32 %rcc.tmp.28
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.31, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 25, ptr %large_size
  %rcc.tmp.35 = load i32, ptr %large_size
  call void @initializeLargeMatrices.([625 x i32]* %large_matrix_a, [625 x i32]* %large_matrix_b, i32 %rcc.tmp.35)
  store i32 1000, ptr %start_time
  store i32 0, ptr %round
  br label %while.cond
while.cond:
  %rcc.tmp.40 = load i32, ptr %round
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.40, 3
  br i1 %rcc.tmp.41, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.44 = load i32, ptr %large_size
  call void @matrixMultiplication625.([625 x i32]* %large_matrix_a, [625 x i32]* %large_matrix_b, [625 x i32]* %large_result, i32 %rcc.tmp.44)
  %rcc.tmp.46 = load i32, ptr %large_size
  call void @copyMatrix625.([625 x i32]* %large_result, [625 x i32]* %large_matrix_a, i32 %rcc.tmp.46)
  %rcc.tmp.48 = load i32, ptr %round
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %round
  br label %while.cond
while.end:
  %rcc.tmp.52 = load i32, ptr %large_size
  %rcc.tmp.53 = call i32 @calculateMatrixSum625.([625 x i32]* %large_result, i32 %rcc.tmp.52)
  store i32 %rcc.tmp.53, ptr %result_sum
  %rcc.tmp.55 = load i32, ptr %result_sum
  call void @printlnInt.(i32 %rcc.tmp.55)
  ret void
}
define void @initializeLargeMatrices.([625 x i32]* %matrix_a.tmp, [625 x i32]* %matrix_b.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [625 x i32]* 
  %matrix_b..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %index = alloca i32 
  store [625 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [625 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store i32 %size.tmp, ptr %size..tmp
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
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %j
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %index
  %rcc.tmp.24 = load i32, ptr %index
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [625 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.27 = getelementptr [625 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = srem i32 %rcc.tmp.30, 10
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.27
  %rcc.tmp.34 = load i32, ptr %index
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [625 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.37 = getelementptr [625 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = mul i32 %rcc.tmp.38, %rcc.tmp.39
  %rcc.tmp.41 = srem i32 %rcc.tmp.40, 7
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %rcc.tmp.37
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @matrixMultiplication625.([625 x i32]* %matrix_a.tmp, [625 x i32]* %matrix_b.tmp, [625 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [625 x i32]* 
  %matrix_b..tmp = alloca [625 x i32]* 
  %result..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store [625 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [625 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [625 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
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
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [625 x i32]*, ptr %result..tmp
  %rcc.tmp.26 = getelementptr [625 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.26
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
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = mul i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [625 x i32]*, ptr %result..tmp
  %rcc.tmp.42 = getelementptr [625 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = mul i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %j
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [625 x i32]*, ptr %result..tmp
  %rcc.tmp.50 = getelementptr [625 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = mul i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %k
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [625 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.59 = getelementptr [625 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %k
  %rcc.tmp.62 = load i32, ptr %size..tmp
  %rcc.tmp.63 = mul i32 %rcc.tmp.61, %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [625 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.68 = getelementptr [625 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = mul i32 %rcc.tmp.60, %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.51, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %rcc.tmp.42
  %rcc.tmp.73 = load i32, ptr %k
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @copyMatrix625.([625 x i32]* %source.tmp, [625 x i32]* %dest.tmp, i32 %size.tmp) {
entry:
  %source..tmp = alloca [625 x i32]* 
  %dest..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [625 x i32]* %source.tmp, ptr %source..tmp
  store [625 x i32]* %dest.tmp, ptr %dest..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [625 x i32]*, ptr %dest..tmp
  %rcc.tmp.16 = getelementptr [625 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [625 x i32]*, ptr %source..tmp
  %rcc.tmp.20 = getelementptr [625 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.16
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateMatrixSum625.([625 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [625 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %sum
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [625 x i32]*, ptr %matrix..tmp
  %rcc.tmp.17 = getelementptr [625 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.13, %rcc.tmp.18
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 1000000
  store i32 %rcc.tmp.20, ptr %sum
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.26 = load i32, ptr %sum
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 1000000
  ret i32 %rcc.tmp.27
}
define void @performRepeatedOperationsBenchmark.() {
entry:
  %test_matrix = alloca [144 x i32] 
  %fill.idx = alloca i32 
  %temp_matrix = alloca [144 x i32] 
  %fill.idx.2 = alloca i32 
  %size = alloca i32 
  %i = alloca i32 
  %operations = alloca i32 
  %final_sum = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 144
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [144 x i32], ptr %test_matrix, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 144
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [144 x i32], ptr %temp_matrix, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 12, ptr %size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = load i32, ptr %size
  %rcc.tmp.28 = load i32, ptr %size
  %rcc.tmp.29 = mul i32 %rcc.tmp.27, %rcc.tmp.28
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [144 x i32], ptr %test_matrix, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = mul i32 %rcc.tmp.36, 3
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 7
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 20
  store i32 %rcc.tmp.39, ptr %rcc.tmp.35
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %operations
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.47 = load i32, ptr %operations
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 10
  br i1 %rcc.tmp.48, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.51 = load i32, ptr %size
  call void @matrixTranspose144.([144 x i32]* %test_matrix, [144 x i32]* %temp_matrix, i32 %rcc.tmp.51)
  %rcc.tmp.53 = load i32, ptr %size
  call void @copyMatrix144.([144 x i32]* %temp_matrix, [144 x i32]* %test_matrix, i32 %rcc.tmp.53)
  %rcc.tmp.55 = load i32, ptr %operations
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %operations
  br label %while.cond.2
while.end.2:
  %rcc.tmp.59 = load i32, ptr %size
  %rcc.tmp.60 = call i32 @calculateMatrixSum144.([144 x i32]* %test_matrix, i32 %rcc.tmp.59)
  store i32 %rcc.tmp.60, ptr %final_sum
  %rcc.tmp.62 = load i32, ptr %final_sum
  call void @printlnInt.(i32 %rcc.tmp.62)
  ret void
}
define void @matrixTranspose144.([144 x i32]* %matrix.tmp, [144 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [144 x i32]* 
  %result..tmp = alloca [144 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [144 x i32]* %matrix.tmp, ptr %matrix..tmp
  store [144 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
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
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [144 x i32]*, ptr %result..tmp
  %rcc.tmp.25 = getelementptr [144 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = load i32, ptr %size..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [144 x i32]*, ptr %matrix..tmp
  %rcc.tmp.33 = getelementptr [144 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.25
  %rcc.tmp.36 = load i32, ptr %j
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @copyMatrix144.([144 x i32]* %source.tmp, [144 x i32]* %dest.tmp, i32 %size.tmp) {
entry:
  %source..tmp = alloca [144 x i32]* 
  %dest..tmp = alloca [144 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [144 x i32]* %source.tmp, ptr %source..tmp
  store [144 x i32]* %dest.tmp, ptr %dest..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 144
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [144 x i32]*, ptr %dest..tmp
  %rcc.tmp.13 = getelementptr [144 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [144 x i32]*, ptr %source..tmp
  %rcc.tmp.17 = getelementptr [144 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %rcc.tmp.13
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateMatrixSum144.([144 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [144 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [144 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %sum
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [144 x i32]*, ptr %matrix..tmp
  %rcc.tmp.17 = getelementptr [144 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.13, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %sum
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load i32, ptr %sum
  %rcc.tmp.26 = srem i32 %rcc.tmp.25, 100000
  ret i32 %rcc.tmp.26
}
define void @performMemoryAccessBenchmark.() {
entry:
  %access_matrix = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %size = alloca i32 
  %i = alloca i32 
  %row_major_sum = alloca i32 
  %col_major_sum = alloca i32 
  %diagonal_sum = alloca i32 
  %random_sum = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 256
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [256 x i32], ptr %access_matrix, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 16, ptr %size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 256
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [256 x i32], ptr %access_matrix, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %size
  %rcc.tmp.30 = call i32 @testRowMajorAccess.([256 x i32]* %access_matrix, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %row_major_sum
  %rcc.tmp.32 = load i32, ptr %size
  %rcc.tmp.33 = call i32 @testColumnMajorAccess.([256 x i32]* %access_matrix, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %col_major_sum
  %rcc.tmp.35 = load i32, ptr %size
  %rcc.tmp.36 = call i32 @testDiagonalAccess.([256 x i32]* %access_matrix, i32 %rcc.tmp.35)
  store i32 %rcc.tmp.36, ptr %diagonal_sum
  %rcc.tmp.38 = load i32, ptr %size
  %rcc.tmp.39 = call i32 @testRandomAccess.([256 x i32]* %access_matrix, i32 %rcc.tmp.38)
  store i32 %rcc.tmp.39, ptr %random_sum
  %rcc.tmp.41 = load i32, ptr %row_major_sum
  %rcc.tmp.42 = load i32, ptr %col_major_sum
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %diagonal_sum
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %random_sum
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  call void @printlnInt.(i32 %rcc.tmp.47)
  ret void
}
define i32 @testRowMajorAccess.([256 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [256 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [256 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
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
  %rcc.tmp.18 = load i32, ptr %sum
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [256 x i32]*, ptr %matrix..tmp
  %rcc.tmp.26 = getelementptr [256 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.18, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %sum
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %sum
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 10000
  ret i32 %rcc.tmp.39
}
define i32 @testColumnMajorAccess.([256 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [256 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %j = alloca i32 
  %i = alloca i32 
  store [256 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %j
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %sum
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [256 x i32]*, ptr %matrix..tmp
  %rcc.tmp.26 = getelementptr [256 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.18, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %sum
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %sum
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 10000
  ret i32 %rcc.tmp.39
}
define i32 @testDiagonalAccess.([256 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [256 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %k = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [256 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = sub i32 %rcc.tmp.4, 1
  %rcc.tmp.6 = sub i32 0, %rcc.tmp.5
  store i32 %rcc.tmp.6, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %k
  %rcc.tmp.10 = load i32, ptr %size..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %k
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %j
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = icmp sge i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br label %sc.merge
sc.merge:
  %rcc.tmp.32 = phi i1 [0, %while.body.2], [%rcc.tmp.30, %and.rhs]
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  %rcc.tmp.34 = load i32, ptr %sum
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = mul i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [256 x i32]*, ptr %matrix..tmp
  %rcc.tmp.42 = getelementptr [256 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.34, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %sum
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.52 = load i32, ptr %k
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %k
  br label %while.cond
while.end:
  %rcc.tmp.56 = load i32, ptr %sum
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 10000
  ret i32 %rcc.tmp.57
}
define i32 @testRandomAccess.([256 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [256 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %seed = alloca i32 
  %access_count = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  store [256 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum
  store i32 7, ptr %seed
  store i32 0, ptr %access_count
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %access_count
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 100
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %seed
  %rcc.tmp.12 = mul i32 %rcc.tmp.11, 17
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 5
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 251
  store i32 %rcc.tmp.14, ptr %seed
  %rcc.tmp.16 = load i32, ptr %seed
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = srem i32 %rcc.tmp.16, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %row
  %rcc.tmp.20 = load i32, ptr %seed
  %rcc.tmp.21 = mul i32 %rcc.tmp.20, 13
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 11
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 251
  store i32 %rcc.tmp.23, ptr %seed
  %rcc.tmp.25 = load i32, ptr %seed
  %rcc.tmp.26 = load i32, ptr %size..tmp
  %rcc.tmp.27 = srem i32 %rcc.tmp.25, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %col
  %rcc.tmp.29 = load i32, ptr %sum
  %rcc.tmp.30 = load i32, ptr %row
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = mul i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %col
  %rcc.tmp.34 = add i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [256 x i32]*, ptr %matrix..tmp
  %rcc.tmp.37 = getelementptr [256 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.29, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %sum
  %rcc.tmp.41 = load i32, ptr %access_count
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %access_count
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %sum
  %rcc.tmp.46 = srem i32 %rcc.tmp.45, 10000
  ret i32 %rcc.tmp.46
}
define void @testMatrixEdgeCases.() {
entry:
  call void @printlnInt.(i32 1740)
  call void @testSingleElementMatrix.()
  call void @testMinimalMatrices.()
  call void @testBoundaryValueMatrices.()
  call void @testOverflowConditions.()
  call void @printlnInt.(i32 1749)
  ret void
}
define void @testSingleElementMatrix.() {
entry:
  %single_matrix = alloca [1 x i32] 
  %result_matrix = alloca [1 x i32] 
  %rcc.tmp.1 = getelementptr [1 x i32], ptr %single_matrix, i32 0, i32 0
  store i32 42, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.6 = getelementptr [1 x i32], ptr %single_matrix, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [1 x i32], ptr %single_matrix, i32 0, i32 0
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %rcc.tmp.5
  %rcc.tmp.12 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  call void @printlnInt.(i32 %rcc.tmp.13)
  %rcc.tmp.15 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.16 = getelementptr [1 x i32], ptr %single_matrix, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [1 x i32], ptr %single_matrix, i32 0, i32 0
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = mul i32 %rcc.tmp.17, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %rcc.tmp.15
  %rcc.tmp.22 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  call void @printlnInt.(i32 %rcc.tmp.23)
  %rcc.tmp.25 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.26 = getelementptr [1 x i32], ptr %single_matrix, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %rcc.tmp.25
  %rcc.tmp.29 = getelementptr [1 x i32], ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  call void @printlnInt.(i32 %rcc.tmp.30)
  ret void
}
define void @testMinimalMatrices.() {
entry:
  %matrix2x2 = alloca [4 x i32] 
  %result2x2 = alloca [4 x i32] 
  %transpose_sum = alloca i32 
  %det2x2 = alloca i32 
  %rcc.tmp.1 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 1
  store i32 2, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 2
  store i32 3, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 3
  store i32 4, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 0
  %rcc.tmp.18 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 0
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.17
  %rcc.tmp.21 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 1
  %rcc.tmp.22 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 2
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  %rcc.tmp.25 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 2
  %rcc.tmp.26 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 1
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %rcc.tmp.25
  %rcc.tmp.29 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 3
  %rcc.tmp.30 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 3
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %rcc.tmp.29
  %rcc.tmp.33 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 1
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.34, %rcc.tmp.36
  %rcc.tmp.38 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 2
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.37, %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [4 x i32], ptr %result2x2, i32 0, i32 3
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.40, %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %transpose_sum
  %rcc.tmp.45 = load i32, ptr %transpose_sum
  call void @printlnInt.(i32 %rcc.tmp.45)
  %rcc.tmp.47 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 3
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = mul i32 %rcc.tmp.48, %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 1
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [4 x i32], ptr %matrix2x2, i32 0, i32 2
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = mul i32 %rcc.tmp.53, %rcc.tmp.55
  %rcc.tmp.57 = sub i32 %rcc.tmp.51, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %det2x2
  %rcc.tmp.59 = load i32, ptr %det2x2
  call void @printlnInt.(i32 %rcc.tmp.59)
  ret void
}
define void @testBoundaryValueMatrices.() {
entry:
  %large_value_matrix = alloca [9 x i32] 
  %sum = alloca i32 
  %i = alloca i32 
  %zero_matrix = alloca [16 x i32] 
  %zero_sum = alloca i32 
  %ones_matrix = alloca [16 x i32] 
  %ones_sum = alloca i32 
  %rcc.tmp.1 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 0
  store i32 10000, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 1
  %rcc.tmp.22 = sub i32 0, 10000
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 2
  store i32 5000, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 3
  %rcc.tmp.27 = sub i32 0, 5000
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 4
  store i32 20000, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 5
  %rcc.tmp.32 = sub i32 0, 20000
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 6
  store i32 15000, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 7
  %rcc.tmp.37 = sub i32 0, 15000
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.39
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.44, 9
  br i1 %rcc.tmp.45, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.48 = load i32, ptr %sum
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [9 x i32], ptr %large_value_matrix, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.48, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %sum
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.59 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.59)
  %rcc.tmp.61 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %zero_matrix, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = call i32 @calculateMatrixSum16.([16 x i32]* %zero_matrix)
  store i32 %rcc.tmp.93, ptr %zero_sum
  %rcc.tmp.95 = load i32, ptr %zero_sum
  call void @printlnInt.(i32 %rcc.tmp.95)
  %rcc.tmp.97 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 1
  store i32 1, ptr %rcc.tmp.99
  %rcc.tmp.101 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 2
  store i32 1, ptr %rcc.tmp.101
  %rcc.tmp.103 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 3
  store i32 1, ptr %rcc.tmp.103
  %rcc.tmp.105 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 4
  store i32 1, ptr %rcc.tmp.105
  %rcc.tmp.107 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 5
  store i32 1, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 6
  store i32 1, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 7
  store i32 1, ptr %rcc.tmp.111
  %rcc.tmp.113 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 8
  store i32 1, ptr %rcc.tmp.113
  %rcc.tmp.115 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 9
  store i32 1, ptr %rcc.tmp.115
  %rcc.tmp.117 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 10
  store i32 1, ptr %rcc.tmp.117
  %rcc.tmp.119 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 11
  store i32 1, ptr %rcc.tmp.119
  %rcc.tmp.121 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 12
  store i32 1, ptr %rcc.tmp.121
  %rcc.tmp.123 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 13
  store i32 1, ptr %rcc.tmp.123
  %rcc.tmp.125 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 14
  store i32 1, ptr %rcc.tmp.125
  %rcc.tmp.127 = getelementptr [16 x i32], ptr %ones_matrix, i32 0, i32 15
  store i32 1, ptr %rcc.tmp.127
  %rcc.tmp.129 = call i32 @calculateMatrixSum16.([16 x i32]* %ones_matrix)
  store i32 %rcc.tmp.129, ptr %ones_sum
  %rcc.tmp.131 = load i32, ptr %ones_sum
  call void @printlnInt.(i32 %rcc.tmp.131)
  ret void
}
define i32 @calculateMatrixSum16.([16 x i32]* %matrix.tmp) {
entry:
  %matrix..tmp = alloca [16 x i32]* 
  %sum = alloca i32 
  %i = alloca i32 
  store [16 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 16
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %sum
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [16 x i32]*, ptr %matrix..tmp
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
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
define void @testOverflowConditions.() {
entry:
  %overflow_matrix_a = alloca [4 x i32] 
  %overflow_matrix_b = alloca [4 x i32] 
  %overflow_result = alloca [4 x i32] 
  %safe_result = alloca i32 
  %rcc.tmp.1 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 0
  store i32 1000, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 1
  store i32 2000, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 2
  store i32 3000, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 3
  store i32 4000, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 0
  store i32 5000, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 1
  store i32 6000, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 2
  store i32 7000, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 3
  store i32 8000, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 0
  %rcc.tmp.26 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = mul i32 %rcc.tmp.27, %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 2
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = mul i32 %rcc.tmp.32, %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.30, %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %rcc.tmp.25
  %rcc.tmp.38 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 1
  %rcc.tmp.39 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 0
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 1
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = mul i32 %rcc.tmp.40, %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 1
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 3
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = mul i32 %rcc.tmp.45, %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.43, %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %rcc.tmp.38
  %rcc.tmp.51 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 2
  %rcc.tmp.52 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 2
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 0
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = mul i32 %rcc.tmp.53, %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 3
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 2
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = mul i32 %rcc.tmp.58, %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.56, %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %rcc.tmp.51
  %rcc.tmp.64 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 3
  %rcc.tmp.65 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 2
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 1
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = mul i32 %rcc.tmp.66, %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [4 x i32], ptr %overflow_matrix_a, i32 0, i32 3
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [4 x i32], ptr %overflow_matrix_b, i32 0, i32 3
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = mul i32 %rcc.tmp.71, %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.69, %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %rcc.tmp.64
  %rcc.tmp.77 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 0
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = srem i32 %rcc.tmp.78, 100000
  %rcc.tmp.80 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 1
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = srem i32 %rcc.tmp.81, 100000
  %rcc.tmp.83 = add i32 %rcc.tmp.79, %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 2
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = srem i32 %rcc.tmp.85, 100000
  %rcc.tmp.87 = add i32 %rcc.tmp.83, %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [4 x i32], ptr %overflow_result, i32 0, i32 3
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = srem i32 %rcc.tmp.89, 100000
  %rcc.tmp.91 = add i32 %rcc.tmp.87, %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %safe_result
  %rcc.tmp.93 = load i32, ptr %safe_result
  call void @printlnInt.(i32 %rcc.tmp.93)
  ret void
}
