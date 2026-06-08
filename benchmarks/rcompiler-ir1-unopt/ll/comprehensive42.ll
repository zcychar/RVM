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
define void @init_heap.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  %heap_size = alloca i32 
  %block_size = alloca i32 
  %num_blocks = alloca i32 
  %i = alloca i32 
  %current_addr = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  store i32 1024, ptr %heap_size
  store i32 16, ptr %block_size
  %rcc.tmp.5 = load i32, ptr %heap_size
  %rcc.tmp.6 = load i32, ptr %block_size
  %rcc.tmp.7 = sdiv i32 %rcc.tmp.5, %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %num_blocks
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load i32, ptr %num_blocks
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %block_size
  %rcc.tmp.18 = mul i32 %rcc.tmp.16, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %current_addr
  %rcc.tmp.20 = load i32, ptr %current_addr
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.23 = getelementptr [1024 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load i32, ptr %block_size
  %rcc.tmp.27 = mul i32 %rcc.tmp.25, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %rcc.tmp.23
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.33 = load i32, ptr %num_blocks
  %rcc.tmp.34 = sub i32 %rcc.tmp.33, 1
  %rcc.tmp.35 = load i32, ptr %block_size
  %rcc.tmp.36 = mul i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.39 = getelementptr [1024 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = sub i32 0, 1
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  %rcc.tmp.42 = load i32*, ptr %free_list_head..tmp
  store i32 0, ptr %rcc.tmp.42
  ret void
}
define i32 @halloc.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  %block_addr = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  %rcc.tmp.3 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = sub i32 0, 1
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = sub i32 0, 1
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %block_addr
  %rcc.tmp.14 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.15 = load i32, ptr %block_addr
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.18 = getelementptr [1024 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.14
  %rcc.tmp.21 = load i32, ptr %block_addr
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.24 = getelementptr [1024 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = sub i32 0, 2
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %block_addr
  ret i32 %rcc.tmp.27
}
define void @hfree.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp, i32 %addr.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  %addr..tmp = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  store i32 %addr.tmp, ptr %addr..tmp
  %rcc.tmp.4 = load i32, ptr %addr..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 0
  %rcc.tmp.6 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %rcc.tmp.7
  %rcc.tmp.11 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.12 = load i32, ptr %addr..tmp
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  ret void
}
define void @main() {
entry:
  %heap = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %free_list_head = alloca i32 
  %total_blocks = alloca i32 
  %allocations = alloca [64 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %successful_allocs = alloca i32 
  %addr = alloca i32 
  %addr.2 = alloca i32 
  %j = alloca i32 
  %placed = alloca i1 
  %active_blocks = alloca i32 
  %fragmentation_metric = alloca i32 
  %max_contiguous_free = alloca i32 
  %current_contiguous = alloca i32 
  %current_ptr = alloca i32 
  %next_ptr = alloca i32 
  %remaining_free = alloca i32 
  %i.2 = alloca i32 
  %final_check_sum = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1024
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %heap, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %free_list_head
  store i32 64, ptr %total_blocks
  call void @init_heap.([1024 x i32]* %heap, i32* %free_list_head)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 64
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.20
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  store i32 0, ptr %successful_allocs
  br label %while.cond
while.cond:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 64
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = call i32 @halloc.([1024 x i32]* %heap, i32* %free_list_head)
  store i32 %rcc.tmp.33, ptr %addr
  %rcc.tmp.35 = load i32, ptr %addr
  %rcc.tmp.36 = sub i32 0, 1
  %rcc.tmp.37 = icmp ne i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %addr
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %successful_allocs
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %successful_allocs
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 32
  br i1 %rcc.tmp.56, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = srem i32 %rcc.tmp.59, 2
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 0
  br i1 %rcc.tmp.61, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  call void @hfree.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.66)
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.71 = sub i32 0, 1
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = icmp slt i32 %rcc.tmp.81, 16
  br i1 %rcc.tmp.82, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.85 = call i32 @halloc.([1024 x i32]* %heap, i32* %free_list_head)
  store i32 %rcc.tmp.85, ptr %addr.2
  %rcc.tmp.87 = load i32, ptr %addr.2
  %rcc.tmp.88 = sub i32 0, 1
  %rcc.tmp.89 = icmp ne i32 %rcc.tmp.87, %rcc.tmp.88
  br i1 %rcc.tmp.89, label %if.then.3, label %if.else.3
if.then.3:
  store i32 0, ptr %j
  store i1 0, ptr %placed
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.94 = load i32, ptr %j
  %rcc.tmp.95 = icmp slt i32 %rcc.tmp.94, 64
  br i1 %rcc.tmp.95, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.98 = load i32, ptr %j
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = sub i32 0, 1
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.101, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.105 = load i1, ptr %placed
  %rcc.tmp.106 = xor i1 %rcc.tmp.105, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.108 = phi i1 [0, %while.body.4], [%rcc.tmp.106, %and.rhs]
  br i1 %rcc.tmp.108, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.110 = load i32, ptr %j
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %addr.2
  store i32 %rcc.tmp.113, ptr %rcc.tmp.112
  store i1 1, ptr %placed
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.118 = load i32, ptr %j
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %j
  br label %while.cond.4
while.end.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %active_blocks
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = icmp slt i32 %rcc.tmp.131, 64
  br i1 %rcc.tmp.132, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  %rcc.tmp.139 = sub i32 0, 1
  %rcc.tmp.140 = icmp ne i32 %rcc.tmp.138, %rcc.tmp.139
  br i1 %rcc.tmp.140, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.142 = load i32, ptr %active_blocks
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 1
  store i32 %rcc.tmp.143, ptr %active_blocks
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 1
  store i32 %rcc.tmp.148, ptr %i
  br label %while.cond.5
while.end.5:
  store i32 0, ptr %fragmentation_metric
  %rcc.tmp.152 = load i32, ptr %active_blocks
  %rcc.tmp.153 = icmp sgt i32 %rcc.tmp.152, 40
  br i1 %rcc.tmp.153, label %if.then.6, label %if.else.6
if.then.6:
  store i32 0, ptr %max_contiguous_free
  store i32 0, ptr %current_contiguous
  %rcc.tmp.157 = load i32, ptr %free_list_head
  store i32 %rcc.tmp.157, ptr %current_ptr
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.160 = load i32, ptr %current_ptr
  %rcc.tmp.161 = sub i32 0, 1
  %rcc.tmp.162 = icmp ne i32 %rcc.tmp.160, %rcc.tmp.161
  br i1 %rcc.tmp.162, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.165 = load i32, ptr %current_contiguous
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %current_contiguous
  %rcc.tmp.168 = load i32, ptr %current_ptr
  %rcc.tmp.169 = add i32 %rcc.tmp.168, 0
  %rcc.tmp.170 = getelementptr [1024 x i32], ptr %heap, i32 0, i32 %rcc.tmp.169
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.170
  store i32 %rcc.tmp.171, ptr %next_ptr
  %rcc.tmp.173 = load i32, ptr %next_ptr
  %rcc.tmp.174 = load i32, ptr %current_ptr
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 16
  %rcc.tmp.176 = icmp ne i32 %rcc.tmp.173, %rcc.tmp.175
  br i1 %rcc.tmp.176, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.178 = load i32, ptr %current_contiguous
  %rcc.tmp.179 = load i32, ptr %max_contiguous_free
  %rcc.tmp.180 = icmp sgt i32 %rcc.tmp.178, %rcc.tmp.179
  br i1 %rcc.tmp.180, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.182 = load i32, ptr %current_contiguous
  store i32 %rcc.tmp.182, ptr %max_contiguous_free
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  store i32 0, ptr %current_contiguous
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.189 = load i32, ptr %next_ptr
  store i32 %rcc.tmp.189, ptr %current_ptr
  br label %while.cond.6
while.end.6:
  %rcc.tmp.192 = load i32, ptr %total_blocks
  %rcc.tmp.193 = load i32, ptr %active_blocks
  %rcc.tmp.194 = sub i32 %rcc.tmp.192, %rcc.tmp.193
  store i32 %rcc.tmp.194, ptr %remaining_free
  %rcc.tmp.196 = load i32, ptr %remaining_free
  %rcc.tmp.197 = icmp sgt i32 %rcc.tmp.196, 0
  br i1 %rcc.tmp.197, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.199 = load i32, ptr %max_contiguous_free
  %rcc.tmp.200 = mul i32 %rcc.tmp.199, 100
  %rcc.tmp.201 = load i32, ptr %remaining_free
  %rcc.tmp.202 = sdiv i32 %rcc.tmp.200, %rcc.tmp.201
  store i32 %rcc.tmp.202, ptr %fragmentation_metric
  br label %if.merge.9
if.else.9:
  store i32 0, ptr %fragmentation_metric
  br label %if.merge.9
if.merge.9:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.209 = load i32, ptr %active_blocks
  %rcc.tmp.210 = icmp slt i32 %rcc.tmp.209, 48
  br i1 %rcc.tmp.210, label %if.then.10, label %if.else.10
if.then.10:
  store i32 32, ptr %i.2
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.214 = load i32, ptr %i.2
  %rcc.tmp.215 = icmp slt i32 %rcc.tmp.214, 64
  br i1 %rcc.tmp.215, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.218 = load i32, ptr %i.2
  %rcc.tmp.219 = srem i32 %rcc.tmp.218, 3
  %rcc.tmp.220 = icmp eq i32 %rcc.tmp.219, 0
  br i1 %rcc.tmp.220, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.222 = load i32, ptr %i.2
  %rcc.tmp.223 = add i32 %rcc.tmp.222, 0
  %rcc.tmp.224 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.223
  %rcc.tmp.225 = load i32, ptr %rcc.tmp.224
  %rcc.tmp.226 = sub i32 0, 1
  %rcc.tmp.227 = icmp ne i32 %rcc.tmp.225, %rcc.tmp.226
  br i1 %rcc.tmp.227, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.229 = load i32, ptr %i.2
  %rcc.tmp.230 = add i32 %rcc.tmp.229, 0
  %rcc.tmp.231 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.230
  %rcc.tmp.232 = load i32, ptr %rcc.tmp.231
  call void @hfree.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.232)
  %rcc.tmp.234 = load i32, ptr %i.2
  %rcc.tmp.235 = add i32 %rcc.tmp.234, 0
  %rcc.tmp.236 = getelementptr [64 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.235
  %rcc.tmp.237 = sub i32 0, 1
  store i32 %rcc.tmp.237, ptr %rcc.tmp.236
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.else.11:
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.243 = load i32, ptr %i.2
  %rcc.tmp.244 = add i32 %rcc.tmp.243, 1
  store i32 %rcc.tmp.244, ptr %i.2
  br label %while.cond.7
while.end.7:
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  store i32 0, ptr %final_check_sum
  store i32 0, ptr %i
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.252 = load i32, ptr %i
  %rcc.tmp.253 = icmp slt i32 %rcc.tmp.252, 1024
  br i1 %rcc.tmp.253, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.256 = load i32, ptr %i
  %rcc.tmp.257 = add i32 %rcc.tmp.256, 0
  %rcc.tmp.258 = getelementptr [1024 x i32], ptr %heap, i32 0, i32 %rcc.tmp.257
  %rcc.tmp.259 = load i32, ptr %rcc.tmp.258
  %rcc.tmp.260 = sub i32 0, 2
  %rcc.tmp.261 = icmp eq i32 %rcc.tmp.259, %rcc.tmp.260
  br i1 %rcc.tmp.261, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.263 = load i32, ptr %final_check_sum
  %rcc.tmp.264 = load i32, ptr %i
  %rcc.tmp.265 = add i32 %rcc.tmp.263, %rcc.tmp.264
  store i32 %rcc.tmp.265, ptr %final_check_sum
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.269 = load i32, ptr %i
  %rcc.tmp.270 = add i32 %rcc.tmp.269, 1
  store i32 %rcc.tmp.270, ptr %i
  br label %while.cond.8
while.end.8:
  %rcc.tmp.273 = load i32, ptr %fragmentation_metric
  call void @printlnInt.(i32 %rcc.tmp.273)
  %rcc.tmp.275 = load i32, ptr %final_check_sum
  call void @printlnInt.(i32 %rcc.tmp.275)
  call void @exit.(i32 0)
  ret void
}
