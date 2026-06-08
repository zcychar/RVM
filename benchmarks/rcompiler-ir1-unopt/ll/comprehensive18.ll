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
  call void @performMemoryPoolOperations.()
  call void @performBuddyAllocationTest.()
  call void @performGarbageCollectionTest.()
  call void @performFragmentationTest.()
  call void @testMemoryEdgeCases.()
  call void @printlnInt.(i32 1899)
  call void @exit.(i32 0)
  ret void
}
define void @performMemoryPoolOperations.() {
entry:
  %memory_pool = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %free_list_head = alloca i32 
  %allocated_blocks = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %allocated_count = alloca i32 
  %pool_size = alloca i32 
  %alloc_size = alloca i32 
  %allocated_block = alloca i32 
  %deallocated_count = alloca i32 
  %i = alloca i32 
  %block_start = alloca i32 
  %coalesced_count = alloca i32 
  %realloc_count = alloca i32 
  %test_size = alloca i32 
  %new_block = alloca i32 
  %utilization_stats = alloca i32 
  call void @printlnInt.(i32 1801)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2000 x i32], ptr %memory_pool, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %free_list_head
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 100
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %allocated_blocks, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %allocated_count
  store i32 2000, ptr %pool_size
  %rcc.tmp.27 = load i32, ptr %pool_size
  call void @initializeMemoryPool.([2000 x i32]* %memory_pool, i32 %rcc.tmp.27)
  call void @printlnInt.(i32 1802)
  store i32 8, ptr %alloc_size
  br label %while.cond
while.cond:
  %rcc.tmp.32 = load i32, ptr %alloc_size
  %rcc.tmp.33 = icmp sle i32 %rcc.tmp.32, 64
  br i1 %rcc.tmp.33, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.35 = load i32, ptr %allocated_count
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.38 = phi i1 [0, %while.cond], [%rcc.tmp.36, %and.rhs]
  br i1 %rcc.tmp.38, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.41 = load i32, ptr %free_list_head
  %rcc.tmp.42 = load i32, ptr %alloc_size
  %rcc.tmp.43 = call i32 @allocateBlock.([2000 x i32]* %memory_pool, i32 %rcc.tmp.41, i32 %rcc.tmp.42)
  store i32 %rcc.tmp.43, ptr %allocated_block
  %rcc.tmp.45 = load i32, ptr %allocated_block
  %rcc.tmp.46 = sub i32 0, 1
  %rcc.tmp.47 = icmp ne i32 %rcc.tmp.45, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %if.then, label %if.else
if.then:
  %rcc.tmp.49 = load i32, ptr %allocated_count
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [100 x i32], ptr %allocated_blocks, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %allocated_block
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %allocated_count
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %allocated_count
  %rcc.tmp.57 = load i32, ptr %pool_size
  %rcc.tmp.58 = call i32 @findFreeListHead.([2000 x i32]* %memory_pool, i32 %rcc.tmp.57)
  store i32 %rcc.tmp.58, ptr %free_list_head
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.62 = load i32, ptr %alloc_size
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 8
  store i32 %rcc.tmp.63, ptr %alloc_size
  br label %while.cond
while.end:
  %rcc.tmp.66 = load i32, ptr %allocated_count
  call void @printlnInt.(i32 %rcc.tmp.66)
  call void @printlnInt.(i32 1803)
  store i32 0, ptr %deallocated_count
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = load i32, ptr %allocated_count
  %rcc.tmp.74 = icmp slt i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = srem i32 %rcc.tmp.77, 3
  %rcc.tmp.79 = icmp eq i32 %rcc.tmp.78, 0
  br i1 %rcc.tmp.79, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [100 x i32], ptr %allocated_blocks, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  store i32 %rcc.tmp.84, ptr %block_start
  %rcc.tmp.86 = load i32, ptr %block_start
  call void @deallocateBlock.([2000 x i32]* %memory_pool, i32 %rcc.tmp.86)
  %rcc.tmp.88 = load i32, ptr %deallocated_count
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %deallocated_count
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [100 x i32], ptr %allocated_blocks, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = sub i32 0, 1
  store i32 %rcc.tmp.94, ptr %rcc.tmp.93
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.102 = load i32, ptr %deallocated_count
  call void @printlnInt.(i32 %rcc.tmp.102)
  call void @printlnInt.(i32 1804)
  %rcc.tmp.105 = load i32, ptr %pool_size
  %rcc.tmp.106 = call i32 @coalesceAdjacentBlocks.([2000 x i32]* %memory_pool, i32 %rcc.tmp.105)
  store i32 %rcc.tmp.106, ptr %coalesced_count
  %rcc.tmp.108 = load i32, ptr %coalesced_count
  call void @printlnInt.(i32 %rcc.tmp.108)
  call void @printlnInt.(i32 1805)
  store i32 0, ptr %realloc_count
  store i32 16, ptr %test_size
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.114 = load i32, ptr %test_size
  %rcc.tmp.115 = icmp sle i32 %rcc.tmp.114, 48
  br i1 %rcc.tmp.115, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.117 = load i32, ptr %realloc_count
  %rcc.tmp.118 = icmp slt i32 %rcc.tmp.117, 20
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.120 = phi i1 [0, %while.cond.3], [%rcc.tmp.118, %and.rhs.2]
  br i1 %rcc.tmp.120, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.123 = load i32, ptr %free_list_head
  %rcc.tmp.124 = load i32, ptr %test_size
  %rcc.tmp.125 = call i32 @allocateBlock.([2000 x i32]* %memory_pool, i32 %rcc.tmp.123, i32 %rcc.tmp.124)
  store i32 %rcc.tmp.125, ptr %new_block
  %rcc.tmp.127 = load i32, ptr %new_block
  %rcc.tmp.128 = sub i32 0, 1
  %rcc.tmp.129 = icmp ne i32 %rcc.tmp.127, %rcc.tmp.128
  br i1 %rcc.tmp.129, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.131 = load i32, ptr %realloc_count
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  store i32 %rcc.tmp.132, ptr %realloc_count
  %rcc.tmp.134 = load i32, ptr %pool_size
  %rcc.tmp.135 = call i32 @findFreeListHead.([2000 x i32]* %memory_pool, i32 %rcc.tmp.134)
  store i32 %rcc.tmp.135, ptr %free_list_head
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.139 = load i32, ptr %test_size
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 4
  store i32 %rcc.tmp.140, ptr %test_size
  br label %while.cond.3
