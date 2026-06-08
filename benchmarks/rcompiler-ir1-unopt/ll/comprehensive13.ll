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
%MathEngine = type {[100 x [100 x i32]], [100 x [100 x i32]], [100 x [100 x i32]], i32, [200 x i32], i32, [50 x i32], i32, [1000 x i32], i32, [10 x i32], [512 x i32], [512 x i32], i32, [1000 x i32], i32, [100 x [20 x i32]], [2000 x i32], i32, [10 x i32], [100 x i32], [50 x i32], i32}
define void @MathEngine.initialize_matrices.(%MathEngine* %self.tmp, i32 %size.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %j.2 = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %MathEngine, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %size..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.22 = getelementptr %MathEngine, ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [100 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = call i32 @getInt.()
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = load i32, ptr %size..tmp
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %j.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.48 = load i32, ptr %j.2
  %rcc.tmp.49 = load i32, ptr %size..tmp
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.53 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.54 = getelementptr %MathEngine, ptr %rcc.tmp.53, i32 0, i32 1
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %j.2
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [100 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = call i32 @getInt.()
  store i32 %rcc.tmp.61, ptr %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %j.2
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %j.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define void @MathEngine.matrix_multiply.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %MathEngine, ptr %rcc.tmp.5, i32 0, i32 3
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.20 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %MathEngine, ptr %rcc.tmp.20, i32 0, i32 2
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [100 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  store i32 0, ptr %rcc.tmp.27
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.31 = load i32, ptr %k
  %rcc.tmp.32 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %MathEngine, ptr %rcc.tmp.32, i32 0, i32 3
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.38 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %MathEngine, ptr %rcc.tmp.38, i32 0, i32 2
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %MathEngine, ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %k
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %MathEngine, ptr %rcc.tmp.55, i32 0, i32 1
  %rcc.tmp.57 = load i32, ptr %k
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [100 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = mul i32 %rcc.tmp.54, %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.66 = add i32 %rcc.tmp.65, %rcc.tmp.64
  store i32 %rcc.tmp.66, ptr %rcc.tmp.45
  %rcc.tmp.68 = load i32, ptr %k
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @MathEngine.calculate_determinant.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %lu_matrix = alloca [100 x [100 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %det = alloca i32 
  %sign = alloca i32 
  %max_row = alloca i32 
  %max_val = alloca i32 
  %k = alloca i32 
  %abs_val = alloca i32 
  %j.2 = alloca i32 
  %temp = alloca i32 
  %factor = alloca i32 
  %j.3 = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.11 = load i32, ptr %fill.idx.2
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 100
  br i1 %rcc.tmp.12, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.20 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.20, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.27 = getelementptr %MathEngine, ptr %rcc.tmp.26, i32 0, i32 3
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.25, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %MathEngine, ptr %rcc.tmp.35, i32 0, i32 3
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [100 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %MathEngine, ptr %rcc.tmp.47, i32 0, i32 0
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [100 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %rcc.tmp.46
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %i
  br label %while.cond
while.end:
  store i32 1, ptr %det
  store i32 1, ptr %sign
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.71 = getelementptr %MathEngine, ptr %rcc.tmp.70, i32 0, i32 3
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = sub i32 %rcc.tmp.72, 1
  %rcc.tmp.74 = icmp slt i32 %rcc.tmp.69, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.77 = load i32, ptr %i
  store i32 %rcc.tmp.77, ptr %max_row
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [100 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = icmp slt i32 %rcc.tmp.85, 0
  br i1 %rcc.tmp.86, label %if.then, label %if.else
if.then:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [100 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = sub i32 0, %rcc.tmp.94
  br label %if.merge
if.else:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %i
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = getelementptr [100 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  br label %if.merge
if.merge:
  %rcc.tmp.105 = phi i32 [%rcc.tmp.95, %if.then], [%rcc.tmp.103, %if.else]
  store i32 %rcc.tmp.105, ptr %max_val
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %k
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.111 = load i32, ptr %k
  %rcc.tmp.112 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.113 = getelementptr %MathEngine, ptr %rcc.tmp.112, i32 0, i32 3
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = icmp slt i32 %rcc.tmp.111, %rcc.tmp.114
  br i1 %rcc.tmp.115, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.118 = load i32, ptr %k
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %i
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [100 x i32], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = icmp slt i32 %rcc.tmp.124, 0
  br i1 %rcc.tmp.125, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.127 = load i32, ptr %k
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = getelementptr [100 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.132
  %rcc.tmp.134 = sub i32 0, %rcc.tmp.133
  br label %if.merge.2
if.else.2:
  %rcc.tmp.136 = load i32, ptr %k
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.139 = load i32, ptr %i
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 0
  %rcc.tmp.141 = getelementptr [100 x i32], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %rcc.tmp.141
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.144 = phi i32 [%rcc.tmp.134, %if.then.2], [%rcc.tmp.142, %if.else.2]
  store i32 %rcc.tmp.144, ptr %abs_val
  %rcc.tmp.146 = load i32, ptr %abs_val
  %rcc.tmp.147 = load i32, ptr %max_val
  %rcc.tmp.148 = icmp sgt i32 %rcc.tmp.146, %rcc.tmp.147
  br i1 %rcc.tmp.148, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.150 = load i32, ptr %abs_val
  store i32 %rcc.tmp.150, ptr %max_val
  %rcc.tmp.152 = load i32, ptr %k
  store i32 %rcc.tmp.152, ptr %max_row
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.156 = load i32, ptr %k
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 1
  store i32 %rcc.tmp.157, ptr %k
  br label %while.cond.4
while.end.4:
  %rcc.tmp.160 = load i32, ptr %max_row
  %rcc.tmp.161 = load i32, ptr %i
  %rcc.tmp.162 = icmp ne i32 %rcc.tmp.160, %rcc.tmp.161
  br i1 %rcc.tmp.162, label %if.then.4, label %if.else.4
if.then.4:
  store i32 0, ptr %j.2
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.166 = load i32, ptr %j.2
  %rcc.tmp.167 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.168 = getelementptr %MathEngine, ptr %rcc.tmp.167, i32 0, i32 3
  %rcc.tmp.169 = load i32, ptr %rcc.tmp.168
  %rcc.tmp.170 = icmp slt i32 %rcc.tmp.166, %rcc.tmp.169
  br i1 %rcc.tmp.170, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.174
  %rcc.tmp.176 = load i32, ptr %j.2
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 0
  %rcc.tmp.178 = getelementptr [100 x i32], ptr %rcc.tmp.175, i32 0, i32 %rcc.tmp.177
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.178
  store i32 %rcc.tmp.179, ptr %temp
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = load i32, ptr %j.2
  %rcc.tmp.185 = add i32 %rcc.tmp.184, 0
  %rcc.tmp.186 = getelementptr [100 x i32], ptr %rcc.tmp.183, i32 0, i32 %rcc.tmp.185
  %rcc.tmp.187 = load i32, ptr %max_row
  %rcc.tmp.188 = add i32 %rcc.tmp.187, 0
  %rcc.tmp.189 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.188
  %rcc.tmp.190 = load i32, ptr %j.2
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = getelementptr [100 x i32], ptr %rcc.tmp.189, i32 0, i32 %rcc.tmp.191
  %rcc.tmp.193 = load i32, ptr %rcc.tmp.192
  store i32 %rcc.tmp.193, ptr %rcc.tmp.186
  %rcc.tmp.195 = load i32, ptr %max_row
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 0
  %rcc.tmp.197 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.196
  %rcc.tmp.198 = load i32, ptr %j.2
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 0
  %rcc.tmp.200 = getelementptr [100 x i32], ptr %rcc.tmp.197, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %temp
  store i32 %rcc.tmp.201, ptr %rcc.tmp.200
  %rcc.tmp.203 = load i32, ptr %j.2
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  store i32 %rcc.tmp.204, ptr %j.2
  br label %while.cond.5
while.end.5:
  %rcc.tmp.207 = load i32, ptr %sign
  %rcc.tmp.208 = sub i32 0, %rcc.tmp.207
  store i32 %rcc.tmp.208, ptr %sign
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.212 = load i32, ptr %i
  %rcc.tmp.213 = add i32 %rcc.tmp.212, 0
  %rcc.tmp.214 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.213
  %rcc.tmp.215 = load i32, ptr %i
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 0
  %rcc.tmp.217 = getelementptr [100 x i32], ptr %rcc.tmp.214, i32 0, i32 %rcc.tmp.216
  %rcc.tmp.218 = load i32, ptr %rcc.tmp.217
  %rcc.tmp.219 = icmp eq i32 %rcc.tmp.218, 0
  br i1 %rcc.tmp.219, label %if.then.5, label %if.else.5
if.then.5:
  ret i32 0
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.223 = load i32, ptr %i
  %rcc.tmp.224 = add i32 %rcc.tmp.223, 1
  store i32 %rcc.tmp.224, ptr %k
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.227 = load i32, ptr %k
  %rcc.tmp.228 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.229 = getelementptr %MathEngine, ptr %rcc.tmp.228, i32 0, i32 3
  %rcc.tmp.230 = load i32, ptr %rcc.tmp.229
  %rcc.tmp.231 = icmp slt i32 %rcc.tmp.227, %rcc.tmp.230
  br i1 %rcc.tmp.231, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.234 = load i32, ptr %k
  %rcc.tmp.235 = add i32 %rcc.tmp.234, 0
  %rcc.tmp.236 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.235
  %rcc.tmp.237 = load i32, ptr %i
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = getelementptr [100 x i32], ptr %rcc.tmp.236, i32 0, i32 %rcc.tmp.238
  %rcc.tmp.240 = load i32, ptr %rcc.tmp.239
  %rcc.tmp.241 = load i32, ptr %i
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 0
  %rcc.tmp.243 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.242
  %rcc.tmp.244 = load i32, ptr %i
  %rcc.tmp.245 = add i32 %rcc.tmp.244, 0
  %rcc.tmp.246 = getelementptr [100 x i32], ptr %rcc.tmp.243, i32 0, i32 %rcc.tmp.245
  %rcc.tmp.247 = load i32, ptr %rcc.tmp.246
  %rcc.tmp.248 = sdiv i32 %rcc.tmp.240, %rcc.tmp.247
  store i32 %rcc.tmp.248, ptr %factor
  %rcc.tmp.250 = load i32, ptr %i
  store i32 %rcc.tmp.250, ptr %j.3
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.253 = load i32, ptr %j.3
  %rcc.tmp.254 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.255 = getelementptr %MathEngine, ptr %rcc.tmp.254, i32 0, i32 3
  %rcc.tmp.256 = load i32, ptr %rcc.tmp.255
  %rcc.tmp.257 = icmp slt i32 %rcc.tmp.253, %rcc.tmp.256
  br i1 %rcc.tmp.257, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.260 = load i32, ptr %k
  %rcc.tmp.261 = add i32 %rcc.tmp.260, 0
  %rcc.tmp.262 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.261
  %rcc.tmp.263 = load i32, ptr %j.3
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [100 x i32], ptr %rcc.tmp.262, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %factor
  %rcc.tmp.267 = load i32, ptr %i
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.268
  %rcc.tmp.270 = load i32, ptr %j.3
  %rcc.tmp.271 = add i32 %rcc.tmp.270, 0
  %rcc.tmp.272 = getelementptr [100 x i32], ptr %rcc.tmp.269, i32 0, i32 %rcc.tmp.271
  %rcc.tmp.273 = load i32, ptr %rcc.tmp.272
  %rcc.tmp.274 = mul i32 %rcc.tmp.266, %rcc.tmp.273
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.265
  %rcc.tmp.276 = sub i32 %rcc.tmp.275, %rcc.tmp.274
  store i32 %rcc.tmp.276, ptr %rcc.tmp.265
  %rcc.tmp.278 = load i32, ptr %j.3
  %rcc.tmp.279 = add i32 %rcc.tmp.278, 1
  store i32 %rcc.tmp.279, ptr %j.3
  br label %while.cond.7
while.end.7:
  %rcc.tmp.282 = load i32, ptr %k
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 1
  store i32 %rcc.tmp.283, ptr %k
  br label %while.cond.6
while.end.6:
  %rcc.tmp.286 = load i32, ptr %i
  %rcc.tmp.287 = add i32 %rcc.tmp.286, 1
  store i32 %rcc.tmp.287, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %i
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.292 = load i32, ptr %i
  %rcc.tmp.293 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.294 = getelementptr %MathEngine, ptr %rcc.tmp.293, i32 0, i32 3
  %rcc.tmp.295 = load i32, ptr %rcc.tmp.294
  %rcc.tmp.296 = icmp slt i32 %rcc.tmp.292, %rcc.tmp.295
  br i1 %rcc.tmp.296, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.299 = load i32, ptr %i
  %rcc.tmp.300 = add i32 %rcc.tmp.299, 0
  %rcc.tmp.301 = getelementptr [100 x [100 x i32]], ptr %lu_matrix, i32 0, i32 %rcc.tmp.300
  %rcc.tmp.302 = load i32, ptr %i
  %rcc.tmp.303 = add i32 %rcc.tmp.302, 0
  %rcc.tmp.304 = getelementptr [100 x i32], ptr %rcc.tmp.301, i32 0, i32 %rcc.tmp.303
  %rcc.tmp.305 = load i32, ptr %rcc.tmp.304
  %rcc.tmp.306 = load i32, ptr %det
  %rcc.tmp.307 = mul i32 %rcc.tmp.306, %rcc.tmp.305
  store i32 %rcc.tmp.307, ptr %det
  %rcc.tmp.309 = load i32, ptr %i
  %rcc.tmp.310 = add i32 %rcc.tmp.309, 1
  store i32 %rcc.tmp.310, ptr %i
  br label %while.cond.8
while.end.8:
  %rcc.tmp.313 = load i32, ptr %det
  %rcc.tmp.314 = load i32, ptr %sign
  %rcc.tmp.315 = mul i32 %rcc.tmp.313, %rcc.tmp.314
  ret i32 %rcc.tmp.315
}
define void @MathEngine.matrix_operations_suite.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %trace = alloca i32 
  %i = alloca i32 
  %frobenius_norm = alloca i32 
  %j = alloca i32 
  %val = alloca i32 
  %j.2 = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 0, ptr %trace
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %MathEngine, ptr %rcc.tmp.6, i32 0, i32 3
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %MathEngine, ptr %rcc.tmp.12, i32 0, i32 0
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %trace
  %rcc.tmp.22 = add i32 %rcc.tmp.21, %rcc.tmp.20
  store i32 %rcc.tmp.22, ptr %trace
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %MathEngine, ptr %rcc.tmp.28, i32 0, i32 21
  %rcc.tmp.30 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %MathEngine, ptr %rcc.tmp.30, i32 0, i32 22
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %trace
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %MathEngine, ptr %rcc.tmp.37, i32 0, i32 22
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %rcc.tmp.38
  store i32 0, ptr %frobenius_norm
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %MathEngine, ptr %rcc.tmp.46, i32 0, i32 3
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.45, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %MathEngine, ptr %rcc.tmp.55, i32 0, i32 3
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.54, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.61 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.62 = getelementptr %MathEngine, ptr %rcc.tmp.61, i32 0, i32 0
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [100 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %val
  %rcc.tmp.71 = load i32, ptr %val
  %rcc.tmp.72 = load i32, ptr %val
  %rcc.tmp.73 = mul i32 %rcc.tmp.71, %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %frobenius_norm
  %rcc.tmp.75 = add i32 %rcc.tmp.74, %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %frobenius_norm
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.85 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.86 = getelementptr %MathEngine, ptr %rcc.tmp.85, i32 0, i32 21
  %rcc.tmp.87 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %MathEngine, ptr %rcc.tmp.87, i32 0, i32 22
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [50 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %frobenius_norm
  store i32 %rcc.tmp.92, ptr %rcc.tmp.91
  %rcc.tmp.94 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %MathEngine, ptr %rcc.tmp.94, i32 0, i32 22
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %rcc.tmp.95
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.103 = getelementptr %MathEngine, ptr %rcc.tmp.102, i32 0, i32 3
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = icmp slt i32 %rcc.tmp.101, %rcc.tmp.104
  br i1 %rcc.tmp.105, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %j.2
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.110 = load i32, ptr %j.2
  %rcc.tmp.111 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.112 = getelementptr %MathEngine, ptr %rcc.tmp.111, i32 0, i32 3
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = icmp slt i32 %rcc.tmp.110, %rcc.tmp.113
  br i1 %rcc.tmp.114, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.117 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.118 = getelementptr %MathEngine, ptr %rcc.tmp.117, i32 0, i32 2
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %j.2
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [100 x i32], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.126 = getelementptr %MathEngine, ptr %rcc.tmp.125, i32 0, i32 0
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %j.2
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = getelementptr [100 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.132
  %rcc.tmp.134 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.135 = getelementptr %MathEngine, ptr %rcc.tmp.134, i32 0, i32 1
  %rcc.tmp.136 = load i32, ptr %i
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.135, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.139 = load i32, ptr %j.2
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 0
  %rcc.tmp.141 = getelementptr [100 x i32], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %rcc.tmp.141
  %rcc.tmp.143 = add i32 %rcc.tmp.133, %rcc.tmp.142
  store i32 %rcc.tmp.143, ptr %rcc.tmp.124
  %rcc.tmp.145 = load i32, ptr %j.2
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %j.2
  br label %while.cond.5
while.end.5:
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %i
  br label %while.cond.4
while.end.4:
  ret void
}
define void @MathEngine.initialize_polynomial.(%MathEngine* %self.tmp, i32 %degree.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %degree..tmp = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %degree.tmp, ptr %degree..tmp
  %rcc.tmp.3 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %MathEngine, ptr %rcc.tmp.3, i32 0, i32 5
  %rcc.tmp.5 = load i32, ptr %degree..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %degree..tmp
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 4
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @MathEngine.evaluate_polynomial.(%MathEngine* %self.tmp, i32 %x.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %x..tmp = alloca i32 
  %result = alloca i32 
  %power = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %x.tmp, ptr %x..tmp
  store i32 0, ptr %result
  store i32 1, ptr %power
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %MathEngine, ptr %rcc.tmp.8, i32 0, i32 5
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.7, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 4
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %power
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %result
  %rcc.tmp.23 = add i32 %rcc.tmp.22, %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %result
  %rcc.tmp.25 = load i32, ptr %x..tmp
  %rcc.tmp.26 = load i32, ptr %power
  %rcc.tmp.27 = mul i32 %rcc.tmp.26, %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %power
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.33 = load i32, ptr %result
  ret i32 %rcc.tmp.33
}
define void @MathEngine.find_polynomial_roots.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %start = alloca i32 
  %x = alloca i32 
  %iterations = alloca i32 
  %f_x = alloca i32 
  %f_prime_x = alloca i32 
  %next_x = alloca i32 
  %diff = alloca i32 
  %is_new_root = alloca i1 
  %j = alloca i32 
  %root_diff = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %MathEngine, ptr %rcc.tmp.2, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = sub i32 0, 10
  store i32 %rcc.tmp.5, ptr %start
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %start
  %rcc.tmp.9 = icmp sle i32 %rcc.tmp.8, 10
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %MathEngine, ptr %rcc.tmp.11, i32 0, i32 7
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 50
  br label %sc.merge
sc.merge:
  %rcc.tmp.16 = phi i1 [0, %while.cond], [%rcc.tmp.14, %and.rhs]
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %start
  store i32 %rcc.tmp.19, ptr %x
  store i32 0, ptr %iterations
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %iterations
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.23, 50
  br i1 %rcc.tmp.24, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.27 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.28 = load i32, ptr %x
  %rcc.tmp.29 = call i32 @MathEngine.evaluate_polynomial.(%MathEngine* %rcc.tmp.27, i32 %rcc.tmp.28)
  store i32 %rcc.tmp.29, ptr %f_x
  %rcc.tmp.31 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.32 = load i32, ptr %x
  %rcc.tmp.33 = call i32 @MathEngine.evaluate_polynomial_derivative.(%MathEngine* %rcc.tmp.31, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %f_prime_x
  %rcc.tmp.35 = load i32, ptr %f_prime_x
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %if.then, label %if.else
if.then:
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.40 = load i32, ptr %x
  %rcc.tmp.41 = load i32, ptr %f_x
  %rcc.tmp.42 = load i32, ptr %f_prime_x
  %rcc.tmp.43 = sdiv i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = sub i32 %rcc.tmp.40, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %next_x
  %rcc.tmp.46 = load i32, ptr %next_x
  %rcc.tmp.47 = load i32, ptr %x
  %rcc.tmp.48 = icmp sgt i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.50 = load i32, ptr %next_x
  %rcc.tmp.51 = load i32, ptr %x
  %rcc.tmp.52 = sub i32 %rcc.tmp.50, %rcc.tmp.51
  br label %if.merge.2
if.else.2:
  %rcc.tmp.54 = load i32, ptr %x
  %rcc.tmp.55 = load i32, ptr %next_x
  %rcc.tmp.56 = sub i32 %rcc.tmp.54, %rcc.tmp.55
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.58 = phi i32 [%rcc.tmp.52, %if.then.2], [%rcc.tmp.56, %if.else.2]
  store i32 %rcc.tmp.58, ptr %diff
  %rcc.tmp.60 = load i32, ptr %diff
  %rcc.tmp.61 = icmp sle i32 %rcc.tmp.60, 1
  br i1 %rcc.tmp.61, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.63 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.64 = load i32, ptr %next_x
  %rcc.tmp.65 = call i32 @MathEngine.evaluate_polynomial.(%MathEngine* %rcc.tmp.63, i32 %rcc.tmp.64)
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.65, 0
  br i1 %rcc.tmp.66, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.68 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.69 = load i32, ptr %next_x
  %rcc.tmp.70 = call i32 @MathEngine.evaluate_polynomial.(%MathEngine* %rcc.tmp.68, i32 %rcc.tmp.69)
  %rcc.tmp.71 = icmp slt i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.73 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.74 = load i32, ptr %next_x
  %rcc.tmp.75 = call i32 @MathEngine.evaluate_polynomial.(%MathEngine* %rcc.tmp.73, i32 %rcc.tmp.74)
  %rcc.tmp.76 = sub i32 0, %rcc.tmp.75
  br label %if.merge.4
if.else.4:
  %rcc.tmp.78 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.79 = load i32, ptr %next_x
  %rcc.tmp.80 = call i32 @MathEngine.evaluate_polynomial.(%MathEngine* %rcc.tmp.78, i32 %rcc.tmp.79)
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.82 = phi i32 [%rcc.tmp.76, %if.then.4], [%rcc.tmp.80, %if.else.4]
  %rcc.tmp.83 = icmp sle i32 %rcc.tmp.82, 5
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.85 = phi i1 [1, %if.then.3], [%rcc.tmp.83, %if.merge.4]
  br i1 %rcc.tmp.85, label %if.then.5, label %if.else.5
if.then.5:
  store i1 1, ptr %is_new_root
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.92 = getelementptr %MathEngine, ptr %rcc.tmp.91, i32 0, i32 7
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.90, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.97 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.98 = getelementptr %MathEngine, ptr %rcc.tmp.97, i32 0, i32 6
  %rcc.tmp.99 = load i32, ptr %j
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [50 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %next_x
  %rcc.tmp.104 = icmp sgt i32 %rcc.tmp.102, %rcc.tmp.103
  br i1 %rcc.tmp.104, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.106 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.107 = getelementptr %MathEngine, ptr %rcc.tmp.106, i32 0, i32 6
  %rcc.tmp.108 = load i32, ptr %j
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [50 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %next_x
  %rcc.tmp.113 = sub i32 %rcc.tmp.111, %rcc.tmp.112
  br label %if.merge.6
if.else.6:
  %rcc.tmp.115 = load i32, ptr %next_x
  %rcc.tmp.116 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %MathEngine, ptr %rcc.tmp.116, i32 0, i32 6
  %rcc.tmp.118 = load i32, ptr %j
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [50 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  %rcc.tmp.122 = sub i32 %rcc.tmp.115, %rcc.tmp.121
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.124 = phi i32 [%rcc.tmp.113, %if.then.6], [%rcc.tmp.122, %if.else.6]
  store i32 %rcc.tmp.124, ptr %root_diff
  %rcc.tmp.126 = load i32, ptr %root_diff
  %rcc.tmp.127 = icmp sle i32 %rcc.tmp.126, 2
  br i1 %rcc.tmp.127, label %if.then.7, label %if.else.7
if.then.7:
  store i1 0, ptr %is_new_root
  br label %while.linker.3
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.132 = load i32, ptr %j
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.136 = load i1, ptr %is_new_root
  br i1 %rcc.tmp.136, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.138 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.139 = getelementptr %MathEngine, ptr %rcc.tmp.138, i32 0, i32 6
  %rcc.tmp.140 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.141 = getelementptr %MathEngine, ptr %rcc.tmp.140, i32 0, i32 7
  %rcc.tmp.142 = load i32, ptr %rcc.tmp.141
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = getelementptr [50 x i32], ptr %rcc.tmp.139, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %next_x
  store i32 %rcc.tmp.145, ptr %rcc.tmp.144
  %rcc.tmp.147 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.148 = getelementptr %MathEngine, ptr %rcc.tmp.147, i32 0, i32 7
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %rcc.tmp.148
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %while.linker.2
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.158 = load i32, ptr %next_x
  store i32 %rcc.tmp.158, ptr %x
  %rcc.tmp.160 = load i32, ptr %iterations
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %iterations
  br label %while.cond.2
while.end.2:
  %rcc.tmp.164 = load i32, ptr %start
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 7
  store i32 %rcc.tmp.165, ptr %start
  br label %while.cond
while.end:
  ret void
}
define i32 @MathEngine.evaluate_polynomial_derivative.(%MathEngine* %self.tmp, i32 %x.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %x..tmp = alloca i32 
  %result = alloca i32 
  %power = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %x.tmp, ptr %x..tmp
  store i32 0, ptr %result
  store i32 1, ptr %power
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %MathEngine, ptr %rcc.tmp.8, i32 0, i32 5
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.7, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.16 = getelementptr %MathEngine, ptr %rcc.tmp.15, i32 0, i32 4
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = mul i32 %rcc.tmp.14, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %power
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %result
  %rcc.tmp.25 = add i32 %rcc.tmp.24, %rcc.tmp.23
  store i32 %rcc.tmp.25, ptr %result
  %rcc.tmp.27 = load i32, ptr %x..tmp
  %rcc.tmp.28 = load i32, ptr %power
  %rcc.tmp.29 = mul i32 %rcc.tmp.28, %rcc.tmp.27
  store i32 %rcc.tmp.29, ptr %power
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i32, ptr %result
  ret i32 %rcc.tmp.35
}
define void @MathEngine.initialize_function_data.(%MathEngine* %self.tmp, i32 %points.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %points..tmp = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %points.tmp, ptr %points..tmp
  %rcc.tmp.3 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %MathEngine, ptr %rcc.tmp.3, i32 0, i32 9
  %rcc.tmp.5 = load i32, ptr %points..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %points..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 8
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @MathEngine.trapezoidal_integration.(%MathEngine* %self.tmp, i32 %step_size.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %step_size..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %step_size.tmp, ptr %step_size..tmp
  store i32 0, ptr %result
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %MathEngine, ptr %rcc.tmp.7, i32 0, i32 9
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 1
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 8
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %MathEngine, ptr %rcc.tmp.20, i32 0, i32 8
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [1000 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.19, %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %step_size..tmp
  %rcc.tmp.29 = mul i32 %rcc.tmp.27, %rcc.tmp.28
  %rcc.tmp.30 = sdiv i32 %rcc.tmp.29, 2
  %rcc.tmp.31 = load i32, ptr %result
  %rcc.tmp.32 = add i32 %rcc.tmp.31, %rcc.tmp.30
  store i32 %rcc.tmp.32, ptr %result
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %result
  ret i32 %rcc.tmp.38
}
define i32 @MathEngine.simpson_integration.(%MathEngine* %self.tmp, i32 %step_size.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %step_size..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %step_size.tmp, ptr %step_size..tmp
  store i32 0, ptr %result
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %MathEngine, ptr %rcc.tmp.7, i32 0, i32 9
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 2
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %step_size..tmp
  %rcc.tmp.15 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.16 = getelementptr %MathEngine, ptr %rcc.tmp.15, i32 0, i32 8
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [1000 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.22 = getelementptr %MathEngine, ptr %rcc.tmp.21, i32 0, i32 8
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [1000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = mul i32 4, %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.20, %rcc.tmp.28
  %rcc.tmp.30 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %MathEngine, ptr %rcc.tmp.30, i32 0, i32 8
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 2
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [1000 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.29, %rcc.tmp.36
  %rcc.tmp.38 = mul i32 %rcc.tmp.14, %rcc.tmp.37
  %rcc.tmp.39 = sdiv i32 %rcc.tmp.38, 3
  %rcc.tmp.40 = load i32, ptr %result
  %rcc.tmp.41 = add i32 %rcc.tmp.40, %rcc.tmp.39
  store i32 %rcc.tmp.41, ptr %result
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 2
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.47 = load i32, ptr %result
  ret i32 %rcc.tmp.47
}
define void @MathEngine.initialize_fft_data.(%MathEngine* %self.tmp, i32 %size.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %MathEngine, ptr %rcc.tmp.3, i32 0, i32 13
  %rcc.tmp.5 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %size..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 11
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [512 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.22 = getelementptr %MathEngine, ptr %rcc.tmp.21, i32 0, i32 12
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [512 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @MathEngine.compute_fft.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %n = alloca i32 
  %j = alloca i32 
  %i = alloca i32 
  %bit = alloca i32 
  %temp_real = alloca i32 
  %temp_imag = alloca i32 
  %length = alloca i32 
  %half_length = alloca i32 
  %angle_step = alloca i32 
  %k = alloca i32 
  %angle = alloca i32 
  %cos_val = alloca i32 
  %sin_val = alloca i32 
  %even_idx = alloca i32 
  %odd_idx = alloca i32 
  %even_real = alloca i32 
  %even_imag = alloca i32 
  %odd_real = alloca i32 
  %odd_imag = alloca i32 
  %twiddle_real = alloca i32 
  %twiddle_imag = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %MathEngine, ptr %rcc.tmp.2, i32 0, i32 13
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  store i32 %rcc.tmp.4, ptr %n
  store i32 0, ptr %j
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %n
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %n
  %rcc.tmp.15 = sdiv i32 %rcc.tmp.14, 2
  store i32 %rcc.tmp.15, ptr %bit
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = load i32, ptr %bit
  %rcc.tmp.20 = icmp sge i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.23 = load i32, ptr %bit
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = sub i32 %rcc.tmp.24, %rcc.tmp.23
  store i32 %rcc.tmp.25, ptr %j
  %rcc.tmp.27 = load i32, ptr %bit
  %rcc.tmp.28 = sdiv i32 %rcc.tmp.27, 2
  store i32 %rcc.tmp.28, ptr %bit
  br label %while.cond.2
while.end.2:
  %rcc.tmp.31 = load i32, ptr %bit
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = add i32 %rcc.tmp.32, %rcc.tmp.31
  store i32 %rcc.tmp.33, ptr %j
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %j
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %MathEngine, ptr %rcc.tmp.39, i32 0, i32 11
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [512 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %temp_real
  %rcc.tmp.46 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %MathEngine, ptr %rcc.tmp.46, i32 0, i32 11
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [512 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.52 = getelementptr %MathEngine, ptr %rcc.tmp.51, i32 0, i32 11
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [512 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %rcc.tmp.50
  %rcc.tmp.58 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %MathEngine, ptr %rcc.tmp.58, i32 0, i32 11
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [512 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %temp_real
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.66 = getelementptr %MathEngine, ptr %rcc.tmp.65, i32 0, i32 12
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [512 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %temp_imag
  %rcc.tmp.72 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.73 = getelementptr %MathEngine, ptr %rcc.tmp.72, i32 0, i32 12
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [512 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.78 = getelementptr %MathEngine, ptr %rcc.tmp.77, i32 0, i32 12
  %rcc.tmp.79 = load i32, ptr %j
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [512 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %rcc.tmp.76
  %rcc.tmp.84 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.85 = getelementptr %MathEngine, ptr %rcc.tmp.84, i32 0, i32 12
  %rcc.tmp.86 = load i32, ptr %j
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [512 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %temp_imag
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  br label %while.cond
while.end:
  store i32 2, ptr %length
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.99 = load i32, ptr %length
  %rcc.tmp.100 = load i32, ptr %n
  %rcc.tmp.101 = icmp sle i32 %rcc.tmp.99, %rcc.tmp.100
  br i1 %rcc.tmp.101, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.104 = load i32, ptr %length
  %rcc.tmp.105 = sdiv i32 %rcc.tmp.104, 2
  store i32 %rcc.tmp.105, ptr %half_length
  %rcc.tmp.107 = load i32, ptr %length
  %rcc.tmp.108 = sdiv i32 6283, %rcc.tmp.107
  store i32 %rcc.tmp.108, ptr %angle_step
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = load i32, ptr %n
  %rcc.tmp.114 = icmp slt i32 %rcc.tmp.112, %rcc.tmp.113
  br i1 %rcc.tmp.114, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %k
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.119 = load i32, ptr %k
  %rcc.tmp.120 = load i32, ptr %half_length
  %rcc.tmp.121 = icmp slt i32 %rcc.tmp.119, %rcc.tmp.120
  br i1 %rcc.tmp.121, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.124 = load i32, ptr %k
  %rcc.tmp.125 = load i32, ptr %angle_step
  %rcc.tmp.126 = mul i32 %rcc.tmp.124, %rcc.tmp.125
  store i32 %rcc.tmp.126, ptr %angle
  %rcc.tmp.128 = load i32, ptr %angle
  %rcc.tmp.129 = load i32, ptr %angle
  %rcc.tmp.130 = mul i32 %rcc.tmp.128, %rcc.tmp.129
  %rcc.tmp.131 = sdiv i32 %rcc.tmp.130, 2000
  %rcc.tmp.132 = sub i32 1000, %rcc.tmp.131
  store i32 %rcc.tmp.132, ptr %cos_val
  %rcc.tmp.134 = load i32, ptr %angle
  %rcc.tmp.135 = load i32, ptr %angle
  %rcc.tmp.136 = load i32, ptr %angle
  %rcc.tmp.137 = mul i32 %rcc.tmp.135, %rcc.tmp.136
  %rcc.tmp.138 = sdiv i32 %rcc.tmp.137, 6000
  %rcc.tmp.139 = load i32, ptr %angle
  %rcc.tmp.140 = mul i32 %rcc.tmp.138, %rcc.tmp.139
  %rcc.tmp.141 = sub i32 %rcc.tmp.134, %rcc.tmp.140
  store i32 %rcc.tmp.141, ptr %sin_val
  %rcc.tmp.143 = load i32, ptr %i
  %rcc.tmp.144 = load i32, ptr %k
  %rcc.tmp.145 = add i32 %rcc.tmp.143, %rcc.tmp.144
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  store i32 %rcc.tmp.146, ptr %even_idx
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = load i32, ptr %k
  %rcc.tmp.150 = add i32 %rcc.tmp.148, %rcc.tmp.149
  %rcc.tmp.151 = load i32, ptr %half_length
  %rcc.tmp.152 = add i32 %rcc.tmp.150, %rcc.tmp.151
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 0
  store i32 %rcc.tmp.153, ptr %odd_idx
  %rcc.tmp.155 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.156 = getelementptr %MathEngine, ptr %rcc.tmp.155, i32 0, i32 11
  %rcc.tmp.157 = load i32, ptr %even_idx
  %rcc.tmp.158 = getelementptr [512 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.157
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.158
  store i32 %rcc.tmp.159, ptr %even_real
  %rcc.tmp.161 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.162 = getelementptr %MathEngine, ptr %rcc.tmp.161, i32 0, i32 12
  %rcc.tmp.163 = load i32, ptr %even_idx
  %rcc.tmp.164 = getelementptr [512 x i32], ptr %rcc.tmp.162, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.165 = load i32, ptr %rcc.tmp.164
  store i32 %rcc.tmp.165, ptr %even_imag
  %rcc.tmp.167 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.168 = getelementptr %MathEngine, ptr %rcc.tmp.167, i32 0, i32 11
  %rcc.tmp.169 = load i32, ptr %odd_idx
  %rcc.tmp.170 = getelementptr [512 x i32], ptr %rcc.tmp.168, i32 0, i32 %rcc.tmp.169
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.170
  store i32 %rcc.tmp.171, ptr %odd_real
  %rcc.tmp.173 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.174 = getelementptr %MathEngine, ptr %rcc.tmp.173, i32 0, i32 12
  %rcc.tmp.175 = load i32, ptr %odd_idx
  %rcc.tmp.176 = getelementptr [512 x i32], ptr %rcc.tmp.174, i32 0, i32 %rcc.tmp.175
  %rcc.tmp.177 = load i32, ptr %rcc.tmp.176
  store i32 %rcc.tmp.177, ptr %odd_imag
  %rcc.tmp.179 = load i32, ptr %odd_real
  %rcc.tmp.180 = sdiv i32 %rcc.tmp.179, 1000
  %rcc.tmp.181 = load i32, ptr %cos_val
  %rcc.tmp.182 = mul i32 %rcc.tmp.180, %rcc.tmp.181
  %rcc.tmp.183 = load i32, ptr %odd_imag
  %rcc.tmp.184 = sdiv i32 %rcc.tmp.183, 1000
  %rcc.tmp.185 = load i32, ptr %sin_val
  %rcc.tmp.186 = mul i32 %rcc.tmp.184, %rcc.tmp.185
  %rcc.tmp.187 = sub i32 %rcc.tmp.182, %rcc.tmp.186
  store i32 %rcc.tmp.187, ptr %twiddle_real
  %rcc.tmp.189 = load i32, ptr %odd_real
  %rcc.tmp.190 = sdiv i32 %rcc.tmp.189, 1000
  %rcc.tmp.191 = load i32, ptr %sin_val
  %rcc.tmp.192 = mul i32 %rcc.tmp.190, %rcc.tmp.191
  %rcc.tmp.193 = load i32, ptr %odd_imag
  %rcc.tmp.194 = sdiv i32 %rcc.tmp.193, 1000
  %rcc.tmp.195 = load i32, ptr %cos_val
  %rcc.tmp.196 = mul i32 %rcc.tmp.194, %rcc.tmp.195
  %rcc.tmp.197 = add i32 %rcc.tmp.192, %rcc.tmp.196
  store i32 %rcc.tmp.197, ptr %twiddle_imag
  %rcc.tmp.199 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.200 = getelementptr %MathEngine, ptr %rcc.tmp.199, i32 0, i32 11
  %rcc.tmp.201 = load i32, ptr %even_idx
  %rcc.tmp.202 = getelementptr [512 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.201
  %rcc.tmp.203 = load i32, ptr %even_real
  %rcc.tmp.204 = load i32, ptr %twiddle_real
  %rcc.tmp.205 = add i32 %rcc.tmp.203, %rcc.tmp.204
  store i32 %rcc.tmp.205, ptr %rcc.tmp.202
  %rcc.tmp.207 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.208 = getelementptr %MathEngine, ptr %rcc.tmp.207, i32 0, i32 12
  %rcc.tmp.209 = load i32, ptr %even_idx
  %rcc.tmp.210 = getelementptr [512 x i32], ptr %rcc.tmp.208, i32 0, i32 %rcc.tmp.209
  %rcc.tmp.211 = load i32, ptr %even_imag
  %rcc.tmp.212 = load i32, ptr %twiddle_imag
  %rcc.tmp.213 = add i32 %rcc.tmp.211, %rcc.tmp.212
  store i32 %rcc.tmp.213, ptr %rcc.tmp.210
  %rcc.tmp.215 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.216 = getelementptr %MathEngine, ptr %rcc.tmp.215, i32 0, i32 11
  %rcc.tmp.217 = load i32, ptr %odd_idx
  %rcc.tmp.218 = getelementptr [512 x i32], ptr %rcc.tmp.216, i32 0, i32 %rcc.tmp.217
  %rcc.tmp.219 = load i32, ptr %even_real
  %rcc.tmp.220 = load i32, ptr %twiddle_real
  %rcc.tmp.221 = sub i32 %rcc.tmp.219, %rcc.tmp.220
  store i32 %rcc.tmp.221, ptr %rcc.tmp.218
  %rcc.tmp.223 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.224 = getelementptr %MathEngine, ptr %rcc.tmp.223, i32 0, i32 12
  %rcc.tmp.225 = load i32, ptr %odd_idx
  %rcc.tmp.226 = getelementptr [512 x i32], ptr %rcc.tmp.224, i32 0, i32 %rcc.tmp.225
  %rcc.tmp.227 = load i32, ptr %even_imag
  %rcc.tmp.228 = load i32, ptr %twiddle_imag
  %rcc.tmp.229 = sub i32 %rcc.tmp.227, %rcc.tmp.228
  store i32 %rcc.tmp.229, ptr %rcc.tmp.226
  %rcc.tmp.231 = load i32, ptr %k
  %rcc.tmp.232 = add i32 %rcc.tmp.231, 1
  store i32 %rcc.tmp.232, ptr %k
  br label %while.cond.5
while.end.5:
  %rcc.tmp.235 = load i32, ptr %length
  %rcc.tmp.236 = load i32, ptr %i
  %rcc.tmp.237 = add i32 %rcc.tmp.236, %rcc.tmp.235
  store i32 %rcc.tmp.237, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.240 = load i32, ptr %length
  %rcc.tmp.241 = mul i32 %rcc.tmp.240, 2
  store i32 %rcc.tmp.241, ptr %length
  br label %while.cond.3
while.end.3:
  ret void
}
define void @MathEngine.generate_primes.(%MathEngine* %self.tmp, i32 %limit.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %limit..tmp = alloca i32 
  %is_prime = alloca [10000 x i1] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 10000
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [10000 x i1], ptr %is_prime, i32 0, i32 %rcc.tmp.8
  store i1 1, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.14 = getelementptr [10000 x i1], ptr %is_prime, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10000 x i1], ptr %is_prime, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.16
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = mul i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %limit..tmp
  %rcc.tmp.24 = icmp sle i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [10000 x i1], ptr %is_prime, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i1, ptr %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = mul i32 %rcc.tmp.32, %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = load i32, ptr %limit..tmp
  %rcc.tmp.39 = icmp sle i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.42 = load i32, ptr %j
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [10000 x i1], ptr %is_prime, i32 0, i32 %rcc.tmp.43
  store i1 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.47, %rcc.tmp.46
  store i32 %rcc.tmp.48, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.57 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.58 = getelementptr %MathEngine, ptr %rcc.tmp.57, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.58
  store i32 2, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = load i32, ptr %limit..tmp
  %rcc.tmp.64 = icmp sle i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.66 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.67 = getelementptr %MathEngine, ptr %rcc.tmp.66, i32 0, i32 15
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.68, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.71 = phi i1 [0, %while.cond.3], [%rcc.tmp.69, %and.rhs]
  br i1 %rcc.tmp.71, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [10000 x i1], ptr %is_prime, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i1, ptr %rcc.tmp.76
  br i1 %rcc.tmp.77, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.79 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.80 = getelementptr %MathEngine, ptr %rcc.tmp.79, i32 0, i32 14
  %rcc.tmp.81 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.82 = getelementptr %MathEngine, ptr %rcc.tmp.81, i32 0, i32 15
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [1000 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %i
  store i32 %rcc.tmp.86, ptr %rcc.tmp.85
  %rcc.tmp.88 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.89 = getelementptr %MathEngine, ptr %rcc.tmp.88, i32 0, i32 15
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %rcc.tmp.89
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define i32 @MathEngine.prime_factorize.(%MathEngine* %self.tmp, i32 %number.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %number..tmp = alloca i32 
  %n = alloca i32 
  %factor_count = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %number.tmp, ptr %number..tmp
  %rcc.tmp.3 = load i32, ptr %number..tmp
  store i32 %rcc.tmp.3, ptr %n
  store i32 0, ptr %factor_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %MathEngine, ptr %rcc.tmp.9, i32 0, i32 15
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %MathEngine, ptr %rcc.tmp.20, i32 0, i32 14
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [1000 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = mul i32 %rcc.tmp.19, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %n
  %rcc.tmp.28 = icmp sle i32 %rcc.tmp.26, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.cond], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %n
  %rcc.tmp.35 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %MathEngine, ptr %rcc.tmp.35, i32 0, i32 14
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [1000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = srem i32 %rcc.tmp.34, %rcc.tmp.40
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.41, 0
  br i1 %rcc.tmp.42, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.45 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %MathEngine, ptr %rcc.tmp.45, i32 0, i32 16
  %rcc.tmp.47 = getelementptr [100 x [20 x i32]], ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %factor_count
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [20 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.52 = getelementptr %MathEngine, ptr %rcc.tmp.51, i32 0, i32 14
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [1000 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %rcc.tmp.50
  %rcc.tmp.58 = load i32, ptr %factor_count
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %factor_count
  %rcc.tmp.61 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.62 = getelementptr %MathEngine, ptr %rcc.tmp.61, i32 0, i32 14
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [1000 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %n
  %rcc.tmp.68 = sdiv i32 %rcc.tmp.67, %rcc.tmp.66
  store i32 %rcc.tmp.68, ptr %n
  br label %while.cond.2
while.end.2:
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.75 = load i32, ptr %n
  %rcc.tmp.76 = icmp sgt i32 %rcc.tmp.75, 1
  br i1 %rcc.tmp.76, label %if.then, label %if.else
if.then:
  %rcc.tmp.78 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.79 = getelementptr %MathEngine, ptr %rcc.tmp.78, i32 0, i32 16
  %rcc.tmp.80 = getelementptr [100 x [20 x i32]], ptr %rcc.tmp.79, i32 0, i32 0
  %rcc.tmp.81 = load i32, ptr %factor_count
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [20 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %n
  store i32 %rcc.tmp.84, ptr %rcc.tmp.83
  %rcc.tmp.86 = load i32, ptr %factor_count
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %factor_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.91 = load i32, ptr %factor_count
  ret i32 %rcc.tmp.91
}
define void @MathEngine.initialize_data_series.(%MathEngine* %self.tmp, i32 %length.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %length..tmp = alloca i32 
  %i = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 %length.tmp, ptr %length..tmp
  %rcc.tmp.3 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %MathEngine, ptr %rcc.tmp.3, i32 0, i32 18
  %rcc.tmp.5 = load i32, ptr %length..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %length..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %MathEngine, ptr %rcc.tmp.14, i32 0, i32 17
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [2000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @MathEngine.calculate_moments.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %sum = alloca i32 
  %i = alloca i32 
  %mean = alloca i32 
  %sum2 = alloca i32 
  %sum3 = alloca i32 
  %sum4 = alloca i32 
  %diff = alloca i32 
  %diff2 = alloca i32 
  %diff3 = alloca i32 
  %diff4 = alloca i32 
  %min_val = alloca i32 
  %max_val = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %MathEngine, ptr %rcc.tmp.6, i32 0, i32 18
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %MathEngine, ptr %rcc.tmp.12, i32 0, i32 17
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [2000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %sum
  %rcc.tmp.19 = add i32 %rcc.tmp.18, %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %sum
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load i32, ptr %sum
  %rcc.tmp.26 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.27 = getelementptr %MathEngine, ptr %rcc.tmp.26, i32 0, i32 18
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = sdiv i32 %rcc.tmp.25, %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %mean
  %rcc.tmp.31 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %MathEngine, ptr %rcc.tmp.31, i32 0, i32 19
  %rcc.tmp.33 = getelementptr [10 x i32], ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %mean
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  store i32 0, ptr %sum2
  store i32 0, ptr %sum3
  store i32 0, ptr %sum4
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.43 = getelementptr %MathEngine, ptr %rcc.tmp.42, i32 0, i32 18
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.48 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %MathEngine, ptr %rcc.tmp.48, i32 0, i32 17
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [2000 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %mean
  %rcc.tmp.55 = sub i32 %rcc.tmp.53, %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %diff
  %rcc.tmp.57 = load i32, ptr %diff
  %rcc.tmp.58 = load i32, ptr %diff
  %rcc.tmp.59 = mul i32 %rcc.tmp.57, %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %diff2
  %rcc.tmp.61 = load i32, ptr %diff2
  %rcc.tmp.62 = load i32, ptr %diff
  %rcc.tmp.63 = mul i32 %rcc.tmp.61, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %diff3
  %rcc.tmp.65 = load i32, ptr %diff3
  %rcc.tmp.66 = load i32, ptr %diff
  %rcc.tmp.67 = mul i32 %rcc.tmp.65, %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %diff4
  %rcc.tmp.69 = load i32, ptr %diff2
  %rcc.tmp.70 = load i32, ptr %sum2
  %rcc.tmp.71 = add i32 %rcc.tmp.70, %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %sum2
  %rcc.tmp.73 = load i32, ptr %diff3
  %rcc.tmp.74 = load i32, ptr %sum3
  %rcc.tmp.75 = add i32 %rcc.tmp.74, %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %sum3
  %rcc.tmp.77 = load i32, ptr %diff4
  %rcc.tmp.78 = load i32, ptr %sum4
  %rcc.tmp.79 = add i32 %rcc.tmp.78, %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %sum4
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.85 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.86 = getelementptr %MathEngine, ptr %rcc.tmp.85, i32 0, i32 19
  %rcc.tmp.87 = getelementptr [10 x i32], ptr %rcc.tmp.86, i32 0, i32 1
  %rcc.tmp.88 = load i32, ptr %sum2
  %rcc.tmp.89 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.90 = getelementptr %MathEngine, ptr %rcc.tmp.89, i32 0, i32 18
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = sdiv i32 %rcc.tmp.88, %rcc.tmp.91
  store i32 %rcc.tmp.92, ptr %rcc.tmp.87
  %rcc.tmp.94 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %MathEngine, ptr %rcc.tmp.94, i32 0, i32 19
  %rcc.tmp.96 = getelementptr [10 x i32], ptr %rcc.tmp.95, i32 0, i32 2
  %rcc.tmp.97 = load i32, ptr %sum3
  %rcc.tmp.98 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.99 = getelementptr %MathEngine, ptr %rcc.tmp.98, i32 0, i32 18
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = sdiv i32 %rcc.tmp.97, %rcc.tmp.100
  store i32 %rcc.tmp.101, ptr %rcc.tmp.96
  %rcc.tmp.103 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.104 = getelementptr %MathEngine, ptr %rcc.tmp.103, i32 0, i32 19
  %rcc.tmp.105 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 3
  %rcc.tmp.106 = load i32, ptr %sum4
  %rcc.tmp.107 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.108 = getelementptr %MathEngine, ptr %rcc.tmp.107, i32 0, i32 18
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = sdiv i32 %rcc.tmp.106, %rcc.tmp.109
  store i32 %rcc.tmp.110, ptr %rcc.tmp.105
  %rcc.tmp.112 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.113 = getelementptr %MathEngine, ptr %rcc.tmp.112, i32 0, i32 17
  %rcc.tmp.114 = getelementptr [2000 x i32], ptr %rcc.tmp.113, i32 0, i32 0
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  store i32 %rcc.tmp.115, ptr %min_val
  %rcc.tmp.117 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.118 = getelementptr %MathEngine, ptr %rcc.tmp.117, i32 0, i32 17
  %rcc.tmp.119 = getelementptr [2000 x i32], ptr %rcc.tmp.118, i32 0, i32 0
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  store i32 %rcc.tmp.120, ptr %max_val
  store i32 1, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.126 = getelementptr %MathEngine, ptr %rcc.tmp.125, i32 0, i32 18
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = icmp slt i32 %rcc.tmp.124, %rcc.tmp.127
  br i1 %rcc.tmp.128, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.131 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.132 = getelementptr %MathEngine, ptr %rcc.tmp.131, i32 0, i32 17
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [2000 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %min_val
  %rcc.tmp.138 = icmp slt i32 %rcc.tmp.136, %rcc.tmp.137
  br i1 %rcc.tmp.138, label %if.then, label %if.else
if.then:
  %rcc.tmp.140 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.141 = getelementptr %MathEngine, ptr %rcc.tmp.140, i32 0, i32 17
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = getelementptr [2000 x i32], ptr %rcc.tmp.141, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %rcc.tmp.144
  store i32 %rcc.tmp.145, ptr %min_val
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.149 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.150 = getelementptr %MathEngine, ptr %rcc.tmp.149, i32 0, i32 17
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = getelementptr [2000 x i32], ptr %rcc.tmp.150, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = load i32, ptr %max_val
  %rcc.tmp.156 = icmp sgt i32 %rcc.tmp.154, %rcc.tmp.155
  br i1 %rcc.tmp.156, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.158 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.159 = getelementptr %MathEngine, ptr %rcc.tmp.158, i32 0, i32 17
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = getelementptr [2000 x i32], ptr %rcc.tmp.159, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %max_val
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.167 = load i32, ptr %i
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  store i32 %rcc.tmp.168, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.171 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.172 = getelementptr %MathEngine, ptr %rcc.tmp.171, i32 0, i32 19
  %rcc.tmp.173 = getelementptr [10 x i32], ptr %rcc.tmp.172, i32 0, i32 4
  %rcc.tmp.174 = load i32, ptr %min_val
  store i32 %rcc.tmp.174, ptr %rcc.tmp.173
  %rcc.tmp.176 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.177 = getelementptr %MathEngine, ptr %rcc.tmp.176, i32 0, i32 19
  %rcc.tmp.178 = getelementptr [10 x i32], ptr %rcc.tmp.177, i32 0, i32 5
  %rcc.tmp.179 = load i32, ptr %max_val
  store i32 %rcc.tmp.179, ptr %rcc.tmp.178
  %rcc.tmp.181 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.182 = getelementptr %MathEngine, ptr %rcc.tmp.181, i32 0, i32 19
  %rcc.tmp.183 = getelementptr [10 x i32], ptr %rcc.tmp.182, i32 0, i32 6
  %rcc.tmp.184 = load i32, ptr %max_val
  %rcc.tmp.185 = load i32, ptr %min_val
  %rcc.tmp.186 = sub i32 %rcc.tmp.184, %rcc.tmp.185
  store i32 %rcc.tmp.186, ptr %rcc.tmp.183
  ret void
}
define void @MathEngine.perform_comprehensive_analysis.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %det = alloca i32 
  %trapezoidal_result = alloca i32 
  %simpson_result = alloca i32 
  %fft_magnitude = alloca i32 
  %i = alloca i32 
  %real = alloca i32 
  %imag = alloca i32 
  %factors = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %MathEngine*, ptr %self..tmp
  call void @MathEngine.matrix_multiply.(%MathEngine* %rcc.tmp.2)
  %rcc.tmp.4 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.5 = call i32 @MathEngine.calculate_determinant.(%MathEngine* %rcc.tmp.4)
  store i32 %rcc.tmp.5, ptr %det
  %rcc.tmp.7 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %MathEngine, ptr %rcc.tmp.7, i32 0, i32 21
  %rcc.tmp.9 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %MathEngine, ptr %rcc.tmp.9, i32 0, i32 22
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %det
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %MathEngine, ptr %rcc.tmp.16, i32 0, i32 22
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %rcc.tmp.17
  %rcc.tmp.21 = load %MathEngine*, ptr %self..tmp
  call void @MathEngine.matrix_operations_suite.(%MathEngine* %rcc.tmp.21)
  %rcc.tmp.23 = load %MathEngine*, ptr %self..tmp
  call void @MathEngine.find_polynomial_roots.(%MathEngine* %rcc.tmp.23)
  %rcc.tmp.25 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %MathEngine, ptr %rcc.tmp.25, i32 0, i32 21
  %rcc.tmp.27 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %MathEngine, ptr %rcc.tmp.27, i32 0, i32 22
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [50 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %MathEngine, ptr %rcc.tmp.32, i32 0, i32 7
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.31
  %rcc.tmp.36 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.37 = getelementptr %MathEngine, ptr %rcc.tmp.36, i32 0, i32 22
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %rcc.tmp.37
  %rcc.tmp.41 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.42 = call i32 @MathEngine.trapezoidal_integration.(%MathEngine* %rcc.tmp.41, i32 1)
  store i32 %rcc.tmp.42, ptr %trapezoidal_result
  %rcc.tmp.44 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.45 = call i32 @MathEngine.simpson_integration.(%MathEngine* %rcc.tmp.44, i32 1)
  store i32 %rcc.tmp.45, ptr %simpson_result
  %rcc.tmp.47 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %MathEngine, ptr %rcc.tmp.47, i32 0, i32 10
  %rcc.tmp.49 = getelementptr [10 x i32], ptr %rcc.tmp.48, i32 0, i32 0
  %rcc.tmp.50 = load i32, ptr %trapezoidal_result
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %MathEngine, ptr %rcc.tmp.52, i32 0, i32 10
  %rcc.tmp.54 = getelementptr [10 x i32], ptr %rcc.tmp.53, i32 0, i32 1
  %rcc.tmp.55 = load i32, ptr %simpson_result
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = load %MathEngine*, ptr %self..tmp
  call void @MathEngine.compute_fft.(%MathEngine* %rcc.tmp.57)
  store i32 0, ptr %fft_magnitude
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %MathEngine, ptr %rcc.tmp.63, i32 0, i32 13
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.62, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.69 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.70 = getelementptr %MathEngine, ptr %rcc.tmp.69, i32 0, i32 11
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [512 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %real
  %rcc.tmp.76 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %MathEngine, ptr %rcc.tmp.76, i32 0, i32 12
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [512 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %imag
  %rcc.tmp.83 = load i32, ptr %real
  %rcc.tmp.84 = load i32, ptr %real
  %rcc.tmp.85 = mul i32 %rcc.tmp.83, %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %imag
  %rcc.tmp.87 = load i32, ptr %imag
  %rcc.tmp.88 = mul i32 %rcc.tmp.86, %rcc.tmp.87
  %rcc.tmp.89 = add i32 %rcc.tmp.85, %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %fft_magnitude
  %rcc.tmp.91 = add i32 %rcc.tmp.90, %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %fft_magnitude
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.97 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.98 = getelementptr %MathEngine, ptr %rcc.tmp.97, i32 0, i32 21
  %rcc.tmp.99 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %MathEngine, ptr %rcc.tmp.99, i32 0, i32 22
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [50 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %fft_magnitude
  store i32 %rcc.tmp.104, ptr %rcc.tmp.103
  %rcc.tmp.106 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.107 = getelementptr %MathEngine, ptr %rcc.tmp.106, i32 0, i32 22
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.107
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %rcc.tmp.107
  %rcc.tmp.111 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.112 = call i32 @MathEngine.prime_factorize.(%MathEngine* %rcc.tmp.111, i32 12345)
  store i32 %rcc.tmp.112, ptr %factors
  %rcc.tmp.114 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.115 = getelementptr %MathEngine, ptr %rcc.tmp.114, i32 0, i32 21
  %rcc.tmp.116 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %MathEngine, ptr %rcc.tmp.116, i32 0, i32 22
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [50 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %factors
  store i32 %rcc.tmp.121, ptr %rcc.tmp.120
  %rcc.tmp.123 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.124 = getelementptr %MathEngine, ptr %rcc.tmp.123, i32 0, i32 22
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.124
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 1
  store i32 %rcc.tmp.126, ptr %rcc.tmp.124
  %rcc.tmp.128 = load %MathEngine*, ptr %self..tmp
  call void @MathEngine.calculate_moments.(%MathEngine* %rcc.tmp.128)
  %rcc.tmp.130 = load %MathEngine*, ptr %self..tmp
  call void @MathEngine.output_comprehensive_results.(%MathEngine* %rcc.tmp.130)
  ret void
}
define void @MathEngine.output_comprehensive_results.(%MathEngine* %self.tmp) {
entry:
  %self..tmp = alloca %MathEngine* 
  %i = alloca i32 
  %complexity_score = alloca i32 
  store %MathEngine* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %MathEngine, ptr %rcc.tmp.5, i32 0, i32 22
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %MathEngine, ptr %rcc.tmp.11, i32 0, i32 21
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [50 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 7
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.28 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %MathEngine, ptr %rcc.tmp.28, i32 0, i32 19
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  call void @printlnInt.(i32 %rcc.tmp.33)
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.39 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %MathEngine, ptr %rcc.tmp.39, i32 0, i32 10
  %rcc.tmp.41 = getelementptr [10 x i32], ptr %rcc.tmp.40, i32 0, i32 0
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  call void @printlnInt.(i32 %rcc.tmp.42)
  %rcc.tmp.44 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %MathEngine, ptr %rcc.tmp.44, i32 0, i32 10
  %rcc.tmp.46 = getelementptr [10 x i32], ptr %rcc.tmp.45, i32 0, i32 1
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  call void @printlnInt.(i32 %rcc.tmp.47)
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %MathEngine, ptr %rcc.tmp.52, i32 0, i32 7
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = icmp slt i32 %rcc.tmp.51, %rcc.tmp.54
  br i1 %rcc.tmp.55, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 5
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %while.cond.3], [%rcc.tmp.58, %and.rhs]
  br i1 %rcc.tmp.60, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.63 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %MathEngine, ptr %rcc.tmp.63, i32 0, i32 6
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [50 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  call void @printlnInt.(i32 %rcc.tmp.68)
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.74 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.75 = getelementptr %MathEngine, ptr %rcc.tmp.74, i32 0, i32 15
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  call void @printlnInt.(i32 %rcc.tmp.76)
  %rcc.tmp.78 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.79 = getelementptr %MathEngine, ptr %rcc.tmp.78, i32 0, i32 21
  %rcc.tmp.80 = getelementptr [50 x i32], ptr %rcc.tmp.79, i32 0, i32 0
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.83 = getelementptr %MathEngine, ptr %rcc.tmp.82, i32 0, i32 19
  %rcc.tmp.84 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 0
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.81, %rcc.tmp.85
  %rcc.tmp.87 = load %MathEngine*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %MathEngine, ptr %rcc.tmp.87, i32 0, i32 10
  %rcc.tmp.89 = getelementptr [10 x i32], ptr %rcc.tmp.88, i32 0, i32 0
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.86, %rcc.tmp.90
  %rcc.tmp.92 = sdiv i32 %rcc.tmp.91, 3
  store i32 %rcc.tmp.92, ptr %complexity_score
  %rcc.tmp.94 = load i32, ptr %complexity_score
  call void @printlnInt.(i32 %rcc.tmp.94)
  ret void
}
define void @MathEngine.new.(%MathEngine* sret(%MathEngine) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %fill.idx.7 = alloca i32 
  %fill.idx.8 = alloca i32 
  %fill.idx.9 = alloca i32 
  %fill.idx.10 = alloca i32 
  %fill.idx.11 = alloca i32 
  %fill.idx.12 = alloca i32 
  %fill.idx.13 = alloca i32 
  %fill.idx.14 = alloca i32 
  %fill.idx.15 = alloca i32 
  %fill.idx.16 = alloca i32 
  %fill.idx.17 = alloca i32 
  %rcc.tmp.1 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.11 = load i32, ptr %fill.idx.2
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 100
  br i1 %rcc.tmp.12, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.20 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.20, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.23 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 100
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.33 = load i32, ptr %fill.idx.4
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 100
  br i1 %rcc.tmp.34, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.36 = load i32, ptr %fill.idx.4
  %rcc.tmp.37 = getelementptr [100 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.36
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.39, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.42 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.42, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.45 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.48 = load i32, ptr %fill.idx.5
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 100
  br i1 %rcc.tmp.49, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.51 = load i32, ptr %fill.idx.5
  %rcc.tmp.52 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.51
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.55 = load i32, ptr %fill.idx.6
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 100
  br i1 %rcc.tmp.56, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.58 = load i32, ptr %fill.idx.6
  %rcc.tmp.59 = getelementptr [100 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.58
  store i32 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.61, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.64 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.64, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.67 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.72 = load i32, ptr %fill.idx.7
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.72, 200
  br i1 %rcc.tmp.73, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.75 = load i32, ptr %fill.idx.7
  %rcc.tmp.76 = getelementptr [200 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.75
  store i32 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.78, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  %rcc.tmp.81 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.86 = load i32, ptr %fill.idx.8
  %rcc.tmp.87 = icmp slt i32 %rcc.tmp.86, 50
  br i1 %rcc.tmp.87, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.89 = load i32, ptr %fill.idx.8
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.89
  store i32 0, ptr %rcc.tmp.90
  %rcc.tmp.92 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.92, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  %rcc.tmp.95 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 8
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.100 = load i32, ptr %fill.idx.9
  %rcc.tmp.101 = icmp slt i32 %rcc.tmp.100, 1000
  br i1 %rcc.tmp.101, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.103 = load i32, ptr %fill.idx.9
  %rcc.tmp.104 = getelementptr [1000 x i32], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.103
  store i32 0, ptr %rcc.tmp.104
  %rcc.tmp.106 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.106, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  %rcc.tmp.109 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 10
  %rcc.tmp.112 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.114
  %rcc.tmp.116 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.116
  %rcc.tmp.118 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.118
  %rcc.tmp.120 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.120
  %rcc.tmp.122 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.122
  %rcc.tmp.124 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.124
  %rcc.tmp.126 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.126
  %rcc.tmp.128 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.128
  %rcc.tmp.130 = getelementptr [10 x i32], ptr %rcc.tmp.111, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 11
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.135 = load i32, ptr %fill.idx.10
  %rcc.tmp.136 = icmp slt i32 %rcc.tmp.135, 512
  br i1 %rcc.tmp.136, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.138 = load i32, ptr %fill.idx.10
  %rcc.tmp.139 = getelementptr [512 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.138
  store i32 0, ptr %rcc.tmp.139
  %rcc.tmp.141 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.141, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  %rcc.tmp.144 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 12
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.147 = load i32, ptr %fill.idx.11
  %rcc.tmp.148 = icmp slt i32 %rcc.tmp.147, 512
  br i1 %rcc.tmp.148, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.150 = load i32, ptr %fill.idx.11
  %rcc.tmp.151 = getelementptr [512 x i32], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.150
  store i32 0, ptr %rcc.tmp.151
  %rcc.tmp.153 = add i32 %rcc.tmp.150, 1
  store i32 %rcc.tmp.153, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  %rcc.tmp.156 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.156
  %rcc.tmp.158 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 14
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.161 = load i32, ptr %fill.idx.12
  %rcc.tmp.162 = icmp slt i32 %rcc.tmp.161, 1000
  br i1 %rcc.tmp.162, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.164 = load i32, ptr %fill.idx.12
  %rcc.tmp.165 = getelementptr [1000 x i32], ptr %rcc.tmp.158, i32 0, i32 %rcc.tmp.164
  store i32 0, ptr %rcc.tmp.165
  %rcc.tmp.167 = add i32 %rcc.tmp.164, 1
  store i32 %rcc.tmp.167, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  %rcc.tmp.170 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.170
  %rcc.tmp.172 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 16
  store i32 0, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.cond.13:
  %rcc.tmp.175 = load i32, ptr %fill.idx.13
  %rcc.tmp.176 = icmp slt i32 %rcc.tmp.175, 100
  br i1 %rcc.tmp.176, label %array.fill.body.13, label %array.fill.end.13
array.fill.body.13:
  %rcc.tmp.178 = load i32, ptr %fill.idx.13
  %rcc.tmp.179 = getelementptr [100 x [20 x i32]], ptr %rcc.tmp.172, i32 0, i32 %rcc.tmp.178
  store i32 0, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.cond.14:
  %rcc.tmp.182 = load i32, ptr %fill.idx.14
  %rcc.tmp.183 = icmp slt i32 %rcc.tmp.182, 20
  br i1 %rcc.tmp.183, label %array.fill.body.14, label %array.fill.end.14
array.fill.body.14:
  %rcc.tmp.185 = load i32, ptr %fill.idx.14
  %rcc.tmp.186 = getelementptr [20 x i32], ptr %rcc.tmp.179, i32 0, i32 %rcc.tmp.185
  store i32 0, ptr %rcc.tmp.186
  %rcc.tmp.188 = add i32 %rcc.tmp.185, 1
  store i32 %rcc.tmp.188, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.end.14:
  %rcc.tmp.191 = add i32 %rcc.tmp.178, 1
  store i32 %rcc.tmp.191, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.end.13:
  %rcc.tmp.194 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 17
  store i32 0, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.cond.15:
  %rcc.tmp.197 = load i32, ptr %fill.idx.15
  %rcc.tmp.198 = icmp slt i32 %rcc.tmp.197, 2000
  br i1 %rcc.tmp.198, label %array.fill.body.15, label %array.fill.end.15
array.fill.body.15:
  %rcc.tmp.200 = load i32, ptr %fill.idx.15
  %rcc.tmp.201 = getelementptr [2000 x i32], ptr %rcc.tmp.194, i32 0, i32 %rcc.tmp.200
  store i32 0, ptr %rcc.tmp.201
  %rcc.tmp.203 = add i32 %rcc.tmp.200, 1
  store i32 %rcc.tmp.203, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.end.15:
  %rcc.tmp.206 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 18
  store i32 0, ptr %rcc.tmp.206
  %rcc.tmp.208 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 19
  %rcc.tmp.209 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.209
  %rcc.tmp.211 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.211
  %rcc.tmp.213 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.213
  %rcc.tmp.215 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.215
  %rcc.tmp.217 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.217
  %rcc.tmp.219 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.219
  %rcc.tmp.221 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.221
  %rcc.tmp.223 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.223
  %rcc.tmp.225 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.225
  %rcc.tmp.227 = getelementptr [10 x i32], ptr %rcc.tmp.208, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.227
  %rcc.tmp.229 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 20
  store i32 0, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.cond.16:
  %rcc.tmp.232 = load i32, ptr %fill.idx.16
  %rcc.tmp.233 = icmp slt i32 %rcc.tmp.232, 100
  br i1 %rcc.tmp.233, label %array.fill.body.16, label %array.fill.end.16
array.fill.body.16:
  %rcc.tmp.235 = load i32, ptr %fill.idx.16
  %rcc.tmp.236 = getelementptr [100 x i32], ptr %rcc.tmp.229, i32 0, i32 %rcc.tmp.235
  store i32 0, ptr %rcc.tmp.236
  %rcc.tmp.238 = add i32 %rcc.tmp.235, 1
  store i32 %rcc.tmp.238, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.end.16:
  %rcc.tmp.241 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 21
  store i32 0, ptr %fill.idx.17
  br label %array.fill.cond.17
array.fill.cond.17:
  %rcc.tmp.244 = load i32, ptr %fill.idx.17
  %rcc.tmp.245 = icmp slt i32 %rcc.tmp.244, 50
  br i1 %rcc.tmp.245, label %array.fill.body.17, label %array.fill.end.17
array.fill.body.17:
  %rcc.tmp.247 = load i32, ptr %fill.idx.17
  %rcc.tmp.248 = getelementptr [50 x i32], ptr %rcc.tmp.241, i32 0, i32 %rcc.tmp.247
  store i32 0, ptr %rcc.tmp.248
  %rcc.tmp.250 = add i32 %rcc.tmp.247, 1
  store i32 %rcc.tmp.250, ptr %fill.idx.17
  br label %array.fill.cond.17
array.fill.end.17:
  %rcc.tmp.253 = getelementptr %MathEngine, ptr %ret.slot, i32 0, i32 22
  store i32 0, ptr %rcc.tmp.253
  ret void
}
define void @main() {
entry:
  %math_engine = alloca %MathEngine 
  %matrix_size = alloca i32 
  %poly_degree = alloca i32 
  %integration_points = alloca i32 
  %fft_size = alloca i32 
  %series_length = alloca i32 
  %prime_limit = alloca i32 
  %iterations = alloca i32 
  %total_computational_work = alloca i32 
  %iter = alloca i32 
  %modifier = alloca i32 
  %i = alloca i32 
  %final_complexity = alloca i32 
  call void @MathEngine.new.(%MathEngine* %math_engine)
  %rcc.tmp.2 = call i32 @getInt.()
  store i32 %rcc.tmp.2, ptr %matrix_size
  %rcc.tmp.4 = load i32, ptr %matrix_size
  call void @MathEngine.initialize_matrices.(%MathEngine* %math_engine, i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @getInt.()
  store i32 %rcc.tmp.6, ptr %poly_degree
  %rcc.tmp.8 = load i32, ptr %poly_degree
  call void @MathEngine.initialize_polynomial.(%MathEngine* %math_engine, i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @getInt.()
  store i32 %rcc.tmp.10, ptr %integration_points
  %rcc.tmp.12 = load i32, ptr %integration_points
  call void @MathEngine.initialize_function_data.(%MathEngine* %math_engine, i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @getInt.()
  store i32 %rcc.tmp.14, ptr %fft_size
  %rcc.tmp.16 = load i32, ptr %fft_size
  call void @MathEngine.initialize_fft_data.(%MathEngine* %math_engine, i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @getInt.()
  store i32 %rcc.tmp.18, ptr %series_length
  %rcc.tmp.20 = load i32, ptr %series_length
  call void @MathEngine.initialize_data_series.(%MathEngine* %math_engine, i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @getInt.()
  store i32 %rcc.tmp.22, ptr %prime_limit
  %rcc.tmp.24 = load i32, ptr %prime_limit
  call void @MathEngine.generate_primes.(%MathEngine* %math_engine, i32 %rcc.tmp.24)
  call void @MathEngine.perform_comprehensive_analysis.(%MathEngine* %math_engine)
  %rcc.tmp.27 = call i32 @getInt.()
  store i32 %rcc.tmp.27, ptr %iterations
  store i32 0, ptr %total_computational_work
  store i32 0, ptr %iter
  br label %while.cond
while.cond:
  %rcc.tmp.32 = load i32, ptr %iter
  %rcc.tmp.33 = load i32, ptr %iterations
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.37 = load i32, ptr %iter
  %rcc.tmp.38 = mul i32 %rcc.tmp.37, 13
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 7
  %rcc.tmp.40 = srem i32 %rcc.tmp.39, 100
  store i32 %rcc.tmp.40, ptr %modifier
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = getelementptr %MathEngine, ptr %math_engine, i32 0, i32 18
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.44, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.50 = getelementptr %MathEngine, ptr %math_engine, i32 0, i32 17
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [2000 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = getelementptr %MathEngine, ptr %math_engine, i32 0, i32 17
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [2000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %modifier
  %rcc.tmp.60 = add i32 %rcc.tmp.58, %rcc.tmp.59
  %rcc.tmp.61 = srem i32 %rcc.tmp.60, 10000
  store i32 %rcc.tmp.61, ptr %rcc.tmp.53
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond.2
while.end.2:
  call void @MathEngine.calculate_moments.(%MathEngine* %math_engine)
  %rcc.tmp.68 = getelementptr %MathEngine, ptr %math_engine, i32 0, i32 19
  %rcc.tmp.69 = getelementptr [10 x i32], ptr %rcc.tmp.68, i32 0, i32 0
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr %MathEngine, ptr %math_engine, i32 0, i32 19
  %rcc.tmp.72 = getelementptr [10 x i32], ptr %rcc.tmp.71, i32 0, i32 1
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.70, %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %total_computational_work
  %rcc.tmp.76 = add i32 %rcc.tmp.75, %rcc.tmp.74
  store i32 %rcc.tmp.76, ptr %total_computational_work
  %rcc.tmp.78 = load i32, ptr %iter
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %iter
  %rcc.tmp.81 = load i32, ptr %iter
  call void @printlnInt.(i32 %rcc.tmp.81)
  br label %while.cond
while.end:
  %rcc.tmp.84 = load i32, ptr %total_computational_work
  call void @printlnInt.(i32 %rcc.tmp.84)
  %rcc.tmp.86 = load i32, ptr %total_computational_work
  %rcc.tmp.87 = getelementptr %MathEngine, ptr %math_engine, i32 0, i32 15
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  %rcc.tmp.89 = mul i32 %rcc.tmp.86, %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %iterations
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  %rcc.tmp.92 = sdiv i32 %rcc.tmp.89, %rcc.tmp.91
  store i32 %rcc.tmp.92, ptr %final_complexity
  %rcc.tmp.94 = load i32, ptr %final_complexity
  call void @printlnInt.(i32 %rcc.tmp.94)
  call void @exit.(i32 0)
  ret void
}
