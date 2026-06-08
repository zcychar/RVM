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
  %cache_performance = alloca i32 
  %memory_efficiency = alloca i32 
  %hash_operations = alloca i32 
  %priority_queue_ops = alloca i32 
  %integration_result = alloca i32 
  call void @printlnInt.(i32 42)
  %rcc.tmp.2 = call i32 @run_cache_simulation.()
  store i32 %rcc.tmp.2, ptr %cache_performance
  %rcc.tmp.4 = load i32, ptr %cache_performance
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @run_memory_manager.()
  store i32 %rcc.tmp.6, ptr %memory_efficiency
  %rcc.tmp.8 = load i32, ptr %memory_efficiency
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @run_hash_table_tests.()
  store i32 %rcc.tmp.10, ptr %hash_operations
  %rcc.tmp.12 = load i32, ptr %hash_operations
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @run_priority_queue_tests.()
  store i32 %rcc.tmp.14, ptr %priority_queue_ops
  %rcc.tmp.16 = load i32, ptr %priority_queue_ops
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @run_integrated_system_test.()
  store i32 %rcc.tmp.18, ptr %integration_result
  %rcc.tmp.20 = load i32, ptr %integration_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 99)
  call void @exit.(i32 0)
  ret void
}
define i32 @get_l1_cache_size.() {
entry:
  ret i32 64
}
define i32 @get_l2_cache_size.() {
entry:
  ret i32 512
}
define i32 @get_l3_cache_size.() {
entry:
  ret i32 2048
}
define i32 @get_cache_line_size.() {
entry:
  ret i32 64
}
define i32 @get_associativity.() {
entry:
  ret i32 4
}
define i32 @get_page_size.() {
entry:
  ret i32 4096
}
define i32 @get_heap_size.() {
entry:
  ret i32 65536
}
define i32 @get_gc_threshold.() {
entry:
  ret i32 80
}
define i32 @get_hash_table_size.() {
entry:
  ret i32 1024
}
define i32 @get_max_probe_distance.() {
entry:
  ret i32 16
}
define i32 @run_cache_simulation.() {
entry:
  %total_accesses = alloca i32 
  %cache_hits = alloca i32 
  %cache_misses = alloca i32 
  %l1_cache = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %l1_lru_counter = alloca i32 
  %l2_cache = alloca [4096 x i32] 
  %fill.idx.2 = alloca i32 
  %l2_lru_counter = alloca i32 
  %access_pattern = alloca i32 
  %address = alloca i32 
  %cache_result = alloca i32 
  %fill_result = alloca i32 
  %hit_ratio = alloca i32 
  store i32 10000, ptr %total_accesses
  store i32 0, ptr %cache_hits
  store i32 0, ptr %cache_misses
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 256
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [256 x i32], ptr %l1_cache, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %l1_lru_counter
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 4096
  br i1 %rcc.tmp.19, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.21 = load i32, ptr %fill.idx.2
  %rcc.tmp.22 = getelementptr [4096 x i32], ptr %l2_cache, i32 0, i32 %rcc.tmp.21
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.24, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %l2_lru_counter
  store i32 0, ptr %access_pattern
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %access_pattern
  %rcc.tmp.31 = load i32, ptr %total_accesses
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.35 = load i32, ptr %access_pattern
  %rcc.tmp.36 = call i32 @generate_memory_address.(i32 %rcc.tmp.35)
  store i32 %rcc.tmp.36, ptr %address
  %rcc.tmp.38 = load i32, ptr %address
  %rcc.tmp.39 = call i32 @simulate_cache_access.(i32 %rcc.tmp.38, [256 x i32]* %l1_cache, [4096 x i32]* %l2_cache)
  store i32 %rcc.tmp.39, ptr %cache_result
  %rcc.tmp.41 = load i32, ptr %cache_result
  %rcc.tmp.42 = icmp sgt i32 %rcc.tmp.41, 0
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  %rcc.tmp.44 = load i32, ptr %cache_hits
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %cache_hits
  br label %if.merge
if.else:
  %rcc.tmp.48 = load i32, ptr %cache_misses
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %cache_misses
  %rcc.tmp.51 = load i32, ptr %address
  %rcc.tmp.52 = call i32 @simulate_cache_fill.(i32 %rcc.tmp.51, [256 x i32]* %l1_cache, [4096 x i32]* %l2_cache)
  store i32 %rcc.tmp.52, ptr %fill_result
  br label %if.merge
if.merge:
  %rcc.tmp.55 = load i32, ptr %l1_lru_counter
  %rcc.tmp.56 = call i32 @update_lru_counters_l1.([256 x i32]* %l1_cache, i32 %rcc.tmp.55)
  store i32 %rcc.tmp.56, ptr %l1_lru_counter
  %rcc.tmp.58 = load i32, ptr %l2_lru_counter
  %rcc.tmp.59 = call i32 @update_lru_counters_l2.([4096 x i32]* %l2_cache, i32 %rcc.tmp.58)
  store i32 %rcc.tmp.59, ptr %l2_lru_counter
  %rcc.tmp.61 = load i32, ptr %access_pattern
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %access_pattern
  br label %while.cond
while.end:
  %rcc.tmp.65 = load i32, ptr %cache_hits
  %rcc.tmp.66 = mul i32 %rcc.tmp.65, 1000
  %rcc.tmp.67 = load i32, ptr %total_accesses
  %rcc.tmp.68 = sdiv i32 %rcc.tmp.66, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %hit_ratio
  %rcc.tmp.70 = load i32, ptr %hit_ratio
  ret i32 %rcc.tmp.70
}
define i32 @generate_memory_address.(i32 %pattern_index.tmp) {
entry:
  %pattern_index..tmp = alloca i32 
  %base_address = alloca i32 
  %pattern_type = alloca i32 
  %hot_set_size = alloca i32 
  %block_size = alloca i32 
  %block_id = alloca i32 
  %offset = alloca i32 
  %stride = alloca i32 
  %temp = alloca i32 
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  store i32 268435456, ptr %base_address
  %rcc.tmp.3 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 7
  store i32 %rcc.tmp.4, ptr %pattern_type
  %rcc.tmp.6 = load i32, ptr %pattern_type
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %base_address
  %rcc.tmp.10 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 4
  %rcc.tmp.12 = add i32 %rcc.tmp.9, %rcc.tmp.11
  br label %if.merge
if.else:
  %rcc.tmp.14 = load i32, ptr %pattern_type
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 1
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %base_address
  %rcc.tmp.18 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.18, 64
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 8192
  %rcc.tmp.21 = add i32 %rcc.tmp.17, %rcc.tmp.20
  br label %if.merge.2
if.else.2:
  %rcc.tmp.23 = load i32, ptr %pattern_type
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 2
  br i1 %rcc.tmp.24, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.26 = load i32, ptr %base_address
  %rcc.tmp.27 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.28 = call i32 @hash_function.(i32 %rcc.tmp.27)
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 16384
  %rcc.tmp.30 = add i32 %rcc.tmp.26, %rcc.tmp.29
  br label %if.merge.3
if.else.3:
  %rcc.tmp.32 = load i32, ptr %pattern_type
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.32, 3
  br i1 %rcc.tmp.33, label %if.then.4, label %if.else.4
if.then.4:
  store i32 128, ptr %hot_set_size
  %rcc.tmp.36 = load i32, ptr %base_address
  %rcc.tmp.37 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.38 = load i32, ptr %hot_set_size
  %rcc.tmp.39 = srem i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = mul i32 %rcc.tmp.39, 4
  %rcc.tmp.41 = add i32 %rcc.tmp.36, %rcc.tmp.40
  br label %if.merge.4
if.else.4:
  %rcc.tmp.43 = load i32, ptr %pattern_type
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.43, 4
  br i1 %rcc.tmp.44, label %if.then.5, label %if.else.5
if.then.5:
  store i32 64, ptr %block_size
  %rcc.tmp.47 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.48 = load i32, ptr %block_size
  %rcc.tmp.49 = sdiv i32 %rcc.tmp.47, %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %block_id
  %rcc.tmp.51 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.52 = load i32, ptr %block_size
  %rcc.tmp.53 = srem i32 %rcc.tmp.51, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %offset
  %rcc.tmp.55 = load i32, ptr %base_address
  %rcc.tmp.56 = load i32, ptr %block_id
  %rcc.tmp.57 = mul i32 %rcc.tmp.56, 4096
  %rcc.tmp.58 = add i32 %rcc.tmp.55, %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %offset
  %rcc.tmp.60 = mul i32 %rcc.tmp.59, 4
  %rcc.tmp.61 = add i32 %rcc.tmp.58, %rcc.tmp.60
  br label %if.merge.5
if.else.5:
  %rcc.tmp.63 = load i32, ptr %pattern_type
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 5
  br i1 %rcc.tmp.64, label %if.then.6, label %if.else.6
if.then.6:
  store i32 1, ptr %stride
  %rcc.tmp.67 = load i32, ptr %pattern_index..tmp
  store i32 %rcc.tmp.67, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.70 = load i32, ptr %temp
  %rcc.tmp.71 = icmp sgt i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.74 = load i32, ptr %stride
  %rcc.tmp.75 = mul i32 %rcc.tmp.74, 2
  store i32 %rcc.tmp.75, ptr %stride
  %rcc.tmp.77 = load i32, ptr %temp
  %rcc.tmp.78 = sdiv i32 %rcc.tmp.77, 2
  store i32 %rcc.tmp.78, ptr %temp
  br label %while.cond
while.end:
  %rcc.tmp.81 = load i32, ptr %base_address
  %rcc.tmp.82 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.83 = load i32, ptr %stride
  %rcc.tmp.84 = mul i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = srem i32 %rcc.tmp.84, 32768
  %rcc.tmp.86 = add i32 %rcc.tmp.81, %rcc.tmp.85
  br label %if.merge.6
if.else.6:
  %rcc.tmp.88 = load i32, ptr %base_address
  %rcc.tmp.89 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.90 = mul i32 %rcc.tmp.89, 17
  %rcc.tmp.91 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.92 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.93 = mul i32 %rcc.tmp.91, %rcc.tmp.92
  %rcc.tmp.94 = add i32 %rcc.tmp.90, %rcc.tmp.93
  %rcc.tmp.95 = srem i32 %rcc.tmp.94, 65536
  %rcc.tmp.96 = add i32 %rcc.tmp.88, %rcc.tmp.95
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.98 = phi i32 [%rcc.tmp.86, %while.end], [%rcc.tmp.96, %if.else.6]
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.100 = phi i32 [%rcc.tmp.61, %if.then.5], [%rcc.tmp.98, %if.merge.6]
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.102 = phi i32 [%rcc.tmp.41, %if.then.4], [%rcc.tmp.100, %if.merge.5]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.104 = phi i32 [%rcc.tmp.30, %if.then.3], [%rcc.tmp.102, %if.merge.4]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.106 = phi i32 [%rcc.tmp.21, %if.then.2], [%rcc.tmp.104, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.108 = phi i32 [%rcc.tmp.12, %if.then], [%rcc.tmp.106, %if.merge.2]
  ret i32 %rcc.tmp.108
}
define i32 @hash_function.(i32 %key.tmp) {
entry:
  %key..tmp = alloca i32 
  %hash = alloca i32 
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.2 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.2, ptr %hash
  %rcc.tmp.4 = load i32, ptr %hash
  %rcc.tmp.5 = load i32, ptr %hash
  %rcc.tmp.6 = ashr i32 %rcc.tmp.5, 16
  %rcc.tmp.7 = xor i32 %rcc.tmp.4, %rcc.tmp.6
  %rcc.tmp.8 = srem i32 %rcc.tmp.7, 32768
  store i32 %rcc.tmp.8, ptr %hash
  %rcc.tmp.10 = load i32, ptr %hash
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 40763
  store i32 %rcc.tmp.11, ptr %hash
  %rcc.tmp.13 = load i32, ptr %hash
  %rcc.tmp.14 = load i32, ptr %hash
  %rcc.tmp.15 = ashr i32 %rcc.tmp.14, 16
  %rcc.tmp.16 = xor i32 %rcc.tmp.13, %rcc.tmp.15
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 32768
  store i32 %rcc.tmp.17, ptr %hash
  %rcc.tmp.19 = load i32, ptr %hash
  %rcc.tmp.20 = mul i32 %rcc.tmp.19, 21311
  store i32 %rcc.tmp.20, ptr %hash
  %rcc.tmp.22 = load i32, ptr %hash
  %rcc.tmp.23 = load i32, ptr %hash
  %rcc.tmp.24 = ashr i32 %rcc.tmp.23, 16
  %rcc.tmp.25 = xor i32 %rcc.tmp.22, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %hash
  %rcc.tmp.27 = load i32, ptr %hash
  ret i32 %rcc.tmp.27
}
define i32 @simulate_cache_access.(i32 %address.tmp, [256 x i32]* %l1_cache.tmp, [4096 x i32]* %l2_cache.tmp) {
entry:
  %address..tmp = alloca i32 
  %l1_cache..tmp = alloca [256 x i32]* 
  %l2_cache..tmp = alloca [4096 x i32]* 
  %l1_index = alloca i32 
  %l1_tag = alloca i32 
  %way = alloca i32 
  %cache_entry_base = alloca i32 
  %stored_tag = alloca i32 
  %valid_bit = alloca i32 
  %l2_index = alloca i32 
  %l2_tag = alloca i32 
  %cache_entry_base.2 = alloca i32 
  %stored_tag.2 = alloca i32 
  %valid_bit.2 = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  store [256 x i32]* %l1_cache.tmp, ptr %l1_cache..tmp
  store [4096 x i32]* %l2_cache.tmp, ptr %l2_cache..tmp
  %rcc.tmp.4 = load i32, ptr %address..tmp
  %rcc.tmp.5 = call i32 @get_cache_line_size.()
  %rcc.tmp.6 = sdiv i32 %rcc.tmp.4, %rcc.tmp.5
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 16
  store i32 %rcc.tmp.7, ptr %l1_index
  %rcc.tmp.9 = load i32, ptr %address..tmp
  %rcc.tmp.10 = call i32 @get_cache_line_size.()
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 16
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.9, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %l1_tag
  store i32 0, ptr %way
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %way
  %rcc.tmp.17 = call i32 @get_associativity.()
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %l1_index
  %rcc.tmp.22 = call i32 @get_associativity.()
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %way
  %rcc.tmp.25 = add i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 4
  store i32 %rcc.tmp.26, ptr %cache_entry_base
  %rcc.tmp.28 = load i32, ptr %cache_entry_base
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.31 = getelementptr [256 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %stored_tag
  %rcc.tmp.34 = load i32, ptr %cache_entry_base
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.38 = getelementptr [256 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %valid_bit
  %rcc.tmp.41 = load i32, ptr %valid_bit
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.41, 1
  br i1 %rcc.tmp.42, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.44 = load i32, ptr %stored_tag
  %rcc.tmp.45 = load i32, ptr %l1_tag
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.44, %rcc.tmp.45
  br label %sc.merge
sc.merge:
  %rcc.tmp.48 = phi i1 [0, %while.body], [%rcc.tmp.46, %and.rhs]
  br i1 %rcc.tmp.48, label %if.then, label %if.else
if.then:
  %rcc.tmp.50 = load i32, ptr %cache_entry_base
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 2
  %rcc.tmp.53 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.54 = getelementptr [256 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = call i32 @get_current_timestamp.()
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.59 = load i32, ptr %way
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %way
  br label %while.cond
while.end:
  %rcc.tmp.63 = load i32, ptr %address..tmp
  %rcc.tmp.64 = call i32 @get_cache_line_size.()
  %rcc.tmp.65 = sdiv i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = srem i32 %rcc.tmp.65, 64
  store i32 %rcc.tmp.66, ptr %l2_index
  %rcc.tmp.68 = load i32, ptr %address..tmp
  %rcc.tmp.69 = call i32 @get_cache_line_size.()
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 64
  %rcc.tmp.71 = sdiv i32 %rcc.tmp.68, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %l2_tag
  store i32 0, ptr %way
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.75 = load i32, ptr %way
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.75, 8
  br i1 %rcc.tmp.76, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.79 = load i32, ptr %l2_index
  %rcc.tmp.80 = mul i32 %rcc.tmp.79, 8
  %rcc.tmp.81 = load i32, ptr %way
  %rcc.tmp.82 = add i32 %rcc.tmp.80, %rcc.tmp.81
  %rcc.tmp.83 = mul i32 %rcc.tmp.82, 4
  store i32 %rcc.tmp.83, ptr %cache_entry_base.2
  %rcc.tmp.85 = load i32, ptr %cache_entry_base.2
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.88 = getelementptr [4096 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  store i32 %rcc.tmp.89, ptr %stored_tag.2
  %rcc.tmp.91 = load i32, ptr %cache_entry_base.2
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  %rcc.tmp.94 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.95 = getelementptr [4096 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  store i32 %rcc.tmp.96, ptr %valid_bit.2
  %rcc.tmp.98 = load i32, ptr %valid_bit.2
  %rcc.tmp.99 = icmp eq i32 %rcc.tmp.98, 1
  br i1 %rcc.tmp.99, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.101 = load i32, ptr %stored_tag.2
  %rcc.tmp.102 = load i32, ptr %l2_tag
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.101, %rcc.tmp.102
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.105 = phi i1 [0, %while.body.2], [%rcc.tmp.103, %and.rhs.2]
  br i1 %rcc.tmp.105, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.107 = load i32, ptr %cache_entry_base.2
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 2
  %rcc.tmp.110 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.111 = getelementptr [4096 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.112 = call i32 @get_current_timestamp.()
  store i32 %rcc.tmp.112, ptr %rcc.tmp.111
  ret i32 2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.116 = load i32, ptr %way
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  store i32 %rcc.tmp.117, ptr %way
  br label %while.cond.2
while.end.2:
  ret i32 0
}
define i32 @simulate_cache_fill.(i32 %address.tmp, [256 x i32]* %l1_cache.tmp, [4096 x i32]* %l2_cache.tmp) {
entry:
  %address..tmp = alloca i32 
  %l1_cache..tmp = alloca [256 x i32]* 
  %l2_cache..tmp = alloca [4096 x i32]* 
  %l1_index = alloca i32 
  %l1_tag = alloca i32 
  %lru_way = alloca i32 
  %cache_entry_base = alloca i32 
  %l2_index = alloca i32 
  %l2_tag = alloca i32 
  %l2_lru_way = alloca i32 
  %l2_entry_base = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  store [256 x i32]* %l1_cache.tmp, ptr %l1_cache..tmp
  store [4096 x i32]* %l2_cache.tmp, ptr %l2_cache..tmp
  %rcc.tmp.4 = load i32, ptr %address..tmp
  %rcc.tmp.5 = call i32 @get_cache_line_size.()
  %rcc.tmp.6 = sdiv i32 %rcc.tmp.4, %rcc.tmp.5
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 16
  store i32 %rcc.tmp.7, ptr %l1_index
  %rcc.tmp.9 = load i32, ptr %address..tmp
  %rcc.tmp.10 = call i32 @get_cache_line_size.()
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 16
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.9, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %l1_tag
  %rcc.tmp.14 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.15 = load i32, ptr %l1_index
  %rcc.tmp.16 = call i32 @find_lru_way_l1.([256 x i32]* %rcc.tmp.14, i32 %rcc.tmp.15)
  store i32 %rcc.tmp.16, ptr %lru_way
  %rcc.tmp.18 = load i32, ptr %l1_index
  %rcc.tmp.19 = call i32 @get_associativity.()
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %lru_way
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 4
  store i32 %rcc.tmp.23, ptr %cache_entry_base
  %rcc.tmp.25 = load i32, ptr %cache_entry_base
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.28 = getelementptr [256 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %l1_tag
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %cache_entry_base
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  %rcc.tmp.34 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.35 = getelementptr [256 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  store i32 1, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %cache_entry_base
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 2
  %rcc.tmp.40 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.41 = getelementptr [256 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = call i32 @get_current_timestamp.()
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %cache_entry_base
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 3
  %rcc.tmp.47 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.48 = getelementptr [256 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %address..tmp
  %rcc.tmp.50 = call i32 @simulate_memory_read.(i32 %rcc.tmp.49)
  store i32 %rcc.tmp.50, ptr %rcc.tmp.48
  %rcc.tmp.52 = load i32, ptr %address..tmp
  %rcc.tmp.53 = call i32 @get_cache_line_size.()
  %rcc.tmp.54 = sdiv i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = srem i32 %rcc.tmp.54, 64
  store i32 %rcc.tmp.55, ptr %l2_index
  %rcc.tmp.57 = load i32, ptr %address..tmp
  %rcc.tmp.58 = call i32 @get_cache_line_size.()
  %rcc.tmp.59 = mul i32 %rcc.tmp.58, 64
  %rcc.tmp.60 = sdiv i32 %rcc.tmp.57, %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %l2_tag
  %rcc.tmp.62 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.63 = load i32, ptr %l2_index
  %rcc.tmp.64 = call i32 @find_lru_way_l2.([4096 x i32]* %rcc.tmp.62, i32 %rcc.tmp.63)
  store i32 %rcc.tmp.64, ptr %l2_lru_way
  %rcc.tmp.66 = load i32, ptr %l2_index
  %rcc.tmp.67 = mul i32 %rcc.tmp.66, 8
  %rcc.tmp.68 = load i32, ptr %l2_lru_way
  %rcc.tmp.69 = add i32 %rcc.tmp.67, %rcc.tmp.68
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 4
  store i32 %rcc.tmp.70, ptr %l2_entry_base
  %rcc.tmp.72 = load i32, ptr %l2_entry_base
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.75 = getelementptr [4096 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %l2_tag
  store i32 %rcc.tmp.76, ptr %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %l2_entry_base
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  %rcc.tmp.81 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.82 = getelementptr [4096 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  store i32 1, ptr %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %l2_entry_base
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 2
  %rcc.tmp.87 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.88 = getelementptr [4096 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = call i32 @get_current_timestamp.()
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %l2_entry_base
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 3
  %rcc.tmp.94 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.95 = getelementptr [4096 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load i32, ptr %address..tmp
  %rcc.tmp.97 = call i32 @simulate_memory_read.(i32 %rcc.tmp.96)
  store i32 %rcc.tmp.97, ptr %rcc.tmp.95
  ret i32 1
}
define i32 @find_lru_way_l1.([256 x i32]* %l1_cache.tmp, i32 %set_index.tmp) {
entry:
  %l1_cache..tmp = alloca [256 x i32]* 
  %set_index..tmp = alloca i32 
  %oldest_timestamp = alloca i32 
  %lru_way = alloca i32 
  %way = alloca i32 
  %cache_entry_base = alloca i32 
  %timestamp = alloca i32 
  %valid = alloca i32 
  store [256 x i32]* %l1_cache.tmp, ptr %l1_cache..tmp
  store i32 %set_index.tmp, ptr %set_index..tmp
  store i32 2147483647, ptr %oldest_timestamp
  store i32 0, ptr %lru_way
  store i32 0, ptr %way
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %way
  %rcc.tmp.8 = call i32 @get_associativity.()
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %set_index..tmp
  %rcc.tmp.13 = call i32 @get_associativity.()
  %rcc.tmp.14 = mul i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %way
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = mul i32 %rcc.tmp.16, 4
  store i32 %rcc.tmp.17, ptr %cache_entry_base
  %rcc.tmp.19 = load i32, ptr %cache_entry_base
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.23 = getelementptr [256 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %timestamp
  %rcc.tmp.26 = load i32, ptr %cache_entry_base
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  %rcc.tmp.29 = load [256 x i32]*, ptr %l1_cache..tmp
  %rcc.tmp.30 = getelementptr [256 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %valid
  %rcc.tmp.33 = load i32, ptr %valid
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 0
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %way
  ret i32 %rcc.tmp.36
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.39 = load i32, ptr %timestamp
  %rcc.tmp.40 = load i32, ptr %oldest_timestamp
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.43 = load i32, ptr %timestamp
  store i32 %rcc.tmp.43, ptr %oldest_timestamp
  %rcc.tmp.45 = load i32, ptr %way
  store i32 %rcc.tmp.45, ptr %lru_way
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.49 = load i32, ptr %way
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %way
  br label %while.cond
while.end:
  %rcc.tmp.53 = load i32, ptr %lru_way
  ret i32 %rcc.tmp.53
}
define i32 @find_lru_way_l2.([4096 x i32]* %l2_cache.tmp, i32 %set_index.tmp) {
entry:
  %l2_cache..tmp = alloca [4096 x i32]* 
  %set_index..tmp = alloca i32 
  %oldest_timestamp = alloca i32 
  %lru_way = alloca i32 
  %way = alloca i32 
  %cache_entry_base = alloca i32 
  %timestamp = alloca i32 
  %valid = alloca i32 
  store [4096 x i32]* %l2_cache.tmp, ptr %l2_cache..tmp
  store i32 %set_index.tmp, ptr %set_index..tmp
  store i32 2147483647, ptr %oldest_timestamp
  store i32 0, ptr %lru_way
  store i32 0, ptr %way
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %way
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 8
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %set_index..tmp
  %rcc.tmp.12 = mul i32 %rcc.tmp.11, 8
  %rcc.tmp.13 = load i32, ptr %way
  %rcc.tmp.14 = add i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 4
  store i32 %rcc.tmp.15, ptr %cache_entry_base
  %rcc.tmp.17 = load i32, ptr %cache_entry_base
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 2
  %rcc.tmp.20 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.21 = getelementptr [4096 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %timestamp
  %rcc.tmp.24 = load i32, ptr %cache_entry_base
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = load [4096 x i32]*, ptr %l2_cache..tmp
  %rcc.tmp.28 = getelementptr [4096 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %valid
  %rcc.tmp.31 = load i32, ptr %valid
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 0
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  %rcc.tmp.34 = load i32, ptr %way
  ret i32 %rcc.tmp.34
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.37 = load i32, ptr %timestamp
  %rcc.tmp.38 = load i32, ptr %oldest_timestamp
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.41 = load i32, ptr %timestamp
  store i32 %rcc.tmp.41, ptr %oldest_timestamp
  %rcc.tmp.43 = load i32, ptr %way
  store i32 %rcc.tmp.43, ptr %lru_way
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.47 = load i32, ptr %way
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %way
  br label %while.cond
while.end:
  %rcc.tmp.51 = load i32, ptr %lru_way
  ret i32 %rcc.tmp.51
}
define i32 @update_lru_counters_l1.([256 x i32]* %l1_cache.tmp, i32 %current_counter.tmp) {
entry:
  %l1_cache..tmp = alloca [256 x i32]* 
  %current_counter..tmp = alloca i32 
  store [256 x i32]* %l1_cache.tmp, ptr %l1_cache..tmp
  store i32 %current_counter.tmp, ptr %current_counter..tmp
  %rcc.tmp.3 = load i32, ptr %current_counter..tmp
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 1
  ret i32 %rcc.tmp.4
}
define i32 @update_lru_counters_l2.([4096 x i32]* %l2_cache.tmp, i32 %current_counter.tmp) {
entry:
  %l2_cache..tmp = alloca [4096 x i32]* 
  %current_counter..tmp = alloca i32 
  store [4096 x i32]* %l2_cache.tmp, ptr %l2_cache..tmp
  store i32 %current_counter.tmp, ptr %current_counter..tmp
  %rcc.tmp.3 = load i32, ptr %current_counter..tmp
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 1
  ret i32 %rcc.tmp.4
}
define i32 @get_current_timestamp.() {
entry:
  %rcc.tmp.1 = call i32 @hash_function.(i32 42)
  %rcc.tmp.2 = srem i32 %rcc.tmp.1, 1000000
  ret i32 %rcc.tmp.2
}
define i32 @simulate_memory_read.(i32 %address.tmp) {
entry:
  %address..tmp = alloca i32 
  %data = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  %rcc.tmp.2 = load i32, ptr %address..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 65536
  store i32 %rcc.tmp.3, ptr %data
  %rcc.tmp.5 = load i32, ptr %data
  %rcc.tmp.6 = call i32 @hash_function.(i32 %rcc.tmp.5)
  ret i32 %rcc.tmp.6
}
define i32 @run_memory_manager.() {
entry:
  %total_allocations = alloca i32 
  %allocation_sizes = alloca [16 x i32] 
  %heap = alloca [16384 x i32] 
  %fill.idx = alloca i32 
  %free_blocks = alloca [4096 x i32] 
  %fill.idx.2 = alloca i32 
  %allocated_blocks = alloca [4096 x i32] 
  %fill.idx.3 = alloca i32 
  %free_count = alloca i32 
  %allocated_count = alloca i32 
  %allocation_index = alloca i32 
  %successful_allocations = alloca i32 
  %failed_allocations = alloca i32 
  %garbage_collections = alloca i32 
  %size_index = alloca i32 
  %allocation_size = alloca i32 
  %allocated_address = alloca i32 
  %usage_pattern = alloca i32 
  %gc_result = alloca i32 
  %free_result = alloca i32 
  %efficiency = alloca i32 
  store i32 10, ptr %total_allocations
  %rcc.tmp.2 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 0
  store i32 8, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 1
  store i32 16, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 2
  store i32 32, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 3
  store i32 64, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 4
  store i32 128, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 5
  store i32 256, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 6
  store i32 512, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 7
  store i32 1024, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 8
  store i32 2048, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 9
  store i32 4096, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 10
  store i32 8192, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 11
  store i32 16384, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 12
  store i32 32768, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 13
  store i32 65536, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 14
  store i32 131072, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 15
  store i32 262144, ptr %rcc.tmp.32
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.36 = load i32, ptr %fill.idx
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 16384
  br i1 %rcc.tmp.37, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.39 = load i32, ptr %fill.idx
  %rcc.tmp.40 = getelementptr [16384 x i32], ptr %heap, i32 0, i32 %rcc.tmp.39
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.42, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.47 = load i32, ptr %fill.idx.2
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 4096
  br i1 %rcc.tmp.48, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.50 = load i32, ptr %fill.idx.2
  %rcc.tmp.51 = getelementptr [4096 x i32], ptr %free_blocks, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.53, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.58 = load i32, ptr %fill.idx.3
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.58, 4096
  br i1 %rcc.tmp.59, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.61 = load i32, ptr %fill.idx.3
  %rcc.tmp.62 = getelementptr [4096 x i32], ptr %allocated_blocks, i32 0, i32 %rcc.tmp.61
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.64, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %free_count
  store i32 0, ptr %allocated_count
  %rcc.tmp.69 = getelementptr [4096 x i32], ptr %free_blocks, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [4096 x i32], ptr %free_blocks, i32 0, i32 1
  store i32 65536, ptr %rcc.tmp.71
  store i32 1, ptr %free_count
  store i32 0, ptr %allocation_index
  store i32 0, ptr %successful_allocations
  store i32 0, ptr %failed_allocations
  store i32 0, ptr %garbage_collections
  br label %while.cond
while.cond:
  %rcc.tmp.79 = load i32, ptr %allocation_index
  %rcc.tmp.80 = load i32, ptr %total_allocations
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.79, %rcc.tmp.80
  br i1 %rcc.tmp.81, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.84 = load i32, ptr %allocation_index
  %rcc.tmp.85 = srem i32 %rcc.tmp.84, 16
  store i32 %rcc.tmp.85, ptr %size_index
  %rcc.tmp.87 = load i32, ptr %size_index
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %allocation_sizes, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.90, ptr %allocation_size
  %rcc.tmp.92 = load i32, ptr %free_count
  %rcc.tmp.93 = load i32, ptr %allocated_count
  %rcc.tmp.94 = load i32, ptr %allocation_size
  %rcc.tmp.95 = call i32 @allocate_memory.([16384 x i32]* %heap, [4096 x i32]* %free_blocks, [4096 x i32]* %allocated_blocks, i32 %rcc.tmp.92, i32 %rcc.tmp.93, i32 %rcc.tmp.94)
  store i32 %rcc.tmp.95, ptr %allocated_address
  %rcc.tmp.97 = load i32, ptr %allocated_address
  %rcc.tmp.98 = icmp sge i32 %rcc.tmp.97, 0
  br i1 %rcc.tmp.98, label %if.then, label %if.else
if.then:
  %rcc.tmp.100 = load i32, ptr %successful_allocations
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %successful_allocations
  %rcc.tmp.103 = load i32, ptr %allocated_count
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.104, ptr %allocated_count
  %rcc.tmp.106 = load i32, ptr %allocated_address
  %rcc.tmp.107 = load i32, ptr %allocation_size
  %rcc.tmp.108 = call i32 @simulate_memory_usage.(i32 %rcc.tmp.106, i32 %rcc.tmp.107)
  store i32 %rcc.tmp.108, ptr %usage_pattern
  br label %if.merge
if.else:
  %rcc.tmp.111 = load i32, ptr %free_count
  %rcc.tmp.112 = load i32, ptr %allocated_count
  %rcc.tmp.113 = call i32 @run_garbage_collection.([16384 x i32]* %heap, [4096 x i32]* %free_blocks, [4096 x i32]* %allocated_blocks, i32 %rcc.tmp.111, i32 %rcc.tmp.112)
  store i32 %rcc.tmp.113, ptr %gc_result
  %rcc.tmp.115 = load i32, ptr %garbage_collections
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %garbage_collections
  %rcc.tmp.118 = load i32, ptr %gc_result
  %rcc.tmp.119 = icmp sgt i32 %rcc.tmp.118, 0
  br i1 %rcc.tmp.119, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.121 = load i32, ptr %free_count
  %rcc.tmp.122 = load i32, ptr %allocated_count
  %rcc.tmp.123 = load i32, ptr %allocation_size
  %rcc.tmp.124 = call i32 @allocate_memory.([16384 x i32]* %heap, [4096 x i32]* %free_blocks, [4096 x i32]* %allocated_blocks, i32 %rcc.tmp.121, i32 %rcc.tmp.122, i32 %rcc.tmp.123)
  store i32 %rcc.tmp.124, ptr %allocated_address
  %rcc.tmp.126 = load i32, ptr %allocated_address
  %rcc.tmp.127 = icmp sge i32 %rcc.tmp.126, 0
  br i1 %rcc.tmp.127, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.129 = load i32, ptr %successful_allocations
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %successful_allocations
  %rcc.tmp.132 = load i32, ptr %allocated_count
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %allocated_count
  br label %if.merge.3
if.else.3:
  %rcc.tmp.136 = load i32, ptr %failed_allocations
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 1
  store i32 %rcc.tmp.137, ptr %failed_allocations
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.141 = load i32, ptr %failed_allocations
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 1
  store i32 %rcc.tmp.142, ptr %failed_allocations
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.146 = load i32, ptr %allocation_index
  %rcc.tmp.147 = srem i32 %rcc.tmp.146, 10
  %rcc.tmp.148 = icmp eq i32 %rcc.tmp.147, 7
  br i1 %rcc.tmp.148, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.150 = load i32, ptr %allocated_count
  %rcc.tmp.151 = icmp sgt i32 %rcc.tmp.150, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.153 = phi i1 [0, %if.merge], [%rcc.tmp.151, %and.rhs]
  br i1 %rcc.tmp.153, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.155 = load i32, ptr %free_count
  %rcc.tmp.156 = load i32, ptr %allocated_count
  %rcc.tmp.157 = call i32 @free_random_block.([16384 x i32]* %heap, [4096 x i32]* %free_blocks, [4096 x i32]* %allocated_blocks, i32 %rcc.tmp.155, i32 %rcc.tmp.156)
  store i32 %rcc.tmp.157, ptr %free_result
  %rcc.tmp.159 = load i32, ptr %free_result
  %rcc.tmp.160 = icmp sgt i32 %rcc.tmp.159, 0
  br i1 %rcc.tmp.160, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.162 = load i32, ptr %allocated_count
  %rcc.tmp.163 = sub i32 %rcc.tmp.162, 1
  store i32 %rcc.tmp.163, ptr %allocated_count
  %rcc.tmp.165 = load i32, ptr %free_count
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %free_count
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.172 = load i32, ptr %allocation_index
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 1
  store i32 %rcc.tmp.173, ptr %allocation_index
  br label %while.cond
while.end:
  %rcc.tmp.176 = load i32, ptr %successful_allocations
  %rcc.tmp.177 = mul i32 %rcc.tmp.176, 1000
  %rcc.tmp.178 = load i32, ptr %successful_allocations
  %rcc.tmp.179 = load i32, ptr %failed_allocations
  %rcc.tmp.180 = add i32 %rcc.tmp.178, %rcc.tmp.179
  %rcc.tmp.181 = sdiv i32 %rcc.tmp.177, %rcc.tmp.180
  store i32 %rcc.tmp.181, ptr %efficiency
  %rcc.tmp.183 = load i32, ptr %efficiency
  %rcc.tmp.184 = load i32, ptr %garbage_collections
  %rcc.tmp.185 = add i32 %rcc.tmp.183, %rcc.tmp.184
  ret i32 %rcc.tmp.185
}
define i32 @allocate_memory.([16384 x i32]* %heap.tmp, [4096 x i32]* %free_blocks.tmp, [4096 x i32]* %allocated_blocks.tmp, i32 %free_count.tmp, i32 %allocated_count.tmp, i32 %size.tmp) {
entry:
  %heap..tmp = alloca [16384 x i32]* 
  %free_blocks..tmp = alloca [4096 x i32]* 
  %allocated_blocks..tmp = alloca [4096 x i32]* 
  %free_count..tmp = alloca i32 
  %allocated_count..tmp = alloca i32 
  %size..tmp = alloca i32 
  %block_index = alloca i32 
  %block_start = alloca i32 
  %block_size = alloca i32 
  %move_index = alloca i32 
  store [16384 x i32]* %heap.tmp, ptr %heap..tmp
  store [4096 x i32]* %free_blocks.tmp, ptr %free_blocks..tmp
  store [4096 x i32]* %allocated_blocks.tmp, ptr %allocated_blocks..tmp
  store i32 %free_count.tmp, ptr %free_count..tmp
  store i32 %allocated_count.tmp, ptr %allocated_count..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %block_index
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %block_index
  %rcc.tmp.10 = load i32, ptr %free_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %block_index
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = mul i32 %rcc.tmp.15, 2
  %rcc.tmp.17 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.18 = getelementptr [4096 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %block_start
  %rcc.tmp.21 = load i32, ptr %block_index
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 2
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.26 = getelementptr [4096 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %block_size
  %rcc.tmp.29 = load i32, ptr %block_size
  %rcc.tmp.30 = load i32, ptr %size..tmp
  %rcc.tmp.31 = icmp sge i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then, label %if.else
if.then:
  %rcc.tmp.33 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, 2
  %rcc.tmp.36 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.37 = getelementptr [4096 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %block_start
  store i32 %rcc.tmp.38, ptr %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = mul i32 %rcc.tmp.41, 2
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  %rcc.tmp.44 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.45 = getelementptr [4096 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %block_size
  %rcc.tmp.49 = load i32, ptr %size..tmp
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.52 = load i32, ptr %block_index
  store i32 %rcc.tmp.52, ptr %move_index
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.55 = load i32, ptr %move_index
  %rcc.tmp.56 = load i32, ptr %free_count..tmp
  %rcc.tmp.57 = sub i32 %rcc.tmp.56, 1
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.55, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.61 = load i32, ptr %move_index
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 2
  %rcc.tmp.64 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.65 = getelementptr [4096 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %move_index
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  %rcc.tmp.69 = mul i32 %rcc.tmp.68, 2
  %rcc.tmp.70 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.71 = getelementptr [4096 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.65
  %rcc.tmp.74 = load i32, ptr %move_index
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = mul i32 %rcc.tmp.75, 2
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  %rcc.tmp.78 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.79 = getelementptr [4096 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %move_index
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = mul i32 %rcc.tmp.82, 2
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.86 = getelementptr [4096 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %rcc.tmp.79
  %rcc.tmp.89 = load i32, ptr %move_index
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %move_index
  br label %while.cond.2
while.end.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.94 = load i32, ptr %block_index
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = mul i32 %rcc.tmp.95, 2
  %rcc.tmp.97 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.98 = getelementptr [4096 x i32], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.96
  %rcc.tmp.99 = load i32, ptr %block_start
  %rcc.tmp.100 = load i32, ptr %size..tmp
  %rcc.tmp.101 = add i32 %rcc.tmp.99, %rcc.tmp.100
  store i32 %rcc.tmp.101, ptr %rcc.tmp.98
  %rcc.tmp.103 = load i32, ptr %block_index
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = mul i32 %rcc.tmp.104, 2
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  %rcc.tmp.107 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.108 = getelementptr [4096 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.109 = load i32, ptr %block_size
  %rcc.tmp.110 = load i32, ptr %size..tmp
  %rcc.tmp.111 = sub i32 %rcc.tmp.109, %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %rcc.tmp.108
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.114 = load i32, ptr %block_start
  ret i32 %rcc.tmp.114
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.117 = load i32, ptr %block_index
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %block_index
  br label %while.cond
while.end:
  %rcc.tmp.121 = sub i32 0, 1
  ret i32 %rcc.tmp.121
}
define i32 @simulate_memory_usage.(i32 %address.tmp, i32 %size.tmp) {
entry:
  %address..tmp = alloca i32 
  %size..tmp = alloca i32 
  %usage_type = alloca i32 
  %operations = alloca i32 
  %offset = alloca i32 
  %accesses = alloca i32 
  %access_count = alloca i32 
  %random_offset = alloca i32 
  %stride = alloca i32 
  %offset.2 = alloca i32 
  %hot_region = alloca i32 
  %access_count.2 = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %address..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.3, %rcc.tmp.4
  %rcc.tmp.6 = srem i32 %rcc.tmp.5, 5
  store i32 %rcc.tmp.6, ptr %usage_type
  store i32 0, ptr %operations
  %rcc.tmp.9 = load i32, ptr %usage_type
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 0
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  store i32 0, ptr %offset
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %offset
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %operations
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %operations
  %rcc.tmp.22 = load i32, ptr %offset
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 4
  store i32 %rcc.tmp.23, ptr %offset
  br label %while.cond
while.end:
  br label %if.merge
if.else:
  %rcc.tmp.27 = load i32, ptr %usage_type
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 1
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %size..tmp
  %rcc.tmp.31 = sdiv i32 %rcc.tmp.30, 8
  store i32 %rcc.tmp.31, ptr %accesses
  store i32 0, ptr %access_count
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %access_count
  %rcc.tmp.36 = load i32, ptr %accesses
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.40 = load i32, ptr %access_count
  %rcc.tmp.41 = load i32, ptr %address..tmp
  %rcc.tmp.42 = add i32 %rcc.tmp.40, %rcc.tmp.41
  %rcc.tmp.43 = call i32 @hash_function.(i32 %rcc.tmp.42)
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = srem i32 %rcc.tmp.43, %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %random_offset
  %rcc.tmp.47 = load i32, ptr %operations
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %operations
  %rcc.tmp.50 = load i32, ptr %access_count
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %access_count
  br label %while.cond.2
while.end.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.55 = load i32, ptr %usage_type
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.55, 2
  br i1 %rcc.tmp.56, label %if.then.3, label %if.else.3
if.then.3:
  store i32 16, ptr %stride
  store i32 0, ptr %offset.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.61 = load i32, ptr %offset.2
  %rcc.tmp.62 = load i32, ptr %size..tmp
  %rcc.tmp.63 = icmp slt i32 %rcc.tmp.61, %rcc.tmp.62
  br i1 %rcc.tmp.63, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.66 = load i32, ptr %operations
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %operations
  %rcc.tmp.69 = load i32, ptr %offset.2
  %rcc.tmp.70 = load i32, ptr %stride
  %rcc.tmp.71 = add i32 %rcc.tmp.69, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %offset.2
  br label %while.cond.3
while.end.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.75 = load i32, ptr %usage_type
  %rcc.tmp.76 = icmp eq i32 %rcc.tmp.75, 3
  br i1 %rcc.tmp.76, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.78 = load i32, ptr %size..tmp
  %rcc.tmp.79 = sdiv i32 %rcc.tmp.78, 4
  store i32 %rcc.tmp.79, ptr %hot_region
  store i32 0, ptr %access_count.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.83 = load i32, ptr %access_count.2
  %rcc.tmp.84 = load i32, ptr %hot_region
  %rcc.tmp.85 = icmp slt i32 %rcc.tmp.83, %rcc.tmp.84
  br i1 %rcc.tmp.85, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.88 = load i32, ptr %operations
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %operations
  %rcc.tmp.91 = load i32, ptr %access_count.2
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %access_count.2
  br label %while.cond.4
while.end.4:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.96 = load i32, ptr %address..tmp
  %rcc.tmp.97 = load i32, ptr %size..tmp
  %rcc.tmp.98 = call i32 @simulate_complex_memory_pattern.(i32 %rcc.tmp.96, i32 %rcc.tmp.97)
  store i32 %rcc.tmp.98, ptr %operations
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.104 = load i32, ptr %operations
  ret i32 %rcc.tmp.104
}
define i32 @simulate_complex_memory_pattern.(i32 %base_address.tmp, i32 %size.tmp) {
entry:
  %base_address..tmp = alloca i32 
  %size..tmp = alloca i32 
  %operations = alloca i32 
  %pattern_phases = alloca i32 
  %phase = alloca i32 
  %phase_size = alloca i32 
  %phase_start = alloca i32 
  %offset = alloca i32 
  %offset.2 = alloca i32 
  store i32 %base_address.tmp, ptr %base_address..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %operations
  store i32 4, ptr %pattern_phases
  store i32 0, ptr %phase
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %phase
  %rcc.tmp.8 = load i32, ptr %pattern_phases
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %size..tmp
  %rcc.tmp.13 = load i32, ptr %pattern_phases
  %rcc.tmp.14 = sdiv i32 %rcc.tmp.12, %rcc.tmp.13
  store i32 %rcc.tmp.14, ptr %phase_size
  %rcc.tmp.16 = load i32, ptr %base_address..tmp
  %rcc.tmp.17 = load i32, ptr %phase
  %rcc.tmp.18 = load i32, ptr %phase_size
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.16, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %phase_start
  %rcc.tmp.22 = load i32, ptr %phase
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 2
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 0
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  store i32 0, ptr %offset
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %offset
  %rcc.tmp.29 = load i32, ptr %phase_size
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.33 = load i32, ptr %operations
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %operations
  %rcc.tmp.36 = load i32, ptr %offset
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 64
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.37, 0
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %operations
  %rcc.tmp.41 = load i32, ptr %phase_start
  %rcc.tmp.42 = load i32, ptr %offset
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = call i32 @compute_checksum.(i32 %rcc.tmp.43)
  %rcc.tmp.45 = add i32 %rcc.tmp.40, %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %operations
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.49 = load i32, ptr %offset
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 4
  store i32 %rcc.tmp.50, ptr %offset
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  %rcc.tmp.54 = load i32, ptr %phase_size
  %rcc.tmp.55 = sub i32 %rcc.tmp.54, 4
  store i32 %rcc.tmp.55, ptr %offset.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.58 = load i32, ptr %offset.2
  %rcc.tmp.59 = icmp sge i32 %rcc.tmp.58, 0
  br i1 %rcc.tmp.59, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.62 = load i32, ptr %operations
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %operations
  %rcc.tmp.65 = load i32, ptr %offset.2
  %rcc.tmp.66 = srem i32 %rcc.tmp.65, 128
  %rcc.tmp.67 = icmp eq i32 %rcc.tmp.66, 0
  br i1 %rcc.tmp.67, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.69 = load i32, ptr %operations
  %rcc.tmp.70 = load i32, ptr %phase_start
  %rcc.tmp.71 = load i32, ptr %offset.2
  %rcc.tmp.72 = add i32 %rcc.tmp.70, %rcc.tmp.71
  %rcc.tmp.73 = call i32 @compute_complex_function.(i32 %rcc.tmp.72)
  %rcc.tmp.74 = add i32 %rcc.tmp.69, %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %operations
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.78 = load i32, ptr %offset.2
  %rcc.tmp.79 = sub i32 %rcc.tmp.78, 4
  store i32 %rcc.tmp.79, ptr %offset.2
  br label %while.cond.3
while.end.3:
  br label %if.merge
if.merge:
  %rcc.tmp.83 = load i32, ptr %phase
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %phase
  br label %while.cond
while.end:
  %rcc.tmp.87 = load i32, ptr %operations
  ret i32 %rcc.tmp.87
}
define i32 @compute_checksum.(i32 %address.tmp) {
entry:
  %address..tmp = alloca i32 
  %checksum = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  %rcc.tmp.2 = load i32, ptr %address..tmp
  store i32 %rcc.tmp.2, ptr %checksum
  %rcc.tmp.4 = load i32, ptr %checksum
  %rcc.tmp.5 = load i32, ptr %checksum
  %rcc.tmp.6 = shl i32 %rcc.tmp.5, 13
  %rcc.tmp.7 = xor i32 %rcc.tmp.4, %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %checksum
  %rcc.tmp.9 = load i32, ptr %checksum
  %rcc.tmp.10 = load i32, ptr %checksum
  %rcc.tmp.11 = ashr i32 %rcc.tmp.10, 17
  %rcc.tmp.12 = xor i32 %rcc.tmp.9, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %checksum
  %rcc.tmp.14 = load i32, ptr %checksum
  %rcc.tmp.15 = load i32, ptr %checksum
  %rcc.tmp.16 = shl i32 %rcc.tmp.15, 5
  %rcc.tmp.17 = xor i32 %rcc.tmp.14, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %checksum
  %rcc.tmp.19 = load i32, ptr %checksum
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 1000
  ret i32 %rcc.tmp.20
}
define i32 @compute_complex_function.(i32 %input.tmp) {
entry:
  %input..tmp = alloca i32 
  %result = alloca i32 
  %iteration = alloca i32 
  store i32 %input.tmp, ptr %input..tmp
  %rcc.tmp.2 = load i32, ptr %input..tmp
  store i32 %rcc.tmp.2, ptr %result
  store i32 0, ptr %iteration
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %iteration
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 10
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %result
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 17
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 31
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 65537
  store i32 %rcc.tmp.13, ptr %result
  %rcc.tmp.15 = load i32, ptr %result
  %rcc.tmp.16 = load i32, ptr %result
  %rcc.tmp.17 = ashr i32 %rcc.tmp.16, 8
  %rcc.tmp.18 = xor i32 %rcc.tmp.15, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %result
  %rcc.tmp.20 = load i32, ptr %iteration
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %iteration
  br label %while.cond
while.end:
  %rcc.tmp.24 = load i32, ptr %result
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 100
  ret i32 %rcc.tmp.25
}
define i32 @run_garbage_collection.([16384 x i32]* %heap.tmp, [4096 x i32]* %free_blocks.tmp, [4096 x i32]* %allocated_blocks.tmp, i32 %free_count.tmp, i32 %allocated_count.tmp) {
entry:
  %heap..tmp = alloca [16384 x i32]* 
  %free_blocks..tmp = alloca [4096 x i32]* 
  %allocated_blocks..tmp = alloca [4096 x i32]* 
  %free_count..tmp = alloca i32 
  %allocated_count..tmp = alloca i32 
  %reclaimed_memory = alloca i32 
  %blocks_freed = alloca i32 
  %reachable_blocks = alloca [4096 x i1] 
  %fill.idx = alloca i32 
  %reachable_count = alloca i32 
  %block_index = alloca i32 
  %block_start = alloca i32 
  %block_size = alloca i32 
  %coalesced_blocks = alloca i32 
  store [16384 x i32]* %heap.tmp, ptr %heap..tmp
  store [4096 x i32]* %free_blocks.tmp, ptr %free_blocks..tmp
  store [4096 x i32]* %allocated_blocks.tmp, ptr %allocated_blocks..tmp
  store i32 %free_count.tmp, ptr %free_count..tmp
  store i32 %allocated_count.tmp, ptr %allocated_count..tmp
  store i32 0, ptr %reclaimed_memory
  store i32 0, ptr %blocks_freed
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 4096
  br i1 %rcc.tmp.11, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.13 = load i32, ptr %fill.idx
  %rcc.tmp.14 = getelementptr [4096 x i1], ptr %reachable_blocks, i32 0, i32 %rcc.tmp.13
  store i1 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.19 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.20 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.21 = call i32 @mark_reachable_blocks.([4096 x i32]* %rcc.tmp.19, i32 %rcc.tmp.20, [4096 x i1]* %reachable_blocks)
  store i32 %rcc.tmp.21, ptr %reachable_count
  store i32 0, ptr %block_index
  br label %while.cond
while.cond:
  %rcc.tmp.25 = load i32, ptr %block_index
  %rcc.tmp.26 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %block_index
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [4096 x i1], ptr %reachable_blocks, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i1, ptr %rcc.tmp.32
  %rcc.tmp.34 = xor i1 %rcc.tmp.33, true
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %block_index
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = mul i32 %rcc.tmp.37, 2
  %rcc.tmp.39 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.40 = getelementptr [4096 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %block_start
  %rcc.tmp.43 = load i32, ptr %block_index
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = mul i32 %rcc.tmp.44, 2
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.48 = getelementptr [4096 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %block_size
  %rcc.tmp.51 = load i32, ptr %free_count..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = mul i32 %rcc.tmp.52, 2
  %rcc.tmp.54 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.55 = getelementptr [4096 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %block_start
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %free_count..tmp
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = mul i32 %rcc.tmp.59, 2
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  %rcc.tmp.62 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.63 = getelementptr [4096 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %block_size
  store i32 %rcc.tmp.64, ptr %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %reclaimed_memory
  %rcc.tmp.67 = load i32, ptr %block_size
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %reclaimed_memory
  %rcc.tmp.70 = load i32, ptr %blocks_freed
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %blocks_freed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.75 = load i32, ptr %block_index
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %block_index
  br label %while.cond
while.end:
  %rcc.tmp.79 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.80 = load i32, ptr %free_count..tmp
  %rcc.tmp.81 = load i32, ptr %blocks_freed
  %rcc.tmp.82 = add i32 %rcc.tmp.80, %rcc.tmp.81
  %rcc.tmp.83 = call i32 @coalesce_free_blocks.([4096 x i32]* %rcc.tmp.79, i32 %rcc.tmp.82)
  store i32 %rcc.tmp.83, ptr %coalesced_blocks
  %rcc.tmp.85 = load i32, ptr %reclaimed_memory
  %rcc.tmp.86 = load i32, ptr %coalesced_blocks
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  ret i32 %rcc.tmp.87
}
define i32 @mark_reachable_blocks.([4096 x i32]* %allocated_blocks.tmp, i32 %allocated_count.tmp, [4096 x i1]* %reachable.tmp) {
entry:
  %allocated_blocks..tmp = alloca [4096 x i32]* 
  %allocated_count..tmp = alloca i32 
  %reachable..tmp = alloca [4096 x i1]* 
  %reachable_count = alloca i32 
  %block_index = alloca i32 
  %block_start = alloca i32 
  %block_size = alloca i32 
  %reachability_score = alloca i32 
  store [4096 x i32]* %allocated_blocks.tmp, ptr %allocated_blocks..tmp
  store i32 %allocated_count.tmp, ptr %allocated_count..tmp
  store [4096 x i1]* %reachable.tmp, ptr %reachable..tmp
  store i32 0, ptr %reachable_count
  store i32 0, ptr %block_index
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %block_index
  %rcc.tmp.8 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %block_index
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 2
  %rcc.tmp.15 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.16 = getelementptr [4096 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %block_start
  %rcc.tmp.19 = load i32, ptr %block_index
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = mul i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.24 = getelementptr [4096 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %block_size
  %rcc.tmp.27 = load i32, ptr %block_start
  %rcc.tmp.28 = load i32, ptr %block_size
  %rcc.tmp.29 = load i32, ptr %block_index
  %rcc.tmp.30 = call i32 @compute_reachability_score.(i32 %rcc.tmp.27, i32 %rcc.tmp.28, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %reachability_score
  %rcc.tmp.32 = load i32, ptr %reachability_score
  %rcc.tmp.33 = icmp sgt i32 %rcc.tmp.32, 50
  br i1 %rcc.tmp.33, label %if.then, label %if.else
if.then:
  %rcc.tmp.35 = load i32, ptr %block_index
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [4096 x i1]*, ptr %reachable..tmp
  %rcc.tmp.38 = getelementptr [4096 x i1], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  store i1 1, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %reachable_count
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %reachable_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %block_index
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %block_index
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %reachable_count
  ret i32 %rcc.tmp.49
}
define i32 @compute_reachability_score.(i32 %address.tmp, i32 %size.tmp, i32 %age.tmp) {
entry:
  %address..tmp = alloca i32 
  %size..tmp = alloca i32 
  %age..tmp = alloca i32 
  %score = alloca i32 
  %hash_score = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %age.tmp, ptr %age..tmp
  store i32 0, ptr %score
  %rcc.tmp.5 = load i32, ptr %score
  %rcc.tmp.6 = load i32, ptr %age..tmp
  %rcc.tmp.7 = sub i32 100, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.5, %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %score
  %rcc.tmp.10 = load i32, ptr %size..tmp
  %rcc.tmp.11 = icmp sge i32 %rcc.tmp.10, 64
  br i1 %rcc.tmp.11, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.13, 4096
  br label %sc.merge
sc.merge:
  %rcc.tmp.16 = phi i1 [0, %entry], [%rcc.tmp.14, %and.rhs]
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %score
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 30
  store i32 %rcc.tmp.19, ptr %score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.23 = load i32, ptr %address..tmp
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 4096
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %score
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 20
  store i32 %rcc.tmp.28, ptr %score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.32 = load i32, ptr %address..tmp
  %rcc.tmp.33 = load i32, ptr %size..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = call i32 @hash_function.(i32 %rcc.tmp.34)
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 40
  store i32 %rcc.tmp.36, ptr %hash_score
  %rcc.tmp.38 = load i32, ptr %score
  %rcc.tmp.39 = load i32, ptr %hash_score
  %rcc.tmp.40 = add i32 %rcc.tmp.38, %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %score
  %rcc.tmp.42 = load i32, ptr %score
  ret i32 %rcc.tmp.42
}
define i32 @coalesce_free_blocks.([4096 x i32]* %free_blocks.tmp, i32 %block_count.tmp) {
entry:
  %free_blocks..tmp = alloca [4096 x i32]* 
  %block_count..tmp = alloca i32 
  %coalesced_count = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %addr1 = alloca i32 
  %addr2 = alloca i32 
  %temp_addr = alloca i32 
  %temp_size = alloca i32 
  %curr_addr = alloca i32 
  %curr_size = alloca i32 
  %next_addr = alloca i32 
  %move_index = alloca i32 
  store [4096 x i32]* %free_blocks.tmp, ptr %free_blocks..tmp
  store i32 %block_count.tmp, ptr %block_count..tmp
  store i32 0, ptr %coalesced_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %block_count..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %block_count..tmp
  %rcc.tmp.16 = sub i32 %rcc.tmp.15, 1
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = sub i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = mul i32 %rcc.tmp.23, 2
  %rcc.tmp.25 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.26 = getelementptr [4096 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %addr1
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  %rcc.tmp.32 = mul i32 %rcc.tmp.31, 2
  %rcc.tmp.33 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.34 = getelementptr [4096 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %addr2
  %rcc.tmp.37 = load i32, ptr %addr1
  %rcc.tmp.38 = load i32, ptr %addr2
  %rcc.tmp.39 = icmp sgt i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  %rcc.tmp.41 = load i32, ptr %j
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = mul i32 %rcc.tmp.42, 2
  %rcc.tmp.44 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.45 = getelementptr [4096 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %temp_addr
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = mul i32 %rcc.tmp.49, 2
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  %rcc.tmp.52 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.53 = getelementptr [4096 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %temp_size
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 2
  %rcc.tmp.59 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.60 = getelementptr [4096 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %j
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 2
  %rcc.tmp.65 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.66 = getelementptr [4096 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %rcc.tmp.60
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = mul i32 %rcc.tmp.70, 2
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  %rcc.tmp.73 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.74 = getelementptr [4096 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  %rcc.tmp.78 = mul i32 %rcc.tmp.77, 2
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.81 = getelementptr [4096 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %rcc.tmp.74
  %rcc.tmp.84 = load i32, ptr %j
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  %rcc.tmp.87 = mul i32 %rcc.tmp.86, 2
  %rcc.tmp.88 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.89 = getelementptr [4096 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %temp_addr
  store i32 %rcc.tmp.90, ptr %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  %rcc.tmp.95 = mul i32 %rcc.tmp.94, 2
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  %rcc.tmp.97 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.98 = getelementptr [4096 x i32], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.96
  %rcc.tmp.99 = load i32, ptr %temp_size
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.103 = load i32, ptr %j
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.104, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = load i32, ptr %block_count..tmp
  %rcc.tmp.115 = sub i32 %rcc.tmp.114, 1
  %rcc.tmp.116 = icmp slt i32 %rcc.tmp.113, %rcc.tmp.115
  br i1 %rcc.tmp.116, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = mul i32 %rcc.tmp.120, 2
  %rcc.tmp.122 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.123 = getelementptr [4096 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %curr_addr
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 0
  %rcc.tmp.128 = mul i32 %rcc.tmp.127, 2
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  %rcc.tmp.130 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.131 = getelementptr [4096 x i32], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.132, ptr %curr_size
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 1
  %rcc.tmp.137 = mul i32 %rcc.tmp.136, 2
  %rcc.tmp.138 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.139 = getelementptr [4096 x i32], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  store i32 %rcc.tmp.140, ptr %next_addr
  %rcc.tmp.142 = load i32, ptr %curr_addr
  %rcc.tmp.143 = load i32, ptr %curr_size
  %rcc.tmp.144 = add i32 %rcc.tmp.142, %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %next_addr
  %rcc.tmp.146 = icmp eq i32 %rcc.tmp.144, %rcc.tmp.145
  br i1 %rcc.tmp.146, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 0
  %rcc.tmp.150 = mul i32 %rcc.tmp.149, 2
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 1
  %rcc.tmp.152 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.153 = getelementptr [4096 x i32], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.154 = load i32, ptr %curr_size
  %rcc.tmp.155 = load i32, ptr %i
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 0
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 1
  %rcc.tmp.158 = mul i32 %rcc.tmp.157, 2
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 1
  %rcc.tmp.160 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.161 = getelementptr [4096 x i32], ptr %rcc.tmp.160, i32 0, i32 %rcc.tmp.159
  %rcc.tmp.162 = load i32, ptr %rcc.tmp.161
  %rcc.tmp.163 = add i32 %rcc.tmp.154, %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %rcc.tmp.153
  %rcc.tmp.165 = load i32, ptr %i
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %move_index
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.169 = load i32, ptr %move_index
  %rcc.tmp.170 = load i32, ptr %block_count..tmp
  %rcc.tmp.171 = sub i32 %rcc.tmp.170, 1
  %rcc.tmp.172 = icmp slt i32 %rcc.tmp.169, %rcc.tmp.171
  br i1 %rcc.tmp.172, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.175 = load i32, ptr %move_index
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 0
  %rcc.tmp.177 = mul i32 %rcc.tmp.176, 2
  %rcc.tmp.178 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.179 = getelementptr [4096 x i32], ptr %rcc.tmp.178, i32 0, i32 %rcc.tmp.177
  %rcc.tmp.180 = load i32, ptr %move_index
  %rcc.tmp.181 = add i32 %rcc.tmp.180, 0
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 1
  %rcc.tmp.183 = mul i32 %rcc.tmp.182, 2
  %rcc.tmp.184 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.185 = getelementptr [4096 x i32], ptr %rcc.tmp.184, i32 0, i32 %rcc.tmp.183
  %rcc.tmp.186 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.186, ptr %rcc.tmp.179
  %rcc.tmp.188 = load i32, ptr %move_index
  %rcc.tmp.189 = add i32 %rcc.tmp.188, 0
  %rcc.tmp.190 = mul i32 %rcc.tmp.189, 2
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 1
  %rcc.tmp.192 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.193 = getelementptr [4096 x i32], ptr %rcc.tmp.192, i32 0, i32 %rcc.tmp.191
  %rcc.tmp.194 = load i32, ptr %move_index
  %rcc.tmp.195 = add i32 %rcc.tmp.194, 0
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 1
  %rcc.tmp.197 = mul i32 %rcc.tmp.196, 2
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 1
  %rcc.tmp.199 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.200 = getelementptr [4096 x i32], ptr %rcc.tmp.199, i32 0, i32 %rcc.tmp.198
  %rcc.tmp.201 = load i32, ptr %rcc.tmp.200
  store i32 %rcc.tmp.201, ptr %rcc.tmp.193
  %rcc.tmp.203 = load i32, ptr %move_index
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  store i32 %rcc.tmp.204, ptr %move_index
  br label %while.cond.4
while.end.4:
  %rcc.tmp.207 = load i32, ptr %coalesced_count
  %rcc.tmp.208 = add i32 %rcc.tmp.207, 1
  store i32 %rcc.tmp.208, ptr %coalesced_count
  br label %if.merge.2
if.else.2:
  %rcc.tmp.211 = load i32, ptr %i
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 1
  store i32 %rcc.tmp.212, ptr %i
  br label %if.merge.2
if.merge.2:
  br label %while.cond.3
while.end.3:
  %rcc.tmp.216 = load i32, ptr %coalesced_count
  ret i32 %rcc.tmp.216
}
define i32 @free_random_block.([16384 x i32]* %heap.tmp, [4096 x i32]* %free_blocks.tmp, [4096 x i32]* %allocated_blocks.tmp, i32 %free_count.tmp, i32 %allocated_count.tmp) {
entry:
  %heap..tmp = alloca [16384 x i32]* 
  %free_blocks..tmp = alloca [4096 x i32]* 
  %allocated_blocks..tmp = alloca [4096 x i32]* 
  %free_count..tmp = alloca i32 
  %allocated_count..tmp = alloca i32 
  %random_index = alloca i32 
  %block_start = alloca i32 
  %block_size = alloca i32 
  %move_index = alloca i32 
  store [16384 x i32]* %heap.tmp, ptr %heap..tmp
  store [4096 x i32]* %free_blocks.tmp, ptr %free_blocks..tmp
  store [4096 x i32]* %allocated_blocks.tmp, ptr %allocated_blocks..tmp
  store i32 %free_count.tmp, ptr %free_count..tmp
  store i32 %allocated_count.tmp, ptr %allocated_count..tmp
  %rcc.tmp.6 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.12 = call i32 @hash_function.(i32 %rcc.tmp.11)
  %rcc.tmp.13 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.14 = srem i32 %rcc.tmp.12, %rcc.tmp.13
  store i32 %rcc.tmp.14, ptr %random_index
  %rcc.tmp.16 = load i32, ptr %random_index
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 2
  %rcc.tmp.19 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.20 = getelementptr [4096 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %block_start
  %rcc.tmp.23 = load i32, ptr %random_index
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = mul i32 %rcc.tmp.24, 2
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.28 = getelementptr [4096 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %block_size
  %rcc.tmp.31 = load i32, ptr %free_count..tmp
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = mul i32 %rcc.tmp.32, 2
  %rcc.tmp.34 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.35 = getelementptr [4096 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %block_start
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %free_count..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = mul i32 %rcc.tmp.39, 2
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = load [4096 x i32]*, ptr %free_blocks..tmp
  %rcc.tmp.43 = getelementptr [4096 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %block_size
  store i32 %rcc.tmp.44, ptr %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %random_index
  store i32 %rcc.tmp.46, ptr %move_index
  br label %while.cond
while.cond:
  %rcc.tmp.49 = load i32, ptr %move_index
  %rcc.tmp.50 = load i32, ptr %allocated_count..tmp
  %rcc.tmp.51 = sub i32 %rcc.tmp.50, 1
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.49, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.55 = load i32, ptr %move_index
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = mul i32 %rcc.tmp.56, 2
  %rcc.tmp.58 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.59 = getelementptr [4096 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %move_index
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 2
  %rcc.tmp.64 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.65 = getelementptr [4096 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %rcc.tmp.59
  %rcc.tmp.68 = load i32, ptr %move_index
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 2
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.73 = getelementptr [4096 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %move_index
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  %rcc.tmp.77 = mul i32 %rcc.tmp.76, 2
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  %rcc.tmp.79 = load [4096 x i32]*, ptr %allocated_blocks..tmp
  %rcc.tmp.80 = getelementptr [4096 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %rcc.tmp.73
  %rcc.tmp.83 = load i32, ptr %move_index
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %move_index
  br label %while.cond
while.end:
  ret i32 1
}
define i32 @run_hash_table_tests.() {
entry:
  %table_size = alloca i32 
  %hash_table = alloca [2048 x i32] 
  %fill.idx = alloca i32 
  %occupied = alloca [4096 x i1] 
  %fill.idx.2 = alloca i32 
  %deleted = alloca [4096 x i1] 
  %fill.idx.3 = alloca i32 
  %total_operations = alloca i32 
  %successful_inserts = alloca i32 
  %successful_lookups = alloca i32 
  %successful_deletes = alloca i32 
  %collisions = alloca i32 
  %operation_index = alloca i32 
  %operation_type = alloca i32 
  %key = alloca i32 
  %value = alloca i32 
  %insert_result = alloca i32 
  %lookup_result = alloca i32 
  %delete_result = alloca i32 
  %performance = alloca i32 
  %rcc.tmp.1 = call i32 @get_hash_table_size.()
  store i32 %rcc.tmp.1, ptr %table_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 2048
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [2048 x i32], ptr %hash_table, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 4096
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [4096 x i1], ptr %occupied, i32 0, i32 %rcc.tmp.19
  store i1 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 4096
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [4096 x i1], ptr %deleted, i32 0, i32 %rcc.tmp.30
  store i1 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 8000, ptr %total_operations
  store i32 0, ptr %successful_inserts
  store i32 0, ptr %successful_lookups
  store i32 0, ptr %successful_deletes
  store i32 0, ptr %collisions
  store i32 0, ptr %operation_index
  br label %while.cond
while.cond:
  %rcc.tmp.43 = load i32, ptr %operation_index
  %rcc.tmp.44 = load i32, ptr %total_operations
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.48 = load i32, ptr %operation_index
  %rcc.tmp.49 = srem i32 %rcc.tmp.48, 4
  store i32 %rcc.tmp.49, ptr %operation_type
  %rcc.tmp.51 = load i32, ptr %operation_index
  %rcc.tmp.52 = call i32 @generate_hash_key.(i32 %rcc.tmp.51)
  store i32 %rcc.tmp.52, ptr %key
  %rcc.tmp.54 = load i32, ptr %operation_index
  %rcc.tmp.55 = call i32 @generate_hash_value.(i32 %rcc.tmp.54)
  store i32 %rcc.tmp.55, ptr %value
  %rcc.tmp.57 = load i32, ptr %operation_type
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.57, 0
  br i1 %rcc.tmp.58, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.60 = load i32, ptr %operation_type
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 1
  br label %sc.merge
sc.merge:
  %rcc.tmp.63 = phi i1 [1, %while.body], [%rcc.tmp.61, %or.rhs]
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  %rcc.tmp.65 = load i32, ptr %table_size
  %rcc.tmp.66 = load i32, ptr %key
  %rcc.tmp.67 = load i32, ptr %value
  %rcc.tmp.68 = call i32 @hash_table_insert.([2048 x i32]* %hash_table, [4096 x i1]* %occupied, [4096 x i1]* %deleted, i32 %rcc.tmp.65, i32 %rcc.tmp.66, i32 %rcc.tmp.67)
  store i32 %rcc.tmp.68, ptr %insert_result
  %rcc.tmp.70 = load i32, ptr %insert_result
  %rcc.tmp.71 = icmp sge i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.73 = load i32, ptr %successful_inserts
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %successful_inserts
  %rcc.tmp.76 = load i32, ptr %insert_result
  %rcc.tmp.77 = icmp sgt i32 %rcc.tmp.76, 0
  br i1 %rcc.tmp.77, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.79 = load i32, ptr %collisions
  %rcc.tmp.80 = load i32, ptr %insert_result
  %rcc.tmp.81 = add i32 %rcc.tmp.79, %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %collisions
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
  %rcc.tmp.88 = load i32, ptr %operation_type
  %rcc.tmp.89 = icmp eq i32 %rcc.tmp.88, 2
  br i1 %rcc.tmp.89, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.91 = load i32, ptr %table_size
  %rcc.tmp.92 = load i32, ptr %key
  %rcc.tmp.93 = call i32 @hash_table_lookup.([2048 x i32]* %hash_table, [4096 x i1]* %occupied, [4096 x i1]* %deleted, i32 %rcc.tmp.91, i32 %rcc.tmp.92)
  store i32 %rcc.tmp.93, ptr %lookup_result
  %rcc.tmp.95 = load i32, ptr %lookup_result
  %rcc.tmp.96 = icmp sge i32 %rcc.tmp.95, 0
  br i1 %rcc.tmp.96, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.98 = load i32, ptr %successful_lookups
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %successful_lookups
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.104 = load i32, ptr %table_size
  %rcc.tmp.105 = load i32, ptr %key
  %rcc.tmp.106 = call i32 @hash_table_delete.([2048 x i32]* %hash_table, [4096 x i1]* %occupied, [4096 x i1]* %deleted, i32 %rcc.tmp.104, i32 %rcc.tmp.105)
  store i32 %rcc.tmp.106, ptr %delete_result
  %rcc.tmp.108 = load i32, ptr %delete_result
  %rcc.tmp.109 = icmp sgt i32 %rcc.tmp.108, 0
  br i1 %rcc.tmp.109, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.111 = load i32, ptr %successful_deletes
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.112, ptr %successful_deletes
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.4
if.merge.4:
  br label %if.merge
if.merge:
  %rcc.tmp.118 = load i32, ptr %operation_index
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %operation_index
  br label %while.cond
while.end:
  %rcc.tmp.122 = load i32, ptr %successful_inserts
  %rcc.tmp.123 = load i32, ptr %successful_lookups
  %rcc.tmp.124 = add i32 %rcc.tmp.122, %rcc.tmp.123
  %rcc.tmp.125 = load i32, ptr %successful_deletes
  %rcc.tmp.126 = add i32 %rcc.tmp.124, %rcc.tmp.125
  store i32 %rcc.tmp.126, ptr %performance
  %rcc.tmp.128 = load i32, ptr %performance
  %rcc.tmp.129 = load i32, ptr %collisions
  %rcc.tmp.130 = sdiv i32 %rcc.tmp.129, 10
  %rcc.tmp.131 = sub i32 %rcc.tmp.128, %rcc.tmp.130
  ret i32 %rcc.tmp.131
}
define i32 @generate_hash_key.(i32 %index.tmp) {
entry:
  %index..tmp = alloca i32 
  %pattern = alloca i32 
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.2 = load i32, ptr %index..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 6
  store i32 %rcc.tmp.3, ptr %pattern
  %rcc.tmp.5 = load i32, ptr %pattern
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %index..tmp
  ret i32 %rcc.tmp.8
if.else:
  %rcc.tmp.10 = load i32, ptr %pattern
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %index..tmp
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 17
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 31
  ret i32 %rcc.tmp.15
if.else.2:
  %rcc.tmp.17 = load i32, ptr %pattern
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 2
  br i1 %rcc.tmp.18, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.20 = load i32, ptr %index..tmp
  %rcc.tmp.21 = call i32 @hash_function.(i32 %rcc.tmp.20)
  ret i32 %rcc.tmp.21
if.else.3:
  %rcc.tmp.23 = load i32, ptr %pattern
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 3
  br i1 %rcc.tmp.24, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.26 = load i32, ptr %index..tmp
  %rcc.tmp.27 = load i32, ptr %index..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 65536
  ret i32 %rcc.tmp.29
if.else.4:
  %rcc.tmp.31 = load i32, ptr %pattern
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 4
  br i1 %rcc.tmp.32, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.34 = load i32, ptr %index..tmp
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 20
  %rcc.tmp.36 = call i32 @fibonacci_number.(i32 %rcc.tmp.35)
  ret i32 %rcc.tmp.36
if.else.5:
  %rcc.tmp.38 = load i32, ptr %index..tmp
  %rcc.tmp.39 = call i32 @generate_clustered_key.(i32 %rcc.tmp.38)
  ret i32 %rcc.tmp.39
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @generate_hash_value.(i32 %index.tmp) {
entry:
  %index..tmp = alloca i32 
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.2 = load i32, ptr %index..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 13
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 7
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 1000000
  ret i32 %rcc.tmp.5
}
define i32 @generate_clustered_key.(i32 %index.tmp) {
entry:
  %index..tmp = alloca i32 
  %cluster_size = alloca i32 
  %cluster_id = alloca i32 
  %within_cluster = alloca i32 
  store i32 %index.tmp, ptr %index..tmp
  store i32 100, ptr %cluster_size
  %rcc.tmp.3 = load i32, ptr %index..tmp
  %rcc.tmp.4 = load i32, ptr %cluster_size
  %rcc.tmp.5 = sdiv i32 %rcc.tmp.3, %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %cluster_id
  %rcc.tmp.7 = load i32, ptr %index..tmp
  %rcc.tmp.8 = load i32, ptr %cluster_size
  %rcc.tmp.9 = srem i32 %rcc.tmp.7, %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %within_cluster
  %rcc.tmp.11 = load i32, ptr %cluster_id
  %rcc.tmp.12 = mul i32 %rcc.tmp.11, 10000
  %rcc.tmp.13 = load i32, ptr %within_cluster
  %rcc.tmp.14 = add i32 %rcc.tmp.12, %rcc.tmp.13
  ret i32 %rcc.tmp.14
}
define i32 @fibonacci_number.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %prev = alloca i32 
  %curr = alloca i32 
  %i = alloca i32 
  %next = alloca i32 
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
  store i32 0, ptr %prev
  store i32 1, ptr %curr
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %prev
  %rcc.tmp.18 = load i32, ptr %curr
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %next
  %rcc.tmp.21 = load i32, ptr %curr
  store i32 %rcc.tmp.21, ptr %prev
  %rcc.tmp.23 = load i32, ptr %next
  store i32 %rcc.tmp.23, ptr %curr
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %curr
  ret i32 %rcc.tmp.29
}
define i32 @hash_table_insert.([2048 x i32]* %table.tmp, [4096 x i1]* %occupied.tmp, [4096 x i1]* %deleted.tmp, i32 %size.tmp, i32 %key.tmp, i32 %value.tmp) {
entry:
  %table..tmp = alloca [2048 x i32]* 
  %occupied..tmp = alloca [4096 x i1]* 
  %deleted..tmp = alloca [4096 x i1]* 
  %size..tmp = alloca i32 
  %key..tmp = alloca i32 
  %value..tmp = alloca i32 
  %hash = alloca i32 
  %probe_count = alloca i32 
  %original_hash = alloca i32 
  %index = alloca i32 
  store [2048 x i32]* %table.tmp, ptr %table..tmp
  store [4096 x i1]* %occupied.tmp, ptr %occupied..tmp
  store [4096 x i1]* %deleted.tmp, ptr %deleted..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.7 = load i32, ptr %key..tmp
  %rcc.tmp.8 = call i32 @hash_function.(i32 %rcc.tmp.7)
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = srem i32 %rcc.tmp.8, %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %hash
  store i32 0, ptr %probe_count
  %rcc.tmp.13 = load i32, ptr %hash
  store i32 %rcc.tmp.13, ptr %original_hash
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %probe_count
  %rcc.tmp.17 = call i32 @get_max_probe_distance.()
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %original_hash
  %rcc.tmp.22 = load i32, ptr %probe_count
  %rcc.tmp.23 = load i32, ptr %probe_count
  %rcc.tmp.24 = mul i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.21, %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %size..tmp
  %rcc.tmp.27 = srem i32 %rcc.tmp.25, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %index
  %rcc.tmp.29 = load i32, ptr %index
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [4096 x i1]*, ptr %occupied..tmp
  %rcc.tmp.32 = getelementptr [4096 x i1], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i1, ptr %rcc.tmp.32
  %rcc.tmp.34 = xor i1 %rcc.tmp.33, true
  br i1 %rcc.tmp.34, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.36 = load i32, ptr %index
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.39 = getelementptr [4096 x i1], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i1, ptr %rcc.tmp.39
  br label %sc.merge
sc.merge:
  %rcc.tmp.42 = phi i1 [1, %while.body], [%rcc.tmp.40, %or.rhs]
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  %rcc.tmp.44 = load i32, ptr %index
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = mul i32 %rcc.tmp.45, 2
  %rcc.tmp.47 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.48 = getelementptr [2048 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.49, ptr %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %index
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = mul i32 %rcc.tmp.52, 2
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  %rcc.tmp.55 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.56 = getelementptr [2048 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  %rcc.tmp.59 = load i32, ptr %index
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [4096 x i1]*, ptr %occupied..tmp
  %rcc.tmp.62 = getelementptr [4096 x i1], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  store i1 1, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %index
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.67 = getelementptr [4096 x i1], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  store i1 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %probe_count
  ret i32 %rcc.tmp.69
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.72 = load i32, ptr %index
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = mul i32 %rcc.tmp.73, 2
  %rcc.tmp.75 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.76 = getelementptr [2048 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %key..tmp
  %rcc.tmp.79 = icmp eq i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.81 = load i32, ptr %index
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = mul i32 %rcc.tmp.82, 2
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.86 = getelementptr [2048 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.91 = load i32, ptr %probe_count
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %probe_count
  br label %while.cond
while.end:
  %rcc.tmp.95 = sub i32 0, 1
  ret i32 %rcc.tmp.95
}
define i32 @hash_table_lookup.([2048 x i32]* %table.tmp, [4096 x i1]* %occupied.tmp, [4096 x i1]* %deleted.tmp, i32 %size.tmp, i32 %key.tmp) {
entry:
  %table..tmp = alloca [2048 x i32]* 
  %occupied..tmp = alloca [4096 x i1]* 
  %deleted..tmp = alloca [4096 x i1]* 
  %size..tmp = alloca i32 
  %key..tmp = alloca i32 
  %hash = alloca i32 
  %probe_count = alloca i32 
  %original_hash = alloca i32 
  %index = alloca i32 
  store [2048 x i32]* %table.tmp, ptr %table..tmp
  store [4096 x i1]* %occupied.tmp, ptr %occupied..tmp
  store [4096 x i1]* %deleted.tmp, ptr %deleted..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.6 = load i32, ptr %key..tmp
  %rcc.tmp.7 = call i32 @hash_function.(i32 %rcc.tmp.6)
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = srem i32 %rcc.tmp.7, %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %hash
  store i32 0, ptr %probe_count
  %rcc.tmp.12 = load i32, ptr %hash
  store i32 %rcc.tmp.12, ptr %original_hash
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %probe_count
  %rcc.tmp.16 = call i32 @get_max_probe_distance.()
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load i32, ptr %original_hash
  %rcc.tmp.21 = load i32, ptr %probe_count
  %rcc.tmp.22 = load i32, ptr %probe_count
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.20, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %size..tmp
  %rcc.tmp.26 = srem i32 %rcc.tmp.24, %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %index
  %rcc.tmp.28 = load i32, ptr %index
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [4096 x i1]*, ptr %occupied..tmp
  %rcc.tmp.31 = getelementptr [4096 x i1], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i1, ptr %rcc.tmp.31
  %rcc.tmp.33 = xor i1 %rcc.tmp.32, true
  br i1 %rcc.tmp.33, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.35 = load i32, ptr %index
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.38 = getelementptr [4096 x i1], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i1, ptr %rcc.tmp.38
  %rcc.tmp.40 = xor i1 %rcc.tmp.39, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.42 = phi i1 [0, %while.body], [%rcc.tmp.40, %and.rhs]
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  %rcc.tmp.44 = sub i32 0, 1
  ret i32 %rcc.tmp.44
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.47 = load i32, ptr %index
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [4096 x i1]*, ptr %occupied..tmp
  %rcc.tmp.50 = getelementptr [4096 x i1], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i1, ptr %rcc.tmp.50
  br i1 %rcc.tmp.51, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.53 = load i32, ptr %index
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.56 = getelementptr [4096 x i1], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i1, ptr %rcc.tmp.56
  %rcc.tmp.58 = xor i1 %rcc.tmp.57, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.60 = phi i1 [0, %if.merge], [%rcc.tmp.58, %and.rhs.2]
  br i1 %rcc.tmp.60, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.62 = load i32, ptr %index
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 2
  %rcc.tmp.65 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.66 = getelementptr [2048 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %key..tmp
  %rcc.tmp.69 = icmp eq i32 %rcc.tmp.67, %rcc.tmp.68
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.71 = phi i1 [0, %sc.merge.2], [%rcc.tmp.69, %and.rhs.3]
  br i1 %rcc.tmp.71, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.73 = load i32, ptr %index
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = mul i32 %rcc.tmp.74, 2
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  %rcc.tmp.77 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.78 = getelementptr [2048 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  ret i32 %rcc.tmp.79
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.82 = load i32, ptr %probe_count
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %probe_count
  br label %while.cond
while.end:
  %rcc.tmp.86 = sub i32 0, 1
  ret i32 %rcc.tmp.86
}
define i32 @hash_table_delete.([2048 x i32]* %table.tmp, [4096 x i1]* %occupied.tmp, [4096 x i1]* %deleted.tmp, i32 %size.tmp, i32 %key.tmp) {
entry:
  %table..tmp = alloca [2048 x i32]* 
  %occupied..tmp = alloca [4096 x i1]* 
  %deleted..tmp = alloca [4096 x i1]* 
  %size..tmp = alloca i32 
  %key..tmp = alloca i32 
  %hash = alloca i32 
  %probe_count = alloca i32 
  %original_hash = alloca i32 
  %index = alloca i32 
  store [2048 x i32]* %table.tmp, ptr %table..tmp
  store [4096 x i1]* %occupied.tmp, ptr %occupied..tmp
  store [4096 x i1]* %deleted.tmp, ptr %deleted..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.6 = load i32, ptr %key..tmp
  %rcc.tmp.7 = call i32 @hash_function.(i32 %rcc.tmp.6)
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = srem i32 %rcc.tmp.7, %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %hash
  store i32 0, ptr %probe_count
  %rcc.tmp.12 = load i32, ptr %hash
  store i32 %rcc.tmp.12, ptr %original_hash
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %probe_count
  %rcc.tmp.16 = call i32 @get_max_probe_distance.()
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load i32, ptr %original_hash
  %rcc.tmp.21 = load i32, ptr %probe_count
  %rcc.tmp.22 = load i32, ptr %probe_count
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.20, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %size..tmp
  %rcc.tmp.26 = srem i32 %rcc.tmp.24, %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %index
  %rcc.tmp.28 = load i32, ptr %index
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [4096 x i1]*, ptr %occupied..tmp
  %rcc.tmp.31 = getelementptr [4096 x i1], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i1, ptr %rcc.tmp.31
  %rcc.tmp.33 = xor i1 %rcc.tmp.32, true
  br i1 %rcc.tmp.33, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.35 = load i32, ptr %index
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.38 = getelementptr [4096 x i1], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i1, ptr %rcc.tmp.38
  %rcc.tmp.40 = xor i1 %rcc.tmp.39, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.42 = phi i1 [0, %while.body], [%rcc.tmp.40, %and.rhs]
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %index
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [4096 x i1]*, ptr %occupied..tmp
  %rcc.tmp.49 = getelementptr [4096 x i1], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i1, ptr %rcc.tmp.49
  br i1 %rcc.tmp.50, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.52 = load i32, ptr %index
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.55 = getelementptr [4096 x i1], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i1, ptr %rcc.tmp.55
  %rcc.tmp.57 = xor i1 %rcc.tmp.56, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.59 = phi i1 [0, %if.merge], [%rcc.tmp.57, %and.rhs.2]
  br i1 %rcc.tmp.59, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.61 = load i32, ptr %index
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 2
  %rcc.tmp.64 = load [2048 x i32]*, ptr %table..tmp
  %rcc.tmp.65 = getelementptr [2048 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %key..tmp
  %rcc.tmp.68 = icmp eq i32 %rcc.tmp.66, %rcc.tmp.67
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.70 = phi i1 [0, %sc.merge.2], [%rcc.tmp.68, %and.rhs.3]
  br i1 %rcc.tmp.70, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.72 = load i32, ptr %index
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [4096 x i1]*, ptr %deleted..tmp
  %rcc.tmp.75 = getelementptr [4096 x i1], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  store i1 1, ptr %rcc.tmp.75
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.79 = load i32, ptr %probe_count
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %probe_count
  br label %while.cond
while.end:
  ret i32 0
}
define i32 @run_priority_queue_tests.() {
entry:
  %max_size = alloca i32 
  %heap = alloca [512 x i32] 
  %fill.idx = alloca i32 
  %heap_size = alloca i32 
  %total_operations = alloca i32 
  %successful_operations = alloca i32 
  %heap_violations = alloca i32 
  %operation_index = alloca i32 
  %operation_type = alloca i32 
  %priority = alloca i32 
  %data = alloca i32 
  %insert_result = alloca i32 
  %validation_result = alloca i32 
  %max_priority = alloca i32 
  %validation_result.2 = alloca i32 
  %max_priority.2 = alloca i32 
  store i32 256, ptr %max_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [512 x i32], ptr %heap, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %heap_size
  store i32 6000, ptr %total_operations
  store i32 0, ptr %successful_operations
  store i32 0, ptr %heap_violations
  store i32 0, ptr %operation_index
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %operation_index
  %rcc.tmp.20 = load i32, ptr %total_operations
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32, ptr %operation_index
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 5
  store i32 %rcc.tmp.25, ptr %operation_type
  %rcc.tmp.27 = load i32, ptr %operation_type
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.30 = load i32, ptr %operation_type
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.30, 1
  br label %sc.merge
sc.merge:
  %rcc.tmp.33 = phi i1 [1, %while.body], [%rcc.tmp.31, %or.rhs]
  br i1 %rcc.tmp.33, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.35 = load i32, ptr %operation_type
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 2
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.38 = phi i1 [1, %sc.merge], [%rcc.tmp.36, %or.rhs.2]
  br i1 %rcc.tmp.38, label %if.then, label %if.else
if.then:
  %rcc.tmp.40 = load i32, ptr %heap_size
  %rcc.tmp.41 = load i32, ptr %max_size
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.44 = load i32, ptr %operation_index
  %rcc.tmp.45 = call i32 @generate_priority.(i32 %rcc.tmp.44)
  store i32 %rcc.tmp.45, ptr %priority
  %rcc.tmp.47 = load i32, ptr %operation_index
  store i32 %rcc.tmp.47, ptr %data
  %rcc.tmp.49 = load i32, ptr %heap_size
  %rcc.tmp.50 = load i32, ptr %priority
  %rcc.tmp.51 = load i32, ptr %data
  %rcc.tmp.52 = call i32 @priority_queue_insert.([512 x i32]* %heap, i32 %rcc.tmp.49, i32 %rcc.tmp.50, i32 %rcc.tmp.51)
  store i32 %rcc.tmp.52, ptr %insert_result
  %rcc.tmp.54 = load i32, ptr %insert_result
  %rcc.tmp.55 = icmp sgt i32 %rcc.tmp.54, 0
  br i1 %rcc.tmp.55, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.57 = load i32, ptr %heap_size
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %heap_size
  %rcc.tmp.60 = load i32, ptr %successful_operations
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %successful_operations
  %rcc.tmp.63 = load i32, ptr %heap_size
  %rcc.tmp.64 = call i32 @validate_heap_property.([512 x i32]* %heap, i32 %rcc.tmp.63)
  store i32 %rcc.tmp.64, ptr %validation_result
  %rcc.tmp.66 = load i32, ptr %validation_result
  %rcc.tmp.67 = icmp eq i32 %rcc.tmp.66, 0
  br i1 %rcc.tmp.67, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.69 = load i32, ptr %heap_violations
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %heap_violations
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
  br label %if.merge
if.else:
  %rcc.tmp.79 = load i32, ptr %operation_type
  %rcc.tmp.80 = icmp eq i32 %rcc.tmp.79, 3
  br i1 %rcc.tmp.80, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.82 = load i32, ptr %heap_size
  %rcc.tmp.83 = icmp sgt i32 %rcc.tmp.82, 0
  br i1 %rcc.tmp.83, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.85 = load i32, ptr %heap_size
  %rcc.tmp.86 = call i32 @priority_queue_extract_max.([512 x i32]* %heap, i32 %rcc.tmp.85)
  store i32 %rcc.tmp.86, ptr %max_priority
  %rcc.tmp.88 = load i32, ptr %max_priority
  %rcc.tmp.89 = icmp sge i32 %rcc.tmp.88, 0
  br i1 %rcc.tmp.89, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.91 = load i32, ptr %heap_size
  %rcc.tmp.92 = sub i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %heap_size
  %rcc.tmp.94 = load i32, ptr %successful_operations
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %successful_operations
  %rcc.tmp.97 = load i32, ptr %heap_size
  %rcc.tmp.98 = call i32 @validate_heap_property.([512 x i32]* %heap, i32 %rcc.tmp.97)
  store i32 %rcc.tmp.98, ptr %validation_result.2
  %rcc.tmp.100 = load i32, ptr %validation_result.2
  %rcc.tmp.101 = icmp eq i32 %rcc.tmp.100, 0
  br i1 %rcc.tmp.101, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.103 = load i32, ptr %heap_violations
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.104, ptr %heap_violations
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
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
  %rcc.tmp.113 = load i32, ptr %heap_size
  %rcc.tmp.114 = icmp sgt i32 %rcc.tmp.113, 0
  br i1 %rcc.tmp.114, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.116 = call i32 @priority_queue_peek.([512 x i32]* %heap)
  store i32 %rcc.tmp.116, ptr %max_priority.2
  %rcc.tmp.118 = load i32, ptr %max_priority.2
  %rcc.tmp.119 = icmp sge i32 %rcc.tmp.118, 0
  br i1 %rcc.tmp.119, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.121 = load i32, ptr %successful_operations
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.122, ptr %successful_operations
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.5
if.merge.5:
  br label %if.merge
if.merge:
  %rcc.tmp.130 = load i32, ptr %operation_index
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %operation_index
  br label %while.cond
while.end:
  %rcc.tmp.134 = load i32, ptr %successful_operations
  %rcc.tmp.135 = load i32, ptr %heap_violations
  %rcc.tmp.136 = sub i32 %rcc.tmp.134, %rcc.tmp.135
  ret i32 %rcc.tmp.136
}
define i32 @generate_priority.(i32 %index.tmp) {
entry:
  %index..tmp = alloca i32 
  %pattern = alloca i32 
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.2 = load i32, ptr %index..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 4
  store i32 %rcc.tmp.3, ptr %pattern
  %rcc.tmp.5 = load i32, ptr %pattern
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %index..tmp
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 1000
  ret i32 %rcc.tmp.9
if.else:
  %rcc.tmp.11 = load i32, ptr %pattern
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 1
  br i1 %rcc.tmp.12, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.14 = load i32, ptr %index..tmp
  %rcc.tmp.15 = call i32 @hash_function.(i32 %rcc.tmp.14)
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 10000
  ret i32 %rcc.tmp.16
if.else.2:
  %rcc.tmp.18 = load i32, ptr %pattern
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 2
  br i1 %rcc.tmp.19, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.21 = load i32, ptr %index..tmp
  %rcc.tmp.22 = load i32, ptr %index..tmp
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 5000
  ret i32 %rcc.tmp.24
if.else.3:
  %rcc.tmp.26 = load i32, ptr %index..tmp
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 15
  %rcc.tmp.28 = call i32 @fibonacci_number.(i32 %rcc.tmp.27)
  %rcc.tmp.29 = mul i32 %rcc.tmp.28, 10
  ret i32 %rcc.tmp.29
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @priority_queue_insert.([512 x i32]* %heap.tmp, i32 %size.tmp, i32 %priority.tmp, i32 %data.tmp) {
entry:
  %heap..tmp = alloca [512 x i32]* 
  %size..tmp = alloca i32 
  %priority..tmp = alloca i32 
  %data..tmp = alloca i32 
  %index = alloca i32 
  %parent_index = alloca i32 
  %parent_priority = alloca i32 
  %temp_priority = alloca i32 
  %temp_data = alloca i32 
  store [512 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %priority.tmp, ptr %priority..tmp
  store i32 %data.tmp, ptr %data..tmp
  %rcc.tmp.5 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.5, ptr %index
  %rcc.tmp.7 = load i32, ptr %index
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = mul i32 %rcc.tmp.8, 2
  %rcc.tmp.10 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.11 = getelementptr [512 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %priority..tmp
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %index
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = mul i32 %rcc.tmp.15, 2
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.19 = getelementptr [512 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %data..tmp
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %index
  %rcc.tmp.24 = icmp sgt i32 %rcc.tmp.23, 0
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %index
  %rcc.tmp.28 = sub i32 %rcc.tmp.27, 1
  %rcc.tmp.29 = sdiv i32 %rcc.tmp.28, 2
  store i32 %rcc.tmp.29, ptr %parent_index
  %rcc.tmp.31 = load i32, ptr %parent_index
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = mul i32 %rcc.tmp.32, 2
  %rcc.tmp.34 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.35 = getelementptr [512 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %parent_priority
  %rcc.tmp.38 = load i32, ptr %index
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = mul i32 %rcc.tmp.39, 2
  %rcc.tmp.41 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.42 = getelementptr [512 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %parent_priority
  %rcc.tmp.45 = icmp sle i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %if.then, label %if.else
if.then:
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.49 = load i32, ptr %index
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = mul i32 %rcc.tmp.50, 2
  %rcc.tmp.52 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.53 = getelementptr [512 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %temp_priority
  %rcc.tmp.56 = load i32, ptr %index
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 2
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  %rcc.tmp.60 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.61 = getelementptr [512 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %temp_data
  %rcc.tmp.64 = load i32, ptr %index
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = mul i32 %rcc.tmp.65, 2
  %rcc.tmp.67 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.68 = getelementptr [512 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %parent_index
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = mul i32 %rcc.tmp.70, 2
  %rcc.tmp.72 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.73 = getelementptr [512 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %rcc.tmp.68
  %rcc.tmp.76 = load i32, ptr %index
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = mul i32 %rcc.tmp.77, 2
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.81 = getelementptr [512 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %parent_index
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = mul i32 %rcc.tmp.83, 2
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  %rcc.tmp.86 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.87 = getelementptr [512 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  store i32 %rcc.tmp.88, ptr %rcc.tmp.81
  %rcc.tmp.90 = load i32, ptr %parent_index
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = mul i32 %rcc.tmp.91, 2
  %rcc.tmp.93 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.94 = getelementptr [512 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.95 = load i32, ptr %temp_priority
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = load i32, ptr %parent_index
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = mul i32 %rcc.tmp.98, 2
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  %rcc.tmp.101 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.102 = getelementptr [512 x i32], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.103 = load i32, ptr %temp_data
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %parent_index
  store i32 %rcc.tmp.105, ptr %index
  br label %while.cond
while.end:
  ret i32 1
}
define i32 @priority_queue_extract_max.([512 x i32]* %heap.tmp, i32 %size.tmp) {
entry:
  %heap..tmp = alloca [512 x i32]* 
  %size..tmp = alloca i32 
  %max_priority = alloca i32 
  %index = alloca i32 
  %new_size = alloca i32 
  %left_child = alloca i32 
  %right_child = alloca i32 
  %largest = alloca i32 
  %temp_priority = alloca i32 
  %temp_data = alloca i32 
  store [512 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = sub i32 0, 1
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.10 = getelementptr [512 x i32], ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %max_priority
  %rcc.tmp.13 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.14 = getelementptr [512 x i32], ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = sub i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 2
  %rcc.tmp.19 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.20 = getelementptr [512 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.14
  %rcc.tmp.23 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.24 = getelementptr [512 x i32], ptr %rcc.tmp.23, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %size..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = sub i32 %rcc.tmp.26, 1
  %rcc.tmp.28 = mul i32 %rcc.tmp.27, 2
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.31 = getelementptr [512 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %rcc.tmp.24
  store i32 0, ptr %index
  %rcc.tmp.35 = load i32, ptr %size..tmp
  %rcc.tmp.36 = sub i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %new_size
  br label %while.cond
while.cond:
  br i1 1, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.41 = load i32, ptr %index
  %rcc.tmp.42 = mul i32 2, %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %left_child
  %rcc.tmp.45 = load i32, ptr %index
  %rcc.tmp.46 = mul i32 2, %rcc.tmp.45
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 2
  store i32 %rcc.tmp.47, ptr %right_child
  %rcc.tmp.49 = load i32, ptr %index
  store i32 %rcc.tmp.49, ptr %largest
  %rcc.tmp.51 = load i32, ptr %left_child
  %rcc.tmp.52 = load i32, ptr %new_size
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.55 = load i32, ptr %left_child
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = mul i32 %rcc.tmp.56, 2
  %rcc.tmp.58 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.59 = getelementptr [512 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %largest
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 2
  %rcc.tmp.64 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.65 = getelementptr [512 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = icmp sgt i32 %rcc.tmp.60, %rcc.tmp.66
  br label %sc.merge
sc.merge:
  %rcc.tmp.69 = phi i1 [0, %while.body], [%rcc.tmp.67, %and.rhs]
  br i1 %rcc.tmp.69, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.71 = load i32, ptr %left_child
  store i32 %rcc.tmp.71, ptr %largest
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.75 = load i32, ptr %right_child
  %rcc.tmp.76 = load i32, ptr %new_size
  %rcc.tmp.77 = icmp slt i32 %rcc.tmp.75, %rcc.tmp.76
  br i1 %rcc.tmp.77, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.79 = load i32, ptr %right_child
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = mul i32 %rcc.tmp.80, 2
  %rcc.tmp.82 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.83 = getelementptr [512 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %largest
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = mul i32 %rcc.tmp.86, 2
  %rcc.tmp.88 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.89 = getelementptr [512 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = icmp sgt i32 %rcc.tmp.84, %rcc.tmp.90
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.93 = phi i1 [0, %if.merge.2], [%rcc.tmp.91, %and.rhs.2]
  br i1 %rcc.tmp.93, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.95 = load i32, ptr %right_child
  store i32 %rcc.tmp.95, ptr %largest
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.99 = load i32, ptr %largest
  %rcc.tmp.100 = load i32, ptr %index
  %rcc.tmp.101 = icmp eq i32 %rcc.tmp.99, %rcc.tmp.100
  br i1 %rcc.tmp.101, label %if.then.4, label %if.else.4
if.then.4:
  br label %while.linker
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.105 = load i32, ptr %index
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = mul i32 %rcc.tmp.106, 2
  %rcc.tmp.108 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.109 = getelementptr [512 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.110, ptr %temp_priority
  %rcc.tmp.112 = load i32, ptr %index
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = mul i32 %rcc.tmp.113, 2
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  %rcc.tmp.116 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.117 = getelementptr [512 x i32], ptr %rcc.tmp.116, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %temp_data
  %rcc.tmp.120 = load i32, ptr %index
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = mul i32 %rcc.tmp.121, 2
  %rcc.tmp.123 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.124 = getelementptr [512 x i32], ptr %rcc.tmp.123, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.125 = load i32, ptr %largest
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = mul i32 %rcc.tmp.126, 2
  %rcc.tmp.128 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.129 = getelementptr [512 x i32], ptr %rcc.tmp.128, i32 0, i32 %rcc.tmp.127
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.130, ptr %rcc.tmp.124
  %rcc.tmp.132 = load i32, ptr %index
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = mul i32 %rcc.tmp.133, 2
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  %rcc.tmp.136 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.137 = getelementptr [512 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.138 = load i32, ptr %largest
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = mul i32 %rcc.tmp.139, 2
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 1
  %rcc.tmp.142 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.143 = getelementptr [512 x i32], ptr %rcc.tmp.142, i32 0, i32 %rcc.tmp.141
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  store i32 %rcc.tmp.144, ptr %rcc.tmp.137
  %rcc.tmp.146 = load i32, ptr %largest
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = mul i32 %rcc.tmp.147, 2
  %rcc.tmp.149 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.150 = getelementptr [512 x i32], ptr %rcc.tmp.149, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.151 = load i32, ptr %temp_priority
  store i32 %rcc.tmp.151, ptr %rcc.tmp.150
  %rcc.tmp.153 = load i32, ptr %largest
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = mul i32 %rcc.tmp.154, 2
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 1
  %rcc.tmp.157 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.158 = getelementptr [512 x i32], ptr %rcc.tmp.157, i32 0, i32 %rcc.tmp.156
  %rcc.tmp.159 = load i32, ptr %temp_data
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = load i32, ptr %largest
  store i32 %rcc.tmp.161, ptr %index
  br label %while.cond
while.end:
  %rcc.tmp.164 = load i32, ptr %max_priority
  ret i32 %rcc.tmp.164
}
define i32 @priority_queue_peek.([512 x i32]* %heap.tmp) {
entry:
  %heap..tmp = alloca [512 x i32]* 
  store [512 x i32]* %heap.tmp, ptr %heap..tmp
  %rcc.tmp.2 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.3 = getelementptr [512 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  ret i32 %rcc.tmp.4
}
define i32 @validate_heap_property.([512 x i32]* %heap.tmp, i32 %size.tmp) {
entry:
  %heap..tmp = alloca [512 x i32]* 
  %size..tmp = alloca i32 
  %index = alloca i32 
  %left_child = alloca i32 
  %right_child = alloca i32 
  store [512 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %index
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %index
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %index
  %rcc.tmp.11 = mul i32 2, %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %left_child
  %rcc.tmp.14 = load i32, ptr %index
  %rcc.tmp.15 = mul i32 2, %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 2
  store i32 %rcc.tmp.16, ptr %right_child
  %rcc.tmp.18 = load i32, ptr %left_child
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.22 = load i32, ptr %index
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = mul i32 %rcc.tmp.23, 2
  %rcc.tmp.25 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.26 = getelementptr [512 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %left_child
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = mul i32 %rcc.tmp.29, 2
  %rcc.tmp.31 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.32 = getelementptr [512 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.33
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.body], [%rcc.tmp.34, %and.rhs]
  br i1 %rcc.tmp.36, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.40 = load i32, ptr %right_child
  %rcc.tmp.41 = load i32, ptr %size..tmp
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.44 = load i32, ptr %index
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = mul i32 %rcc.tmp.45, 2
  %rcc.tmp.47 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.48 = getelementptr [512 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %right_child
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = mul i32 %rcc.tmp.51, 2
  %rcc.tmp.53 = load [512 x i32]*, ptr %heap..tmp
  %rcc.tmp.54 = getelementptr [512 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.49, %rcc.tmp.55
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.58 = phi i1 [0, %if.merge], [%rcc.tmp.56, %and.rhs.2]
  br i1 %rcc.tmp.58, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.62 = load i32, ptr %index
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %index
  br label %while.cond
while.end:
  ret i32 1
}
define i32 @run_integrated_system_test.() {
entry:
  %system_cycles = alloca i32 
  %total_score = alloca i32 
  %cycle = alloca i32 
  %memory_pressure = alloca i32 
  %cache_efficiency = alloca i32 
  %hash_performance = alloca i32 
  %queue_throughput = alloca i32 
  %cycle_score = alloca i32 
  %adaptation_bonus = alloca i32 
  store i32 1000, ptr %system_cycles
  store i32 0, ptr %total_score
  store i32 0, ptr %cycle
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %cycle
  %rcc.tmp.6 = load i32, ptr %system_cycles
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %cycle
  %rcc.tmp.11 = call i32 @simulate_memory_pressure.(i32 %rcc.tmp.10)
  store i32 %rcc.tmp.11, ptr %memory_pressure
  %rcc.tmp.13 = load i32, ptr %cycle
  %rcc.tmp.14 = call i32 @simulate_cache_workload.(i32 %rcc.tmp.13)
  store i32 %rcc.tmp.14, ptr %cache_efficiency
  %rcc.tmp.16 = load i32, ptr %cycle
  %rcc.tmp.17 = call i32 @simulate_hash_workload.(i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %hash_performance
  %rcc.tmp.19 = load i32, ptr %cycle
  %rcc.tmp.20 = call i32 @simulate_queue_workload.(i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %queue_throughput
  %rcc.tmp.22 = load i32, ptr %memory_pressure
  %rcc.tmp.23 = load i32, ptr %cache_efficiency
  %rcc.tmp.24 = load i32, ptr %hash_performance
  %rcc.tmp.25 = load i32, ptr %queue_throughput
  %rcc.tmp.26 = call i32 @compute_integrated_score.(i32 %rcc.tmp.22, i32 %rcc.tmp.23, i32 %rcc.tmp.24, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %cycle_score
  %rcc.tmp.28 = load i32, ptr %total_score
  %rcc.tmp.29 = load i32, ptr %cycle_score
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %total_score
  %rcc.tmp.32 = load i32, ptr %cycle
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 100
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 99
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %cycle
  %rcc.tmp.37 = call i32 @simulate_system_adaptation.(i32 %rcc.tmp.36)
  store i32 %rcc.tmp.37, ptr %adaptation_bonus
  %rcc.tmp.39 = load i32, ptr %total_score
  %rcc.tmp.40 = load i32, ptr %adaptation_bonus
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %total_score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %cycle
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %cycle
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %total_score
  %rcc.tmp.50 = load i32, ptr %system_cycles
  %rcc.tmp.51 = sdiv i32 %rcc.tmp.49, %rcc.tmp.50
  ret i32 %rcc.tmp.51
}
define i32 @simulate_memory_pressure.(i32 %cycle.tmp) {
entry:
  %cycle..tmp = alloca i32 
  %pressure_type = alloca i32 
  %base_pressure = alloca i32 
  store i32 %cycle.tmp, ptr %cycle..tmp
  %rcc.tmp.2 = load i32, ptr %cycle..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 3
  store i32 %rcc.tmp.3, ptr %pressure_type
  store i32 50, ptr %base_pressure
  %rcc.tmp.6 = load i32, ptr %pressure_type
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %base_pressure
  %rcc.tmp.10 = load i32, ptr %cycle..tmp
  %rcc.tmp.11 = srem i32 %rcc.tmp.10, 20
  %rcc.tmp.12 = add i32 %rcc.tmp.9, %rcc.tmp.11
  ret i32 %rcc.tmp.12
if.else:
  %rcc.tmp.14 = load i32, ptr %pressure_type
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 1
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %base_pressure
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 30
  %rcc.tmp.19 = load i32, ptr %cycle..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.19, 17
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 40
  %rcc.tmp.22 = add i32 %rcc.tmp.18, %rcc.tmp.21
  ret i32 %rcc.tmp.22
if.else.2:
  %rcc.tmp.24 = load i32, ptr %base_pressure
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 60
  %rcc.tmp.26 = load i32, ptr %cycle..tmp
  %rcc.tmp.27 = call i32 @hash_function.(i32 %rcc.tmp.26)
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 30
  %rcc.tmp.29 = add i32 %rcc.tmp.25, %rcc.tmp.28
  ret i32 %rcc.tmp.29
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @simulate_cache_workload.(i32 %cycle.tmp) {
entry:
  %cycle..tmp = alloca i32 
  %workload_type = alloca i32 
  %base_efficiency = alloca i32 
  store i32 %cycle.tmp, ptr %cycle..tmp
  %rcc.tmp.2 = load i32, ptr %cycle..tmp
  %rcc.tmp.3 = sdiv i32 %rcc.tmp.2, 10
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 4
  store i32 %rcc.tmp.4, ptr %workload_type
  store i32 70, ptr %base_efficiency
  %rcc.tmp.7 = load i32, ptr %workload_type
  %rcc.tmp.8 = icmp eq i32 %rcc.tmp.7, 0
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %base_efficiency
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 20
  ret i32 %rcc.tmp.11
if.else:
  %rcc.tmp.13 = load i32, ptr %workload_type
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 1
  br i1 %rcc.tmp.14, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.16 = load i32, ptr %base_efficiency
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 10
  ret i32 %rcc.tmp.17
if.else.2:
  %rcc.tmp.19 = load i32, ptr %workload_type
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 2
  br i1 %rcc.tmp.20, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.22 = load i32, ptr %base_efficiency
  %rcc.tmp.23 = sub i32 %rcc.tmp.22, 10
  ret i32 %rcc.tmp.23
if.else.3:
  %rcc.tmp.25 = load i32, ptr %base_efficiency
  %rcc.tmp.26 = load i32, ptr %cycle..tmp
  %rcc.tmp.27 = mul i32 %rcc.tmp.26, 23
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 30
  %rcc.tmp.29 = add i32 %rcc.tmp.25, %rcc.tmp.28
  %rcc.tmp.30 = sub i32 %rcc.tmp.29, 15
  ret i32 %rcc.tmp.30
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @simulate_hash_workload.(i32 %cycle.tmp) {
entry:
  %cycle..tmp = alloca i32 
  %collision_rate = alloca i32 
  %base_performance = alloca i32 
  store i32 %cycle.tmp, ptr %cycle..tmp
  %rcc.tmp.2 = load i32, ptr %cycle..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 50
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 10
  store i32 %rcc.tmp.4, ptr %collision_rate
  store i32 80, ptr %base_performance
  %rcc.tmp.7 = load i32, ptr %base_performance
  %rcc.tmp.8 = load i32, ptr %collision_rate
  %rcc.tmp.9 = sdiv i32 %rcc.tmp.8, 5
  %rcc.tmp.10 = sub i32 %rcc.tmp.7, %rcc.tmp.9
  ret i32 %rcc.tmp.10
}
define i32 @simulate_queue_workload.(i32 %cycle.tmp) {
entry:
  %cycle..tmp = alloca i32 
  %queue_size = alloca i32 
  %operation_mix = alloca i32 
  %base_throughput = alloca i32 
  store i32 %cycle.tmp, ptr %cycle..tmp
  %rcc.tmp.2 = load i32, ptr %cycle..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 200
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 50
  store i32 %rcc.tmp.4, ptr %queue_size
  %rcc.tmp.6 = load i32, ptr %cycle..tmp
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 5
  store i32 %rcc.tmp.7, ptr %operation_mix
  store i32 85, ptr %base_throughput
  %rcc.tmp.10 = load i32, ptr %operation_mix
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  %rcc.tmp.13 = load i32, ptr %base_throughput
  %rcc.tmp.14 = load i32, ptr %queue_size
  %rcc.tmp.15 = sdiv i32 %rcc.tmp.14, 20
  %rcc.tmp.16 = sub i32 %rcc.tmp.13, %rcc.tmp.15
  ret i32 %rcc.tmp.16
if.else:
  %rcc.tmp.18 = load i32, ptr %operation_mix
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 1
  br i1 %rcc.tmp.19, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.21 = load i32, ptr %base_throughput
  %rcc.tmp.22 = load i32, ptr %queue_size
  %rcc.tmp.23 = sdiv i32 %rcc.tmp.22, 15
  %rcc.tmp.24 = sub i32 %rcc.tmp.21, %rcc.tmp.23
  ret i32 %rcc.tmp.24
if.else.2:
  %rcc.tmp.26 = load i32, ptr %base_throughput
  %rcc.tmp.27 = load i32, ptr %queue_size
  %rcc.tmp.28 = sdiv i32 %rcc.tmp.27, 25
  %rcc.tmp.29 = sub i32 %rcc.tmp.26, %rcc.tmp.28
  ret i32 %rcc.tmp.29
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @compute_integrated_score.(i32 %memory.tmp, i32 %cache.tmp, i32 %hash.tmp, i32 %queue.tmp) {
entry:
  %memory..tmp = alloca i32 
  %cache..tmp = alloca i32 
  %hash..tmp = alloca i32 
  %queue..tmp = alloca i32 
  %weighted_score = alloca i32 
  store i32 %memory.tmp, ptr %memory..tmp
  store i32 %cache.tmp, ptr %cache..tmp
  store i32 %hash.tmp, ptr %hash..tmp
  store i32 %queue.tmp, ptr %queue..tmp
  %rcc.tmp.5 = load i32, ptr %memory..tmp
  %rcc.tmp.6 = mul i32 %rcc.tmp.5, 3
  %rcc.tmp.7 = load i32, ptr %cache..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.7, 4
  %rcc.tmp.9 = add i32 %rcc.tmp.6, %rcc.tmp.8
  %rcc.tmp.10 = load i32, ptr %hash..tmp
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 2
  %rcc.tmp.12 = add i32 %rcc.tmp.9, %rcc.tmp.11
  %rcc.tmp.13 = load i32, ptr %queue..tmp
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = add i32 %rcc.tmp.12, %rcc.tmp.14
  %rcc.tmp.16 = sdiv i32 %rcc.tmp.15, 10
  store i32 %rcc.tmp.16, ptr %weighted_score
  %rcc.tmp.18 = load i32, ptr %weighted_score
  %rcc.tmp.19 = icmp sgt i32 %rcc.tmp.18, 90
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %weighted_score
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 10
  ret i32 %rcc.tmp.22
if.else:
  %rcc.tmp.24 = load i32, ptr %weighted_score
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 40
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %weighted_score
  %rcc.tmp.28 = sub i32 %rcc.tmp.27, 10
  ret i32 %rcc.tmp.28
if.else.2:
  %rcc.tmp.30 = load i32, ptr %weighted_score
  ret i32 %rcc.tmp.30
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i32 @simulate_system_adaptation.(i32 %cycle.tmp) {
entry:
  %cycle..tmp = alloca i32 
  %adaptation_factor = alloca i32 
  store i32 %cycle.tmp, ptr %cycle..tmp
  store i32 0, ptr %adaptation_factor
  %rcc.tmp.3 = load i32, ptr %cycle..tmp
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 300
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 299
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %adaptation_factor
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 5
  store i32 %rcc.tmp.8, ptr %adaptation_factor
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.12 = load i32, ptr %cycle..tmp
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 500
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 499
  br i1 %rcc.tmp.14, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.16 = load i32, ptr %adaptation_factor
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 8
  store i32 %rcc.tmp.17, ptr %adaptation_factor
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.21 = load i32, ptr %cycle..tmp
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 700
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 699
  br i1 %rcc.tmp.23, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.25 = load i32, ptr %adaptation_factor
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 3
  store i32 %rcc.tmp.26, ptr %adaptation_factor
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.30 = load i32, ptr %adaptation_factor
  ret i32 %rcc.tmp.30
}
