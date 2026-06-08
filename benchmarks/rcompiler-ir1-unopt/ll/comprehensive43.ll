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
define void @load_program.([256 x i32]* %prog.tmp) {
entry:
  %prog..tmp = alloca [256 x i32]* 
  %i = alloca i32 
  store [256 x i32]* %prog.tmp, ptr %prog..tmp
  %rcc.tmp.2 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.3 = getelementptr [256 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.3
  %rcc.tmp.5 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.6 = getelementptr [256 x i32], ptr %rcc.tmp.5, i32 0, i32 1
  store i32 8, ptr %rcc.tmp.6
  %rcc.tmp.8 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.9 = getelementptr [256 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  store i32 1, ptr %rcc.tmp.9
  %rcc.tmp.11 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.12 = getelementptr [256 x i32], ptr %rcc.tmp.11, i32 0, i32 3
  store i32 1, ptr %rcc.tmp.12
  %rcc.tmp.14 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.15 = getelementptr [256 x i32], ptr %rcc.tmp.14, i32 0, i32 4
  store i32 15, ptr %rcc.tmp.15
  %rcc.tmp.17 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.18 = getelementptr [256 x i32], ptr %rcc.tmp.17, i32 0, i32 5
  store i32 1, ptr %rcc.tmp.18
  %rcc.tmp.20 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.21 = getelementptr [256 x i32], ptr %rcc.tmp.20, i32 0, i32 6
  store i32 1, ptr %rcc.tmp.21
  %rcc.tmp.23 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.24 = getelementptr [256 x i32], ptr %rcc.tmp.23, i32 0, i32 7
  store i32 11, ptr %rcc.tmp.24
  %rcc.tmp.26 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.27 = getelementptr [256 x i32], ptr %rcc.tmp.26, i32 0, i32 8
  store i32 9, ptr %rcc.tmp.27
  %rcc.tmp.29 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.30 = getelementptr [256 x i32], ptr %rcc.tmp.29, i32 0, i32 9
  store i32 14, ptr %rcc.tmp.30
  %rcc.tmp.32 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.33 = getelementptr [256 x i32], ptr %rcc.tmp.32, i32 0, i32 10
  store i32 7, ptr %rcc.tmp.33
  %rcc.tmp.35 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.36 = getelementptr [256 x i32], ptr %rcc.tmp.35, i32 0, i32 11
  store i32 20, ptr %rcc.tmp.36
  %rcc.tmp.38 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.39 = getelementptr [256 x i32], ptr %rcc.tmp.38, i32 0, i32 12
  store i32 5, ptr %rcc.tmp.39
  %rcc.tmp.41 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.42 = getelementptr [256 x i32], ptr %rcc.tmp.41, i32 0, i32 13
  store i32 1, ptr %rcc.tmp.42
  %rcc.tmp.44 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.45 = getelementptr [256 x i32], ptr %rcc.tmp.44, i32 0, i32 14
  %rcc.tmp.46 = sub i32 0, 1
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.49 = getelementptr [256 x i32], ptr %rcc.tmp.48, i32 0, i32 15
  store i32 3, ptr %rcc.tmp.49
  %rcc.tmp.51 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.52 = getelementptr [256 x i32], ptr %rcc.tmp.51, i32 0, i32 16
  store i32 7, ptr %rcc.tmp.52
  %rcc.tmp.54 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.55 = getelementptr [256 x i32], ptr %rcc.tmp.54, i32 0, i32 17
  store i32 4, ptr %rcc.tmp.55
  %rcc.tmp.57 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.58 = getelementptr [256 x i32], ptr %rcc.tmp.57, i32 0, i32 18
  store i32 2, ptr %rcc.tmp.58
  %rcc.tmp.60 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.61 = getelementptr [256 x i32], ptr %rcc.tmp.60, i32 0, i32 19
  store i32 7, ptr %rcc.tmp.61
  %rcc.tmp.63 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.64 = getelementptr [256 x i32], ptr %rcc.tmp.63, i32 0, i32 20
  store i32 12, ptr %rcc.tmp.64
  %rcc.tmp.66 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.67 = getelementptr [256 x i32], ptr %rcc.tmp.66, i32 0, i32 21
  store i32 13, ptr %rcc.tmp.67
  %rcc.tmp.69 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.70 = getelementptr [256 x i32], ptr %rcc.tmp.69, i32 0, i32 22
  store i32 14, ptr %rcc.tmp.70
  store i32 30, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = icmp slt i32 %rcc.tmp.74, 250
  br i1 %rcc.tmp.75, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.81 = getelementptr [256 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  store i32 1, ptr %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  %rcc.tmp.86 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.87 = getelementptr [256 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %i
  store i32 %rcc.tmp.88, ptr %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 2
  %rcc.tmp.93 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.94 = getelementptr [256 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  store i32 15, ptr %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 3
  %rcc.tmp.99 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.100 = getelementptr [256 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  store i32 2, ptr %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 4
  store i32 %rcc.tmp.103, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @self_modify_code.([256 x i32]* %prog.tmp, i32 %pc.tmp) {
entry:
  %prog..tmp = alloca [256 x i32]* 
  %pc..tmp = alloca i32 
  store [256 x i32]* %prog.tmp, ptr %prog..tmp
  store i32 %pc.tmp, ptr %pc..tmp
  %rcc.tmp.3 = load i32, ptr %pc..tmp
  %rcc.tmp.4 = icmp sgt i32 %rcc.tmp.3, 10
  br i1 %rcc.tmp.4, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.6 = load i32, ptr %pc..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.10 = getelementptr [256 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 15
  br label %sc.merge
sc.merge:
  %rcc.tmp.14 = phi i1 [0, %entry], [%rcc.tmp.12, %and.rhs]
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load i32, ptr %pc..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [256 x i32]*, ptr %prog..tmp
  %rcc.tmp.19 = getelementptr [256 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  store i32 2, ptr %rcc.tmp.19
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @main() {
entry:
  %program = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %stack = alloca [256 x i32] 
  %fill.idx.2 = alloca i32 
  %sp = alloca i32 
  %pc = alloca i32 
  %halt = alloca i1 
  %instruction = alloca i32 
  %value = alloca i32 
  %b = alloca i32 
  %a = alloca i32 
  %b.2 = alloca i32 
  %a.2 = alloca i32 
  %b.3 = alloca i32 
  %a.3 = alloca i32 
  %b.4 = alloca i32 
  %a.4 = alloca i32 
  %val = alloca i32 
  %val.2 = alloca i32 
  %b.5 = alloca i32 
  %a.5 = alloca i32 
  %b.6 = alloca i32 
  %a.6 = alloca i32 
  %b.7 = alloca i32 
  %a.7 = alloca i32 
  %val.3 = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 256
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [256 x i32], ptr %program, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 256
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %sp
  store i32 0, ptr %pc
  store i1 0, ptr %halt
  call void @load_program.([256 x i32]* %program)
  br label %while.cond
while.cond:
  %rcc.tmp.29 = load i1, ptr %halt
  %rcc.tmp.30 = xor i1 %rcc.tmp.29, true
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %pc
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [256 x i32], ptr %program, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %instruction
  %rcc.tmp.38 = load i32, ptr %pc
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %pc
  %rcc.tmp.41 = load i32, ptr %pc
  call void @self_modify_code.([256 x i32]* %program, i32 %rcc.tmp.41)
  %rcc.tmp.43 = load i32, ptr %instruction
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.43, 1
  br i1 %rcc.tmp.44, label %if.then, label %if.else
if.then:
  %rcc.tmp.46 = load i32, ptr %pc
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [256 x i32], ptr %program, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %value
  %rcc.tmp.51 = load i32, ptr %pc
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %pc
  %rcc.tmp.54 = load i32, ptr %sp
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %sp
  %rcc.tmp.57 = load i32, ptr %sp
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %value
  store i32 %rcc.tmp.60, ptr %rcc.tmp.59
  br label %if.merge
if.else:
  %rcc.tmp.63 = load i32, ptr %instruction
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 2
  br i1 %rcc.tmp.64, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.66 = load i32, ptr %sp
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %sp
  br label %if.merge.2
if.else.2:
  %rcc.tmp.70 = load i32, ptr %instruction
  %rcc.tmp.71 = icmp eq i32 %rcc.tmp.70, 3
  br i1 %rcc.tmp.71, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.73 = load i32, ptr %sp
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %b
  %rcc.tmp.78 = load i32, ptr %sp
  %rcc.tmp.79 = sub i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %sp
  %rcc.tmp.81 = load i32, ptr %sp
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  store i32 %rcc.tmp.84, ptr %a
  %rcc.tmp.86 = load i32, ptr %sp
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %a
  %rcc.tmp.90 = load i32, ptr %b
  %rcc.tmp.91 = add i32 %rcc.tmp.89, %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %rcc.tmp.88
  br label %if.merge.3
if.else.3:
  %rcc.tmp.94 = load i32, ptr %instruction
  %rcc.tmp.95 = icmp eq i32 %rcc.tmp.94, 4
  br i1 %rcc.tmp.95, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.97 = load i32, ptr %sp
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %b.2
  %rcc.tmp.102 = load i32, ptr %sp
  %rcc.tmp.103 = sub i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %sp
  %rcc.tmp.105 = load i32, ptr %sp
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.107
  store i32 %rcc.tmp.108, ptr %a.2
  %rcc.tmp.110 = load i32, ptr %sp
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %a.2
  %rcc.tmp.114 = load i32, ptr %b.2
  %rcc.tmp.115 = sub i32 %rcc.tmp.113, %rcc.tmp.114
  store i32 %rcc.tmp.115, ptr %rcc.tmp.112
  br label %if.merge.4
if.else.4:
  %rcc.tmp.118 = load i32, ptr %instruction
  %rcc.tmp.119 = icmp eq i32 %rcc.tmp.118, 5
  br i1 %rcc.tmp.119, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.121 = load i32, ptr %sp
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %b.3
  %rcc.tmp.126 = load i32, ptr %sp
  %rcc.tmp.127 = sub i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %sp
  %rcc.tmp.129 = load i32, ptr %sp
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 0
  %rcc.tmp.131 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.132, ptr %a.3
  %rcc.tmp.134 = load i32, ptr %sp
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %a.3
  %rcc.tmp.138 = load i32, ptr %b.3
  %rcc.tmp.139 = mul i32 %rcc.tmp.137, %rcc.tmp.138
  store i32 %rcc.tmp.139, ptr %rcc.tmp.136
  br label %if.merge.5
if.else.5:
  %rcc.tmp.142 = load i32, ptr %instruction
  %rcc.tmp.143 = icmp eq i32 %rcc.tmp.142, 6
  br i1 %rcc.tmp.143, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.145 = load i32, ptr %sp
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.147
  store i32 %rcc.tmp.148, ptr %b.4
  %rcc.tmp.150 = load i32, ptr %sp
  %rcc.tmp.151 = sub i32 %rcc.tmp.150, 1
  store i32 %rcc.tmp.151, ptr %sp
  %rcc.tmp.153 = load i32, ptr %sp
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.155
  store i32 %rcc.tmp.156, ptr %a.4
  %rcc.tmp.158 = load i32, ptr %sp
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 0
  %rcc.tmp.160 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.159
  %rcc.tmp.161 = load i32, ptr %a.4
  %rcc.tmp.162 = load i32, ptr %b.4
  %rcc.tmp.163 = sdiv i32 %rcc.tmp.161, %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %rcc.tmp.160
  br label %if.merge.6
if.else.6:
  %rcc.tmp.166 = load i32, ptr %instruction
  %rcc.tmp.167 = icmp eq i32 %rcc.tmp.166, 7
  br i1 %rcc.tmp.167, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.169 = load i32, ptr %pc
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = getelementptr [256 x i32], ptr %program, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.172 = load i32, ptr %rcc.tmp.171
  store i32 %rcc.tmp.172, ptr %pc
  br label %if.merge.7
if.else.7:
  %rcc.tmp.175 = load i32, ptr %instruction
  %rcc.tmp.176 = icmp eq i32 %rcc.tmp.175, 8
  br i1 %rcc.tmp.176, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.178 = load i32, ptr %sp
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 0
  %rcc.tmp.180 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.179
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  store i32 %rcc.tmp.181, ptr %val
  %rcc.tmp.183 = load i32, ptr %sp
  %rcc.tmp.184 = sub i32 %rcc.tmp.183, 1
  store i32 %rcc.tmp.184, ptr %sp
  %rcc.tmp.186 = load i32, ptr %val
  %rcc.tmp.187 = icmp eq i32 %rcc.tmp.186, 0
  br i1 %rcc.tmp.187, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.189 = load i32, ptr %pc
  %rcc.tmp.190 = add i32 %rcc.tmp.189, 0
  %rcc.tmp.191 = getelementptr [256 x i32], ptr %program, i32 0, i32 %rcc.tmp.190
  %rcc.tmp.192 = load i32, ptr %rcc.tmp.191
  store i32 %rcc.tmp.192, ptr %pc
  br label %if.merge.9
if.else.9:
  %rcc.tmp.195 = load i32, ptr %pc
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 1
  store i32 %rcc.tmp.196, ptr %pc
  br label %if.merge.9
if.merge.9:
  br label %if.merge.8
if.else.8:
  %rcc.tmp.200 = load i32, ptr %instruction
  %rcc.tmp.201 = icmp eq i32 %rcc.tmp.200, 9
  br i1 %rcc.tmp.201, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.203 = load i32, ptr %sp
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 0
  %rcc.tmp.205 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.204
  %rcc.tmp.206 = load i32, ptr %rcc.tmp.205
  store i32 %rcc.tmp.206, ptr %val.2
  %rcc.tmp.208 = load i32, ptr %sp
  %rcc.tmp.209 = sub i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %sp
  %rcc.tmp.211 = load i32, ptr %val.2
  %rcc.tmp.212 = icmp ne i32 %rcc.tmp.211, 0
  br i1 %rcc.tmp.212, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.214 = load i32, ptr %pc
  %rcc.tmp.215 = add i32 %rcc.tmp.214, 0
  %rcc.tmp.216 = getelementptr [256 x i32], ptr %program, i32 0, i32 %rcc.tmp.215
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  store i32 %rcc.tmp.217, ptr %pc
  br label %if.merge.11
if.else.11:
  %rcc.tmp.220 = load i32, ptr %pc
  %rcc.tmp.221 = add i32 %rcc.tmp.220, 1
  store i32 %rcc.tmp.221, ptr %pc
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.else.10:
  %rcc.tmp.225 = load i32, ptr %instruction
  %rcc.tmp.226 = icmp eq i32 %rcc.tmp.225, 10
  br i1 %rcc.tmp.226, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.228 = load i32, ptr %sp
  %rcc.tmp.229 = add i32 %rcc.tmp.228, 0
  %rcc.tmp.230 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.229
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.230
  store i32 %rcc.tmp.231, ptr %b.5
  %rcc.tmp.233 = load i32, ptr %sp
  %rcc.tmp.234 = sub i32 %rcc.tmp.233, 1
  store i32 %rcc.tmp.234, ptr %sp
  %rcc.tmp.236 = load i32, ptr %sp
  %rcc.tmp.237 = add i32 %rcc.tmp.236, 0
  %rcc.tmp.238 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.237
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.238
  store i32 %rcc.tmp.239, ptr %a.5
  %rcc.tmp.241 = load i32, ptr %a.5
  %rcc.tmp.242 = load i32, ptr %b.5
  %rcc.tmp.243 = icmp eq i32 %rcc.tmp.241, %rcc.tmp.242
  br i1 %rcc.tmp.243, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.245 = load i32, ptr %sp
  %rcc.tmp.246 = add i32 %rcc.tmp.245, 0
  %rcc.tmp.247 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.246
  store i32 1, ptr %rcc.tmp.247
  br label %if.merge.13
if.else.13:
  %rcc.tmp.250 = load i32, ptr %sp
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 0
  %rcc.tmp.252 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.251
  store i32 0, ptr %rcc.tmp.252
  br label %if.merge.13
if.merge.13:
  br label %if.merge.12
if.else.12:
  %rcc.tmp.256 = load i32, ptr %instruction
  %rcc.tmp.257 = icmp eq i32 %rcc.tmp.256, 11
  br i1 %rcc.tmp.257, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.259 = load i32, ptr %sp
  %rcc.tmp.260 = add i32 %rcc.tmp.259, 0
  %rcc.tmp.261 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.260
  %rcc.tmp.262 = load i32, ptr %rcc.tmp.261
  store i32 %rcc.tmp.262, ptr %b.6
  %rcc.tmp.264 = load i32, ptr %sp
  %rcc.tmp.265 = sub i32 %rcc.tmp.264, 1
  store i32 %rcc.tmp.265, ptr %sp
  %rcc.tmp.267 = load i32, ptr %sp
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.268
  %rcc.tmp.270 = load i32, ptr %rcc.tmp.269
  store i32 %rcc.tmp.270, ptr %a.6
  %rcc.tmp.272 = load i32, ptr %a.6
  %rcc.tmp.273 = load i32, ptr %b.6
  %rcc.tmp.274 = icmp slt i32 %rcc.tmp.272, %rcc.tmp.273
  br i1 %rcc.tmp.274, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.276 = load i32, ptr %sp
  %rcc.tmp.277 = add i32 %rcc.tmp.276, 0
  %rcc.tmp.278 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.277
  store i32 1, ptr %rcc.tmp.278
  br label %if.merge.15
if.else.15:
  %rcc.tmp.281 = load i32, ptr %sp
  %rcc.tmp.282 = add i32 %rcc.tmp.281, 0
  %rcc.tmp.283 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.282
  store i32 0, ptr %rcc.tmp.283
  br label %if.merge.15
if.merge.15:
  br label %if.merge.14
if.else.14:
  %rcc.tmp.287 = load i32, ptr %instruction
  %rcc.tmp.288 = icmp eq i32 %rcc.tmp.287, 12
  br i1 %rcc.tmp.288, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.290 = load i32, ptr %sp
  %rcc.tmp.291 = add i32 %rcc.tmp.290, 0
  %rcc.tmp.292 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.291
  %rcc.tmp.293 = load i32, ptr %rcc.tmp.292
  store i32 %rcc.tmp.293, ptr %b.7
  %rcc.tmp.295 = load i32, ptr %sp
  %rcc.tmp.296 = sub i32 %rcc.tmp.295, 1
  store i32 %rcc.tmp.296, ptr %sp
  %rcc.tmp.298 = load i32, ptr %sp
  %rcc.tmp.299 = add i32 %rcc.tmp.298, 0
  %rcc.tmp.300 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.299
  %rcc.tmp.301 = load i32, ptr %rcc.tmp.300
  store i32 %rcc.tmp.301, ptr %a.7
  %rcc.tmp.303 = load i32, ptr %a.7
  %rcc.tmp.304 = load i32, ptr %b.7
  %rcc.tmp.305 = icmp sgt i32 %rcc.tmp.303, %rcc.tmp.304
  br i1 %rcc.tmp.305, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.307 = load i32, ptr %sp
  %rcc.tmp.308 = add i32 %rcc.tmp.307, 0
  %rcc.tmp.309 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.308
  store i32 1, ptr %rcc.tmp.309
  br label %if.merge.17
if.else.17:
  %rcc.tmp.312 = load i32, ptr %sp
  %rcc.tmp.313 = add i32 %rcc.tmp.312, 0
  %rcc.tmp.314 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.313
  store i32 0, ptr %rcc.tmp.314
  br label %if.merge.17
if.merge.17:
  br label %if.merge.16
if.else.16:
  %rcc.tmp.318 = load i32, ptr %instruction
  %rcc.tmp.319 = icmp eq i32 %rcc.tmp.318, 13
  br i1 %rcc.tmp.319, label %if.then.18, label %if.else.18
if.then.18:
  %rcc.tmp.321 = load i32, ptr %sp
  %rcc.tmp.322 = add i32 %rcc.tmp.321, 0
  %rcc.tmp.323 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.322
  %rcc.tmp.324 = load i32, ptr %rcc.tmp.323
  call void @printlnInt.(i32 %rcc.tmp.324)
  br label %if.merge.18
if.else.18:
  %rcc.tmp.327 = load i32, ptr %instruction
  %rcc.tmp.328 = icmp eq i32 %rcc.tmp.327, 14
  br i1 %rcc.tmp.328, label %if.then.19, label %if.else.19
if.then.19:
  store i1 1, ptr %halt
  br label %if.merge.19
if.else.19:
  %rcc.tmp.332 = load i32, ptr %instruction
  %rcc.tmp.333 = icmp eq i32 %rcc.tmp.332, 15
  br i1 %rcc.tmp.333, label %if.then.20, label %if.else.20
if.then.20:
  %rcc.tmp.335 = load i32, ptr %sp
  %rcc.tmp.336 = add i32 %rcc.tmp.335, 0
  %rcc.tmp.337 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.336
  %rcc.tmp.338 = load i32, ptr %rcc.tmp.337
  store i32 %rcc.tmp.338, ptr %val.3
  %rcc.tmp.340 = load i32, ptr %sp
  %rcc.tmp.341 = add i32 %rcc.tmp.340, 1
  store i32 %rcc.tmp.341, ptr %sp
  %rcc.tmp.343 = load i32, ptr %sp
  %rcc.tmp.344 = add i32 %rcc.tmp.343, 0
  %rcc.tmp.345 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.344
  %rcc.tmp.346 = load i32, ptr %val.3
  store i32 %rcc.tmp.346, ptr %rcc.tmp.345
  br label %if.merge.20
if.else.20:
  br label %if.merge.20
if.merge.20:
  br label %if.merge.19
if.merge.19:
  br label %if.merge.18
if.merge.18:
  br label %if.merge.16
if.merge.16:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.10
if.merge.10:
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
  %rcc.tmp.364 = load i32, ptr %pc
  %rcc.tmp.365 = icmp slt i32 %rcc.tmp.364, 0
  br i1 %rcc.tmp.365, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.367 = load i32, ptr %pc
  %rcc.tmp.368 = icmp sge i32 %rcc.tmp.367, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.370 = phi i1 [1, %if.merge], [%rcc.tmp.368, %or.rhs]
  br i1 %rcc.tmp.370, label %if.then.21, label %if.else.21
if.then.21:
  store i1 1, ptr %halt
  br label %if.merge.21
if.else.21:
  br label %if.merge.21
if.merge.21:
  br label %while.cond
while.end:
  call void @exit.(i32 0)
  ret void
}
