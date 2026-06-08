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
  %memory = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %alloc_ptr1 = alloca i32 
  %alloc_ptr2 = alloca i32 
  %alloc_ptr3 = alloca i32 
  %alloc_ptr4 = alloca i32 
  %alloc_ptr5 = alloca i32 
  %j = alloca i32 
  %temp_ptr = alloca i32 
  %alloc_ptr_invalid = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1024
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %memory, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.12 = getelementptr [1024 x i32], ptr %memory, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [1024 x i32], ptr %memory, i32 0, i32 1
  store i32 1020, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [1024 x i32], ptr %memory, i32 0, i32 2
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = getelementptr [1024 x i32], ptr %memory, i32 0, i32 3
  %rcc.tmp.20 = sub i32 0, 1
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = call i32 @allocate.([1024 x i32]* %memory, i32 256)
  store i32 %rcc.tmp.22, ptr %alloc_ptr1
  %rcc.tmp.24 = load i32, ptr %alloc_ptr1
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @allocate.([1024 x i32]* %memory, i32 128)
  store i32 %rcc.tmp.26, ptr %alloc_ptr2
  %rcc.tmp.28 = load i32, ptr %alloc_ptr2
  call void @printlnInt.(i32 %rcc.tmp.28)
  %rcc.tmp.30 = call i32 @allocate.([1024 x i32]* %memory, i32 512)
  store i32 %rcc.tmp.30, ptr %alloc_ptr3
  %rcc.tmp.32 = load i32, ptr %alloc_ptr3
  call void @printlnInt.(i32 %rcc.tmp.32)
  %rcc.tmp.34 = load i32, ptr %alloc_ptr2
  call void @deallocate.([1024 x i32]* %memory, i32 %rcc.tmp.34)
  %rcc.tmp.36 = call i32 @allocate.([1024 x i32]* %memory, i32 64)
  store i32 %rcc.tmp.36, ptr %alloc_ptr4
  %rcc.tmp.38 = load i32, ptr %alloc_ptr4
  call void @printlnInt.(i32 %rcc.tmp.38)
  %rcc.tmp.40 = load i32, ptr %alloc_ptr1
  call void @deallocate.([1024 x i32]* %memory, i32 %rcc.tmp.40)
  %rcc.tmp.42 = load i32, ptr %alloc_ptr3
  call void @deallocate.([1024 x i32]* %memory, i32 %rcc.tmp.42)
  %rcc.tmp.44 = call i32 @allocate.([1024 x i32]* %memory, i32 768)
  store i32 %rcc.tmp.44, ptr %alloc_ptr5
  %rcc.tmp.46 = load i32, ptr %alloc_ptr5
  call void @printlnInt.(i32 %rcc.tmp.46)
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.50, 10
  br i1 %rcc.tmp.51, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.54 = call i32 @allocate.([1024 x i32]* %memory, i32 10)
  store i32 %rcc.tmp.54, ptr %temp_ptr
  %rcc.tmp.56 = load i32, ptr %temp_ptr
  %rcc.tmp.57 = sub i32 0, 1
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %if.then, label %if.else
if.then:
  %rcc.tmp.60 = sub i32 0, 1
  store i32 %rcc.tmp.60, ptr %alloc_ptr_invalid
  %rcc.tmp.62 = load i32, ptr %alloc_ptr4
  call void @deallocate.([1024 x i32]* %memory, i32 %rcc.tmp.62)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %j
  br label %while.cond
