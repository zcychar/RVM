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
define void @init_allocator.([2048 x i32]* %heap.tmp, i1* %is_initialized.tmp) {
entry:
  %heap..tmp = alloca [2048 x i32]* 
  %is_initialized..tmp = alloca i1* 
  store [2048 x i32]* %heap.tmp, ptr %heap..tmp
  store i1* %is_initialized.tmp, ptr %is_initialized..tmp
  %rcc.tmp.3 = load i1*, ptr %is_initialized..tmp
  %rcc.tmp.4 = load i1, ptr %rcc.tmp.3
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.9 = getelementptr [2048 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = sub i32 2048, 2
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.13 = getelementptr [2048 x i32], ptr %rcc.tmp.12, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.16 = getelementptr [2048 x i32], ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = load i1*, ptr %is_initialized..tmp
  store i1 1, ptr %rcc.tmp.19
  ret void
}
define i32 @custom_alloc.([2048 x i32]* %heap.tmp, i32 %size.tmp) {
entry:
  %heap..tmp = alloca [2048 x i32]* 
  %size..tmp = alloca i32 
  %required_size = alloca i32 
  %current_block_ptr = alloca i32 
  %best_fit_ptr = alloca i32 
  %best_fit_size = alloca i32 
  %block_size = alloca i32 
  %block_status = alloca i32 
  %original_size = alloca i32 
  %remaining_size = alloca i32 
  %new_block_ptr = alloca i32 
  store [2048 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.3, ptr %required_size
  %rcc.tmp.5 = load i32, ptr %required_size
  %rcc.tmp.6 = icmp sle i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = sub i32 0, 1
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %current_block_ptr
  %rcc.tmp.12 = sub i32 0, 1
  store i32 %rcc.tmp.12, ptr %best_fit_ptr
  %rcc.tmp.14 = add i32 2048, 1
  store i32 %rcc.tmp.14, ptr %best_fit_size
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %current_block_ptr
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 2048
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %current_block_ptr
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.24 = getelementptr [2048 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %block_size
  %rcc.tmp.27 = load i32, ptr %current_block_ptr
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.31 = getelementptr [2048 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %block_status
  %rcc.tmp.34 = load i32, ptr %block_status
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.34, 0
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load i32, ptr %block_size
  %rcc.tmp.38 = load i32, ptr %required_size
  %rcc.tmp.39 = icmp sge i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.41 = load i32, ptr %block_size
  %rcc.tmp.42 = load i32, ptr %best_fit_size
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.45 = load i32, ptr %current_block_ptr
  store i32 %rcc.tmp.45, ptr %best_fit_ptr
  %rcc.tmp.47 = load i32, ptr %block_size
  store i32 %rcc.tmp.47, ptr %best_fit_size
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
  %rcc.tmp.55 = load i32, ptr %block_size
  %rcc.tmp.56 = icmp sle i32 %rcc.tmp.55, 0
  br i1 %rcc.tmp.56, label %if.then.5, label %if.else.5
if.then.5:
  br label %while.linker
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.60 = load i32, ptr %current_block_ptr
  %rcc.tmp.61 = load i32, ptr %block_size
  %rcc.tmp.62 = add i32 %rcc.tmp.60, %rcc.tmp.61
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 2
  store i32 %rcc.tmp.63, ptr %current_block_ptr
  br label %while.cond
while.end:
  %rcc.tmp.66 = load i32, ptr %best_fit_ptr
  %rcc.tmp.67 = sub i32 0, 1
  %rcc.tmp.68 = icmp ne i32 %rcc.tmp.66, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.70 = load i32, ptr %best_fit_ptr
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.73 = getelementptr [2048 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %original_size
  %rcc.tmp.76 = load i32, ptr %original_size
  %rcc.tmp.77 = load i32, ptr %required_size
  %rcc.tmp.78 = sub i32 %rcc.tmp.76, %rcc.tmp.77
  %rcc.tmp.79 = sub i32 %rcc.tmp.78, 2
  store i32 %rcc.tmp.79, ptr %remaining_size
  %rcc.tmp.81 = load i32, ptr %remaining_size
  %rcc.tmp.82 = icmp sgt i32 %rcc.tmp.81, 2
  br i1 %rcc.tmp.82, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.84 = load i32, ptr %best_fit_ptr
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.87 = getelementptr [2048 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %required_size
  store i32 %rcc.tmp.88, ptr %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %best_fit_ptr
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  %rcc.tmp.93 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.94 = getelementptr [2048 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  store i32 1, ptr %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %best_fit_ptr
  %rcc.tmp.97 = load i32, ptr %required_size
  %rcc.tmp.98 = add i32 %rcc.tmp.96, %rcc.tmp.97
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 2
  store i32 %rcc.tmp.99, ptr %new_block_ptr
  %rcc.tmp.101 = load i32, ptr %new_block_ptr
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.104 = getelementptr [2048 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %remaining_size
  store i32 %rcc.tmp.105, ptr %rcc.tmp.104
  %rcc.tmp.107 = load i32, ptr %new_block_ptr
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  %rcc.tmp.110 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.111 = getelementptr [2048 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.109
  store i32 0, ptr %rcc.tmp.111
  br label %if.merge.7
if.else.7:
  %rcc.tmp.114 = load i32, ptr %best_fit_ptr
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  %rcc.tmp.117 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.118 = getelementptr [2048 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.116
  store i32 1, ptr %rcc.tmp.118
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.121 = load i32, ptr %best_fit_ptr
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 2
  ret i32 %rcc.tmp.122
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.125 = sub i32 0, 1
  ret i32 %rcc.tmp.125
}
define void @custom_free.([2048 x i32]* %heap.tmp, i32 %ptr.tmp) {
entry:
  %heap..tmp = alloca [2048 x i32]* 
  %ptr..tmp = alloca i32 
  %block_ptr = alloca i32 
  %current_ptr = alloca i32 
  %current_size = alloca i32 
  %next_ptr = alloca i32 
  %next_size = alloca i32 
  store [2048 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %ptr.tmp, ptr %ptr..tmp
  %rcc.tmp.3 = load i32, ptr %ptr..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 2
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load i32, ptr %ptr..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 2
  store i32 %rcc.tmp.9, ptr %block_ptr
  %rcc.tmp.11 = load i32, ptr %block_ptr
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.15 = getelementptr [2048 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  store i32 0, ptr %current_ptr
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %current_ptr
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 2048
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %current_ptr
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.26 = getelementptr [2048 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %current_size
  %rcc.tmp.29 = load i32, ptr %current_size
  %rcc.tmp.30 = icmp sle i32 %rcc.tmp.29, 0
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.34 = load i32, ptr %current_ptr
  %rcc.tmp.35 = load i32, ptr %current_size
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 2
  store i32 %rcc.tmp.37, ptr %next_ptr
  %rcc.tmp.39 = load i32, ptr %next_ptr
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 2048
  br i1 %rcc.tmp.40, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.42 = load i32, ptr %current_ptr
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  %rcc.tmp.45 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.46 = getelementptr [2048 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.47, 0
  br i1 %rcc.tmp.48, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.50 = load i32, ptr %next_ptr
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  %rcc.tmp.53 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.54 = getelementptr [2048 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.55, 0
  br i1 %rcc.tmp.56, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.58 = load i32, ptr %next_ptr
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.61 = getelementptr [2048 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %next_size
  %rcc.tmp.64 = load i32, ptr %current_ptr
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [2048 x i32]*, ptr %heap..tmp
  %rcc.tmp.67 = getelementptr [2048 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %current_size
  %rcc.tmp.69 = load i32, ptr %next_size
  %rcc.tmp.70 = add i32 %rcc.tmp.68, %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 2
  store i32 %rcc.tmp.71, ptr %rcc.tmp.67
  br label %while.cond
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.79 = load i32, ptr %next_ptr
  store i32 %rcc.tmp.79, ptr %current_ptr
  br label %while.cond
while.end:
  ret void
}
define void @main() {
entry:
  %heap = alloca [2048 x i32] 
  %fill.idx = alloca i32 
  %is_initialized = alloca i1 
  %total_allocations = alloca i32 
  %failed_allocations = alloca i32 
  %i = alloca i32 
  %allocations = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %allocation_count = alloca i32 
  %size_selector = alloca i32 
  %alloc_size = alloca i32 
  %ptr = alloca i32 
  %j = alloca i32 
  %free_idx = alloca i32 
  %free_ptr = alloca i32 
  %final_sum = alloca i32 
  %k = alloca i32 
  %ptr.2 = alloca i32 
  %block_ptr = alloca i32 
  %size = alloca i32 
  %l = alloca i32 
  %total_free_space = alloca i32 
  %current_block_ptr = alloca i32 
  %block_size = alloca i32 
  %block_status = alloca i32 
  %debug_info = alloca i32 
  %inner_counter = alloca i32 
  %m = alloca i32 
  %final_ptr = alloca i32 
  %another_ptr = alloca i32 
  %last_ptr = alloca i32 
  %final_check_sum = alloca i32 
  %p = alloca i32 
  %dead_code_val = alloca i32 
  %q = alloca i32 
  %r = alloca i32 
  %complex_calc = alloca i32 
  %s = alloca i32 
  %a = alloca i32 
  %b = alloca i32 
  %c = alloca i32 
  %d = alloca i32 
  %a.2 = alloca i1 
  %outer_var = alloca i32 
  %inner_var = alloca i32 
  %temp_var = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %z = alloca i32 
  %loop_scoped = alloca i32 
  %shadow_var = alloca i32 
  %shadow_var.2 = alloca i32 
  %check = alloca i32 
  %val = alloca i32 
  %final_val = alloca i32 
  %temp_final = alloca i32 
  %another_check = alloca i32 
  %val2 = alloca i32 
  %val2.2 = alloca i32 
  %mut_outer = alloca i32 
  %mut_outer.2 = alloca i32 
  %mut_outer.3 = alloca i32 
  %error_var = alloca i32 
  %inner_error_var = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2048
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i1 0, ptr %is_initialized
  call void @init_allocator.([2048 x i32]* %heap, i1* %is_initialized)
  store i32 0, ptr %total_allocations
  store i32 0, ptr %failed_allocations
  store i32 0, ptr %i
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 100
  br i1 %rcc.tmp.20, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.22 = load i32, ptr %fill.idx.2
  %rcc.tmp.23 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.22
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.25, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %allocation_count
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.30, 200
  br i1 %rcc.tmp.31, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 10
  store i32 %rcc.tmp.35, ptr %size_selector
  store i32 0, ptr %alloc_size
  %rcc.tmp.38 = load i32, ptr %size_selector
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  store i32 10, ptr %alloc_size
  br label %if.merge
if.else:
  %rcc.tmp.43 = load i32, ptr %size_selector
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.43, 1
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  store i32 50, ptr %alloc_size
  br label %if.merge.2
if.else.2:
  %rcc.tmp.48 = load i32, ptr %size_selector
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 2
  br i1 %rcc.tmp.49, label %if.then.3, label %if.else.3
if.then.3:
  store i32 25, ptr %alloc_size
  br label %if.merge.3
if.else.3:
  %rcc.tmp.53 = load i32, ptr %size_selector
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.53, 3
  br i1 %rcc.tmp.54, label %if.then.4, label %if.else.4
if.then.4:
  store i32 120, ptr %alloc_size
  br label %if.merge.4
if.else.4:
  %rcc.tmp.58 = load i32, ptr %size_selector
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 4
  br i1 %rcc.tmp.59, label %if.then.5, label %if.else.5
if.then.5:
  store i32 5, ptr %alloc_size
  br label %if.merge.5
if.else.5:
  %rcc.tmp.63 = load i32, ptr %size_selector
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 5
  br i1 %rcc.tmp.64, label %if.then.6, label %if.else.6
if.then.6:
  store i32 80, ptr %alloc_size
  br label %if.merge.6
if.else.6:
  %rcc.tmp.68 = load i32, ptr %size_selector
  %rcc.tmp.69 = icmp eq i32 %rcc.tmp.68, 6
  br i1 %rcc.tmp.69, label %if.then.7, label %if.else.7
if.then.7:
  store i32 200, ptr %alloc_size
  br label %if.merge.7
if.else.7:
  %rcc.tmp.73 = load i32, ptr %size_selector
  %rcc.tmp.74 = icmp eq i32 %rcc.tmp.73, 7
  br i1 %rcc.tmp.74, label %if.then.8, label %if.else.8
if.then.8:
  store i32 15, ptr %alloc_size
  br label %if.merge.8
if.else.8:
  %rcc.tmp.78 = load i32, ptr %size_selector
  %rcc.tmp.79 = icmp eq i32 %rcc.tmp.78, 8
  br i1 %rcc.tmp.79, label %if.then.9, label %if.else.9
if.then.9:
  store i32 30, ptr %alloc_size
  br label %if.merge.9
if.else.9:
  store i32 60, ptr %alloc_size
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
  %rcc.tmp.93 = load i32, ptr %alloc_size
  %rcc.tmp.94 = call i32 @custom_alloc.([2048 x i32]* %heap, i32 %rcc.tmp.93)
  store i32 %rcc.tmp.94, ptr %ptr
  %rcc.tmp.96 = load i32, ptr %ptr
  %rcc.tmp.97 = sub i32 0, 1
  %rcc.tmp.98 = icmp ne i32 %rcc.tmp.96, %rcc.tmp.97
  br i1 %rcc.tmp.98, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.100 = load i32, ptr %allocation_count
  %rcc.tmp.101 = icmp slt i32 %rcc.tmp.100, 100
  br i1 %rcc.tmp.101, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.103 = load i32, ptr %allocation_count
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %ptr
  store i32 %rcc.tmp.106, ptr %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %allocation_count
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %allocation_count
  br label %if.merge.11
if.else.11:
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.113 = load i32, ptr %total_allocations
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %total_allocations
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.118 = load i32, ptr %j
  %rcc.tmp.119 = load i32, ptr %alloc_size
  %rcc.tmp.120 = icmp slt i32 %rcc.tmp.118, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.123 = load i32, ptr %ptr
  %rcc.tmp.124 = load i32, ptr %j
  %rcc.tmp.125 = add i32 %rcc.tmp.123, %rcc.tmp.124
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.128 = load i32, ptr %ptr
  %rcc.tmp.129 = load i32, ptr %j
  %rcc.tmp.130 = add i32 %rcc.tmp.128, %rcc.tmp.129
  %rcc.tmp.131 = srem i32 %rcc.tmp.130, 128
  store i32 %rcc.tmp.131, ptr %rcc.tmp.127
  %rcc.tmp.133 = load i32, ptr %j
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 1
  store i32 %rcc.tmp.134, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge.10
if.else.10:
  %rcc.tmp.138 = load i32, ptr %failed_allocations
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %failed_allocations
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = srem i32 %rcc.tmp.142, 5
  %rcc.tmp.144 = icmp eq i32 %rcc.tmp.143, 4
  br i1 %rcc.tmp.144, label %if.then.12, label %if.else.12
if.then.12:
  store i32 0, ptr %free_idx
  %rcc.tmp.147 = load i32, ptr %allocation_count
  %rcc.tmp.148 = icmp sgt i32 %rcc.tmp.147, 0
  br i1 %rcc.tmp.148, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.150 = load i32, ptr %i
  %rcc.tmp.151 = mul i32 %rcc.tmp.150, 17
  %rcc.tmp.152 = load i32, ptr %allocation_count
  %rcc.tmp.153 = srem i32 %rcc.tmp.151, %rcc.tmp.152
  store i32 %rcc.tmp.153, ptr %free_idx
  %rcc.tmp.155 = load i32, ptr %free_idx
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 0
  %rcc.tmp.157 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.156
  %rcc.tmp.158 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.158, ptr %free_ptr
  %rcc.tmp.160 = load i32, ptr %free_ptr
  %rcc.tmp.161 = icmp ne i32 %rcc.tmp.160, 0
  br i1 %rcc.tmp.161, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.163 = load i32, ptr %free_ptr
  call void @custom_free.([2048 x i32]* %heap, i32 %rcc.tmp.163)
  %rcc.tmp.165 = load i32, ptr %free_idx
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 0
  %rcc.tmp.167 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.166
  store i32 0, ptr %rcc.tmp.167
  br label %if.merge.14
if.else.14:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.175 = load i32, ptr %i
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 1
  store i32 %rcc.tmp.176, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %final_sum
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.182 = load i32, ptr %k
  %rcc.tmp.183 = load i32, ptr %allocation_count
  %rcc.tmp.184 = icmp slt i32 %rcc.tmp.182, %rcc.tmp.183
  br i1 %rcc.tmp.184, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.187 = load i32, ptr %k
  %rcc.tmp.188 = add i32 %rcc.tmp.187, 0
  %rcc.tmp.189 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.188
  %rcc.tmp.190 = load i32, ptr %rcc.tmp.189
  store i32 %rcc.tmp.190, ptr %ptr.2
  %rcc.tmp.192 = load i32, ptr %ptr.2
  %rcc.tmp.193 = icmp ne i32 %rcc.tmp.192, 0
  br i1 %rcc.tmp.193, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.195 = load i32, ptr %ptr.2
  %rcc.tmp.196 = sub i32 %rcc.tmp.195, 2
  store i32 %rcc.tmp.196, ptr %block_ptr
  %rcc.tmp.198 = load i32, ptr %block_ptr
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 0
  %rcc.tmp.200 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %rcc.tmp.200
  store i32 %rcc.tmp.201, ptr %size
  store i32 0, ptr %l
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.205 = load i32, ptr %l
  %rcc.tmp.206 = load i32, ptr %size
  %rcc.tmp.207 = icmp slt i32 %rcc.tmp.205, %rcc.tmp.206
  br i1 %rcc.tmp.207, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.210 = load i32, ptr %final_sum
  %rcc.tmp.211 = load i32, ptr %ptr.2
  %rcc.tmp.212 = load i32, ptr %l
  %rcc.tmp.213 = add i32 %rcc.tmp.211, %rcc.tmp.212
  %rcc.tmp.214 = add i32 %rcc.tmp.213, 0
  %rcc.tmp.215 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.214
  %rcc.tmp.216 = load i32, ptr %rcc.tmp.215
  %rcc.tmp.217 = add i32 %rcc.tmp.210, %rcc.tmp.216
  store i32 %rcc.tmp.217, ptr %final_sum
  %rcc.tmp.219 = load i32, ptr %l
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 1
  store i32 %rcc.tmp.220, ptr %l
  br label %while.cond.4
while.end.4:
  br label %if.merge.15
if.else.15:
  br label %if.merge.15
if.merge.15:
  %rcc.tmp.225 = load i32, ptr %k
  %rcc.tmp.226 = add i32 %rcc.tmp.225, 1
  store i32 %rcc.tmp.226, ptr %k
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %total_free_space
  store i32 0, ptr %current_block_ptr
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.232 = load i32, ptr %current_block_ptr
  %rcc.tmp.233 = icmp slt i32 %rcc.tmp.232, 2048
  br i1 %rcc.tmp.233, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.236 = load i32, ptr %current_block_ptr
  %rcc.tmp.237 = add i32 %rcc.tmp.236, 0
  %rcc.tmp.238 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.237
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.238
  store i32 %rcc.tmp.239, ptr %block_size
  %rcc.tmp.241 = load i32, ptr %current_block_ptr
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 0
  %rcc.tmp.243 = add i32 %rcc.tmp.242, 1
  %rcc.tmp.244 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.243
  %rcc.tmp.245 = load i32, ptr %rcc.tmp.244
  store i32 %rcc.tmp.245, ptr %block_status
  %rcc.tmp.247 = load i32, ptr %block_status
  %rcc.tmp.248 = icmp eq i32 %rcc.tmp.247, 0
  br i1 %rcc.tmp.248, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.250 = load i32, ptr %total_free_space
  %rcc.tmp.251 = load i32, ptr %block_size
  %rcc.tmp.252 = add i32 %rcc.tmp.250, %rcc.tmp.251
  store i32 %rcc.tmp.252, ptr %total_free_space
  br label %if.merge.16
if.else.16:
  br label %if.merge.16
if.merge.16:
  %rcc.tmp.256 = load i32, ptr %block_size
  %rcc.tmp.257 = icmp sle i32 %rcc.tmp.256, 0
  br i1 %rcc.tmp.257, label %if.then.17, label %if.else.17
if.then.17:
  br label %while.linker.5
if.else.17:
  br label %if.merge.17
if.merge.17:
  %rcc.tmp.261 = load i32, ptr %current_block_ptr
  %rcc.tmp.262 = load i32, ptr %block_size
  %rcc.tmp.263 = add i32 %rcc.tmp.261, %rcc.tmp.262
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 2
  store i32 %rcc.tmp.264, ptr %current_block_ptr
  br label %while.cond.5
while.end.5:
  br i1 1, label %if.then.18, label %if.else.18
if.then.18:
  store i32 1, ptr %debug_info
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.270 = load i32, ptr %debug_info
  %rcc.tmp.271 = icmp slt i32 %rcc.tmp.270, 5
  br i1 %rcc.tmp.271, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  store i32 0, ptr %inner_counter
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.276 = load i32, ptr %inner_counter
  %rcc.tmp.277 = load i32, ptr %debug_info
  %rcc.tmp.278 = icmp slt i32 %rcc.tmp.276, %rcc.tmp.277
  br i1 %rcc.tmp.278, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.281 = load i32, ptr %inner_counter
  %rcc.tmp.282 = add i32 %rcc.tmp.281, 1
  store i32 %rcc.tmp.282, ptr %inner_counter
  br label %while.cond.7
while.end.7:
  %rcc.tmp.285 = load i32, ptr %debug_info
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 1
  store i32 %rcc.tmp.286, ptr %debug_info
  br label %while.cond.6
while.end.6:
  br label %if.merge.18
if.else.18:
  br label %if.merge.18
if.merge.18:
  %rcc.tmp.291 = load i32, ptr %total_allocations
  call void @printlnInt.(i32 %rcc.tmp.291)
  %rcc.tmp.293 = load i32, ptr %failed_allocations
  call void @printlnInt.(i32 %rcc.tmp.293)
  %rcc.tmp.295 = load i32, ptr %final_sum
  call void @printlnInt.(i32 %rcc.tmp.295)
  %rcc.tmp.297 = load i32, ptr %total_free_space
  call void @printlnInt.(i32 %rcc.tmp.297)
  store i32 0, ptr %m
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.301 = load i32, ptr %m
  %rcc.tmp.302 = icmp slt i32 %rcc.tmp.301, 100
  br i1 %rcc.tmp.302, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.305 = load i32, ptr %m
  %rcc.tmp.306 = add i32 %rcc.tmp.305, 0
  %rcc.tmp.307 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.306
  %rcc.tmp.308 = load i32, ptr %rcc.tmp.307
  %rcc.tmp.309 = icmp ne i32 %rcc.tmp.308, 0
  br i1 %rcc.tmp.309, label %if.then.19, label %if.else.19
if.then.19:
  %rcc.tmp.311 = load i32, ptr %m
  %rcc.tmp.312 = add i32 %rcc.tmp.311, 0
  %rcc.tmp.313 = getelementptr [100 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.312
  %rcc.tmp.314 = load i32, ptr %rcc.tmp.313
  call void @custom_free.([2048 x i32]* %heap, i32 %rcc.tmp.314)
  br label %if.merge.19
if.else.19:
  br label %if.merge.19
if.merge.19:
  %rcc.tmp.318 = load i32, ptr %m
  %rcc.tmp.319 = add i32 %rcc.tmp.318, 1
  store i32 %rcc.tmp.319, ptr %m
  br label %while.cond.8
while.end.8:
  %rcc.tmp.322 = call i32 @custom_alloc.([2048 x i32]* %heap, i32 1024)
  store i32 %rcc.tmp.322, ptr %final_ptr
  %rcc.tmp.324 = load i32, ptr %final_ptr
  %rcc.tmp.325 = sub i32 0, 1
  %rcc.tmp.326 = icmp ne i32 %rcc.tmp.324, %rcc.tmp.325
  br i1 %rcc.tmp.326, label %if.then.20, label %if.else.20
if.then.20:
  call void @printlnInt.(i32 1)
  br label %if.merge.20
if.else.20:
  call void @printlnInt.(i32 0)
  br label %if.merge.20
if.merge.20:
  %rcc.tmp.332 = call i32 @custom_alloc.([2048 x i32]* %heap, i32 1024)
  store i32 %rcc.tmp.332, ptr %another_ptr
  %rcc.tmp.334 = load i32, ptr %another_ptr
  %rcc.tmp.335 = sub i32 0, 1
  %rcc.tmp.336 = icmp ne i32 %rcc.tmp.334, %rcc.tmp.335
  br i1 %rcc.tmp.336, label %if.then.21, label %if.else.21
if.then.21:
  call void @printlnInt.(i32 1)
  br label %if.merge.21
if.else.21:
  call void @printlnInt.(i32 0)
  br label %if.merge.21
if.merge.21:
  %rcc.tmp.342 = load i32, ptr %final_ptr
  call void @custom_free.([2048 x i32]* %heap, i32 %rcc.tmp.342)
  %rcc.tmp.344 = call i32 @custom_alloc.([2048 x i32]* %heap, i32 2000)
  store i32 %rcc.tmp.344, ptr %last_ptr
  %rcc.tmp.346 = load i32, ptr %last_ptr
  %rcc.tmp.347 = sub i32 0, 1
  %rcc.tmp.348 = icmp ne i32 %rcc.tmp.346, %rcc.tmp.347
  br i1 %rcc.tmp.348, label %if.then.22, label %if.else.22
if.then.22:
  call void @printlnInt.(i32 1)
  br label %if.merge.22
if.else.22:
  call void @printlnInt.(i32 0)
  br label %if.merge.22
if.merge.22:
  store i32 0, ptr %final_check_sum
  store i32 0, ptr %p
  br label %while.cond.9
while.cond.9:
  %rcc.tmp.357 = load i32, ptr %p
  %rcc.tmp.358 = icmp slt i32 %rcc.tmp.357, 2048
  br i1 %rcc.tmp.358, label %while.body.9, label %while.linker.9
while.linker.9:
  br label %while.end.9
while.body.9:
  %rcc.tmp.361 = load i32, ptr %final_check_sum
  %rcc.tmp.362 = load i32, ptr %p
  %rcc.tmp.363 = add i32 %rcc.tmp.362, 0
  %rcc.tmp.364 = getelementptr [2048 x i32], ptr %heap, i32 0, i32 %rcc.tmp.363
  %rcc.tmp.365 = load i32, ptr %rcc.tmp.364
  %rcc.tmp.366 = add i32 %rcc.tmp.361, %rcc.tmp.365
  store i32 %rcc.tmp.366, ptr %final_check_sum
  %rcc.tmp.368 = load i32, ptr %p
  %rcc.tmp.369 = add i32 %rcc.tmp.368, 1
  store i32 %rcc.tmp.369, ptr %p
  br label %while.cond.9
while.end.9:
  %rcc.tmp.372 = load i32, ptr %final_check_sum
  %rcc.tmp.373 = srem i32 %rcc.tmp.372, 1000
  call void @printlnInt.(i32 %rcc.tmp.373)
  br i1 0, label %if.then.23, label %if.else.23
if.then.23:
  store i32 0, ptr %dead_code_val
  store i32 0, ptr %q
  br label %while.cond.10
while.cond.10:
  %rcc.tmp.379 = load i32, ptr %q
  %rcc.tmp.380 = icmp slt i32 %rcc.tmp.379, 1000
  br i1 %rcc.tmp.380, label %while.body.10, label %while.linker.10
while.linker.10:
  br label %while.end.10
while.body.10:
  %rcc.tmp.383 = load i32, ptr %dead_code_val
  %rcc.tmp.384 = load i32, ptr %q
  %rcc.tmp.385 = add i32 %rcc.tmp.383, %rcc.tmp.384
  store i32 %rcc.tmp.385, ptr %dead_code_val
  %rcc.tmp.387 = load i32, ptr %q
  %rcc.tmp.388 = add i32 %rcc.tmp.387, 1
  store i32 %rcc.tmp.388, ptr %q
  br label %while.cond.10
while.end.10:
  %rcc.tmp.391 = load i32, ptr %dead_code_val
  call void @printlnInt.(i32 %rcc.tmp.391)
  br label %if.merge.23
if.else.23:
  br label %if.merge.23
if.merge.23:
  store i32 0, ptr %r
  store i32 0, ptr %complex_calc
  br label %while.cond.11
while.cond.11:
  %rcc.tmp.398 = load i32, ptr %r
  %rcc.tmp.399 = icmp slt i32 %rcc.tmp.398, 50
  br i1 %rcc.tmp.399, label %while.body.11, label %while.linker.11
while.linker.11:
  br label %while.end.11
while.body.11:
  store i32 0, ptr %s
  br label %while.cond.12
while.cond.12:
  %rcc.tmp.404 = load i32, ptr %s
  %rcc.tmp.405 = icmp slt i32 %rcc.tmp.404, 50
  br i1 %rcc.tmp.405, label %while.body.12, label %while.linker.12
while.linker.12:
  br label %while.end.12
while.body.12:
  %rcc.tmp.408 = load i32, ptr %r
  %rcc.tmp.409 = load i32, ptr %s
  %rcc.tmp.410 = mul i32 %rcc.tmp.408, %rcc.tmp.409
  %rcc.tmp.411 = srem i32 %rcc.tmp.410, 3
  %rcc.tmp.412 = icmp eq i32 %rcc.tmp.411, 0
  br i1 %rcc.tmp.412, label %if.then.24, label %if.else.24
if.then.24:
  %rcc.tmp.414 = load i32, ptr %complex_calc
  %rcc.tmp.415 = load i32, ptr %r
  %rcc.tmp.416 = add i32 %rcc.tmp.414, %rcc.tmp.415
  %rcc.tmp.417 = load i32, ptr %s
  %rcc.tmp.418 = sub i32 %rcc.tmp.416, %rcc.tmp.417
  store i32 %rcc.tmp.418, ptr %complex_calc
  br label %if.merge.24
if.else.24:
  %rcc.tmp.421 = load i32, ptr %complex_calc
  %rcc.tmp.422 = load i32, ptr %s
  %rcc.tmp.423 = add i32 %rcc.tmp.421, %rcc.tmp.422
  %rcc.tmp.424 = load i32, ptr %r
  %rcc.tmp.425 = sub i32 %rcc.tmp.423, %rcc.tmp.424
  store i32 %rcc.tmp.425, ptr %complex_calc
  br label %if.merge.24
if.merge.24:
  %rcc.tmp.428 = load i32, ptr %s
  %rcc.tmp.429 = add i32 %rcc.tmp.428, 1
  store i32 %rcc.tmp.429, ptr %s
  br label %while.cond.12
while.end.12:
  %rcc.tmp.432 = load i32, ptr %r
  %rcc.tmp.433 = add i32 %rcc.tmp.432, 1
  store i32 %rcc.tmp.433, ptr %r
  br label %while.cond.11
while.end.11:
  %rcc.tmp.436 = load i32, ptr %complex_calc
  call void @printlnInt.(i32 %rcc.tmp.436)
  store i32 10, ptr %a
  store i32 20, ptr %b
  %rcc.tmp.440 = load i32, ptr %a
  %rcc.tmp.441 = load i32, ptr %b
  %rcc.tmp.442 = icmp slt i32 %rcc.tmp.440, %rcc.tmp.441
  br i1 %rcc.tmp.442, label %if.then.25, label %if.else.25
if.then.25:
  store i32 30, ptr %c
  %rcc.tmp.445 = load i32, ptr %a
  %rcc.tmp.446 = load i32, ptr %c
  %rcc.tmp.447 = add i32 %rcc.tmp.445, %rcc.tmp.446
  store i32 %rcc.tmp.447, ptr %a
  br label %if.merge.25
if.else.25:
  store i32 40, ptr %d
  %rcc.tmp.451 = load i32, ptr %a
  %rcc.tmp.452 = load i32, ptr %d
  %rcc.tmp.453 = add i32 %rcc.tmp.451, %rcc.tmp.452
  store i32 %rcc.tmp.453, ptr %a
  br label %if.merge.25
if.merge.25:
  br i1 1, label %if.then.26, label %if.else.26
if.then.26:
  store i1 0, ptr %a.2
  %rcc.tmp.458 = load i1, ptr %a.2
  br i1 %rcc.tmp.458, label %if.then.27, label %if.else.27
if.then.27:
  call void @printlnInt.(i32 100)
  br label %if.merge.27
if.else.27:
  call void @printlnInt.(i32 200)
  br label %if.merge.27
if.merge.27:
  br label %if.merge.26
if.else.26:
  br label %if.merge.26
if.merge.26:
  %rcc.tmp.466 = load i32, ptr %a
  call void @printlnInt.(i32 %rcc.tmp.466)
  store i32 1, ptr %outer_var
  br label %while.cond.13
while.cond.13:
  %rcc.tmp.470 = load i32, ptr %outer_var
  %rcc.tmp.471 = icmp slt i32 %rcc.tmp.470, 3
  br i1 %rcc.tmp.471, label %while.body.13, label %while.linker.13
while.linker.13:
  br label %while.end.13
while.body.13:
  store i32 10, ptr %inner_var
  %rcc.tmp.475 = load i32, ptr %outer_var
  %rcc.tmp.476 = icmp eq i32 %rcc.tmp.475, 1
  br i1 %rcc.tmp.476, label %if.then.28, label %if.else.28
if.then.28:
  store i32 100, ptr %temp_var
  %rcc.tmp.479 = load i32, ptr %inner_var
  %rcc.tmp.480 = load i32, ptr %temp_var
  %rcc.tmp.481 = add i32 %rcc.tmp.479, %rcc.tmp.480
  store i32 %rcc.tmp.481, ptr %inner_var
  br label %if.merge.28
if.else.28:
  br label %if.merge.28
if.merge.28:
  %rcc.tmp.485 = load i32, ptr %inner_var
  call void @printlnInt.(i32 %rcc.tmp.485)
  %rcc.tmp.487 = load i32, ptr %outer_var
  %rcc.tmp.488 = add i32 %rcc.tmp.487, 1
  store i32 %rcc.tmp.488, ptr %outer_var
  br label %while.cond.13
while.end.13:
  store i32 5, ptr %x
  %rcc.tmp.492 = load i32, ptr %x
  store i32 %rcc.tmp.492, ptr %y
  store i32 10, ptr %x
  %rcc.tmp.495 = load i32, ptr %y
  call void @printlnInt.(i32 %rcc.tmp.495)
  store i32 0, ptr %z
  br label %while.cond.14
while.cond.14:
  %rcc.tmp.499 = load i32, ptr %z
  %rcc.tmp.500 = icmp slt i32 %rcc.tmp.499, 1
  br i1 %rcc.tmp.500, label %while.body.14, label %while.linker.14
while.linker.14:
  br label %while.end.14
while.body.14:
  store i32 123, ptr %loop_scoped
  br i1 1, label %if.then.29, label %if.else.29
if.then.29:
  store i32 456, ptr %loop_scoped
  br label %if.merge.29
if.else.29:
  br label %if.merge.29
if.merge.29:
  %rcc.tmp.508 = load i32, ptr %loop_scoped
  call void @printlnInt.(i32 %rcc.tmp.508)
  %rcc.tmp.510 = load i32, ptr %z
  %rcc.tmp.511 = add i32 %rcc.tmp.510, 1
  store i32 %rcc.tmp.511, ptr %z
  br label %while.cond.14
while.end.14:
  br i1 1, label %if.then.30, label %if.else.30
if.then.30:
  store i32 111, ptr %shadow_var
  %rcc.tmp.516 = load i32, ptr %shadow_var
  call void @printlnInt.(i32 %rcc.tmp.516)
  br label %if.merge.30
if.else.30:
  br label %if.merge.30
if.merge.30:
  store i32 222, ptr %shadow_var.2
  %rcc.tmp.521 = load i32, ptr %shadow_var.2
  call void @printlnInt.(i32 %rcc.tmp.521)
  store i32 0, ptr %check
  %rcc.tmp.524 = load i32, ptr %check
  %rcc.tmp.525 = icmp eq i32 %rcc.tmp.524, 0
  br i1 %rcc.tmp.525, label %if.then.31, label %if.else.31
if.then.31:
  store i32 10, ptr %val
  %rcc.tmp.528 = load i32, ptr %val
  %rcc.tmp.529 = add i32 %rcc.tmp.528, 1
  store i32 %rcc.tmp.529, ptr %val
  br label %if.merge.31
if.else.31:
  br label %if.merge.31
if.merge.31:
  store i32 0, ptr %final_val
  br i1 1, label %if.then.32, label %if.else.32
if.then.32:
  store i32 1000, ptr %temp_final
  %rcc.tmp.536 = load i32, ptr %temp_final
  store i32 %rcc.tmp.536, ptr %final_val
  br label %if.merge.32
if.else.32:
  br label %if.merge.32
if.merge.32:
  store i32 0, ptr %another_check
  %rcc.tmp.541 = load i32, ptr %another_check
  %rcc.tmp.542 = icmp eq i32 %rcc.tmp.541, 0
  br i1 %rcc.tmp.542, label %if.then.33, label %if.else.33
if.then.33:
  store i32 20, ptr %val2
  %rcc.tmp.545 = load i32, ptr %val2
  %rcc.tmp.546 = add i32 %rcc.tmp.545, 1
  store i32 %rcc.tmp.546, ptr %val2
  br label %if.merge.33
if.else.33:
  store i32 30, ptr %val2.2
  %rcc.tmp.550 = load i32, ptr %val2.2
  %rcc.tmp.551 = add i32 %rcc.tmp.550, 1
  store i32 %rcc.tmp.551, ptr %val2.2
  br label %if.merge.33
if.merge.33:
  store i32 50, ptr %mut_outer
  br i1 1, label %if.then.34, label %if.else.34
if.then.34:
  store i32 60, ptr %mut_outer.2
  br i1 1, label %if.then.35, label %if.else.35
if.then.35:
  store i32 70, ptr %mut_outer.3
  %rcc.tmp.559 = load i32, ptr %mut_outer.3
  call void @printlnInt.(i32 %rcc.tmp.559)
  br label %if.merge.35
if.else.35:
  br label %if.merge.35
if.merge.35:
  %rcc.tmp.563 = load i32, ptr %mut_outer.2
  call void @printlnInt.(i32 %rcc.tmp.563)
  br label %if.merge.34
if.else.34:
  br label %if.merge.34
if.merge.34:
  %rcc.tmp.567 = load i32, ptr %mut_outer
  call void @printlnInt.(i32 %rcc.tmp.567)
  store i32 0, ptr %error_var
  store i32 1, ptr %inner_error_var
  %rcc.tmp.571 = load i32, ptr %inner_error_var
  store i32 %rcc.tmp.571, ptr %error_var
  store i32 2, ptr %inner_error_var
  call void @exit.(i32 0)
  ret void
}