while.end.3:
  %rcc.tmp.143 = load i32, ptr %realloc_count
  call void @printlnInt.(i32 %rcc.tmp.143)
  call void @printlnInt.(i32 1806)
  %rcc.tmp.146 = load i32, ptr %pool_size
  %rcc.tmp.147 = call i32 @analyzeMemoryUtilization.([2000 x i32]* %memory_pool, i32 %rcc.tmp.146)
  store i32 %rcc.tmp.147, ptr %utilization_stats
  %rcc.tmp.149 = load i32, ptr %utilization_stats
  call void @printlnInt.(i32 %rcc.tmp.149)
  ret void
}
define void @initializeMemoryPool.([2000 x i32]* %memory_pool.tmp, i32 %pool_size.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %pool_size..tmp = alloca i32 
  %i = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  %rcc.tmp.3 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.4 = getelementptr [2000 x i32], ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %pool_size..tmp
  %rcc.tmp.6 = sub i32 %rcc.tmp.5, 4
  store i32 %rcc.tmp.6, ptr %rcc.tmp.4
  %rcc.tmp.8 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.9 = getelementptr [2000 x i32], ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.12 = getelementptr [2000 x i32], ptr %rcc.tmp.11, i32 0, i32 2
  %rcc.tmp.13 = sub i32 0, 1
  store i32 %rcc.tmp.13, ptr %rcc.tmp.12
  %rcc.tmp.15 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.16 = getelementptr [2000 x i32], ptr %rcc.tmp.15, i32 0, i32 3
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  store i32 4, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %pool_size..tmp
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.29 = getelementptr [2000 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @allocateBlock.([2000 x i32]* %memory_pool.tmp, i32 %free_head.tmp, i32 %requested_size.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %free_head..tmp = alloca i32 
  %requested_size..tmp = alloca i32 
  %aligned_size = alloca i32 
  %total_needed = alloca i32 
  %current = alloca i32 
  %available_size = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %free_head.tmp, ptr %free_head..tmp
  store i32 %requested_size.tmp, ptr %requested_size..tmp
  %rcc.tmp.4 = load i32, ptr %requested_size..tmp
  %rcc.tmp.5 = call i32 @alignSize.(i32 %rcc.tmp.4, i32 4)
  store i32 %rcc.tmp.5, ptr %aligned_size
  %rcc.tmp.7 = load i32, ptr %aligned_size
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 4
  store i32 %rcc.tmp.8, ptr %total_needed
  %rcc.tmp.10 = load i32, ptr %free_head..tmp
  store i32 %rcc.tmp.10, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %current
  %rcc.tmp.14 = sub i32 0, 1
  %rcc.tmp.15 = icmp ne i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.17 = load i32, ptr %current
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 1996
  br label %sc.merge
sc.merge:
  %rcc.tmp.20 = phi i1 [0, %while.cond], [%rcc.tmp.18, %and.rhs]
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %current
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.27 = getelementptr [2000 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %current
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.34 = getelementptr [2000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %available_size
  %rcc.tmp.37 = load i32, ptr %available_size
  %rcc.tmp.38 = load i32, ptr %total_needed
  %rcc.tmp.39 = icmp sge i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.41 = load i32, ptr %available_size
  %rcc.tmp.42 = load i32, ptr %total_needed
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 8
  %rcc.tmp.44 = icmp sgt i32 %rcc.tmp.41, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.46 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.47 = load i32, ptr %current
  %rcc.tmp.48 = load i32, ptr %total_needed
  call void @splitBlock.([2000 x i32]* %rcc.tmp.46, i32 %rcc.tmp.47, i32 %rcc.tmp.48)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.52 = load i32, ptr %current
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.55 = getelementptr [2000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %aligned_size
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %current
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.62 = getelementptr [2000 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  store i32 1, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %current
  ret i32 %rcc.tmp.64
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.69 = load i32, ptr %current
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 2
  %rcc.tmp.72 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.73 = getelementptr [2000 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.77 = sub i32 0, 1
  ret i32 %rcc.tmp.77
}
define i32 @alignSize.(i32 %size.tmp, i32 %alignment.tmp) {
entry:
  %size..tmp = alloca i32 
  %alignment..tmp = alloca i32 
  store i32 %size.tmp, ptr %size..tmp
  store i32 %alignment.tmp, ptr %alignment..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = load i32, ptr %alignment..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.3, %rcc.tmp.4
  %rcc.tmp.6 = sub i32 %rcc.tmp.5, 1
  %rcc.tmp.7 = load i32, ptr %alignment..tmp
  %rcc.tmp.8 = sdiv i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %alignment..tmp
  %rcc.tmp.10 = mul i32 %rcc.tmp.8, %rcc.tmp.9
  ret i32 %rcc.tmp.10
}
define void @splitBlock.([2000 x i32]* %memory_pool.tmp, i32 %block_start.tmp, i32 %needed_size.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %block_start..tmp = alloca i32 
  %needed_size..tmp = alloca i32 
  %original_size = alloca i32 
  %remaining_size = alloca i32 
  %new_block_start = alloca i32 
  %next_block = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %block_start.tmp, ptr %block_start..tmp
  store i32 %needed_size.tmp, ptr %needed_size..tmp
  %rcc.tmp.4 = load i32, ptr %block_start..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 0
  %rcc.tmp.6 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %original_size
  %rcc.tmp.10 = load i32, ptr %original_size
  %rcc.tmp.11 = load i32, ptr %needed_size..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %remaining_size
  %rcc.tmp.14 = load i32, ptr %remaining_size
  %rcc.tmp.15 = icmp sge i32 %rcc.tmp.14, 8
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %block_start..tmp
  %rcc.tmp.18 = load i32, ptr %needed_size..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %new_block_start
  %rcc.tmp.21 = load i32, ptr %new_block_start
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.24 = getelementptr [2000 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %remaining_size
  %rcc.tmp.26 = sub i32 %rcc.tmp.25, 4
  store i32 %rcc.tmp.26, ptr %rcc.tmp.24
  %rcc.tmp.28 = load i32, ptr %new_block_start
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.32 = getelementptr [2000 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %new_block_start
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 2
  %rcc.tmp.37 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.38 = getelementptr [2000 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %block_start..tmp
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 2
  %rcc.tmp.42 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.43 = getelementptr [2000 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %rcc.tmp.38
  %rcc.tmp.46 = load i32, ptr %new_block_start
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 3
  %rcc.tmp.49 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.50 = getelementptr [2000 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %block_start..tmp
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %block_start..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.56 = getelementptr [2000 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %needed_size..tmp
  %rcc.tmp.58 = sub i32 %rcc.tmp.57, 4
  store i32 %rcc.tmp.58, ptr %rcc.tmp.56
  %rcc.tmp.60 = load i32, ptr %block_start..tmp
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 2
  %rcc.tmp.63 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.64 = getelementptr [2000 x i32], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.65 = load i32, ptr %new_block_start
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %new_block_start
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 2
  %rcc.tmp.70 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.71 = getelementptr [2000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = sub i32 0, 1
  %rcc.tmp.74 = icmp ne i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.76 = load i32, ptr %new_block_start
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 2
  %rcc.tmp.79 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.80 = getelementptr [2000 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %next_block
  %rcc.tmp.83 = load i32, ptr %next_block
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 3
  %rcc.tmp.86 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.87 = getelementptr [2000 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %new_block_start
  store i32 %rcc.tmp.88, ptr %rcc.tmp.87
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @deallocateBlock.([2000 x i32]* %memory_pool.tmp, i32 %block_start.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %block_start..tmp = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %block_start.tmp, ptr %block_start..tmp
  %rcc.tmp.3 = load i32, ptr %block_start..tmp
  %rcc.tmp.4 = icmp sge i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.6 = load i32, ptr %block_start..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 1996
  br label %sc.merge
sc.merge:
  %rcc.tmp.9 = phi i1 [0, %entry], [%rcc.tmp.7, %and.rhs]
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %block_start..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %block_start..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 2
  %rcc.tmp.20 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = sub i32 0, 1
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %block_start..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 3
  %rcc.tmp.27 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.28 = getelementptr [2000 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = sub i32 0, 1
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @findFreeListHead.([2000 x i32]* %memory_pool.tmp, i32 %pool_size.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %pool_size..tmp = alloca i32 
  %i = alloca i32 
  %block_size = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %pool_size..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.6, 4
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %i
  ret i32 %rcc.tmp.19
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.25 = getelementptr [2000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 4
  store i32 %rcc.tmp.27, ptr %block_size
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %block_size
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.34 = sub i32 0, 1
  ret i32 %rcc.tmp.34
}
define i32 @coalesceAdjacentBlocks.([2000 x i32]* %memory_pool.tmp, i32 %pool_size.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %pool_size..tmp = alloca i32 
  %coalesced_count = alloca i32 
  %current = alloca i32 
  %current_size = alloca i32 
  %next_block = alloca i32 
  %next_size = alloca i32 
  %block_size = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  store i32 0, ptr %coalesced_count
  store i32 0, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %current
  %rcc.tmp.7 = load i32, ptr %pool_size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 8
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %current
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.16 = getelementptr [2000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %current
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.23 = getelementptr [2000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 4
  store i32 %rcc.tmp.25, ptr %current_size
  %rcc.tmp.27 = load i32, ptr %current
  %rcc.tmp.28 = load i32, ptr %current_size
  %rcc.tmp.29 = add i32 %rcc.tmp.27, %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %next_block
  %rcc.tmp.31 = load i32, ptr %next_block
  %rcc.tmp.32 = load i32, ptr %pool_size..tmp
  %rcc.tmp.33 = sub i32 %rcc.tmp.32, 4
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.36 = load i32, ptr %next_block
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.40 = getelementptr [2000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.41, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.44 = phi i1 [0, %if.then], [%rcc.tmp.42, %and.rhs]
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load i32, ptr %next_block
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.49 = getelementptr [2000 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 4
  store i32 %rcc.tmp.51, ptr %next_size
  %rcc.tmp.53 = load i32, ptr %current
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.56 = getelementptr [2000 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %current
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.60 = getelementptr [2000 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %next_size
  %rcc.tmp.63 = add i32 %rcc.tmp.61, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %rcc.tmp.56
  %rcc.tmp.65 = load i32, ptr %next_block
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.68 = getelementptr [2000 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  store i32 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %next_block
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  %rcc.tmp.73 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.74 = getelementptr [2000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = sub i32 0, 1
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %next_block
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 2
  %rcc.tmp.80 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.81 = getelementptr [2000 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %next_block
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 3
  %rcc.tmp.86 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.87 = getelementptr [2000 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %coalesced_count
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %coalesced_count
  br label %if.merge.2
if.else.2:
  %rcc.tmp.93 = load i32, ptr %current
  %rcc.tmp.94 = load i32, ptr %current_size
  %rcc.tmp.95 = add i32 %rcc.tmp.93, %rcc.tmp.94
  store i32 %rcc.tmp.95, ptr %current
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.99 = load i32, ptr %current
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.102 = getelementptr [2000 x i32], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 4
  store i32 %rcc.tmp.104, ptr %block_size
  %rcc.tmp.106 = load i32, ptr %current
  %rcc.tmp.107 = load i32, ptr %block_size
  %rcc.tmp.108 = add i32 %rcc.tmp.106, %rcc.tmp.107
  store i32 %rcc.tmp.108, ptr %current
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.112 = load i32, ptr %coalesced_count
  ret i32 %rcc.tmp.112
}
define i32 @analyzeMemoryUtilization.([2000 x i32]* %memory_pool.tmp, i32 %pool_size.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %pool_size..tmp = alloca i32 
  %allocated_bytes = alloca i32 
  %free_bytes = alloca i32 
  %allocated_blocks = alloca i32 
  %free_blocks = alloca i32 
  %current = alloca i32 
  %block_size = alloca i32 
  %total_usable = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  store i32 0, ptr %allocated_bytes
  store i32 0, ptr %free_bytes
  store i32 0, ptr %allocated_blocks
  store i32 0, ptr %free_blocks
  store i32 0, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %current
  %rcc.tmp.10 = load i32, ptr %pool_size..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.10, 4
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %current
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.18 = getelementptr [2000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 4
  store i32 %rcc.tmp.20, ptr %block_size
  %rcc.tmp.22 = load i32, ptr %current
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.26 = getelementptr [2000 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %free_bytes
  %rcc.tmp.31 = load i32, ptr %current
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.34 = getelementptr [2000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.30, %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %free_bytes
  %rcc.tmp.38 = load i32, ptr %free_blocks
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %free_blocks
  br label %if.merge
if.else:
  %rcc.tmp.42 = load i32, ptr %current
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  %rcc.tmp.45 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.46 = getelementptr [2000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.47, 1
  br i1 %rcc.tmp.48, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.50 = load i32, ptr %allocated_bytes
  %rcc.tmp.51 = load i32, ptr %current
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.54 = getelementptr [2000 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.50, %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %allocated_bytes
  %rcc.tmp.58 = load i32, ptr %allocated_blocks
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %allocated_blocks
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.64 = load i32, ptr %current
  %rcc.tmp.65 = load i32, ptr %block_size
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.69 = load i32, ptr %allocated_bytes
  %rcc.tmp.70 = load i32, ptr %free_bytes
  %rcc.tmp.71 = add i32 %rcc.tmp.69, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %total_usable
  %rcc.tmp.73 = load i32, ptr %total_usable
  %rcc.tmp.74 = icmp sgt i32 %rcc.tmp.73, 0
  br i1 %rcc.tmp.74, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.76 = load i32, ptr %allocated_bytes
  %rcc.tmp.77 = mul i32 %rcc.tmp.76, 100
  %rcc.tmp.78 = load i32, ptr %total_usable
  %rcc.tmp.79 = sdiv i32 %rcc.tmp.77, %rcc.tmp.78
  ret i32 %rcc.tmp.79
if.else.3:
  ret i32 0
if.merge.3:
  ret i32 undef
}
define void @performBuddyAllocationTest.() {
entry:
  %buddy_tree = alloca [512 x i32] 
  %fill.idx = alloca i32 
  %allocation_map = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %allocation_count = alloca i32 
  %tree_depth = alloca i32 
  %size = alloca i32 
  %allocated_node = alloca i32 
  %deallocated = alloca i32 
  %i = alloca i32 
  %reallocated = alloca i32 
  %new_allocation = alloca i32 
  %fragmentation_score = alloca i32 
  call void @printlnInt.(i32 1810)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [512 x i32], ptr %buddy_tree, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 100
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %allocation_map, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %allocation_count
  store i32 8, ptr %tree_depth
  %rcc.tmp.26 = load i32, ptr %tree_depth
  call void @initializeBuddySystem.([512 x i32]* %buddy_tree, i32 %rcc.tmp.26)
  call void @printlnInt.(i32 1811)
  store i32 1, ptr %size
  br label %while.cond
while.cond:
  %rcc.tmp.31 = load i32, ptr %size
  %rcc.tmp.32 = icmp sle i32 %rcc.tmp.31, 64
  br i1 %rcc.tmp.32, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.34 = load i32, ptr %allocation_count
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.34, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.37 = phi i1 [0, %while.cond], [%rcc.tmp.35, %and.rhs]
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.40 = load i32, ptr %tree_depth
  %rcc.tmp.41 = load i32, ptr %size
  %rcc.tmp.42 = call i32 @buddyAllocate.([512 x i32]* %buddy_tree, i32 %rcc.tmp.40, i32 %rcc.tmp.41)
  store i32 %rcc.tmp.42, ptr %allocated_node
  %rcc.tmp.44 = load i32, ptr %allocated_node
  %rcc.tmp.45 = sub i32 0, 1
  %rcc.tmp.46 = icmp ne i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then, label %if.else
if.then:
  %rcc.tmp.48 = load i32, ptr %allocation_count
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [100 x i32], ptr %allocation_map, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %allocated_node
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %allocation_count
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %allocation_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.58 = load i32, ptr %size
  %rcc.tmp.59 = mul i32 %rcc.tmp.58, 2
  store i32 %rcc.tmp.59, ptr %size
  br label %while.cond
while.end:
  %rcc.tmp.62 = load i32, ptr %allocation_count
  call void @printlnInt.(i32 %rcc.tmp.62)
  call void @printlnInt.(i32 1812)
  store i32 0, ptr %deallocated
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = load i32, ptr %allocation_count
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.68, %rcc.tmp.69
  br i1 %rcc.tmp.70, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = srem i32 %rcc.tmp.73, 2
  %rcc.tmp.75 = icmp eq i32 %rcc.tmp.74, 0
  br i1 %rcc.tmp.75, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.77 = load i32, ptr %tree_depth
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [100 x i32], ptr %allocation_map, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  call void @buddyDeallocate.([512 x i32]* %buddy_tree, i32 %rcc.tmp.77, i32 %rcc.tmp.81)
  %rcc.tmp.83 = load i32, ptr %deallocated
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %deallocated
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [100 x i32], ptr %allocation_map, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = sub i32 0, 1
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.97 = load i32, ptr %deallocated
  call void @printlnInt.(i32 %rcc.tmp.97)
  call void @printlnInt.(i32 1813)
  store i32 0, ptr %reallocated
  store i32 8, ptr %size
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.103 = load i32, ptr %size
  %rcc.tmp.104 = icmp sle i32 %rcc.tmp.103, 32
  br i1 %rcc.tmp.104, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.106 = load i32, ptr %reallocated
  %rcc.tmp.107 = icmp slt i32 %rcc.tmp.106, 10
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.109 = phi i1 [0, %while.cond.3], [%rcc.tmp.107, %and.rhs.2]
  br i1 %rcc.tmp.109, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.112 = load i32, ptr %tree_depth
  %rcc.tmp.113 = load i32, ptr %size
  %rcc.tmp.114 = call i32 @buddyAllocate.([512 x i32]* %buddy_tree, i32 %rcc.tmp.112, i32 %rcc.tmp.113)
  store i32 %rcc.tmp.114, ptr %new_allocation
  %rcc.tmp.116 = load i32, ptr %new_allocation
  %rcc.tmp.117 = sub i32 0, 1
  %rcc.tmp.118 = icmp ne i32 %rcc.tmp.116, %rcc.tmp.117
  br i1 %rcc.tmp.118, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.120 = load i32, ptr %reallocated
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  store i32 %rcc.tmp.121, ptr %reallocated
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.125 = load i32, ptr %size
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 8
  store i32 %rcc.tmp.126, ptr %size
  br label %while.cond.3
while.end.3:
  %rcc.tmp.129 = load i32, ptr %reallocated
  call void @printlnInt.(i32 %rcc.tmp.129)
  call void @printlnInt.(i32 1814)
  %rcc.tmp.132 = load i32, ptr %tree_depth
  %rcc.tmp.133 = call i32 @analyzeBuddyFragmentation.([512 x i32]* %buddy_tree, i32 %rcc.tmp.132)
  store i32 %rcc.tmp.133, ptr %fragmentation_score
  %rcc.tmp.135 = load i32, ptr %fragmentation_score
  call void @printlnInt.(i32 %rcc.tmp.135)
  ret void
}
define void @initializeBuddySystem.([512 x i32]* %buddy_tree.tmp, i32 %depth.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %depth..tmp = alloca i32 
  %tree_size = alloca i32 
  %i = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  %rcc.tmp.3 = load i32, ptr %depth..tmp
  %rcc.tmp.4 = shl i32 1, %rcc.tmp.3
  %rcc.tmp.5 = sub i32 %rcc.tmp.4, 1
  store i32 %rcc.tmp.5, ptr %tree_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %tree_size
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.17 = getelementptr [512 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @buddyAllocate.([512 x i32]* %buddy_tree.tmp, i32 %depth.tmp, i32 %size.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %depth..tmp = alloca i32 
  %size..tmp = alloca i32 
  %required_level = alloca i32 
  %node = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = load i32, ptr %depth..tmp
  %rcc.tmp.6 = call i32 @calculateRequiredLevel.(i32 %rcc.tmp.4, i32 %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %required_level
  %rcc.tmp.8 = load i32, ptr %required_level
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = sub i32 0, 1
  ret i32 %rcc.tmp.11
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.15 = load i32, ptr %required_level
  %rcc.tmp.16 = load i32, ptr %depth..tmp
  %rcc.tmp.17 = call i32 @findFreeNode.([512 x i32]* %rcc.tmp.14, i32 0, i32 0, i32 %rcc.tmp.15, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %node
  %rcc.tmp.19 = load i32, ptr %node
  %rcc.tmp.20 = sub i32 0, 1
  %rcc.tmp.21 = icmp ne i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.23 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.24 = load i32, ptr %node
  %rcc.tmp.25 = load i32, ptr %required_level
  %rcc.tmp.26 = load i32, ptr %depth..tmp
  call void @markNodeAsAllocated.([512 x i32]* %rcc.tmp.23, i32 %rcc.tmp.24, i32 %rcc.tmp.25, i32 %rcc.tmp.26)
  %rcc.tmp.28 = load i32, ptr %node
  ret i32 %rcc.tmp.28
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.31 = sub i32 0, 1
  ret i32 %rcc.tmp.31
}
define i32 @calculateRequiredLevel.(i32 %size.tmp, i32 %max_depth.tmp) {
entry:
  %size..tmp = alloca i32 
  %max_depth..tmp = alloca i32 
  %max_size = alloca i32 
  %level = alloca i32 
  %level_size = alloca i32 
  store i32 %size.tmp, ptr %size..tmp
  store i32 %max_depth.tmp, ptr %max_depth..tmp
  %rcc.tmp.3 = load i32, ptr %max_depth..tmp
  %rcc.tmp.4 = sub i32 %rcc.tmp.3, 1
  %rcc.tmp.5 = shl i32 1, %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %max_size
  store i32 0, ptr %level
  %rcc.tmp.8 = load i32, ptr %max_size
  store i32 %rcc.tmp.8, ptr %level_size
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %level
  %rcc.tmp.12 = load i32, ptr %max_depth..tmp
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %level_size
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = icmp sge i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %level
  ret i32 %rcc.tmp.20
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.23 = load i32, ptr %level_size
  %rcc.tmp.24 = sdiv i32 %rcc.tmp.23, 2
  store i32 %rcc.tmp.24, ptr %level_size
  %rcc.tmp.26 = load i32, ptr %level
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %level
  br label %while.cond
while.end:
  %rcc.tmp.30 = sub i32 0, 1
  ret i32 %rcc.tmp.30
}
define i32 @findFreeNode.([512 x i32]* %buddy_tree.tmp, i32 %node.tmp, i32 %current_level.tmp, i32 %target_level.tmp, i32 %max_depth.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %node..tmp = alloca i32 
  %current_level..tmp = alloca i32 
  %target_level..tmp = alloca i32 
  %max_depth..tmp = alloca i32 
  %left_child = alloca i32 
  %right_child = alloca i32 
  %left_result = alloca i32 
  %right_result = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %current_level.tmp, ptr %current_level..tmp
  store i32 %target_level.tmp, ptr %target_level..tmp
  store i32 %max_depth.tmp, ptr %max_depth..tmp
  %rcc.tmp.6 = load i32, ptr %current_level..tmp
  %rcc.tmp.7 = load i32, ptr %target_level..tmp
  %rcc.tmp.8 = icmp eq i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %node..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.13 = getelementptr [512 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %node..tmp
  ret i32 %rcc.tmp.17
if.else.2:
  %rcc.tmp.19 = sub i32 0, 1
  ret i32 %rcc.tmp.19
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.26 = getelementptr [512 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 1
  br i1 %rcc.tmp.28, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.30 = sub i32 0, 1
  ret i32 %rcc.tmp.30
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.33 = load i32, ptr %node..tmp
  %rcc.tmp.34 = mul i32 2, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %left_child
  %rcc.tmp.37 = load i32, ptr %node..tmp
  %rcc.tmp.38 = mul i32 2, %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 2
  store i32 %rcc.tmp.39, ptr %right_child
  %rcc.tmp.41 = load i32, ptr %left_child
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 511
  br i1 %rcc.tmp.42, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.44 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.45 = load i32, ptr %left_child
  %rcc.tmp.46 = load i32, ptr %current_level..tmp
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  %rcc.tmp.48 = load i32, ptr %target_level..tmp
  %rcc.tmp.49 = load i32, ptr %max_depth..tmp
  %rcc.tmp.50 = call i32 @findFreeNode.([512 x i32]* %rcc.tmp.44, i32 %rcc.tmp.45, i32 %rcc.tmp.47, i32 %rcc.tmp.48, i32 %rcc.tmp.49)
  store i32 %rcc.tmp.50, ptr %left_result
  %rcc.tmp.52 = load i32, ptr %left_result
  %rcc.tmp.53 = sub i32 0, 1
  %rcc.tmp.54 = icmp ne i32 %rcc.tmp.52, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.56 = load i32, ptr %left_result
  ret i32 %rcc.tmp.56
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.61 = load i32, ptr %right_child
  %rcc.tmp.62 = icmp slt i32 %rcc.tmp.61, 511
  br i1 %rcc.tmp.62, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.64 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.65 = load i32, ptr %right_child
  %rcc.tmp.66 = load i32, ptr %current_level..tmp
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = load i32, ptr %target_level..tmp
  %rcc.tmp.69 = load i32, ptr %max_depth..tmp
  %rcc.tmp.70 = call i32 @findFreeNode.([512 x i32]* %rcc.tmp.64, i32 %rcc.tmp.65, i32 %rcc.tmp.67, i32 %rcc.tmp.68, i32 %rcc.tmp.69)
  store i32 %rcc.tmp.70, ptr %right_result
  %rcc.tmp.72 = load i32, ptr %right_result
  %rcc.tmp.73 = sub i32 0, 1
  %rcc.tmp.74 = icmp ne i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.76 = load i32, ptr %right_result
  ret i32 %rcc.tmp.76
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.81 = sub i32 0, 1
  ret i32 %rcc.tmp.81
}
define void @markNodeAsAllocated.([512 x i32]* %buddy_tree.tmp, i32 %node.tmp, i32 %level.tmp, i32 %max_depth.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %node..tmp = alloca i32 
  %level..tmp = alloca i32 
  %max_depth..tmp = alloca i32 
  %parent = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %level.tmp, ptr %level..tmp
  store i32 %max_depth.tmp, ptr %max_depth..tmp
  %rcc.tmp.5 = load i32, ptr %node..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.8 = getelementptr [512 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  store i32 1, ptr %rcc.tmp.8
  %rcc.tmp.10 = load i32, ptr %node..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.10, 1
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.11, 2
  store i32 %rcc.tmp.12, ptr %parent
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %parent
  %rcc.tmp.16 = icmp sge i32 %rcc.tmp.15, 0
  br i1 %rcc.tmp.16, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.18 = load i32, ptr %node..tmp
  %rcc.tmp.19 = icmp sgt i32 %rcc.tmp.18, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.21 = phi i1 [0, %while.cond], [%rcc.tmp.19, %and.rhs]
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32, ptr %parent
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.27 = getelementptr [512 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp ne i32 %rcc.tmp.28, 1
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %parent
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.34 = getelementptr [512 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  store i32 2, ptr %rcc.tmp.34
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %parent
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.43 = load i32, ptr %parent
  store i32 %rcc.tmp.43, ptr %node..tmp
  %rcc.tmp.45 = load i32, ptr %parent
  %rcc.tmp.46 = sub i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = sdiv i32 %rcc.tmp.46, 2
  store i32 %rcc.tmp.47, ptr %parent
  br label %while.cond
while.end:
  ret void
}
define void @buddyDeallocate.([512 x i32]* %buddy_tree.tmp, i32 %depth.tmp, i32 %node.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %depth..tmp = alloca i32 
  %node..tmp = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.4 = load i32, ptr %node..tmp
  %rcc.tmp.5 = icmp sge i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.7 = load i32, ptr %node..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 511
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [0, %entry], [%rcc.tmp.8, %and.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %node..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.15 = getelementptr [512 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.18 = load i32, ptr %node..tmp
  call void @coalesceBuddies.([512 x i32]* %rcc.tmp.17, i32 %rcc.tmp.18)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @coalesceBuddies.([512 x i32]* %buddy_tree.tmp, i32 %node.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %node..tmp = alloca i32 
  %parent = alloca i32 
  %left_child = alloca i32 
  %right_child = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.3 = load i32, ptr %node..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = sdiv i32 %rcc.tmp.9, 2
  store i32 %rcc.tmp.10, ptr %parent
  %rcc.tmp.12 = load i32, ptr %parent
  %rcc.tmp.13 = mul i32 2, %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %left_child
  %rcc.tmp.16 = load i32, ptr %parent
  %rcc.tmp.17 = mul i32 2, %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 2
  store i32 %rcc.tmp.18, ptr %right_child
  %rcc.tmp.20 = load i32, ptr %left_child
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.23 = getelementptr [512 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.27 = load i32, ptr %right_child
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.30 = getelementptr [512 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.34 = phi i1 [0, %if.merge], [%rcc.tmp.32, %and.rhs]
  br i1 %rcc.tmp.34, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.36 = load i32, ptr %parent
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.39 = getelementptr [512 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %left_child
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.44 = getelementptr [512 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = sub i32 0, 1
  store i32 %rcc.tmp.45, ptr %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %right_child
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.50 = getelementptr [512 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = sub i32 0, 1
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.54 = load i32, ptr %parent
  call void @coalesceBuddies.([512 x i32]* %rcc.tmp.53, i32 %rcc.tmp.54)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret void
}
define i32 @analyzeBuddyFragmentation.([512 x i32]* %buddy_tree.tmp, i32 %depth.tmp) {
entry:
  %buddy_tree..tmp = alloca [512 x i32]* 
  %depth..tmp = alloca i32 
  %free_nodes = alloca i32 
  %allocated_nodes = alloca i32 
  %split_nodes = alloca i32 
  %tree_size = alloca i32 
  %i = alloca i32 
  store [512 x i32]* %buddy_tree.tmp, ptr %buddy_tree..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 0, ptr %free_nodes
  store i32 0, ptr %allocated_nodes
  store i32 0, ptr %split_nodes
  %rcc.tmp.6 = load i32, ptr %depth..tmp
  %rcc.tmp.7 = shl i32 1, %rcc.tmp.6
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %tree_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %tree_size
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.20 = getelementptr [512 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.21, 0
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  %rcc.tmp.24 = load i32, ptr %free_nodes
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %free_nodes
  br label %if.merge
if.else:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.31 = getelementptr [512 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.32, 1
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.35 = load i32, ptr %allocated_nodes
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %allocated_nodes
  br label %if.merge.2
if.else.2:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [512 x i32]*, ptr %buddy_tree..tmp
  %rcc.tmp.42 = getelementptr [512 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.43, 2
  br i1 %rcc.tmp.44, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.46 = load i32, ptr %split_nodes
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %split_nodes
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.57 = load i32, ptr %split_nodes
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 100
  %rcc.tmp.59 = load i32, ptr %allocated_nodes
  %rcc.tmp.60 = load i32, ptr %split_nodes
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  %rcc.tmp.63 = sdiv i32 %rcc.tmp.58, %rcc.tmp.62
  ret i32 %rcc.tmp.63
}
define void @performGarbageCollectionTest.() {
entry:
  %object_pool = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %object_refs = alloca [500 x i32] 
  %fill.idx.2 = alloca i32 
  %root_set = alloca [50 x i32] 
  %fill.idx.3 = alloca i32 
  %gc_marks = alloca [200 x i32] 
  %fill.idx.4 = alloca i32 
  %object_count = alloca i32 
  %root_count = alloca i32 
  %marked_objects = alloca i32 
  %collected_objects = alloca i32 
  %compacted_size = alloca i32 
  %ref_count_result = alloca i32 
  call void @printlnInt.(i32 1820)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %object_pool, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 500
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [500 x i32], ptr %object_refs, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 50
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %root_set, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.37 = load i32, ptr %fill.idx.4
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 200
  br i1 %rcc.tmp.38, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.40 = load i32, ptr %fill.idx.4
  %rcc.tmp.41 = getelementptr [200 x i32], ptr %gc_marks, i32 0, i32 %rcc.tmp.40
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.43, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %object_count
  store i32 0, ptr %root_count
  call void @initializeObjectGraph.([1000 x i32]* %object_pool, [500 x i32]* %object_refs, [50 x i32]* %root_set, i32* %object_count, i32* %root_count)
  call void @printlnInt.(i32 1821)
  %rcc.tmp.50 = load i32, ptr %root_count
  %rcc.tmp.51 = call i32 @performMarkPhase.([1000 x i32]* %object_pool, [500 x i32]* %object_refs, [50 x i32]* %root_set, [200 x i32]* %gc_marks, i32 %rcc.tmp.50)
  store i32 %rcc.tmp.51, ptr %marked_objects
  %rcc.tmp.53 = load i32, ptr %marked_objects
  call void @printlnInt.(i32 %rcc.tmp.53)
  call void @printlnInt.(i32 1822)
  %rcc.tmp.56 = load i32, ptr %object_count
  %rcc.tmp.57 = call i32 @performSweepPhase.([1000 x i32]* %object_pool, [200 x i32]* %gc_marks, i32 %rcc.tmp.56)
  store i32 %rcc.tmp.57, ptr %collected_objects
  %rcc.tmp.59 = load i32, ptr %collected_objects
  call void @printlnInt.(i32 %rcc.tmp.59)
  call void @printlnInt.(i32 1823)
  %rcc.tmp.62 = load i32, ptr %object_count
  %rcc.tmp.63 = call i32 @performCompactionPhase.([1000 x i32]* %object_pool, [500 x i32]* %object_refs, i32 %rcc.tmp.62)
  store i32 %rcc.tmp.63, ptr %compacted_size
  %rcc.tmp.65 = load i32, ptr %compacted_size
  call void @printlnInt.(i32 %rcc.tmp.65)
  call void @printlnInt.(i32 1824)
  %rcc.tmp.68 = load i32, ptr %object_count
  %rcc.tmp.69 = call i32 @simulateReferenceCounting.([1000 x i32]* %object_pool, i32 %rcc.tmp.68)
  store i32 %rcc.tmp.69, ptr %ref_count_result
  %rcc.tmp.71 = load i32, ptr %ref_count_result
  call void @printlnInt.(i32 %rcc.tmp.71)
  ret void
}
define void @initializeObjectGraph.([1000 x i32]* %object_pool.tmp, [500 x i32]* %object_refs.tmp, [50 x i32]* %root_set.tmp, i32* %object_count.tmp, i32* %root_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_refs..tmp = alloca [500 x i32]* 
  %root_set..tmp = alloca [50 x i32]* 
  %object_count..tmp = alloca i32* 
  %root_count..tmp = alloca i32* 
  %i = alloca i32 
  %rc = alloca i32 
  %oc = alloca i32 
  %object_start = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store [500 x i32]* %object_refs.tmp, ptr %object_refs..tmp
  store [50 x i32]* %root_set.tmp, ptr %root_set..tmp
  store i32* %object_count.tmp, ptr %object_count..tmp
  store i32* %root_count.tmp, ptr %root_count..tmp
  %rcc.tmp.6 = load i32*, ptr %root_count..tmp
  store i32 5, ptr %rcc.tmp.6
  store i32 0, ptr %i
  %rcc.tmp.9 = load i32*, ptr %root_count..tmp
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %rc
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %rc
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [50 x i32]*, ptr %root_set..tmp
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 20
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = mul i32 %rcc.tmp.26, 20
  %rcc.tmp.28 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.29 = getelementptr [1000 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  store i32 1, ptr %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = mul i32 %rcc.tmp.32, 20
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  %rcc.tmp.35 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.36 = getelementptr [1000 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  store i32 16, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = mul i32 %rcc.tmp.39, 20
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 2
  %rcc.tmp.42 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.43 = getelementptr [1000 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  store i32 1, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32*, ptr %object_count..tmp
  store i32 30, ptr %rcc.tmp.49
  store i32 0, ptr %i
  %rcc.tmp.52 = load i32*, ptr %object_count..tmp
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %oc
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = load i32, ptr %oc
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = mul i32 %rcc.tmp.61, 20
  store i32 %rcc.tmp.62, ptr %object_start
  %rcc.tmp.64 = load i32, ptr %object_start
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 10
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.65, 1000
  br i1 %rcc.tmp.66, label %if.then, label %if.else
if.then:
  %rcc.tmp.68 = load i32, ptr %object_start
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.71 = getelementptr [1000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = srem i32 %rcc.tmp.72, 3
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %rcc.tmp.71
  %rcc.tmp.76 = load i32, ptr %object_start
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  %rcc.tmp.79 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.80 = getelementptr [1000 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = srem i32 %rcc.tmp.81, 8
  %rcc.tmp.83 = add i32 12, %rcc.tmp.82
  store i32 %rcc.tmp.83, ptr %rcc.tmp.80
  %rcc.tmp.85 = load i32, ptr %object_start
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 2
  %rcc.tmp.88 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.89 = getelementptr [1000 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  %rcc.tmp.93 = load i32, ptr %oc
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.96 = load i32, ptr %object_start
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 3
  %rcc.tmp.99 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.100 = getelementptr [1000 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  %rcc.tmp.103 = mul i32 %rcc.tmp.102, 20
  store i32 %rcc.tmp.103, ptr %rcc.tmp.100
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = mul i32 %rcc.tmp.106, 2
  %rcc.tmp.108 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.109 = getelementptr [500 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %object_start
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 3
  store i32 %rcc.tmp.111, ptr %rcc.tmp.109
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 2
  %rcc.tmp.117 = load i32, ptr %oc
  %rcc.tmp.118 = icmp slt i32 %rcc.tmp.116, %rcc.tmp.117
  br i1 %rcc.tmp.118, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = srem i32 %rcc.tmp.120, 3
  %rcc.tmp.122 = icmp eq i32 %rcc.tmp.121, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.124 = phi i1 [0, %if.merge.2], [%rcc.tmp.122, %and.rhs]
  br i1 %rcc.tmp.124, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.126 = load i32, ptr %object_start
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 0
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 4
  %rcc.tmp.129 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.130 = getelementptr [1000 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 2
  %rcc.tmp.133 = mul i32 %rcc.tmp.132, 20
  store i32 %rcc.tmp.133, ptr %rcc.tmp.130
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = mul i32 %rcc.tmp.136, 2
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 1
  %rcc.tmp.139 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.140 = getelementptr [500 x i32], ptr %rcc.tmp.139, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.141 = load i32, ptr %object_start
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 4
  store i32 %rcc.tmp.142, ptr %rcc.tmp.140
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 1
  store i32 %rcc.tmp.149, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @performMarkPhase.([1000 x i32]* %object_pool.tmp, [500 x i32]* %object_refs.tmp, [50 x i32]* %root_set.tmp, [200 x i32]* %gc_marks.tmp, i32 %root_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_refs..tmp = alloca [500 x i32]* 
  %root_set..tmp = alloca [50 x i32]* 
  %gc_marks..tmp = alloca [200 x i32]* 
  %root_count..tmp = alloca i32 
  %i = alloca i32 
  %marked_count = alloca i32 
  %root_object = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store [500 x i32]* %object_refs.tmp, ptr %object_refs..tmp
  store [50 x i32]* %root_set.tmp, ptr %root_set..tmp
  store [200 x i32]* %gc_marks.tmp, ptr %gc_marks..tmp
  store i32 %root_count.tmp, ptr %root_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 200
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.15 = getelementptr [200 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %marked_count
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %root_count..tmp
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [50 x i32]*, ptr %root_set..tmp
  %rcc.tmp.32 = getelementptr [50 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %root_object
  %rcc.tmp.35 = load i32, ptr %marked_count
  %rcc.tmp.36 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.37 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.39 = load i32, ptr %root_object
  %rcc.tmp.40 = call i32 @markObject.([1000 x i32]* %rcc.tmp.36, [500 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, i32 %rcc.tmp.39, i32 0)
  %rcc.tmp.41 = add i32 %rcc.tmp.35, %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %marked_count
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.47 = load i32, ptr %marked_count
  ret i32 %rcc.tmp.47
}
define i32 @markObject.([1000 x i32]* %object_pool.tmp, [500 x i32]* %object_refs.tmp, [200 x i32]* %gc_marks.tmp, i32 %object_addr.tmp, i32 %depth.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_refs..tmp = alloca [500 x i32]* 
  %gc_marks..tmp = alloca [200 x i32]* 
  %object_addr..tmp = alloca i32 
  %depth..tmp = alloca i32 
  %object_index = alloca i32 
  %marked_count = alloca i32 
  %ref1 = alloca i32 
  %ref2 = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store [500 x i32]* %object_refs.tmp, ptr %object_refs..tmp
  store [200 x i32]* %gc_marks.tmp, ptr %gc_marks..tmp
  store i32 %object_addr.tmp, ptr %object_addr..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  %rcc.tmp.6 = load i32, ptr %depth..tmp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 10
  br i1 %rcc.tmp.7, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.9 = load i32, ptr %object_addr..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.14 = load i32, ptr %object_addr..tmp
  %rcc.tmp.15 = icmp sge i32 %rcc.tmp.14, 1000
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.17 = phi i1 [1, %sc.merge], [%rcc.tmp.15, %or.rhs.2]
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.21 = load i32, ptr %object_addr..tmp
  %rcc.tmp.22 = sdiv i32 %rcc.tmp.21, 20
  store i32 %rcc.tmp.22, ptr %object_index
  %rcc.tmp.24 = load i32, ptr %object_index
  %rcc.tmp.25 = icmp sge i32 %rcc.tmp.24, 200
  br i1 %rcc.tmp.25, label %sc.merge.3, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.27 = load i32, ptr %object_index
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 1
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.34 = phi i1 [1, %if.merge], [%rcc.tmp.32, %or.rhs.3]
  br i1 %rcc.tmp.34, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.38 = load i32, ptr %object_index
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.41 = getelementptr [200 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  store i32 1, ptr %rcc.tmp.41
  store i32 1, ptr %marked_count
  %rcc.tmp.44 = load i32, ptr %object_addr..tmp
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 5
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 1000
  br i1 %rcc.tmp.46, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.48 = load i32, ptr %object_addr..tmp
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 3
  %rcc.tmp.51 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.52 = getelementptr [1000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %ref1
  %rcc.tmp.55 = load i32, ptr %object_addr..tmp
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 4
  %rcc.tmp.58 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.59 = getelementptr [1000 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %ref2
  %rcc.tmp.62 = load i32, ptr %ref1
  %rcc.tmp.63 = icmp sgt i32 %rcc.tmp.62, 0
  br i1 %rcc.tmp.63, label %and.rhs, label %sc.merge.4
and.rhs:
  %rcc.tmp.65 = load i32, ptr %ref1
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.65, 1000
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.68 = phi i1 [0, %if.then.3], [%rcc.tmp.66, %and.rhs]
  br i1 %rcc.tmp.68, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.70 = load i32, ptr %marked_count
  %rcc.tmp.71 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.72 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.73 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.74 = load i32, ptr %ref1
  %rcc.tmp.75 = load i32, ptr %depth..tmp
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  %rcc.tmp.77 = call i32 @markObject.([1000 x i32]* %rcc.tmp.71, [500 x i32]* %rcc.tmp.72, [200 x i32]* %rcc.tmp.73, i32 %rcc.tmp.74, i32 %rcc.tmp.76)
  %rcc.tmp.78 = add i32 %rcc.tmp.70, %rcc.tmp.77
  store i32 %rcc.tmp.78, ptr %marked_count
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.82 = load i32, ptr %ref2
  %rcc.tmp.83 = icmp sgt i32 %rcc.tmp.82, 0
  br i1 %rcc.tmp.83, label %and.rhs.2, label %sc.merge.5
and.rhs.2:
  %rcc.tmp.85 = load i32, ptr %ref2
  %rcc.tmp.86 = icmp slt i32 %rcc.tmp.85, 1000
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.88 = phi i1 [0, %if.merge.4], [%rcc.tmp.86, %and.rhs.2]
  br i1 %rcc.tmp.88, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.90 = load i32, ptr %marked_count
  %rcc.tmp.91 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.92 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.93 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.94 = load i32, ptr %ref2
  %rcc.tmp.95 = load i32, ptr %depth..tmp
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  %rcc.tmp.97 = call i32 @markObject.([1000 x i32]* %rcc.tmp.91, [500 x i32]* %rcc.tmp.92, [200 x i32]* %rcc.tmp.93, i32 %rcc.tmp.94, i32 %rcc.tmp.96)
  %rcc.tmp.98 = add i32 %rcc.tmp.90, %rcc.tmp.97
  store i32 %rcc.tmp.98, ptr %marked_count
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.104 = load i32, ptr %marked_count
  ret i32 %rcc.tmp.104
}
define i32 @performSweepPhase.([1000 x i32]* %object_pool.tmp, [200 x i32]* %gc_marks.tmp, i32 %object_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %gc_marks..tmp = alloca [200 x i32]* 
  %object_count..tmp = alloca i32 
  %collected_count = alloca i32 
  %i = alloca i32 
  %object_start = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store [200 x i32]* %gc_marks.tmp, ptr %gc_marks..tmp
  store i32 %object_count.tmp, ptr %object_count..tmp
  store i32 0, ptr %collected_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %object_count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [200 x i32]*, ptr %gc_marks..tmp
  %rcc.tmp.15 = getelementptr [200 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = mul i32 %rcc.tmp.19, 20
  store i32 %rcc.tmp.20, ptr %object_start
  %rcc.tmp.22 = load i32, ptr %object_start
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 10
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.23, 1000
  br i1 %rcc.tmp.24, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 20
  br i1 %rcc.tmp.29, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.32 = load i32, ptr %object_start
  %rcc.tmp.33 = load i32, ptr %j
  %rcc.tmp.34 = add i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.37 = getelementptr [1000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.43 = load i32, ptr %collected_count
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %collected_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.54 = load i32, ptr %collected_count
  ret i32 %rcc.tmp.54
}
define i32 @performCompactionPhase.([1000 x i32]* %object_pool.tmp, [500 x i32]* %object_refs.tmp, i32 %object_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_refs..tmp = alloca [500 x i32]* 
  %object_count..tmp = alloca i32 
  %compacted_objects = alloca i32 
  %write_pos = alloca i32 
  %i = alloca i32 
  %read_pos = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store [500 x i32]* %object_refs.tmp, ptr %object_refs..tmp
  store i32 %object_count.tmp, ptr %object_count..tmp
  store i32 0, ptr %compacted_objects
  store i32 0, ptr %write_pos
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %object_count..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 20
  store i32 %rcc.tmp.14, ptr %read_pos
  %rcc.tmp.16 = load i32, ptr %read_pos
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 1000
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.19 = load i32, ptr %read_pos
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.22 = getelementptr [1000 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.23, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [0, %while.body], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %read_pos
  %rcc.tmp.29 = load i32, ptr %write_pos
  %rcc.tmp.30 = icmp ne i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.34, 20
  br i1 %rcc.tmp.35, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.37 = load i32, ptr %write_pos
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 1000
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.42 = phi i1 [0, %while.cond.2], [%rcc.tmp.40, %and.rhs.2]
  br i1 %rcc.tmp.42, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.44 = load i32, ptr %read_pos
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = add i32 %rcc.tmp.44, %rcc.tmp.45
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.46, 1000
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.49 = phi i1 [0, %sc.merge.2], [%rcc.tmp.47, %and.rhs.3]
  br i1 %rcc.tmp.49, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.52 = load i32, ptr %write_pos
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.57 = getelementptr [1000 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %read_pos
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = add i32 %rcc.tmp.58, %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.63 = getelementptr [1000 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %rcc.tmp.57
  %rcc.tmp.66 = load i32, ptr %read_pos
  %rcc.tmp.67 = load i32, ptr %j
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.71 = getelementptr [1000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.77 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.78 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.79 = load i32, ptr %read_pos
  %rcc.tmp.80 = load i32, ptr %write_pos
  call void @updateReferencesAfterCompaction.([1000 x i32]* %rcc.tmp.77, [500 x i32]* %rcc.tmp.78, i32 %rcc.tmp.79, i32 %rcc.tmp.80, i32 500)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.84 = load i32, ptr %write_pos
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 20
  store i32 %rcc.tmp.85, ptr %write_pos
  %rcc.tmp.87 = load i32, ptr %compacted_objects
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %compacted_objects
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.96 = load i32, ptr %compacted_objects
  ret i32 %rcc.tmp.96
}
define void @updateReferencesAfterCompaction.([1000 x i32]* %object_pool.tmp, [500 x i32]* %object_refs.tmp, i32 %old_addr.tmp, i32 %new_addr.tmp, i32 %ref_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_refs..tmp = alloca [500 x i32]* 
  %old_addr..tmp = alloca i32 
  %new_addr..tmp = alloca i32 
  %ref_count..tmp = alloca i32 
  %i = alloca i32 
  %ref_location = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store [500 x i32]* %object_refs.tmp, ptr %object_refs..tmp
  store i32 %old_addr.tmp, ptr %old_addr..tmp
  store i32 %new_addr.tmp, ptr %new_addr..tmp
  store i32 %ref_count.tmp, ptr %ref_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %ref_count..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.16 = getelementptr [500 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp sgt i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.23 = getelementptr [500 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.27 = phi i1 [0, %while.body], [%rcc.tmp.25, %and.rhs]
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [500 x i32]*, ptr %object_refs..tmp
  %rcc.tmp.32 = getelementptr [500 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %ref_location
  %rcc.tmp.35 = load i32, ptr %ref_location
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.38 = getelementptr [1000 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %old_addr..tmp
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.43 = load i32, ptr %ref_location
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.46 = getelementptr [1000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %new_addr..tmp
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @simulateReferenceCounting.([1000 x i32]* %object_pool.tmp, i32 %object_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_count..tmp = alloca i32 
  %collected_by_refcount = alloca i32 
  %i = alloca i32 
  %object_start = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store i32 %object_count.tmp, ptr %object_count..tmp
  store i32 0, ptr %collected_by_refcount
  %rcc.tmp.4 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.5 = load i32, ptr %object_count..tmp
  call void @calculateReferenceCounts.([1000 x i32]* %rcc.tmp.4, i32 %rcc.tmp.5)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %object_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 20
  store i32 %rcc.tmp.15, ptr %object_start
  %rcc.tmp.17 = load i32, ptr %object_start
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 5
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 1000
  br i1 %rcc.tmp.19, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.21 = load i32, ptr %object_start
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.24 = getelementptr [1000 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp ne i32 %rcc.tmp.25, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.28 = phi i1 [0, %while.body], [%rcc.tmp.26, %and.rhs]
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %object_start
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 2
  %rcc.tmp.33 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.34 = getelementptr [1000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load i32, ptr %object_start
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 2
  %rcc.tmp.41 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.42 = getelementptr [1000 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %object_start
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 2
  %rcc.tmp.46 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.47 = getelementptr [1000 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = sub i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %rcc.tmp.42
  %rcc.tmp.51 = load i32, ptr %object_start
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 2
  %rcc.tmp.54 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.55 = getelementptr [1000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp eq i32 %rcc.tmp.56, 0
  br i1 %rcc.tmp.57, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.59 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.60 = load i32, ptr %object_start
  call void @decrementReferencedObjects.([1000 x i32]* %rcc.tmp.59, i32 %rcc.tmp.60)
  %rcc.tmp.62 = load i32, ptr %collected_by_refcount
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %collected_by_refcount
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
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 2
  store i32 %rcc.tmp.72, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.75 = load i32, ptr %collected_by_refcount
  ret i32 %rcc.tmp.75
}
define void @calculateReferenceCounts.([1000 x i32]* %object_pool.tmp, i32 %object_count.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_count..tmp = alloca i32 
  %i = alloca i32 
  %object_start = alloca i32 
  %object_start.2 = alloca i32 
  %ref1 = alloca i32 
  %ref2 = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store i32 %object_count.tmp, ptr %object_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %object_count..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 20
  store i32 %rcc.tmp.11, ptr %object_start
  %rcc.tmp.13 = load i32, ptr %object_start
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 1000
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %object_start
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 2
  %rcc.tmp.20 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.21 = getelementptr [1000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.21
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = load i32, ptr %object_count..tmp
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = mul i32 %rcc.tmp.36, 20
  store i32 %rcc.tmp.37, ptr %object_start.2
  %rcc.tmp.39 = load i32, ptr %object_start.2
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 5
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.40, 1000
  br i1 %rcc.tmp.41, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.43 = load i32, ptr %object_start.2
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.46 = getelementptr [1000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp ne i32 %rcc.tmp.47, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.50 = phi i1 [0, %while.body.2], [%rcc.tmp.48, %and.rhs]
  br i1 %rcc.tmp.50, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.52 = load i32, ptr %object_start.2
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 3
  %rcc.tmp.55 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.56 = getelementptr [1000 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %ref1
  %rcc.tmp.59 = load i32, ptr %object_start.2
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 4
  %rcc.tmp.62 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.63 = getelementptr [1000 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %ref2
  %rcc.tmp.66 = load i32, ptr %ref1
  %rcc.tmp.67 = icmp sgt i32 %rcc.tmp.66, 0
  br i1 %rcc.tmp.67, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.69 = load i32, ptr %ref1
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.69, 1000
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.72 = phi i1 [0, %if.then.2], [%rcc.tmp.70, %and.rhs.2]
  br i1 %rcc.tmp.72, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.74 = load i32, ptr %ref1
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 2
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.75, 1000
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.78 = phi i1 [0, %sc.merge.2], [%rcc.tmp.76, %and.rhs.3]
  br i1 %rcc.tmp.78, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.80 = load i32, ptr %ref1
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 2
  %rcc.tmp.83 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.84 = getelementptr [1000 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %ref1
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 2
  %rcc.tmp.88 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.89 = getelementptr [1000 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %rcc.tmp.84
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.95 = load i32, ptr %ref2
  %rcc.tmp.96 = icmp sgt i32 %rcc.tmp.95, 0
  br i1 %rcc.tmp.96, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.98 = load i32, ptr %ref2
  %rcc.tmp.99 = icmp slt i32 %rcc.tmp.98, 1000
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.101 = phi i1 [0, %if.merge.3], [%rcc.tmp.99, %and.rhs.4]
  br i1 %rcc.tmp.101, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.103 = load i32, ptr %ref2
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 2
  %rcc.tmp.105 = icmp slt i32 %rcc.tmp.104, 1000
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.107 = phi i1 [0, %sc.merge.4], [%rcc.tmp.105, %and.rhs.5]
  br i1 %rcc.tmp.107, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.109 = load i32, ptr %ref2
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 2
  %rcc.tmp.112 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.113 = getelementptr [1000 x i32], ptr %rcc.tmp.112, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.114 = load i32, ptr %ref2
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 2
  %rcc.tmp.117 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.118 = getelementptr [1000 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 1
  store i32 %rcc.tmp.120, ptr %rcc.tmp.113
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define void @decrementReferencedObjects.([1000 x i32]* %object_pool.tmp, i32 %object_start.tmp) {
entry:
  %object_pool..tmp = alloca [1000 x i32]* 
  %object_start..tmp = alloca i32 
  %ref1 = alloca i32 
  %ref2 = alloca i32 
  store [1000 x i32]* %object_pool.tmp, ptr %object_pool..tmp
  store i32 %object_start.tmp, ptr %object_start..tmp
  %rcc.tmp.3 = load i32, ptr %object_start..tmp
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 5
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %object_start..tmp
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 3
  %rcc.tmp.10 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.11 = getelementptr [1000 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %ref1
  %rcc.tmp.14 = load i32, ptr %object_start..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 4
  %rcc.tmp.17 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %ref2
  %rcc.tmp.21 = load i32, ptr %ref1
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.21, 0
  br i1 %rcc.tmp.22, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.24 = load i32, ptr %ref1
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 2
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.28 = phi i1 [0, %if.then], [%rcc.tmp.26, %and.rhs]
  br i1 %rcc.tmp.28, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.30 = load i32, ptr %ref1
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 2
  %rcc.tmp.33 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.34 = getelementptr [1000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.35, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.38 = phi i1 [0, %sc.merge], [%rcc.tmp.36, %and.rhs.2]
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %ref1
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 2
  %rcc.tmp.43 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.44 = getelementptr [1000 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %ref1
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 2
  %rcc.tmp.48 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.49 = getelementptr [1000 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = sub i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %rcc.tmp.44
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.55 = load i32, ptr %ref2
  %rcc.tmp.56 = icmp sgt i32 %rcc.tmp.55, 0
  br i1 %rcc.tmp.56, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.58 = load i32, ptr %ref2
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 2
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 1000
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.62 = phi i1 [0, %if.merge.2], [%rcc.tmp.60, %and.rhs.3]
  br i1 %rcc.tmp.62, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.64 = load i32, ptr %ref2
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 2
  %rcc.tmp.67 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.68 = getelementptr [1000 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = icmp sgt i32 %rcc.tmp.69, 0
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.72 = phi i1 [0, %sc.merge.3], [%rcc.tmp.70, %and.rhs.4]
  br i1 %rcc.tmp.72, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.74 = load i32, ptr %ref2
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 2
  %rcc.tmp.77 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.78 = getelementptr [1000 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %ref2
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 2
  %rcc.tmp.82 = load [1000 x i32]*, ptr %object_pool..tmp
  %rcc.tmp.83 = getelementptr [1000 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = sub i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %rcc.tmp.78
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @performFragmentationTest.() {
entry:
  %fragmented_memory = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %free_list = alloca [200 x i32] 
  %fill.idx.2 = alloca i32 
  %allocated_list = alloca [200 x i32] 
  %fill.idx.3 = alloca i32 
  %free_count = alloca i32 
  %allocated_count = alloca i32 
  %fragmentation_score = alloca i32 
  %successful_allocs = alloca i32 
  %compaction_result = alloca i32 
  %post_compaction_score = alloca i32 
  call void @printlnInt.(i32 1830)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %fragmented_memory, i32 0, i32 %rcc.tmp.7
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
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %free_list, i32 0, i32 %rcc.tmp.18
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
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %allocated_list, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %free_count
  store i32 0, ptr %allocated_count
  call void @printlnInt.(i32 1831)
  call void @createFragmentationPattern.([1000 x i32]* %fragmented_memory, [200 x i32]* %free_list, [200 x i32]* %allocated_list, i32* %free_count, i32* %allocated_count)
  call void @printlnInt.(i32 1832)
  %rcc.tmp.40 = call i32 @measureFragmentation.([1000 x i32]* %fragmented_memory, i32 1000)
  store i32 %rcc.tmp.40, ptr %fragmentation_score
  %rcc.tmp.42 = load i32, ptr %fragmentation_score
  call void @printlnInt.(i32 %rcc.tmp.42)
  call void @printlnInt.(i32 1833)
  %rcc.tmp.45 = call i32 @attemptFragmentedAllocations.([1000 x i32]* %fragmented_memory, i32 1000)
  store i32 %rcc.tmp.45, ptr %successful_allocs
  %rcc.tmp.47 = load i32, ptr %successful_allocs
  call void @printlnInt.(i32 %rcc.tmp.47)
  call void @printlnInt.(i32 1834)
  %rcc.tmp.50 = call i32 @performMemoryCompaction.([1000 x i32]* %fragmented_memory, i32 1000)
  store i32 %rcc.tmp.50, ptr %compaction_result
  %rcc.tmp.52 = load i32, ptr %compaction_result
  call void @printlnInt.(i32 %rcc.tmp.52)
  call void @printlnInt.(i32 1835)
  %rcc.tmp.55 = call i32 @measureFragmentation.([1000 x i32]* %fragmented_memory, i32 1000)
  store i32 %rcc.tmp.55, ptr %post_compaction_score
  %rcc.tmp.57 = load i32, ptr %post_compaction_score
  call void @printlnInt.(i32 %rcc.tmp.57)
  ret void
}
define void @createFragmentationPattern.([1000 x i32]* %memory.tmp, [200 x i32]* %free_list.tmp, [200 x i32]* %allocated_list.tmp, i32* %free_count.tmp, i32* %allocated_count.tmp) {
entry:
  %memory..tmp = alloca [1000 x i32]* 
  %free_list..tmp = alloca [200 x i32]* 
  %allocated_list..tmp = alloca [200 x i32]* 
  %free_count..tmp = alloca i32* 
  %allocated_count..tmp = alloca i32* 
  %pos = alloca i32 
  %pattern = alloca i32 
  %block_size = alloca i32 
  %i = alloca i32 
  %i.2 = alloca i32 
  %dealloc_pos = alloca i32 
  %dealloc_size = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %memory.tmp, ptr %memory..tmp
  store [200 x i32]* %free_list.tmp, ptr %free_list..tmp
  store [200 x i32]* %allocated_list.tmp, ptr %allocated_list..tmp
  store i32* %free_count.tmp, ptr %free_count..tmp
  store i32* %allocated_count.tmp, ptr %allocated_count..tmp
  store i32 0, ptr %pos
  store i32 0, ptr %pattern
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %pos
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 950
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %pattern
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 4
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  %rcc.tmp.16 = mul i32 %rcc.tmp.15, 8
  store i32 %rcc.tmp.16, ptr %block_size
  %rcc.tmp.18 = load i32, ptr %pattern
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 3
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 0
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %block_size
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %pos
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.30, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.33 = phi i1 [0, %while.cond.2], [%rcc.tmp.31, %and.rhs]
  br i1 %rcc.tmp.33, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.36 = load i32, ptr %pos
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.41 = getelementptr [1000 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  store i32 1, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.47 = load i32*, ptr %allocated_count..tmp
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 200
  br i1 %rcc.tmp.49, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.51 = load i32*, ptr %allocated_count..tmp
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [200 x i32]*, ptr %allocated_list..tmp
  %rcc.tmp.55 = getelementptr [200 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %pos
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  %rcc.tmp.58 = load i32*, ptr %allocated_count..tmp
  %rcc.tmp.59 = load i32*, ptr %allocated_count..tmp
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %rcc.tmp.58
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.66 = load i32*, ptr %free_count..tmp
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.67, 200
  br i1 %rcc.tmp.68, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.70 = load i32*, ptr %free_count..tmp
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [200 x i32]*, ptr %free_list..tmp
  %rcc.tmp.74 = getelementptr [200 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %pos
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = load i32*, ptr %free_count..tmp
  %rcc.tmp.78 = load i32*, ptr %free_count..tmp
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %rcc.tmp.77
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.85 = load i32, ptr %pos
  %rcc.tmp.86 = load i32, ptr %block_size
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %pos
  %rcc.tmp.89 = load i32, ptr %pattern
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %pattern
  br label %while.cond
while.end:
  store i32 0, ptr %i.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.95 = load i32, ptr %i.2
  %rcc.tmp.96 = load i32*, ptr %allocated_count..tmp
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  %rcc.tmp.98 = icmp slt i32 %rcc.tmp.95, %rcc.tmp.97
  br i1 %rcc.tmp.98, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.101 = load i32, ptr %i.2
  %rcc.tmp.102 = srem i32 %rcc.tmp.101, 3
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.102, 0
  br i1 %rcc.tmp.103, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.105 = load i32, ptr %i.2
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = load [200 x i32]*, ptr %allocated_list..tmp
  %rcc.tmp.108 = getelementptr [200 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  store i32 %rcc.tmp.109, ptr %dealloc_pos
  store i32 16, ptr %dealloc_size
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.114 = load i32, ptr %j
  %rcc.tmp.115 = load i32, ptr %dealloc_size
  %rcc.tmp.116 = icmp slt i32 %rcc.tmp.114, %rcc.tmp.115
  br i1 %rcc.tmp.116, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.118 = load i32, ptr %dealloc_pos
  %rcc.tmp.119 = load i32, ptr %j
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = icmp slt i32 %rcc.tmp.120, 1000
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.123 = phi i1 [0, %while.cond.4], [%rcc.tmp.121, %and.rhs.2]
  br i1 %rcc.tmp.123, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.126 = load i32, ptr %dealloc_pos
  %rcc.tmp.127 = load i32, ptr %j
  %rcc.tmp.128 = add i32 %rcc.tmp.126, %rcc.tmp.127
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.131 = getelementptr [1000 x i32], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.129
  store i32 0, ptr %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %j
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 1
  store i32 %rcc.tmp.134, ptr %j
  br label %while.cond.4
while.end.4:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.139 = load i32, ptr %i.2
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  store i32 %rcc.tmp.140, ptr %i.2
  br label %while.cond.3
while.end.3:
  ret void
}
define i32 @measureFragmentation.([1000 x i32]* %memory.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %free_holes = alloca i32 
  %largest_hole = alloca i32 
  %current_hole_size = alloca i32 
  %total_free = alloca i32 
  %in_hole = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %free_holes
  store i32 0, ptr %largest_hole
  store i32 0, ptr %current_hole_size
  store i32 0, ptr %total_free
  store i32 0, ptr %in_hole
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %size..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 0
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  %rcc.tmp.22 = load i32, ptr %in_hole
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 0
  br i1 %rcc.tmp.23, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.25 = load i32, ptr %free_holes
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %free_holes
  store i32 1, ptr %in_hole
  store i32 1, ptr %current_hole_size
  br label %if.merge.2
if.else.2:
  %rcc.tmp.31 = load i32, ptr %current_hole_size
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %current_hole_size
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.35 = load i32, ptr %total_free
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %total_free
  %rcc.tmp.38 = load i32, ptr %current_hole_size
  %rcc.tmp.39 = load i32, ptr %largest_hole
  %rcc.tmp.40 = icmp sgt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.42 = load i32, ptr %current_hole_size
  store i32 %rcc.tmp.42, ptr %largest_hole
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.else:
  store i32 0, ptr %in_hole
  store i32 0, ptr %current_hole_size
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.54 = load i32, ptr %free_holes
  %rcc.tmp.55 = icmp sgt i32 %rcc.tmp.54, 0
  br i1 %rcc.tmp.55, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.57 = load i32, ptr %total_free
  %rcc.tmp.58 = icmp sgt i32 %rcc.tmp.57, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %while.end], [%rcc.tmp.58, %and.rhs]
  br i1 %rcc.tmp.60, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.62 = load i32, ptr %free_holes
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 100
  %rcc.tmp.64 = load i32, ptr %largest_hole
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  %rcc.tmp.66 = sdiv i32 %rcc.tmp.63, %rcc.tmp.65
  ret i32 %rcc.tmp.66
if.else.4:
  ret i32 0
if.merge.4:
  ret i32 undef
}
define i32 @attemptFragmentedAllocations.([1000 x i32]* %memory.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %successful_allocations = alloca i32 
  %attempt_sizes = alloca [10 x i32] 
  %attempt = alloca i32 
  %requested_size = alloca i32 
  %allocated_pos = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %successful_allocations
  %rcc.tmp.4 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 0
  store i32 8, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 1
  store i32 16, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 2
  store i32 12, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 3
  store i32 20, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 4
  store i32 24, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 5
  store i32 32, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 6
  store i32 6, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 7
  store i32 10, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 8
  store i32 14, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 9
  store i32 18, ptr %rcc.tmp.22
  store i32 0, ptr %attempt
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %attempt
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 10
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %attempt
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %attempt_sizes, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %requested_size
  %rcc.tmp.35 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = load i32, ptr %requested_size
  %rcc.tmp.38 = call i32 @findFreeSpace.([1000 x i32]* %rcc.tmp.35, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %allocated_pos
  %rcc.tmp.40 = load i32, ptr %allocated_pos
  %rcc.tmp.41 = sub i32 0, 1
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %requested_size
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.50 = load i32, ptr %allocated_pos
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.52, %rcc.tmp.53
  br label %sc.merge
sc.merge:
  %rcc.tmp.56 = phi i1 [0, %while.cond.2], [%rcc.tmp.54, %and.rhs]
  br i1 %rcc.tmp.56, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.59 = load i32, ptr %allocated_pos
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.64 = getelementptr [1000 x i32], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.62
  store i32 1, ptr %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.70 = load i32, ptr %successful_allocations
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %successful_allocations
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.75 = load i32, ptr %attempt
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %attempt
  br label %while.cond
while.end:
  %rcc.tmp.79 = load i32, ptr %successful_allocations
  ret i32 %rcc.tmp.79
}
define i32 @findFreeSpace.([1000 x i32]* %memory.tmp, i32 %pool_size.tmp, i32 %requested_size.tmp) {
entry:
  %memory..tmp = alloca [1000 x i32]* 
  %pool_size..tmp = alloca i32 
  %requested_size..tmp = alloca i32 
  %i = alloca i32 
  %found_space = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  store i32 %requested_size.tmp, ptr %requested_size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %pool_size..tmp
  %rcc.tmp.8 = load i32, ptr %requested_size..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp sle i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %found_space
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = load i32, ptr %requested_size..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.26 = getelementptr [1000 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp ne i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  store i32 0, ptr %found_space
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.33 = load i32, ptr %j
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.37 = load i32, ptr %found_space
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.37, 1
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %i
  ret i32 %rcc.tmp.40
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.47 = sub i32 0, 1
  ret i32 %rcc.tmp.47
}
define i32 @performMemoryCompaction.([1000 x i32]* %memory.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %write_pos = alloca i32 
  %compacted_blocks = alloca i32 
  %read_pos = alloca i32 
  %block_size = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %write_pos
  store i32 0, ptr %compacted_blocks
  store i32 0, ptr %read_pos
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %read_pos
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %read_pos
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.15 = getelementptr [1000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 1
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  store i32 0, ptr %block_size
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.21 = load i32, ptr %read_pos
  %rcc.tmp.22 = load i32, ptr %block_size
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.27 = load i32, ptr %read_pos
  %rcc.tmp.28 = load i32, ptr %block_size
  %rcc.tmp.29 = add i32 %rcc.tmp.27, %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.32 = getelementptr [1000 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 1
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.cond.2], [%rcc.tmp.34, %and.rhs]
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load i32, ptr %block_size
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %block_size
  br label %while.cond.2
while.end.2:
  %rcc.tmp.43 = load i32, ptr %read_pos
  %rcc.tmp.44 = load i32, ptr %write_pos
  %rcc.tmp.45 = icmp ne i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = load i32, ptr %block_size
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.49, %rcc.tmp.50
  br i1 %rcc.tmp.51, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.54 = load i32, ptr %write_pos
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.59 = getelementptr [1000 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  store i32 1, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %read_pos
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.61, %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.66 = getelementptr [1000 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  store i32 0, ptr %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %i
  br label %while.cond.3
while.end.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.74 = load i32, ptr %write_pos
  %rcc.tmp.75 = load i32, ptr %block_size
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %write_pos
  %rcc.tmp.78 = load i32, ptr %read_pos
  %rcc.tmp.79 = load i32, ptr %block_size
  %rcc.tmp.80 = add i32 %rcc.tmp.78, %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %read_pos
  %rcc.tmp.82 = load i32, ptr %compacted_blocks
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %compacted_blocks
  br label %if.merge
if.else:
  %rcc.tmp.86 = load i32, ptr %read_pos
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %read_pos
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.92 = load i32, ptr %write_pos
  %rcc.tmp.93 = load i32, ptr %size..tmp
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.97 = load i32, ptr %write_pos
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = load [1000 x i32]*, ptr %memory..tmp
  %rcc.tmp.100 = getelementptr [1000 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  store i32 0, ptr %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %write_pos
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %write_pos
  br label %while.cond.4
while.end.4:
  %rcc.tmp.106 = load i32, ptr %compacted_blocks
  ret i32 %rcc.tmp.106
}
define void @testMemoryEdgeCases.() {
entry:
  call void @printlnInt.(i32 1840)
  call void @testZeroSizeAllocations.()
  call void @testMaxSizeAllocations.()
  call void @testAllocationFailures.()
  call void @testDoubleFreeDetection.()
  call void @testMemoryCorruption.()
  call void @printlnInt.(i32 1849)
  ret void
}
define void @testZeroSizeAllocations.() {
entry:
  %test_memory = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %zero_alloc = alloca i32 
  %negative_alloc = alloca i32 
  call void @printlnInt.(i32 1841)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeMemoryPool100.([100 x i32]* %test_memory)
  %rcc.tmp.14 = call i32 @allocateBlock100.([100 x i32]* %test_memory, i32 0, i32 0)
  store i32 %rcc.tmp.14, ptr %zero_alloc
  %rcc.tmp.16 = load i32, ptr %zero_alloc
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = sub i32 0, 5
  %rcc.tmp.19 = call i32 @allocateBlock100.([100 x i32]* %test_memory, i32 0, i32 %rcc.tmp.18)
  store i32 %rcc.tmp.19, ptr %negative_alloc
  %rcc.tmp.21 = load i32, ptr %negative_alloc
  call void @printlnInt.(i32 %rcc.tmp.21)
  ret void
}
define void @testMaxSizeAllocations.() {
entry:
  %test_memory = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %huge_alloc = alloca i32 
  %limit_alloc = alloca i32 
  call void @printlnInt.(i32 1842)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeMemoryPool100.([100 x i32]* %test_memory)
  %rcc.tmp.14 = call i32 @allocateBlock100.([100 x i32]* %test_memory, i32 0, i32 200)
  store i32 %rcc.tmp.14, ptr %huge_alloc
  %rcc.tmp.16 = load i32, ptr %huge_alloc
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @allocateBlock100.([100 x i32]* %test_memory, i32 0, i32 96)
  store i32 %rcc.tmp.18, ptr %limit_alloc
  %rcc.tmp.20 = load i32, ptr %limit_alloc
  call void @printlnInt.(i32 %rcc.tmp.20)
  ret void
}
define void @testAllocationFailures.() {
entry:
  %test_memory = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %allocations = alloca [10 x i32] 
  %alloc_count = alloca i32 
  %size = alloca i32 
  %alloc_result = alloca i32 
  %final_alloc = alloca i32 
  call void @printlnInt.(i32 1843)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 50
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [50 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeMemoryPool50.([50 x i32]* %test_memory)
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.32
  store i32 0, ptr %alloc_count
  store i32 8, ptr %size
  br label %while.cond
while.cond:
  %rcc.tmp.37 = load i32, ptr %alloc_count
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 10
  br i1 %rcc.tmp.38, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.41 = load i32, ptr %size
  %rcc.tmp.42 = call i32 @allocateBlock50.([50 x i32]* %test_memory, i32 0, i32 %rcc.tmp.41)
  store i32 %rcc.tmp.42, ptr %alloc_result
  %rcc.tmp.44 = load i32, ptr %alloc_result
  %rcc.tmp.45 = sub i32 0, 1
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then, label %if.else
if.then:
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %alloc_count
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [10 x i32], ptr %allocations, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %alloc_result
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %alloc_count
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %alloc_count
  %rcc.tmp.58 = load i32, ptr %size
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 2
  store i32 %rcc.tmp.59, ptr %size
  br label %while.cond
while.end:
  %rcc.tmp.62 = load i32, ptr %alloc_count
  call void @printlnInt.(i32 %rcc.tmp.62)
  %rcc.tmp.64 = call i32 @allocateBlock50.([50 x i32]* %test_memory, i32 0, i32 4)
  store i32 %rcc.tmp.64, ptr %final_alloc
  %rcc.tmp.66 = load i32, ptr %final_alloc
  call void @printlnInt.(i32 %rcc.tmp.66)
  ret void
}
define void @testDoubleFreeDetection.() {
entry:
  %test_memory = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %allocated_block = alloca i32 
  %status_after_first_free = alloca i32 
  %status_after_double_free = alloca i32 
  call void @printlnInt.(i32 1844)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeMemoryPool100.([100 x i32]* %test_memory)
  %rcc.tmp.14 = call i32 @allocateBlock100.([100 x i32]* %test_memory, i32 0, i32 16)
  store i32 %rcc.tmp.14, ptr %allocated_block
  %rcc.tmp.16 = load i32, ptr %allocated_block
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = load i32, ptr %allocated_block
  call void @deallocateBlock100.([100 x i32]* %test_memory, i32 %rcc.tmp.18)
  %rcc.tmp.20 = load i32, ptr %allocated_block
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = getelementptr [100 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %status_after_first_free
  %rcc.tmp.26 = load i32, ptr %status_after_first_free
  call void @printlnInt.(i32 %rcc.tmp.26)
  %rcc.tmp.28 = load i32, ptr %allocated_block
  call void @deallocateBlock100.([100 x i32]* %test_memory, i32 %rcc.tmp.28)
  %rcc.tmp.30 = load i32, ptr %allocated_block
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  %rcc.tmp.33 = getelementptr [100 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %status_after_double_free
  %rcc.tmp.36 = load i32, ptr %status_after_double_free
  call void @printlnInt.(i32 %rcc.tmp.36)
  ret void
}
define void @testMemoryCorruption.() {
entry:
  %test_memory = alloca [200 x i32] 
  %fill.idx = alloca i32 
  %block1 = alloca i32 
  %block2 = alloca i32 
  %block3 = alloca i32 
  %corruption_detected = alloca i32 
  %validation_result = alloca i32 
  call void @printlnInt.(i32 1845)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 200
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [200 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeMemoryPool200.([200 x i32]* %test_memory)
  %rcc.tmp.14 = call i32 @allocateBlock200.([200 x i32]* %test_memory, i32 0, i32 20)
  store i32 %rcc.tmp.14, ptr %block1
  %rcc.tmp.16 = call i32 @allocateBlock200.([200 x i32]* %test_memory, i32 0, i32 24)
  store i32 %rcc.tmp.16, ptr %block2
  %rcc.tmp.18 = call i32 @allocateBlock200.([200 x i32]* %test_memory, i32 0, i32 16)
  store i32 %rcc.tmp.18, ptr %block3
  %rcc.tmp.20 = load i32, ptr %block1
  %rcc.tmp.21 = icmp sge i32 %rcc.tmp.20, 0
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %block1
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 30
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.27 = phi i1 [0, %array.fill.end], [%rcc.tmp.25, %and.rhs]
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %block1
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 25
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %test_memory, i32 0, i32 %rcc.tmp.31
  store i32 99999, ptr %rcc.tmp.32
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = call i32 @detectMemoryCorruption.([200 x i32]* %test_memory, i32 200)
  store i32 %rcc.tmp.36, ptr %corruption_detected
  %rcc.tmp.38 = load i32, ptr %corruption_detected
  call void @printlnInt.(i32 %rcc.tmp.38)
  %rcc.tmp.40 = call i32 @validateMemoryIntegrity.([200 x i32]* %test_memory, i32 200)
  store i32 %rcc.tmp.40, ptr %validation_result
  %rcc.tmp.42 = load i32, ptr %validation_result
  call void @printlnInt.(i32 %rcc.tmp.42)
  ret void
}
define void @initializeMemoryPool100.([100 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [100 x i32]* 
  %i = alloca i32 
  store [100 x i32]* %memory.tmp, ptr %memory..tmp
  %rcc.tmp.2 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.3 = getelementptr [100 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  store i32 96, ptr %rcc.tmp.3
  %rcc.tmp.5 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.6 = getelementptr [100 x i32], ptr %rcc.tmp.5, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.9 = getelementptr [100 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.10 = sub i32 0, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.13 = getelementptr [100 x i32], ptr %rcc.tmp.12, i32 0, i32 3
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  store i32 4, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 100
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.25 = getelementptr [100 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @initializeMemoryPool50.([50 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [50 x i32]* 
  %i = alloca i32 
  store [50 x i32]* %memory.tmp, ptr %memory..tmp
  %rcc.tmp.2 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.3 = getelementptr [50 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  store i32 46, ptr %rcc.tmp.3
  %rcc.tmp.5 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %rcc.tmp.5, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.10 = sub i32 0, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.13 = getelementptr [50 x i32], ptr %rcc.tmp.12, i32 0, i32 3
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  store i32 4, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 50
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @initializeMemoryPool200.([200 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [200 x i32]* 
  %i = alloca i32 
  store [200 x i32]* %memory.tmp, ptr %memory..tmp
  %rcc.tmp.2 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.3 = getelementptr [200 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  store i32 196, ptr %rcc.tmp.3
  %rcc.tmp.5 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.6 = getelementptr [200 x i32], ptr %rcc.tmp.5, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.9 = getelementptr [200 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.10 = sub i32 0, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.13 = getelementptr [200 x i32], ptr %rcc.tmp.12, i32 0, i32 3
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  store i32 4, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 200
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @allocateBlock100.([100 x i32]* %memory.tmp, i32 %free_head.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [100 x i32]* 
  %free_head..tmp = alloca i32 
  %size..tmp = alloca i32 
  store [100 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %free_head.tmp, ptr %free_head..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp sgt i32 %rcc.tmp.7, 96
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = sub i32 0, 1
  ret i32 %rcc.tmp.12
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.15, i32 0, i32 1
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.20 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %size..tmp
  %rcc.tmp.24 = icmp sge i32 %rcc.tmp.22, %rcc.tmp.23
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.26 = phi i1 [0, %if.merge], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.28 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.29 = getelementptr [100 x i32], ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.33 = getelementptr [100 x i32], ptr %rcc.tmp.32, i32 0, i32 1
  store i32 1, ptr %rcc.tmp.33
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.37 = sub i32 0, 1
  ret i32 %rcc.tmp.37
}
define i32 @allocateBlock50.([50 x i32]* %memory.tmp, i32 %free_head.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [50 x i32]* 
  %free_head..tmp = alloca i32 
  %size..tmp = alloca i32 
  %pos = alloca i32 
  %available_size = alloca i32 
  store [50 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %free_head.tmp, ptr %free_head..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp sgt i32 %rcc.tmp.7, 46
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = sub i32 0, 1
  ret i32 %rcc.tmp.12
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %pos
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %pos
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = sub i32 46, %rcc.tmp.18
  %rcc.tmp.20 = icmp sle i32 %rcc.tmp.17, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %pos
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.27 = getelementptr [50 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.31 = load i32, ptr %pos
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %available_size
  %rcc.tmp.37 = load i32, ptr %available_size
  %rcc.tmp.38 = load i32, ptr %size..tmp
  %rcc.tmp.39 = icmp sge i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.41 = load i32, ptr %pos
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.44 = getelementptr [50 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.45, ptr %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %pos
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  %rcc.tmp.50 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.51 = getelementptr [50 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  store i32 1, ptr %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %pos
  ret i32 %rcc.tmp.53
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.58 = load i32, ptr %pos
  %rcc.tmp.59 = load i32, ptr %pos
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [50 x i32]*, ptr %memory..tmp
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.58, %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 4
  store i32 %rcc.tmp.65, ptr %pos
  br label %while.cond
while.end:
  %rcc.tmp.68 = sub i32 0, 1
  ret i32 %rcc.tmp.68
}
define i32 @allocateBlock200.([200 x i32]* %memory.tmp, i32 %free_head.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [200 x i32]* 
  %free_head..tmp = alloca i32 
  %size..tmp = alloca i32 
  store [200 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %free_head.tmp, ptr %free_head..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp sgt i32 %rcc.tmp.7, 196
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = sub i32 0, 1
  ret i32 %rcc.tmp.12
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.16 = getelementptr [200 x i32], ptr %rcc.tmp.15, i32 0, i32 1
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.20 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.21 = getelementptr [200 x i32], ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %size..tmp
  %rcc.tmp.24 = icmp sge i32 %rcc.tmp.22, %rcc.tmp.23
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.26 = phi i1 [0, %if.merge], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.28 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.29 = getelementptr [200 x i32], ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.33 = getelementptr [200 x i32], ptr %rcc.tmp.32, i32 0, i32 1
  store i32 1, ptr %rcc.tmp.33
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.37 = sub i32 0, 1
  ret i32 %rcc.tmp.37
}
define void @deallocateBlock100.([100 x i32]* %memory.tmp, i32 %block_start.tmp) {
entry:
  %memory..tmp = alloca [100 x i32]* 
  %block_start..tmp = alloca i32 
  store [100 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %block_start.tmp, ptr %block_start..tmp
  %rcc.tmp.3 = load i32, ptr %block_start..tmp
  %rcc.tmp.4 = icmp sge i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.6 = load i32, ptr %block_start..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [0, %entry], [%rcc.tmp.8, %and.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %block_start..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load [100 x i32]*, ptr %memory..tmp
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.16
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @detectMemoryCorruption.([200 x i32]* %memory.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [200 x i32]* 
  %size..tmp = alloca i32 
  %corruption_count = alloca i32 
  %i = alloca i32 
  store [200 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %corruption_count
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
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.14 = getelementptr [200 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = icmp sgt i32 %rcc.tmp.15, 10000
  br i1 %rcc.tmp.16, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.21 = getelementptr [200 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = sub i32 0, 1000
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.23
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [1, %while.body], [%rcc.tmp.24, %or.rhs]
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %corruption_count
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %corruption_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.37 = load i32, ptr %corruption_count
  ret i32 %rcc.tmp.37
}
define i32 @validateMemoryIntegrity.([200 x i32]* %memory.tmp, i32 %size.tmp) {
entry:
  %memory..tmp = alloca [200 x i32]* 
  %size..tmp = alloca i32 
  %valid_blocks = alloca i32 
  %i = alloca i32 
  %block_size = alloca i32 
  store [200 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %valid_blocks
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 4
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.15 = getelementptr [200 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp sgt i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.22 = getelementptr [200 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = icmp sle i32 %rcc.tmp.23, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [0, %while.body], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 0
  br i1 %rcc.tmp.34, label %sc.merge.3, label %or.rhs
or.rhs:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.40 = getelementptr [200 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.41, 1
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.44 = phi i1 [1, %and.rhs.2], [%rcc.tmp.42, %or.rhs]
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.46 = phi i1 [0, %sc.merge], [%rcc.tmp.44, %sc.merge.3]
  br i1 %rcc.tmp.46, label %if.then, label %if.else
if.then:
  %rcc.tmp.48 = load i32, ptr %valid_blocks
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %valid_blocks
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [200 x i32]*, ptr %memory..tmp
  %rcc.tmp.56 = getelementptr [200 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 4
  store i32 %rcc.tmp.58, ptr %block_size
  %rcc.tmp.60 = load i32, ptr %block_size
  %rcc.tmp.61 = icmp sgt i32 %rcc.tmp.60, 0
  br i1 %rcc.tmp.61, label %and.rhs.3, label %sc.merge.4
and.rhs.3:
  %rcc.tmp.63 = load i32, ptr %block_size
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.63, 50
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.66 = phi i1 [0, %if.merge], [%rcc.tmp.64, %and.rhs.3]
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = load i32, ptr %block_size
  %rcc.tmp.70 = add i32 %rcc.tmp.68, %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %i
  br label %if.merge.2
if.else.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 4
  store i32 %rcc.tmp.74, ptr %i
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.78 = load i32, ptr %valid_blocks
  ret i32 %rcc.tmp.78
}
