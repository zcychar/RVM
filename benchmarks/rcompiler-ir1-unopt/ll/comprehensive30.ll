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
  %heap = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %free_list_head = alloca i32 
  %p1 = alloca i32 
  %p2 = alloca i32 
  %p3 = alloca i32 
  %p4 = alloca i32 
  %p5 = alloca i32 
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
  call void @init_heap.([1024 x i32]* %heap, i32* %free_list_head)
  store i32 0, ptr %p1
  store i32 0, ptr %p2
  store i32 0, ptr %p3
  store i32 0, ptr %p4
  store i32 0, ptr %p5
  %rcc.tmp.19 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 100)
  store i32 %rcc.tmp.19, ptr %p1
  %rcc.tmp.21 = load i32, ptr %p1
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.21, 0
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  call void @printlnInt.(i32 1001)
  %rcc.tmp.25 = load i32, ptr %p1
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.25, i32 100, i32 1)
  %rcc.tmp.27 = load i32, ptr %p1
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.27, i32 100, i32 1)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.31 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 200)
  store i32 %rcc.tmp.31, ptr %p2
  %rcc.tmp.33 = load i32, ptr %p2
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.33, 0
  br i1 %rcc.tmp.34, label %if.then.2, label %if.else.2
if.then.2:
  call void @printlnInt.(i32 1002)
  %rcc.tmp.37 = load i32, ptr %p2
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.37, i32 200, i32 2)
  %rcc.tmp.39 = load i32, ptr %p2
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.39, i32 200, i32 2)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.43 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 150)
  store i32 %rcc.tmp.43, ptr %p3
  %rcc.tmp.45 = load i32, ptr %p3
  %rcc.tmp.46 = icmp sgt i32 %rcc.tmp.45, 0
  br i1 %rcc.tmp.46, label %if.then.3, label %if.else.3
if.then.3:
  call void @printlnInt.(i32 1003)
  %rcc.tmp.49 = load i32, ptr %p3
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.49, i32 150, i32 3)
  %rcc.tmp.51 = load i32, ptr %p3
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.51, i32 150, i32 3)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.55 = load i32, ptr %p2
  call void @my_free.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.55)
  %rcc.tmp.57 = load i32, ptr %p2
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.57, i32 200, i32 2)
  call void @printlnInt.(i32 1004)
  %rcc.tmp.60 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 50)
  store i32 %rcc.tmp.60, ptr %p4
  %rcc.tmp.62 = load i32, ptr %p4
  %rcc.tmp.63 = icmp sgt i32 %rcc.tmp.62, 0
  br i1 %rcc.tmp.63, label %if.then.4, label %if.else.4
if.then.4:
  call void @printlnInt.(i32 1005)
  %rcc.tmp.66 = load i32, ptr %p4
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.66, i32 50, i32 4)
  %rcc.tmp.68 = load i32, ptr %p4
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.68, i32 50, i32 2)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.72 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 250)
  store i32 %rcc.tmp.72, ptr %p5
  %rcc.tmp.74 = load i32, ptr %p5
  %rcc.tmp.75 = icmp slt i32 %rcc.tmp.74, 0
  br i1 %rcc.tmp.75, label %if.then.5, label %if.else.5
if.then.5:
  call void @printlnInt.(i32 1006)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.80 = load i32, ptr %p1
  call void @my_free.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.80)
  %rcc.tmp.82 = load i32, ptr %p3
  call void @my_free.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.82)
  %rcc.tmp.84 = load i32, ptr %p4
  call void @my_free.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.84)
  call void @printlnInt.(i32 1007)
  %rcc.tmp.87 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 800)
  store i32 %rcc.tmp.87, ptr %p1
  %rcc.tmp.89 = load i32, ptr %p1
  %rcc.tmp.90 = icmp sgt i32 %rcc.tmp.89, 0
  br i1 %rcc.tmp.90, label %if.then.6, label %if.else.6
