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
define void @init_matrix.([40 x [40 x i32]]* %mat.tmp, i32 %seed.tmp) {
entry:
  %mat..tmp = alloca [40 x [40 x i32]]* 
  %seed..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [40 x [40 x i32]]* %mat.tmp, ptr %mat..tmp
  store i32 %seed.tmp, ptr %seed..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 40
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %j
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 40
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.18 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %j
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [40 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 40
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = add i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %seed..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 100
  store i32 %rcc.tmp.28, ptr %rcc.tmp.21
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
  ret void
}
define void @matrix_multiply.([40 x [40 x i32]]* sret([40 x [40 x i32]]) %ret.slot, [40 x [40 x i32]]* %a.tmp, [40 x [40 x i32]]* %b.tmp) {
entry:
  %a..tmp = alloca [40 x [40 x i32]]* 
  %b..tmp = alloca [40 x [40 x i32]]* 
  %result = alloca [40 x [40 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %sum_u = alloca i32 
  %k = alloca i32 
  %a_u = alloca i32 
  %b_u = alloca i32 
  store [40 x [40 x i32]]* %a.tmp, ptr %a..tmp
  store [40 x [40 x i32]]* %b.tmp, ptr %b..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 40
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.12 = load i32, ptr %fill.idx.2
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 40
  br i1 %rcc.tmp.13, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = getelementptr [40 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.15
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.18, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.21 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.21, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 40
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 40
  br i1 %rcc.tmp.33, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %sum_u
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.39 = load i32, ptr %k
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 40
  br i1 %rcc.tmp.40, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [40 x [40 x i32]]*, ptr %a..tmp
  %rcc.tmp.46 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %k
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [40 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  store i32 %rcc.tmp.51, ptr %a_u
  %rcc.tmp.53 = load i32, ptr %k
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [40 x [40 x i32]]*, ptr %b..tmp
  %rcc.tmp.56 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [40 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  store i32 %rcc.tmp.61, ptr %b_u
  %rcc.tmp.63 = load i32, ptr %sum_u
  %rcc.tmp.64 = load i32, ptr %a_u
  %rcc.tmp.65 = load i32, ptr %b_u
  %rcc.tmp.66 = mul i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.63, %rcc.tmp.66
  %rcc.tmp.68 = srem i32 %rcc.tmp.67, 1000000
  store i32 %rcc.tmp.68, ptr %sum_u
  %rcc.tmp.70 = load i32, ptr %k
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [40 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %sum_u
  store i32 %rcc.tmp.80, ptr %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %j
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.90 = bitcast [40 x [40 x i32]]* %ret.slot to i8*
  %rcc.tmp.91 = bitcast [40 x [40 x i32]]* %result to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.90, i8* %rcc.tmp.91, i32 6400, i1 0)
  ret void
}
define void @apply_stencil.([40 x [40 x i32]]* sret([40 x [40 x i32]]) %ret.slot, [40 x [40 x i32]]* %mat.tmp) {
entry:
  %mat..tmp = alloca [40 x [40 x i32]]* 
  %result = alloca [40 x [40 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %sum = alloca i32 
  store [40 x [40 x i32]]* %mat.tmp, ptr %mat..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 40
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.11 = load i32, ptr %fill.idx.2
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 40
  br i1 %rcc.tmp.12, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = getelementptr [40 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.20 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.20, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = sub i32 40, 1
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = sub i32 40, 1
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %sum
  %rcc.tmp.38 = load i32, ptr %sum
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = sub i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.43 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = sub i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = getelementptr [40 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.38, %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %sum
  %rcc.tmp.51 = load i32, ptr %sum
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = sub i32 %rcc.tmp.53, 1
  %rcc.tmp.55 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.56 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [40 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.51, %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %sum
  %rcc.tmp.63 = load i32, ptr %sum
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = sub i32 %rcc.tmp.65, 1
  %rcc.tmp.67 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.68 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = getelementptr [40 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.63, %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %sum
  %rcc.tmp.76 = load i32, ptr %sum
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.80 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %j
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = sub i32 %rcc.tmp.82, 1
  %rcc.tmp.84 = getelementptr [40 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.76, %rcc.tmp.85
  store i32 %rcc.tmp.86, ptr %sum
  %rcc.tmp.88 = load i32, ptr %sum
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.92 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %j
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [40 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = sub i32 0, 8
  %rcc.tmp.98 = mul i32 %rcc.tmp.96, %rcc.tmp.97
  %rcc.tmp.99 = add i32 %rcc.tmp.88, %rcc.tmp.98
  store i32 %rcc.tmp.99, ptr %sum
  %rcc.tmp.101 = load i32, ptr %sum
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.105 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  %rcc.tmp.109 = getelementptr [40 x i32], ptr %rcc.tmp.105, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.101, %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %sum
  %rcc.tmp.113 = load i32, ptr %sum
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  %rcc.tmp.117 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.118 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.119 = load i32, ptr %j
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = sub i32 %rcc.tmp.120, 1
  %rcc.tmp.122 = getelementptr [40 x i32], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  %rcc.tmp.124 = add i32 %rcc.tmp.113, %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %sum
  %rcc.tmp.126 = load i32, ptr %sum
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  %rcc.tmp.130 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.131 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.132 = load i32, ptr %j
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = getelementptr [40 x i32], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.134
  %rcc.tmp.136 = add i32 %rcc.tmp.126, %rcc.tmp.135
  store i32 %rcc.tmp.136, ptr %sum
  %rcc.tmp.138 = load i32, ptr %sum
  %rcc.tmp.139 = load i32, ptr %i
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 0
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 1
  %rcc.tmp.142 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.143 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.142, i32 0, i32 %rcc.tmp.141
  %rcc.tmp.144 = load i32, ptr %j
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  %rcc.tmp.147 = getelementptr [40 x i32], ptr %rcc.tmp.143, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.147
  %rcc.tmp.149 = add i32 %rcc.tmp.138, %rcc.tmp.148
  store i32 %rcc.tmp.149, ptr %sum
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %j
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [40 x i32], ptr %rcc.tmp.153, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load i32, ptr %sum
  %rcc.tmp.158 = sdiv i32 %rcc.tmp.157, 3
  store i32 %rcc.tmp.158, ptr %rcc.tmp.156
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.163 = load i32, ptr %j
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 0
  %rcc.tmp.165 = getelementptr [40 x i32], ptr %rcc.tmp.162, i32 0, i32 %rcc.tmp.164
  %rcc.tmp.166 = load i32, ptr %rcc.tmp.165
  %rcc.tmp.167 = icmp slt i32 %rcc.tmp.166, 0
  br i1 %rcc.tmp.167, label %if.then, label %if.else
if.then:
  %rcc.tmp.169 = load i32, ptr %i
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.172 = load i32, ptr %j
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 0
  %rcc.tmp.174 = getelementptr [40 x i32], ptr %rcc.tmp.171, i32 0, i32 %rcc.tmp.173
  %rcc.tmp.175 = load i32, ptr %i
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 0
  %rcc.tmp.177 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.176
  %rcc.tmp.178 = load i32, ptr %j
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 0
  %rcc.tmp.180 = getelementptr [40 x i32], ptr %rcc.tmp.177, i32 0, i32 %rcc.tmp.179
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  %rcc.tmp.182 = sub i32 0, %rcc.tmp.181
  store i32 %rcc.tmp.182, ptr %rcc.tmp.174
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.186 = load i32, ptr %j
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 1
  store i32 %rcc.tmp.187, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.190 = load i32, ptr %i
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 1
  store i32 %rcc.tmp.191, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.194 = bitcast [40 x [40 x i32]]* %ret.slot to i8*
  %rcc.tmp.195 = bitcast [40 x [40 x i32]]* %result to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.194, i8* %rcc.tmp.195, i32 6400, i1 0)
  ret void
}
define void @transpose_and_add.([40 x [40 x i32]]* sret([40 x [40 x i32]]) %ret.slot, [40 x [40 x i32]]* %mat.tmp) {
entry:
  %mat..local = alloca [40 x [40 x i32]] 
  %result = alloca [40 x [40 x i32]] 
  %i = alloca i32 
  %j = alloca i32 
  %temp = alloca i32 
  %rcc.tmp.1 = bitcast [40 x [40 x i32]]* %mat..local to i8*
  %rcc.tmp.2 = bitcast [40 x [40 x i32]]* %mat.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 6400, i1 0)
  %rcc.tmp.4 = bitcast [40 x [40 x i32]]* %result to i8*
  %rcc.tmp.5 = bitcast [40 x [40 x i32]]* %mat..local to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.4, i8* %rcc.tmp.5, i32 6400, i1 0)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 40
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  store i32 %rcc.tmp.13, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 40
  br i1 %rcc.tmp.17, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [40 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %temp
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [40 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [40 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %temp
  %rcc.tmp.42 = add i32 %rcc.tmp.40, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %rcc.tmp.33
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [40 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %temp
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [40 x [40 x i32]], ptr %result, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [40 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.50, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %rcc.tmp.49
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
  %rcc.tmp.68 = bitcast [40 x [40 x i32]]* %ret.slot to i8*
  %rcc.tmp.69 = bitcast [40 x [40 x i32]]* %result to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.68, i8* %rcc.tmp.69, i32 6400, i1 0)
  ret void
}
define i32 @sub_matrix_sum.([40 x [40 x i32]]* %mat.tmp) {
entry:
  %mat..tmp = alloca [40 x [40 x i32]]* 
  %total_sum = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %j.2 = alloca i32 
  store [40 x [40 x i32]]* %mat.tmp, ptr %mat..tmp
  store i32 0, ptr %total_sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 20
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %j
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 20
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load i32, ptr %total_sum
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.19 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [40 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.15, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %total_sum
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
  store i32 20, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 40
  br i1 %rcc.tmp.37, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 20, ptr %j.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.42 = load i32, ptr %j.2
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 40
  br i1 %rcc.tmp.43, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.46 = load i32, ptr %total_sum
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.50 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %j.2
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [40 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.46, %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %total_sum
  %rcc.tmp.57 = load i32, ptr %j.2
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %j.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.65 = load i32, ptr %total_sum
  ret i32 %rcc.tmp.65
}
define i32 @diagonal_processing.([40 x [40 x i32]]* %mat.tmp) {
entry:
  %mat..tmp = alloca [40 x [40 x i32]]* 
  %result = alloca i32 
  %i = alloca i32 
  store [40 x [40 x i32]]* %mat.tmp, ptr %mat..tmp
  store i32 0, ptr %result
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 40
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.12 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [40 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp sgt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %result
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.23 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = sub i32 40, 1
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = sub i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [40 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.19, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %result
  br label %if.merge
if.else:
  %rcc.tmp.33 = load i32, ptr %result
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [40 x [40 x i32]]*, ptr %mat..tmp
  %rcc.tmp.37 = getelementptr [40 x [40 x i32]], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [40 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = sub i32 %rcc.tmp.33, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %result
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %result
  ret i32 %rcc.tmp.49
}
define void @main() {
entry:
  %matrix_a = alloca [40 x [40 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %matrix_b = alloca [40 x [40 x i32]] 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %matrix_c = alloca [40 x [40 x i32]] 
  %i = alloca i32 
  %sum1 = alloca i32 
  %diag_res1 = alloca i32 
  %matrix_d = alloca [40 x [40 x i32]] 
  %sum2 = alloca i32 
  %diag_res2 = alloca i32 
  %matrix_e = alloca [40 x [40 x i32]] 
  %sum3 = alloca i32 
  %checksum = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %m = alloca i32 
  %row_max = alloca i32 
  %n = alloca i32 
  %p = alloca i32 
  %col_max = alloca i32 
  %q = alloca i32 
  %temp_mat = alloca [40 x [40 x i32]] 
  %r = alloca i32 
  %s = alloca i32 
  %temp_val = alloca i32 
  %final_sum = alloca i32 
  %t = alloca i32 
  %u = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 40
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [40 x [40 x i32]], ptr %matrix_a, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.10 = load i32, ptr %fill.idx.2
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 40
  br i1 %rcc.tmp.11, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.13 = load i32, ptr %fill.idx.2
  %rcc.tmp.14 = getelementptr [40 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.19 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.24 = load i32, ptr %fill.idx.3
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 40
  br i1 %rcc.tmp.25, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = getelementptr [40 x [40 x i32]], ptr %matrix_b, i32 0, i32 %rcc.tmp.27
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.31 = load i32, ptr %fill.idx.4
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 40
  br i1 %rcc.tmp.32, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.34 = load i32, ptr %fill.idx.4
  %rcc.tmp.35 = getelementptr [40 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.34
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.37, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.40 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.40, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @init_matrix.([40 x [40 x i32]]* %matrix_a, i32 123)
  call void @init_matrix.([40 x [40 x i32]]* %matrix_b, i32 456)
  call void @matrix_multiply.([40 x [40 x i32]]* %matrix_c, [40 x [40 x i32]]* %matrix_a, [40 x [40 x i32]]* %matrix_b)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 5
  br i1 %rcc.tmp.49, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @apply_stencil.([40 x [40 x i32]]* %matrix_c, [40 x [40 x i32]]* %matrix_c)
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.57 = call i32 @sub_matrix_sum.([40 x [40 x i32]]* %matrix_c)
  store i32 %rcc.tmp.57, ptr %sum1
  %rcc.tmp.59 = load i32, ptr %sum1
  call void @printlnInt.(i32 %rcc.tmp.59)
  %rcc.tmp.61 = call i32 @diagonal_processing.([40 x [40 x i32]]* %matrix_c)
  store i32 %rcc.tmp.61, ptr %diag_res1
  %rcc.tmp.63 = load i32, ptr %diag_res1
  call void @printlnInt.(i32 %rcc.tmp.63)
  call void @transpose_and_add.([40 x [40 x i32]]* %matrix_d, [40 x [40 x i32]]* %matrix_c)
  %rcc.tmp.66 = call i32 @sub_matrix_sum.([40 x [40 x i32]]* %matrix_d)
  store i32 %rcc.tmp.66, ptr %sum2
  %rcc.tmp.68 = load i32, ptr %sum2
  call void @printlnInt.(i32 %rcc.tmp.68)
  %rcc.tmp.70 = call i32 @diagonal_processing.([40 x [40 x i32]]* %matrix_d)
  store i32 %rcc.tmp.70, ptr %diag_res2
  %rcc.tmp.72 = load i32, ptr %diag_res2
  call void @printlnInt.(i32 %rcc.tmp.72)
  call void @matrix_multiply.([40 x [40 x i32]]* %matrix_e, [40 x [40 x i32]]* %matrix_d, [40 x [40 x i32]]* %matrix_a)
  %rcc.tmp.75 = call i32 @sub_matrix_sum.([40 x [40 x i32]]* %matrix_e)
  store i32 %rcc.tmp.75, ptr %sum3
  %rcc.tmp.77 = load i32, ptr %sum3
  call void @printlnInt.(i32 %rcc.tmp.77)
  store i32 0, ptr %checksum
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.82 = load i32, ptr %j
  %rcc.tmp.83 = icmp slt i32 %rcc.tmp.82, 40
  br i1 %rcc.tmp.83, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.88 = load i32, ptr %k
  %rcc.tmp.89 = icmp slt i32 %rcc.tmp.88, 40
  br i1 %rcc.tmp.89, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = load i32, ptr %k
  %rcc.tmp.94 = add i32 %rcc.tmp.92, %rcc.tmp.93
  %rcc.tmp.95 = srem i32 %rcc.tmp.94, 2
  %rcc.tmp.96 = icmp eq i32 %rcc.tmp.95, 0
  br i1 %rcc.tmp.96, label %if.then, label %if.else
if.then:
  %rcc.tmp.98 = load i32, ptr %checksum
  %rcc.tmp.99 = load i32, ptr %j
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [40 x [40 x i32]], ptr %matrix_e, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %k
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = getelementptr [40 x i32], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = add i32 %rcc.tmp.98, %rcc.tmp.105
  store i32 %rcc.tmp.106, ptr %checksum
  br label %if.merge
if.else:
  %rcc.tmp.109 = load i32, ptr %checksum
  %rcc.tmp.110 = load i32, ptr %j
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [40 x [40 x i32]], ptr %matrix_e, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %k
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [40 x i32], ptr %rcc.tmp.112, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = sub i32 %rcc.tmp.109, %rcc.tmp.116
  store i32 %rcc.tmp.117, ptr %checksum
  br label %if.merge
if.merge:
  %rcc.tmp.120 = load i32, ptr %k
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  store i32 %rcc.tmp.121, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.124 = load i32, ptr %j
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.128 = load i32, ptr %checksum
  call void @printlnInt.(i32 %rcc.tmp.128)
  store i32 0, ptr %m
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.132 = load i32, ptr %m
  %rcc.tmp.133 = icmp slt i32 %rcc.tmp.132, 40
  br i1 %rcc.tmp.133, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.136 = sub i32 0, 999999
  store i32 %rcc.tmp.136, ptr %row_max
  store i32 0, ptr %n
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.140 = load i32, ptr %n
  %rcc.tmp.141 = icmp slt i32 %rcc.tmp.140, 40
  br i1 %rcc.tmp.141, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.144 = load i32, ptr %m
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = getelementptr [40 x [40 x i32]], ptr %matrix_e, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.147 = load i32, ptr %n
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 0
  %rcc.tmp.149 = getelementptr [40 x i32], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.150 = load i32, ptr %rcc.tmp.149
  %rcc.tmp.151 = load i32, ptr %row_max
  %rcc.tmp.152 = icmp sgt i32 %rcc.tmp.150, %rcc.tmp.151
  br i1 %rcc.tmp.152, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.154 = load i32, ptr %m
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [40 x [40 x i32]], ptr %matrix_e, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load i32, ptr %n
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [40 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %rcc.tmp.159
  store i32 %rcc.tmp.160, ptr %row_max
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.164 = load i32, ptr %n
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 1
  store i32 %rcc.tmp.165, ptr %n
  br label %while.cond.5
while.end.5:
  %rcc.tmp.168 = load i32, ptr %row_max
  call void @printlnInt.(i32 %rcc.tmp.168)
  %rcc.tmp.170 = load i32, ptr %m
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 1
  store i32 %rcc.tmp.171, ptr %m
  br label %while.cond.4
while.end.4:
  store i32 0, ptr %p
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.176 = load i32, ptr %p
  %rcc.tmp.177 = icmp slt i32 %rcc.tmp.176, 40
  br i1 %rcc.tmp.177, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.180 = sub i32 0, 999999
  store i32 %rcc.tmp.180, ptr %col_max
  store i32 0, ptr %q
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.184 = load i32, ptr %q
  %rcc.tmp.185 = icmp slt i32 %rcc.tmp.184, 40
  br i1 %rcc.tmp.185, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.188 = load i32, ptr %q
  %rcc.tmp.189 = add i32 %rcc.tmp.188, 0
  %rcc.tmp.190 = getelementptr [40 x [40 x i32]], ptr %matrix_e, i32 0, i32 %rcc.tmp.189
  %rcc.tmp.191 = load i32, ptr %p
  %rcc.tmp.192 = add i32 %rcc.tmp.191, 0
  %rcc.tmp.193 = getelementptr [40 x i32], ptr %rcc.tmp.190, i32 0, i32 %rcc.tmp.192
  %rcc.tmp.194 = load i32, ptr %rcc.tmp.193
  %rcc.tmp.195 = load i32, ptr %col_max
  %rcc.tmp.196 = icmp sgt i32 %rcc.tmp.194, %rcc.tmp.195
  br i1 %rcc.tmp.196, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.198 = load i32, ptr %q
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 0
  %rcc.tmp.200 = getelementptr [40 x [40 x i32]], ptr %matrix_e, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %p
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 0
  %rcc.tmp.203 = getelementptr [40 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.202
  %rcc.tmp.204 = load i32, ptr %rcc.tmp.203
  store i32 %rcc.tmp.204, ptr %col_max
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.208 = load i32, ptr %q
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %q
  br label %while.cond.7
while.end.7:
  %rcc.tmp.212 = load i32, ptr %col_max
  call void @printlnInt.(i32 %rcc.tmp.212)
  %rcc.tmp.214 = load i32, ptr %p
  %rcc.tmp.215 = add i32 %rcc.tmp.214, 1
  store i32 %rcc.tmp.215, ptr %p
  br label %while.cond.6
while.end.6:
  %rcc.tmp.218 = bitcast [40 x [40 x i32]]* %temp_mat to i8*
  %rcc.tmp.219 = bitcast [40 x [40 x i32]]* %matrix_a to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.218, i8* %rcc.tmp.219, i32 6400, i1 0)
  store i32 0, ptr %r
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.223 = load i32, ptr %r
  %rcc.tmp.224 = icmp slt i32 %rcc.tmp.223, 40
  br i1 %rcc.tmp.224, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  store i32 0, ptr %s
  br label %while.cond.9
while.cond.9:
  %rcc.tmp.229 = load i32, ptr %s
  %rcc.tmp.230 = icmp slt i32 %rcc.tmp.229, 40
  br i1 %rcc.tmp.230, label %while.body.9, label %while.linker.9
while.linker.9:
  br label %while.end.9
while.body.9:
  %rcc.tmp.233 = load i32, ptr %r
  %rcc.tmp.234 = add i32 %rcc.tmp.233, 0
  %rcc.tmp.235 = getelementptr [40 x [40 x i32]], ptr %temp_mat, i32 0, i32 %rcc.tmp.234
  %rcc.tmp.236 = load i32, ptr %s
  %rcc.tmp.237 = add i32 %rcc.tmp.236, 0
  %rcc.tmp.238 = getelementptr [40 x i32], ptr %rcc.tmp.235, i32 0, i32 %rcc.tmp.237
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.238
  store i32 %rcc.tmp.239, ptr %temp_val
  %rcc.tmp.241 = load i32, ptr %r
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 0
  %rcc.tmp.243 = getelementptr [40 x [40 x i32]], ptr %temp_mat, i32 0, i32 %rcc.tmp.242
  %rcc.tmp.244 = load i32, ptr %s
  %rcc.tmp.245 = add i32 %rcc.tmp.244, 0
  %rcc.tmp.246 = getelementptr [40 x i32], ptr %rcc.tmp.243, i32 0, i32 %rcc.tmp.245
  %rcc.tmp.247 = load i32, ptr %s
  %rcc.tmp.248 = add i32 %rcc.tmp.247, 0
  %rcc.tmp.249 = getelementptr [40 x [40 x i32]], ptr %temp_mat, i32 0, i32 %rcc.tmp.248
  %rcc.tmp.250 = load i32, ptr %r
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 0
  %rcc.tmp.252 = getelementptr [40 x i32], ptr %rcc.tmp.249, i32 0, i32 %rcc.tmp.251
  %rcc.tmp.253 = load i32, ptr %rcc.tmp.252
  store i32 %rcc.tmp.253, ptr %rcc.tmp.246
  %rcc.tmp.255 = load i32, ptr %s
  %rcc.tmp.256 = add i32 %rcc.tmp.255, 0
  %rcc.tmp.257 = getelementptr [40 x [40 x i32]], ptr %temp_mat, i32 0, i32 %rcc.tmp.256
  %rcc.tmp.258 = load i32, ptr %r
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 0
  %rcc.tmp.260 = getelementptr [40 x i32], ptr %rcc.tmp.257, i32 0, i32 %rcc.tmp.259
  %rcc.tmp.261 = load i32, ptr %temp_val
  store i32 %rcc.tmp.261, ptr %rcc.tmp.260
  %rcc.tmp.263 = load i32, ptr %s
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 1
  store i32 %rcc.tmp.264, ptr %s
  br label %while.cond.9
while.end.9:
  %rcc.tmp.267 = load i32, ptr %r
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 1
  store i32 %rcc.tmp.268, ptr %r
  br label %while.cond.8
while.end.8:
  store i32 0, ptr %final_sum
  store i32 0, ptr %t
  br label %while.cond.10
while.cond.10:
  %rcc.tmp.274 = load i32, ptr %t
  %rcc.tmp.275 = icmp slt i32 %rcc.tmp.274, 40
  br i1 %rcc.tmp.275, label %while.body.10, label %while.linker.10
while.linker.10:
  br label %while.end.10
while.body.10:
  store i32 0, ptr %u
  br label %while.cond.11
while.cond.11:
  %rcc.tmp.280 = load i32, ptr %u
  %rcc.tmp.281 = icmp slt i32 %rcc.tmp.280, 40
  br i1 %rcc.tmp.281, label %while.body.11, label %while.linker.11
while.linker.11:
  br label %while.end.11
while.body.11:
  %rcc.tmp.284 = load i32, ptr %final_sum
  %rcc.tmp.285 = load i32, ptr %t
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 0
  %rcc.tmp.287 = getelementptr [40 x [40 x i32]], ptr %temp_mat, i32 0, i32 %rcc.tmp.286
  %rcc.tmp.288 = load i32, ptr %u
  %rcc.tmp.289 = add i32 %rcc.tmp.288, 0
  %rcc.tmp.290 = getelementptr [40 x i32], ptr %rcc.tmp.287, i32 0, i32 %rcc.tmp.289
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.290
  %rcc.tmp.292 = add i32 %rcc.tmp.284, %rcc.tmp.291
  store i32 %rcc.tmp.292, ptr %final_sum
  %rcc.tmp.294 = load i32, ptr %u
  %rcc.tmp.295 = add i32 %rcc.tmp.294, 1
  store i32 %rcc.tmp.295, ptr %u
  br label %while.cond.11
while.end.11:
  %rcc.tmp.298 = load i32, ptr %t
  %rcc.tmp.299 = add i32 %rcc.tmp.298, 1
  store i32 %rcc.tmp.299, ptr %t
  br label %while.cond.10
while.end.10:
  %rcc.tmp.302 = load i32, ptr %final_sum
  call void @printlnInt.(i32 %rcc.tmp.302)
  call void @exit.(i32 0)
  ret void
}