while.end:
  call void @print_memory_state.([1024 x i32]* %memory)
  call void @exit.(i32 0)
  ret void
}
define i32 @allocate.([1024 x i32]* %memory.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %size..tmp = alloca i32 
  %current_ptr = alloca i32 
  %best_fit_ptr = alloca i32 
  %best_fit_size = alloca i32 
  %is_free = alloca i32 
  %block_size = alloca i32 
  %block_size.2 = alloca i32 
  %remaining_size = alloca i32 
  %new_block_ptr = alloca i32 
  %original_next_ptr = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %current_ptr
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %best_fit_ptr
  store i32 1025, ptr %best_fit_size
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %current_ptr
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp ne i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %current_ptr
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.16 = getelementptr [1024 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %is_free
  %rcc.tmp.19 = load i32, ptr %current_ptr
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.23 = getelementptr [1024 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %block_size
  %rcc.tmp.26 = load i32, ptr %is_free
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.26, 1
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %block_size
  %rcc.tmp.30 = load i32, ptr %size..tmp
  %rcc.tmp.31 = icmp sge i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.33 = load i32, ptr %block_size
  %rcc.tmp.34 = load i32, ptr %best_fit_size
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.37 = load i32, ptr %block_size
  store i32 %rcc.tmp.37, ptr %best_fit_size
  %rcc.tmp.39 = load i32, ptr %current_ptr
  store i32 %rcc.tmp.39, ptr %best_fit_ptr
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.47 = load i32, ptr %current_ptr
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 3
  %rcc.tmp.50 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.51 = getelementptr [1024 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %current_ptr
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %best_fit_ptr
  %rcc.tmp.56 = sub i32 0, 1
  %rcc.tmp.57 = icmp ne i32 %rcc.tmp.55, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.59 = load i32, ptr %best_fit_ptr
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  %rcc.tmp.62 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.63 = getelementptr [1024 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %block_size.2
  %rcc.tmp.66 = load i32, ptr %block_size.2
  %rcc.tmp.67 = load i32, ptr %size..tmp
  %rcc.tmp.68 = sub i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = sub i32 %rcc.tmp.68, 4
  store i32 %rcc.tmp.69, ptr %remaining_size
  %rcc.tmp.71 = load i32, ptr %remaining_size
  %rcc.tmp.72 = icmp sgt i32 %rcc.tmp.71, 8
  br i1 %rcc.tmp.72, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.74 = load i32, ptr %best_fit_ptr
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  %rcc.tmp.77 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.78 = getelementptr [1024 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %best_fit_ptr
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.84 = getelementptr [1024 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %best_fit_ptr
  %rcc.tmp.87 = load i32, ptr %size..tmp
  %rcc.tmp.88 = add i32 %rcc.tmp.86, %rcc.tmp.87
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 4
  store i32 %rcc.tmp.89, ptr %new_block_ptr
  %rcc.tmp.91 = load i32, ptr %new_block_ptr
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.94 = getelementptr [1024 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  store i32 1, ptr %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %new_block_ptr
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  %rcc.tmp.99 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.100 = getelementptr [1024 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %remaining_size
  store i32 %rcc.tmp.101, ptr %rcc.tmp.100
  %rcc.tmp.103 = load i32, ptr %new_block_ptr
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 2
  %rcc.tmp.106 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.107 = getelementptr [1024 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %best_fit_ptr
  store i32 %rcc.tmp.108, ptr %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %new_block_ptr
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 3
  %rcc.tmp.113 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.114 = getelementptr [1024 x i32], ptr %rcc.tmp.113, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.115 = load i32, ptr %best_fit_ptr
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 0
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 3
  %rcc.tmp.118 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.119 = getelementptr [1024 x i32], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  store i32 %rcc.tmp.120, ptr %rcc.tmp.114
  %rcc.tmp.122 = load i32, ptr %best_fit_ptr
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 3
  %rcc.tmp.125 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.126 = getelementptr [1024 x i32], ptr %rcc.tmp.125, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  store i32 %rcc.tmp.127, ptr %original_next_ptr
  %rcc.tmp.129 = load i32, ptr %original_next_ptr
  %rcc.tmp.130 = sub i32 0, 1
  %rcc.tmp.131 = icmp ne i32 %rcc.tmp.129, %rcc.tmp.130
  br i1 %rcc.tmp.131, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.133 = load i32, ptr %original_next_ptr
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 2
  %rcc.tmp.136 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.137 = getelementptr [1024 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.138 = load i32, ptr %new_block_ptr
  store i32 %rcc.tmp.138, ptr %rcc.tmp.137
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.142 = load i32, ptr %best_fit_ptr
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 3
  %rcc.tmp.145 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.146 = getelementptr [1024 x i32], ptr %rcc.tmp.145, i32 0, i32 %rcc.tmp.144
  %rcc.tmp.147 = load i32, ptr %new_block_ptr
  store i32 %rcc.tmp.147, ptr %rcc.tmp.146
  br label %if.merge.5
if.else.5:
  %rcc.tmp.150 = load i32, ptr %best_fit_ptr
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.153 = getelementptr [1024 x i32], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.151
  store i32 0, ptr %rcc.tmp.153
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.156 = load i32, ptr %best_fit_ptr
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 4
  ret i32 %rcc.tmp.157
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.160 = sub i32 0, 1
  ret i32 %rcc.tmp.160
}
define void @deallocate.([1024 x i32]* %memory.tmp, i32 %ptr.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %ptr..tmp = alloca i32 
  %block_ptr = alloca i32 
  %next_block_ptr = alloca i32 
  %next_block_size = alloca i32 
  %next_next_ptr = alloca i32 
  %prev_block_ptr = alloca i32 
  %current_block_size = alloca i32 
  %next_ptr = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %ptr.tmp, ptr %ptr..tmp
  %rcc.tmp.3 = load i32, ptr %ptr..tmp
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 4
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load i32, ptr %ptr..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 4
  store i32 %rcc.tmp.9, ptr %block_ptr
  %rcc.tmp.11 = load i32, ptr %block_ptr
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.14 = getelementptr [1024 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  store i32 1, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %block_ptr
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 3
  %rcc.tmp.19 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.20 = getelementptr [1024 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %next_block_ptr
  %rcc.tmp.23 = load i32, ptr %next_block_ptr
  %rcc.tmp.24 = sub i32 0, 1
  %rcc.tmp.25 = icmp ne i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %next_block_ptr
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.30 = getelementptr [1024 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 1
  br i1 %rcc.tmp.32, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.34 = load i32, ptr %next_block_ptr
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.38 = getelementptr [1024 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %next_block_size
  %rcc.tmp.41 = load i32, ptr %block_ptr
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  %rcc.tmp.44 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.45 = getelementptr [1024 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %block_ptr
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.50 = getelementptr [1024 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %next_block_size
  %rcc.tmp.53 = add i32 %rcc.tmp.51, %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 4
  store i32 %rcc.tmp.54, ptr %rcc.tmp.45
  %rcc.tmp.56 = load i32, ptr %next_block_ptr
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 3
  %rcc.tmp.59 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.60 = getelementptr [1024 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %next_next_ptr
  %rcc.tmp.63 = load i32, ptr %block_ptr
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 3
  %rcc.tmp.66 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.67 = getelementptr [1024 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %next_next_ptr
  store i32 %rcc.tmp.68, ptr %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %next_next_ptr
  %rcc.tmp.71 = sub i32 0, 1
  %rcc.tmp.72 = icmp ne i32 %rcc.tmp.70, %rcc.tmp.71
  br i1 %rcc.tmp.72, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.74 = load i32, ptr %next_next_ptr
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 2
  %rcc.tmp.77 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.78 = getelementptr [1024 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %block_ptr
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.87 = load i32, ptr %block_ptr
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 2
  %rcc.tmp.90 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.91 = getelementptr [1024 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  store i32 %rcc.tmp.92, ptr %prev_block_ptr
  %rcc.tmp.94 = load i32, ptr %prev_block_ptr
  %rcc.tmp.95 = sub i32 0, 1
  %rcc.tmp.96 = icmp ne i32 %rcc.tmp.94, %rcc.tmp.95
  br i1 %rcc.tmp.96, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.98 = load i32, ptr %prev_block_ptr
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.101 = getelementptr [1024 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.102, 1
  br i1 %rcc.tmp.103, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.105 = load i32, ptr %block_ptr
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.109 = getelementptr [1024 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.110, ptr %current_block_size
  %rcc.tmp.112 = load i32, ptr %prev_block_ptr
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  %rcc.tmp.115 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.116 = getelementptr [1024 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %prev_block_ptr
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  %rcc.tmp.120 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.121 = getelementptr [1024 x i32], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.122 = load i32, ptr %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %current_block_size
  %rcc.tmp.124 = add i32 %rcc.tmp.122, %rcc.tmp.123
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 4
  store i32 %rcc.tmp.125, ptr %rcc.tmp.116
  %rcc.tmp.127 = load i32, ptr %block_ptr
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 3
  %rcc.tmp.130 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.131 = getelementptr [1024 x i32], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.132, ptr %next_ptr
  %rcc.tmp.134 = load i32, ptr %prev_block_ptr
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 3
  %rcc.tmp.137 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.138 = getelementptr [1024 x i32], ptr %rcc.tmp.137, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.139 = load i32, ptr %next_ptr
  store i32 %rcc.tmp.139, ptr %rcc.tmp.138
  %rcc.tmp.141 = load i32, ptr %next_ptr
  %rcc.tmp.142 = sub i32 0, 1
  %rcc.tmp.143 = icmp ne i32 %rcc.tmp.141, %rcc.tmp.142
  br i1 %rcc.tmp.143, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.145 = load i32, ptr %next_ptr
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 2
  %rcc.tmp.148 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.149 = getelementptr [1024 x i32], ptr %rcc.tmp.148, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.150 = load i32, ptr %prev_block_ptr
  store i32 %rcc.tmp.150, ptr %rcc.tmp.149
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  ret void
}
define void @print_memory_state.([1024 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %current_ptr = alloca i32 
  %total_free = alloca i32 
  %total_allocated = alloca i32 
  %num_fragments = alloca i32 
  %is_free = alloca i32 
  %block_size = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 0, ptr %current_ptr
  store i32 0, ptr %total_free
  store i32 0, ptr %total_allocated
  store i32 0, ptr %num_fragments
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %current_ptr
  %rcc.tmp.8 = sub i32 0, 1
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %current_ptr
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.15 = getelementptr [1024 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %is_free
  %rcc.tmp.18 = load i32, ptr %current_ptr
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  %rcc.tmp.21 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.22 = getelementptr [1024 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %block_size
  %rcc.tmp.25 = load i32, ptr %is_free
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 1
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %total_free
  %rcc.tmp.29 = load i32, ptr %block_size
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %total_free
  %rcc.tmp.32 = load i32, ptr %num_fragments
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %num_fragments
  br label %if.merge
if.else:
  %rcc.tmp.36 = load i32, ptr %total_allocated
  %rcc.tmp.37 = load i32, ptr %block_size
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %total_allocated
  br label %if.merge
if.merge:
  %rcc.tmp.41 = load i32, ptr %current_ptr
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 3
  %rcc.tmp.44 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.45 = getelementptr [1024 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %current_ptr
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %total_free
  call void @printlnInt.(i32 %rcc.tmp.49)
  %rcc.tmp.51 = load i32, ptr %total_allocated
  call void @printlnInt.(i32 %rcc.tmp.51)
  %rcc.tmp.53 = load i32, ptr %num_fragments
  call void @printlnInt.(i32 %rcc.tmp.53)
  ret void
}
define i32 @deep_recursive_check.([1024 x i32]* %memory.tmp, i32 %depth.tmp, i32 %ptr.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %depth..tmp = alloca i32 
  %ptr..tmp = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 %ptr.tmp, ptr %ptr..tmp
  %rcc.tmp.4 = load i32, ptr %depth..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %ptr..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.15 = load i32, ptr %ptr..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.19 = getelementptr [1024 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp sgt i32 %rcc.tmp.20, 100
  br i1 %rcc.tmp.21, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.23 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.24 = load i32, ptr %depth..tmp
  %rcc.tmp.25 = sub i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load i32, ptr %ptr..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 3
  %rcc.tmp.29 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.30 = getelementptr [1024 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = call i32 @deep_recursive_check.([1024 x i32]* %rcc.tmp.23, i32 %rcc.tmp.25, i32 %rcc.tmp.31)
  br label %if.merge.3
if.else.3:
  %rcc.tmp.34 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.35 = load i32, ptr %depth..tmp
  %rcc.tmp.36 = sub i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load i32, ptr %ptr..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 2
  %rcc.tmp.40 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.41 = getelementptr [1024 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = call i32 @deep_recursive_check.([1024 x i32]* %rcc.tmp.34, i32 %rcc.tmp.36, i32 %rcc.tmp.42)
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.45 = phi i32 [%rcc.tmp.32, %if.then.3], [%rcc.tmp.43, %if.else.3]
  ret i32 %rcc.tmp.45
}
define i32 @another_utility_function.([1024 x i32]* %memory.tmp, i32 %start_ptr.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %start_ptr..tmp = alloca i32 
  %p = alloca i32 
  %count = alloca i32 
  %i = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %start_ptr.tmp, ptr %start_ptr..tmp
  %rcc.tmp.3 = load i32, ptr %start_ptr..tmp
  store i32 %rcc.tmp.3, ptr %p
  store i32 0, ptr %count
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %p
  %rcc.tmp.8 = sub i32 0, 1
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %p
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.15 = getelementptr [1024 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %p
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.26 = getelementptr [1024 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.31 = load i32, ptr %count
  %rcc.tmp.32 = load i32, ptr %p
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 4
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.38 = getelementptr [1024 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = srem i32 %rcc.tmp.40, 3
  %rcc.tmp.42 = sub i32 %rcc.tmp.41, 1
  %rcc.tmp.43 = mul i32 %rcc.tmp.39, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.31, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %count
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.52 = load i32, ptr %p
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 3
  %rcc.tmp.55 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.56 = getelementptr [1024 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %p
  br label %while.cond
while.end:
  %rcc.tmp.60 = load i32, ptr %count
  ret i32 %rcc.tmp.60
}
define i32 @complex_memory_scan.([1024 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %result = alloca i32 
  %i = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 0, ptr %result
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 5
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %result
  %rcc.tmp.10 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = mul i32 %rcc.tmp.11, 10
  %rcc.tmp.13 = call i32 @another_utility_function.([1024 x i32]* %rcc.tmp.10, i32 %rcc.tmp.12)
  %rcc.tmp.14 = add i32 %rcc.tmp.9, %rcc.tmp.13
  store i32 %rcc.tmp.14, ptr %result
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.20 = load i32, ptr %result
  ret i32 %rcc.tmp.20
}
