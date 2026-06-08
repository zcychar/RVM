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
  call void @printlnInt.(i32 1600)
  call void @performLinkedListOperations.()
  call void @testAdvancedListOperations.()
  call void @performListPerformanceTest.()
  call void @testEdgeCases.()
  call void @printlnInt.(i32 1699)
  call void @exit.(i32 0)
  ret void
}
define void @performLinkedListOperations.() {
entry:
  %memory_pool = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %free_list_head = alloca i32 
  %list_head = alloca i32 
  %allocated_count = alloca i32 
  %i = alloca i32 
  %new_node = alloca i32 
  %sum = alloca i32 
  %reversed_sum = alloca i32 
  %search_results = alloca i32 
  %sorted_check = alloca i32 
  call void @printlnInt.(i32 1601)
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
  store i32 1, ptr %free_list_head
  store i32 0, ptr %list_head
  store i32 0, ptr %allocated_count
  %rcc.tmp.16 = load i32, ptr %free_list_head
  call void @initializeFreeList.([2000 x i32]* %memory_pool, i32 %rcc.tmp.16)
  call void @printlnInt.(i32 1602)
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = icmp sle i32 %rcc.tmp.21, 100
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %free_list_head
  %rcc.tmp.26 = call i32 @allocateNode.([2000 x i32]* %memory_pool, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %new_node
  %rcc.tmp.28 = load i32, ptr %new_node
  %rcc.tmp.29 = icmp ne i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %new_node
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [2000 x i32], ptr %memory_pool, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, 7
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 13
  store i32 %rcc.tmp.36, ptr %rcc.tmp.33
  %rcc.tmp.38 = load i32, ptr %new_node
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  %rcc.tmp.41 = getelementptr [2000 x i32], ptr %memory_pool, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %list_head
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %new_node
  store i32 %rcc.tmp.44, ptr %list_head
  %rcc.tmp.46 = load i32, ptr %allocated_count
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %allocated_count
  %rcc.tmp.49 = load i32, ptr %free_list_head
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  %rcc.tmp.52 = getelementptr [2000 x i32], ptr %memory_pool, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %free_list_head
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %i
  br label %while.cond
while.end:
  call void @printlnInt.(i32 1603)
  %rcc.tmp.62 = load i32, ptr %list_head
  %rcc.tmp.63 = call i32 @calculateListSum.([2000 x i32]* %memory_pool, i32 %rcc.tmp.62)
  store i32 %rcc.tmp.63, ptr %sum
  %rcc.tmp.65 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.65)
  call void @printlnInt.(i32 1604)
  %rcc.tmp.68 = load i32, ptr %list_head
  %rcc.tmp.69 = call i32 @reverseList.([2000 x i32]* %memory_pool, i32 %rcc.tmp.68)
  store i32 %rcc.tmp.69, ptr %list_head
  %rcc.tmp.71 = load i32, ptr %list_head
  %rcc.tmp.72 = call i32 @calculateListSum.([2000 x i32]* %memory_pool, i32 %rcc.tmp.71)
  store i32 %rcc.tmp.72, ptr %reversed_sum
  %rcc.tmp.74 = load i32, ptr %reversed_sum
  call void @printlnInt.(i32 %rcc.tmp.74)
  call void @printlnInt.(i32 1605)
  %rcc.tmp.77 = load i32, ptr %list_head
  %rcc.tmp.78 = call i32 @complexListSearch.([2000 x i32]* %memory_pool, i32 %rcc.tmp.77)
  store i32 %rcc.tmp.78, ptr %search_results
  %rcc.tmp.80 = load i32, ptr %search_results
  call void @printlnInt.(i32 %rcc.tmp.80)
  call void @printlnInt.(i32 1606)
  %rcc.tmp.83 = load i32, ptr %list_head
  %rcc.tmp.84 = load i32, ptr %allocated_count
  %rcc.tmp.85 = call i32 @mergeSort.([2000 x i32]* %memory_pool, i32 %rcc.tmp.83, i32 %rcc.tmp.84)
  store i32 %rcc.tmp.85, ptr %list_head
  %rcc.tmp.87 = load i32, ptr %list_head
  %rcc.tmp.88 = call i32 @verifySorted.([2000 x i32]* %memory_pool, i32 %rcc.tmp.87)
  store i32 %rcc.tmp.88, ptr %sorted_check
  %rcc.tmp.90 = load i32, ptr %sorted_check
  call void @printlnInt.(i32 %rcc.tmp.90)
  ret void
}
define void @initializeFreeList.([2000 x i32]* %memory_pool.tmp, i32 %start_index.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %start_index..tmp = alloca i32 
  %current = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %start_index.tmp, ptr %start_index..tmp
  %rcc.tmp.3 = load i32, ptr %start_index..tmp
  store i32 %rcc.tmp.3, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %current
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 1998
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %current
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.13 = getelementptr [2000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %current
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.19 = getelementptr [2000 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %current
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 2
  store i32 %rcc.tmp.21, ptr %rcc.tmp.19
  %rcc.tmp.23 = load i32, ptr %current
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 2
  store i32 %rcc.tmp.24, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.27 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.28 = getelementptr [2000 x i32], ptr %rcc.tmp.27, i32 0, i32 1998
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.31 = getelementptr [2000 x i32], ptr %rcc.tmp.30, i32 0, i32 1999
  store i32 0, ptr %rcc.tmp.31
  ret void
}
define i32 @allocateNode.([2000 x i32]* %memory_pool.tmp, i32 %free_head.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %free_head..tmp = alloca i32 
  %allocated_node = alloca i32 
  %next_free = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %free_head.tmp, ptr %free_head..tmp
  %rcc.tmp.3 = load i32, ptr %free_head..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %free_head..tmp
  %rcc.tmp.7 = icmp sge i32 %rcc.tmp.6, 1998
  br label %sc.merge
sc.merge:
  %rcc.tmp.9 = phi i1 [1, %entry], [%rcc.tmp.7, %or.rhs]
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.13 = load i32, ptr %free_head..tmp
  store i32 %rcc.tmp.13, ptr %allocated_node
  %rcc.tmp.15 = load i32, ptr %free_head..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.19 = getelementptr [2000 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %next_free
  %rcc.tmp.22 = load i32, ptr %allocated_node
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.25 = getelementptr [2000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %allocated_node
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.31 = getelementptr [2000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %allocated_node
  ret i32 %rcc.tmp.33
}
define i32 @calculateListSum.([2000 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %head..tmp = alloca i32 
  %sum = alloca i32 
  %current = alloca i32 
  %node_count = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 0, ptr %sum
  %rcc.tmp.4 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.4, ptr %current
  store i32 0, ptr %node_count
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %current
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load i32, ptr %node_count
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.14 = phi i1 [0, %while.cond], [%rcc.tmp.12, %and.rhs]
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %sum
  %rcc.tmp.18 = load i32, ptr %current
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.17, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %sum
  %rcc.tmp.25 = load i32, ptr %current
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  %rcc.tmp.28 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.29 = getelementptr [2000 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %current
  %rcc.tmp.32 = load i32, ptr %node_count
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %node_count
  br label %while.cond
while.end:
  %rcc.tmp.36 = load i32, ptr %sum
  ret i32 %rcc.tmp.36
}
define i32 @reverseList.([2000 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %head..tmp = alloca i32 
  %prev = alloca i32 
  %current = alloca i32 
  %next = alloca i32 
  %step_count = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 0, ptr %prev
  %rcc.tmp.4 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.4, ptr %current
  %rcc.tmp.6 = sub i32 0, 1
  store i32 %rcc.tmp.6, ptr %next
  store i32 0, ptr %step_count
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %current
  %rcc.tmp.11 = icmp ne i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.13 = load i32, ptr %step_count
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.16 = phi i1 [0, %while.cond], [%rcc.tmp.14, %and.rhs]
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %current
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.23 = getelementptr [2000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %next
  %rcc.tmp.26 = load i32, ptr %current
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  %rcc.tmp.29 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.30 = getelementptr [2000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %prev
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %current
  store i32 %rcc.tmp.33, ptr %prev
  %rcc.tmp.35 = load i32, ptr %next
  store i32 %rcc.tmp.35, ptr %current
  %rcc.tmp.37 = load i32, ptr %step_count
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %step_count
  br label %while.cond
while.end:
  %rcc.tmp.41 = load i32, ptr %prev
  ret i32 %rcc.tmp.41
}
define i32 @complexListSearch.([2000 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %head..tmp = alloca i32 
  %current = alloca i32 
  %found_count = alloca i32 
  %max_value = alloca i32 
  %min_value = alloca i32 
  %even_count = alloca i32 
  %odd_count = alloca i32 
  %position = alloca i32 
  %value = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  %rcc.tmp.3 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.3, ptr %current
  store i32 0, ptr %found_count
  %rcc.tmp.6 = sub i32 0, 999999
  store i32 %rcc.tmp.6, ptr %max_value
  store i32 999999, ptr %min_value
  store i32 0, ptr %even_count
  store i32 0, ptr %odd_count
  store i32 0, ptr %position
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %current
  %rcc.tmp.14 = icmp ne i32 %rcc.tmp.13, 0
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load i32, ptr %position
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.19 = phi i1 [0, %while.cond], [%rcc.tmp.17, %and.rhs]
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %current
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.25 = getelementptr [2000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %value
  %rcc.tmp.28 = load i32, ptr %value
  %rcc.tmp.29 = load i32, ptr %max_value
  %rcc.tmp.30 = icmp sgt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %value
  store i32 %rcc.tmp.32, ptr %max_value
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %value
  %rcc.tmp.37 = load i32, ptr %min_value
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %value
  store i32 %rcc.tmp.40, ptr %min_value
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.44 = load i32, ptr %value
  %rcc.tmp.45 = srem i32 %rcc.tmp.44, 2
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.45, 0
  br i1 %rcc.tmp.46, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.48 = load i32, ptr %even_count
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %even_count
  br label %if.merge.3
if.else.3:
  %rcc.tmp.52 = load i32, ptr %odd_count
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %odd_count
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.56 = load i32, ptr %value
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 7
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.57, 0
  br i1 %rcc.tmp.58, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.60 = load i32, ptr %value
  %rcc.tmp.61 = icmp sgt i32 %rcc.tmp.60, 50
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.63 = phi i1 [0, %if.merge.3], [%rcc.tmp.61, %and.rhs.2]
  br i1 %rcc.tmp.63, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.65 = load i32, ptr %found_count
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %found_count
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.70 = load i32, ptr %current
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  %rcc.tmp.73 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.74 = getelementptr [2000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %current
  %rcc.tmp.77 = load i32, ptr %position
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %position
  br label %while.cond
while.end:
  %rcc.tmp.81 = load i32, ptr %found_count
  %rcc.tmp.82 = mul i32 %rcc.tmp.81, 1000
  %rcc.tmp.83 = load i32, ptr %even_count
  %rcc.tmp.84 = mul i32 %rcc.tmp.83, 10
  %rcc.tmp.85 = add i32 %rcc.tmp.82, %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %odd_count
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  ret i32 %rcc.tmp.87
}
define i32 @mergeSort.([2000 x i32]* %memory_pool.tmp, i32 %head.tmp, i32 %length.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %head..tmp = alloca i32 
  %length..tmp = alloca i32 
  %mid_point = alloca i32 
  %second_half = alloca i32 
  %first_sorted = alloca i32 
  %second_sorted = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 %length.tmp, ptr %length..tmp
  %rcc.tmp.4 = load i32, ptr %head..tmp
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %head..tmp
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.11 = getelementptr [2000 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.15 = phi i1 [1, %entry], [%rcc.tmp.13, %or.rhs]
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %head..tmp
  ret i32 %rcc.tmp.17
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.20 = load i32, ptr %length..tmp
  %rcc.tmp.21 = sdiv i32 %rcc.tmp.20, 2
  store i32 %rcc.tmp.21, ptr %mid_point
  %rcc.tmp.23 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.24 = load i32, ptr %head..tmp
  %rcc.tmp.25 = load i32, ptr %mid_point
  %rcc.tmp.26 = call i32 @splitList.([2000 x i32]* %rcc.tmp.23, i32 %rcc.tmp.24, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %second_half
  %rcc.tmp.28 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.29 = load i32, ptr %head..tmp
  %rcc.tmp.30 = load i32, ptr %mid_point
  %rcc.tmp.31 = call i32 @mergeSort.([2000 x i32]* %rcc.tmp.28, i32 %rcc.tmp.29, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %first_sorted
  %rcc.tmp.33 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.34 = load i32, ptr %second_half
  %rcc.tmp.35 = load i32, ptr %length..tmp
  %rcc.tmp.36 = load i32, ptr %mid_point
  %rcc.tmp.37 = sub i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = call i32 @mergeSort.([2000 x i32]* %rcc.tmp.33, i32 %rcc.tmp.34, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %second_sorted
  %rcc.tmp.40 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.41 = load i32, ptr %first_sorted
  %rcc.tmp.42 = load i32, ptr %second_sorted
  %rcc.tmp.43 = call i32 @mergeLists.([2000 x i32]* %rcc.tmp.40, i32 %rcc.tmp.41, i32 %rcc.tmp.42)
  ret i32 %rcc.tmp.43
}
define i32 @splitList.([2000 x i32]* %memory_pool.tmp, i32 %head.tmp, i32 %split_pos.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %head..tmp = alloca i32 
  %split_pos..tmp = alloca i32 
  %current = alloca i32 
  %count = alloca i32 
  %second_half = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 %split_pos.tmp, ptr %split_pos..tmp
  %rcc.tmp.4 = load i32, ptr %split_pos..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 1
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %head..tmp
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.10, ptr %current
  store i32 1, ptr %count
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %count
  %rcc.tmp.15 = load i32, ptr %split_pos..tmp
  %rcc.tmp.16 = sub i32 %rcc.tmp.15, 1
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.19 = load i32, ptr %current
  %rcc.tmp.20 = icmp ne i32 %rcc.tmp.19, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.22 = phi i1 [0, %while.cond], [%rcc.tmp.20, %and.rhs]
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %current
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  %rcc.tmp.28 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.29 = getelementptr [2000 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %current
  %rcc.tmp.32 = load i32, ptr %count
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %count
  br label %while.cond
while.end:
  %rcc.tmp.36 = load i32, ptr %current
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.36, 0
  br i1 %rcc.tmp.37, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.41 = load i32, ptr %current
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  %rcc.tmp.44 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.45 = getelementptr [2000 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %second_half
  %rcc.tmp.48 = load i32, ptr %current
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  %rcc.tmp.51 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.52 = getelementptr [2000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %second_half
  ret i32 %rcc.tmp.54
}
define i32 @mergeLists.([2000 x i32]* %memory_pool.tmp, i32 %list1.tmp, i32 %list2.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %list1..tmp = alloca i32 
  %list2..tmp = alloca i32 
  %result_head = alloca i32 
  %current = alloca i32 
  %merge_count = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %list1.tmp, ptr %list1..tmp
  store i32 %list2.tmp, ptr %list2..tmp
  %rcc.tmp.4 = load i32, ptr %list1..tmp
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %list2..tmp
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %list2..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %list1..tmp
  ret i32 %rcc.tmp.13
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.16 = sub i32 0, 1
  store i32 %rcc.tmp.16, ptr %result_head
  %rcc.tmp.18 = sub i32 0, 1
  store i32 %rcc.tmp.18, ptr %current
  %rcc.tmp.20 = load i32, ptr %list1..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.23 = getelementptr [2000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %list2..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.28 = getelementptr [2000 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = icmp sle i32 %rcc.tmp.24, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.32 = load i32, ptr %list1..tmp
  store i32 %rcc.tmp.32, ptr %result_head
  %rcc.tmp.34 = load i32, ptr %list1..tmp
  store i32 %rcc.tmp.34, ptr %current
  %rcc.tmp.36 = load i32, ptr %list1..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.40 = getelementptr [2000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %list1..tmp
  br label %if.merge.3
if.else.3:
  %rcc.tmp.44 = load i32, ptr %list2..tmp
  store i32 %rcc.tmp.44, ptr %result_head
  %rcc.tmp.46 = load i32, ptr %list2..tmp
  store i32 %rcc.tmp.46, ptr %current
  %rcc.tmp.48 = load i32, ptr %list2..tmp
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  %rcc.tmp.51 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.52 = getelementptr [2000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %list2..tmp
  br label %if.merge.3
if.merge.3:
  store i32 0, ptr %merge_count
  br label %while.cond
while.cond:
  %rcc.tmp.58 = load i32, ptr %list1..tmp
  %rcc.tmp.59 = icmp ne i32 %rcc.tmp.58, 0
  br i1 %rcc.tmp.59, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.61 = load i32, ptr %list2..tmp
  %rcc.tmp.62 = icmp ne i32 %rcc.tmp.61, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.64 = phi i1 [0, %while.cond], [%rcc.tmp.62, %and.rhs]
  br i1 %rcc.tmp.64, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.66 = load i32, ptr %merge_count
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 500
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.69 = phi i1 [0, %sc.merge], [%rcc.tmp.67, %and.rhs.2]
  br i1 %rcc.tmp.69, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.72 = load i32, ptr %list1..tmp
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.75 = getelementptr [2000 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %list2..tmp
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.80 = getelementptr [2000 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = icmp sle i32 %rcc.tmp.76, %rcc.tmp.81
  br i1 %rcc.tmp.82, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.84 = load i32, ptr %current
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  %rcc.tmp.87 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.88 = getelementptr [2000 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = load i32, ptr %list1..tmp
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %list1..tmp
  store i32 %rcc.tmp.91, ptr %current
  %rcc.tmp.93 = load i32, ptr %list1..tmp
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  %rcc.tmp.96 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.97 = getelementptr [2000 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.98 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.98, ptr %list1..tmp
  br label %if.merge.4
if.else.4:
  %rcc.tmp.101 = load i32, ptr %current
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  %rcc.tmp.104 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.105 = getelementptr [2000 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %list2..tmp
  store i32 %rcc.tmp.106, ptr %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %list2..tmp
  store i32 %rcc.tmp.108, ptr %current
  %rcc.tmp.110 = load i32, ptr %list2..tmp
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  %rcc.tmp.113 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.114 = getelementptr [2000 x i32], ptr %rcc.tmp.113, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  store i32 %rcc.tmp.115, ptr %list2..tmp
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.118 = load i32, ptr %merge_count
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %merge_count
  br label %while.cond
while.end:
  %rcc.tmp.122 = load i32, ptr %list1..tmp
  %rcc.tmp.123 = icmp ne i32 %rcc.tmp.122, 0
  br i1 %rcc.tmp.123, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.125 = load i32, ptr %current
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  %rcc.tmp.128 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.129 = getelementptr [2000 x i32], ptr %rcc.tmp.128, i32 0, i32 %rcc.tmp.127
  %rcc.tmp.130 = load i32, ptr %list1..tmp
  store i32 %rcc.tmp.130, ptr %rcc.tmp.129
  br label %if.merge.5
if.else.5:
  %rcc.tmp.133 = load i32, ptr %current
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  %rcc.tmp.136 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.137 = getelementptr [2000 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.138 = load i32, ptr %list2..tmp
  store i32 %rcc.tmp.138, ptr %rcc.tmp.137
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.141 = load i32, ptr %result_head
  ret i32 %rcc.tmp.141
}
define i32 @verifySorted.([2000 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [2000 x i32]* 
  %head..tmp = alloca i32 
  %current = alloca i32 
  %is_sorted = alloca i32 
  %check_count = alloca i32 
  store [2000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  %rcc.tmp.3 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.3, ptr %current
  store i32 1, ptr %is_sorted
  store i32 0, ptr %check_count
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %current
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load i32, ptr %current
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp ne i32 %rcc.tmp.16, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.19 = phi i1 [0, %while.cond], [%rcc.tmp.17, %and.rhs]
  br i1 %rcc.tmp.19, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.21 = load i32, ptr %check_count
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 999
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.24 = phi i1 [0, %sc.merge], [%rcc.tmp.22, %and.rhs.2]
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %current
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.30 = getelementptr [2000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %current
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  %rcc.tmp.35 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.36 = getelementptr [2000 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.40 = getelementptr [2000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = icmp sgt i32 %rcc.tmp.31, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  store i32 0, ptr %is_sorted
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.47 = load i32, ptr %current
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  %rcc.tmp.50 = load [2000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.51 = getelementptr [2000 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %current
  %rcc.tmp.54 = load i32, ptr %check_count
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %check_count
  br label %while.cond
while.end:
  %rcc.tmp.58 = load i32, ptr %is_sorted
  ret i32 %rcc.tmp.58
}
define void @testAdvancedListOperations.() {
entry:
  %memory_pool = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %list_heads = alloca [10 x i32] 
  %free_head = alloca i32 
  %intersection_result = alloca i32 
  %union_result = alloca i32 
  %manipulation_result = alloca i32 
  call void @printlnInt.(i32 1610)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %memory_pool, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %list_heads, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.31
  store i32 1, ptr %free_head
  call void @initializeAdvancedMemory.([1000 x i32]* %memory_pool)
  %rcc.tmp.35 = load i32, ptr %free_head
  call void @createMultipleLists.([1000 x i32]* %memory_pool, [10 x i32]* %list_heads, i32 %rcc.tmp.35)
  %rcc.tmp.37 = call i32 @findListIntersections.([1000 x i32]* %memory_pool, [10 x i32]* %list_heads)
  store i32 %rcc.tmp.37, ptr %intersection_result
  %rcc.tmp.39 = load i32, ptr %intersection_result
  call void @printlnInt.(i32 %rcc.tmp.39)
  %rcc.tmp.41 = call i32 @performListUnions.([1000 x i32]* %memory_pool, [10 x i32]* %list_heads)
  store i32 %rcc.tmp.41, ptr %union_result
  %rcc.tmp.43 = load i32, ptr %union_result
  call void @printlnInt.(i32 %rcc.tmp.43)
  %rcc.tmp.45 = call i32 @complexListManipulations.([1000 x i32]* %memory_pool, [10 x i32]* %list_heads)
  store i32 %rcc.tmp.45, ptr %manipulation_result
  %rcc.tmp.47 = load i32, ptr %manipulation_result
  call void @printlnInt.(i32 %rcc.tmp.47)
  ret void
}
define void @initializeAdvancedMemory.([1000 x i32]* %memory_pool.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %i = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 998
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.11 = getelementptr [1000 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  %rcc.tmp.16 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.17 = getelementptr [1000 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 2
  store i32 %rcc.tmp.19, ptr %rcc.tmp.17
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 2
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.26 = getelementptr [1000 x i32], ptr %rcc.tmp.25, i32 0, i32 998
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.29 = getelementptr [1000 x i32], ptr %rcc.tmp.28, i32 0, i32 999
  store i32 0, ptr %rcc.tmp.29
  ret void
}
define void @createMultipleLists.([1000 x i32]* %memory_pool.tmp, [10 x i32]* %list_heads.tmp, i32 %free_head.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %list_heads..local = alloca [10 x i32] 
  %free_head..tmp = alloca i32 
  %list_index = alloca i32 
  %node_count = alloca i32 
  %list_size = alloca i32 
  %new_node = alloca i32 
  %data_value = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.2
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 1
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.8, ptr %rcc.tmp.7
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 2
  %rcc.tmp.11 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 3
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 4
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 4
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 5
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 5
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 6
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 6
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 7
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 7
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 8
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 8
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 9
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 9
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  store i32 %free_head.tmp, ptr %free_head..tmp
  store i32 0, ptr %list_index
  br label %while.cond
while.cond:
  %rcc.tmp.45 = load i32, ptr %list_index
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 10
  br i1 %rcc.tmp.46, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %node_count
  %rcc.tmp.50 = load i32, ptr %list_index
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  %rcc.tmp.52 = mul i32 %rcc.tmp.51, 5
  store i32 %rcc.tmp.52, ptr %list_size
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.55 = load i32, ptr %node_count
  %rcc.tmp.56 = load i32, ptr %list_size
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.55, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.59 = load i32, ptr %free_head..tmp
  %rcc.tmp.60 = icmp ne i32 %rcc.tmp.59, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.62 = phi i1 [0, %while.cond.2], [%rcc.tmp.60, %and.rhs]
  br i1 %rcc.tmp.62, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.64 = load i32, ptr %free_head..tmp
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 998
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.67 = phi i1 [0, %sc.merge], [%rcc.tmp.65, %and.rhs.2]
  br i1 %rcc.tmp.67, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.70 = load i32, ptr %free_head..tmp
  store i32 %rcc.tmp.70, ptr %new_node
  %rcc.tmp.72 = load i32, ptr %free_head..tmp
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  %rcc.tmp.75 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.76 = getelementptr [1000 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %free_head..tmp
  %rcc.tmp.79 = load i32, ptr %list_index
  %rcc.tmp.80 = mul i32 %rcc.tmp.79, 100
  %rcc.tmp.81 = load i32, ptr %node_count
  %rcc.tmp.82 = load i32, ptr %list_index
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  %rcc.tmp.84 = mul i32 %rcc.tmp.81, %rcc.tmp.83
  %rcc.tmp.85 = add i32 %rcc.tmp.80, %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %data_value
  %rcc.tmp.87 = load i32, ptr %new_node
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.90 = getelementptr [1000 x i32], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %data_value
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %new_node
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  %rcc.tmp.96 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.97 = getelementptr [1000 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.98 = load i32, ptr %list_index
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  store i32 %rcc.tmp.101, ptr %rcc.tmp.97
  %rcc.tmp.103 = load i32, ptr %list_index
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %new_node
  store i32 %rcc.tmp.106, ptr %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %node_count
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %node_count
  br label %while.cond.2
while.end.2:
  %rcc.tmp.112 = load i32, ptr %list_index
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 1
  store i32 %rcc.tmp.113, ptr %list_index
  br label %while.cond
while.end:
  ret void
}
define i32 @findListIntersections.([1000 x i32]* %memory_pool.tmp, [10 x i32]* %list_heads.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %list_heads..local = alloca [10 x i32] 
  %intersection_count = alloca i32 
  %list_i = alloca i32 
  %list_j = alloca i32 
  %common_values = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.2
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 1
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.8, ptr %rcc.tmp.7
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 2
  %rcc.tmp.11 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 3
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 4
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 4
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 5
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 5
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 6
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 6
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 7
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 7
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 8
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 8
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 9
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 9
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  store i32 0, ptr %intersection_count
  store i32 0, ptr %list_i
  br label %while.cond
while.cond:
  %rcc.tmp.45 = load i32, ptr %list_i
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 9
  br i1 %rcc.tmp.46, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.49 = load i32, ptr %list_i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %list_j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.53 = load i32, ptr %list_j
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.53, 10
  br i1 %rcc.tmp.54, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.57 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.58 = load i32, ptr %list_i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %list_j
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = call i32 @countCommonValues.([1000 x i32]* %rcc.tmp.57, i32 %rcc.tmp.61, i32 %rcc.tmp.65)
  store i32 %rcc.tmp.66, ptr %common_values
  %rcc.tmp.68 = load i32, ptr %intersection_count
  %rcc.tmp.69 = load i32, ptr %common_values
  %rcc.tmp.70 = add i32 %rcc.tmp.68, %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %intersection_count
  %rcc.tmp.72 = load i32, ptr %list_j
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %list_j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.76 = load i32, ptr %list_i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %list_i
  br label %while.cond
while.end:
  %rcc.tmp.80 = load i32, ptr %intersection_count
  ret i32 %rcc.tmp.80
}
define i32 @countCommonValues.([1000 x i32]* %memory_pool.tmp, i32 %head1.tmp, i32 %head2.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %head1..tmp = alloca i32 
  %head2..tmp = alloca i32 
  %common_count = alloca i32 
  %current1 = alloca i32 
  %iter_count = alloca i32 
  %value1 = alloca i32 
  %current2 = alloca i32 
  %inner_iter = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head1.tmp, ptr %head1..tmp
  store i32 %head2.tmp, ptr %head2..tmp
  store i32 0, ptr %common_count
  %rcc.tmp.5 = load i32, ptr %head1..tmp
  store i32 %rcc.tmp.5, ptr %current1
  store i32 0, ptr %iter_count
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %current1
  %rcc.tmp.10 = icmp ne i32 %rcc.tmp.9, 0
  br i1 %rcc.tmp.10, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.12 = load i32, ptr %iter_count
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.15 = phi i1 [0, %while.cond], [%rcc.tmp.13, %and.rhs]
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %current1
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.21 = getelementptr [1000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %value1
  %rcc.tmp.24 = load i32, ptr %head2..tmp
  store i32 %rcc.tmp.24, ptr %current2
  store i32 0, ptr %inner_iter
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %current2
  %rcc.tmp.29 = icmp ne i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.31 = load i32, ptr %inner_iter
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.34 = phi i1 [0, %while.cond.2], [%rcc.tmp.32, %and.rhs.2]
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.37 = load i32, ptr %current2
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.40 = getelementptr [1000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %value1
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %if.then, label %if.else
if.then:
  %rcc.tmp.45 = load i32, ptr %common_count
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %common_count
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %current2
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  %rcc.tmp.53 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.54 = getelementptr [1000 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %current2
  %rcc.tmp.57 = load i32, ptr %inner_iter
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %inner_iter
  br label %while.cond.2
while.end.2:
  %rcc.tmp.61 = load i32, ptr %current1
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  %rcc.tmp.64 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.65 = getelementptr [1000 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %current1
  %rcc.tmp.68 = load i32, ptr %iter_count
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %iter_count
  br label %while.cond
while.end:
  %rcc.tmp.72 = load i32, ptr %common_count
  ret i32 %rcc.tmp.72
}
define i32 @performListUnions.([1000 x i32]* %memory_pool.tmp, [10 x i32]* %list_heads.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %list_heads..local = alloca [10 x i32] 
  %union_size = alloca i32 
  %unique_values = alloca [500 x i32] 
  %fill.idx = alloca i32 
  %unique_count = alloca i32 
  %list_index = alloca i32 
  %current = alloca i32 
  %node_count = alloca i32 
  %value = alloca i32 
  %found = alloca i32 
  %check_index = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.2
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 1
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.8, ptr %rcc.tmp.7
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 2
  %rcc.tmp.11 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 3
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 4
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 4
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 5
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 5
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 6
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 6
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 7
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 7
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 8
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 8
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 9
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 9
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  store i32 0, ptr %union_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.45 = load i32, ptr %fill.idx
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 500
  br i1 %rcc.tmp.46, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.48 = load i32, ptr %fill.idx
  %rcc.tmp.49 = getelementptr [500 x i32], ptr %unique_values, i32 0, i32 %rcc.tmp.48
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.51, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %unique_count
  store i32 0, ptr %list_index
  br label %while.cond
while.cond:
  %rcc.tmp.57 = load i32, ptr %list_index
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 10
  br i1 %rcc.tmp.58, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.61 = load i32, ptr %list_index
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %current
  store i32 0, ptr %node_count
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.68 = load i32, ptr %current
  %rcc.tmp.69 = icmp ne i32 %rcc.tmp.68, 0
  br i1 %rcc.tmp.69, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.71 = load i32, ptr %node_count
  %rcc.tmp.72 = icmp slt i32 %rcc.tmp.71, 50
  br label %sc.merge
sc.merge:
  %rcc.tmp.74 = phi i1 [0, %while.cond.2], [%rcc.tmp.72, %and.rhs]
  br i1 %rcc.tmp.74, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.77 = load i32, ptr %current
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.80 = getelementptr [1000 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %value
  store i32 0, ptr %found
  store i32 0, ptr %check_index
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.86 = load i32, ptr %check_index
  %rcc.tmp.87 = load i32, ptr %unique_count
  %rcc.tmp.88 = icmp slt i32 %rcc.tmp.86, %rcc.tmp.87
  br i1 %rcc.tmp.88, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.91 = load i32, ptr %check_index
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [500 x i32], ptr %unique_values, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %value
  %rcc.tmp.96 = icmp eq i32 %rcc.tmp.94, %rcc.tmp.95
  br i1 %rcc.tmp.96, label %if.then, label %if.else
if.then:
  store i32 1, ptr %found
  br label %while.linker.3
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.101 = load i32, ptr %check_index
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %check_index
  br label %while.cond.3
while.end.3:
  %rcc.tmp.105 = load i32, ptr %found
  %rcc.tmp.106 = icmp eq i32 %rcc.tmp.105, 0
  br i1 %rcc.tmp.106, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.108 = load i32, ptr %unique_count
  %rcc.tmp.109 = icmp slt i32 %rcc.tmp.108, 500
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.111 = phi i1 [0, %while.end.3], [%rcc.tmp.109, %and.rhs.2]
  br i1 %rcc.tmp.111, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.113 = load i32, ptr %unique_count
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [500 x i32], ptr %unique_values, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %value
  store i32 %rcc.tmp.116, ptr %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %unique_count
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %unique_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.123 = load i32, ptr %current
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  %rcc.tmp.126 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.127 = getelementptr [1000 x i32], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %current
  %rcc.tmp.130 = load i32, ptr %node_count
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %node_count
  br label %while.cond.2
while.end.2:
  %rcc.tmp.134 = load i32, ptr %list_index
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  store i32 %rcc.tmp.135, ptr %list_index
  br label %while.cond
while.end:
  %rcc.tmp.138 = load i32, ptr %unique_count
  ret i32 %rcc.tmp.138
}
define i32 @complexListManipulations.([1000 x i32]* %memory_pool.tmp, [10 x i32]* %list_heads.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %list_heads..local = alloca [10 x i32] 
  %manipulation_score = alloca i32 
  %list_index = alloca i32 
  %rotate_amount = alloca i32 
  %removed_count = alloca i32 
  %interleave_result = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.2
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 1
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.8, ptr %rcc.tmp.7
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 2
  %rcc.tmp.11 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 3
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 4
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 4
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 5
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 5
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 6
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 6
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 7
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 7
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 8
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 8
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 9
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 9
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  store i32 0, ptr %manipulation_score
  store i32 0, ptr %list_index
  br label %while.cond
while.cond:
  %rcc.tmp.45 = load i32, ptr %list_index
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.45, 10
  br i1 %rcc.tmp.46, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.49 = load i32, ptr %list_index
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %rotate_amount
  %rcc.tmp.52 = load i32, ptr %list_index
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.56 = load i32, ptr %list_index
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rotate_amount
  %rcc.tmp.61 = call i32 @rotateList.([1000 x i32]* %rcc.tmp.55, i32 %rcc.tmp.59, i32 %rcc.tmp.60)
  store i32 %rcc.tmp.61, ptr %rcc.tmp.54
  %rcc.tmp.63 = load i32, ptr %list_index
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %list_index
  br label %while.cond
while.end:
  %rcc.tmp.67 = load i32, ptr %manipulation_score
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 10
  store i32 %rcc.tmp.68, ptr %manipulation_score
  store i32 0, ptr %list_index
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.72 = load i32, ptr %list_index
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.72, 10
  br i1 %rcc.tmp.73, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.76 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.77 = load i32, ptr %list_index
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = call i32 @removeDuplicates.([1000 x i32]* %rcc.tmp.76, i32 %rcc.tmp.80)
  store i32 %rcc.tmp.81, ptr %removed_count
  %rcc.tmp.83 = load i32, ptr %manipulation_score
  %rcc.tmp.84 = load i32, ptr %removed_count
  %rcc.tmp.85 = add i32 %rcc.tmp.83, %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %manipulation_score
  %rcc.tmp.87 = load i32, ptr %list_index
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %list_index
  br label %while.cond.2
while.end.2:
  %rcc.tmp.91 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.92 = call i32 @interleaveLists.([1000 x i32]* %rcc.tmp.91, [10 x i32]* %list_heads..local)
  store i32 %rcc.tmp.92, ptr %interleave_result
  %rcc.tmp.94 = load i32, ptr %manipulation_score
  %rcc.tmp.95 = load i32, ptr %interleave_result
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  store i32 %rcc.tmp.96, ptr %manipulation_score
  %rcc.tmp.98 = load i32, ptr %manipulation_score
  ret i32 %rcc.tmp.98
}
define i32 @rotateList.([1000 x i32]* %memory_pool.tmp, i32 %head.tmp, i32 %k.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %head..tmp = alloca i32 
  %k..tmp = alloca i32 
  %length = alloca i32 
  %last = alloca i32 
  %effective_k = alloca i32 
  %new_tail = alloca i32 
  %steps = alloca i32 
  %new_head = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 %k.tmp, ptr %k..tmp
  %rcc.tmp.4 = load i32, ptr %head..tmp
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %k..tmp
  %rcc.tmp.8 = icmp sle i32 %rcc.tmp.7, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %head..tmp
  ret i32 %rcc.tmp.12
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %length
  %rcc.tmp.16 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.16, ptr %last
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %last
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.23 = getelementptr [1000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp ne i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.27 = load i32, ptr %length
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.30 = phi i1 [0, %while.cond], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %last
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  %rcc.tmp.36 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.37 = getelementptr [1000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %last
  %rcc.tmp.40 = load i32, ptr %length
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %length
  br label %while.cond
while.end:
  %rcc.tmp.44 = load i32, ptr %k..tmp
  %rcc.tmp.45 = load i32, ptr %length
  %rcc.tmp.46 = srem i32 %rcc.tmp.44, %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %effective_k
  %rcc.tmp.48 = load i32, ptr %effective_k
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 0
  br i1 %rcc.tmp.49, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.51 = load i32, ptr %head..tmp
  ret i32 %rcc.tmp.51
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.54 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.54, ptr %new_tail
  store i32 0, ptr %steps
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.58 = load i32, ptr %steps
  %rcc.tmp.59 = load i32, ptr %length
  %rcc.tmp.60 = load i32, ptr %effective_k
  %rcc.tmp.61 = sub i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = sub i32 %rcc.tmp.61, 1
  %rcc.tmp.63 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.62
  br i1 %rcc.tmp.63, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.65 = load i32, ptr %new_tail
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.69 = getelementptr [1000 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = icmp ne i32 %rcc.tmp.70, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.73 = phi i1 [0, %while.cond.2], [%rcc.tmp.71, %and.rhs.2]
  br i1 %rcc.tmp.73, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.76 = load i32, ptr %new_tail
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  %rcc.tmp.79 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.80 = getelementptr [1000 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %new_tail
  %rcc.tmp.83 = load i32, ptr %steps
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %steps
  br label %while.cond.2
while.end.2:
  %rcc.tmp.87 = load i32, ptr %new_tail
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  %rcc.tmp.90 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.91 = getelementptr [1000 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  store i32 %rcc.tmp.92, ptr %new_head
  %rcc.tmp.94 = load i32, ptr %new_tail
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  %rcc.tmp.97 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.98 = getelementptr [1000 x i32], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.96
  store i32 0, ptr %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %last
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  %rcc.tmp.103 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.104 = getelementptr [1000 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.105, ptr %rcc.tmp.104
  %rcc.tmp.107 = load i32, ptr %new_head
  ret i32 %rcc.tmp.107
}
define i32 @removeDuplicates.([1000 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %head..tmp = alloca i32 
  %removed_count = alloca i32 
  %current = alloca i32 
  %iter_count = alloca i32 
  %next_node = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 0, ptr %removed_count
  %rcc.tmp.4 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.4, ptr %current
  store i32 0, ptr %iter_count
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %current
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load i32, ptr %current
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.15 = getelementptr [1000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp ne i32 %rcc.tmp.16, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.19 = phi i1 [0, %while.cond], [%rcc.tmp.17, %and.rhs]
  br i1 %rcc.tmp.19, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.21 = load i32, ptr %iter_count
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.24 = phi i1 [0, %sc.merge], [%rcc.tmp.22, %and.rhs.2]
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %current
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.31 = getelementptr [1000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %next_node
  %rcc.tmp.34 = load i32, ptr %current
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.37 = getelementptr [1000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %next_node
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.42 = getelementptr [1000 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.38, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then, label %if.else
if.then:
  %rcc.tmp.46 = load i32, ptr %current
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.50 = getelementptr [1000 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %next_node
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.55 = getelementptr [1000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %rcc.tmp.50
  %rcc.tmp.58 = load i32, ptr %removed_count
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %removed_count
  br label %if.merge
if.else:
  %rcc.tmp.62 = load i32, ptr %current
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  %rcc.tmp.65 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.66 = getelementptr [1000 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %current
  br label %if.merge
if.merge:
  %rcc.tmp.70 = load i32, ptr %iter_count
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %iter_count
  br label %while.cond
while.end:
  %rcc.tmp.74 = load i32, ptr %removed_count
  ret i32 %rcc.tmp.74
}
define i32 @interleaveLists.([1000 x i32]* %memory_pool.tmp, [10 x i32]* %list_heads.tmp) {
entry:
  %memory_pool..tmp = alloca [1000 x i32]* 
  %list_heads..local = alloca [10 x i32] 
  %interleave_count = alloca i32 
  %active_lists = alloca [10 x i32] 
  %active_count = alloca i32 
  %i = alloca i32 
  %new_active_count = alloca i32 
  store [1000 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.2
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 1
  %rcc.tmp.7 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.8, ptr %rcc.tmp.7
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 2
  %rcc.tmp.11 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 3
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 4
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 4
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 5
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 5
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 6
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 6
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 7
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 7
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 8
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 8
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %list_heads.tmp, i32 0, i32 9
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 9
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  store i32 0, ptr %interleave_count
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.61
  store i32 0, ptr %active_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 10
  br i1 %rcc.tmp.67, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = icmp ne i32 %rcc.tmp.73, 0
  br i1 %rcc.tmp.74, label %if.then, label %if.else
if.then:
  %rcc.tmp.76 = load i32, ptr %active_count
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [10 x i32], ptr %list_heads..local, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %rcc.tmp.78
  %rcc.tmp.84 = load i32, ptr %active_count
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %active_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %i
  br label %while.cond
while.end:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.94 = load i32, ptr %active_count
  %rcc.tmp.95 = icmp sgt i32 %rcc.tmp.94, 0
  br i1 %rcc.tmp.95, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.97 = load i32, ptr %interleave_count
  %rcc.tmp.98 = icmp slt i32 %rcc.tmp.97, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.100 = phi i1 [0, %while.cond.2], [%rcc.tmp.98, %and.rhs]
  br i1 %rcc.tmp.100, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %new_active_count
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = load i32, ptr %active_count
  %rcc.tmp.108 = icmp slt i32 %rcc.tmp.106, %rcc.tmp.107
  br i1 %rcc.tmp.108, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = icmp ne i32 %rcc.tmp.114, 0
  br i1 %rcc.tmp.115, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.117 = load i32, ptr %interleave_count
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %interleave_count
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = load [1000 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.130 = getelementptr [1000 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  store i32 %rcc.tmp.131, ptr %rcc.tmp.122
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  %rcc.tmp.137 = icmp ne i32 %rcc.tmp.136, 0
  br i1 %rcc.tmp.137, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.139 = load i32, ptr %new_active_count
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 0
  %rcc.tmp.141 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = getelementptr [10 x i32], ptr %active_lists, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %rcc.tmp.144
  store i32 %rcc.tmp.145, ptr %rcc.tmp.141
  %rcc.tmp.147 = load i32, ptr %new_active_count
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 1
  store i32 %rcc.tmp.148, ptr %new_active_count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.154 = load i32, ptr %i
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.158 = load i32, ptr %new_active_count
  store i32 %rcc.tmp.158, ptr %active_count
  br label %while.cond.2
while.end.2:
  %rcc.tmp.161 = load i32, ptr %interleave_count
  ret i32 %rcc.tmp.161
}
define void @performListPerformanceTest.() {
entry:
  %large_memory = alloca [1800 x i32] 
  %fill.idx = alloca i32 
  %stress_head = alloca i32 
  %allocated_nodes = alloca i32 
  %value = alloca i32 
  %node_index = alloca i32 
  %traversal_sum = alloca i32 
  %round = alloca i32 
  %modification_result = alloca i32 
  %search_result = alloca i32 
  call void @printlnInt.(i32 1620)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1800
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1800 x i32], ptr %large_memory, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %stress_head
  store i32 0, ptr %allocated_nodes
  store i32 1, ptr %value
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %value
  %rcc.tmp.18 = icmp sle i32 %rcc.tmp.17, 800
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.20 = load i32, ptr %value
  %rcc.tmp.21 = mul i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 1800
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %while.cond], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %value
  %rcc.tmp.28 = mul i32 %rcc.tmp.27, 2
  store i32 %rcc.tmp.28, ptr %node_index
  %rcc.tmp.30 = load i32, ptr %node_index
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [1800 x i32], ptr %large_memory, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %value
  %rcc.tmp.34 = load i32, ptr %value
  %rcc.tmp.35 = mul i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 10000
  store i32 %rcc.tmp.36, ptr %rcc.tmp.32
  %rcc.tmp.38 = load i32, ptr %node_index
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  %rcc.tmp.41 = getelementptr [1800 x i32], ptr %large_memory, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %stress_head
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %node_index
  store i32 %rcc.tmp.44, ptr %stress_head
  %rcc.tmp.46 = load i32, ptr %allocated_nodes
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %allocated_nodes
  %rcc.tmp.49 = load i32, ptr %value
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %value
  br label %while.cond
while.end:
  store i32 0, ptr %traversal_sum
  store i32 0, ptr %round
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.56 = load i32, ptr %round
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.56, 5
  br i1 %rcc.tmp.57, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.60 = load i32, ptr %traversal_sum
  %rcc.tmp.61 = load i32, ptr %stress_head
  %rcc.tmp.62 = load i32, ptr %round
  %rcc.tmp.63 = call i32 @stressTraversal.([1800 x i32]* %large_memory, i32 %rcc.tmp.61, i32 %rcc.tmp.62)
  %rcc.tmp.64 = add i32 %rcc.tmp.60, %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %traversal_sum
  %rcc.tmp.66 = load i32, ptr %round
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %round
  br label %while.cond.2
while.end.2:
  %rcc.tmp.70 = load i32, ptr %traversal_sum
  call void @printlnInt.(i32 %rcc.tmp.70)
  %rcc.tmp.72 = load i32, ptr %stress_head
  %rcc.tmp.73 = call i32 @stressModifications.([1800 x i32]* %large_memory, i32 %rcc.tmp.72)
  store i32 %rcc.tmp.73, ptr %modification_result
  %rcc.tmp.75 = load i32, ptr %modification_result
  call void @printlnInt.(i32 %rcc.tmp.75)
  %rcc.tmp.77 = load i32, ptr %stress_head
  %rcc.tmp.78 = call i32 @stressPatternSearch.([1800 x i32]* %large_memory, i32 %rcc.tmp.77)
  store i32 %rcc.tmp.78, ptr %search_result
  %rcc.tmp.80 = load i32, ptr %search_result
  call void @printlnInt.(i32 %rcc.tmp.80)
  ret void
}
define i32 @stressTraversal.([1800 x i32]* %memory_pool.tmp, i32 %head.tmp, i32 %pattern.tmp) {
entry:
  %memory_pool..tmp = alloca [1800 x i32]* 
  %head..tmp = alloca i32 
  %pattern..tmp = alloca i32 
  %sum = alloca i32 
  %current = alloca i32 
  %step_count = alloca i32 
  %skip_count = alloca i32 
  store [1800 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 %pattern.tmp, ptr %pattern..tmp
  store i32 0, ptr %sum
  %rcc.tmp.5 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.5, ptr %current
  store i32 0, ptr %step_count
  %rcc.tmp.8 = load i32, ptr %pattern..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %skip_count
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %current
  %rcc.tmp.13 = icmp ne i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.15 = load i32, ptr %step_count
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 800
  br label %sc.merge
sc.merge:
  %rcc.tmp.18 = phi i1 [0, %while.cond], [%rcc.tmp.16, %and.rhs]
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %step_count
  %rcc.tmp.22 = load i32, ptr %skip_count
  %rcc.tmp.23 = srem i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 0
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %sum
  %rcc.tmp.27 = load i32, ptr %current
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.30 = getelementptr [1800 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.26, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %sum
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %current
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.40 = getelementptr [1800 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %current
  %rcc.tmp.43 = load i32, ptr %step_count
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %step_count
  br label %while.cond
while.end:
  %rcc.tmp.47 = load i32, ptr %sum
  %rcc.tmp.48 = srem i32 %rcc.tmp.47, 100000
  ret i32 %rcc.tmp.48
}
define i32 @stressModifications.([1800 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [1800 x i32]* 
  %head..tmp = alloca i32 
  %modification_count = alloca i32 
  %current = alloca i32 
  %position = alloca i32 
  %old_value = alloca i32 
  %new_value = alloca i32 
  store [1800 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 0, ptr %modification_count
  %rcc.tmp.4 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.4, ptr %current
  store i32 0, ptr %position
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %current
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load i32, ptr %position
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 400
  br label %sc.merge
sc.merge:
  %rcc.tmp.14 = phi i1 [0, %while.cond], [%rcc.tmp.12, %and.rhs]
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %current
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.20 = getelementptr [1800 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %old_value
  %rcc.tmp.23 = load i32, ptr %old_value
  %rcc.tmp.24 = mul i32 %rcc.tmp.23, 3
  %rcc.tmp.25 = load i32, ptr %position
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 7
  %rcc.tmp.27 = add i32 %rcc.tmp.24, %rcc.tmp.26
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 1000
  store i32 %rcc.tmp.28, ptr %new_value
  %rcc.tmp.30 = load i32, ptr %current
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.33 = getelementptr [1800 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %new_value
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %new_value
  %rcc.tmp.37 = load i32, ptr %old_value
  %rcc.tmp.38 = icmp sgt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %if.then, label %if.else
if.then:
  %rcc.tmp.40 = load i32, ptr %modification_count
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %modification_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %current
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  %rcc.tmp.48 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.49 = getelementptr [1800 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %current
  %rcc.tmp.52 = load i32, ptr %position
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %position
  br label %while.cond
while.end:
  %rcc.tmp.56 = load i32, ptr %modification_count
  ret i32 %rcc.tmp.56
}
define i32 @stressPatternSearch.([1800 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..tmp = alloca [1800 x i32]* 
  %head..tmp = alloca i32 
  %pattern_matches = alloca i32 
  %current = alloca i32 
  %position = alloca i32 
  %value = alloca i32 
  store [1800 x i32]* %memory_pool.tmp, ptr %memory_pool..tmp
  store i32 %head.tmp, ptr %head..tmp
  store i32 0, ptr %pattern_matches
  %rcc.tmp.4 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.4, ptr %current
  store i32 0, ptr %position
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %current
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load i32, ptr %position
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 600
  br label %sc.merge
sc.merge:
  %rcc.tmp.14 = phi i1 [0, %while.cond], [%rcc.tmp.12, %and.rhs]
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %current
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.20 = getelementptr [1800 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %value
  %rcc.tmp.23 = load i32, ptr %value
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 7
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 3
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %pattern_matches
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %pattern_matches
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %value
  %rcc.tmp.33 = icmp sgt i32 %rcc.tmp.32, 100
  br i1 %rcc.tmp.33, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.35 = load i32, ptr %value
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 500
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.38 = phi i1 [0, %if.merge], [%rcc.tmp.36, %and.rhs.2]
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load i32, ptr %pattern_matches
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 2
  store i32 %rcc.tmp.41, ptr %pattern_matches
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.45 = load i32, ptr %position
  %rcc.tmp.46 = srem i32 %rcc.tmp.45, 10
  %rcc.tmp.47 = load i32, ptr %value
  %rcc.tmp.48 = srem i32 %rcc.tmp.47, 10
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.46, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.51 = load i32, ptr %pattern_matches
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 3
  store i32 %rcc.tmp.52, ptr %pattern_matches
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.56 = load i32, ptr %current
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  %rcc.tmp.59 = load [1800 x i32]*, ptr %memory_pool..tmp
  %rcc.tmp.60 = getelementptr [1800 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %current
  %rcc.tmp.63 = load i32, ptr %position
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %position
  br label %while.cond
while.end:
  %rcc.tmp.67 = load i32, ptr %pattern_matches
  ret i32 %rcc.tmp.67
}
define void @testEdgeCases.() {
entry:
  call void @printlnInt.(i32 1630)
  call void @testEmptyListOperations.()
  call void @testSingleNodeOperations.()
  call void @testMemoryBoundaries.()
  call void @testCircularListDetection.()
  call void @printlnInt.(i32 1639)
  ret void
}
define void @testEmptyListOperations.() {
entry:
  %empty_memory = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %empty_head = alloca i32 
  %sum = alloca i32 
  %reversed = alloca i32 
  %search_result = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %empty_memory, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %empty_head
  %rcc.tmp.13 = load i32, ptr %empty_head
  %rcc.tmp.14 = call i32 @calculateListSum.([2000 x i32]* %empty_memory, i32 %rcc.tmp.13)
  store i32 %rcc.tmp.14, ptr %sum
  %rcc.tmp.16 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = load i32, ptr %empty_head
  %rcc.tmp.19 = call i32 @reverseList.([2000 x i32]* %empty_memory, i32 %rcc.tmp.18)
  store i32 %rcc.tmp.19, ptr %reversed
  %rcc.tmp.21 = load i32, ptr %reversed
  call void @printlnInt.(i32 %rcc.tmp.21)
  %rcc.tmp.23 = load i32, ptr %empty_head
  %rcc.tmp.24 = call i32 @complexListSearch.([2000 x i32]* %empty_memory, i32 %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %search_result
  %rcc.tmp.26 = load i32, ptr %search_result
  call void @printlnInt.(i32 %rcc.tmp.26)
  ret void
}
define void @testSingleNodeOperations.() {
entry:
  %single_memory = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %single_head = alloca i32 
  %sum = alloca i32 
  %reversed = alloca i32 
  %sorted_check = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %single_memory, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.12 = getelementptr [2000 x i32], ptr %single_memory, i32 0, i32 1
  store i32 42, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [2000 x i32], ptr %single_memory, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.14
  store i32 1, ptr %single_head
  %rcc.tmp.17 = load i32, ptr %single_head
  %rcc.tmp.18 = call i32 @calculateListSum.([2000 x i32]* %single_memory, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %sum
  %rcc.tmp.20 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = load i32, ptr %single_head
  %rcc.tmp.23 = call i32 @reverseList.([2000 x i32]* %single_memory, i32 %rcc.tmp.22)
  store i32 %rcc.tmp.23, ptr %reversed
  %rcc.tmp.25 = load i32, ptr %reversed
  call void @printlnInt.(i32 %rcc.tmp.25)
  %rcc.tmp.27 = load i32, ptr %single_head
  %rcc.tmp.28 = call i32 @verifySorted.([2000 x i32]* %single_memory, i32 %rcc.tmp.27)
  store i32 %rcc.tmp.28, ptr %sorted_check
  %rcc.tmp.30 = load i32, ptr %sorted_check
  call void @printlnInt.(i32 %rcc.tmp.30)
  ret void
}
define void @testMemoryBoundaries.() {
entry:
  %boundary_memory = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %boundary_head = alloca i32 
  %sum = alloca i32 
  %allocated = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.12 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 1
  store i32 100, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 2
  store i32 3, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 3
  store i32 200, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 4
  store i32 5, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 5
  store i32 300, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 6
  store i32 7, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 7
  store i32 400, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [2000 x i32], ptr %boundary_memory, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.26
  store i32 1, ptr %boundary_head
  %rcc.tmp.29 = load i32, ptr %boundary_head
  %rcc.tmp.30 = call i32 @calculateListSum.([2000 x i32]* %boundary_memory, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %sum
  %rcc.tmp.32 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.32)
  %rcc.tmp.34 = call i32 @allocateNode.([2000 x i32]* %boundary_memory, i32 9)
  store i32 %rcc.tmp.34, ptr %allocated
  %rcc.tmp.36 = load i32, ptr %allocated
  call void @printlnInt.(i32 %rcc.tmp.36)
  ret void
}
define void @testCircularListDetection.() {
entry:
  %circular_memory = alloca [20 x i32] 
  %fill.idx = alloca i32 
  %circular_head = alloca i32 
  %limited_sum = alloca i32 
  %has_cycle = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 20
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.12 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 1
  store i32 111, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 2
  store i32 3, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 3
  store i32 222, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 4
  store i32 5, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 5
  store i32 333, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [20 x i32], ptr %circular_memory, i32 0, i32 6
  store i32 1, ptr %rcc.tmp.22
  store i32 1, ptr %circular_head
  %rcc.tmp.25 = load i32, ptr %circular_head
  %rcc.tmp.26 = call i32 @safeTraverseWithLimit.([20 x i32]* %circular_memory, i32 %rcc.tmp.25, i32 10)
  store i32 %rcc.tmp.26, ptr %limited_sum
  %rcc.tmp.28 = load i32, ptr %limited_sum
  call void @printlnInt.(i32 %rcc.tmp.28)
  %rcc.tmp.30 = load i32, ptr %circular_head
  %rcc.tmp.31 = call i32 @detectCycle.([20 x i32]* %circular_memory, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %has_cycle
  %rcc.tmp.33 = load i32, ptr %has_cycle
  call void @printlnInt.(i32 %rcc.tmp.33)
  ret void
}
define i32 @safeTraverseWithLimit.([20 x i32]* %memory_pool.tmp, i32 %head.tmp, i32 %max_steps.tmp) {
entry:
  %memory_pool..local = alloca [20 x i32] 
  %head..tmp = alloca i32 
  %max_steps..tmp = alloca i32 
  %sum = alloca i32 
  %current = alloca i32 
  %steps = alloca i32 
  %rcc.tmp.1 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  store i32 %head.tmp, ptr %head..tmp
  store i32 %max_steps.tmp, ptr %max_steps..tmp
  store i32 0, ptr %sum
  %rcc.tmp.84 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.84, ptr %current
  store i32 0, ptr %steps
  br label %while.cond
while.cond:
  %rcc.tmp.88 = load i32, ptr %current
  %rcc.tmp.89 = icmp ne i32 %rcc.tmp.88, 0
  br i1 %rcc.tmp.89, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.91 = load i32, ptr %steps
  %rcc.tmp.92 = load i32, ptr %max_steps..tmp
  %rcc.tmp.93 = icmp slt i32 %rcc.tmp.91, %rcc.tmp.92
  br label %sc.merge
sc.merge:
  %rcc.tmp.95 = phi i1 [0, %while.cond], [%rcc.tmp.93, %and.rhs]
  br i1 %rcc.tmp.95, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.98 = load i32, ptr %sum
  %rcc.tmp.99 = load i32, ptr %current
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.98, %rcc.tmp.102
  store i32 %rcc.tmp.103, ptr %sum
  %rcc.tmp.105 = load i32, ptr %current
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  store i32 %rcc.tmp.109, ptr %current
  %rcc.tmp.111 = load i32, ptr %steps
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.112, ptr %steps
  br label %while.cond
while.end:
  %rcc.tmp.115 = load i32, ptr %sum
  ret i32 %rcc.tmp.115
}
define i32 @detectCycle.([20 x i32]* %memory_pool.tmp, i32 %head.tmp) {
entry:
  %memory_pool..local = alloca [20 x i32] 
  %head..tmp = alloca i32 
  %slow = alloca i32 
  %fast = alloca i32 
  %step_count = alloca i32 
  %rcc.tmp.1 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [20 x i32], ptr %memory_pool.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  store i32 %head.tmp, ptr %head..tmp
  %rcc.tmp.82 = load i32, ptr %head..tmp
  %rcc.tmp.83 = icmp eq i32 %rcc.tmp.82, 0
  br i1 %rcc.tmp.83, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.87 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.87, ptr %slow
  %rcc.tmp.89 = load i32, ptr %head..tmp
  store i32 %rcc.tmp.89, ptr %fast
  store i32 0, ptr %step_count
  br label %while.cond
while.cond:
  %rcc.tmp.93 = load i32, ptr %step_count
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.93, 15
  br i1 %rcc.tmp.94, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.97 = load i32, ptr %slow
  %rcc.tmp.98 = icmp ne i32 %rcc.tmp.97, 0
  br i1 %rcc.tmp.98, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.100 = load i32, ptr %slow
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  %rcc.tmp.103 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  store i32 %rcc.tmp.104, ptr %slow
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.108 = load i32, ptr %fast
  %rcc.tmp.109 = icmp ne i32 %rcc.tmp.108, 0
  br i1 %rcc.tmp.109, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.111 = load i32, ptr %fast
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 1
  %rcc.tmp.114 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  store i32 %rcc.tmp.115, ptr %fast
  %rcc.tmp.117 = load i32, ptr %fast
  %rcc.tmp.118 = icmp ne i32 %rcc.tmp.117, 0
  br i1 %rcc.tmp.118, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.120 = load i32, ptr %fast
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  %rcc.tmp.123 = getelementptr [20 x i32], ptr %memory_pool..local, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %fast
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.130 = load i32, ptr %slow
  %rcc.tmp.131 = icmp ne i32 %rcc.tmp.130, 0
  br i1 %rcc.tmp.131, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.133 = load i32, ptr %fast
  %rcc.tmp.134 = icmp ne i32 %rcc.tmp.133, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.136 = phi i1 [0, %if.merge.3], [%rcc.tmp.134, %and.rhs]
  br i1 %rcc.tmp.136, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.138 = load i32, ptr %slow
  %rcc.tmp.139 = load i32, ptr %fast
  %rcc.tmp.140 = icmp eq i32 %rcc.tmp.138, %rcc.tmp.139
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.142 = phi i1 [0, %sc.merge], [%rcc.tmp.140, %and.rhs.2]
  br i1 %rcc.tmp.142, label %if.then.5, label %if.else.5
if.then.5:
  ret i32 1
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.146 = load i32, ptr %fast
  %rcc.tmp.147 = icmp eq i32 %rcc.tmp.146, 0
  br i1 %rcc.tmp.147, label %if.then.6, label %if.else.6
if.then.6:
  ret i32 0
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.151 = load i32, ptr %step_count
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 1
  store i32 %rcc.tmp.152, ptr %step_count
  br label %while.cond
while.end:
  ret i32 0
}
