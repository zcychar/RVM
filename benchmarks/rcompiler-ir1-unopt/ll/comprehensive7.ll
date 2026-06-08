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
  call void @printlnInt.(i32 1700)
  call void @testGraphTraversalAlgorithms.()
  call void @testShortestPathAlgorithms.()
  call void @testMinimumSpanningTreeAlgorithms.()
  call void @testNetworkFlowAlgorithms.()
  call void @testGraphConnectivityAlgorithms.()
  call void @printlnInt.(i32 1799)
  call void @exit.(i32 0)
  ret void
}
define void @testGraphTraversalAlgorithms.() {
entry:
  %graph = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %dfs_result = alloca i32 
  %bfs_result = alloca i32 
  %iterative_dfs_result = alloca i32 
  %cycle_result = alloca i32 
  call void @printlnInt.(i32 1701)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %graph, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeGraph.([2500 x i32]* %graph, i32 50)
  %rcc.tmp.14 = call i32 @depthFirstSearch.([2500 x i32]* %graph, i32 50, i32 0)
  store i32 %rcc.tmp.14, ptr %dfs_result
  %rcc.tmp.16 = load i32, ptr %dfs_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @breadthFirstSearch.([2500 x i32]* %graph, i32 50, i32 0)
  store i32 %rcc.tmp.18, ptr %bfs_result
  %rcc.tmp.20 = load i32, ptr %bfs_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @iterativeDepthFirstSearch.([2500 x i32]* %graph, i32 50, i32 0)
  store i32 %rcc.tmp.22, ptr %iterative_dfs_result
  %rcc.tmp.24 = load i32, ptr %iterative_dfs_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @detectCycles.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.26, ptr %cycle_result
  %rcc.tmp.28 = load i32, ptr %cycle_result
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1702)
  ret void
}
define void @initializeGraph.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.15 = getelementptr [2500 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %j
  %rcc.tmp.37 = icmp ne i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = srem i32 %rcc.tmp.41, 7
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.42, 0
  br i1 %rcc.tmp.43, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load i32, ptr %j
  %rcc.tmp.47 = mul i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = srem i32 %rcc.tmp.47, 11
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.51 = phi i1 [1, %and.rhs], [%rcc.tmp.49, %or.rhs]
  br label %sc.merge
sc.merge:
  %rcc.tmp.53 = phi i1 [0, %while.body.3], [%rcc.tmp.51, %sc.merge.2]
  br i1 %rcc.tmp.53, label %if.then, label %if.else
if.then:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load i32, ptr %size..tmp
  %rcc.tmp.57 = mul i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %j
  %rcc.tmp.59 = add i32 %rcc.tmp.57, %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.62 = getelementptr [2500 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.63, %rcc.tmp.64
  %rcc.tmp.66 = srem i32 %rcc.tmp.65, 10
  %rcc.tmp.67 = add i32 1, %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %rcc.tmp.62
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = load i32, ptr %size..tmp
  %rcc.tmp.71 = mul i32 %rcc.tmp.69, %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.71, %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.76 = getelementptr [2500 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = load i32, ptr %j
  %rcc.tmp.79 = add i32 %rcc.tmp.77, %rcc.tmp.78
  %rcc.tmp.80 = srem i32 %rcc.tmp.79, 10
  %rcc.tmp.81 = add i32 1, %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %rcc.tmp.76
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @depthFirstSearch.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 50
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.9
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.15 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.16 = load i32, ptr %size..tmp
  %rcc.tmp.17 = load i32, ptr %start..tmp
  %rcc.tmp.18 = call i32 @dfsRecursive.([2500 x i32]* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17, [50 x i1]* %visited)
  ret i32 %rcc.tmp.18
}
define i32 @dfsRecursive.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %node.tmp, [50 x i1]* %visited.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %node..tmp = alloca i32 
  %visited..tmp = alloca [50 x i1]* 
  %nodes_visited = alloca i32 
  %neighbor = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store [50 x i1]* %visited.tmp, ptr %visited..tmp
  %rcc.tmp.5 = load i32, ptr %node..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.8 = getelementptr [50 x i1], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  store i1 1, ptr %rcc.tmp.8
  store i32 1, ptr %nodes_visited
  store i32 0, ptr %neighbor
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %neighbor
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %node..tmp
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %neighbor
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.25 = getelementptr [2500 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = icmp sgt i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.29 = load i32, ptr %neighbor
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.32 = getelementptr [50 x i1], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i1, ptr %rcc.tmp.32
  %rcc.tmp.34 = xor i1 %rcc.tmp.33, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.body], [%rcc.tmp.34, %and.rhs]
  br i1 %rcc.tmp.36, label %if.then, label %if.else
if.then:
  %rcc.tmp.38 = load i32, ptr %nodes_visited
  %rcc.tmp.39 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.40 = load i32, ptr %size..tmp
  %rcc.tmp.41 = load i32, ptr %neighbor
  %rcc.tmp.42 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.43 = call i32 @dfsRecursive.([2500 x i32]* %rcc.tmp.39, i32 %rcc.tmp.40, i32 %rcc.tmp.41, [50 x i1]* %rcc.tmp.42)
  %rcc.tmp.44 = add i32 %rcc.tmp.38, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %nodes_visited
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %neighbor
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %neighbor
  br label %while.cond
while.end:
  %rcc.tmp.52 = load i32, ptr %nodes_visited
  ret i32 %rcc.tmp.52
}
define i32 @breadthFirstSearch.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx = alloca i32 
  %queue = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %queue_front = alloca i32 
  %queue_rear = alloca i32 
  %nodes_visited = alloca i32 
  %current_node = alloca i32 
  %neighbor = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 50
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.9
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 50
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = sub i32 0, 1
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.24, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %queue_front
  store i32 0, ptr %queue_rear
  store i32 0, ptr %nodes_visited
  %rcc.tmp.30 = load i32, ptr %queue_rear
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %start..tmp
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %queue_rear
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %queue_rear
  %rcc.tmp.38 = load i32, ptr %start..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.39
  store i1 1, ptr %rcc.tmp.40
  br label %while.cond
while.cond:
  %rcc.tmp.43 = load i32, ptr %queue_front
  %rcc.tmp.44 = load i32, ptr %queue_rear
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.48 = load i32, ptr %queue_front
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %current_node
  %rcc.tmp.53 = load i32, ptr %queue_front
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %queue_front
  %rcc.tmp.56 = load i32, ptr %nodes_visited
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %nodes_visited
  store i32 0, ptr %neighbor
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.61 = load i32, ptr %neighbor
  %rcc.tmp.62 = load i32, ptr %size..tmp
  %rcc.tmp.63 = icmp slt i32 %rcc.tmp.61, %rcc.tmp.62
  br i1 %rcc.tmp.63, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.66 = load i32, ptr %current_node
  %rcc.tmp.67 = load i32, ptr %size..tmp
  %rcc.tmp.68 = mul i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %neighbor
  %rcc.tmp.70 = add i32 %rcc.tmp.68, %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.73 = getelementptr [2500 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = icmp sgt i32 %rcc.tmp.74, 0
  br i1 %rcc.tmp.75, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.77 = load i32, ptr %neighbor
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i1, ptr %rcc.tmp.79
  %rcc.tmp.81 = xor i1 %rcc.tmp.80, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.83 = phi i1 [0, %while.body.2], [%rcc.tmp.81, %and.rhs]
  br i1 %rcc.tmp.83, label %if.then, label %if.else
if.then:
  %rcc.tmp.85 = load i32, ptr %neighbor
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.86
  store i1 1, ptr %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %queue_rear
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [50 x i32], ptr %queue, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %neighbor
  store i32 %rcc.tmp.92, ptr %rcc.tmp.91
  %rcc.tmp.94 = load i32, ptr %queue_rear
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %queue_rear
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.99 = load i32, ptr %neighbor
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %neighbor
  br label %while.cond.2
while.end.2:
  br label %while.cond
while.end:
  %rcc.tmp.104 = load i32, ptr %nodes_visited
  ret i32 %rcc.tmp.104
}
define i32 @iterativeDepthFirstSearch.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx = alloca i32 
  %stack = alloca [1250 x i32] 
  %fill.idx.2 = alloca i32 
  %stack_top = alloca i32 
  %nodes_visited = alloca i32 
  %current_node = alloca i32 
  %neighbor = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 50
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.9
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 1250
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [1250 x i32], ptr %stack, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = sub i32 0, 1
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.24, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %stack_top
  store i32 0, ptr %nodes_visited
  %rcc.tmp.29 = load i32, ptr %stack_top
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [1250 x i32], ptr %stack, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %start..tmp
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %stack_top
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %stack_top
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %stack_top
  %rcc.tmp.39 = icmp sgt i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.42 = load i32, ptr %stack_top
  %rcc.tmp.43 = sub i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %stack_top
  %rcc.tmp.45 = load i32, ptr %stack_top
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [1250 x i32], ptr %stack, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %current_node
  %rcc.tmp.50 = load i32, ptr %current_node
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i1, ptr %rcc.tmp.52
  %rcc.tmp.54 = xor i1 %rcc.tmp.53, true
  br i1 %rcc.tmp.54, label %if.then, label %if.else
if.then:
  %rcc.tmp.56 = load i32, ptr %current_node
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.57
  store i1 1, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %nodes_visited
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %nodes_visited
  store i32 0, ptr %neighbor
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %neighbor
  %rcc.tmp.66 = load i32, ptr %size..tmp
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.66
  br i1 %rcc.tmp.67, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.70 = load i32, ptr %current_node
  %rcc.tmp.71 = load i32, ptr %size..tmp
  %rcc.tmp.72 = mul i32 %rcc.tmp.70, %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %neighbor
  %rcc.tmp.74 = add i32 %rcc.tmp.72, %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.77 = getelementptr [2500 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = icmp sgt i32 %rcc.tmp.78, 0
  br i1 %rcc.tmp.79, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.81 = load i32, ptr %neighbor
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i1, ptr %rcc.tmp.83
  %rcc.tmp.85 = xor i1 %rcc.tmp.84, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.87 = phi i1 [0, %while.body.2], [%rcc.tmp.85, %and.rhs]
  br i1 %rcc.tmp.87, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.89 = load i32, ptr %stack_top
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [1250 x i32], ptr %stack, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %neighbor
  store i32 %rcc.tmp.92, ptr %rcc.tmp.91
  %rcc.tmp.94 = load i32, ptr %stack_top
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %stack_top
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.99 = load i32, ptr %neighbor
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %neighbor
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.106 = load i32, ptr %nodes_visited
  ret i32 %rcc.tmp.106
}
define i32 @detectCycles.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx = alloca i32 
  %in_recursion_stack = alloca [50 x i1] 
  %fill.idx.2 = alloca i32 
  %cycles_found = alloca i32 
  %i = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.8
  store i1 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [50 x i1], ptr %in_recursion_stack, i32 0, i32 %rcc.tmp.19
  store i1 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %cycles_found
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i1, ptr %rcc.tmp.35
  %rcc.tmp.37 = xor i1 %rcc.tmp.36, true
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.40 = load i32, ptr %size..tmp
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = call i1 @dfsCycleDetection.([2500 x i32]* %rcc.tmp.39, i32 %rcc.tmp.40, i32 %rcc.tmp.41, [50 x i1]* %visited, [50 x i1]* %in_recursion_stack)
  br i1 %rcc.tmp.42, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.44 = load i32, ptr %cycles_found
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %cycles_found
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %cycles_found
  ret i32 %rcc.tmp.55
}
define i1 @dfsCycleDetection.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %node.tmp, [50 x i1]* %visited.tmp, [50 x i1]* %in_recursion_stack.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %node..tmp = alloca i32 
  %visited..tmp = alloca [50 x i1]* 
  %in_recursion_stack..tmp = alloca [50 x i1]* 
  %neighbor = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store [50 x i1]* %visited.tmp, ptr %visited..tmp
  store [50 x i1]* %in_recursion_stack.tmp, ptr %in_recursion_stack..tmp
  %rcc.tmp.6 = load i32, ptr %node..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.9 = getelementptr [50 x i1], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.7
  store i1 1, ptr %rcc.tmp.9
  %rcc.tmp.11 = load i32, ptr %node..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [50 x i1]*, ptr %in_recursion_stack..tmp
  %rcc.tmp.14 = getelementptr [50 x i1], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  store i1 1, ptr %rcc.tmp.14
  store i32 0, ptr %neighbor
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %neighbor
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = mul i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %neighbor
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.30 = getelementptr [2500 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp sgt i32 %rcc.tmp.31, 0
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  %rcc.tmp.34 = load i32, ptr %neighbor
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.37 = getelementptr [50 x i1], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i1, ptr %rcc.tmp.37
  %rcc.tmp.39 = xor i1 %rcc.tmp.38, true
  br i1 %rcc.tmp.39, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.41 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.42 = load i32, ptr %size..tmp
  %rcc.tmp.43 = load i32, ptr %neighbor
  %rcc.tmp.44 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.45 = load [50 x i1]*, ptr %in_recursion_stack..tmp
  %rcc.tmp.46 = call i1 @dfsCycleDetection.([2500 x i32]* %rcc.tmp.41, i32 %rcc.tmp.42, i32 %rcc.tmp.43, [50 x i1]* %rcc.tmp.44, [50 x i1]* %rcc.tmp.45)
  br i1 %rcc.tmp.46, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 1
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.51 = load i32, ptr %neighbor
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [50 x i1]*, ptr %in_recursion_stack..tmp
  %rcc.tmp.54 = getelementptr [50 x i1], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i1, ptr %rcc.tmp.54
  br i1 %rcc.tmp.55, label %if.then.4, label %if.else.4
if.then.4:
  ret i1 1
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.62 = load i32, ptr %neighbor
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %neighbor
  br label %while.cond
while.end:
  %rcc.tmp.66 = load i32, ptr %node..tmp
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = load [50 x i1]*, ptr %in_recursion_stack..tmp
  %rcc.tmp.69 = getelementptr [50 x i1], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  store i1 0, ptr %rcc.tmp.69
  ret i1 0
}
define void @testShortestPathAlgorithms.() {
entry:
  %graph = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %dijkstra_result = alloca i32 
  %floyd_result = alloca i32 
  %bellman_result = alloca i32 
  call void @printlnInt.(i32 1703)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %graph, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeWeightedGraph.([2500 x i32]* %graph, i32 50)
  %rcc.tmp.14 = call i32 @dijkstraShortestPath.([2500 x i32]* %graph, i32 50, i32 0)
  store i32 %rcc.tmp.14, ptr %dijkstra_result
  %rcc.tmp.16 = load i32, ptr %dijkstra_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @floydWarshallAllPairs.([2500 x i32]* %graph, i32 20)
  store i32 %rcc.tmp.18, ptr %floyd_result
  %rcc.tmp.20 = load i32, ptr %floyd_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @bellmanFordShortestPath.([2500 x i32]* %graph, i32 50, i32 0)
  store i32 %rcc.tmp.22, ptr %bellman_result
  %rcc.tmp.24 = load i32, ptr %bellman_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  call void @printlnInt.(i32 1704)
  ret void
}
define void @initializeWeightedGraph.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %weight = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.15 = getelementptr [2500 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 9999, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = mul i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.35 = getelementptr [2500 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = load i32, ptr %size..tmp
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = icmp ne i32 %rcc.tmp.55, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = srem i32 %rcc.tmp.61, 5
  %rcc.tmp.63 = icmp eq i32 %rcc.tmp.62, 0
  br i1 %rcc.tmp.63, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = mul i32 %rcc.tmp.65, 2
  %rcc.tmp.67 = load i32, ptr %j
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = srem i32 %rcc.tmp.68, 7
  %rcc.tmp.70 = icmp eq i32 %rcc.tmp.69, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.72 = phi i1 [1, %and.rhs], [%rcc.tmp.70, %or.rhs]
  br label %sc.merge
sc.merge:
  %rcc.tmp.74 = phi i1 [0, %while.body.4], [%rcc.tmp.72, %sc.merge.2]
  br i1 %rcc.tmp.74, label %if.then, label %if.else
if.then:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.76, %rcc.tmp.77
  %rcc.tmp.79 = srem i32 %rcc.tmp.78, 15
  %rcc.tmp.80 = add i32 1, %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %weight
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = load i32, ptr %size..tmp
  %rcc.tmp.84 = mul i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.89 = getelementptr [2500 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %weight
  store i32 %rcc.tmp.90, ptr %rcc.tmp.89
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.94 = load i32, ptr %j
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define i32 @dijkstraShortestPath.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %distances = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx.2 = alloca i32 
  %total_distance = alloca i32 
  %count = alloca i32 
  %min_distance = alloca i32 
  %min_node = alloca i32 
  %i = alloca i32 
  %new_distance = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 50
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.9
  store i32 9999, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 50
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.20
  store i1 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %total_distance
  %rcc.tmp.27 = load i32, ptr %start..tmp
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.28
  store i32 0, ptr %rcc.tmp.29
  store i32 0, ptr %count
  br label %while.cond
while.cond:
  %rcc.tmp.33 = load i32, ptr %count
  %rcc.tmp.34 = load i32, ptr %size..tmp
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 9999, ptr %min_distance
  %rcc.tmp.39 = sub i32 0, 1
  store i32 %rcc.tmp.39, ptr %min_node
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i1, ptr %rcc.tmp.50
  %rcc.tmp.52 = xor i1 %rcc.tmp.51, true
  br i1 %rcc.tmp.52, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %min_distance
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.57, %rcc.tmp.58
  br label %sc.merge
sc.merge:
  %rcc.tmp.61 = phi i1 [0, %while.body.2], [%rcc.tmp.59, %and.rhs]
  br i1 %rcc.tmp.61, label %if.then, label %if.else
if.then:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %min_distance
  %rcc.tmp.68 = load i32, ptr %i
  store i32 %rcc.tmp.68, ptr %min_node
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.76 = load i32, ptr %min_node
  %rcc.tmp.77 = sub i32 0, 1
  %rcc.tmp.78 = icmp eq i32 %rcc.tmp.76, %rcc.tmp.77
  br i1 %rcc.tmp.78, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.82 = load i32, ptr %min_node
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.83
  store i1 1, ptr %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %total_distance
  %rcc.tmp.87 = load i32, ptr %min_node
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.86, %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %total_distance
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = load i32, ptr %size..tmp
  %rcc.tmp.97 = icmp slt i32 %rcc.tmp.95, %rcc.tmp.96
  br i1 %rcc.tmp.97, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.100 = load i32, ptr %i
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i1, ptr %rcc.tmp.102
  %rcc.tmp.104 = xor i1 %rcc.tmp.103, true
  br i1 %rcc.tmp.104, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.106 = load i32, ptr %min_node
  %rcc.tmp.107 = load i32, ptr %size..tmp
  %rcc.tmp.108 = mul i32 %rcc.tmp.106, %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = add i32 %rcc.tmp.108, %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.113 = getelementptr [2500 x i32], ptr %rcc.tmp.112, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = icmp ne i32 %rcc.tmp.114, 9999
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.117 = phi i1 [0, %while.body.3], [%rcc.tmp.115, %and.rhs.2]
  br i1 %rcc.tmp.117, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.119 = load i32, ptr %min_node
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %min_node
  %rcc.tmp.124 = load i32, ptr %size..tmp
  %rcc.tmp.125 = mul i32 %rcc.tmp.123, %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = add i32 %rcc.tmp.125, %rcc.tmp.126
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.130 = getelementptr [2500 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = add i32 %rcc.tmp.122, %rcc.tmp.131
  store i32 %rcc.tmp.132, ptr %new_distance
  %rcc.tmp.134 = load i32, ptr %new_distance
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  %rcc.tmp.139 = icmp slt i32 %rcc.tmp.134, %rcc.tmp.138
  br i1 %rcc.tmp.139, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %new_distance
  store i32 %rcc.tmp.144, ptr %rcc.tmp.143
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.150 = load i32, ptr %i
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 1
  store i32 %rcc.tmp.151, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.154 = load i32, ptr %count
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %count
  br label %while.cond
while.end:
  %rcc.tmp.158 = load i32, ptr %total_distance
  ret i32 %rcc.tmp.158
}
define i32 @floydWarshallAllPairs.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %actual_size = alloca i32 
  %distances = alloca [400 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %j.2 = alloca i32 
  %new_distance = alloca i32 
  %total_distance = alloca i32 
  %j.3 = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = icmp sgt i32 %rcc.tmp.3, 20
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  br label %if.merge
if.else:
  %rcc.tmp.7 = load i32, ptr %size..tmp
  br label %if.merge
if.merge:
  %rcc.tmp.9 = phi i32 [20, %if.then], [%rcc.tmp.7, %if.else]
  store i32 %rcc.tmp.9, ptr %actual_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.13 = load i32, ptr %fill.idx
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 400
  br i1 %rcc.tmp.14, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.16 = load i32, ptr %fill.idx
  %rcc.tmp.17 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.16
  store i32 9999, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %actual_size
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = load i32, ptr %actual_size
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = load i32, ptr %actual_size
  %rcc.tmp.38 = mul i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.38, %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = mul i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %j
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.50 = getelementptr [2500 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %rcc.tmp.42
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.63 = load i32, ptr %k
  %rcc.tmp.64 = load i32, ptr %actual_size
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.63, %rcc.tmp.64
  br i1 %rcc.tmp.65, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = load i32, ptr %actual_size
  %rcc.tmp.72 = icmp slt i32 %rcc.tmp.70, %rcc.tmp.71
  br i1 %rcc.tmp.72, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %j.2
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.77 = load i32, ptr %j.2
  %rcc.tmp.78 = load i32, ptr %actual_size
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = load i32, ptr %actual_size
  %rcc.tmp.84 = mul i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %k
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = icmp ne i32 %rcc.tmp.89, 9999
  br i1 %rcc.tmp.90, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.92 = load i32, ptr %k
  %rcc.tmp.93 = load i32, ptr %actual_size
  %rcc.tmp.94 = mul i32 %rcc.tmp.92, %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %j.2
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.98
  %rcc.tmp.100 = icmp ne i32 %rcc.tmp.99, 9999
  br label %sc.merge
sc.merge:
  %rcc.tmp.102 = phi i1 [0, %while.body.5], [%rcc.tmp.100, %and.rhs]
  br i1 %rcc.tmp.102, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = load i32, ptr %actual_size
  %rcc.tmp.106 = mul i32 %rcc.tmp.104, %rcc.tmp.105
  %rcc.tmp.107 = load i32, ptr %k
  %rcc.tmp.108 = add i32 %rcc.tmp.106, %rcc.tmp.107
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %k
  %rcc.tmp.113 = load i32, ptr %actual_size
  %rcc.tmp.114 = mul i32 %rcc.tmp.112, %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %j.2
  %rcc.tmp.116 = add i32 %rcc.tmp.114, %rcc.tmp.115
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = add i32 %rcc.tmp.111, %rcc.tmp.119
  store i32 %rcc.tmp.120, ptr %new_distance
  %rcc.tmp.122 = load i32, ptr %new_distance
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = load i32, ptr %actual_size
  %rcc.tmp.125 = mul i32 %rcc.tmp.123, %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %j.2
  %rcc.tmp.127 = add i32 %rcc.tmp.125, %rcc.tmp.126
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  %rcc.tmp.131 = icmp slt i32 %rcc.tmp.122, %rcc.tmp.130
  br i1 %rcc.tmp.131, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = load i32, ptr %actual_size
  %rcc.tmp.135 = mul i32 %rcc.tmp.133, %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %j.2
  %rcc.tmp.137 = add i32 %rcc.tmp.135, %rcc.tmp.136
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %new_distance
  store i32 %rcc.tmp.140, ptr %rcc.tmp.139
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.146 = load i32, ptr %j.2
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %j.2
  br label %while.cond.5
while.end.5:
  %rcc.tmp.150 = load i32, ptr %i
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 1
  store i32 %rcc.tmp.151, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.154 = load i32, ptr %k
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %k
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %total_distance
  store i32 0, ptr %i
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.161 = load i32, ptr %i
  %rcc.tmp.162 = load i32, ptr %actual_size
  %rcc.tmp.163 = icmp slt i32 %rcc.tmp.161, %rcc.tmp.162
  br i1 %rcc.tmp.163, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  store i32 0, ptr %j.3
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.168 = load i32, ptr %j.3
  %rcc.tmp.169 = load i32, ptr %actual_size
  %rcc.tmp.170 = icmp slt i32 %rcc.tmp.168, %rcc.tmp.169
  br i1 %rcc.tmp.170, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = load i32, ptr %j.3
  %rcc.tmp.175 = icmp ne i32 %rcc.tmp.173, %rcc.tmp.174
  br i1 %rcc.tmp.175, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.177 = load i32, ptr %i
  %rcc.tmp.178 = load i32, ptr %actual_size
  %rcc.tmp.179 = mul i32 %rcc.tmp.177, %rcc.tmp.178
  %rcc.tmp.180 = load i32, ptr %j.3
  %rcc.tmp.181 = add i32 %rcc.tmp.179, %rcc.tmp.180
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.183
  %rcc.tmp.185 = icmp ne i32 %rcc.tmp.184, 9999
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.187 = phi i1 [0, %while.body.7], [%rcc.tmp.185, %and.rhs.2]
  br i1 %rcc.tmp.187, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.189 = load i32, ptr %total_distance
  %rcc.tmp.190 = load i32, ptr %i
  %rcc.tmp.191 = load i32, ptr %actual_size
  %rcc.tmp.192 = mul i32 %rcc.tmp.190, %rcc.tmp.191
  %rcc.tmp.193 = load i32, ptr %j.3
  %rcc.tmp.194 = add i32 %rcc.tmp.192, %rcc.tmp.193
  %rcc.tmp.195 = add i32 %rcc.tmp.194, 0
  %rcc.tmp.196 = getelementptr [400 x i32], ptr %distances, i32 0, i32 %rcc.tmp.195
  %rcc.tmp.197 = load i32, ptr %rcc.tmp.196
  %rcc.tmp.198 = add i32 %rcc.tmp.189, %rcc.tmp.197
  store i32 %rcc.tmp.198, ptr %total_distance
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.202 = load i32, ptr %j.3
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 1
  store i32 %rcc.tmp.203, ptr %j.3
  br label %while.cond.7
while.end.7:
  %rcc.tmp.206 = load i32, ptr %i
  %rcc.tmp.207 = add i32 %rcc.tmp.206, 1
  store i32 %rcc.tmp.207, ptr %i
  br label %while.cond.6
while.end.6:
  %rcc.tmp.210 = load i32, ptr %total_distance
  ret i32 %rcc.tmp.210
}
define i32 @bellmanFordShortestPath.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %start.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %start..tmp = alloca i32 
  %distances = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %negative_cycles = alloca i32 
  %iteration = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %new_distance = alloca i32 
  %i.2 = alloca i32 
  %j.2 = alloca i32 
  %new_distance.2 = alloca i32 
  %total_distance = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 50
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.9
  store i32 9999, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.15 = load i32, ptr %start..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.16
  store i32 0, ptr %rcc.tmp.17
  store i32 0, ptr %negative_cycles
  store i32 0, ptr %iteration
  br label %while.cond
while.cond:
  %rcc.tmp.22 = load i32, ptr %iteration
  %rcc.tmp.23 = load i32, ptr %size..tmp
  %rcc.tmp.24 = sub i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = load i32, ptr %size..tmp
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = load i32, ptr %size..tmp
  %rcc.tmp.44 = mul i32 %rcc.tmp.42, %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = add i32 %rcc.tmp.44, %rcc.tmp.45
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.49 = getelementptr [2500 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = icmp ne i32 %rcc.tmp.50, 9999
  br i1 %rcc.tmp.51, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp ne i32 %rcc.tmp.56, 9999
  br label %sc.merge
sc.merge:
  %rcc.tmp.59 = phi i1 [0, %while.body.3], [%rcc.tmp.57, %and.rhs]
  br i1 %rcc.tmp.59, label %if.then, label %if.else
if.then:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = load i32, ptr %size..tmp
  %rcc.tmp.67 = mul i32 %rcc.tmp.65, %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = add i32 %rcc.tmp.67, %rcc.tmp.68
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.72 = getelementptr [2500 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.64, %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %new_distance
  %rcc.tmp.76 = load i32, ptr %new_distance
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.76, %rcc.tmp.80
  br i1 %rcc.tmp.81, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.83 = load i32, ptr %negative_cycles
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %negative_cycles
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.98 = load i32, ptr %iteration
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %iteration
  br label %while.cond
while.end:
  store i32 0, ptr %i.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.104 = load i32, ptr %i.2
  %rcc.tmp.105 = load i32, ptr %size..tmp
  %rcc.tmp.106 = icmp slt i32 %rcc.tmp.104, %rcc.tmp.105
  br i1 %rcc.tmp.106, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %j.2
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.111 = load i32, ptr %j.2
  %rcc.tmp.112 = load i32, ptr %size..tmp
  %rcc.tmp.113 = icmp slt i32 %rcc.tmp.111, %rcc.tmp.112
  br i1 %rcc.tmp.113, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.116 = load i32, ptr %i.2
  %rcc.tmp.117 = load i32, ptr %size..tmp
  %rcc.tmp.118 = mul i32 %rcc.tmp.116, %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %j.2
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.123 = getelementptr [2500 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = icmp ne i32 %rcc.tmp.124, 9999
  br i1 %rcc.tmp.125, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.127 = load i32, ptr %i.2
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  %rcc.tmp.131 = icmp ne i32 %rcc.tmp.130, 9999
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.133 = phi i1 [0, %while.body.5], [%rcc.tmp.131, %and.rhs.2]
  br i1 %rcc.tmp.133, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.135 = load i32, ptr %i.2
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  %rcc.tmp.139 = load i32, ptr %i.2
  %rcc.tmp.140 = load i32, ptr %size..tmp
  %rcc.tmp.141 = mul i32 %rcc.tmp.139, %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %j.2
  %rcc.tmp.143 = add i32 %rcc.tmp.141, %rcc.tmp.142
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 0
  %rcc.tmp.145 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.146 = getelementptr [2500 x i32], ptr %rcc.tmp.145, i32 0, i32 %rcc.tmp.144
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.146
  %rcc.tmp.148 = add i32 %rcc.tmp.138, %rcc.tmp.147
  store i32 %rcc.tmp.148, ptr %new_distance.2
  %rcc.tmp.150 = load i32, ptr %new_distance.2
  %rcc.tmp.151 = load i32, ptr %j.2
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = icmp slt i32 %rcc.tmp.150, %rcc.tmp.154
  br i1 %rcc.tmp.155, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.157 = load i32, ptr %negative_cycles
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 1
  store i32 %rcc.tmp.158, ptr %negative_cycles
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.164 = load i32, ptr %j.2
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 1
  store i32 %rcc.tmp.165, ptr %j.2
  br label %while.cond.5
while.end.5:
  %rcc.tmp.168 = load i32, ptr %i.2
  %rcc.tmp.169 = add i32 %rcc.tmp.168, 1
  store i32 %rcc.tmp.169, ptr %i.2
  br label %while.cond.4
while.end.4:
  store i32 0, ptr %total_distance
  store i32 0, ptr %i.2
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.175 = load i32, ptr %i.2
  %rcc.tmp.176 = load i32, ptr %size..tmp
  %rcc.tmp.177 = icmp slt i32 %rcc.tmp.175, %rcc.tmp.176
  br i1 %rcc.tmp.177, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.180 = load i32, ptr %i.2
  %rcc.tmp.181 = add i32 %rcc.tmp.180, 0
  %rcc.tmp.182 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.181
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.182
  %rcc.tmp.184 = icmp ne i32 %rcc.tmp.183, 9999
  br i1 %rcc.tmp.184, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.186 = load i32, ptr %total_distance
  %rcc.tmp.187 = load i32, ptr %i.2
  %rcc.tmp.188 = add i32 %rcc.tmp.187, 0
  %rcc.tmp.189 = getelementptr [50 x i32], ptr %distances, i32 0, i32 %rcc.tmp.188
  %rcc.tmp.190 = load i32, ptr %rcc.tmp.189
  %rcc.tmp.191 = add i32 %rcc.tmp.186, %rcc.tmp.190
  store i32 %rcc.tmp.191, ptr %total_distance
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.195 = load i32, ptr %i.2
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 1
  store i32 %rcc.tmp.196, ptr %i.2
  br label %while.cond.6
while.end.6:
  %rcc.tmp.199 = load i32, ptr %total_distance
  %rcc.tmp.200 = load i32, ptr %negative_cycles
  %rcc.tmp.201 = add i32 %rcc.tmp.199, %rcc.tmp.200
  ret i32 %rcc.tmp.201
}
define void @testMinimumSpanningTreeAlgorithms.() {
entry:
  %graph = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %kruskal_result = alloca i32 
  %prim_result = alloca i32 
  call void @printlnInt.(i32 1705)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %graph, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeWeightedGraph.([2500 x i32]* %graph, i32 50)
  %rcc.tmp.14 = call i32 @kruskalMST.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.14, ptr %kruskal_result
  %rcc.tmp.16 = load i32, ptr %kruskal_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @primMST.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.18, ptr %prim_result
  %rcc.tmp.20 = load i32, ptr %prim_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 1706)
  ret void
}
define i32 @kruskalMST.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %edges = alloca [1500 x i32] 
  %fill.idx = alloca i32 
  %edge_count = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %mst_weight = alloca i32 
  %mst_edges = alloca i32 
  %edge_index = alloca i32 
  %weight = alloca i32 
  %src = alloca i32 
  %dest = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 1500
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %edge_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.21 = load i32, ptr %edge_count
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 500
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %while.cond], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = load i32, ptr %size..tmp
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.35 = load i32, ptr %edge_count
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 500
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.38 = phi i1 [0, %while.cond.2], [%rcc.tmp.36, %and.rhs.2]
  br i1 %rcc.tmp.38, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = load i32, ptr %size..tmp
  %rcc.tmp.43 = mul i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.48 = getelementptr [2500 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp ne i32 %rcc.tmp.49, 9999
  br i1 %rcc.tmp.50, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = mul i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.59 = getelementptr [2500 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = icmp ne i32 %rcc.tmp.60, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.63 = phi i1 [0, %while.body.2], [%rcc.tmp.61, %and.rhs.3]
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  %rcc.tmp.65 = load i32, ptr %edge_count
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = mul i32 %rcc.tmp.66, 3
  %rcc.tmp.68 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = load i32, ptr %size..tmp
  %rcc.tmp.71 = mul i32 %rcc.tmp.69, %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = add i32 %rcc.tmp.71, %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.76 = getelementptr [2500 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %rcc.tmp.68
  %rcc.tmp.79 = load i32, ptr %edge_count
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = mul i32 %rcc.tmp.80, 3
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %i
  store i32 %rcc.tmp.84, ptr %rcc.tmp.83
  %rcc.tmp.86 = load i32, ptr %edge_count
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = mul i32 %rcc.tmp.87, 3
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 2
  %rcc.tmp.90 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %j
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %edge_count
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %edge_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.98 = load i32, ptr %j
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.106 = load i32, ptr %edge_count
  call void @sortEdgesByWeight.([1500 x i32]* %edges, i32 %rcc.tmp.106)
  store i32 0, ptr %mst_weight
  store i32 0, ptr %mst_edges
  store i32 0, ptr %edge_index
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.112 = load i32, ptr %edge_index
  %rcc.tmp.113 = load i32, ptr %edge_count
  %rcc.tmp.114 = icmp slt i32 %rcc.tmp.112, %rcc.tmp.113
  br i1 %rcc.tmp.114, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.116 = load i32, ptr %mst_edges
  %rcc.tmp.117 = load i32, ptr %size..tmp
  %rcc.tmp.118 = sub i32 %rcc.tmp.117, 1
  %rcc.tmp.119 = icmp slt i32 %rcc.tmp.116, %rcc.tmp.118
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.121 = phi i1 [0, %while.cond.3], [%rcc.tmp.119, %and.rhs.4]
  br i1 %rcc.tmp.121, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.124 = load i32, ptr %edge_index
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = mul i32 %rcc.tmp.125, 3
  %rcc.tmp.127 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %weight
  %rcc.tmp.130 = load i32, ptr %edge_index
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = mul i32 %rcc.tmp.131, 3
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  %rcc.tmp.134 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.134
  store i32 %rcc.tmp.135, ptr %src
  %rcc.tmp.137 = load i32, ptr %edge_index
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = mul i32 %rcc.tmp.138, 3
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 2
  %rcc.tmp.141 = getelementptr [1500 x i32], ptr %edges, i32 0, i32 %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %rcc.tmp.141
  store i32 %rcc.tmp.142, ptr %dest
  %rcc.tmp.144 = load i32, ptr %src
  %rcc.tmp.145 = load i32, ptr %dest
  %rcc.tmp.146 = icmp ne i32 %rcc.tmp.144, %rcc.tmp.145
  br i1 %rcc.tmp.146, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.148 = load i32, ptr %mst_weight
  %rcc.tmp.149 = load i32, ptr %weight
  %rcc.tmp.150 = add i32 %rcc.tmp.148, %rcc.tmp.149
  store i32 %rcc.tmp.150, ptr %mst_weight
  %rcc.tmp.152 = load i32, ptr %mst_edges
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.153, ptr %mst_edges
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.157 = load i32, ptr %edge_index
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 1
  store i32 %rcc.tmp.158, ptr %edge_index
  br label %while.cond.3
while.end.3:
  %rcc.tmp.161 = load i32, ptr %mst_weight
  ret i32 %rcc.tmp.161
}
define void @sortEdgesByWeight.([1500 x i32]* %edges.tmp, i32 %edge_count.tmp) {
entry:
  %edges..tmp = alloca [1500 x i32]* 
  %edge_count..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %temp_weight = alloca i32 
  %temp_src = alloca i32 
  %temp_dest = alloca i32 
  store [1500 x i32]* %edges.tmp, ptr %edges..tmp
  store i32 %edge_count.tmp, ptr %edge_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %edge_count..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.6, 1
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load i32, ptr %edge_count..tmp
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = sub i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = sub i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load i32, ptr %j
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 3
  %rcc.tmp.24 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.25 = getelementptr [1500 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = mul i32 %rcc.tmp.29, 3
  %rcc.tmp.31 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.32 = getelementptr [1500 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.26, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %j
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = mul i32 %rcc.tmp.37, 3
  %rcc.tmp.39 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.40 = getelementptr [1500 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %temp_weight
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = mul i32 %rcc.tmp.44, 3
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.48 = getelementptr [1500 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %temp_src
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = mul i32 %rcc.tmp.52, 3
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 2
  %rcc.tmp.55 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.56 = getelementptr [1500 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %temp_dest
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = mul i32 %rcc.tmp.60, 3
  %rcc.tmp.62 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.63 = getelementptr [1500 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  %rcc.tmp.67 = mul i32 %rcc.tmp.66, 3
  %rcc.tmp.68 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.69 = getelementptr [1500 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %rcc.tmp.63
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = mul i32 %rcc.tmp.73, 3
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  %rcc.tmp.76 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.77 = getelementptr [1500 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %j
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  %rcc.tmp.81 = mul i32 %rcc.tmp.80, 3
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.84 = getelementptr [1500 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %rcc.tmp.77
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = mul i32 %rcc.tmp.88, 3
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 2
  %rcc.tmp.91 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.92 = getelementptr [1500 x i32], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %j
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  %rcc.tmp.96 = mul i32 %rcc.tmp.95, 3
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 2
  %rcc.tmp.98 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.99 = getelementptr [1500 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %rcc.tmp.92
  %rcc.tmp.102 = load i32, ptr %j
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  %rcc.tmp.105 = mul i32 %rcc.tmp.104, 3
  %rcc.tmp.106 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.107 = getelementptr [1500 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %temp_weight
  store i32 %rcc.tmp.108, ptr %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %j
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  %rcc.tmp.113 = mul i32 %rcc.tmp.112, 3
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  %rcc.tmp.115 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.116 = getelementptr [1500 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %temp_src
  store i32 %rcc.tmp.117, ptr %rcc.tmp.116
  %rcc.tmp.119 = load i32, ptr %j
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  %rcc.tmp.122 = mul i32 %rcc.tmp.121, 3
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 2
  %rcc.tmp.124 = load [1500 x i32]*, ptr %edges..tmp
  %rcc.tmp.125 = getelementptr [1500 x i32], ptr %rcc.tmp.124, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.126 = load i32, ptr %temp_dest
  store i32 %rcc.tmp.126, ptr %rcc.tmp.125
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.130 = load i32, ptr %j
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  store i32 %rcc.tmp.135, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @primMST.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %key = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %mst_set = alloca [50 x i1] 
  %fill.idx.2 = alloca i32 
  %mst_weight = alloca i32 
  %count = alloca i32 
  %min_key = alloca i32 
  %min_index = alloca i32 
  %v = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %key, i32 0, i32 %rcc.tmp.8
  store i32 9999, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [50 x i1], ptr %mst_set, i32 0, i32 %rcc.tmp.19
  store i1 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %mst_weight
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %key, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.26
  store i32 0, ptr %count
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %count
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 9999, ptr %min_key
  %rcc.tmp.36 = sub i32 0, 1
  store i32 %rcc.tmp.36, ptr %min_index
  store i32 0, ptr %v
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.40 = load i32, ptr %v
  %rcc.tmp.41 = load i32, ptr %size..tmp
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.45 = load i32, ptr %v
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [50 x i1], ptr %mst_set, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i1, ptr %rcc.tmp.47
  %rcc.tmp.49 = xor i1 %rcc.tmp.48, true
  br i1 %rcc.tmp.49, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.51 = load i32, ptr %v
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %key, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %min_key
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.54, %rcc.tmp.55
  br label %sc.merge
sc.merge:
  %rcc.tmp.58 = phi i1 [0, %while.body.2], [%rcc.tmp.56, %and.rhs]
  br i1 %rcc.tmp.58, label %if.then, label %if.else
if.then:
  %rcc.tmp.60 = load i32, ptr %v
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %key, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %min_key
  %rcc.tmp.65 = load i32, ptr %v
  store i32 %rcc.tmp.65, ptr %min_index
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.69 = load i32, ptr %v
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %v
  br label %while.cond.2
while.end.2:
  %rcc.tmp.73 = load i32, ptr %min_index
  %rcc.tmp.74 = sub i32 0, 1
  %rcc.tmp.75 = icmp eq i32 %rcc.tmp.73, %rcc.tmp.74
  br i1 %rcc.tmp.75, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.79 = load i32, ptr %min_index
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [50 x i1], ptr %mst_set, i32 0, i32 %rcc.tmp.80
  store i1 1, ptr %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %mst_weight
  %rcc.tmp.84 = load i32, ptr %min_index
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %key, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = add i32 %rcc.tmp.83, %rcc.tmp.87
  store i32 %rcc.tmp.88, ptr %mst_weight
  store i32 0, ptr %v
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.92 = load i32, ptr %v
  %rcc.tmp.93 = load i32, ptr %size..tmp
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.97 = load i32, ptr %v
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [50 x i1], ptr %mst_set, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i1, ptr %rcc.tmp.99
  %rcc.tmp.101 = xor i1 %rcc.tmp.100, true
  br i1 %rcc.tmp.101, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.103 = load i32, ptr %min_index
  %rcc.tmp.104 = load i32, ptr %size..tmp
  %rcc.tmp.105 = mul i32 %rcc.tmp.103, %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %v
  %rcc.tmp.107 = add i32 %rcc.tmp.105, %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.110 = getelementptr [2500 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = icmp ne i32 %rcc.tmp.111, 9999
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.114 = phi i1 [0, %while.body.3], [%rcc.tmp.112, %and.rhs.2]
  br i1 %rcc.tmp.114, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.116 = load i32, ptr %min_index
  %rcc.tmp.117 = load i32, ptr %size..tmp
  %rcc.tmp.118 = mul i32 %rcc.tmp.116, %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %v
  %rcc.tmp.120 = add i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.123 = getelementptr [2500 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = icmp ne i32 %rcc.tmp.124, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.127 = phi i1 [0, %sc.merge.2], [%rcc.tmp.125, %and.rhs.3]
  br i1 %rcc.tmp.127, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.129 = load i32, ptr %min_index
  %rcc.tmp.130 = load i32, ptr %size..tmp
  %rcc.tmp.131 = mul i32 %rcc.tmp.129, %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %v
  %rcc.tmp.133 = add i32 %rcc.tmp.131, %rcc.tmp.132
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.136 = getelementptr [2500 x i32], ptr %rcc.tmp.135, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %v
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = getelementptr [50 x i32], ptr %key, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.140
  %rcc.tmp.142 = icmp slt i32 %rcc.tmp.137, %rcc.tmp.141
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.144 = phi i1 [0, %sc.merge.3], [%rcc.tmp.142, %and.rhs.4]
  br i1 %rcc.tmp.144, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.146 = load i32, ptr %v
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = getelementptr [50 x i32], ptr %key, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.149 = load i32, ptr %min_index
  %rcc.tmp.150 = load i32, ptr %size..tmp
  %rcc.tmp.151 = mul i32 %rcc.tmp.149, %rcc.tmp.150
  %rcc.tmp.152 = load i32, ptr %v
  %rcc.tmp.153 = add i32 %rcc.tmp.151, %rcc.tmp.152
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.156 = getelementptr [2500 x i32], ptr %rcc.tmp.155, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  store i32 %rcc.tmp.157, ptr %rcc.tmp.148
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.161 = load i32, ptr %v
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 1
  store i32 %rcc.tmp.162, ptr %v
  br label %while.cond.3
while.end.3:
  %rcc.tmp.165 = load i32, ptr %count
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %count
  br label %while.cond
while.end:
  %rcc.tmp.169 = load i32, ptr %mst_weight
  ret i32 %rcc.tmp.169
}
define void @testNetworkFlowAlgorithms.() {
entry:
  %capacity = alloca [900 x i32] 
  %fill.idx = alloca i32 
  %max_flow_result = alloca i32 
  %min_cost_result = alloca i32 
  call void @printlnInt.(i32 1707)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 900
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [900 x i32], ptr %capacity, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeFlowNetwork.([900 x i32]* %capacity, i32 30)
  %rcc.tmp.14 = call i32 @fordFulkersonMaxFlow.([900 x i32]* %capacity, i32 30, i32 0, i32 29)
  store i32 %rcc.tmp.14, ptr %max_flow_result
  %rcc.tmp.16 = load i32, ptr %max_flow_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @minCostMaxFlow.([900 x i32]* %capacity, i32 30)
  store i32 %rcc.tmp.18, ptr %min_cost_result
  %rcc.tmp.20 = load i32, ptr %min_cost_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 1708)
  ret void
}
define void @initializeFlowNetwork.([900 x i32]* %capacity.tmp, i32 %size.tmp) {
entry:
  %capacity..tmp = alloca [900 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [900 x i32]* %capacity.tmp, ptr %capacity..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.15 = getelementptr [900 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %size..tmp
  %rcc.tmp.25 = sub i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %size..tmp
  %rcc.tmp.31 = mul i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  %rcc.tmp.34 = add i32 %rcc.tmp.31, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.37 = getelementptr [900 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 20
  %rcc.tmp.40 = add i32 10, %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %rcc.tmp.37
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 5
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %if.then, label %if.else
if.then:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = load i32, ptr %size..tmp
  %rcc.tmp.49 = mul i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 5
  %rcc.tmp.52 = add i32 %rcc.tmp.49, %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.55 = getelementptr [900 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 10
  %rcc.tmp.58 = add i32 5, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %rcc.tmp.55
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = icmp sgt i32 %rcc.tmp.62, 5
  br i1 %rcc.tmp.63, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = load i32, ptr %size..tmp
  %rcc.tmp.67 = mul i32 %rcc.tmp.65, %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = sub i32 %rcc.tmp.68, 3
  %rcc.tmp.70 = add i32 %rcc.tmp.67, %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.73 = getelementptr [900 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = srem i32 %rcc.tmp.74, 7
  %rcc.tmp.76 = add i32 3, %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %rcc.tmp.73
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @fordFulkersonMaxFlow.([900 x i32]* %capacity.tmp, i32 %size.tmp, i32 %source.tmp, i32 %sink.tmp) {
entry:
  %capacity..tmp = alloca [900 x i32]* 
  %size..tmp = alloca i32 
  %source..tmp = alloca i32 
  %sink..tmp = alloca i32 
  %residual = alloca [900 x i32] 
  %fill.idx = alloca i32 
  %max_flow = alloca i32 
  %i = alloca i32 
  %iteration = alloca i32 
  %parent = alloca [30 x i32] 
  %fill.idx.2 = alloca i32 
  %flow = alloca i32 
  %v = alloca i32 
  %u = alloca i32 
  store [900 x i32]* %capacity.tmp, ptr %capacity..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %source.tmp, ptr %source..tmp
  store i32 %sink.tmp, ptr %sink..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 900
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [900 x i32], ptr %residual, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %max_flow
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = load i32, ptr %size..tmp
  %rcc.tmp.22 = mul i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [900 x i32], ptr %residual, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.32 = getelementptr [900 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %rcc.tmp.28
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %iteration
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.41 = load i32, ptr %iteration
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 100
  br i1 %rcc.tmp.42, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.47 = load i32, ptr %fill.idx.2
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 30
  br i1 %rcc.tmp.48, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.50 = load i32, ptr %fill.idx.2
  %rcc.tmp.51 = getelementptr [30 x i32], ptr %parent, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = sub i32 0, 1
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  %rcc.tmp.54 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.54, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.57 = load i32, ptr %size..tmp
  %rcc.tmp.58 = load i32, ptr %source..tmp
  %rcc.tmp.59 = load i32, ptr %sink..tmp
  %rcc.tmp.60 = call i32 @bfsAugmentingPath.([900 x i32]* %residual, i32 %rcc.tmp.57, i32 %rcc.tmp.58, i32 %rcc.tmp.59, [30 x i32]* %parent)
  store i32 %rcc.tmp.60, ptr %flow
  %rcc.tmp.62 = load i32, ptr %flow
  %rcc.tmp.63 = icmp eq i32 %rcc.tmp.62, 0
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.67 = load i32, ptr %max_flow
  %rcc.tmp.68 = load i32, ptr %flow
  %rcc.tmp.69 = add i32 %rcc.tmp.67, %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %max_flow
  %rcc.tmp.71 = load i32, ptr %sink..tmp
  store i32 %rcc.tmp.71, ptr %v
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.74 = load i32, ptr %v
  %rcc.tmp.75 = load i32, ptr %source..tmp
  %rcc.tmp.76 = icmp ne i32 %rcc.tmp.74, %rcc.tmp.75
  br i1 %rcc.tmp.76, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.79 = load i32, ptr %v
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [30 x i32], ptr %parent, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %u
  %rcc.tmp.84 = load i32, ptr %u
  %rcc.tmp.85 = load i32, ptr %size..tmp
  %rcc.tmp.86 = mul i32 %rcc.tmp.84, %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %v
  %rcc.tmp.88 = add i32 %rcc.tmp.86, %rcc.tmp.87
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [900 x i32], ptr %residual, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %u
  %rcc.tmp.92 = load i32, ptr %size..tmp
  %rcc.tmp.93 = mul i32 %rcc.tmp.91, %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %v
  %rcc.tmp.95 = add i32 %rcc.tmp.93, %rcc.tmp.94
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 0
  %rcc.tmp.97 = getelementptr [900 x i32], ptr %residual, i32 0, i32 %rcc.tmp.96
  %rcc.tmp.98 = load i32, ptr %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %flow
  %rcc.tmp.100 = sub i32 %rcc.tmp.98, %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %rcc.tmp.90
  %rcc.tmp.102 = load i32, ptr %v
  %rcc.tmp.103 = load i32, ptr %size..tmp
  %rcc.tmp.104 = mul i32 %rcc.tmp.102, %rcc.tmp.103
  %rcc.tmp.105 = load i32, ptr %u
  %rcc.tmp.106 = add i32 %rcc.tmp.104, %rcc.tmp.105
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [900 x i32], ptr %residual, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %v
  %rcc.tmp.110 = load i32, ptr %size..tmp
  %rcc.tmp.111 = mul i32 %rcc.tmp.109, %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %u
  %rcc.tmp.113 = add i32 %rcc.tmp.111, %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [900 x i32], ptr %residual, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %flow
  %rcc.tmp.118 = add i32 %rcc.tmp.116, %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %rcc.tmp.108
  %rcc.tmp.120 = load i32, ptr %v
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [30 x i32], ptr %parent, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %v
  br label %while.cond.3
while.end.3:
  %rcc.tmp.126 = load i32, ptr %iteration
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %iteration
  br label %while.cond.2
while.end.2:
  %rcc.tmp.130 = load i32, ptr %max_flow
  ret i32 %rcc.tmp.130
}
define i32 @bfsAugmentingPath.([900 x i32]* %residual.tmp, i32 %size.tmp, i32 %source.tmp, i32 %sink.tmp, [30 x i32]* %parent.tmp) {
entry:
  %residual..tmp = alloca [900 x i32]* 
  %size..tmp = alloca i32 
  %source..tmp = alloca i32 
  %sink..tmp = alloca i32 
  %parent..tmp = alloca [30 x i32]* 
  %visited = alloca [30 x i1] 
  %fill.idx = alloca i32 
  %queue = alloca [30 x i32] 
  %fill.idx.2 = alloca i32 
  %queue_front = alloca i32 
  %queue_rear = alloca i32 
  %u = alloca i32 
  %v = alloca i32 
  %path_flow = alloca i32 
  %current = alloca i32 
  %prev = alloca i32 
  store [900 x i32]* %residual.tmp, ptr %residual..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %source.tmp, ptr %source..tmp
  store i32 %sink.tmp, ptr %sink..tmp
  store [30 x i32]* %parent.tmp, ptr %parent..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 30
  br i1 %rcc.tmp.9, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = getelementptr [30 x i1], ptr %visited, i32 0, i32 %rcc.tmp.11
  store i1 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.14, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 30
  br i1 %rcc.tmp.20, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.22 = load i32, ptr %fill.idx.2
  %rcc.tmp.23 = getelementptr [30 x i32], ptr %queue, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = sub i32 0, 1
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.26, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %queue_front
  store i32 0, ptr %queue_rear
  %rcc.tmp.31 = load i32, ptr %queue_rear
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [30 x i32], ptr %queue, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %source..tmp
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %queue_rear
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %queue_rear
  %rcc.tmp.39 = load i32, ptr %source..tmp
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [30 x i1], ptr %visited, i32 0, i32 %rcc.tmp.40
  store i1 1, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %source..tmp
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [30 x i32]*, ptr %parent..tmp
  %rcc.tmp.46 = getelementptr [30 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = sub i32 0, 1
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  br label %while.cond
while.cond:
  %rcc.tmp.50 = load i32, ptr %queue_front
  %rcc.tmp.51 = load i32, ptr %queue_rear
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.55 = load i32, ptr %queue_front
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [30 x i32], ptr %queue, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %u
  %rcc.tmp.60 = load i32, ptr %queue_front
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %queue_front
  store i32 0, ptr %v
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %v
  %rcc.tmp.66 = load i32, ptr %size..tmp
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.66
  br i1 %rcc.tmp.67, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.70 = load i32, ptr %v
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [30 x i1], ptr %visited, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i1, ptr %rcc.tmp.72
  %rcc.tmp.74 = xor i1 %rcc.tmp.73, true
  br i1 %rcc.tmp.74, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.76 = load i32, ptr %u
  %rcc.tmp.77 = load i32, ptr %size..tmp
  %rcc.tmp.78 = mul i32 %rcc.tmp.76, %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %v
  %rcc.tmp.80 = add i32 %rcc.tmp.78, %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = load [900 x i32]*, ptr %residual..tmp
  %rcc.tmp.83 = getelementptr [900 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = icmp sgt i32 %rcc.tmp.84, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.87 = phi i1 [0, %while.body.2], [%rcc.tmp.85, %and.rhs]
  br i1 %rcc.tmp.87, label %if.then, label %if.else
if.then:
  %rcc.tmp.89 = load i32, ptr %queue_rear
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [30 x i32], ptr %queue, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %v
  store i32 %rcc.tmp.92, ptr %rcc.tmp.91
  %rcc.tmp.94 = load i32, ptr %queue_rear
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %queue_rear
  %rcc.tmp.97 = load i32, ptr %v
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [30 x i1], ptr %visited, i32 0, i32 %rcc.tmp.98
  store i1 1, ptr %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %v
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = load [30 x i32]*, ptr %parent..tmp
  %rcc.tmp.104 = getelementptr [30 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %u
  store i32 %rcc.tmp.105, ptr %rcc.tmp.104
  %rcc.tmp.107 = load i32, ptr %v
  %rcc.tmp.108 = load i32, ptr %sink..tmp
  %rcc.tmp.109 = icmp eq i32 %rcc.tmp.107, %rcc.tmp.108
  br i1 %rcc.tmp.109, label %if.then.2, label %if.else.2
if.then.2:
  store i32 9999, ptr %path_flow
  %rcc.tmp.112 = load i32, ptr %sink..tmp
  store i32 %rcc.tmp.112, ptr %current
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.115 = load i32, ptr %current
  %rcc.tmp.116 = load i32, ptr %source..tmp
  %rcc.tmp.117 = icmp ne i32 %rcc.tmp.115, %rcc.tmp.116
  br i1 %rcc.tmp.117, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.120 = load i32, ptr %current
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = load [30 x i32]*, ptr %parent..tmp
  %rcc.tmp.123 = getelementptr [30 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %prev
  %rcc.tmp.126 = load i32, ptr %prev
  %rcc.tmp.127 = load i32, ptr %size..tmp
  %rcc.tmp.128 = mul i32 %rcc.tmp.126, %rcc.tmp.127
  %rcc.tmp.129 = load i32, ptr %current
  %rcc.tmp.130 = add i32 %rcc.tmp.128, %rcc.tmp.129
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = load [900 x i32]*, ptr %residual..tmp
  %rcc.tmp.133 = getelementptr [900 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %path_flow
  %rcc.tmp.136 = icmp slt i32 %rcc.tmp.134, %rcc.tmp.135
  br i1 %rcc.tmp.136, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.138 = load i32, ptr %prev
  %rcc.tmp.139 = load i32, ptr %size..tmp
  %rcc.tmp.140 = mul i32 %rcc.tmp.138, %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %current
  %rcc.tmp.142 = add i32 %rcc.tmp.140, %rcc.tmp.141
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = load [900 x i32]*, ptr %residual..tmp
  %rcc.tmp.145 = getelementptr [900 x i32], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.146 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.146, ptr %path_flow
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.150 = load i32, ptr %prev
  store i32 %rcc.tmp.150, ptr %current
  br label %while.cond.3
while.end.3:
  %rcc.tmp.153 = load i32, ptr %path_flow
  ret i32 %rcc.tmp.153
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.158 = load i32, ptr %v
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 1
  store i32 %rcc.tmp.159, ptr %v
  br label %while.cond.2
while.end.2:
  br label %while.cond
while.end:
  ret i32 0
}
define i32 @minCostMaxFlow.([900 x i32]* %capacity.tmp, i32 %size.tmp) {
entry:
  %capacity..tmp = alloca [900 x i32]* 
  %size..tmp = alloca i32 
  %total_cost = alloca i32 
  %total_flow = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %distance = alloca i32 
  store [900 x i32]* %capacity.tmp, ptr %capacity..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %total_cost
  store i32 0, ptr %total_flow
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
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.26 = getelementptr [900 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = icmp sgt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = sub i32 %rcc.tmp.34, %rcc.tmp.35
  br label %if.merge.2
if.else.2:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = sub i32 %rcc.tmp.38, %rcc.tmp.39
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.42 = phi i32 [%rcc.tmp.36, %if.then.2], [%rcc.tmp.40, %if.else.2]
  store i32 %rcc.tmp.42, ptr %distance
  %rcc.tmp.44 = load i32, ptr %total_cost
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load i32, ptr %size..tmp
  %rcc.tmp.47 = mul i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = add i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.52 = getelementptr [900 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %distance
  %rcc.tmp.55 = mul i32 %rcc.tmp.53, %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.44, %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %total_cost
  %rcc.tmp.58 = load i32, ptr %total_flow
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = load i32, ptr %size..tmp
  %rcc.tmp.61 = mul i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %j
  %rcc.tmp.63 = add i32 %rcc.tmp.61, %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [900 x i32]*, ptr %capacity..tmp
  %rcc.tmp.66 = getelementptr [900 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = add i32 %rcc.tmp.58, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %total_flow
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.80 = load i32, ptr %total_cost
  %rcc.tmp.81 = load i32, ptr %total_flow
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = sdiv i32 %rcc.tmp.80, %rcc.tmp.82
  ret i32 %rcc.tmp.83
}
define void @testGraphConnectivityAlgorithms.() {
entry:
  %graph = alloca [2500 x i32] 
  %fill.idx = alloca i32 
  %components_result = alloca i32 
  %scc_result = alloca i32 
  %articulation_result = alloca i32 
  %bridges_result = alloca i32 
  call void @printlnInt.(i32 1709)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2500 x i32], ptr %graph, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeGraph.([2500 x i32]* %graph, i32 50)
  %rcc.tmp.14 = call i32 @findConnectedComponents.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.14, ptr %components_result
  %rcc.tmp.16 = load i32, ptr %components_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @findStronglyConnectedComponents.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.18, ptr %scc_result
  %rcc.tmp.20 = load i32, ptr %scc_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @findArticulationPoints.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.22, ptr %articulation_result
  %rcc.tmp.24 = load i32, ptr %articulation_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @findBridges.([2500 x i32]* %graph, i32 50)
  store i32 %rcc.tmp.26, ptr %bridges_result
  %rcc.tmp.28 = load i32, ptr %bridges_result
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1710)
  ret void
}
define i32 @findConnectedComponents.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx = alloca i32 
  %components = alloca i32 
  %i = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.8
  store i1 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %components
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i1, ptr %rcc.tmp.24
  %rcc.tmp.26 = xor i1 %rcc.tmp.25, true
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = load i32, ptr %i
  call void @dfsComponentTraversal.([2500 x i32]* %rcc.tmp.28, i32 %rcc.tmp.29, i32 %rcc.tmp.30, [50 x i1]* %visited)
  %rcc.tmp.32 = load i32, ptr %components
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %components
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.41 = load i32, ptr %components
  ret i32 %rcc.tmp.41
}
define void @dfsComponentTraversal.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %node.tmp, [50 x i1]* %visited.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %node..tmp = alloca i32 
  %visited..tmp = alloca [50 x i1]* 
  %neighbor = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store [50 x i1]* %visited.tmp, ptr %visited..tmp
  %rcc.tmp.5 = load i32, ptr %node..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.8 = getelementptr [50 x i1], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  store i1 1, ptr %rcc.tmp.8
  store i32 0, ptr %neighbor
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %neighbor
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %node..tmp
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %neighbor
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.24 = getelementptr [2500 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp sgt i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %neighbor
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.31 = getelementptr [50 x i1], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i1, ptr %rcc.tmp.31
  %rcc.tmp.33 = xor i1 %rcc.tmp.32, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.35 = phi i1 [0, %while.body], [%rcc.tmp.33, %and.rhs]
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  %rcc.tmp.37 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.38 = load i32, ptr %size..tmp
  %rcc.tmp.39 = load i32, ptr %neighbor
  %rcc.tmp.40 = load [50 x i1]*, ptr %visited..tmp
  call void @dfsComponentTraversal.([2500 x i32]* %rcc.tmp.37, i32 %rcc.tmp.38, i32 %rcc.tmp.39, [50 x i1]* %rcc.tmp.40)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.44 = load i32, ptr %neighbor
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %neighbor
  br label %while.cond
while.end:
  ret void
}
define i32 @findStronglyConnectedComponents.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx = alloca i32 
  %finish_order = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %finish_index = alloca i32 
  %i = alloca i32 
  %transpose = alloca [2500 x i32] 
  %fill.idx.3 = alloca i32 
  %j = alloca i32 
  %scc_count = alloca i32 
  %node = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.8
  store i1 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %finish_order, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %finish_index
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i1, ptr %rcc.tmp.35
  %rcc.tmp.37 = xor i1 %rcc.tmp.36, true
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.40 = load i32, ptr %size..tmp
  %rcc.tmp.41 = load i32, ptr %i
  call void @dfsFinishTime.([2500 x i32]* %rcc.tmp.39, i32 %rcc.tmp.40, i32 %rcc.tmp.41, [50 x i1]* %visited, [50 x i32]* %finish_order, i32* %finish_index)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.51 = load i32, ptr %fill.idx.3
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.51, 2500
  br i1 %rcc.tmp.52, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.54 = load i32, ptr %fill.idx.3
  %rcc.tmp.55 = getelementptr [2500 x i32], ptr %transpose, i32 0, i32 %rcc.tmp.54
  store i32 0, ptr %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.57, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = load i32, ptr %size..tmp
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = load i32, ptr %size..tmp
  %rcc.tmp.71 = icmp slt i32 %rcc.tmp.69, %rcc.tmp.70
  br i1 %rcc.tmp.71, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.74 = load i32, ptr %j
  %rcc.tmp.75 = load i32, ptr %size..tmp
  %rcc.tmp.76 = mul i32 %rcc.tmp.74, %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = add i32 %rcc.tmp.76, %rcc.tmp.77
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [2500 x i32], ptr %transpose, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = load i32, ptr %size..tmp
  %rcc.tmp.83 = mul i32 %rcc.tmp.81, %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %j
  %rcc.tmp.85 = add i32 %rcc.tmp.83, %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.88 = getelementptr [2500 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  store i32 %rcc.tmp.89, ptr %rcc.tmp.80
  %rcc.tmp.91 = load i32, ptr %j
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = load i32, ptr %size..tmp
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.101, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.107
  store i1 0, ptr %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 1
  store i32 %rcc.tmp.111, ptr %i
  br label %while.cond.4
while.end.4:
  store i32 0, ptr %scc_count
  %rcc.tmp.115 = load i32, ptr %finish_index
  %rcc.tmp.116 = sub i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = icmp sge i32 %rcc.tmp.119, 0
  br i1 %rcc.tmp.120, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [50 x i32], ptr %finish_order, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  store i32 %rcc.tmp.126, ptr %node
  %rcc.tmp.128 = load i32, ptr %node
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.131 = load i1, ptr %rcc.tmp.130
  %rcc.tmp.132 = xor i1 %rcc.tmp.131, true
  br i1 %rcc.tmp.132, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.134 = load i32, ptr %size..tmp
  %rcc.tmp.135 = load i32, ptr %node
  call void @dfsComponentTraversal.([2500 x i32]* %transpose, i32 %rcc.tmp.134, i32 %rcc.tmp.135, [50 x i1]* %visited)
  %rcc.tmp.137 = load i32, ptr %scc_count
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 1
  store i32 %rcc.tmp.138, ptr %scc_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = sub i32 %rcc.tmp.142, 1
  store i32 %rcc.tmp.143, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.146 = load i32, ptr %scc_count
  ret i32 %rcc.tmp.146
}
define void @dfsFinishTime.([2500 x i32]* %graph.tmp, i32 %size.tmp, i32 %node.tmp, [50 x i1]* %visited.tmp, [50 x i32]* %finish_order.tmp, i32* %finish_index.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %node..tmp = alloca i32 
  %visited..tmp = alloca [50 x i1]* 
  %finish_order..tmp = alloca [50 x i32]* 
  %finish_index..tmp = alloca i32* 
  %neighbor = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store [50 x i1]* %visited.tmp, ptr %visited..tmp
  store [50 x i32]* %finish_order.tmp, ptr %finish_order..tmp
  store i32* %finish_index.tmp, ptr %finish_index..tmp
  %rcc.tmp.7 = load i32, ptr %node..tmp
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.10 = getelementptr [50 x i1], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.8
  store i1 1, ptr %rcc.tmp.10
  store i32 0, ptr %neighbor
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %neighbor
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %node..tmp
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %neighbor
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.26 = getelementptr [2500 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.30 = load i32, ptr %neighbor
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.33 = getelementptr [50 x i1], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i1, ptr %rcc.tmp.33
  %rcc.tmp.35 = xor i1 %rcc.tmp.34, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.37 = phi i1 [0, %while.body], [%rcc.tmp.35, %and.rhs]
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.40 = load i32, ptr %size..tmp
  %rcc.tmp.41 = load i32, ptr %neighbor
  %rcc.tmp.42 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.43 = load [50 x i32]*, ptr %finish_order..tmp
  %rcc.tmp.44 = load i32*, ptr %finish_index..tmp
  call void @dfsFinishTime.([2500 x i32]* %rcc.tmp.39, i32 %rcc.tmp.40, i32 %rcc.tmp.41, [50 x i1]* %rcc.tmp.42, [50 x i32]* %rcc.tmp.43, i32* %rcc.tmp.44)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %neighbor
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %neighbor
  br label %while.cond
while.end:
  %rcc.tmp.52 = load i32*, ptr %finish_index..tmp
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [50 x i32]*, ptr %finish_order..tmp
  %rcc.tmp.56 = getelementptr [50 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  %rcc.tmp.59 = load i32*, ptr %finish_index..tmp
  %rcc.tmp.60 = load i32*, ptr %finish_index..tmp
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %rcc.tmp.59
  ret void
}
define i32 @findArticulationPoints.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %articulation_points = alloca i32 
  %vertex = alloca i32 
  %original_components = alloca i32 
  %temp_edges = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %new_components = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %articulation_points
  store i32 0, ptr %vertex
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %vertex
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.12 = load i32, ptr %size..tmp
  %rcc.tmp.13 = call i32 @findConnectedComponents.([2500 x i32]* %rcc.tmp.11, i32 %rcc.tmp.12)
  store i32 %rcc.tmp.13, ptr %original_components
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.17 = load i32, ptr %fill.idx
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 50
  br i1 %rcc.tmp.18, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.20 = load i32, ptr %fill.idx
  %rcc.tmp.21 = getelementptr [50 x i32], ptr %temp_edges, i32 0, i32 %rcc.tmp.20
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [50 x i32], ptr %temp_edges, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %vertex
  %rcc.tmp.37 = load i32, ptr %size..tmp
  %rcc.tmp.38 = mul i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.38, %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.43 = getelementptr [2500 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %rcc.tmp.35
  %rcc.tmp.46 = load i32, ptr %vertex
  %rcc.tmp.47 = load i32, ptr %size..tmp
  %rcc.tmp.48 = mul i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.48, %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.53 = getelementptr [2500 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load i32, ptr %size..tmp
  %rcc.tmp.57 = mul i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %vertex
  %rcc.tmp.59 = add i32 %rcc.tmp.57, %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.62 = getelementptr [2500 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.68 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.69 = load i32, ptr %size..tmp
  %rcc.tmp.70 = call i32 @findConnectedComponents.([2500 x i32]* %rcc.tmp.68, i32 %rcc.tmp.69)
  store i32 %rcc.tmp.70, ptr %new_components
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = load i32, ptr %size..tmp
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.74, %rcc.tmp.75
  br i1 %rcc.tmp.76, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.79 = load i32, ptr %vertex
  %rcc.tmp.80 = load i32, ptr %size..tmp
  %rcc.tmp.81 = mul i32 %rcc.tmp.79, %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.81, %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.86 = getelementptr [2500 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %temp_edges, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.90, ptr %rcc.tmp.86
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = load i32, ptr %size..tmp
  %rcc.tmp.94 = mul i32 %rcc.tmp.92, %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %vertex
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.99 = getelementptr [2500 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.100 = load i32, ptr %i
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = getelementptr [50 x i32], ptr %temp_edges, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  store i32 %rcc.tmp.103, ptr %rcc.tmp.99
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  store i32 %rcc.tmp.106, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.109 = load i32, ptr %new_components
  %rcc.tmp.110 = load i32, ptr %original_components
  %rcc.tmp.111 = icmp sgt i32 %rcc.tmp.109, %rcc.tmp.110
  br i1 %rcc.tmp.111, label %if.then, label %if.else
if.then:
  %rcc.tmp.113 = load i32, ptr %articulation_points
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %articulation_points
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.118 = load i32, ptr %vertex
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %vertex
  br label %while.cond
while.end:
  %rcc.tmp.122 = load i32, ptr %articulation_points
  ret i32 %rcc.tmp.122
}
define i32 @findBridges.([2500 x i32]* %graph.tmp, i32 %size.tmp) {
entry:
  %graph..tmp = alloca [2500 x i32]* 
  %size..tmp = alloca i32 
  %bridges = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %original_components = alloca i32 
  %temp_weight = alloca i32 
  %new_components = alloca i32 
  store [2500 x i32]* %graph.tmp, ptr %graph..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %bridges
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
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.15 = load i32, ptr %j
  %rcc.tmp.16 = load i32, ptr %size..tmp
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = load i32, ptr %size..tmp
  %rcc.tmp.22 = mul i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = add i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.27 = getelementptr [2500 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp sgt i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.32 = load i32, ptr %size..tmp
  %rcc.tmp.33 = call i32 @findConnectedComponents.([2500 x i32]* %rcc.tmp.31, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %original_components
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = mul i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.42 = getelementptr [2500 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %temp_weight
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load i32, ptr %size..tmp
  %rcc.tmp.47 = mul i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = add i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.52 = getelementptr [2500 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = load i32, ptr %size..tmp
  %rcc.tmp.56 = mul i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.61 = getelementptr [2500 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.64 = load i32, ptr %size..tmp
  %rcc.tmp.65 = call i32 @findConnectedComponents.([2500 x i32]* %rcc.tmp.63, i32 %rcc.tmp.64)
  store i32 %rcc.tmp.65, ptr %new_components
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = load i32, ptr %size..tmp
  %rcc.tmp.69 = mul i32 %rcc.tmp.67, %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = add i32 %rcc.tmp.69, %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.74 = getelementptr [2500 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %temp_weight
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = load i32, ptr %size..tmp
  %rcc.tmp.79 = mul i32 %rcc.tmp.77, %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.79, %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [2500 x i32]*, ptr %graph..tmp
  %rcc.tmp.84 = getelementptr [2500 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %temp_weight
  store i32 %rcc.tmp.85, ptr %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %new_components
  %rcc.tmp.88 = load i32, ptr %original_components
  %rcc.tmp.89 = icmp sgt i32 %rcc.tmp.87, %rcc.tmp.88
  br i1 %rcc.tmp.89, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.91 = load i32, ptr %bridges
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %bridges
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.98 = load i32, ptr %j
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.106 = load i32, ptr %bridges
  ret i32 %rcc.tmp.106
}
