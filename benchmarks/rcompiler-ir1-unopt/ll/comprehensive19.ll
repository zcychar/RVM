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
%ListNode = type {i32, i32}
%HashEntry = type {i32, i32, i32, i1}
%Stack = type {[500 x i32], i32, i32}
%Queue = type {[500 x i32], i32, i32, i32, i32}
%MemoryPool = type {[2000 x %ListNode], i32, i32, i32}
%HashTable = type {[127 x i32], [1000 x %HashEntry], i32}
%LinkedListManager = type {[10 x i32], i32, i32}
define void @init_memory_pool.(%MemoryPool* sret(%MemoryPool) %ret.slot) {
entry:
  %pool = alloca %MemoryPool 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr %MemoryPool, ptr %pool, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = getelementptr %ListNode, ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr %ListNode, ptr %rcc.tmp.8, i32 0, i32 1
  store i32 -1, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.16 = getelementptr %MemoryPool, ptr %pool, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr %MemoryPool, ptr %pool, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr %MemoryPool, ptr %pool, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.20
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = sub i32 2000, 1
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = getelementptr %MemoryPool, ptr %pool, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %ListNode, ptr %rcc.tmp.31, i32 0, i32 1
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %rcc.tmp.32
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.40 = getelementptr %MemoryPool, ptr %pool, i32 0, i32 0
  %rcc.tmp.41 = add i32 2000, 0
  %rcc.tmp.42 = sub i32 %rcc.tmp.41, 1
  %rcc.tmp.43 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = getelementptr %ListNode, ptr %rcc.tmp.43, i32 0, i32 1
  store i32 -1, ptr %rcc.tmp.44
  %rcc.tmp.46 = bitcast %MemoryPool* %ret.slot to i8*
  %rcc.tmp.47 = bitcast %MemoryPool* %pool to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.46, i8* %rcc.tmp.47, i32 16012, i1 0)
  ret void
}
define i32 @allocate_node.(%MemoryPool* %pool.tmp, i32 %data.tmp) {
entry:
  %pool..tmp = alloca %MemoryPool* 
  %data..tmp = alloca i32 
  %allocated_index = alloca i32 
  %allocated_index.2 = alloca i32 
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %data.tmp, ptr %data..tmp
  %rcc.tmp.3 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.4 = getelementptr %MemoryPool, ptr %rcc.tmp.3, i32 0, i32 1
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, -1
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 -1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.11 = getelementptr %MemoryPool, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %allocated_index
  %rcc.tmp.14 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.15 = getelementptr %MemoryPool, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %allocated_index.2
  %rcc.tmp.18 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.19 = getelementptr %MemoryPool, ptr %rcc.tmp.18, i32 0, i32 1
  %rcc.tmp.20 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.21 = getelementptr %MemoryPool, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %allocated_index.2
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = getelementptr %ListNode, ptr %rcc.tmp.24, i32 0, i32 1
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %rcc.tmp.19
  %rcc.tmp.28 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.29 = getelementptr %MemoryPool, ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %allocated_index.2
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %ListNode, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %data..tmp
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.37 = getelementptr %MemoryPool, ptr %rcc.tmp.36, i32 0, i32 0
  %rcc.tmp.38 = load i32, ptr %allocated_index.2
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %ListNode, ptr %rcc.tmp.40, i32 0, i32 1
  store i32 -1, ptr %rcc.tmp.41
  %rcc.tmp.43 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.44 = getelementptr %MemoryPool, ptr %rcc.tmp.43, i32 0, i32 2
  %rcc.tmp.45 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.46 = getelementptr %MemoryPool, ptr %rcc.tmp.45, i32 0, i32 2
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %rcc.tmp.44
  %rcc.tmp.50 = load i32, ptr %allocated_index.2
  ret i32 %rcc.tmp.50
}
define void @deallocate_node.(%MemoryPool* %pool.tmp, i32 %index.tmp) {
entry:
  %pool..tmp = alloca %MemoryPool* 
  %index..tmp = alloca i32 
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.3 = load i32, ptr %index..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, -1
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.9 = getelementptr %MemoryPool, ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = load i32, ptr %index..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %ListNode, ptr %rcc.tmp.12, i32 0, i32 1
  %rcc.tmp.14 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.15 = getelementptr %MemoryPool, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %rcc.tmp.13
  %rcc.tmp.18 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.19 = getelementptr %MemoryPool, ptr %rcc.tmp.18, i32 0, i32 1
  %rcc.tmp.20 = load i32, ptr %index..tmp
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.23 = getelementptr %MemoryPool, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.25 = getelementptr %MemoryPool, ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = sub i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %rcc.tmp.23
  ret void
}
define void @init_stack.(%Stack* sret(%Stack) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %rcc.tmp.1 = getelementptr %Stack, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [500 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %Stack, ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = getelementptr %Stack, ptr %ret.slot, i32 0, i32 2
  store i32 500, ptr %rcc.tmp.16
  ret void
}
define i1 @stack_push.(%Stack* %stack.tmp, i32 %value.tmp) {
entry:
  %stack..tmp = alloca %Stack* 
  %value..tmp = alloca i32 
  store %Stack* %stack.tmp, ptr %stack..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.3 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.4 = getelementptr %Stack, ptr %rcc.tmp.3, i32 0, i32 1
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.7 = getelementptr %Stack, ptr %rcc.tmp.6, i32 0, i32 2
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = icmp sge i32 %rcc.tmp.5, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.15 = getelementptr %Stack, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.17 = getelementptr %Stack, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %rcc.tmp.15
  %rcc.tmp.21 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.22 = getelementptr %Stack, ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.24 = getelementptr %Stack, ptr %rcc.tmp.23, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [500 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  ret i1 1
}
define i32 @stack_pop.(%Stack* %stack.tmp) {
entry:
  %stack..tmp = alloca %Stack* 
  %value = alloca i32 
  %value.2 = alloca i32 
  store %Stack* %stack.tmp, ptr %stack..tmp
  %rcc.tmp.2 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.3 = getelementptr %Stack, ptr %rcc.tmp.2, i32 0, i32 1
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = sub i32 0, 999999
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.11 = getelementptr %Stack, ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.13 = getelementptr %Stack, ptr %rcc.tmp.12, i32 0, i32 1
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [500 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %value
  %rcc.tmp.19 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.20 = getelementptr %Stack, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.22 = getelementptr %Stack, ptr %rcc.tmp.21, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [500 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %value.2
  %rcc.tmp.28 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.29 = getelementptr %Stack, ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.31 = getelementptr %Stack, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = sub i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %rcc.tmp.29
  %rcc.tmp.35 = load i32, ptr %value.2
  ret i32 %rcc.tmp.35
}
define i1 @stack_is_empty.(%Stack* %stack.tmp) {
entry:
  %stack..tmp = alloca %Stack* 
  store %Stack* %stack.tmp, ptr %stack..tmp
  %rcc.tmp.2 = load %Stack*, ptr %stack..tmp
  %rcc.tmp.3 = getelementptr %Stack, ptr %rcc.tmp.2, i32 0, i32 1
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 0
  ret i1 %rcc.tmp.5
}
define void @init_queue.(%Queue* sret(%Queue) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %rcc.tmp.1 = getelementptr %Queue, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [500 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %Queue, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Queue, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr %Queue, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Queue, ptr %ret.slot, i32 0, i32 4
  store i32 500, ptr %rcc.tmp.19
  ret void
}
define i1 @queue_enqueue.(%Queue* %queue.tmp, i32 %value.tmp) {
entry:
  %queue..tmp = alloca %Queue* 
  %value..tmp = alloca i32 
  store %Queue* %queue.tmp, ptr %queue..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.3 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.4 = getelementptr %Queue, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.7 = getelementptr %Queue, ptr %rcc.tmp.6, i32 0, i32 4
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.13 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.14 = getelementptr %Queue, ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.16 = getelementptr %Queue, ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [500 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.23 = getelementptr %Queue, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.25 = getelementptr %Queue, ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  %rcc.tmp.28 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.29 = getelementptr %Queue, ptr %rcc.tmp.28, i32 0, i32 4
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = srem i32 %rcc.tmp.27, %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %rcc.tmp.23
  %rcc.tmp.33 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.34 = getelementptr %Queue, ptr %rcc.tmp.33, i32 0, i32 3
  %rcc.tmp.35 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.36 = getelementptr %Queue, ptr %rcc.tmp.35, i32 0, i32 3
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %rcc.tmp.34
  ret i1 1
}
define i32 @queue_dequeue.(%Queue* %queue.tmp) {
entry:
  %queue..tmp = alloca %Queue* 
  %value = alloca i32 
  %value.2 = alloca i32 
  store %Queue* %queue.tmp, ptr %queue..tmp
  %rcc.tmp.2 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.3 = getelementptr %Queue, ptr %rcc.tmp.2, i32 0, i32 3
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = sub i32 0, 999999
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.11 = getelementptr %Queue, ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.13 = getelementptr %Queue, ptr %rcc.tmp.12, i32 0, i32 1
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [500 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %value
  %rcc.tmp.19 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.20 = getelementptr %Queue, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.22 = getelementptr %Queue, ptr %rcc.tmp.21, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [500 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %value.2
  %rcc.tmp.28 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.29 = getelementptr %Queue, ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.31 = getelementptr %Queue, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  %rcc.tmp.34 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.35 = getelementptr %Queue, ptr %rcc.tmp.34, i32 0, i32 4
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = srem i32 %rcc.tmp.33, %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %rcc.tmp.29
  %rcc.tmp.39 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.40 = getelementptr %Queue, ptr %rcc.tmp.39, i32 0, i32 3
  %rcc.tmp.41 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.42 = getelementptr %Queue, ptr %rcc.tmp.41, i32 0, i32 3
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = sub i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %rcc.tmp.40
  %rcc.tmp.46 = load i32, ptr %value.2
  ret i32 %rcc.tmp.46
}
define i1 @queue_is_empty.(%Queue* %queue.tmp) {
entry:
  %queue..tmp = alloca %Queue* 
  store %Queue* %queue.tmp, ptr %queue..tmp
  %rcc.tmp.2 = load %Queue*, ptr %queue..tmp
  %rcc.tmp.3 = getelementptr %Queue, ptr %rcc.tmp.2, i32 0, i32 3
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  ret i1 %rcc.tmp.5
}
define i32 @hash_function.(i32 %key.tmp) {
entry:
  %key..tmp = alloca i32 
  %hash = alloca i32 
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.2 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.2, ptr %hash
  %rcc.tmp.4 = load i32, ptr %hash
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 31
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 17
  store i32 %rcc.tmp.6, ptr %hash
  %rcc.tmp.8 = load i32, ptr %hash
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 127
  store i32 %rcc.tmp.9, ptr %hash
  %rcc.tmp.11 = load i32, ptr %hash
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %hash
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 127
  store i32 %rcc.tmp.15, ptr %hash
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %hash
  ret i32 %rcc.tmp.19
}
define void @init_hash_table.(%HashTable* sret(%HashTable) %ret.slot) {
entry:
  %table = alloca %HashTable 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr %HashTable, ptr %table, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 127
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [127 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 -1, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %HashTable, ptr %table, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 1000
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %HashEntry, ptr %rcc.tmp.20, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr %HashEntry, ptr %rcc.tmp.20, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr %HashEntry, ptr %rcc.tmp.20, i32 0, i32 2
  store i32 -1, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr %HashEntry, ptr %rcc.tmp.20, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.29, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.32 = getelementptr %HashTable, ptr %table, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.32
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 1000
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.40 = getelementptr %HashTable, ptr %table, i32 0, i32 1
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = getelementptr %HashEntry, ptr %rcc.tmp.42, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.49 = bitcast %HashTable* %ret.slot to i8*
  %rcc.tmp.50 = bitcast %HashTable* %table to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.49, i8* %rcc.tmp.50, i32 16512, i1 0)
  ret void
}
define i1 @hash_table_insert.(%HashTable* %table.tmp, i32 %key.tmp, i32 %value.tmp) {
entry:
  %table..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %value..tmp = alloca i32 
  %bucket_index = alloca i32 
  %current = alloca i32 
  %entry_index = alloca i32 
  store %HashTable* %table.tmp, ptr %table..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.4 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.5 = getelementptr %HashTable, ptr %rcc.tmp.4, i32 0, i32 2
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = icmp sge i32 %rcc.tmp.6, 1000
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %key..tmp
  %rcc.tmp.12 = call i32 @hash_function.(i32 %rcc.tmp.11)
  store i32 %rcc.tmp.12, ptr %bucket_index
  %rcc.tmp.14 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.15 = getelementptr %HashTable, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %bucket_index
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [127 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.22 = load i32, ptr %current
  %rcc.tmp.23 = icmp ne i32 %rcc.tmp.22, -1
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.27 = getelementptr %HashTable, ptr %rcc.tmp.26, i32 0, i32 1
  %rcc.tmp.28 = load i32, ptr %current
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = getelementptr %HashEntry, ptr %rcc.tmp.30, i32 0, i32 0
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %key..tmp
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.36 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.37 = getelementptr %HashTable, ptr %rcc.tmp.36, i32 0, i32 1
  %rcc.tmp.38 = load i32, ptr %current
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %HashEntry, ptr %rcc.tmp.40, i32 0, i32 1
  %rcc.tmp.42 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.46 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.47 = getelementptr %HashTable, ptr %rcc.tmp.46, i32 0, i32 1
  %rcc.tmp.48 = load i32, ptr %current
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = getelementptr %HashEntry, ptr %rcc.tmp.50, i32 0, i32 2
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %current
  br label %while.cond
while.end:
  store i32 0, ptr %entry_index
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.57 = load i32, ptr %entry_index
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 1000
  br i1 %rcc.tmp.58, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.60 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.61 = getelementptr %HashTable, ptr %rcc.tmp.60, i32 0, i32 1
  %rcc.tmp.62 = load i32, ptr %entry_index
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = getelementptr %HashEntry, ptr %rcc.tmp.64, i32 0, i32 3
  %rcc.tmp.66 = load i1, ptr %rcc.tmp.65
  br label %sc.merge
sc.merge:
  %rcc.tmp.68 = phi i1 [0, %while.cond.2], [%rcc.tmp.66, %and.rhs]
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.71 = load i32, ptr %entry_index
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %entry_index
  br label %while.cond.2
while.end.2:
  %rcc.tmp.75 = load i32, ptr %entry_index
  %rcc.tmp.76 = icmp sge i32 %rcc.tmp.75, 1000
  br i1 %rcc.tmp.76, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.80 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.81 = getelementptr %HashTable, ptr %rcc.tmp.80, i32 0, i32 1
  %rcc.tmp.82 = load i32, ptr %entry_index
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = getelementptr %HashEntry, ptr %rcc.tmp.84, i32 0, i32 0
  %rcc.tmp.86 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.86, ptr %rcc.tmp.85
  %rcc.tmp.88 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.89 = getelementptr %HashTable, ptr %rcc.tmp.88, i32 0, i32 1
  %rcc.tmp.90 = load i32, ptr %entry_index
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = getelementptr %HashEntry, ptr %rcc.tmp.92, i32 0, i32 1
  %rcc.tmp.94 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.94, ptr %rcc.tmp.93
  %rcc.tmp.96 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.97 = getelementptr %HashTable, ptr %rcc.tmp.96, i32 0, i32 1
  %rcc.tmp.98 = load i32, ptr %entry_index
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = getelementptr %HashEntry, ptr %rcc.tmp.100, i32 0, i32 2
  %rcc.tmp.102 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.103 = getelementptr %HashTable, ptr %rcc.tmp.102, i32 0, i32 0
  %rcc.tmp.104 = load i32, ptr %bucket_index
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = getelementptr [127 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.106
  store i32 %rcc.tmp.107, ptr %rcc.tmp.101
  %rcc.tmp.109 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.110 = getelementptr %HashTable, ptr %rcc.tmp.109, i32 0, i32 1
  %rcc.tmp.111 = load i32, ptr %entry_index
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = getelementptr %HashEntry, ptr %rcc.tmp.113, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.114
  %rcc.tmp.116 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.117 = getelementptr %HashTable, ptr %rcc.tmp.116, i32 0, i32 0
  %rcc.tmp.118 = load i32, ptr %bucket_index
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [127 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %entry_index
  store i32 %rcc.tmp.121, ptr %rcc.tmp.120
  %rcc.tmp.123 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.124 = getelementptr %HashTable, ptr %rcc.tmp.123, i32 0, i32 2
  %rcc.tmp.125 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.126 = getelementptr %HashTable, ptr %rcc.tmp.125, i32 0, i32 2
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 1
  store i32 %rcc.tmp.128, ptr %rcc.tmp.124
  ret i1 1
}
define i32 @hash_table_search.(%HashTable* %table.tmp, i32 %key.tmp) {
entry:
  %table..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %bucket_index = alloca i32 
  %current = alloca i32 
  store %HashTable* %table.tmp, ptr %table..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load i32, ptr %key..tmp
  %rcc.tmp.4 = call i32 @hash_function.(i32 %rcc.tmp.3)
  store i32 %rcc.tmp.4, ptr %bucket_index
  %rcc.tmp.6 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.7 = getelementptr %HashTable, ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %bucket_index
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = getelementptr [127 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %current
  %rcc.tmp.15 = icmp ne i32 %rcc.tmp.14, -1
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.19 = getelementptr %HashTable, ptr %rcc.tmp.18, i32 0, i32 1
  %rcc.tmp.20 = load i32, ptr %current
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = getelementptr %HashEntry, ptr %rcc.tmp.22, i32 0, i32 0
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %key..tmp
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.29 = getelementptr %HashTable, ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = load i32, ptr %current
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %HashEntry, ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  ret i32 %rcc.tmp.34
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.37 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.38 = getelementptr %HashTable, ptr %rcc.tmp.37, i32 0, i32 1
  %rcc.tmp.39 = load i32, ptr %current
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = getelementptr %HashEntry, ptr %rcc.tmp.41, i32 0, i32 2
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.46 = sub i32 0, 999999
  ret i32 %rcc.tmp.46
}
define i1 @hash_table_delete.(%HashTable* %table.tmp, i32 %key.tmp) {
entry:
  %table..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %bucket_index = alloca i32 
  %current = alloca i32 
  %prev = alloca i32 
  store %HashTable* %table.tmp, ptr %table..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load i32, ptr %key..tmp
  %rcc.tmp.4 = call i32 @hash_function.(i32 %rcc.tmp.3)
  store i32 %rcc.tmp.4, ptr %bucket_index
  %rcc.tmp.6 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.7 = getelementptr %HashTable, ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %bucket_index
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = getelementptr [127 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %current
  store i32 -1, ptr %prev
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %current
  %rcc.tmp.16 = icmp ne i32 %rcc.tmp.15, -1
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.20 = getelementptr %HashTable, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = load i32, ptr %current
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %HashEntry, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %key..tmp
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %prev
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, -1
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.32 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.33 = getelementptr %HashTable, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %bucket_index
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [127 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.38 = getelementptr %HashTable, ptr %rcc.tmp.37, i32 0, i32 1
  %rcc.tmp.39 = load i32, ptr %current
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = getelementptr %HashEntry, ptr %rcc.tmp.41, i32 0, i32 2
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %rcc.tmp.36
  br label %if.merge.2
if.else.2:
  %rcc.tmp.46 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.47 = getelementptr %HashTable, ptr %rcc.tmp.46, i32 0, i32 1
  %rcc.tmp.48 = load i32, ptr %prev
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = getelementptr %HashEntry, ptr %rcc.tmp.50, i32 0, i32 2
  %rcc.tmp.52 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.53 = getelementptr %HashTable, ptr %rcc.tmp.52, i32 0, i32 1
  %rcc.tmp.54 = load i32, ptr %current
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = getelementptr %HashEntry, ptr %rcc.tmp.56, i32 0, i32 2
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %rcc.tmp.51
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.61 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.62 = getelementptr %HashTable, ptr %rcc.tmp.61, i32 0, i32 1
  %rcc.tmp.63 = load i32, ptr %current
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = getelementptr %HashEntry, ptr %rcc.tmp.65, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.66
  %rcc.tmp.68 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.69 = getelementptr %HashTable, ptr %rcc.tmp.68, i32 0, i32 2
  %rcc.tmp.70 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.71 = getelementptr %HashTable, ptr %rcc.tmp.70, i32 0, i32 2
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = sub i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %rcc.tmp.69
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.77 = load i32, ptr %current
  store i32 %rcc.tmp.77, ptr %prev
  %rcc.tmp.79 = load %HashTable*, ptr %table..tmp
  %rcc.tmp.80 = getelementptr %HashTable, ptr %rcc.tmp.79, i32 0, i32 1
  %rcc.tmp.81 = load i32, ptr %current
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [1000 x %HashEntry], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = getelementptr %HashEntry, ptr %rcc.tmp.83, i32 0, i32 2
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %current
  br label %while.cond
while.end:
  ret i1 0
}
define void @init_list_manager.(%LinkedListManager* sret(%LinkedListManager) %ret.slot) {
entry:
  %rcc.tmp.1 = getelementptr %LinkedListManager, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 0
  store i32 -1, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 1
  store i32 -1, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 2
  store i32 -1, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 3
  store i32 -1, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 4
  store i32 -1, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 5
  store i32 -1, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 6
  store i32 -1, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 7
  store i32 -1, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 8
  store i32 -1, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %rcc.tmp.1, i32 0, i32 9
  store i32 -1, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr %LinkedListManager, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %LinkedListManager, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.24
  ret void
}
define i1 @list_insert_head.(%LinkedListManager* %manager.tmp, %MemoryPool* %pool.tmp, i32 %list_id.tmp, i32 %data.tmp) {
entry:
  %manager..tmp = alloca %LinkedListManager* 
  %pool..tmp = alloca %MemoryPool* 
  %list_id..tmp = alloca i32 
  %data..tmp = alloca i32 
  %new_node = alloca i32 
  %new_node.2 = alloca i32 
  store %LinkedListManager* %manager.tmp, ptr %manager..tmp
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %list_id.tmp, ptr %list_id..tmp
  store i32 %data.tmp, ptr %data..tmp
  %rcc.tmp.5 = load i32, ptr %list_id..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.8 = load i32, ptr %list_id..tmp
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.8, 10
  br label %sc.merge
sc.merge:
  %rcc.tmp.11 = phi i1 [1, %entry], [%rcc.tmp.9, %or.rhs]
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.16 = load i32, ptr %data..tmp
  %rcc.tmp.17 = call i32 @allocate_node.(%MemoryPool* %rcc.tmp.15, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %new_node
  %rcc.tmp.19 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.20 = load i32, ptr %data..tmp
  %rcc.tmp.21 = call i32 @allocate_node.(%MemoryPool* %rcc.tmp.19, i32 %rcc.tmp.20)
  store i32 %rcc.tmp.21, ptr %new_node.2
  %rcc.tmp.23 = load i32, ptr %new_node.2
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, -1
  br i1 %rcc.tmp.24, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.28 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.29 = getelementptr %MemoryPool, ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %new_node.2
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %ListNode, ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.34 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.35 = getelementptr %LinkedListManager, ptr %rcc.tmp.34, i32 0, i32 0
  %rcc.tmp.36 = load i32, ptr %list_id..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.33
  %rcc.tmp.41 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.42 = getelementptr %LinkedListManager, ptr %rcc.tmp.41, i32 0, i32 0
  %rcc.tmp.43 = load i32, ptr %list_id..tmp
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [10 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %new_node.2
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.49 = getelementptr %LinkedListManager, ptr %rcc.tmp.48, i32 0, i32 2
  %rcc.tmp.50 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.51 = getelementptr %LinkedListManager, ptr %rcc.tmp.50, i32 0, i32 2
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %rcc.tmp.49
  ret i1 1
}
define i1 @list_search.(%LinkedListManager* %manager.tmp, %MemoryPool* %pool.tmp, i32 %list_id.tmp, i32 %data.tmp) {
entry:
  %manager..tmp = alloca %LinkedListManager* 
  %pool..tmp = alloca %MemoryPool* 
  %list_id..tmp = alloca i32 
  %data..tmp = alloca i32 
  %current = alloca i32 
  store %LinkedListManager* %manager.tmp, ptr %manager..tmp
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %list_id.tmp, ptr %list_id..tmp
  store i32 %data.tmp, ptr %data..tmp
  %rcc.tmp.5 = load i32, ptr %list_id..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.8 = load i32, ptr %list_id..tmp
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.8, 10
  br label %sc.merge
sc.merge:
  %rcc.tmp.11 = phi i1 [1, %entry], [%rcc.tmp.9, %or.rhs]
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.16 = getelementptr %LinkedListManager, ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %list_id..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %current
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.23, -1
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.28 = getelementptr %MemoryPool, ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %current
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %ListNode, ptr %rcc.tmp.31, i32 0, i32 0
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %data..tmp
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.39 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.40 = getelementptr %MemoryPool, ptr %rcc.tmp.39, i32 0, i32 0
  %rcc.tmp.41 = load i32, ptr %current
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = getelementptr %ListNode, ptr %rcc.tmp.43, i32 0, i32 1
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %current
  br label %while.cond
while.end:
  ret i1 0
}
define i1 @list_delete.(%LinkedListManager* %manager.tmp, %MemoryPool* %pool.tmp, i32 %list_id.tmp, i32 %data.tmp) {
entry:
  %manager..tmp = alloca %LinkedListManager* 
  %pool..tmp = alloca %MemoryPool* 
  %list_id..tmp = alloca i32 
  %data..tmp = alloca i32 
  %current = alloca i32 
  %prev = alloca i32 
  store %LinkedListManager* %manager.tmp, ptr %manager..tmp
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %list_id.tmp, ptr %list_id..tmp
  store i32 %data.tmp, ptr %data..tmp
  %rcc.tmp.5 = load i32, ptr %list_id..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.8 = load i32, ptr %list_id..tmp
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.8, 10
  br label %sc.merge
sc.merge:
  %rcc.tmp.11 = phi i1 [1, %entry], [%rcc.tmp.9, %or.rhs]
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.16 = getelementptr %LinkedListManager, ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %list_id..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %current
  store i32 -1, ptr %prev
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %current
  %rcc.tmp.25 = icmp ne i32 %rcc.tmp.24, -1
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.29 = getelementptr %MemoryPool, ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %current
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %ListNode, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %data..tmp
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load i32, ptr %prev
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, -1
  br i1 %rcc.tmp.39, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.41 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.42 = getelementptr %LinkedListManager, ptr %rcc.tmp.41, i32 0, i32 0
  %rcc.tmp.43 = load i32, ptr %list_id..tmp
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [10 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.47 = getelementptr %MemoryPool, ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %current
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = getelementptr %ListNode, ptr %rcc.tmp.50, i32 0, i32 1
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %rcc.tmp.45
  br label %if.merge.3
if.else.3:
  %rcc.tmp.55 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.56 = getelementptr %MemoryPool, ptr %rcc.tmp.55, i32 0, i32 0
  %rcc.tmp.57 = load i32, ptr %prev
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = getelementptr %ListNode, ptr %rcc.tmp.59, i32 0, i32 1
  %rcc.tmp.61 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.62 = getelementptr %MemoryPool, ptr %rcc.tmp.61, i32 0, i32 0
  %rcc.tmp.63 = load i32, ptr %current
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = getelementptr %ListNode, ptr %rcc.tmp.65, i32 0, i32 1
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %rcc.tmp.60
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.70 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.71 = load i32, ptr %current
  call void @deallocate_node.(%MemoryPool* %rcc.tmp.70, i32 %rcc.tmp.71)
  %rcc.tmp.73 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.74 = getelementptr %LinkedListManager, ptr %rcc.tmp.73, i32 0, i32 2
  %rcc.tmp.75 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.76 = getelementptr %LinkedListManager, ptr %rcc.tmp.75, i32 0, i32 2
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = sub i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %rcc.tmp.74
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.82 = load i32, ptr %current
  store i32 %rcc.tmp.82, ptr %prev
  %rcc.tmp.84 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.85 = getelementptr %MemoryPool, ptr %rcc.tmp.84, i32 0, i32 0
  %rcc.tmp.86 = load i32, ptr %current
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = getelementptr %ListNode, ptr %rcc.tmp.88, i32 0, i32 1
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.90, ptr %current
  br label %while.cond
while.end:
  ret i1 0
}
define i32 @list_length.(%LinkedListManager* %manager.tmp, %MemoryPool* %pool.tmp, i32 %list_id.tmp) {
entry:
  %manager..tmp = alloca %LinkedListManager* 
  %pool..tmp = alloca %MemoryPool* 
  %list_id..tmp = alloca i32 
  %count = alloca i32 
  %current = alloca i32 
  store %LinkedListManager* %manager.tmp, ptr %manager..tmp
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %list_id.tmp, ptr %list_id..tmp
  %rcc.tmp.4 = load i32, ptr %list_id..tmp
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %list_id..tmp
  %rcc.tmp.8 = icmp sge i32 %rcc.tmp.7, 10
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %count
  %rcc.tmp.15 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.16 = getelementptr %LinkedListManager, ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %list_id..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %current
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.23, -1
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %count
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %count
  %rcc.tmp.30 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.31 = getelementptr %MemoryPool, ptr %rcc.tmp.30, i32 0, i32 0
  %rcc.tmp.32 = load i32, ptr %current
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %ListNode, ptr %rcc.tmp.34, i32 0, i32 1
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.39 = load i32, ptr %count
  ret i32 %rcc.tmp.39
}
define i1 @list_merge_sorted.(%LinkedListManager* %manager.tmp, %MemoryPool* %pool.tmp, i32 %list1_id.tmp, i32 %list2_id.tmp, i32 %result_id.tmp) {
entry:
  %manager..tmp = alloca %LinkedListManager* 
  %pool..tmp = alloca %MemoryPool* 
  %list1_id..tmp = alloca i32 
  %list2_id..tmp = alloca i32 
  %result_id..tmp = alloca i32 
  %ptr1 = alloca i32 
  %ptr2 = alloca i32 
  %result_tail = alloca i32 
  %next_node = alloca i32 
  %remaining = alloca i32 
  store %LinkedListManager* %manager.tmp, ptr %manager..tmp
  store %MemoryPool* %pool.tmp, ptr %pool..tmp
  store i32 %list1_id.tmp, ptr %list1_id..tmp
  store i32 %list2_id.tmp, ptr %list2_id..tmp
  store i32 %result_id.tmp, ptr %result_id..tmp
  %rcc.tmp.6 = load i32, ptr %list1_id..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.9 = load i32, ptr %list1_id..tmp
  %rcc.tmp.10 = icmp sge i32 %rcc.tmp.9, 10
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.14 = load i32, ptr %list2_id..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.17 = phi i1 [1, %sc.merge], [%rcc.tmp.15, %or.rhs.2]
  br i1 %rcc.tmp.17, label %sc.merge.3, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.19 = load i32, ptr %list2_id..tmp
  %rcc.tmp.20 = icmp sge i32 %rcc.tmp.19, 10
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.22 = phi i1 [1, %sc.merge.2], [%rcc.tmp.20, %or.rhs.3]
  br i1 %rcc.tmp.22, label %sc.merge.4, label %or.rhs.4
or.rhs.4:
  %rcc.tmp.24 = load i32, ptr %result_id..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 0
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.27 = phi i1 [1, %sc.merge.3], [%rcc.tmp.25, %or.rhs.4]
  br i1 %rcc.tmp.27, label %sc.merge.5, label %or.rhs.5
or.rhs.5:
  %rcc.tmp.29 = load i32, ptr %result_id..tmp
  %rcc.tmp.30 = icmp sge i32 %rcc.tmp.29, 10
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.32 = phi i1 [1, %sc.merge.4], [%rcc.tmp.30, %or.rhs.5]
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.37 = getelementptr %LinkedListManager, ptr %rcc.tmp.36, i32 0, i32 0
  %rcc.tmp.38 = load i32, ptr %list1_id..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %ptr1
  %rcc.tmp.43 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.44 = getelementptr %LinkedListManager, ptr %rcc.tmp.43, i32 0, i32 0
  %rcc.tmp.45 = load i32, ptr %list2_id..tmp
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [10 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %ptr2
  %rcc.tmp.50 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.51 = getelementptr %LinkedListManager, ptr %rcc.tmp.50, i32 0, i32 0
  %rcc.tmp.52 = load i32, ptr %result_id..tmp
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [10 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  store i32 -1, ptr %rcc.tmp.54
  store i32 -1, ptr %result_tail
  br label %while.cond
while.cond:
  %rcc.tmp.58 = load i32, ptr %ptr1
  %rcc.tmp.59 = icmp ne i32 %rcc.tmp.58, -1
  br i1 %rcc.tmp.59, label %and.rhs, label %sc.merge.6
and.rhs:
  %rcc.tmp.61 = load i32, ptr %ptr2
  %rcc.tmp.62 = icmp ne i32 %rcc.tmp.61, -1
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.64 = phi i1 [0, %while.cond], [%rcc.tmp.62, %and.rhs]
  br i1 %rcc.tmp.64, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %next_node
  %rcc.tmp.68 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.69 = getelementptr %MemoryPool, ptr %rcc.tmp.68, i32 0, i32 0
  %rcc.tmp.70 = load i32, ptr %ptr1
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = getelementptr %ListNode, ptr %rcc.tmp.72, i32 0, i32 0
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.76 = getelementptr %MemoryPool, ptr %rcc.tmp.75, i32 0, i32 0
  %rcc.tmp.77 = load i32, ptr %ptr2
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = getelementptr %ListNode, ptr %rcc.tmp.79, i32 0, i32 0
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = icmp sle i32 %rcc.tmp.74, %rcc.tmp.81
  br i1 %rcc.tmp.82, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.84 = load i32, ptr %ptr1
  store i32 %rcc.tmp.84, ptr %next_node
  %rcc.tmp.86 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.87 = getelementptr %MemoryPool, ptr %rcc.tmp.86, i32 0, i32 0
  %rcc.tmp.88 = load i32, ptr %ptr1
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = getelementptr %ListNode, ptr %rcc.tmp.90, i32 0, i32 1
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  store i32 %rcc.tmp.92, ptr %ptr1
  br label %if.merge.2
if.else.2:
  %rcc.tmp.95 = load i32, ptr %ptr2
  store i32 %rcc.tmp.95, ptr %next_node
  %rcc.tmp.97 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.98 = getelementptr %MemoryPool, ptr %rcc.tmp.97, i32 0, i32 0
  %rcc.tmp.99 = load i32, ptr %ptr2
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = getelementptr %ListNode, ptr %rcc.tmp.101, i32 0, i32 1
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  store i32 %rcc.tmp.103, ptr %ptr2
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.106 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.107 = getelementptr %MemoryPool, ptr %rcc.tmp.106, i32 0, i32 0
  %rcc.tmp.108 = load i32, ptr %next_node
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = getelementptr %ListNode, ptr %rcc.tmp.110, i32 0, i32 1
  store i32 -1, ptr %rcc.tmp.111
  %rcc.tmp.113 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.114 = getelementptr %LinkedListManager, ptr %rcc.tmp.113, i32 0, i32 0
  %rcc.tmp.115 = load i32, ptr %result_id..tmp
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 0
  %rcc.tmp.117 = getelementptr [10 x i32], ptr %rcc.tmp.114, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.119 = icmp eq i32 %rcc.tmp.118, -1
  br i1 %rcc.tmp.119, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.121 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.122 = getelementptr %LinkedListManager, ptr %rcc.tmp.121, i32 0, i32 0
  %rcc.tmp.123 = load i32, ptr %result_id..tmp
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [10 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %next_node
  store i32 %rcc.tmp.126, ptr %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %next_node
  store i32 %rcc.tmp.128, ptr %result_tail
  br label %if.merge.3
if.else.3:
  %rcc.tmp.131 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.132 = getelementptr %MemoryPool, ptr %rcc.tmp.131, i32 0, i32 0
  %rcc.tmp.133 = load i32, ptr %result_tail
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = getelementptr %ListNode, ptr %rcc.tmp.135, i32 0, i32 1
  %rcc.tmp.137 = load i32, ptr %next_node
  store i32 %rcc.tmp.137, ptr %rcc.tmp.136
  %rcc.tmp.139 = load i32, ptr %next_node
  store i32 %rcc.tmp.139, ptr %result_tail
  br label %if.merge.3
if.merge.3:
  br label %while.cond
while.end:
  %rcc.tmp.143 = load i32, ptr %ptr1
  %rcc.tmp.144 = icmp ne i32 %rcc.tmp.143, -1
  br i1 %rcc.tmp.144, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.146 = load i32, ptr %ptr1
  br label %if.merge.4
if.else.4:
  %rcc.tmp.148 = load i32, ptr %ptr2
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.150 = phi i32 [%rcc.tmp.146, %if.then.4], [%rcc.tmp.148, %if.else.4]
  store i32 %rcc.tmp.150, ptr %remaining
  %rcc.tmp.152 = load i32, ptr %remaining
  %rcc.tmp.153 = icmp ne i32 %rcc.tmp.152, -1
  br i1 %rcc.tmp.153, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.155 = load i32, ptr %result_tail
  %rcc.tmp.156 = icmp ne i32 %rcc.tmp.155, -1
  br i1 %rcc.tmp.156, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.158 = load %MemoryPool*, ptr %pool..tmp
  %rcc.tmp.159 = getelementptr %MemoryPool, ptr %rcc.tmp.158, i32 0, i32 0
  %rcc.tmp.160 = load i32, ptr %result_tail
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = getelementptr [2000 x %ListNode], ptr %rcc.tmp.159, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.163 = getelementptr %ListNode, ptr %rcc.tmp.162, i32 0, i32 1
  %rcc.tmp.164 = load i32, ptr %remaining
  store i32 %rcc.tmp.164, ptr %rcc.tmp.163
  br label %if.merge.6
if.else.6:
  %rcc.tmp.167 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.168 = getelementptr %LinkedListManager, ptr %rcc.tmp.167, i32 0, i32 0
  %rcc.tmp.169 = load i32, ptr %result_id..tmp
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.172 = load i32, ptr %remaining
  store i32 %rcc.tmp.172, ptr %rcc.tmp.171
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.177 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.178 = getelementptr %LinkedListManager, ptr %rcc.tmp.177, i32 0, i32 0
  %rcc.tmp.179 = load i32, ptr %list1_id..tmp
  %rcc.tmp.180 = add i32 %rcc.tmp.179, 0
  %rcc.tmp.181 = getelementptr [10 x i32], ptr %rcc.tmp.178, i32 0, i32 %rcc.tmp.180
  store i32 -1, ptr %rcc.tmp.181
  %rcc.tmp.183 = load %LinkedListManager*, ptr %manager..tmp
  %rcc.tmp.184 = getelementptr %LinkedListManager, ptr %rcc.tmp.183, i32 0, i32 0
  %rcc.tmp.185 = load i32, ptr %list2_id..tmp
  %rcc.tmp.186 = add i32 %rcc.tmp.185, 0
  %rcc.tmp.187 = getelementptr [10 x i32], ptr %rcc.tmp.184, i32 0, i32 %rcc.tmp.186
  store i32 -1, ptr %rcc.tmp.187
  ret i1 1
}
define void @test_comprehensive_operations.() {
entry:
  %memory_pool = alloca %MemoryPool 
  %hash_table = alloca %HashTable 
  %stack = alloca %Stack 
  %queue = alloca %Queue 
  %list_manager = alloca %LinkedListManager 
  %allocated_nodes = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %key = alloca i32 
  %value = alloca i32 
  %retrieved = alloca i32 
  %retrieved.2 = alloca i32 
  %pop_count = alloca i32 
  %value.2 = alloca i32 
  %j = alloca i32 
  %search_success = alloca i32 
  %j.2 = alloca i32 
  %new_allocations = alloca i32 
  %new_node = alloca i32 
  %deletion_count = alloca i32 
  %key.2 = alloca i32 
  %key.3 = alloca i32 
  %value.3 = alloca i32 
  %list7_len = alloca i32 
  %list8_len = alloca i32 
  %merged_len = alloca i32 
  call void @printlnInt.(i32 19001)
  call void @init_memory_pool.(%MemoryPool* %memory_pool)
  call void @init_hash_table.(%HashTable* %hash_table)
  call void @init_stack.(%Stack* %stack)
  call void @init_queue.(%Queue* %queue)
  call void @init_list_manager.(%LinkedListManager* %list_manager)
  call void @printlnInt.(i32 19002)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 100
  br i1 %rcc.tmp.11, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.13 = load i32, ptr %fill.idx
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %allocated_nodes, i32 0, i32 %rcc.tmp.13
  store i32 -1, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 100
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [100 x i32], ptr %allocated_nodes, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = mul i32 %rcc.tmp.28, 7
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 13
  %rcc.tmp.31 = call i32 @allocate_node.(%MemoryPool* %memory_pool, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %rcc.tmp.27
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %allocated_nodes, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.36, -1
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  call void @printlnInt.(i32 19901)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.46 = getelementptr %MemoryPool, ptr %memory_pool, i32 0, i32 2
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  call void @printlnInt.(i32 %rcc.tmp.47)
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.51, 200
  br i1 %rcc.tmp.52, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = mul i32 %rcc.tmp.55, 127
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %key
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = mul i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 17
  store i32 %rcc.tmp.62, ptr %value
  %rcc.tmp.64 = load i32, ptr %key
  %rcc.tmp.65 = load i32, ptr %value
  %rcc.tmp.66 = call i1 @hash_table_insert.(%HashTable* %hash_table, i32 %rcc.tmp.64, i32 %rcc.tmp.65)
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %key
  %rcc.tmp.69 = call i32 @hash_table_search.(%HashTable* %hash_table, i32 %rcc.tmp.68)
  store i32 %rcc.tmp.69, ptr %retrieved
  %rcc.tmp.71 = load i32, ptr %key
  %rcc.tmp.72 = call i32 @hash_table_search.(%HashTable* %hash_table, i32 %rcc.tmp.71)
  store i32 %rcc.tmp.72, ptr %retrieved.2
  %rcc.tmp.74 = load i32, ptr %retrieved.2
  %rcc.tmp.75 = load i32, ptr %value
  %rcc.tmp.76 = icmp ne i32 %rcc.tmp.74, %rcc.tmp.75
  br i1 %rcc.tmp.76, label %if.then.3, label %if.else.3
if.then.3:
  call void @printlnInt.(i32 19902)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.87 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 2
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  call void @printlnInt.(i32 %rcc.tmp.88)
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = add i32 500, 10
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = mul i32 %rcc.tmp.97, 3
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 7
  %rcc.tmp.100 = call i1 @stack_push.(%Stack* %stack, i32 %rcc.tmp.99)
  %rcc.tmp.101 = xor i1 %rcc.tmp.100, true
  br i1 %rcc.tmp.101, label %if.then.4, label %if.else.4
if.then.4:
  call void @printlnInt.(i32 19903)
  br label %while.linker.3
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %pop_count
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.112 = call i1 @stack_is_empty.(%Stack* %stack)
  %rcc.tmp.113 = xor i1 %rcc.tmp.112, true
  br i1 %rcc.tmp.113, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.116 = call i32 @stack_pop.(%Stack* %stack)
  store i32 %rcc.tmp.116, ptr %value.2
  %rcc.tmp.118 = load i32, ptr %value.2
  %rcc.tmp.119 = sub i32 0, 999999
  %rcc.tmp.120 = icmp ne i32 %rcc.tmp.118, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.122 = load i32, ptr %pop_count
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %pop_count
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %while.cond.4
while.end.4:
  %rcc.tmp.128 = load i32, ptr %pop_count
  call void @printlnInt.(i32 %rcc.tmp.128)
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = sdiv i32 500, 2
  %rcc.tmp.134 = icmp slt i32 %rcc.tmp.132, %rcc.tmp.133
  br i1 %rcc.tmp.134, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.137 = load i32, ptr %i
  %rcc.tmp.138 = mul i32 %rcc.tmp.137, 5
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 11
  %rcc.tmp.140 = call i1 @queue_enqueue.(%Queue* %queue, i32 %rcc.tmp.139)
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 1
  store i32 %rcc.tmp.142, ptr %i
  br label %while.cond.5
while.end.5:
  store i32 0, ptr %i
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = sdiv i32 500, 4
  %rcc.tmp.149 = icmp slt i32 %rcc.tmp.147, %rcc.tmp.148
  br i1 %rcc.tmp.149, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.152 = call i32 @queue_dequeue.(%Queue* %queue)
  %rcc.tmp.153 = load i32, ptr %i
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %i
  br label %while.cond.6
while.end.6:
  store i32 0, ptr %i
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.159 = load i32, ptr %i
  %rcc.tmp.160 = sdiv i32 500, 2
  %rcc.tmp.161 = icmp slt i32 %rcc.tmp.159, %rcc.tmp.160
  br i1 %rcc.tmp.161, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.164 = load i32, ptr %i
  %rcc.tmp.165 = mul i32 %rcc.tmp.164, 7
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 23
  %rcc.tmp.167 = call i1 @queue_enqueue.(%Queue* %queue, i32 %rcc.tmp.166)
  %rcc.tmp.168 = xor i1 %rcc.tmp.167, true
  br i1 %rcc.tmp.168, label %if.then.6, label %if.else.6
if.then.6:
  call void @printlnInt.(i32 19904)
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 1
  store i32 %rcc.tmp.174, ptr %i
  br label %while.cond.7
while.end.7:
  %rcc.tmp.177 = getelementptr %Queue, ptr %queue, i32 0, i32 3
  %rcc.tmp.178 = load i32, ptr %rcc.tmp.177
  call void @printlnInt.(i32 %rcc.tmp.178)
  store i32 0, ptr %i
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.182 = load i32, ptr %i
  %rcc.tmp.183 = icmp slt i32 %rcc.tmp.182, 5
  br i1 %rcc.tmp.183, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  store i32 0, ptr %j
  br label %while.cond.9
while.cond.9:
  %rcc.tmp.188 = load i32, ptr %j
  %rcc.tmp.189 = icmp slt i32 %rcc.tmp.188, 20
  br i1 %rcc.tmp.189, label %while.body.9, label %while.linker.9
while.linker.9:
  br label %while.end.9
while.body.9:
  %rcc.tmp.192 = load i32, ptr %i
  %rcc.tmp.193 = load i32, ptr %j
  %rcc.tmp.194 = mul i32 %rcc.tmp.193, 2
  %rcc.tmp.195 = load i32, ptr %i
  %rcc.tmp.196 = add i32 %rcc.tmp.194, %rcc.tmp.195
  %rcc.tmp.197 = call i1 @list_insert_head.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 %rcc.tmp.192, i32 %rcc.tmp.196)
  %rcc.tmp.198 = load i32, ptr %j
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 1
  store i32 %rcc.tmp.199, ptr %j
  br label %while.cond.9
while.end.9:
  %rcc.tmp.202 = load i32, ptr %i
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 1
  store i32 %rcc.tmp.203, ptr %i
  br label %while.cond.8
while.end.8:
  %rcc.tmp.206 = getelementptr %LinkedListManager, ptr %list_manager, i32 0, i32 2
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.206
  call void @printlnInt.(i32 %rcc.tmp.207)
  store i32 0, ptr %search_success
  store i32 0, ptr %i
  br label %while.cond.10
while.cond.10:
  %rcc.tmp.212 = load i32, ptr %i
  %rcc.tmp.213 = icmp slt i32 %rcc.tmp.212, 5
  br i1 %rcc.tmp.213, label %while.body.10, label %while.linker.10
while.linker.10:
  br label %while.end.10
while.body.10:
  store i32 0, ptr %j.2
  br label %while.cond.11
while.cond.11:
  %rcc.tmp.218 = load i32, ptr %j.2
  %rcc.tmp.219 = icmp slt i32 %rcc.tmp.218, 20
  br i1 %rcc.tmp.219, label %while.body.11, label %while.linker.11
while.linker.11:
  br label %while.end.11
while.body.11:
  %rcc.tmp.222 = load i32, ptr %i
  %rcc.tmp.223 = load i32, ptr %j.2
  %rcc.tmp.224 = mul i32 %rcc.tmp.223, 2
  %rcc.tmp.225 = load i32, ptr %i
  %rcc.tmp.226 = add i32 %rcc.tmp.224, %rcc.tmp.225
  %rcc.tmp.227 = call i1 @list_search.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 %rcc.tmp.222, i32 %rcc.tmp.226)
  br i1 %rcc.tmp.227, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.229 = load i32, ptr %search_success
  %rcc.tmp.230 = add i32 %rcc.tmp.229, 1
  store i32 %rcc.tmp.230, ptr %search_success
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.234 = load i32, ptr %j.2
  %rcc.tmp.235 = add i32 %rcc.tmp.234, 1
  store i32 %rcc.tmp.235, ptr %j.2
  br label %while.cond.11
while.end.11:
  %rcc.tmp.238 = load i32, ptr %i
  %rcc.tmp.239 = add i32 %rcc.tmp.238, 1
  store i32 %rcc.tmp.239, ptr %i
  br label %while.cond.10
while.end.10:
  %rcc.tmp.242 = load i32, ptr %search_success
  call void @printlnInt.(i32 %rcc.tmp.242)
  store i32 0, ptr %i
  br label %while.cond.12
while.cond.12:
  %rcc.tmp.246 = load i32, ptr %i
  %rcc.tmp.247 = icmp slt i32 %rcc.tmp.246, 100
  br i1 %rcc.tmp.247, label %while.body.12, label %while.linker.12
while.linker.12:
  br label %while.end.12
while.body.12:
  %rcc.tmp.250 = load i32, ptr %i
  %rcc.tmp.251 = srem i32 %rcc.tmp.250, 2
  %rcc.tmp.252 = icmp eq i32 %rcc.tmp.251, 0
  br i1 %rcc.tmp.252, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.254 = load i32, ptr %i
  %rcc.tmp.255 = add i32 %rcc.tmp.254, 0
  %rcc.tmp.256 = getelementptr [100 x i32], ptr %allocated_nodes, i32 0, i32 %rcc.tmp.255
  %rcc.tmp.257 = load i32, ptr %rcc.tmp.256
  %rcc.tmp.258 = icmp ne i32 %rcc.tmp.257, -1
  br label %sc.merge
sc.merge:
  %rcc.tmp.260 = phi i1 [0, %while.body.12], [%rcc.tmp.258, %and.rhs]
  br i1 %rcc.tmp.260, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.262 = load i32, ptr %i
  %rcc.tmp.263 = add i32 %rcc.tmp.262, 0
  %rcc.tmp.264 = getelementptr [100 x i32], ptr %allocated_nodes, i32 0, i32 %rcc.tmp.263
  %rcc.tmp.265 = load i32, ptr %rcc.tmp.264
  call void @deallocate_node.(%MemoryPool* %memory_pool, i32 %rcc.tmp.265)
  %rcc.tmp.267 = load i32, ptr %i
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = getelementptr [100 x i32], ptr %allocated_nodes, i32 0, i32 %rcc.tmp.268
  store i32 -1, ptr %rcc.tmp.269
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.273 = load i32, ptr %i
  %rcc.tmp.274 = add i32 %rcc.tmp.273, 1
  store i32 %rcc.tmp.274, ptr %i
  br label %while.cond.12
while.end.12:
  %rcc.tmp.277 = getelementptr %MemoryPool, ptr %memory_pool, i32 0, i32 2
  %rcc.tmp.278 = load i32, ptr %rcc.tmp.277
  call void @printlnInt.(i32 %rcc.tmp.278)
  store i32 0, ptr %new_allocations
  store i32 0, ptr %i
  br label %while.cond.13
while.cond.13:
  %rcc.tmp.283 = load i32, ptr %i
  %rcc.tmp.284 = icmp slt i32 %rcc.tmp.283, 60
  br i1 %rcc.tmp.284, label %while.body.13, label %while.linker.13
while.linker.13:
  br label %while.end.13
while.body.13:
  %rcc.tmp.287 = load i32, ptr %i
  %rcc.tmp.288 = mul i32 %rcc.tmp.287, 11
  %rcc.tmp.289 = add i32 %rcc.tmp.288, 19
  %rcc.tmp.290 = call i32 @allocate_node.(%MemoryPool* %memory_pool, i32 %rcc.tmp.289)
  store i32 %rcc.tmp.290, ptr %new_node
  %rcc.tmp.292 = load i32, ptr %new_node
  %rcc.tmp.293 = icmp ne i32 %rcc.tmp.292, -1
  br i1 %rcc.tmp.293, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.295 = load i32, ptr %new_allocations
  %rcc.tmp.296 = add i32 %rcc.tmp.295, 1
  store i32 %rcc.tmp.296, ptr %new_allocations
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.300 = load i32, ptr %i
  %rcc.tmp.301 = add i32 %rcc.tmp.300, 1
  store i32 %rcc.tmp.301, ptr %i
  br label %while.cond.13
while.end.13:
  %rcc.tmp.304 = load i32, ptr %new_allocations
  call void @printlnInt.(i32 %rcc.tmp.304)
  store i32 0, ptr %deletion_count
  store i32 0, ptr %i
  br label %while.cond.14
while.cond.14:
  %rcc.tmp.309 = load i32, ptr %i
  %rcc.tmp.310 = icmp slt i32 %rcc.tmp.309, 100
  br i1 %rcc.tmp.310, label %while.body.14, label %while.linker.14
while.linker.14:
  br label %while.end.14
while.body.14:
  %rcc.tmp.313 = load i32, ptr %i
  %rcc.tmp.314 = mul i32 %rcc.tmp.313, 127
  %rcc.tmp.315 = add i32 %rcc.tmp.314, 1
  store i32 %rcc.tmp.315, ptr %key.2
  %rcc.tmp.317 = load i32, ptr %key.2
  %rcc.tmp.318 = call i1 @hash_table_delete.(%HashTable* %hash_table, i32 %rcc.tmp.317)
  br i1 %rcc.tmp.318, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.320 = load i32, ptr %deletion_count
  %rcc.tmp.321 = add i32 %rcc.tmp.320, 1
  store i32 %rcc.tmp.321, ptr %deletion_count
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.325 = load i32, ptr %i
  %rcc.tmp.326 = add i32 %rcc.tmp.325, 1
  store i32 %rcc.tmp.326, ptr %i
  br label %while.cond.14
while.end.14:
  %rcc.tmp.329 = load i32, ptr %deletion_count
  call void @printlnInt.(i32 %rcc.tmp.329)
  store i32 0, ptr %i
  br label %while.cond.15
while.cond.15:
  %rcc.tmp.333 = load i32, ptr %i
  %rcc.tmp.334 = icmp slt i32 %rcc.tmp.333, 50
  br i1 %rcc.tmp.334, label %while.body.15, label %while.linker.15
while.linker.15:
  br label %while.end.15
while.body.15:
  %rcc.tmp.337 = load i32, ptr %i
  %rcc.tmp.338 = mul i32 %rcc.tmp.337, 127
  %rcc.tmp.339 = add i32 %rcc.tmp.338, 1
  store i32 %rcc.tmp.339, ptr %key.3
  %rcc.tmp.341 = load i32, ptr %i
  %rcc.tmp.342 = load i32, ptr %i
  %rcc.tmp.343 = mul i32 %rcc.tmp.341, %rcc.tmp.342
  %rcc.tmp.344 = load i32, ptr %i
  %rcc.tmp.345 = mul i32 %rcc.tmp.343, %rcc.tmp.344
  %rcc.tmp.346 = add i32 %rcc.tmp.345, 29
  store i32 %rcc.tmp.346, ptr %value.3
  %rcc.tmp.348 = load i32, ptr %key.3
  %rcc.tmp.349 = load i32, ptr %value.3
  %rcc.tmp.350 = call i1 @hash_table_insert.(%HashTable* %hash_table, i32 %rcc.tmp.348, i32 %rcc.tmp.349)
  %rcc.tmp.351 = load i32, ptr %i
  %rcc.tmp.352 = add i32 %rcc.tmp.351, 1
  store i32 %rcc.tmp.352, ptr %i
  br label %while.cond.15
while.end.15:
  %rcc.tmp.355 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 2
  %rcc.tmp.356 = load i32, ptr %rcc.tmp.355
  call void @printlnInt.(i32 %rcc.tmp.356)
  store i32 0, ptr %i
  br label %while.cond.16
while.cond.16:
  %rcc.tmp.360 = load i32, ptr %i
  %rcc.tmp.361 = icmp slt i32 %rcc.tmp.360, 15
  br i1 %rcc.tmp.361, label %while.body.16, label %while.linker.16
while.linker.16:
  br label %while.end.16
while.body.16:
  %rcc.tmp.364 = load i32, ptr %i
  %rcc.tmp.365 = mul i32 %rcc.tmp.364, 4
  %rcc.tmp.366 = call i1 @list_insert_head.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 7, i32 %rcc.tmp.365)
  %rcc.tmp.367 = load i32, ptr %i
  %rcc.tmp.368 = mul i32 %rcc.tmp.367, 4
  %rcc.tmp.369 = add i32 %rcc.tmp.368, 2
  %rcc.tmp.370 = call i1 @list_insert_head.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 8, i32 %rcc.tmp.369)
  %rcc.tmp.371 = load i32, ptr %i
  %rcc.tmp.372 = add i32 %rcc.tmp.371, 1
  store i32 %rcc.tmp.372, ptr %i
  br label %while.cond.16
while.end.16:
  %rcc.tmp.375 = call i32 @list_length.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 7)
  store i32 %rcc.tmp.375, ptr %list7_len
  %rcc.tmp.377 = call i32 @list_length.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 8)
  store i32 %rcc.tmp.377, ptr %list8_len
  %rcc.tmp.379 = load i32, ptr %list7_len
  %rcc.tmp.380 = load i32, ptr %list8_len
  %rcc.tmp.381 = add i32 %rcc.tmp.379, %rcc.tmp.380
  call void @printlnInt.(i32 %rcc.tmp.381)
  %rcc.tmp.383 = call i1 @list_merge_sorted.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 7, i32 8, i32 9)
  %rcc.tmp.384 = call i32 @list_length.(%LinkedListManager* %list_manager, %MemoryPool* %memory_pool, i32 9)
  store i32 %rcc.tmp.384, ptr %merged_len
  %rcc.tmp.386 = load i32, ptr %merged_len
  call void @printlnInt.(i32 %rcc.tmp.386)
  call void @printlnInt.(i32 19999)
  ret void
}
define void @main() {
entry:
  call void @test_comprehensive_operations.()
  call void @exit.(i32 0)
  ret void
}