if.then.6:
  call void @printlnInt.(i32 1008)
  %rcc.tmp.93 = load i32, ptr %p1
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.93, i32 800, i32 5)
  %rcc.tmp.95 = load i32, ptr %p1
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.95, i32 800, i32 5)
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @init_heap.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  %rcc.tmp.3 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.4 = getelementptr [1024 x i32], ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = sub i32 1024, 2
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  %rcc.tmp.7 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.8 = getelementptr [1024 x i32], ptr %rcc.tmp.7, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.11 = getelementptr [1024 x i32], ptr %rcc.tmp.10, i32 0, i32 2
  %rcc.tmp.12 = sub i32 0, 1
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = load i32*, ptr %free_list_head..tmp
  store i32 0, ptr %rcc.tmp.14
  ret void
}
define i32 @my_malloc.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp, i32 %size.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  %size..tmp = alloca i32 
  %current = alloca i32 
  %prev = alloca i32 
  %required_size = alloca i32 
  %block_size = alloca i32 
  %is_free = alloca i32 
  %remaining_size = alloca i32 
  %new_block_pos = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.4 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %current
  %rcc.tmp.7 = sub i32 0, 1
  store i32 %rcc.tmp.7, ptr %prev
  %rcc.tmp.9 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.9, ptr %required_size
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %current
  %rcc.tmp.13 = sub i32 0, 1
  %rcc.tmp.14 = icmp ne i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %current
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.20 = getelementptr [1024 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %block_size
  %rcc.tmp.23 = load i32, ptr %current
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.27 = getelementptr [1024 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %is_free
  %rcc.tmp.30 = load i32, ptr %is_free
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.30, 0
  br i1 %rcc.tmp.31, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.33 = load i32, ptr %block_size
  %rcc.tmp.34 = load i32, ptr %required_size
  %rcc.tmp.35 = icmp sge i32 %rcc.tmp.33, %rcc.tmp.34
  br label %sc.merge
sc.merge:
  %rcc.tmp.37 = phi i1 [0, %while.body], [%rcc.tmp.35, %and.rhs]
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %block_size
  %rcc.tmp.40 = load i32, ptr %required_size
  %rcc.tmp.41 = sub i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = sub i32 %rcc.tmp.41, 2
  store i32 %rcc.tmp.42, ptr %remaining_size
  %rcc.tmp.44 = load i32, ptr %remaining_size
  %rcc.tmp.45 = icmp sgt i32 %rcc.tmp.44, 2
  br i1 %rcc.tmp.45, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.47 = load i32, ptr %current
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 2
  %rcc.tmp.49 = load i32, ptr %required_size
  %rcc.tmp.50 = add i32 %rcc.tmp.48, %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %new_block_pos
  %rcc.tmp.52 = load i32, ptr %new_block_pos
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.55 = getelementptr [1024 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %remaining_size
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %new_block_pos
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.62 = getelementptr [1024 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %new_block_pos
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 2
  %rcc.tmp.67 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.68 = getelementptr [1024 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %current
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 2
  %rcc.tmp.72 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.73 = getelementptr [1024 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %rcc.tmp.68
  %rcc.tmp.76 = load i32, ptr %current
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.79 = getelementptr [1024 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %required_size
  store i32 %rcc.tmp.80, ptr %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %current
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.86 = getelementptr [1024 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  store i32 1, ptr %rcc.tmp.86
  %rcc.tmp.88 = load i32, ptr %current
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 2
  %rcc.tmp.91 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.92 = getelementptr [1024 x i32], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %new_block_pos
  store i32 %rcc.tmp.93, ptr %rcc.tmp.92
  br label %if.merge.2
if.else.2:
  %rcc.tmp.96 = load i32, ptr %current
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  %rcc.tmp.99 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.100 = getelementptr [1024 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  store i32 1, ptr %rcc.tmp.100
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.103 = load i32, ptr %prev
  %rcc.tmp.104 = sub i32 0, 1
  %rcc.tmp.105 = icmp eq i32 %rcc.tmp.103, %rcc.tmp.104
  br i1 %rcc.tmp.105, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.107 = load i32, ptr %remaining_size
  %rcc.tmp.108 = icmp sgt i32 %rcc.tmp.107, 2
  br i1 %rcc.tmp.108, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.110 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.111 = load i32, ptr %current
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 2
  %rcc.tmp.113 = load i32, ptr %required_size
  %rcc.tmp.114 = add i32 %rcc.tmp.112, %rcc.tmp.113
  store i32 %rcc.tmp.114, ptr %rcc.tmp.110
  br label %if.merge.4
if.else.4:
  %rcc.tmp.117 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.118 = load i32, ptr %current
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 2
  %rcc.tmp.121 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.122 = getelementptr [1024 x i32], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %rcc.tmp.117
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.127 = load i32, ptr %remaining_size
  %rcc.tmp.128 = icmp sgt i32 %rcc.tmp.127, 2
  br i1 %rcc.tmp.128, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.130 = load i32, ptr %prev
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 2
  %rcc.tmp.133 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.134 = getelementptr [1024 x i32], ptr %rcc.tmp.133, i32 0, i32 %rcc.tmp.132
  %rcc.tmp.135 = load i32, ptr %current
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 2
  %rcc.tmp.137 = load i32, ptr %required_size
  %rcc.tmp.138 = add i32 %rcc.tmp.136, %rcc.tmp.137
  store i32 %rcc.tmp.138, ptr %rcc.tmp.134
  br label %if.merge.5
if.else.5:
  %rcc.tmp.141 = load i32, ptr %prev
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 2
  %rcc.tmp.144 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.145 = getelementptr [1024 x i32], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.146 = load i32, ptr %current
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 2
  %rcc.tmp.149 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.150 = getelementptr [1024 x i32], ptr %rcc.tmp.149, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.150
  store i32 %rcc.tmp.151, ptr %rcc.tmp.145
  br label %if.merge.5
if.merge.5:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.155 = load i32, ptr %current
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 2
  ret i32 %rcc.tmp.156
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.159 = load i32, ptr %current
  store i32 %rcc.tmp.159, ptr %prev
  %rcc.tmp.161 = load i32, ptr %current
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 0
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 2
  %rcc.tmp.164 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.165 = getelementptr [1024 x i32], ptr %rcc.tmp.164, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.166 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.166, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.169 = sub i32 0, 1
  ret i32 %rcc.tmp.169
}
define void @my_free.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp, i32 %ptr.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  %ptr..tmp = alloca i32 
  %block_start = alloca i32 
  %current = alloca i32 
  %prev = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  store i32 %ptr.tmp, ptr %ptr..tmp
  %rcc.tmp.4 = load i32, ptr %ptr..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 2
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %ptr..tmp
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 2
  store i32 %rcc.tmp.10, ptr %block_start
  %rcc.tmp.12 = load i32, ptr %block_start
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.16 = getelementptr [1024 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %current
  %rcc.tmp.21 = sub i32 0, 1
  store i32 %rcc.tmp.21, ptr %prev
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %current
  %rcc.tmp.25 = sub i32 0, 1
  %rcc.tmp.26 = icmp ne i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %current
  %rcc.tmp.29 = load i32, ptr %block_start
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br label %sc.merge
sc.merge:
  %rcc.tmp.32 = phi i1 [0, %while.cond], [%rcc.tmp.30, %and.rhs]
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.35 = load i32, ptr %current
  store i32 %rcc.tmp.35, ptr %prev
  %rcc.tmp.37 = load i32, ptr %current
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 2
  %rcc.tmp.40 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.41 = getelementptr [1024 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %prev
  %rcc.tmp.46 = sub i32 0, 1
  %rcc.tmp.47 = icmp eq i32 %rcc.tmp.45, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.49 = load i32, ptr %block_start
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 2
  %rcc.tmp.52 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.53 = getelementptr [1024 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %rcc.tmp.53
  %rcc.tmp.57 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.58 = load i32, ptr %block_start
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  br label %if.merge.2
if.else.2:
  %rcc.tmp.61 = load i32, ptr %block_start
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 2
  %rcc.tmp.64 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.65 = getelementptr [1024 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %prev
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 2
  %rcc.tmp.69 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.70 = getelementptr [1024 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %rcc.tmp.65
  %rcc.tmp.73 = load i32, ptr %prev
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 2
  %rcc.tmp.76 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.77 = getelementptr [1024 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %block_start
  store i32 %rcc.tmp.78, ptr %rcc.tmp.77
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.81 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.82 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  call void @coalesce.([1024 x i32]* %rcc.tmp.81, i32 %rcc.tmp.83)
  ret void
}
define void @coalesce.([1024 x i32]* %heap.tmp, i32 %free_list_head.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32 
  %current = alloca i32 
  %next_ptr_in_list = alloca i32 
  %block_size = alloca i32 
  %physical_next_block = alloca i32 
  %next_block_size = alloca i32 
  %new_size = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %free_list_head.tmp, ptr %free_list_head..tmp
  %rcc.tmp.3 = load i32, ptr %free_list_head..tmp
  store i32 %rcc.tmp.3, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %current
  %rcc.tmp.7 = sub i32 0, 1
  %rcc.tmp.8 = icmp ne i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %current
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 2
  %rcc.tmp.14 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.15 = getelementptr [1024 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %next_ptr_in_list
  %rcc.tmp.18 = load i32, ptr %current
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.21 = getelementptr [1024 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %block_size
  %rcc.tmp.24 = load i32, ptr %current
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 2
  %rcc.tmp.26 = load i32, ptr %block_size
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %physical_next_block
  %rcc.tmp.29 = load i32, ptr %physical_next_block
  %rcc.tmp.30 = load i32, ptr %next_ptr_in_list
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then, label %if.else
if.then:
  %rcc.tmp.33 = load i32, ptr %next_ptr_in_list
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.36 = getelementptr [1024 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %next_block_size
  %rcc.tmp.39 = load i32, ptr %block_size
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 2
  %rcc.tmp.41 = load i32, ptr %next_block_size
  %rcc.tmp.42 = add i32 %rcc.tmp.40, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %new_size
  %rcc.tmp.44 = load i32, ptr %current
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.47 = getelementptr [1024 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %new_size
  store i32 %rcc.tmp.48, ptr %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %current
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 2
  %rcc.tmp.53 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.54 = getelementptr [1024 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %next_ptr_in_list
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 2
  %rcc.tmp.58 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.59 = getelementptr [1024 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %rcc.tmp.54
  br label %if.merge
if.else:
  %rcc.tmp.63 = load i32, ptr %current
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 2
  %rcc.tmp.66 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.67 = getelementptr [1024 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %current
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  ret void
}
define void @fill_memory.([1024 x i32]* %heap.tmp, i32 %start.tmp, i32 %size.tmp, i32 %value.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %start..tmp = alloca i32 
  %size..tmp = alloca i32 
  %value..tmp = alloca i32 
  %i = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %value.tmp, ptr %value..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %start..tmp
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.17 = getelementptr [1024 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %value..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.18, 10000
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.17
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @verify_memory.([1024 x i32]* %heap.tmp, i32 %start.tmp, i32 %size.tmp, i32 %value.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %start..tmp = alloca i32 
  %size..tmp = alloca i32 
  %value..tmp = alloca i32 
  %i = alloca i32 
  %errors = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %value.tmp, ptr %value..tmp
  store i32 0, ptr %i
  store i32 0, ptr %errors
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %start..tmp
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.13, %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.18 = getelementptr [1024 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %value..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.20, 10000
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.19, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %errors
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %errors
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i32, ptr %errors
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = sub i32 0, 999
  call void @printlnInt.(i32 %rcc.tmp.38)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @complex_memory_churn.([1024 x i32]* %heap.tmp, i32* %free_list_head.tmp) {
entry:
  %heap..tmp = alloca [1024 x i32]* 
  %free_list_head..tmp = alloca i32* 
  %p = alloca [20 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %p_large = alloca i32 
  %final_alloc = alloca i32 
  store [1024 x i32]* %heap.tmp, ptr %heap..tmp
  store i32* %free_list_head.tmp, ptr %free_list_head..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 20
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 20
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.24 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 2
  %rcc.tmp.27 = add i32 20, %rcc.tmp.26
  %rcc.tmp.28 = call i32 @my_malloc.([1024 x i32]* %rcc.tmp.23, i32* %rcc.tmp.24, i32 %rcc.tmp.27)
  store i32 %rcc.tmp.28, ptr %rcc.tmp.22
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.33, 0
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = mul i32 %rcc.tmp.41, 2
  %rcc.tmp.43 = add i32 20, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 10, %rcc.tmp.44
  call void @fill_memory.([1024 x i32]* %rcc.tmp.36, i32 %rcc.tmp.40, i32 %rcc.tmp.43, i32 %rcc.tmp.45)
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
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 20
  br i1 %rcc.tmp.56, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = srem i32 %rcc.tmp.59, 2
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 0
  br i1 %rcc.tmp.61, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.63 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.64 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  call void @my_free.([1024 x i32]* %rcc.tmp.63, i32* %rcc.tmp.64, i32 %rcc.tmp.68)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 1, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.78, 20
  br i1 %rcc.tmp.79, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = srem i32 %rcc.tmp.82, 2
  %rcc.tmp.84 = icmp ne i32 %rcc.tmp.83, 0
  br i1 %rcc.tmp.84, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.86 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = mul i32 %rcc.tmp.91, 2
  %rcc.tmp.93 = add i32 20, %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = add i32 10, %rcc.tmp.94
  call void @verify_memory.([1024 x i32]* %rcc.tmp.86, i32 %rcc.tmp.90, i32 %rcc.tmp.93, i32 %rcc.tmp.95)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.103 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.104 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.105 = call i32 @my_malloc.([1024 x i32]* %rcc.tmp.103, i32* %rcc.tmp.104, i32 300)
  store i32 %rcc.tmp.105, ptr %p_large
  %rcc.tmp.107 = load i32, ptr %p_large
  %rcc.tmp.108 = icmp sgt i32 %rcc.tmp.107, 0
  br i1 %rcc.tmp.108, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.110 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.111 = load i32, ptr %p_large
  call void @fill_memory.([1024 x i32]* %rcc.tmp.110, i32 %rcc.tmp.111, i32 300, i32 100)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  store i32 1, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = icmp slt i32 %rcc.tmp.117, 20
  br i1 %rcc.tmp.118, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.121 = load i32, ptr %i
  %rcc.tmp.122 = srem i32 %rcc.tmp.121, 2
  %rcc.tmp.123 = icmp ne i32 %rcc.tmp.122, 0
  br i1 %rcc.tmp.123, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.125 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.126 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [20 x i32], ptr %p, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  call void @my_free.([1024 x i32]* %rcc.tmp.125, i32* %rcc.tmp.126, i32 %rcc.tmp.130)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  store i32 %rcc.tmp.135, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.138 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.139 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.140 = load i32, ptr %p_large
  call void @my_free.([1024 x i32]* %rcc.tmp.138, i32* %rcc.tmp.139, i32 %rcc.tmp.140)
  %rcc.tmp.142 = load [1024 x i32]*, ptr %heap..tmp
  %rcc.tmp.143 = load i32*, ptr %free_list_head..tmp
  %rcc.tmp.144 = sub i32 1024, 100
  %rcc.tmp.145 = call i32 @my_malloc.([1024 x i32]* %rcc.tmp.142, i32* %rcc.tmp.143, i32 %rcc.tmp.144)
  store i32 %rcc.tmp.145, ptr %final_alloc
  %rcc.tmp.147 = load i32, ptr %final_alloc
  %rcc.tmp.148 = icmp sgt i32 %rcc.tmp.147, 0
  br i1 %rcc.tmp.148, label %if.then.6, label %if.else.6
if.then.6:
  call void @printlnInt.(i32 8888)
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  ret void
}
define void @another_level_of_scope.() {
entry:
  %heap = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %free_list_head = alloca i32 
  %p1 = alloca i32 
  %p2 = alloca i32 
  %outer_var = alloca i32 
  %inner_var = alloca i32 
  %i = alloca i32 
  %loop_var = alloca i32 
  %another_block_var = alloca i32 
  %test_ptr = alloca i32 
  %another_ptr = alloca i32 
  %temp_ptr = alloca i32 
  %i.2 = alloca i32 
  %j = alloca i32 
  %ptr_arr = alloca [5 x i32] 
  %k = alloca i32 
  %size = alloca i32 
  %final_check = alloca i32 
  %shadow_var = alloca i32 
  %shadow_var.2 = alloca i32 
  %temp_ptr_for_error = alloca i32 
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
  call void @init_heap.([1024 x i32]* %heap, i32* %free_list_head)
  call void @complex_memory_churn.([1024 x i32]* %heap, i32* %free_list_head)
  store i32 0, ptr %p1
  %rcc.tmp.16 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 50)
  store i32 %rcc.tmp.16, ptr %p2
  %rcc.tmp.18 = load i32, ptr %p2
  %rcc.tmp.19 = icmp sgt i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %p2
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.21, i32 50, i32 50)
  %rcc.tmp.23 = load i32, ptr %p2
  store i32 %rcc.tmp.23, ptr %p1
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.27 = load i32, ptr %p1
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %p1
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.30, i32 50, i32 50)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  store i32 1, ptr %outer_var
  %rcc.tmp.35 = load i32, ptr %outer_var
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 1
  br i1 %rcc.tmp.36, label %if.then.3, label %if.else.3
if.then.3:
  store i32 2, ptr %inner_var
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 10
  br i1 %rcc.tmp.42, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.45 = load i32, ptr %i
  store i32 %rcc.tmp.45, ptr %loop_var
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.47, 5
  br i1 %rcc.tmp.48, label %if.then.4, label %if.else.4
if.then.4:
  store i32 5, ptr %another_block_var
  %rcc.tmp.51 = load i32, ptr %another_block_var
  %rcc.tmp.52 = load i32, ptr %loop_var
  %rcc.tmp.53 = add i32 %rcc.tmp.51, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %another_block_var
  %rcc.tmp.55 = load i32, ptr %another_block_var
  call void @printlnInt.(i32 %rcc.tmp.55)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %i
  br label %while.cond
while.end:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.65 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 10)
  store i32 %rcc.tmp.65, ptr %test_ptr
  %rcc.tmp.67 = load i32, ptr %test_ptr
  %rcc.tmp.68 = icmp sgt i32 %rcc.tmp.67, 0
  br i1 %rcc.tmp.68, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.70 = load i32, ptr %test_ptr
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.70, i32 10, i32 99)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  store i32 0, ptr %another_ptr
  br i1 1, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.76 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 20)
  store i32 %rcc.tmp.76, ptr %temp_ptr
  %rcc.tmp.78 = load i32, ptr %temp_ptr
  %rcc.tmp.79 = icmp sgt i32 %rcc.tmp.78, 0
  br i1 %rcc.tmp.79, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.81 = load i32, ptr %temp_ptr
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.81, i32 20, i32 88)
  %rcc.tmp.83 = load i32, ptr %temp_ptr
  store i32 %rcc.tmp.83, ptr %another_ptr
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.89 = load i32, ptr %another_ptr
  %rcc.tmp.90 = icmp sgt i32 %rcc.tmp.89, 0
  br i1 %rcc.tmp.90, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.92 = load i32, ptr %another_ptr
  call void @verify_memory.([1024 x i32]* %heap, i32 %rcc.tmp.92, i32 20, i32 88)
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  store i32 0, ptr %i.2
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.98 = load i32, ptr %i.2
  %rcc.tmp.99 = icmp slt i32 %rcc.tmp.98, 5
  br i1 %rcc.tmp.99, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  %rcc.tmp.103 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.103
  %rcc.tmp.105 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.111
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.114 = load i32, ptr %j
  %rcc.tmp.115 = icmp slt i32 %rcc.tmp.114, 5
  br i1 %rcc.tmp.115, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %k
  %rcc.tmp.119 = load i32, ptr %i.2
  %rcc.tmp.120 = load i32, ptr %j
  %rcc.tmp.121 = add i32 %rcc.tmp.119, %rcc.tmp.120
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  %rcc.tmp.123 = mul i32 %rcc.tmp.122, 2
  store i32 %rcc.tmp.123, ptr %size
  %rcc.tmp.125 = load i32, ptr %j
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.128 = load i32, ptr %size
  %rcc.tmp.129 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.128)
  store i32 %rcc.tmp.129, ptr %rcc.tmp.127
  %rcc.tmp.131 = load i32, ptr %j
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 0
  %rcc.tmp.133 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 %rcc.tmp.132
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  %rcc.tmp.135 = icmp sgt i32 %rcc.tmp.134, 0
  br i1 %rcc.tmp.135, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.137 = load i32, ptr %j
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %size
  %rcc.tmp.142 = load i32, ptr %i.2
  %rcc.tmp.143 = mul i32 %rcc.tmp.142, 10
  %rcc.tmp.144 = load i32, ptr %j
  %rcc.tmp.145 = add i32 %rcc.tmp.143, %rcc.tmp.144
  call void @fill_memory.([1024 x i32]* %heap, i32 %rcc.tmp.140, i32 %rcc.tmp.141, i32 %rcc.tmp.145)
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.149 = load i32, ptr %j
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %j
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.155 = load i32, ptr %j
  %rcc.tmp.156 = icmp slt i32 %rcc.tmp.155, 5
  br i1 %rcc.tmp.156, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.159 = load i32, ptr %j
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 0
  %rcc.tmp.161 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 %rcc.tmp.160
  %rcc.tmp.162 = load i32, ptr %rcc.tmp.161
  %rcc.tmp.163 = icmp sgt i32 %rcc.tmp.162, 0
  br i1 %rcc.tmp.163, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.165 = load i32, ptr %j
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 0
  %rcc.tmp.167 = getelementptr [5 x i32], ptr %ptr_arr, i32 0, i32 %rcc.tmp.166
  %rcc.tmp.168 = load i32, ptr %rcc.tmp.167
  call void @my_free.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.168)
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.172 = load i32, ptr %j
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 1
  store i32 %rcc.tmp.173, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.176 = load i32, ptr %i.2
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 1
  store i32 %rcc.tmp.177, ptr %i.2
  br label %while.cond.2
while.end.2:
  %rcc.tmp.180 = sub i32 1024, 50
  %rcc.tmp.181 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.180)
  store i32 %rcc.tmp.181, ptr %final_check
  %rcc.tmp.183 = load i32, ptr %final_check
  %rcc.tmp.184 = icmp sgt i32 %rcc.tmp.183, 0
  br i1 %rcc.tmp.184, label %if.then.11, label %if.else.11
if.then.11:
  call void @printlnInt.(i32 7777)
  br label %if.merge.11
if.else.11:
  %rcc.tmp.188 = sub i32 0, 7777
  call void @printlnInt.(i32 %rcc.tmp.188)
  br label %if.merge.11
if.merge.11:
  store i32 10, ptr %shadow_var
  %rcc.tmp.192 = load i32, ptr %shadow_var
  %rcc.tmp.193 = icmp sgt i32 %rcc.tmp.192, 5
  br i1 %rcc.tmp.193, label %if.then.12, label %if.else.12
if.then.12:
  store i32 20, ptr %shadow_var.2
  %rcc.tmp.196 = load i32, ptr %shadow_var.2
  %rcc.tmp.197 = add i32 %rcc.tmp.196, 1
  store i32 %rcc.tmp.197, ptr %shadow_var.2
  %rcc.tmp.199 = load i32, ptr %shadow_var.2
  call void @printlnInt.(i32 %rcc.tmp.199)
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.203 = load i32, ptr %shadow_var
  call void @printlnInt.(i32 %rcc.tmp.203)
  %rcc.tmp.205 = call i32 @my_malloc.([1024 x i32]* %heap, i32* %free_list_head, i32 1)
  store i32 %rcc.tmp.205, ptr %temp_ptr_for_error
  %rcc.tmp.207 = load i32, ptr %temp_ptr_for_error
  call void @my_free.([1024 x i32]* %heap, i32* %free_list_head, i32 %rcc.tmp.207)
  ret void
}
