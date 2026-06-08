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
  call void @printlnInt.(i32 1400)
  call void @testDeepRecursiveAlgorithms.()
  call void @testMutualRecursion.()
  call void @testTreeTraversalAlgorithms.()
  call void @testDivideAndConquerAlgorithms.()
  call void @testRecursiveMathematicalComputations.()
  call void @printlnInt.(i32 1499)
  call void @exit.(i32 0)
  ret void
}
define void @testDeepRecursiveAlgorithms.() {
entry:
  %factorial_result = alloca i32 
  %sum_result = alloca i32 
  %countdown_result = alloca i32 
  %power_result = alloca i32 
  call void @printlnInt.(i32 1401)
  %rcc.tmp.2 = call i32 @tailRecursiveFactorial.(i32 12, i32 1)
  store i32 %rcc.tmp.2, ptr %factorial_result
  %rcc.tmp.4 = load i32, ptr %factorial_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @deepRecursiveSum.(i32 1000, i32 0)
  store i32 %rcc.tmp.6, ptr %sum_result
  %rcc.tmp.8 = load i32, ptr %sum_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @recursiveCountdown.(i32 500)
  store i32 %rcc.tmp.10, ptr %countdown_result
  %rcc.tmp.12 = load i32, ptr %countdown_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @recursivePower.(i32 2, i32 20)
  store i32 %rcc.tmp.14, ptr %power_result
  %rcc.tmp.16 = load i32, ptr %power_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 1402)
  ret void
}
define i32 @tailRecursiveFactorial.(i32 %n.tmp, i32 %accumulator.tmp) {
entry:
  %n..tmp = alloca i32 
  %accumulator..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %accumulator.tmp, ptr %accumulator..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 1
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %accumulator..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 1
  %rcc.tmp.11 = load i32, ptr %accumulator..tmp
  %rcc.tmp.12 = load i32, ptr %n..tmp
  %rcc.tmp.13 = mul i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = call i32 @tailRecursiveFactorial.(i32 %rcc.tmp.10, i32 %rcc.tmp.13)
  ret i32 %rcc.tmp.14
}
define i32 @deepRecursiveSum.(i32 %n.tmp, i32 %accumulator.tmp) {
entry:
  %n..tmp = alloca i32 
  %accumulator..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %accumulator.tmp, ptr %accumulator..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %accumulator..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 1
  %rcc.tmp.11 = load i32, ptr %accumulator..tmp
  %rcc.tmp.12 = load i32, ptr %n..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = call i32 @deepRecursiveSum.(i32 %rcc.tmp.10, i32 %rcc.tmp.13)
  ret i32 %rcc.tmp.14
}
define i32 @recursiveCountdown.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = call i32 @recursiveCountdown.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = add i32 1, %rcc.tmp.9
  ret i32 %rcc.tmp.10
}
define i32 @recursivePower.(i32 %base.tmp, i32 %exponent.tmp) {
entry:
  %base..tmp = alloca i32 
  %exponent..tmp = alloca i32 
  %half_power = alloca i32 
  store i32 %base.tmp, ptr %base..tmp
  store i32 %exponent.tmp, ptr %exponent..tmp
  %rcc.tmp.3 = load i32, ptr %exponent..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load i32, ptr %exponent..tmp
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.8, 1
  br i1 %rcc.tmp.9, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.11 = load i32, ptr %base..tmp
  ret i32 %rcc.tmp.11
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.14 = load i32, ptr %exponent..tmp
  %rcc.tmp.15 = srem i32 %rcc.tmp.14, 2
  %rcc.tmp.16 = icmp eq i32 %rcc.tmp.15, 0
  br i1 %rcc.tmp.16, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.18 = load i32, ptr %base..tmp
  %rcc.tmp.19 = load i32, ptr %exponent..tmp
  %rcc.tmp.20 = sdiv i32 %rcc.tmp.19, 2
  %rcc.tmp.21 = call i32 @recursivePower.(i32 %rcc.tmp.18, i32 %rcc.tmp.20)
  store i32 %rcc.tmp.21, ptr %half_power
  %rcc.tmp.23 = load i32, ptr %half_power
  %rcc.tmp.24 = load i32, ptr %half_power
  %rcc.tmp.25 = mul i32 %rcc.tmp.23, %rcc.tmp.24
  ret i32 %rcc.tmp.25
if.else.3:
  %rcc.tmp.27 = load i32, ptr %base..tmp
  %rcc.tmp.28 = load i32, ptr %base..tmp
  %rcc.tmp.29 = load i32, ptr %exponent..tmp
  %rcc.tmp.30 = sub i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = call i32 @recursivePower.(i32 %rcc.tmp.28, i32 %rcc.tmp.30)
  %rcc.tmp.32 = mul i32 %rcc.tmp.27, %rcc.tmp.31
  ret i32 %rcc.tmp.32
if.merge.3:
  ret i32 undef
}
define void @testMutualRecursion.() {
entry:
  %even_result = alloca i32 
  %ping_pong_result = alloca i32 
  %state_result = alloca i32 
  call void @printlnInt.(i32 1403)
  %rcc.tmp.2 = call i32 @countEvenOddMutual.(i32 100)
  store i32 %rcc.tmp.2, ptr %even_result
  %rcc.tmp.4 = load i32, ptr %even_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @pingPongMutual.(i32 50, i1 1)
  store i32 %rcc.tmp.6, ptr %ping_pong_result
  %rcc.tmp.8 = load i32, ptr %ping_pong_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @stateMachineA.(i32 75, i32 0)
  store i32 %rcc.tmp.10, ptr %state_result
  %rcc.tmp.12 = load i32, ptr %state_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 1404)
  ret void
}
define i32 @isEvenMutual.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp eq i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = call i32 @isOddMutual.(i32 %rcc.tmp.8)
  ret i32 %rcc.tmp.9
}
define i32 @isOddMutual.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp eq i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = call i32 @isEvenMutual.(i32 %rcc.tmp.8)
  ret i32 %rcc.tmp.9
}
define i32 @countEvenOddMutual.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %count = alloca i32 
  %i = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %limit..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = call i32 @isEvenMutual.(i32 %rcc.tmp.10)
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 1
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %count
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %count
  ret i32 %rcc.tmp.23
}
define i32 @pingMutual.(i32 %n.tmp, i32 %add_value.tmp) {
entry:
  %n..tmp = alloca i32 
  %add_value..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %add_value.tmp, ptr %add_value..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %add_value..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 1
  %rcc.tmp.11 = load i32, ptr %add_value..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  %rcc.tmp.13 = call i32 @pongMutual.(i32 %rcc.tmp.10, i32 %rcc.tmp.12)
  ret i32 %rcc.tmp.13
}
define i32 @pongMutual.(i32 %n.tmp, i32 %add_value.tmp) {
entry:
  %n..tmp = alloca i32 
  %add_value..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %add_value.tmp, ptr %add_value..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %add_value..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 1
  %rcc.tmp.11 = load i32, ptr %add_value..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 2
  %rcc.tmp.13 = call i32 @pingMutual.(i32 %rcc.tmp.10, i32 %rcc.tmp.12)
  ret i32 %rcc.tmp.13
}
define i32 @pingPongMutual.(i32 %n.tmp, i1 %start_with_ping.tmp) {
entry:
  %n..tmp = alloca i32 
  %start_with_ping..tmp = alloca i1 
  store i32 %n.tmp, ptr %n..tmp
  store i1 %start_with_ping.tmp, ptr %start_with_ping..tmp
  %rcc.tmp.3 = load i1, ptr %start_with_ping..tmp
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %n..tmp
  %rcc.tmp.6 = call i32 @pingMutual.(i32 %rcc.tmp.5, i32 0)
  ret i32 %rcc.tmp.6
if.else:
  %rcc.tmp.8 = load i32, ptr %n..tmp
  %rcc.tmp.9 = call i32 @pongMutual.(i32 %rcc.tmp.8, i32 0)
  ret i32 %rcc.tmp.9
if.merge:
  ret i32 undef
}
define i32 @stateMachineA.(i32 %n.tmp, i32 %value.tmp) {
entry:
  %n..tmp = alloca i32 
  %value..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %value..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 3
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load i32, ptr %value..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 10
  %rcc.tmp.17 = call i32 @stateMachineB.(i32 %rcc.tmp.14, i32 %rcc.tmp.16)
  ret i32 %rcc.tmp.17
if.else.2:
  %rcc.tmp.19 = load i32, ptr %n..tmp
  %rcc.tmp.20 = sub i32 %rcc.tmp.19, 1
  %rcc.tmp.21 = load i32, ptr %value..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = call i32 @stateMachineC.(i32 %rcc.tmp.20, i32 %rcc.tmp.22)
  ret i32 %rcc.tmp.23
if.merge.2:
  ret i32 undef
}
define i32 @stateMachineB.(i32 %n.tmp, i32 %value.tmp) {
entry:
  %n..tmp = alloca i32 
  %value..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %value..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 2
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load i32, ptr %value..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 5
  %rcc.tmp.17 = call i32 @stateMachineC.(i32 %rcc.tmp.14, i32 %rcc.tmp.16)
  ret i32 %rcc.tmp.17
if.else.2:
  %rcc.tmp.19 = load i32, ptr %n..tmp
  %rcc.tmp.20 = sub i32 %rcc.tmp.19, 1
  %rcc.tmp.21 = load i32, ptr %value..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 2
  %rcc.tmp.23 = call i32 @stateMachineA.(i32 %rcc.tmp.20, i32 %rcc.tmp.22)
  ret i32 %rcc.tmp.23
if.merge.2:
  ret i32 undef
}
define i32 @stateMachineC.(i32 %n.tmp, i32 %value.tmp) {
entry:
  %n..tmp = alloca i32 
  %value..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %value..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 5
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load i32, ptr %value..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 20
  %rcc.tmp.17 = call i32 @stateMachineA.(i32 %rcc.tmp.14, i32 %rcc.tmp.16)
  ret i32 %rcc.tmp.17
if.else.2:
  %rcc.tmp.19 = load i32, ptr %n..tmp
  %rcc.tmp.20 = sub i32 %rcc.tmp.19, 1
  %rcc.tmp.21 = load i32, ptr %value..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 3
  %rcc.tmp.23 = call i32 @stateMachineB.(i32 %rcc.tmp.20, i32 %rcc.tmp.22)
  ret i32 %rcc.tmp.23
if.merge.2:
  ret i32 undef
}
define void @testTreeTraversalAlgorithms.() {
entry:
  %tree_nodes = alloca [127 x i32] 
  %fill.idx = alloca i32 
  %preorder_sum = alloca i32 
  %inorder_sum = alloca i32 
  %postorder_sum = alloca i32 
  %search_result = alloca i32 
  %depth_result = alloca i32 
  call void @printlnInt.(i32 1405)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 127
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [127 x i32], ptr %tree_nodes, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @buildBinaryTree.([127 x i32]* %tree_nodes)
  %rcc.tmp.14 = call i32 @preorderTraversal.([127 x i32]* %tree_nodes, i32 0)
  store i32 %rcc.tmp.14, ptr %preorder_sum
  %rcc.tmp.16 = load i32, ptr %preorder_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @inorderTraversal.([127 x i32]* %tree_nodes, i32 0)
  store i32 %rcc.tmp.18, ptr %inorder_sum
  %rcc.tmp.20 = load i32, ptr %inorder_sum
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @postorderTraversal.([127 x i32]* %tree_nodes, i32 0)
  store i32 %rcc.tmp.22, ptr %postorder_sum
  %rcc.tmp.24 = load i32, ptr %postorder_sum
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @recursiveTreeSearch.([127 x i32]* %tree_nodes, i32 0, i32 50)
  store i32 %rcc.tmp.26, ptr %search_result
  %rcc.tmp.28 = load i32, ptr %search_result
  call void @printlnInt.(i32 %rcc.tmp.28)
  %rcc.tmp.30 = call i32 @calculateTreeDepth.([127 x i32]* %tree_nodes, i32 0)
  store i32 %rcc.tmp.30, ptr %depth_result
  %rcc.tmp.32 = load i32, ptr %depth_result
  call void @printlnInt.(i32 %rcc.tmp.32)
  call void @printlnInt.(i32 1406)
  ret void
}
define void @buildBinaryTree.([127 x i32]* %tree.tmp) {
entry:
  %tree..tmp = alloca [127 x i32]* 
  %i = alloca i32 
  store [127 x i32]* %tree.tmp, ptr %tree..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 127
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.11 = getelementptr [127 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 10
  store i32 %rcc.tmp.14, ptr %rcc.tmp.11
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @preorderTraversal.([127 x i32]* %tree.tmp, i32 %index.tmp) {
entry:
  %tree..tmp = alloca [127 x i32]* 
  %index..tmp = alloca i32 
  %current_value = alloca i32 
  %left_sum = alloca i32 
  %right_sum = alloca i32 
  store [127 x i32]* %tree.tmp, ptr %tree..tmp
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.3 = load i32, ptr %index..tmp
  %rcc.tmp.4 = icmp uge i32 %rcc.tmp.3, 127
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %index..tmp
  %rcc.tmp.7 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.8 = getelementptr [127 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %index..tmp
  %rcc.tmp.17 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.18 = getelementptr [127 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %current_value
  %rcc.tmp.21 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.22 = load i32, ptr %index..tmp
  %rcc.tmp.23 = mul i32 2, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = call i32 @preorderTraversal.([127 x i32]* %rcc.tmp.21, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %left_sum
  %rcc.tmp.27 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.28 = load i32, ptr %index..tmp
  %rcc.tmp.29 = mul i32 2, %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 2
  %rcc.tmp.31 = call i32 @preorderTraversal.([127 x i32]* %rcc.tmp.27, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %right_sum
  %rcc.tmp.33 = load i32, ptr %current_value
  %rcc.tmp.34 = load i32, ptr %left_sum
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %right_sum
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  ret i32 %rcc.tmp.37
}
define i32 @inorderTraversal.([127 x i32]* %tree.tmp, i32 %index.tmp) {
entry:
  %tree..tmp = alloca [127 x i32]* 
  %index..tmp = alloca i32 
  %left_sum = alloca i32 
  %current_value = alloca i32 
  %right_sum = alloca i32 
  store [127 x i32]* %tree.tmp, ptr %tree..tmp
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.3 = load i32, ptr %index..tmp
  %rcc.tmp.4 = icmp uge i32 %rcc.tmp.3, 127
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %index..tmp
  %rcc.tmp.7 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.8 = getelementptr [127 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.17 = load i32, ptr %index..tmp
  %rcc.tmp.18 = mul i32 2, %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  %rcc.tmp.20 = call i32 @inorderTraversal.([127 x i32]* %rcc.tmp.16, i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %left_sum
  %rcc.tmp.22 = load i32, ptr %index..tmp
  %rcc.tmp.23 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.24 = getelementptr [127 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %current_value
  %rcc.tmp.27 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.28 = load i32, ptr %index..tmp
  %rcc.tmp.29 = mul i32 2, %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 2
  %rcc.tmp.31 = call i32 @inorderTraversal.([127 x i32]* %rcc.tmp.27, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %right_sum
  %rcc.tmp.33 = load i32, ptr %left_sum
  %rcc.tmp.34 = load i32, ptr %current_value
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %right_sum
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  ret i32 %rcc.tmp.37
}
define i32 @postorderTraversal.([127 x i32]* %tree.tmp, i32 %index.tmp) {
entry:
  %tree..tmp = alloca [127 x i32]* 
  %index..tmp = alloca i32 
  %left_sum = alloca i32 
  %right_sum = alloca i32 
  %current_value = alloca i32 
  store [127 x i32]* %tree.tmp, ptr %tree..tmp
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.3 = load i32, ptr %index..tmp
  %rcc.tmp.4 = icmp uge i32 %rcc.tmp.3, 127
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %index..tmp
  %rcc.tmp.7 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.8 = getelementptr [127 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.17 = load i32, ptr %index..tmp
  %rcc.tmp.18 = mul i32 2, %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  %rcc.tmp.20 = call i32 @postorderTraversal.([127 x i32]* %rcc.tmp.16, i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %left_sum
  %rcc.tmp.22 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.23 = load i32, ptr %index..tmp
  %rcc.tmp.24 = mul i32 2, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 2
  %rcc.tmp.26 = call i32 @postorderTraversal.([127 x i32]* %rcc.tmp.22, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %right_sum
  %rcc.tmp.28 = load i32, ptr %index..tmp
  %rcc.tmp.29 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.30 = getelementptr [127 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %current_value
  %rcc.tmp.33 = load i32, ptr %left_sum
  %rcc.tmp.34 = load i32, ptr %right_sum
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %current_value
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  ret i32 %rcc.tmp.37
}
define i32 @recursiveTreeSearch.([127 x i32]* %tree.tmp, i32 %index.tmp, i32 %target.tmp) {
entry:
  %tree..tmp = alloca [127 x i32]* 
  %index..tmp = alloca i32 
  %target..tmp = alloca i32 
  %left_result = alloca i32 
  %right_result = alloca i32 
  store [127 x i32]* %tree.tmp, ptr %tree..tmp
  store i32 %index.tmp, ptr %index..tmp
  store i32 %target.tmp, ptr %target..tmp
  %rcc.tmp.4 = load i32, ptr %index..tmp
  %rcc.tmp.5 = icmp uge i32 %rcc.tmp.4, 127
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %index..tmp
  %rcc.tmp.8 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.9 = getelementptr [127 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.13 = phi i1 [1, %entry], [%rcc.tmp.11, %or.rhs]
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.17 = load i32, ptr %index..tmp
  %rcc.tmp.18 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.19 = getelementptr [127 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %target..tmp
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.26 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.27 = load i32, ptr %index..tmp
  %rcc.tmp.28 = mul i32 2, %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load i32, ptr %target..tmp
  %rcc.tmp.31 = call i32 @recursiveTreeSearch.([127 x i32]* %rcc.tmp.26, i32 %rcc.tmp.29, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %left_result
  %rcc.tmp.33 = load i32, ptr %left_result
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 1
  br i1 %rcc.tmp.34, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 1
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.38 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.39 = load i32, ptr %index..tmp
  %rcc.tmp.40 = mul i32 2, %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 2
  %rcc.tmp.42 = load i32, ptr %target..tmp
  %rcc.tmp.43 = call i32 @recursiveTreeSearch.([127 x i32]* %rcc.tmp.38, i32 %rcc.tmp.41, i32 %rcc.tmp.42)
  store i32 %rcc.tmp.43, ptr %right_result
  %rcc.tmp.45 = load i32, ptr %right_result
  ret i32 %rcc.tmp.45
}
define i32 @calculateTreeDepth.([127 x i32]* %tree.tmp, i32 %index.tmp) {
entry:
  %tree..tmp = alloca [127 x i32]* 
  %index..tmp = alloca i32 
  %left_depth = alloca i32 
  %right_depth = alloca i32 
  store [127 x i32]* %tree.tmp, ptr %tree..tmp
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.3 = load i32, ptr %index..tmp
  %rcc.tmp.4 = icmp uge i32 %rcc.tmp.3, 127
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %index..tmp
  %rcc.tmp.7 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.8 = getelementptr [127 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.17 = load i32, ptr %index..tmp
  %rcc.tmp.18 = mul i32 2, %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  %rcc.tmp.20 = call i32 @calculateTreeDepth.([127 x i32]* %rcc.tmp.16, i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %left_depth
  %rcc.tmp.22 = load [127 x i32]*, ptr %tree..tmp
  %rcc.tmp.23 = load i32, ptr %index..tmp
  %rcc.tmp.24 = mul i32 2, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 2
  %rcc.tmp.26 = call i32 @calculateTreeDepth.([127 x i32]* %rcc.tmp.22, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %right_depth
  %rcc.tmp.28 = load i32, ptr %left_depth
  %rcc.tmp.29 = load i32, ptr %right_depth
  %rcc.tmp.30 = icmp sgt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.32 = load i32, ptr %left_depth
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  br label %if.merge.2
if.else.2:
  %rcc.tmp.35 = load i32, ptr %right_depth
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.38 = phi i32 [%rcc.tmp.33, %if.then.2], [%rcc.tmp.36, %if.else.2]
  ret i32 %rcc.tmp.38
}
define void @testDivideAndConquerAlgorithms.() {
entry:
  %test_array = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %sort_result = alloca i32 
  %search_target = alloca i32 
  %binary_search_result = alloca i32 
  %kth_element = alloca i32 
  %matrix_result = alloca i32 
  call void @printlnInt.(i32 1407)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %test_array, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeRandomArray.([100 x i32]* %test_array, i32 100)
  %rcc.tmp.14 = call i32 @recursiveMergeSort.([100 x i32]* %test_array, i32 0, i32 99)
  store i32 %rcc.tmp.14, ptr %sort_result
  %rcc.tmp.16 = load i32, ptr %sort_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  store i32 42, ptr %search_target
  %rcc.tmp.19 = load i32, ptr %search_target
  %rcc.tmp.20 = call i32 @recursiveBinarySearch.([100 x i32]* %test_array, i32 0, i32 99, i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %binary_search_result
  %rcc.tmp.22 = load i32, ptr %binary_search_result
  call void @printlnInt.(i32 %rcc.tmp.22)
  %rcc.tmp.24 = call i32 @recursiveQuickSelect.([100 x i32]* %test_array, i32 0, i32 99, i32 50)
  store i32 %rcc.tmp.24, ptr %kth_element
  %rcc.tmp.26 = load i32, ptr %kth_element
  call void @printlnInt.(i32 %rcc.tmp.26)
  %rcc.tmp.28 = call i32 @testRecursiveMatrixMultiplication.()
  store i32 %rcc.tmp.28, ptr %matrix_result
  %rcc.tmp.30 = load i32, ptr %matrix_result
  call void @printlnInt.(i32 %rcc.tmp.30)
  call void @printlnInt.(i32 1408)
  ret void
}
define void @initializeRandomArray.([100 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %arr..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %arr.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 12345, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %seed
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 1103
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 4721
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 1048583
  store i32 %rcc.tmp.16, ptr %seed
  %rcc.tmp.18 = load i32, ptr %seed
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %seed
  %rcc.tmp.22 = sub i32 0, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [100 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %seed
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 1000
  store i32 %rcc.tmp.30, ptr %rcc.tmp.28
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @recursiveMergeSort.([100 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [100 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %mid = alloca i32 
  %left_comparisons = alloca i32 
  %right_comparisons = alloca i32 
  %merge_comparisons = alloca i32 
  store [100 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.4 = load i32, ptr %left..tmp
  %rcc.tmp.5 = load i32, ptr %right..tmp
  %rcc.tmp.6 = icmp uge i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %left..tmp
  %rcc.tmp.11 = load i32, ptr %right..tmp
  %rcc.tmp.12 = load i32, ptr %left..tmp
  %rcc.tmp.13 = sub i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = udiv i32 %rcc.tmp.13, 2
  %rcc.tmp.15 = add i32 %rcc.tmp.10, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %mid
  %rcc.tmp.17 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.18 = load i32, ptr %left..tmp
  %rcc.tmp.19 = load i32, ptr %mid
  %rcc.tmp.20 = call i32 @recursiveMergeSort.([100 x i32]* %rcc.tmp.17, i32 %rcc.tmp.18, i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %left_comparisons
  %rcc.tmp.22 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.23 = load i32, ptr %mid
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = load i32, ptr %right..tmp
  %rcc.tmp.26 = call i32 @recursiveMergeSort.([100 x i32]* %rcc.tmp.22, i32 %rcc.tmp.24, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %right_comparisons
  %rcc.tmp.28 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.29 = load i32, ptr %left..tmp
  %rcc.tmp.30 = load i32, ptr %mid
  %rcc.tmp.31 = load i32, ptr %right..tmp
  %rcc.tmp.32 = call i32 @recursiveMerge.([100 x i32]* %rcc.tmp.28, i32 %rcc.tmp.29, i32 %rcc.tmp.30, i32 %rcc.tmp.31)
  store i32 %rcc.tmp.32, ptr %merge_comparisons
  %rcc.tmp.34 = load i32, ptr %left_comparisons
  %rcc.tmp.35 = load i32, ptr %right_comparisons
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %merge_comparisons
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  ret i32 %rcc.tmp.38
}
define i32 @recursiveMerge.([100 x i32]* %arr.tmp, i32 %left.tmp, i32 %mid.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [100 x i32]* 
  %left..tmp = alloca i32 
  %mid..tmp = alloca i32 
  %right..tmp = alloca i32 
  %left_size = alloca i32 
  %right_size = alloca i32 
  %left_arr = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %right_arr = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %comparisons = alloca i32 
  store [100 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %mid.tmp, ptr %mid..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.5 = load i32, ptr %mid..tmp
  %rcc.tmp.6 = load i32, ptr %left..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %left_size
  %rcc.tmp.10 = load i32, ptr %right..tmp
  %rcc.tmp.11 = load i32, ptr %mid..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %right_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.16 = load i32, ptr %fill.idx
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 50
  br i1 %rcc.tmp.17, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.19 = load i32, ptr %fill.idx
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.27 = load i32, ptr %fill.idx.2
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 50
  br i1 %rcc.tmp.28, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.30 = load i32, ptr %fill.idx.2
  %rcc.tmp.31 = getelementptr [50 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %left_size
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [50 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %left..tmp
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.50 = getelementptr [100 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %rcc.tmp.45
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = load i32, ptr %right_size
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.59, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %mid..tmp
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.68, %rcc.tmp.69
  %rcc.tmp.71 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.72 = getelementptr [100 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  store i32 %rcc.tmp.73, ptr %rcc.tmp.66
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  store i32 0, ptr %j
  %rcc.tmp.81 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.81, ptr %k
  store i32 0, ptr %comparisons
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = load i32, ptr %left_size
  %rcc.tmp.87 = icmp slt i32 %rcc.tmp.85, %rcc.tmp.86
  br i1 %rcc.tmp.87, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = load i32, ptr %right_size
  %rcc.tmp.91 = icmp slt i32 %rcc.tmp.89, %rcc.tmp.90
  br label %sc.merge
sc.merge:
  %rcc.tmp.93 = phi i1 [0, %while.cond.3], [%rcc.tmp.91, %and.rhs]
  br i1 %rcc.tmp.93, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.96 = load i32, ptr %comparisons
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %comparisons
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = getelementptr [50 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %j
  %rcc.tmp.103 = getelementptr [50 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = icmp sle i32 %rcc.tmp.101, %rcc.tmp.104
  br i1 %rcc.tmp.105, label %if.then, label %if.else
if.then:
  %rcc.tmp.107 = load i32, ptr %k
  %rcc.tmp.108 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.109 = getelementptr [100 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = getelementptr [50 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  store i32 %rcc.tmp.112, ptr %rcc.tmp.109
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.118 = load i32, ptr %k
  %rcc.tmp.119 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.120 = getelementptr [100 x i32], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.121 = load i32, ptr %j
  %rcc.tmp.122 = getelementptr [50 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %rcc.tmp.120
  %rcc.tmp.125 = load i32, ptr %j
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 1
  store i32 %rcc.tmp.126, ptr %j
  br label %if.merge
if.merge:
  %rcc.tmp.129 = load i32, ptr %k
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %k
  br label %while.cond.3
while.end.3:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = load i32, ptr %left_size
  %rcc.tmp.136 = icmp slt i32 %rcc.tmp.134, %rcc.tmp.135
  br i1 %rcc.tmp.136, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.139 = load i32, ptr %k
  %rcc.tmp.140 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.141 = getelementptr [100 x i32], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = getelementptr [50 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  store i32 %rcc.tmp.144, ptr %rcc.tmp.141
  %rcc.tmp.146 = load i32, ptr %i
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %i
  %rcc.tmp.149 = load i32, ptr %k
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %k
  br label %while.cond.4
while.end.4:
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.154 = load i32, ptr %j
  %rcc.tmp.155 = load i32, ptr %right_size
  %rcc.tmp.156 = icmp slt i32 %rcc.tmp.154, %rcc.tmp.155
  br i1 %rcc.tmp.156, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.159 = load i32, ptr %k
  %rcc.tmp.160 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.161 = getelementptr [100 x i32], ptr %rcc.tmp.160, i32 0, i32 %rcc.tmp.159
  %rcc.tmp.162 = load i32, ptr %j
  %rcc.tmp.163 = getelementptr [50 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.162
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.163
  store i32 %rcc.tmp.164, ptr %rcc.tmp.161
  %rcc.tmp.166 = load i32, ptr %j
  %rcc.tmp.167 = add i32 %rcc.tmp.166, 1
  store i32 %rcc.tmp.167, ptr %j
  %rcc.tmp.169 = load i32, ptr %k
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %k
  br label %while.cond.5
while.end.5:
  %rcc.tmp.173 = load i32, ptr %comparisons
  ret i32 %rcc.tmp.173
}
define i32 @recursiveBinarySearch.([100 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp, i32 %target.tmp) {
entry:
  %arr..tmp = alloca [100 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %target..tmp = alloca i32 
  %mid = alloca i32 
  store [100 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  store i32 %target.tmp, ptr %target..tmp
  %rcc.tmp.5 = load i32, ptr %left..tmp
  %rcc.tmp.6 = load i32, ptr %right..tmp
  %rcc.tmp.7 = icmp ugt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = sub i32 0, 1
  ret i32 %rcc.tmp.9
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.12 = load i32, ptr %left..tmp
  %rcc.tmp.13 = load i32, ptr %right..tmp
  %rcc.tmp.14 = load i32, ptr %left..tmp
  %rcc.tmp.15 = sub i32 %rcc.tmp.13, %rcc.tmp.14
  %rcc.tmp.16 = udiv i32 %rcc.tmp.15, 2
  %rcc.tmp.17 = add i32 %rcc.tmp.12, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %mid
  %rcc.tmp.19 = load i32, ptr %mid
  %rcc.tmp.20 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %target..tmp
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.26 = load i32, ptr %mid
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  ret i32 %rcc.tmp.27
if.else.2:
  %rcc.tmp.29 = load i32, ptr %mid
  %rcc.tmp.30 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.31 = getelementptr [100 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %target..tmp
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.36 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.37 = load i32, ptr %left..tmp
  %rcc.tmp.38 = load i32, ptr %mid
  %rcc.tmp.39 = sub i32 %rcc.tmp.38, 1
  %rcc.tmp.40 = load i32, ptr %target..tmp
  %rcc.tmp.41 = call i32 @recursiveBinarySearch.([100 x i32]* %rcc.tmp.36, i32 %rcc.tmp.37, i32 %rcc.tmp.39, i32 %rcc.tmp.40)
  ret i32 %rcc.tmp.41
if.else.3:
  %rcc.tmp.43 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.44 = load i32, ptr %mid
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = load i32, ptr %right..tmp
  %rcc.tmp.47 = load i32, ptr %target..tmp
  %rcc.tmp.48 = call i32 @recursiveBinarySearch.([100 x i32]* %rcc.tmp.43, i32 %rcc.tmp.45, i32 %rcc.tmp.46, i32 %rcc.tmp.47)
  ret i32 %rcc.tmp.48
if.merge.3:
  br label %if.merge.2
if.merge.2:
  ret i32 undef
}
define i32 @recursiveQuickSelect.([100 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp, i32 %k.tmp) {
entry:
  %arr..tmp = alloca [100 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %k..tmp = alloca i32 
  %pivot_index = alloca i32 
  store [100 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  store i32 %k.tmp, ptr %k..tmp
  %rcc.tmp.5 = load i32, ptr %left..tmp
  %rcc.tmp.6 = load i32, ptr %right..tmp
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %left..tmp
  %rcc.tmp.10 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.11 = getelementptr [100 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  ret i32 %rcc.tmp.12
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.16 = load i32, ptr %left..tmp
  %rcc.tmp.17 = load i32, ptr %right..tmp
  %rcc.tmp.18 = call i32 @recursivePartition.([100 x i32]* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %pivot_index
  %rcc.tmp.20 = load i32, ptr %k..tmp
  %rcc.tmp.21 = load i32, ptr %pivot_index
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.24 = load i32, ptr %k..tmp
  %rcc.tmp.25 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.26 = getelementptr [100 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  ret i32 %rcc.tmp.27
if.else.2:
  %rcc.tmp.29 = load i32, ptr %k..tmp
  %rcc.tmp.30 = load i32, ptr %pivot_index
  %rcc.tmp.31 = icmp ult i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.33 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.34 = load i32, ptr %left..tmp
  %rcc.tmp.35 = load i32, ptr %pivot_index
  %rcc.tmp.36 = sub i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load i32, ptr %k..tmp
  %rcc.tmp.38 = call i32 @recursiveQuickSelect.([100 x i32]* %rcc.tmp.33, i32 %rcc.tmp.34, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  ret i32 %rcc.tmp.38
if.else.3:
  %rcc.tmp.40 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.41 = load i32, ptr %pivot_index
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  %rcc.tmp.43 = load i32, ptr %right..tmp
  %rcc.tmp.44 = load i32, ptr %k..tmp
  %rcc.tmp.45 = call i32 @recursiveQuickSelect.([100 x i32]* %rcc.tmp.40, i32 %rcc.tmp.42, i32 %rcc.tmp.43, i32 %rcc.tmp.44)
  ret i32 %rcc.tmp.45
if.merge.3:
  br label %if.merge.2
if.merge.2:
  ret i32 undef
}
define i32 @recursivePartition.([100 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [100 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %pivot = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %temp = alloca i32 
  %temp.2 = alloca i32 
  store [100 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.4 = load i32, ptr %right..tmp
  %rcc.tmp.5 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.6 = getelementptr [100 x i32], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.4
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %pivot
  %rcc.tmp.9 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.9, ptr %i
  %rcc.tmp.11 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.11, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %right..tmp
  %rcc.tmp.16 = icmp ult i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %j
  %rcc.tmp.20 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %pivot
  %rcc.tmp.24 = icmp sle i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = sub i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.32 = getelementptr [100 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %temp
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = sub i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.38 = getelementptr [100 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.41 = getelementptr [100 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %rcc.tmp.38
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.46 = getelementptr [100 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %temp
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.57 = getelementptr [100 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %temp.2
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.62 = getelementptr [100 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %right..tmp
  %rcc.tmp.64 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %rcc.tmp.62
  %rcc.tmp.68 = load i32, ptr %right..tmp
  %rcc.tmp.69 = load [100 x i32]*, ptr %arr..tmp
  %rcc.tmp.70 = getelementptr [100 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %temp.2
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %i
  ret i32 %rcc.tmp.73
}
define i32 @testRecursiveMatrixMultiplication.() {
entry:
  %matrix_a = alloca [16 x i32] 
  %matrix_b = alloca [16 x i32] 
  %result_matrix = alloca [16 x i32] 
  %sum = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [16 x i32], ptr %matrix_a, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr [16 x i32], ptr %matrix_b, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.95
  call void @initializeMatrix.([16 x i32]* %matrix_a, i32 4)
  call void @initializeMatrix.([16 x i32]* %matrix_b, i32 4)
  call void @recursiveMatrixMultiply.([16 x i32]* %matrix_a, [16 x i32]* %matrix_b, [16 x i32]* %result_matrix, i32 4)
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = icmp slt i32 %rcc.tmp.103, 16
  br i1 %rcc.tmp.104, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.107 = load i32, ptr %sum
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = getelementptr [16 x i32], ptr %result_matrix, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.107, %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %sum
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.117 = load i32, ptr %sum
  ret i32 %rcc.tmp.117
}
define void @initializeMatrix.([16 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [16 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [16 x i32]* %matrix.tmp, ptr %matrix..tmp
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
  %rcc.tmp.13 = load [16 x i32]*, ptr %matrix..tmp
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 10
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.14
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @recursiveMatrixMultiply.([16 x i32]* %matrix_a.tmp, [16 x i32]* %matrix_b.tmp, [16 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %matrix_a..tmp = alloca [16 x i32]* 
  %matrix_b..tmp = alloca [16 x i32]* 
  %result..tmp = alloca [16 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store [16 x i32]* %matrix_a.tmp, ptr %matrix_a..tmp
  store [16 x i32]* %matrix_b.tmp, ptr %matrix_b..tmp
  store [16 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.5 = load i32, ptr %size..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 1
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load [16 x i32]*, ptr %result..tmp
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = load [16 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.11 = getelementptr [16 x i32], ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = load [16 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = mul i32 %rcc.tmp.12, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %rcc.tmp.9
  ret void
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = load i32, ptr %size..tmp
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = load i32, ptr %size..tmp
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = load i32, ptr %size..tmp
  %rcc.tmp.36 = mul i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = load [16 x i32]*, ptr %result..tmp
  %rcc.tmp.40 = getelementptr [16 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  store i32 0, ptr %rcc.tmp.40
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.44 = load i32, ptr %k
  %rcc.tmp.45 = load i32, ptr %size..tmp
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = load i32, ptr %size..tmp
  %rcc.tmp.51 = mul i32 %rcc.tmp.49, %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = add i32 %rcc.tmp.51, %rcc.tmp.52
  %rcc.tmp.54 = load [16 x i32]*, ptr %result..tmp
  %rcc.tmp.55 = getelementptr [16 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = load i32, ptr %size..tmp
  %rcc.tmp.58 = mul i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = add i32 %rcc.tmp.58, %rcc.tmp.59
  %rcc.tmp.61 = load [16 x i32]*, ptr %result..tmp
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = load i32, ptr %size..tmp
  %rcc.tmp.66 = mul i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %k
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = load [16 x i32]*, ptr %matrix_a..tmp
  %rcc.tmp.70 = getelementptr [16 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %k
  %rcc.tmp.73 = load i32, ptr %size..tmp
  %rcc.tmp.74 = mul i32 %rcc.tmp.72, %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  %rcc.tmp.77 = load [16 x i32]*, ptr %matrix_b..tmp
  %rcc.tmp.78 = getelementptr [16 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = mul i32 %rcc.tmp.71, %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.63, %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %rcc.tmp.55
  %rcc.tmp.83 = load i32, ptr %k
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @testRecursiveMathematicalComputations.() {
entry:
  %gcd_result = alloca i32 
  %fibonacci_result = alloca i32 
  %combination_result = alloca i32 
  %sum_of_divisors = alloca i32 
  %digit_sum = alloca i32 
  call void @printlnInt.(i32 1409)
  %rcc.tmp.2 = call i32 @recursiveGCD.(i32 1071, i32 462)
  store i32 %rcc.tmp.2, ptr %gcd_result
  %rcc.tmp.4 = load i32, ptr %gcd_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @recursiveFibonacci.(i32 25)
  store i32 %rcc.tmp.6, ptr %fibonacci_result
  %rcc.tmp.8 = load i32, ptr %fibonacci_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @recursiveCombination.(i32 10, i32 5)
  store i32 %rcc.tmp.10, ptr %combination_result
  %rcc.tmp.12 = load i32, ptr %combination_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @recursiveSumOfDivisors.(i32 60)
  store i32 %rcc.tmp.14, ptr %sum_of_divisors
  %rcc.tmp.16 = load i32, ptr %sum_of_divisors
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @recursiveDigitSum.(i32 123456789)
  store i32 %rcc.tmp.18, ptr %digit_sum
  %rcc.tmp.20 = load i32, ptr %digit_sum
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 1410)
  ret void
}
define i32 @recursiveGCD.(i32 %a.tmp, i32 %b.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load i32, ptr %b..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %a..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %b..tmp
  %rcc.tmp.10 = load i32, ptr %a..tmp
  %rcc.tmp.11 = load i32, ptr %b..tmp
  %rcc.tmp.12 = srem i32 %rcc.tmp.10, %rcc.tmp.11
  %rcc.tmp.13 = call i32 @recursiveGCD.(i32 %rcc.tmp.9, i32 %rcc.tmp.12)
  ret i32 %rcc.tmp.13
}
define i32 @recursiveFibonacci.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
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
  %rcc.tmp.8 = load i32, ptr %n..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = call i32 @recursiveFibonacci.(i32 %rcc.tmp.9)
  %rcc.tmp.11 = load i32, ptr %n..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.11, 2
  %rcc.tmp.13 = call i32 @recursiveFibonacci.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = add i32 %rcc.tmp.10, %rcc.tmp.13
  ret i32 %rcc.tmp.14
}
define i32 @recursiveCombination.(i32 %n.tmp, i32 %k.tmp) {
entry:
  %n..tmp = alloca i32 
  %k..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %k.tmp, ptr %k..tmp
  %rcc.tmp.3 = load i32, ptr %k..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %k..tmp
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = icmp eq i32 %rcc.tmp.6, %rcc.tmp.7
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %k..tmp
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 1
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %n..tmp
  ret i32 %rcc.tmp.17
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.20 = load i32, ptr %n..tmp
  %rcc.tmp.21 = sub i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load i32, ptr %k..tmp
  %rcc.tmp.23 = sub i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = call i32 @recursiveCombination.(i32 %rcc.tmp.21, i32 %rcc.tmp.23)
  %rcc.tmp.25 = load i32, ptr %n..tmp
  %rcc.tmp.26 = sub i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = load i32, ptr %k..tmp
  %rcc.tmp.28 = call i32 @recursiveCombination.(i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  %rcc.tmp.29 = add i32 %rcc.tmp.24, %rcc.tmp.28
  ret i32 %rcc.tmp.29
}
define i32 @recursiveSumOfDivisors.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = call i32 @recursiveSumOfDivisorsHelper.(i32 %rcc.tmp.2, i32 1, i32 0)
  ret i32 %rcc.tmp.3
}
define i32 @recursiveSumOfDivisorsHelper.(i32 %n.tmp, i32 %current.tmp, i32 %sum.tmp) {
entry:
  %n..tmp = alloca i32 
  %current..tmp = alloca i32 
  %sum..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %current.tmp, ptr %current..tmp
  store i32 %sum.tmp, ptr %sum..tmp
  %rcc.tmp.4 = load i32, ptr %current..tmp
  %rcc.tmp.5 = load i32, ptr %n..tmp
  %rcc.tmp.6 = icmp sgt i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %sum..tmp
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %n..tmp
  %rcc.tmp.12 = load i32, ptr %current..tmp
  %rcc.tmp.13 = srem i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 0
  br i1 %rcc.tmp.14, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.16 = load i32, ptr %n..tmp
  %rcc.tmp.17 = load i32, ptr %current..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  %rcc.tmp.19 = load i32, ptr %sum..tmp
  %rcc.tmp.20 = load i32, ptr %current..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = call i32 @recursiveSumOfDivisorsHelper.(i32 %rcc.tmp.16, i32 %rcc.tmp.18, i32 %rcc.tmp.21)
  ret i32 %rcc.tmp.22
if.else.2:
  %rcc.tmp.24 = load i32, ptr %n..tmp
  %rcc.tmp.25 = load i32, ptr %current..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = load i32, ptr %sum..tmp
  %rcc.tmp.28 = call i32 @recursiveSumOfDivisorsHelper.(i32 %rcc.tmp.24, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  ret i32 %rcc.tmp.28
if.merge.2:
  ret i32 undef
}
define i32 @recursiveDigitSum.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp slt i32 %rcc.tmp.2, 10
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %n..tmp
  ret i32 %rcc.tmp.5
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load i32, ptr %n..tmp
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 10
  %rcc.tmp.10 = load i32, ptr %n..tmp
  %rcc.tmp.11 = sdiv i32 %rcc.tmp.10, 10
  %rcc.tmp.12 = call i32 @recursiveDigitSum.(i32 %rcc.tmp.11)
  %rcc.tmp.13 = add i32 %rcc.tmp.9, %rcc.tmp.12
  ret i32 %rcc.tmp.13
}
define i32 @recursiveArraySum.([100 x i32]* %arr.tmp, i32 %index.tmp, i32 %size.tmp) {
entry:
  %arr..local = alloca [100 x i32] 
  %index..tmp = alloca i32 
  %size..tmp = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %arr..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %arr.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %index.tmp, ptr %index..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.6 = load i32, ptr %index..tmp
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp uge i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.12 = load i32, ptr %index..tmp
  %rcc.tmp.13 = getelementptr [100 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %index..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = call i32 @recursiveArraySum.([100 x i32]* %arr..local, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  %rcc.tmp.19 = add i32 %rcc.tmp.14, %rcc.tmp.18
  ret i32 %rcc.tmp.19
}
define i32 @recursiveArrayMax.([100 x i32]* %arr.tmp, i32 %index.tmp, i32 %size.tmp, i32 %current_max.tmp) {
entry:
  %arr..local = alloca [100 x i32] 
  %index..tmp = alloca i32 
  %size..tmp = alloca i32 
  %current_max..tmp = alloca i32 
  %new_max = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %arr..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %arr.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %index.tmp, ptr %index..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %current_max.tmp, ptr %current_max..tmp
  %rcc.tmp.7 = load i32, ptr %index..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp uge i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %current_max..tmp
  ret i32 %rcc.tmp.11
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %index..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %current_max..tmp
  %rcc.tmp.18 = icmp sgt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.20 = load i32, ptr %index..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %arr..local, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  br label %if.merge.2
if.else.2:
  %rcc.tmp.24 = load i32, ptr %current_max..tmp
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.26 = phi i32 [%rcc.tmp.22, %if.then.2], [%rcc.tmp.24, %if.else.2]
  store i32 %rcc.tmp.26, ptr %new_max
  %rcc.tmp.28 = load i32, ptr %index..tmp
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load i32, ptr %size..tmp
  %rcc.tmp.31 = load i32, ptr %new_max
  %rcc.tmp.32 = call i32 @recursiveArrayMax.([100 x i32]* %arr..local, i32 %rcc.tmp.29, i32 %rcc.tmp.30, i32 %rcc.tmp.31)
  ret i32 %rcc.tmp.32
}
define i32 @recursiveStringLength.(i32 %value.tmp, i32 %length.tmp) {
entry:
  %value..tmp = alloca i32 
  %length..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  store i32 %length.tmp, ptr %length..tmp
  %rcc.tmp.3 = load i32, ptr %value..tmp
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 10
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %length..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %value..tmp
  %rcc.tmp.11 = sdiv i32 %rcc.tmp.10, 10
  %rcc.tmp.12 = load i32, ptr %length..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = call i32 @recursiveStringLength.(i32 %rcc.tmp.11, i32 %rcc.tmp.13)
  ret i32 %rcc.tmp.14
}
define i32 @recursiveIsPalindrome.(i32 %n.tmp, i32 %reversed.tmp, i32 %original.tmp) {
entry:
  %n..tmp = alloca i32 
  %reversed..tmp = alloca i32 
  %original..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %reversed.tmp, ptr %reversed..tmp
  store i32 %original.tmp, ptr %original..tmp
  %rcc.tmp.4 = load i32, ptr %n..tmp
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %reversed..tmp
  %rcc.tmp.8 = load i32, ptr %original..tmp
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  ret i32 0
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %n..tmp
  %rcc.tmp.16 = sdiv i32 %rcc.tmp.15, 10
  %rcc.tmp.17 = load i32, ptr %reversed..tmp
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 10
  %rcc.tmp.19 = load i32, ptr %n..tmp
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 10
  %rcc.tmp.21 = add i32 %rcc.tmp.18, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %original..tmp
  %rcc.tmp.23 = call i32 @recursiveIsPalindrome.(i32 %rcc.tmp.16, i32 %rcc.tmp.21, i32 %rcc.tmp.22)
  ret i32 %rcc.tmp.23
}
