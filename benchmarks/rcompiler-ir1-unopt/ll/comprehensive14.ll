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
%Node = type {i32, i32, i32, i32, i1, i32, i32, i32, i32, i32, i32, i32}
%AVLTree = type {[2000 x %Node], i32, i32, [2000 x i32], i32, i32, i32, i32, i32, i32}
%HashTable = type {[1000 x [20 x i32]], [1000 x i32], [1000 x [20 x i32]], i32, i32, i32, i32, i32, i32, i32}
%LRUCache = type {[500 x i32], [500 x i32], [500 x i32], [10000 x i32], i32, i32, i32, i32, i32}
%MemoryManager = type {[10000 x i32], [10000 x i1], [10000 x i32], i32, i32, i32, i32, i32, i32}
define void @Node.new.(%Node* sret(%Node) %ret.slot, i32 %value.tmp, i32 %key.tmp) {
entry:
  %value..tmp = alloca i32 
  %key..tmp = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = getelementptr %Node, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr %Node, ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr %Node, ptr %ret.slot, i32 0, i32 2
  store i32 1, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr %Node, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Node, ptr %ret.slot, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Node, ptr %ret.slot, i32 0, i32 5
  store i32 1, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr %Node, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Node, ptr %ret.slot, i32 0, i32 7
  %rcc.tmp.20 = sub i32 0, 1
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr %Node, ptr %ret.slot, i32 0, i32 8
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %Node, ptr %ret.slot, i32 0, i32 9
  %rcc.tmp.26 = sub i32 0, 1
  store i32 %rcc.tmp.26, ptr %rcc.tmp.25
  %rcc.tmp.28 = getelementptr %Node, ptr %ret.slot, i32 0, i32 10
  %rcc.tmp.29 = sub i32 0, 1
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = getelementptr %Node, ptr %ret.slot, i32 0, i32 11
  %rcc.tmp.32 = sub i32 0, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  ret void
}
define i32 @AVLTree.allocate_node.(%AVLTree* %self.tmp, i32 %value.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %value..tmp = alloca i32 
  %key..tmp = alloca i32 
  %node_index = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %value.tmp, ptr %value..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.4 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %AVLTree, ptr %rcc.tmp.4, i32 0, i32 4
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = sub i32 0, 1
  ret i32 %rcc.tmp.9
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.12 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %AVLTree, ptr %rcc.tmp.12, i32 0, i32 4
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = sub i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %rcc.tmp.13
  %rcc.tmp.17 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %AVLTree, ptr %rcc.tmp.17, i32 0, i32 3
  %rcc.tmp.19 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %AVLTree, ptr %rcc.tmp.19, i32 0, i32 4
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [2000 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %node_index
  %rcc.tmp.26 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.27 = getelementptr %AVLTree, ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = load i32, ptr %node_index
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [2000 x %Node], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %value..tmp
  %rcc.tmp.32 = load i32, ptr %key..tmp
  call void @Node.new.(%Node* %rcc.tmp.30, i32 %rcc.tmp.31, i32 %rcc.tmp.32)
  %rcc.tmp.34 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %AVLTree, ptr %rcc.tmp.34, i32 0, i32 1
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.35
  %rcc.tmp.39 = load i32, ptr %node_index
  ret i32 %rcc.tmp.39
}
define void @AVLTree.deallocate_node.(%AVLTree* %self.tmp, i32 %node_index.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %node_index..tmp = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %node_index.tmp, ptr %node_index..tmp
  %rcc.tmp.3 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %AVLTree, ptr %rcc.tmp.3, i32 0, i32 4
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 2000
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %AVLTree, ptr %rcc.tmp.8, i32 0, i32 3
  %rcc.tmp.10 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %AVLTree, ptr %rcc.tmp.10, i32 0, i32 4
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [2000 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %node_index..tmp
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %AVLTree, ptr %rcc.tmp.17, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %rcc.tmp.18
  %rcc.tmp.22 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %AVLTree, ptr %rcc.tmp.22, i32 0, i32 1
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = sub i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %rcc.tmp.23
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @AVLTree.get_height.(%AVLTree* %self.tmp, i32 %node.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %node..tmp = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.3 = load i32, ptr %node..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %AVLTree, ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %node..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [2000 x %Node], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.14 = getelementptr %Node, ptr %rcc.tmp.13, i32 0, i32 2
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  ret i32 %rcc.tmp.15
}
define i32 @AVLTree.get_balance.(%AVLTree* %self.tmp, i32 %node.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %node..tmp = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.3 = load i32, ptr %node..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.10 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %AVLTree, ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load i32, ptr %node..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [2000 x %Node], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Node, ptr %rcc.tmp.14, i32 0, i32 9
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = call i32 @AVLTree.get_height.(%AVLTree* %rcc.tmp.9, i32 %rcc.tmp.16)
  %rcc.tmp.18 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.19 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %AVLTree, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %node..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [2000 x %Node], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Node, ptr %rcc.tmp.23, i32 0, i32 10
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = call i32 @AVLTree.get_height.(%AVLTree* %rcc.tmp.18, i32 %rcc.tmp.25)
  %rcc.tmp.27 = sub i32 %rcc.tmp.17, %rcc.tmp.26
  ret i32 %rcc.tmp.27
}
define void @AVLTree.update_height.(%AVLTree* %self.tmp, i32 %node.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %node..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.3 = load i32, ptr %node..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp ne i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.8 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %AVLTree, ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = load i32, ptr %node..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [2000 x %Node], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Node, ptr %rcc.tmp.12, i32 0, i32 9
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = call i32 @AVLTree.get_height.(%AVLTree* %rcc.tmp.7, i32 %rcc.tmp.14)
  store i32 %rcc.tmp.15, ptr %left_height
  %rcc.tmp.17 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.18 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %AVLTree, ptr %rcc.tmp.18, i32 0, i32 0
  %rcc.tmp.20 = load i32, ptr %node..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [2000 x %Node], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = getelementptr %Node, ptr %rcc.tmp.22, i32 0, i32 10
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = call i32 @AVLTree.get_height.(%AVLTree* %rcc.tmp.17, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %right_height
  %rcc.tmp.27 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %AVLTree, ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %node..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [2000 x %Node], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %Node, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %left_height
  %rcc.tmp.34 = load i32, ptr %right_height
  %rcc.tmp.35 = icmp sgt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load i32, ptr %left_height
  br label %if.merge.2
if.else.2:
  %rcc.tmp.39 = load i32, ptr %right_height
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.41 = phi i32 [%rcc.tmp.37, %if.then.2], [%rcc.tmp.39, %if.else.2]
  %rcc.tmp.42 = add i32 1, %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %rcc.tmp.32
  %rcc.tmp.44 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %AVLTree, ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.46 = load i32, ptr %node..tmp
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [2000 x %Node], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 3
  %rcc.tmp.50 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.51 = load i32, ptr %node..tmp
  %rcc.tmp.52 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.50, i32 %rcc.tmp.51)
  store i32 %rcc.tmp.52, ptr %rcc.tmp.49
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @AVLTree.right_rotate.(%AVLTree* %self.tmp, i32 %y.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %y..tmp = alloca i32 
  %x = alloca i32 
  %t2 = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %y.tmp, ptr %y..tmp
  %rcc.tmp.3 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %AVLTree, ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %y..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [2000 x %Node], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 9
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %x
  %rcc.tmp.11 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %AVLTree, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %x
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [2000 x %Node], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.15, i32 0, i32 10
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %t2
  %rcc.tmp.19 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %AVLTree, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %x
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [2000 x %Node], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Node, ptr %rcc.tmp.23, i32 0, i32 10
  %rcc.tmp.25 = load i32, ptr %y..tmp
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %AVLTree, ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %y..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [2000 x %Node], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %Node, ptr %rcc.tmp.31, i32 0, i32 9
  %rcc.tmp.33 = load i32, ptr %t2
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %AVLTree, ptr %rcc.tmp.35, i32 0, i32 0
  %rcc.tmp.37 = load i32, ptr %y..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [2000 x %Node], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = getelementptr %Node, ptr %rcc.tmp.39, i32 0, i32 11
  %rcc.tmp.41 = load i32, ptr %x
  store i32 %rcc.tmp.41, ptr %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %t2
  %rcc.tmp.44 = sub i32 0, 1
  %rcc.tmp.45 = icmp ne i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %if.then, label %if.else
if.then:
  %rcc.tmp.47 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %AVLTree, ptr %rcc.tmp.47, i32 0, i32 0
  %rcc.tmp.49 = load i32, ptr %t2
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [2000 x %Node], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = getelementptr %Node, ptr %rcc.tmp.51, i32 0, i32 11
  %rcc.tmp.53 = load i32, ptr %y..tmp
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.57 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.58 = load i32, ptr %y..tmp
  call void @AVLTree.update_height.(%AVLTree* %rcc.tmp.57, i32 %rcc.tmp.58)
  %rcc.tmp.60 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.61 = load i32, ptr %x
  call void @AVLTree.update_height.(%AVLTree* %rcc.tmp.60, i32 %rcc.tmp.61)
  %rcc.tmp.63 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %AVLTree, ptr %rcc.tmp.63, i32 0, i32 8
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %rcc.tmp.64
  %rcc.tmp.68 = load i32, ptr %x
  ret i32 %rcc.tmp.68
}
define i32 @AVLTree.left_rotate.(%AVLTree* %self.tmp, i32 %x.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %x..tmp = alloca i32 
  %y = alloca i32 
  %t2 = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %x.tmp, ptr %x..tmp
  %rcc.tmp.3 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %AVLTree, ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %x..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [2000 x %Node], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 10
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %y
  %rcc.tmp.11 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %AVLTree, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %y
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [2000 x %Node], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.15, i32 0, i32 9
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %t2
  %rcc.tmp.19 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %AVLTree, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %y
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [2000 x %Node], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Node, ptr %rcc.tmp.23, i32 0, i32 9
  %rcc.tmp.25 = load i32, ptr %x..tmp
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %AVLTree, ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %x..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [2000 x %Node], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %Node, ptr %rcc.tmp.31, i32 0, i32 10
  %rcc.tmp.33 = load i32, ptr %t2
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %AVLTree, ptr %rcc.tmp.35, i32 0, i32 0
  %rcc.tmp.37 = load i32, ptr %x..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [2000 x %Node], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = getelementptr %Node, ptr %rcc.tmp.39, i32 0, i32 11
  %rcc.tmp.41 = load i32, ptr %y
  store i32 %rcc.tmp.41, ptr %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %t2
  %rcc.tmp.44 = sub i32 0, 1
  %rcc.tmp.45 = icmp ne i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %if.then, label %if.else
if.then:
  %rcc.tmp.47 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %AVLTree, ptr %rcc.tmp.47, i32 0, i32 0
  %rcc.tmp.49 = load i32, ptr %t2
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [2000 x %Node], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = getelementptr %Node, ptr %rcc.tmp.51, i32 0, i32 11
  %rcc.tmp.53 = load i32, ptr %x..tmp
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.57 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.58 = load i32, ptr %x..tmp
  call void @AVLTree.update_height.(%AVLTree* %rcc.tmp.57, i32 %rcc.tmp.58)
  %rcc.tmp.60 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.61 = load i32, ptr %y
  call void @AVLTree.update_height.(%AVLTree* %rcc.tmp.60, i32 %rcc.tmp.61)
  %rcc.tmp.63 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %AVLTree, ptr %rcc.tmp.63, i32 0, i32 8
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %rcc.tmp.64
  %rcc.tmp.68 = load i32, ptr %y
  ret i32 %rcc.tmp.68
}
define i32 @AVLTree.insert.(%AVLTree* %self.tmp, i32 %root.tmp, i32 %key.tmp, i32 %value.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %root..tmp = alloca i32 
  %key..tmp = alloca i32 
  %value..tmp = alloca i32 
  %new_node = alloca i32 
  %new_left = alloca i32 
  %new_right = alloca i32 
  %balance = alloca i32 
  %new_left.2 = alloca i32 
  %new_right.2 = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.5 = load i32, ptr %root..tmp
  %rcc.tmp.6 = sub i32 0, 1
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.10 = load i32, ptr %value..tmp
  %rcc.tmp.11 = load i32, ptr %key..tmp
  %rcc.tmp.12 = call i32 @AVLTree.allocate_node.(%AVLTree* %rcc.tmp.9, i32 %rcc.tmp.10, i32 %rcc.tmp.11)
  store i32 %rcc.tmp.12, ptr %new_node
  %rcc.tmp.14 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %AVLTree, ptr %rcc.tmp.14, i32 0, i32 6
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.15
  %rcc.tmp.19 = load i32, ptr %new_node
  ret i32 %rcc.tmp.19
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %key..tmp
  %rcc.tmp.23 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %AVLTree, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %root..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [2000 x %Node], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = getelementptr %Node, ptr %rcc.tmp.27, i32 0, i32 1
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.32 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.33 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.34 = getelementptr %AVLTree, ptr %rcc.tmp.33, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %root..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [2000 x %Node], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = getelementptr %Node, ptr %rcc.tmp.37, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %key..tmp
  %rcc.tmp.41 = load i32, ptr %value..tmp
  %rcc.tmp.42 = call i32 @AVLTree.insert.(%AVLTree* %rcc.tmp.32, i32 %rcc.tmp.39, i32 %rcc.tmp.40, i32 %rcc.tmp.41)
  store i32 %rcc.tmp.42, ptr %new_left
  %rcc.tmp.44 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %AVLTree, ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.46 = load i32, ptr %root..tmp
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [2000 x %Node], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 9
  %rcc.tmp.50 = load i32, ptr %new_left
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %new_left
  %rcc.tmp.53 = sub i32 0, 1
  %rcc.tmp.54 = icmp ne i32 %rcc.tmp.52, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.56 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %AVLTree, ptr %rcc.tmp.56, i32 0, i32 0
  %rcc.tmp.58 = load i32, ptr %new_left
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [2000 x %Node], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = getelementptr %Node, ptr %rcc.tmp.60, i32 0, i32 11
  %rcc.tmp.62 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.62, ptr %rcc.tmp.61
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.67 = load i32, ptr %key..tmp
  %rcc.tmp.68 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %AVLTree, ptr %rcc.tmp.68, i32 0, i32 0
  %rcc.tmp.70 = load i32, ptr %root..tmp
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [2000 x %Node], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = getelementptr %Node, ptr %rcc.tmp.72, i32 0, i32 1
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = icmp sgt i32 %rcc.tmp.67, %rcc.tmp.74
  br i1 %rcc.tmp.75, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.77 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.78 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.79 = getelementptr %AVLTree, ptr %rcc.tmp.78, i32 0, i32 0
  %rcc.tmp.80 = load i32, ptr %root..tmp
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = getelementptr [2000 x %Node], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.83 = getelementptr %Node, ptr %rcc.tmp.82, i32 0, i32 10
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %key..tmp
  %rcc.tmp.86 = load i32, ptr %value..tmp
  %rcc.tmp.87 = call i32 @AVLTree.insert.(%AVLTree* %rcc.tmp.77, i32 %rcc.tmp.84, i32 %rcc.tmp.85, i32 %rcc.tmp.86)
  store i32 %rcc.tmp.87, ptr %new_right
  %rcc.tmp.89 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.90 = getelementptr %AVLTree, ptr %rcc.tmp.89, i32 0, i32 0
  %rcc.tmp.91 = load i32, ptr %root..tmp
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [2000 x %Node], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = getelementptr %Node, ptr %rcc.tmp.93, i32 0, i32 10
  %rcc.tmp.95 = load i32, ptr %new_right
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = load i32, ptr %new_right
  %rcc.tmp.98 = sub i32 0, 1
  %rcc.tmp.99 = icmp ne i32 %rcc.tmp.97, %rcc.tmp.98
  br i1 %rcc.tmp.99, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.101 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.102 = getelementptr %AVLTree, ptr %rcc.tmp.101, i32 0, i32 0
  %rcc.tmp.103 = load i32, ptr %new_right
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = getelementptr [2000 x %Node], ptr %rcc.tmp.102, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.106 = getelementptr %Node, ptr %rcc.tmp.105, i32 0, i32 11
  %rcc.tmp.107 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.112 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.113 = getelementptr %AVLTree, ptr %rcc.tmp.112, i32 0, i32 0
  %rcc.tmp.114 = load i32, ptr %root..tmp
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = getelementptr [2000 x %Node], ptr %rcc.tmp.113, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.117 = getelementptr %Node, ptr %rcc.tmp.116, i32 0, i32 0
  %rcc.tmp.118 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.118, ptr %rcc.tmp.117
  %rcc.tmp.120 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.121 = getelementptr %AVLTree, ptr %rcc.tmp.120, i32 0, i32 0
  %rcc.tmp.122 = load i32, ptr %root..tmp
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [2000 x %Node], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = getelementptr %Node, ptr %rcc.tmp.124, i32 0, i32 5
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %rcc.tmp.125
  %rcc.tmp.129 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.129
if.merge.4:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.132 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.133 = load i32, ptr %root..tmp
  call void @AVLTree.update_height.(%AVLTree* %rcc.tmp.132, i32 %rcc.tmp.133)
  %rcc.tmp.135 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.136 = load i32, ptr %root..tmp
  %rcc.tmp.137 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.135, i32 %rcc.tmp.136)
  store i32 %rcc.tmp.137, ptr %balance
  %rcc.tmp.139 = load i32, ptr %balance
  %rcc.tmp.140 = icmp sgt i32 %rcc.tmp.139, 1
  br i1 %rcc.tmp.140, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.142 = load i32, ptr %key..tmp
  %rcc.tmp.143 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.144 = getelementptr %AVLTree, ptr %rcc.tmp.143, i32 0, i32 0
  %rcc.tmp.145 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.146 = getelementptr %AVLTree, ptr %rcc.tmp.145, i32 0, i32 0
  %rcc.tmp.147 = load i32, ptr %root..tmp
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 0
  %rcc.tmp.149 = getelementptr [2000 x %Node], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.150 = getelementptr %Node, ptr %rcc.tmp.149, i32 0, i32 9
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.150
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = getelementptr [2000 x %Node], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.154 = getelementptr %Node, ptr %rcc.tmp.153, i32 0, i32 1
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.154
  %rcc.tmp.156 = icmp slt i32 %rcc.tmp.142, %rcc.tmp.155
  br label %sc.merge
sc.merge:
  %rcc.tmp.158 = phi i1 [0, %if.merge.2], [%rcc.tmp.156, %and.rhs]
  br i1 %rcc.tmp.158, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.160 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.161 = load i32, ptr %root..tmp
  %rcc.tmp.162 = call i32 @AVLTree.right_rotate.(%AVLTree* %rcc.tmp.160, i32 %rcc.tmp.161)
  ret i32 %rcc.tmp.162
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.165 = load i32, ptr %balance
  %rcc.tmp.166 = sub i32 0, 1
  %rcc.tmp.167 = icmp slt i32 %rcc.tmp.165, %rcc.tmp.166
  br i1 %rcc.tmp.167, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.169 = load i32, ptr %key..tmp
  %rcc.tmp.170 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.171 = getelementptr %AVLTree, ptr %rcc.tmp.170, i32 0, i32 0
  %rcc.tmp.172 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.173 = getelementptr %AVLTree, ptr %rcc.tmp.172, i32 0, i32 0
  %rcc.tmp.174 = load i32, ptr %root..tmp
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 0
  %rcc.tmp.176 = getelementptr [2000 x %Node], ptr %rcc.tmp.173, i32 0, i32 %rcc.tmp.175
  %rcc.tmp.177 = getelementptr %Node, ptr %rcc.tmp.176, i32 0, i32 10
  %rcc.tmp.178 = load i32, ptr %rcc.tmp.177
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 0
  %rcc.tmp.180 = getelementptr [2000 x %Node], ptr %rcc.tmp.171, i32 0, i32 %rcc.tmp.179
  %rcc.tmp.181 = getelementptr %Node, ptr %rcc.tmp.180, i32 0, i32 1
  %rcc.tmp.182 = load i32, ptr %rcc.tmp.181
  %rcc.tmp.183 = icmp sgt i32 %rcc.tmp.169, %rcc.tmp.182
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.185 = phi i1 [0, %if.merge.6], [%rcc.tmp.183, %and.rhs.2]
  br i1 %rcc.tmp.185, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.187 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.188 = load i32, ptr %root..tmp
  %rcc.tmp.189 = call i32 @AVLTree.left_rotate.(%AVLTree* %rcc.tmp.187, i32 %rcc.tmp.188)
  ret i32 %rcc.tmp.189
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.192 = load i32, ptr %balance
  %rcc.tmp.193 = icmp sgt i32 %rcc.tmp.192, 1
  br i1 %rcc.tmp.193, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.195 = load i32, ptr %key..tmp
  %rcc.tmp.196 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.197 = getelementptr %AVLTree, ptr %rcc.tmp.196, i32 0, i32 0
  %rcc.tmp.198 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.199 = getelementptr %AVLTree, ptr %rcc.tmp.198, i32 0, i32 0
  %rcc.tmp.200 = load i32, ptr %root..tmp
  %rcc.tmp.201 = add i32 %rcc.tmp.200, 0
  %rcc.tmp.202 = getelementptr [2000 x %Node], ptr %rcc.tmp.199, i32 0, i32 %rcc.tmp.201
  %rcc.tmp.203 = getelementptr %Node, ptr %rcc.tmp.202, i32 0, i32 9
  %rcc.tmp.204 = load i32, ptr %rcc.tmp.203
  %rcc.tmp.205 = add i32 %rcc.tmp.204, 0
  %rcc.tmp.206 = getelementptr [2000 x %Node], ptr %rcc.tmp.197, i32 0, i32 %rcc.tmp.205
  %rcc.tmp.207 = getelementptr %Node, ptr %rcc.tmp.206, i32 0, i32 1
  %rcc.tmp.208 = load i32, ptr %rcc.tmp.207
  %rcc.tmp.209 = icmp sgt i32 %rcc.tmp.195, %rcc.tmp.208
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.211 = phi i1 [0, %if.merge.7], [%rcc.tmp.209, %and.rhs.3]
  br i1 %rcc.tmp.211, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.213 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.214 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.215 = getelementptr %AVLTree, ptr %rcc.tmp.214, i32 0, i32 0
  %rcc.tmp.216 = load i32, ptr %root..tmp
  %rcc.tmp.217 = add i32 %rcc.tmp.216, 0
  %rcc.tmp.218 = getelementptr [2000 x %Node], ptr %rcc.tmp.215, i32 0, i32 %rcc.tmp.217
  %rcc.tmp.219 = getelementptr %Node, ptr %rcc.tmp.218, i32 0, i32 9
  %rcc.tmp.220 = load i32, ptr %rcc.tmp.219
  %rcc.tmp.221 = call i32 @AVLTree.left_rotate.(%AVLTree* %rcc.tmp.213, i32 %rcc.tmp.220)
  store i32 %rcc.tmp.221, ptr %new_left.2
  %rcc.tmp.223 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.224 = getelementptr %AVLTree, ptr %rcc.tmp.223, i32 0, i32 0
  %rcc.tmp.225 = load i32, ptr %root..tmp
  %rcc.tmp.226 = add i32 %rcc.tmp.225, 0
  %rcc.tmp.227 = getelementptr [2000 x %Node], ptr %rcc.tmp.224, i32 0, i32 %rcc.tmp.226
  %rcc.tmp.228 = getelementptr %Node, ptr %rcc.tmp.227, i32 0, i32 9
  %rcc.tmp.229 = load i32, ptr %new_left.2
  store i32 %rcc.tmp.229, ptr %rcc.tmp.228
  %rcc.tmp.231 = load i32, ptr %new_left.2
  %rcc.tmp.232 = sub i32 0, 1
  %rcc.tmp.233 = icmp ne i32 %rcc.tmp.231, %rcc.tmp.232
  br i1 %rcc.tmp.233, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.235 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.236 = getelementptr %AVLTree, ptr %rcc.tmp.235, i32 0, i32 0
  %rcc.tmp.237 = load i32, ptr %new_left.2
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = getelementptr [2000 x %Node], ptr %rcc.tmp.236, i32 0, i32 %rcc.tmp.238
  %rcc.tmp.240 = getelementptr %Node, ptr %rcc.tmp.239, i32 0, i32 11
  %rcc.tmp.241 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.241, ptr %rcc.tmp.240
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.245 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.246 = load i32, ptr %root..tmp
  %rcc.tmp.247 = call i32 @AVLTree.right_rotate.(%AVLTree* %rcc.tmp.245, i32 %rcc.tmp.246)
  ret i32 %rcc.tmp.247
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.250 = load i32, ptr %balance
  %rcc.tmp.251 = sub i32 0, 1
  %rcc.tmp.252 = icmp slt i32 %rcc.tmp.250, %rcc.tmp.251
  br i1 %rcc.tmp.252, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.254 = load i32, ptr %key..tmp
  %rcc.tmp.255 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.256 = getelementptr %AVLTree, ptr %rcc.tmp.255, i32 0, i32 0
  %rcc.tmp.257 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.258 = getelementptr %AVLTree, ptr %rcc.tmp.257, i32 0, i32 0
  %rcc.tmp.259 = load i32, ptr %root..tmp
  %rcc.tmp.260 = add i32 %rcc.tmp.259, 0
  %rcc.tmp.261 = getelementptr [2000 x %Node], ptr %rcc.tmp.258, i32 0, i32 %rcc.tmp.260
  %rcc.tmp.262 = getelementptr %Node, ptr %rcc.tmp.261, i32 0, i32 10
  %rcc.tmp.263 = load i32, ptr %rcc.tmp.262
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [2000 x %Node], ptr %rcc.tmp.256, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = getelementptr %Node, ptr %rcc.tmp.265, i32 0, i32 1
  %rcc.tmp.267 = load i32, ptr %rcc.tmp.266
  %rcc.tmp.268 = icmp slt i32 %rcc.tmp.254, %rcc.tmp.267
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.270 = phi i1 [0, %if.merge.8], [%rcc.tmp.268, %and.rhs.4]
  br i1 %rcc.tmp.270, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.272 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.273 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.274 = getelementptr %AVLTree, ptr %rcc.tmp.273, i32 0, i32 0
  %rcc.tmp.275 = load i32, ptr %root..tmp
  %rcc.tmp.276 = add i32 %rcc.tmp.275, 0
  %rcc.tmp.277 = getelementptr [2000 x %Node], ptr %rcc.tmp.274, i32 0, i32 %rcc.tmp.276
  %rcc.tmp.278 = getelementptr %Node, ptr %rcc.tmp.277, i32 0, i32 10
  %rcc.tmp.279 = load i32, ptr %rcc.tmp.278
  %rcc.tmp.280 = call i32 @AVLTree.right_rotate.(%AVLTree* %rcc.tmp.272, i32 %rcc.tmp.279)
  store i32 %rcc.tmp.280, ptr %new_right.2
  %rcc.tmp.282 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.283 = getelementptr %AVLTree, ptr %rcc.tmp.282, i32 0, i32 0
  %rcc.tmp.284 = load i32, ptr %root..tmp
  %rcc.tmp.285 = add i32 %rcc.tmp.284, 0
  %rcc.tmp.286 = getelementptr [2000 x %Node], ptr %rcc.tmp.283, i32 0, i32 %rcc.tmp.285
  %rcc.tmp.287 = getelementptr %Node, ptr %rcc.tmp.286, i32 0, i32 10
  %rcc.tmp.288 = load i32, ptr %new_right.2
  store i32 %rcc.tmp.288, ptr %rcc.tmp.287
  %rcc.tmp.290 = load i32, ptr %new_right.2
  %rcc.tmp.291 = sub i32 0, 1
  %rcc.tmp.292 = icmp ne i32 %rcc.tmp.290, %rcc.tmp.291
  br i1 %rcc.tmp.292, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.294 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.295 = getelementptr %AVLTree, ptr %rcc.tmp.294, i32 0, i32 0
  %rcc.tmp.296 = load i32, ptr %new_right.2
  %rcc.tmp.297 = add i32 %rcc.tmp.296, 0
  %rcc.tmp.298 = getelementptr [2000 x %Node], ptr %rcc.tmp.295, i32 0, i32 %rcc.tmp.297
  %rcc.tmp.299 = getelementptr %Node, ptr %rcc.tmp.298, i32 0, i32 11
  %rcc.tmp.300 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.300, ptr %rcc.tmp.299
  br label %if.merge.11
if.else.11:
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.304 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.305 = load i32, ptr %root..tmp
  %rcc.tmp.306 = call i32 @AVLTree.left_rotate.(%AVLTree* %rcc.tmp.304, i32 %rcc.tmp.305)
  ret i32 %rcc.tmp.306
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.309 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.309
}
define i32 @AVLTree.search.(%AVLTree* %self.tmp, i32 %root.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %root..tmp = alloca i32 
  %key..tmp = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.4 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %AVLTree, ptr %rcc.tmp.4, i32 0, i32 9
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.7, ptr %rcc.tmp.5
  %rcc.tmp.9 = load i32, ptr %root..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.13 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %AVLTree, ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %root..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [2000 x %Node], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = getelementptr %Node, ptr %rcc.tmp.17, i32 0, i32 1
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %key..tmp
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.19, %rcc.tmp.20
  br label %sc.merge
sc.merge:
  %rcc.tmp.23 = phi i1 [1, %entry], [%rcc.tmp.21, %or.rhs]
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  %rcc.tmp.25 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.25
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.28 = load i32, ptr %key..tmp
  %rcc.tmp.29 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.30 = getelementptr %AVLTree, ptr %rcc.tmp.29, i32 0, i32 0
  %rcc.tmp.31 = load i32, ptr %root..tmp
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [2000 x %Node], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = getelementptr %Node, ptr %rcc.tmp.33, i32 0, i32 1
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.39 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %AVLTree, ptr %rcc.tmp.39, i32 0, i32 0
  %rcc.tmp.41 = load i32, ptr %root..tmp
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [2000 x %Node], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = getelementptr %Node, ptr %rcc.tmp.43, i32 0, i32 9
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %key..tmp
  %rcc.tmp.47 = call i32 @AVLTree.search.(%AVLTree* %rcc.tmp.38, i32 %rcc.tmp.45, i32 %rcc.tmp.46)
  ret i32 %rcc.tmp.47
if.else.2:
  %rcc.tmp.49 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.50 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.51 = getelementptr %AVLTree, ptr %rcc.tmp.50, i32 0, i32 0
  %rcc.tmp.52 = load i32, ptr %root..tmp
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [2000 x %Node], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = getelementptr %Node, ptr %rcc.tmp.54, i32 0, i32 10
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %key..tmp
  %rcc.tmp.58 = call i32 @AVLTree.search.(%AVLTree* %rcc.tmp.49, i32 %rcc.tmp.56, i32 %rcc.tmp.57)
  ret i32 %rcc.tmp.58
if.merge.2:
  ret i32 undef
}
define i32 @AVLTree.find_min.(%AVLTree* %self.tmp, i32 %root.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %root..tmp = alloca i32 
  %current = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %root.tmp, ptr %root..tmp
  %rcc.tmp.3 = load i32, ptr %root..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = sub i32 0, 1
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.10, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %AVLTree, ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %current
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [2000 x %Node], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = getelementptr %Node, ptr %rcc.tmp.17, i32 0, i32 9
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = sub i32 0, 1
  %rcc.tmp.21 = icmp ne i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.25 = getelementptr %AVLTree, ptr %rcc.tmp.24, i32 0, i32 0
  %rcc.tmp.26 = load i32, ptr %current
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [2000 x %Node], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %Node, ptr %rcc.tmp.28, i32 0, i32 9
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.33 = load i32, ptr %current
  ret i32 %rcc.tmp.33
}
define i32 @AVLTree.delete_node.(%AVLTree* %self.tmp, i32 %root.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %root..tmp = alloca i32 
  %key..tmp = alloca i32 
  %new_left = alloca i32 
  %new_right = alloca i32 
  %temp = alloca i32 
  %temp.2 = alloca i32 
  %temp.3 = alloca i32 
  %new_right.2 = alloca i32 
  %balance = alloca i32 
  %new_left.2 = alloca i32 
  %new_right.3 = alloca i32 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.4 = load i32, ptr %root..tmp
  %rcc.tmp.5 = sub i32 0, 1
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %key..tmp
  %rcc.tmp.12 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %AVLTree, ptr %rcc.tmp.12, i32 0, i32 0
  %rcc.tmp.14 = load i32, ptr %root..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [2000 x %Node], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = getelementptr %Node, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.21 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.22 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %AVLTree, ptr %rcc.tmp.22, i32 0, i32 0
  %rcc.tmp.24 = load i32, ptr %root..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [2000 x %Node], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = getelementptr %Node, ptr %rcc.tmp.26, i32 0, i32 9
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %key..tmp
  %rcc.tmp.30 = call i32 @AVLTree.delete_node.(%AVLTree* %rcc.tmp.21, i32 %rcc.tmp.28, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %new_left
  %rcc.tmp.32 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %AVLTree, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %root..tmp
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [2000 x %Node], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = getelementptr %Node, ptr %rcc.tmp.36, i32 0, i32 9
  %rcc.tmp.38 = load i32, ptr %new_left
  store i32 %rcc.tmp.38, ptr %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %new_left
  %rcc.tmp.41 = sub i32 0, 1
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.44 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %AVLTree, ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.46 = load i32, ptr %new_left
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [2000 x %Node], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 11
  %rcc.tmp.50 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.55 = load i32, ptr %key..tmp
  %rcc.tmp.56 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %AVLTree, ptr %rcc.tmp.56, i32 0, i32 0
  %rcc.tmp.58 = load i32, ptr %root..tmp
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [2000 x %Node], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = getelementptr %Node, ptr %rcc.tmp.60, i32 0, i32 1
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = icmp sgt i32 %rcc.tmp.55, %rcc.tmp.62
  br i1 %rcc.tmp.63, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.65 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.66 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.67 = getelementptr %AVLTree, ptr %rcc.tmp.66, i32 0, i32 0
  %rcc.tmp.68 = load i32, ptr %root..tmp
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = getelementptr [2000 x %Node], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.71 = getelementptr %Node, ptr %rcc.tmp.70, i32 0, i32 10
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %key..tmp
  %rcc.tmp.74 = call i32 @AVLTree.delete_node.(%AVLTree* %rcc.tmp.65, i32 %rcc.tmp.72, i32 %rcc.tmp.73)
  store i32 %rcc.tmp.74, ptr %new_right
  %rcc.tmp.76 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %AVLTree, ptr %rcc.tmp.76, i32 0, i32 0
  %rcc.tmp.78 = load i32, ptr %root..tmp
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [2000 x %Node], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = getelementptr %Node, ptr %rcc.tmp.80, i32 0, i32 10
  %rcc.tmp.82 = load i32, ptr %new_right
  store i32 %rcc.tmp.82, ptr %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %new_right
  %rcc.tmp.85 = sub i32 0, 1
  %rcc.tmp.86 = icmp ne i32 %rcc.tmp.84, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.88 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.89 = getelementptr %AVLTree, ptr %rcc.tmp.88, i32 0, i32 0
  %rcc.tmp.90 = load i32, ptr %new_right
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [2000 x %Node], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = getelementptr %Node, ptr %rcc.tmp.92, i32 0, i32 11
  %rcc.tmp.94 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.94, ptr %rcc.tmp.93
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.99 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %AVLTree, ptr %rcc.tmp.99, i32 0, i32 0
  %rcc.tmp.101 = load i32, ptr %root..tmp
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [2000 x %Node], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = getelementptr %Node, ptr %rcc.tmp.103, i32 0, i32 5
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = icmp sgt i32 %rcc.tmp.105, 1
  br i1 %rcc.tmp.106, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.108 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.109 = getelementptr %AVLTree, ptr %rcc.tmp.108, i32 0, i32 0
  %rcc.tmp.110 = load i32, ptr %root..tmp
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [2000 x %Node], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = getelementptr %Node, ptr %rcc.tmp.112, i32 0, i32 5
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = sub i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %rcc.tmp.113
  %rcc.tmp.117 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.117
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.120 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.121 = getelementptr %AVLTree, ptr %rcc.tmp.120, i32 0, i32 0
  %rcc.tmp.122 = load i32, ptr %root..tmp
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [2000 x %Node], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = getelementptr %Node, ptr %rcc.tmp.124, i32 0, i32 9
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = sub i32 0, 1
  %rcc.tmp.128 = icmp eq i32 %rcc.tmp.126, %rcc.tmp.127
  br i1 %rcc.tmp.128, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.130 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.131 = getelementptr %AVLTree, ptr %rcc.tmp.130, i32 0, i32 0
  %rcc.tmp.132 = load i32, ptr %root..tmp
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = getelementptr [2000 x %Node], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.135 = getelementptr %Node, ptr %rcc.tmp.134, i32 0, i32 10
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  store i32 %rcc.tmp.136, ptr %temp
  %rcc.tmp.138 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.139 = load i32, ptr %root..tmp
  call void @AVLTree.deallocate_node.(%AVLTree* %rcc.tmp.138, i32 %rcc.tmp.139)
  %rcc.tmp.141 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.142 = getelementptr %AVLTree, ptr %rcc.tmp.141, i32 0, i32 7
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.142
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 1
  store i32 %rcc.tmp.144, ptr %rcc.tmp.142
  %rcc.tmp.146 = load i32, ptr %temp
  ret i32 %rcc.tmp.146
if.else.7:
  %rcc.tmp.148 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.149 = getelementptr %AVLTree, ptr %rcc.tmp.148, i32 0, i32 0
  %rcc.tmp.150 = load i32, ptr %root..tmp
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = getelementptr [2000 x %Node], ptr %rcc.tmp.149, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.153 = getelementptr %Node, ptr %rcc.tmp.152, i32 0, i32 10
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = sub i32 0, 1
  %rcc.tmp.156 = icmp eq i32 %rcc.tmp.154, %rcc.tmp.155
  br i1 %rcc.tmp.156, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.158 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.159 = getelementptr %AVLTree, ptr %rcc.tmp.158, i32 0, i32 0
  %rcc.tmp.160 = load i32, ptr %root..tmp
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = getelementptr [2000 x %Node], ptr %rcc.tmp.159, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.163 = getelementptr %Node, ptr %rcc.tmp.162, i32 0, i32 9
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.163
  store i32 %rcc.tmp.164, ptr %temp.2
  %rcc.tmp.166 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.167 = load i32, ptr %root..tmp
  call void @AVLTree.deallocate_node.(%AVLTree* %rcc.tmp.166, i32 %rcc.tmp.167)
  %rcc.tmp.169 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.170 = getelementptr %AVLTree, ptr %rcc.tmp.169, i32 0, i32 7
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.170
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 1
  store i32 %rcc.tmp.172, ptr %rcc.tmp.170
  %rcc.tmp.174 = load i32, ptr %temp.2
  ret i32 %rcc.tmp.174
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.178 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.179 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.180 = getelementptr %AVLTree, ptr %rcc.tmp.179, i32 0, i32 0
  %rcc.tmp.181 = load i32, ptr %root..tmp
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = getelementptr [2000 x %Node], ptr %rcc.tmp.180, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = getelementptr %Node, ptr %rcc.tmp.183, i32 0, i32 10
  %rcc.tmp.185 = load i32, ptr %rcc.tmp.184
  %rcc.tmp.186 = call i32 @AVLTree.find_min.(%AVLTree* %rcc.tmp.178, i32 %rcc.tmp.185)
  store i32 %rcc.tmp.186, ptr %temp.3
  %rcc.tmp.188 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.189 = getelementptr %AVLTree, ptr %rcc.tmp.188, i32 0, i32 0
  %rcc.tmp.190 = load i32, ptr %root..tmp
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = getelementptr [2000 x %Node], ptr %rcc.tmp.189, i32 0, i32 %rcc.tmp.191
  %rcc.tmp.193 = getelementptr %Node, ptr %rcc.tmp.192, i32 0, i32 1
  %rcc.tmp.194 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.195 = getelementptr %AVLTree, ptr %rcc.tmp.194, i32 0, i32 0
  %rcc.tmp.196 = load i32, ptr %temp.3
  %rcc.tmp.197 = add i32 %rcc.tmp.196, 0
  %rcc.tmp.198 = getelementptr [2000 x %Node], ptr %rcc.tmp.195, i32 0, i32 %rcc.tmp.197
  %rcc.tmp.199 = getelementptr %Node, ptr %rcc.tmp.198, i32 0, i32 1
  %rcc.tmp.200 = load i32, ptr %rcc.tmp.199
  store i32 %rcc.tmp.200, ptr %rcc.tmp.193
  %rcc.tmp.202 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.203 = getelementptr %AVLTree, ptr %rcc.tmp.202, i32 0, i32 0
  %rcc.tmp.204 = load i32, ptr %root..tmp
  %rcc.tmp.205 = add i32 %rcc.tmp.204, 0
  %rcc.tmp.206 = getelementptr [2000 x %Node], ptr %rcc.tmp.203, i32 0, i32 %rcc.tmp.205
  %rcc.tmp.207 = getelementptr %Node, ptr %rcc.tmp.206, i32 0, i32 0
  %rcc.tmp.208 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.209 = getelementptr %AVLTree, ptr %rcc.tmp.208, i32 0, i32 0
  %rcc.tmp.210 = load i32, ptr %temp.3
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 0
  %rcc.tmp.212 = getelementptr [2000 x %Node], ptr %rcc.tmp.209, i32 0, i32 %rcc.tmp.211
  %rcc.tmp.213 = getelementptr %Node, ptr %rcc.tmp.212, i32 0, i32 0
  %rcc.tmp.214 = load i32, ptr %rcc.tmp.213
  store i32 %rcc.tmp.214, ptr %rcc.tmp.207
  %rcc.tmp.216 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.217 = getelementptr %AVLTree, ptr %rcc.tmp.216, i32 0, i32 0
  %rcc.tmp.218 = load i32, ptr %root..tmp
  %rcc.tmp.219 = add i32 %rcc.tmp.218, 0
  %rcc.tmp.220 = getelementptr [2000 x %Node], ptr %rcc.tmp.217, i32 0, i32 %rcc.tmp.219
  %rcc.tmp.221 = getelementptr %Node, ptr %rcc.tmp.220, i32 0, i32 5
  %rcc.tmp.222 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.223 = getelementptr %AVLTree, ptr %rcc.tmp.222, i32 0, i32 0
  %rcc.tmp.224 = load i32, ptr %temp.3
  %rcc.tmp.225 = add i32 %rcc.tmp.224, 0
  %rcc.tmp.226 = getelementptr [2000 x %Node], ptr %rcc.tmp.223, i32 0, i32 %rcc.tmp.225
  %rcc.tmp.227 = getelementptr %Node, ptr %rcc.tmp.226, i32 0, i32 5
  %rcc.tmp.228 = load i32, ptr %rcc.tmp.227
  store i32 %rcc.tmp.228, ptr %rcc.tmp.221
  %rcc.tmp.230 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.231 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.232 = getelementptr %AVLTree, ptr %rcc.tmp.231, i32 0, i32 0
  %rcc.tmp.233 = load i32, ptr %root..tmp
  %rcc.tmp.234 = add i32 %rcc.tmp.233, 0
  %rcc.tmp.235 = getelementptr [2000 x %Node], ptr %rcc.tmp.232, i32 0, i32 %rcc.tmp.234
  %rcc.tmp.236 = getelementptr %Node, ptr %rcc.tmp.235, i32 0, i32 10
  %rcc.tmp.237 = load i32, ptr %rcc.tmp.236
  %rcc.tmp.238 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.239 = getelementptr %AVLTree, ptr %rcc.tmp.238, i32 0, i32 0
  %rcc.tmp.240 = load i32, ptr %temp.3
  %rcc.tmp.241 = add i32 %rcc.tmp.240, 0
  %rcc.tmp.242 = getelementptr [2000 x %Node], ptr %rcc.tmp.239, i32 0, i32 %rcc.tmp.241
  %rcc.tmp.243 = getelementptr %Node, ptr %rcc.tmp.242, i32 0, i32 1
  %rcc.tmp.244 = load i32, ptr %rcc.tmp.243
  %rcc.tmp.245 = call i32 @AVLTree.delete_node.(%AVLTree* %rcc.tmp.230, i32 %rcc.tmp.237, i32 %rcc.tmp.244)
  store i32 %rcc.tmp.245, ptr %new_right.2
  %rcc.tmp.247 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.248 = getelementptr %AVLTree, ptr %rcc.tmp.247, i32 0, i32 0
  %rcc.tmp.249 = load i32, ptr %root..tmp
  %rcc.tmp.250 = add i32 %rcc.tmp.249, 0
  %rcc.tmp.251 = getelementptr [2000 x %Node], ptr %rcc.tmp.248, i32 0, i32 %rcc.tmp.250
  %rcc.tmp.252 = getelementptr %Node, ptr %rcc.tmp.251, i32 0, i32 10
  %rcc.tmp.253 = load i32, ptr %new_right.2
  store i32 %rcc.tmp.253, ptr %rcc.tmp.252
  %rcc.tmp.255 = load i32, ptr %new_right.2
  %rcc.tmp.256 = sub i32 0, 1
  %rcc.tmp.257 = icmp ne i32 %rcc.tmp.255, %rcc.tmp.256
  br i1 %rcc.tmp.257, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.259 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.260 = getelementptr %AVLTree, ptr %rcc.tmp.259, i32 0, i32 0
  %rcc.tmp.261 = load i32, ptr %new_right.2
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 0
  %rcc.tmp.263 = getelementptr [2000 x %Node], ptr %rcc.tmp.260, i32 0, i32 %rcc.tmp.262
  %rcc.tmp.264 = getelementptr %Node, ptr %rcc.tmp.263, i32 0, i32 11
  %rcc.tmp.265 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.265, ptr %rcc.tmp.264
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.271 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.272 = load i32, ptr %root..tmp
  call void @AVLTree.update_height.(%AVLTree* %rcc.tmp.271, i32 %rcc.tmp.272)
  %rcc.tmp.274 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.275 = load i32, ptr %root..tmp
  %rcc.tmp.276 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.274, i32 %rcc.tmp.275)
  store i32 %rcc.tmp.276, ptr %balance
  %rcc.tmp.278 = load i32, ptr %balance
  %rcc.tmp.279 = icmp sgt i32 %rcc.tmp.278, 1
  br i1 %rcc.tmp.279, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.281 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.282 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.283 = getelementptr %AVLTree, ptr %rcc.tmp.282, i32 0, i32 0
  %rcc.tmp.284 = load i32, ptr %root..tmp
  %rcc.tmp.285 = add i32 %rcc.tmp.284, 0
  %rcc.tmp.286 = getelementptr [2000 x %Node], ptr %rcc.tmp.283, i32 0, i32 %rcc.tmp.285
  %rcc.tmp.287 = getelementptr %Node, ptr %rcc.tmp.286, i32 0, i32 9
  %rcc.tmp.288 = load i32, ptr %rcc.tmp.287
  %rcc.tmp.289 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.281, i32 %rcc.tmp.288)
  %rcc.tmp.290 = icmp sge i32 %rcc.tmp.289, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.292 = phi i1 [0, %if.merge.2], [%rcc.tmp.290, %and.rhs]
  br i1 %rcc.tmp.292, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.294 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.295 = load i32, ptr %root..tmp
  %rcc.tmp.296 = call i32 @AVLTree.right_rotate.(%AVLTree* %rcc.tmp.294, i32 %rcc.tmp.295)
  ret i32 %rcc.tmp.296
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.299 = load i32, ptr %balance
  %rcc.tmp.300 = icmp sgt i32 %rcc.tmp.299, 1
  br i1 %rcc.tmp.300, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.302 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.303 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.304 = getelementptr %AVLTree, ptr %rcc.tmp.303, i32 0, i32 0
  %rcc.tmp.305 = load i32, ptr %root..tmp
  %rcc.tmp.306 = add i32 %rcc.tmp.305, 0
  %rcc.tmp.307 = getelementptr [2000 x %Node], ptr %rcc.tmp.304, i32 0, i32 %rcc.tmp.306
  %rcc.tmp.308 = getelementptr %Node, ptr %rcc.tmp.307, i32 0, i32 9
  %rcc.tmp.309 = load i32, ptr %rcc.tmp.308
  %rcc.tmp.310 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.302, i32 %rcc.tmp.309)
  %rcc.tmp.311 = icmp slt i32 %rcc.tmp.310, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.313 = phi i1 [0, %if.merge.10], [%rcc.tmp.311, %and.rhs.2]
  br i1 %rcc.tmp.313, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.315 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.316 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.317 = getelementptr %AVLTree, ptr %rcc.tmp.316, i32 0, i32 0
  %rcc.tmp.318 = load i32, ptr %root..tmp
  %rcc.tmp.319 = add i32 %rcc.tmp.318, 0
  %rcc.tmp.320 = getelementptr [2000 x %Node], ptr %rcc.tmp.317, i32 0, i32 %rcc.tmp.319
  %rcc.tmp.321 = getelementptr %Node, ptr %rcc.tmp.320, i32 0, i32 9
  %rcc.tmp.322 = load i32, ptr %rcc.tmp.321
  %rcc.tmp.323 = call i32 @AVLTree.left_rotate.(%AVLTree* %rcc.tmp.315, i32 %rcc.tmp.322)
  store i32 %rcc.tmp.323, ptr %new_left.2
  %rcc.tmp.325 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.326 = getelementptr %AVLTree, ptr %rcc.tmp.325, i32 0, i32 0
  %rcc.tmp.327 = load i32, ptr %root..tmp
  %rcc.tmp.328 = add i32 %rcc.tmp.327, 0
  %rcc.tmp.329 = getelementptr [2000 x %Node], ptr %rcc.tmp.326, i32 0, i32 %rcc.tmp.328
  %rcc.tmp.330 = getelementptr %Node, ptr %rcc.tmp.329, i32 0, i32 9
  %rcc.tmp.331 = load i32, ptr %new_left.2
  store i32 %rcc.tmp.331, ptr %rcc.tmp.330
  %rcc.tmp.333 = load i32, ptr %new_left.2
  %rcc.tmp.334 = sub i32 0, 1
  %rcc.tmp.335 = icmp ne i32 %rcc.tmp.333, %rcc.tmp.334
  br i1 %rcc.tmp.335, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.337 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.338 = getelementptr %AVLTree, ptr %rcc.tmp.337, i32 0, i32 0
  %rcc.tmp.339 = load i32, ptr %new_left.2
  %rcc.tmp.340 = add i32 %rcc.tmp.339, 0
  %rcc.tmp.341 = getelementptr [2000 x %Node], ptr %rcc.tmp.338, i32 0, i32 %rcc.tmp.340
  %rcc.tmp.342 = getelementptr %Node, ptr %rcc.tmp.341, i32 0, i32 11
  %rcc.tmp.343 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.343, ptr %rcc.tmp.342
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.347 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.348 = load i32, ptr %root..tmp
  %rcc.tmp.349 = call i32 @AVLTree.right_rotate.(%AVLTree* %rcc.tmp.347, i32 %rcc.tmp.348)
  ret i32 %rcc.tmp.349
if.else.11:
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.352 = load i32, ptr %balance
  %rcc.tmp.353 = sub i32 0, 1
  %rcc.tmp.354 = icmp slt i32 %rcc.tmp.352, %rcc.tmp.353
  br i1 %rcc.tmp.354, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.356 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.357 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.358 = getelementptr %AVLTree, ptr %rcc.tmp.357, i32 0, i32 0
  %rcc.tmp.359 = load i32, ptr %root..tmp
  %rcc.tmp.360 = add i32 %rcc.tmp.359, 0
  %rcc.tmp.361 = getelementptr [2000 x %Node], ptr %rcc.tmp.358, i32 0, i32 %rcc.tmp.360
  %rcc.tmp.362 = getelementptr %Node, ptr %rcc.tmp.361, i32 0, i32 10
  %rcc.tmp.363 = load i32, ptr %rcc.tmp.362
  %rcc.tmp.364 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.356, i32 %rcc.tmp.363)
  %rcc.tmp.365 = icmp sle i32 %rcc.tmp.364, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.367 = phi i1 [0, %if.merge.11], [%rcc.tmp.365, %and.rhs.3]
  br i1 %rcc.tmp.367, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.369 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.370 = load i32, ptr %root..tmp
  %rcc.tmp.371 = call i32 @AVLTree.left_rotate.(%AVLTree* %rcc.tmp.369, i32 %rcc.tmp.370)
  ret i32 %rcc.tmp.371
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.374 = load i32, ptr %balance
  %rcc.tmp.375 = sub i32 0, 1
  %rcc.tmp.376 = icmp slt i32 %rcc.tmp.374, %rcc.tmp.375
  br i1 %rcc.tmp.376, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.378 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.379 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.380 = getelementptr %AVLTree, ptr %rcc.tmp.379, i32 0, i32 0
  %rcc.tmp.381 = load i32, ptr %root..tmp
  %rcc.tmp.382 = add i32 %rcc.tmp.381, 0
  %rcc.tmp.383 = getelementptr [2000 x %Node], ptr %rcc.tmp.380, i32 0, i32 %rcc.tmp.382
  %rcc.tmp.384 = getelementptr %Node, ptr %rcc.tmp.383, i32 0, i32 10
  %rcc.tmp.385 = load i32, ptr %rcc.tmp.384
  %rcc.tmp.386 = call i32 @AVLTree.get_balance.(%AVLTree* %rcc.tmp.378, i32 %rcc.tmp.385)
  %rcc.tmp.387 = icmp sgt i32 %rcc.tmp.386, 0
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.389 = phi i1 [0, %if.merge.13], [%rcc.tmp.387, %and.rhs.4]
  br i1 %rcc.tmp.389, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.391 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.392 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.393 = getelementptr %AVLTree, ptr %rcc.tmp.392, i32 0, i32 0
  %rcc.tmp.394 = load i32, ptr %root..tmp
  %rcc.tmp.395 = add i32 %rcc.tmp.394, 0
  %rcc.tmp.396 = getelementptr [2000 x %Node], ptr %rcc.tmp.393, i32 0, i32 %rcc.tmp.395
  %rcc.tmp.397 = getelementptr %Node, ptr %rcc.tmp.396, i32 0, i32 10
  %rcc.tmp.398 = load i32, ptr %rcc.tmp.397
  %rcc.tmp.399 = call i32 @AVLTree.right_rotate.(%AVLTree* %rcc.tmp.391, i32 %rcc.tmp.398)
  store i32 %rcc.tmp.399, ptr %new_right.3
  %rcc.tmp.401 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.402 = getelementptr %AVLTree, ptr %rcc.tmp.401, i32 0, i32 0
  %rcc.tmp.403 = load i32, ptr %root..tmp
  %rcc.tmp.404 = add i32 %rcc.tmp.403, 0
  %rcc.tmp.405 = getelementptr [2000 x %Node], ptr %rcc.tmp.402, i32 0, i32 %rcc.tmp.404
  %rcc.tmp.406 = getelementptr %Node, ptr %rcc.tmp.405, i32 0, i32 10
  %rcc.tmp.407 = load i32, ptr %new_right.3
  store i32 %rcc.tmp.407, ptr %rcc.tmp.406
  %rcc.tmp.409 = load i32, ptr %new_right.3
  %rcc.tmp.410 = sub i32 0, 1
  %rcc.tmp.411 = icmp ne i32 %rcc.tmp.409, %rcc.tmp.410
  br i1 %rcc.tmp.411, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.413 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.414 = getelementptr %AVLTree, ptr %rcc.tmp.413, i32 0, i32 0
  %rcc.tmp.415 = load i32, ptr %new_right.3
  %rcc.tmp.416 = add i32 %rcc.tmp.415, 0
  %rcc.tmp.417 = getelementptr [2000 x %Node], ptr %rcc.tmp.414, i32 0, i32 %rcc.tmp.416
  %rcc.tmp.418 = getelementptr %Node, ptr %rcc.tmp.417, i32 0, i32 11
  %rcc.tmp.419 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.419, ptr %rcc.tmp.418
  br label %if.merge.15
if.else.15:
  br label %if.merge.15
if.merge.15:
  %rcc.tmp.423 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.424 = load i32, ptr %root..tmp
  %rcc.tmp.425 = call i32 @AVLTree.left_rotate.(%AVLTree* %rcc.tmp.423, i32 %rcc.tmp.424)
  ret i32 %rcc.tmp.425
if.else.14:
  br label %if.merge.14
if.merge.14:
  %rcc.tmp.428 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.428
}
define void @AVLTree.inorder_traversal.(%AVLTree* %self.tmp, i32 %root.tmp, [1000 x i32]* %result.tmp, i32* %index.tmp) {
entry:
  %self..tmp = alloca %AVLTree* 
  %root..tmp = alloca i32 
  %result..tmp = alloca [1000 x i32]* 
  %index..tmp = alloca i32* 
  store %AVLTree* %self.tmp, ptr %self..tmp
  store i32 %root.tmp, ptr %root..tmp
  store [1000 x i32]* %result.tmp, ptr %result..tmp
  store i32* %index.tmp, ptr %index..tmp
  %rcc.tmp.5 = load i32, ptr %root..tmp
  %rcc.tmp.6 = sub i32 0, 1
  %rcc.tmp.7 = icmp ne i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.9 = load i32*, ptr %index..tmp
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.13 = phi i1 [0, %entry], [%rcc.tmp.11, %and.rhs]
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.16 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %AVLTree, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %root..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [2000 x %Node], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %Node, ptr %rcc.tmp.20, i32 0, i32 9
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load [1000 x i32]*, ptr %result..tmp
  %rcc.tmp.24 = load i32*, ptr %index..tmp
  call void @AVLTree.inorder_traversal.(%AVLTree* %rcc.tmp.15, i32 %rcc.tmp.22, [1000 x i32]* %rcc.tmp.23, i32* %rcc.tmp.24)
  %rcc.tmp.26 = load i32*, ptr %index..tmp
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1000 x i32]*, ptr %result..tmp
  %rcc.tmp.30 = getelementptr [1000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %AVLTree, ptr %rcc.tmp.31, i32 0, i32 0
  %rcc.tmp.33 = load i32, ptr %root..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [2000 x %Node], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = getelementptr %Node, ptr %rcc.tmp.35, i32 0, i32 0
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %rcc.tmp.30
  %rcc.tmp.39 = load i32*, ptr %index..tmp
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %rcc.tmp.39
  %rcc.tmp.43 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.44 = load %AVLTree*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %AVLTree, ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.46 = load i32, ptr %root..tmp
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [2000 x %Node], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 10
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = load [1000 x i32]*, ptr %result..tmp
  %rcc.tmp.52 = load i32*, ptr %index..tmp
  call void @AVLTree.inorder_traversal.(%AVLTree* %rcc.tmp.43, i32 %rcc.tmp.50, [1000 x i32]* %rcc.tmp.51, i32* %rcc.tmp.52)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @AVLTree.new.(%AVLTree* sret(%AVLTree) %ret.slot) {
entry:
  %tree = alloca %AVLTree 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr %AVLTree, ptr %tree, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2000 x %Node], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  call void @Node.new.(%Node* %rcc.tmp.8, i32 0, i32 0)
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %AVLTree, ptr %tree, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %AVLTree, ptr %tree, i32 0, i32 2
  %rcc.tmp.16 = sub i32 0, 1
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr %AVLTree, ptr %tree, i32 0, i32 3
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.21 = load i32, ptr %fill.idx.2
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 2000
  br i1 %rcc.tmp.22, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.24 = load i32, ptr %fill.idx.2
  %rcc.tmp.25 = getelementptr [2000 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.27, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.30 = getelementptr %AVLTree, ptr %tree, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %AVLTree, ptr %tree, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr %AVLTree, ptr %tree, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr %AVLTree, ptr %tree, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.36
  %rcc.tmp.38 = getelementptr %AVLTree, ptr %tree, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr %AVLTree, ptr %tree, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.40
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.44, 2000
  br i1 %rcc.tmp.45, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.48 = getelementptr %AVLTree, ptr %tree, i32 0, i32 3
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [2000 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %i
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.58 = getelementptr %AVLTree, ptr %tree, i32 0, i32 4
  store i32 2000, ptr %rcc.tmp.58
  %rcc.tmp.60 = bitcast %AVLTree* %ret.slot to i8*
  %rcc.tmp.61 = bitcast %AVLTree* %tree to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.60, i8* %rcc.tmp.61, i32 104032, i1 0)
  ret void
}
define i32 @HashTable.hash_function.(%HashTable* %self.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %hash_value = alloca i32 
  store %HashTable* %self.tmp, ptr %self..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %HashTable, ptr %rcc.tmp.3, i32 0, i32 7
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load i32, ptr %key..tmp
  %rcc.tmp.7 = mul i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %HashTable, ptr %rcc.tmp.8, i32 0, i32 8
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.7, %rcc.tmp.10
  %rcc.tmp.12 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %HashTable, ptr %rcc.tmp.12, i32 0, i32 9
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = srem i32 %rcc.tmp.11, %rcc.tmp.14
  %rcc.tmp.16 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %HashTable, ptr %rcc.tmp.16, i32 0, i32 3
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = srem i32 %rcc.tmp.15, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %hash_value
  %rcc.tmp.21 = load i32, ptr %hash_value
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 0
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  %rcc.tmp.24 = load i32, ptr %hash_value
  %rcc.tmp.25 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %HashTable, ptr %rcc.tmp.25, i32 0, i32 3
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.24, %rcc.tmp.27
  ret i32 %rcc.tmp.28
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %hash_value
  ret i32 %rcc.tmp.31
}
define void @HashTable.insert.(%HashTable* %self.tmp, i32 %key.tmp, i32 %value.tmp) {
entry:
  %self..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %value..tmp = alloca i32 
  %index = alloca i32 
  %i = alloca i32 
  store %HashTable* %self.tmp, ptr %self..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.4 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.5 = load i32, ptr %key..tmp
  %rcc.tmp.6 = call i32 @HashTable.hash_function.(%HashTable* %rcc.tmp.4, i32 %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %index
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %HashTable, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %index
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [1000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %HashTable, ptr %rcc.tmp.20, i32 0, i32 2
  %rcc.tmp.22 = load i32, ptr %index
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [20 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %key..tmp
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %HashTable, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %index
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [20 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.48 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %HashTable, ptr %rcc.tmp.48, i32 0, i32 1
  %rcc.tmp.50 = load i32, ptr %index
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [1000 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.53, 20
  br i1 %rcc.tmp.54, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.56 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %HashTable, ptr %rcc.tmp.56, i32 0, i32 2
  %rcc.tmp.58 = load i32, ptr %index
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.62 = getelementptr %HashTable, ptr %rcc.tmp.61, i32 0, i32 1
  %rcc.tmp.63 = load i32, ptr %index
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [1000 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [20 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.69, ptr %rcc.tmp.68
  %rcc.tmp.71 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.72 = getelementptr %HashTable, ptr %rcc.tmp.71, i32 0, i32 0
  %rcc.tmp.73 = load i32, ptr %index
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.76 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %HashTable, ptr %rcc.tmp.76, i32 0, i32 1
  %rcc.tmp.78 = load i32, ptr %index
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [1000 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [20 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.84, ptr %rcc.tmp.83
  %rcc.tmp.86 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.87 = getelementptr %HashTable, ptr %rcc.tmp.86, i32 0, i32 1
  %rcc.tmp.88 = load i32, ptr %index
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [1000 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %rcc.tmp.90
  %rcc.tmp.94 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %HashTable, ptr %rcc.tmp.94, i32 0, i32 4
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %rcc.tmp.95
  %rcc.tmp.99 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %HashTable, ptr %rcc.tmp.99, i32 0, i32 1
  %rcc.tmp.101 = load i32, ptr %index
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [1000 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = icmp sgt i32 %rcc.tmp.104, 1
  br i1 %rcc.tmp.105, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.107 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.108 = getelementptr %HashTable, ptr %rcc.tmp.107, i32 0, i32 5
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %rcc.tmp.108
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.114 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.115 = getelementptr %HashTable, ptr %rcc.tmp.114, i32 0, i32 4
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.118 = getelementptr %HashTable, ptr %rcc.tmp.117, i32 0, i32 3
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = mul i32 %rcc.tmp.119, 3
  %rcc.tmp.121 = sdiv i32 %rcc.tmp.120, 4
  %rcc.tmp.122 = icmp sgt i32 %rcc.tmp.116, %rcc.tmp.121
  br i1 %rcc.tmp.122, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.124 = load %HashTable*, ptr %self..tmp
  call void @HashTable.resize.(%HashTable* %rcc.tmp.124)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret void
}
define i32 @HashTable.search.(%HashTable* %self.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %index = alloca i32 
  %i = alloca i32 
  store %HashTable* %self.tmp, ptr %self..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.4 = load i32, ptr %key..tmp
  %rcc.tmp.5 = call i32 @HashTable.hash_function.(%HashTable* %rcc.tmp.3, i32 %rcc.tmp.4)
  store i32 %rcc.tmp.5, ptr %index
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %HashTable, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = load i32, ptr %index
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [1000 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %HashTable, ptr %rcc.tmp.19, i32 0, i32 2
  %rcc.tmp.21 = load i32, ptr %index
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [20 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %key..tmp
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %HashTable, ptr %rcc.tmp.31, i32 0, i32 0
  %rcc.tmp.33 = load i32, ptr %index
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [20 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  ret i32 %rcc.tmp.39
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.46 = sub i32 0, 1
  ret i32 %rcc.tmp.46
}
define i1 @HashTable.delete.(%HashTable* %self.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %HashTable* 
  %key..tmp = alloca i32 
  %index = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store %HashTable* %self.tmp, ptr %self..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.4 = load i32, ptr %key..tmp
  %rcc.tmp.5 = call i32 @HashTable.hash_function.(%HashTable* %rcc.tmp.3, i32 %rcc.tmp.4)
  store i32 %rcc.tmp.5, ptr %index
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %HashTable, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = load i32, ptr %index
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [1000 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %HashTable, ptr %rcc.tmp.19, i32 0, i32 2
  %rcc.tmp.21 = load i32, ptr %index
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [20 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %key..tmp
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %i
  store i32 %rcc.tmp.31, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %HashTable, ptr %rcc.tmp.35, i32 0, i32 1
  %rcc.tmp.37 = load i32, ptr %index
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [1000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = sub i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.45 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %HashTable, ptr %rcc.tmp.45, i32 0, i32 2
  %rcc.tmp.47 = load i32, ptr %index
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [20 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.54 = getelementptr %HashTable, ptr %rcc.tmp.53, i32 0, i32 2
  %rcc.tmp.55 = load i32, ptr %index
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %j
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = getelementptr [20 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %rcc.tmp.52
  %rcc.tmp.64 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.65 = getelementptr %HashTable, ptr %rcc.tmp.64, i32 0, i32 0
  %rcc.tmp.66 = load i32, ptr %index
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [20 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.73 = getelementptr %HashTable, ptr %rcc.tmp.72, i32 0, i32 0
  %rcc.tmp.74 = load i32, ptr %index
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [20 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %rcc.tmp.71
  %rcc.tmp.83 = load i32, ptr %j
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.87 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %HashTable, ptr %rcc.tmp.87, i32 0, i32 1
  %rcc.tmp.89 = load i32, ptr %index
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [1000 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = sub i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %rcc.tmp.91
  %rcc.tmp.95 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.96 = getelementptr %HashTable, ptr %rcc.tmp.95, i32 0, i32 4
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  %rcc.tmp.98 = sub i32 %rcc.tmp.97, 1
  store i32 %rcc.tmp.98, ptr %rcc.tmp.96
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %i
  br label %while.cond
while.end:
  ret i1 0
}
define void @HashTable.resize.(%HashTable* %self.tmp) {
entry:
  %self..tmp = alloca %HashTable* 
  %old_buckets = alloca [1000 x [20 x i32]] 
  %old_keys = alloca [1000 x [20 x i32]] 
  %old_bucket_sizes = alloca [1000 x i32] 
  %old_capacity = alloca i32 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store %HashTable* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %HashTable, ptr %rcc.tmp.2, i32 0, i32 3
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp sge i32 %rcc.tmp.4, 900
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %HashTable, ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = bitcast [1000 x [20 x i32]]* %old_buckets to i8*
  %rcc.tmp.12 = bitcast [1000 x [20 x i32]]* %rcc.tmp.10 to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.11, i8* %rcc.tmp.12, i32 80000, i1 0)
  %rcc.tmp.14 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %HashTable, ptr %rcc.tmp.14, i32 0, i32 2
  %rcc.tmp.16 = bitcast [1000 x [20 x i32]]* %old_keys to i8*
  %rcc.tmp.17 = bitcast [1000 x [20 x i32]]* %rcc.tmp.15 to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.16, i8* %rcc.tmp.17, i32 80000, i1 0)
  %rcc.tmp.19 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %HashTable, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = bitcast [1000 x i32]* %old_bucket_sizes to i8*
  %rcc.tmp.22 = bitcast [1000 x i32]* %rcc.tmp.20 to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.21, i8* %rcc.tmp.22, i32 4000, i1 0)
  %rcc.tmp.24 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.25 = getelementptr %HashTable, ptr %rcc.tmp.24, i32 0, i32 3
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %old_capacity
  %rcc.tmp.28 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %HashTable, ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %HashTable, ptr %rcc.tmp.30, i32 0, i32 3
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = mul i32 %rcc.tmp.32, 2
  store i32 %rcc.tmp.33, ptr %rcc.tmp.29
  %rcc.tmp.35 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %HashTable, ptr %rcc.tmp.35, i32 0, i32 3
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = icmp sgt i32 %rcc.tmp.37, 1000
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.41 = getelementptr %HashTable, ptr %rcc.tmp.40, i32 0, i32 3
  store i32 1000, ptr %rcc.tmp.41
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.45 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %HashTable, ptr %rcc.tmp.45, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.49 = load i32, ptr %fill.idx
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 1000
  br i1 %rcc.tmp.50, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.52 = load i32, ptr %fill.idx
  %rcc.tmp.53 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.56 = load i32, ptr %fill.idx.2
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.56, 20
  br i1 %rcc.tmp.57, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.59 = load i32, ptr %fill.idx.2
  %rcc.tmp.60 = getelementptr [20 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.59
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.62, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.65 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.65, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.68 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %HashTable, ptr %rcc.tmp.68, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.72 = load i32, ptr %fill.idx.3
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.72, 1000
  br i1 %rcc.tmp.73, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.75 = load i32, ptr %fill.idx.3
  %rcc.tmp.76 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.75
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.79 = load i32, ptr %fill.idx.4
  %rcc.tmp.80 = icmp slt i32 %rcc.tmp.79, 20
  br i1 %rcc.tmp.80, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.82 = load i32, ptr %fill.idx.4
  %rcc.tmp.83 = getelementptr [20 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.82
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.85, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.88 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.88, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.91 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.92 = getelementptr %HashTable, ptr %rcc.tmp.91, i32 0, i32 1
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.95 = load i32, ptr %fill.idx.5
  %rcc.tmp.96 = icmp slt i32 %rcc.tmp.95, 1000
  br i1 %rcc.tmp.96, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.98 = load i32, ptr %fill.idx.5
  %rcc.tmp.99 = getelementptr [1000 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.98
  store i32 0, ptr %rcc.tmp.99
  %rcc.tmp.101 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.101, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.104 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.105 = getelementptr %HashTable, ptr %rcc.tmp.104, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.108 = getelementptr %HashTable, ptr %rcc.tmp.107, i32 0, i32 6
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %rcc.tmp.108
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = load i32, ptr %old_capacity
  %rcc.tmp.116 = icmp slt i32 %rcc.tmp.114, %rcc.tmp.115
  br i1 %rcc.tmp.116, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.121 = load i32, ptr %j
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [1000 x i32], ptr %old_bucket_sizes, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.124
  %rcc.tmp.126 = icmp slt i32 %rcc.tmp.121, %rcc.tmp.125
  br i1 %rcc.tmp.126, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.129 = load %HashTable*, ptr %self..tmp
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = getelementptr [1000 x [20 x i32]], ptr %old_keys, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %j
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [20 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %i
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [1000 x [20 x i32]], ptr %old_buckets, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %j
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 0
  %rcc.tmp.142 = getelementptr [20 x i32], ptr %rcc.tmp.139, i32 0, i32 %rcc.tmp.141
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.142
  call void @HashTable.insert.(%HashTable* %rcc.tmp.129, i32 %rcc.tmp.136, i32 %rcc.tmp.143)
  %rcc.tmp.145 = load i32, ptr %j
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @HashTable.new.(%HashTable* sret(%HashTable) %ret.slot, i32 %initial_capacity.tmp) {
entry:
  %initial_capacity..tmp = alloca i32 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  store i32 %initial_capacity.tmp, ptr %initial_capacity..tmp
  %rcc.tmp.2 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 1000
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.2, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.12 = load i32, ptr %fill.idx.2
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 20
  br i1 %rcc.tmp.13, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = getelementptr [20 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.15
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.18, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.21 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.21, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.24 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 1000
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [1000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.36 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.39 = load i32, ptr %fill.idx.4
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 1000
  br i1 %rcc.tmp.40, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.42 = load i32, ptr %fill.idx.4
  %rcc.tmp.43 = getelementptr [1000 x [20 x i32]], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.42
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.46 = load i32, ptr %fill.idx.5
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.46, 20
  br i1 %rcc.tmp.47, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.49 = load i32, ptr %fill.idx.5
  %rcc.tmp.50 = getelementptr [20 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.49
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.52, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.55 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.55, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.58 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.59 = load i32, ptr %initial_capacity..tmp
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 7
  store i32 31, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 8
  store i32 17, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr %HashTable, ptr %ret.slot, i32 0, i32 9
  store i32 1000003, ptr %rcc.tmp.71
  ret void
}
define i32 @LRUCache.get.(%LRUCache* %self.tmp, i32 %key.tmp) {
entry:
  %self..tmp = alloca %LRUCache* 
  %key..tmp = alloca i32 
  %index = alloca i32 
  store %LRUCache* %self.tmp, ptr %self..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %LRUCache, ptr %rcc.tmp.3, i32 0, i32 6
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 1
  store i32 %rcc.tmp.6, ptr %rcc.tmp.4
  %rcc.tmp.8 = load i32, ptr %key..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.11 = load i32, ptr %key..tmp
  %rcc.tmp.12 = icmp sge i32 %rcc.tmp.11, 10000
  br label %sc.merge
sc.merge:
  %rcc.tmp.14 = phi i1 [1, %entry], [%rcc.tmp.12, %or.rhs]
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %LRUCache, ptr %rcc.tmp.16, i32 0, i32 8
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %rcc.tmp.17
  %rcc.tmp.21 = sub i32 0, 1
  ret i32 %rcc.tmp.21
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.24 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.25 = getelementptr %LRUCache, ptr %rcc.tmp.24, i32 0, i32 3
  %rcc.tmp.26 = load i32, ptr %key..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [10000 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %index
  %rcc.tmp.31 = load i32, ptr %index
  %rcc.tmp.32 = sub i32 0, 1
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.31, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.35 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %LRUCache, ptr %rcc.tmp.35, i32 0, i32 8
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %rcc.tmp.36
  %rcc.tmp.40 = sub i32 0, 1
  ret i32 %rcc.tmp.40
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.43 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.44 = load i32, ptr %index
  call void @LRUCache.update_usage_order.(%LRUCache* %rcc.tmp.43, i32 %rcc.tmp.44)
  %rcc.tmp.46 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %LRUCache, ptr %rcc.tmp.46, i32 0, i32 7
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %rcc.tmp.47
  %rcc.tmp.51 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.52 = getelementptr %LRUCache, ptr %rcc.tmp.51, i32 0, i32 0
  %rcc.tmp.53 = load i32, ptr %index
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [500 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  ret i32 %rcc.tmp.56
}
define void @LRUCache.put.(%LRUCache* %self.tmp, i32 %key.tmp, i32 %value.tmp) {
entry:
  %self..tmp = alloca %LRUCache* 
  %key..tmp = alloca i32 
  %value..tmp = alloca i32 
  %existing_index = alloca i32 
  %new_index = alloca i32 
  %lru_index = alloca i32 
  %min_usage = alloca i32 
  %i = alloca i32 
  %old_key = alloca i32 
  store %LRUCache* %self.tmp, ptr %self..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.4 = load i32, ptr %key..tmp
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = load i32, ptr %key..tmp
  %rcc.tmp.8 = icmp sge i32 %rcc.tmp.7, 10000
  br label %sc.merge
sc.merge:
  %rcc.tmp.10 = phi i1 [1, %entry], [%rcc.tmp.8, %or.rhs]
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %LRUCache, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %key..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [10000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %existing_index
  %rcc.tmp.21 = load i32, ptr %existing_index
  %rcc.tmp.22 = sub i32 0, 1
  %rcc.tmp.23 = icmp ne i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.25 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %LRUCache, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %existing_index
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [500 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.33 = load i32, ptr %existing_index
  call void @LRUCache.update_usage_order.(%LRUCache* %rcc.tmp.32, i32 %rcc.tmp.33)
  ret void
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.37 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %LRUCache, ptr %rcc.tmp.37, i32 0, i32 5
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.41 = getelementptr %LRUCache, ptr %rcc.tmp.40, i32 0, i32 4
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.39, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.45 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %LRUCache, ptr %rcc.tmp.45, i32 0, i32 5
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %new_index
  %rcc.tmp.49 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.50 = getelementptr %LRUCache, ptr %rcc.tmp.49, i32 0, i32 1
  %rcc.tmp.51 = load i32, ptr %new_index
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [500 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.54, ptr %rcc.tmp.53
  %rcc.tmp.56 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %LRUCache, ptr %rcc.tmp.56, i32 0, i32 0
  %rcc.tmp.58 = load i32, ptr %new_index
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [500 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.61, ptr %rcc.tmp.60
  %rcc.tmp.63 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %LRUCache, ptr %rcc.tmp.63, i32 0, i32 3
  %rcc.tmp.65 = load i32, ptr %key..tmp
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [10000 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %new_index
  store i32 %rcc.tmp.68, ptr %rcc.tmp.67
  %rcc.tmp.70 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.71 = getelementptr %LRUCache, ptr %rcc.tmp.70, i32 0, i32 2
  %rcc.tmp.72 = load i32, ptr %new_index
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [500 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.76 = getelementptr %LRUCache, ptr %rcc.tmp.75, i32 0, i32 6
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %rcc.tmp.74
  %rcc.tmp.79 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.80 = getelementptr %LRUCache, ptr %rcc.tmp.79, i32 0, i32 5
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %rcc.tmp.80
  br label %if.merge.3
if.else.3:
  store i32 0, ptr %lru_index
  %rcc.tmp.86 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.87 = getelementptr %LRUCache, ptr %rcc.tmp.86, i32 0, i32 2
  %rcc.tmp.88 = getelementptr [500 x i32], ptr %rcc.tmp.87, i32 0, i32 0
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  store i32 %rcc.tmp.89, ptr %min_usage
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %LRUCache, ptr %rcc.tmp.94, i32 0, i32 4
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = icmp slt i32 %rcc.tmp.93, %rcc.tmp.96
  br i1 %rcc.tmp.97, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.100 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.101 = getelementptr %LRUCache, ptr %rcc.tmp.100, i32 0, i32 2
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = getelementptr [500 x i32], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %min_usage
  %rcc.tmp.107 = icmp slt i32 %rcc.tmp.105, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.109 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.110 = getelementptr %LRUCache, ptr %rcc.tmp.109, i32 0, i32 2
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [500 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.114, ptr %min_usage
  %rcc.tmp.116 = load i32, ptr %i
  store i32 %rcc.tmp.116, ptr %lru_index
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  store i32 %rcc.tmp.121, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.124 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.125 = getelementptr %LRUCache, ptr %rcc.tmp.124, i32 0, i32 1
  %rcc.tmp.126 = load i32, ptr %lru_index
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 0
  %rcc.tmp.128 = getelementptr [500 x i32], ptr %rcc.tmp.125, i32 0, i32 %rcc.tmp.127
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.128
  store i32 %rcc.tmp.129, ptr %old_key
  %rcc.tmp.131 = load i32, ptr %old_key
  %rcc.tmp.132 = icmp sge i32 %rcc.tmp.131, 0
  br i1 %rcc.tmp.132, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.134 = load i32, ptr %old_key
  %rcc.tmp.135 = icmp slt i32 %rcc.tmp.134, 10000
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.137 = phi i1 [0, %while.end], [%rcc.tmp.135, %and.rhs]
  br i1 %rcc.tmp.137, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.139 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.140 = getelementptr %LRUCache, ptr %rcc.tmp.139, i32 0, i32 3
  %rcc.tmp.141 = load i32, ptr %old_key
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [10000 x i32], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = sub i32 0, 1
  store i32 %rcc.tmp.144, ptr %rcc.tmp.143
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.148 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.149 = getelementptr %LRUCache, ptr %rcc.tmp.148, i32 0, i32 1
  %rcc.tmp.150 = load i32, ptr %lru_index
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = getelementptr [500 x i32], ptr %rcc.tmp.149, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.153, ptr %rcc.tmp.152
  %rcc.tmp.155 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.156 = getelementptr %LRUCache, ptr %rcc.tmp.155, i32 0, i32 0
  %rcc.tmp.157 = load i32, ptr %lru_index
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [500 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.160, ptr %rcc.tmp.159
  %rcc.tmp.162 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.163 = getelementptr %LRUCache, ptr %rcc.tmp.162, i32 0, i32 3
  %rcc.tmp.164 = load i32, ptr %key..tmp
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 0
  %rcc.tmp.166 = getelementptr [10000 x i32], ptr %rcc.tmp.163, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.167 = load i32, ptr %lru_index
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.170 = getelementptr %LRUCache, ptr %rcc.tmp.169, i32 0, i32 2
  %rcc.tmp.171 = load i32, ptr %lru_index
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 0
  %rcc.tmp.173 = getelementptr [500 x i32], ptr %rcc.tmp.170, i32 0, i32 %rcc.tmp.172
  %rcc.tmp.174 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.175 = getelementptr %LRUCache, ptr %rcc.tmp.174, i32 0, i32 6
  %rcc.tmp.176 = load i32, ptr %rcc.tmp.175
  store i32 %rcc.tmp.176, ptr %rcc.tmp.173
  br label %if.merge.3
if.merge.3:
  ret void
}
define void @LRUCache.update_usage_order.(%LRUCache* %self.tmp, i32 %index.tmp) {
entry:
  %self..tmp = alloca %LRUCache* 
  %index..tmp = alloca i32 
  store %LRUCache* %self.tmp, ptr %self..tmp
  store i32 %index.tmp, ptr %index..tmp
  %rcc.tmp.3 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %LRUCache, ptr %rcc.tmp.3, i32 0, i32 2
  %rcc.tmp.5 = load i32, ptr %index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [500 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %LRUCache, ptr %rcc.tmp.8, i32 0, i32 6
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %rcc.tmp.7
  ret void
}
define void @LRUCache.get_cache_statistics.([5 x i32]* sret([5 x i32]) %ret.slot, %LRUCache* %self.tmp) {
entry:
  %self..tmp = alloca %LRUCache* 
  %hit_rate = alloca i32 
  store %LRUCache* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %LRUCache, ptr %rcc.tmp.2, i32 0, i32 6
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp sgt i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %LRUCache, ptr %rcc.tmp.7, i32 0, i32 7
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = mul i32 %rcc.tmp.9, 100
  %rcc.tmp.11 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %LRUCache, ptr %rcc.tmp.11, i32 0, i32 6
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = sdiv i32 %rcc.tmp.10, %rcc.tmp.13
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.17 = phi i32 [%rcc.tmp.14, %if.then], [0, %if.else]
  store i32 %rcc.tmp.17, ptr %hit_rate
  %rcc.tmp.19 = getelementptr [5 x i32], ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.20 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %LRUCache, ptr %rcc.tmp.20, i32 0, i32 7
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %rcc.tmp.19
  %rcc.tmp.24 = getelementptr [5 x i32], ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.25 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %LRUCache, ptr %rcc.tmp.25, i32 0, i32 8
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %rcc.tmp.24
  %rcc.tmp.29 = getelementptr [5 x i32], ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.30 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %LRUCache, ptr %rcc.tmp.30, i32 0, i32 6
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %rcc.tmp.29
  %rcc.tmp.34 = getelementptr [5 x i32], ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %hit_rate
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [5 x i32], ptr %ret.slot, i32 0, i32 4
  %rcc.tmp.38 = load %LRUCache*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %LRUCache, ptr %rcc.tmp.38, i32 0, i32 5
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %rcc.tmp.37
  ret void
}
define void @LRUCache.new.(%LRUCache* sret(%LRUCache) %ret.slot, i32 %capacity.tmp) {
entry:
  %capacity..tmp = alloca i32 
  %cache = alloca %LRUCache 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %i = alloca i32 
  store i32 %capacity.tmp, ptr %capacity..tmp
  %rcc.tmp.2 = getelementptr %LRUCache, ptr %cache, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 500
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [500 x i32], ptr %rcc.tmp.2, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.14 = getelementptr %LRUCache, ptr %cache, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 500
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [500 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.20
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.26 = getelementptr %LRUCache, ptr %cache, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 500
  br i1 %rcc.tmp.30, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.32 = load i32, ptr %fill.idx.3
  %rcc.tmp.33 = getelementptr [500 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.32
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.35, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.38 = getelementptr %LRUCache, ptr %cache, i32 0, i32 3
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.41 = load i32, ptr %fill.idx.4
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 10000
  br i1 %rcc.tmp.42, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.44 = load i32, ptr %fill.idx.4
  %rcc.tmp.45 = getelementptr [10000 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = sub i32 0, 1
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.48, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.51 = getelementptr %LRUCache, ptr %cache, i32 0, i32 4
  %rcc.tmp.52 = load i32, ptr %capacity..tmp
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  %rcc.tmp.54 = getelementptr %LRUCache, ptr %cache, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr %LRUCache, ptr %cache, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr %LRUCache, ptr %cache, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr %LRUCache, ptr %cache, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.60
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 10000
  br i1 %rcc.tmp.65, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.68 = getelementptr %LRUCache, ptr %cache, i32 0, i32 3
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [10000 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = sub i32 0, 1
  store i32 %rcc.tmp.72, ptr %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.78 = bitcast %LRUCache* %ret.slot to i8*
  %rcc.tmp.79 = bitcast %LRUCache* %cache to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.78, i8* %rcc.tmp.79, i32 46020, i1 0)
  ret void
}
define i32 @MemoryManager.allocate.(%MemoryManager* %self.tmp, i32 %size.tmp) {
entry:
  %self..tmp = alloca %MemoryManager* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %remaining_size = alloca i32 
  %j = alloca i32 
  store %MemoryManager* %self.tmp, ptr %self..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %MemoryManager, ptr %rcc.tmp.7, i32 0, i32 5
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp sgt i32 %rcc.tmp.6, %rcc.tmp.9
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = sub i32 0, 1
  ret i32 %rcc.tmp.14
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 10000
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %MemoryManager, ptr %rcc.tmp.23, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [10000 x i1], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i1, ptr %rcc.tmp.27
  %rcc.tmp.29 = xor i1 %rcc.tmp.28, true
  br i1 %rcc.tmp.29, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.31 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %MemoryManager, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [10000 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %size..tmp
  %rcc.tmp.38 = icmp sge i32 %rcc.tmp.36, %rcc.tmp.37
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.40 = phi i1 [0, %while.body], [%rcc.tmp.38, %and.rhs]
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.43 = getelementptr %MemoryManager, ptr %rcc.tmp.42, i32 0, i32 1
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [10000 x i1], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.45
  store i1 1, ptr %rcc.tmp.46
  %rcc.tmp.48 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %MemoryManager, ptr %rcc.tmp.48, i32 0, i32 0
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [10000 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %i
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %MemoryManager, ptr %rcc.tmp.55, i32 0, i32 2
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [10000 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %size..tmp
  %rcc.tmp.62 = icmp sgt i32 %rcc.tmp.60, %rcc.tmp.61
  br i1 %rcc.tmp.62, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.64 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.65 = getelementptr %MemoryManager, ptr %rcc.tmp.64, i32 0, i32 2
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [10000 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %size..tmp
  %rcc.tmp.71 = sub i32 %rcc.tmp.69, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %remaining_size
  %rcc.tmp.73 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.74 = getelementptr %MemoryManager, ptr %rcc.tmp.73, i32 0, i32 2
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [10000 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.78, ptr %rcc.tmp.77
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.82 = load i32, ptr %j
  %rcc.tmp.83 = icmp slt i32 %rcc.tmp.82, 10000
  br i1 %rcc.tmp.83, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.86 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.87 = getelementptr %MemoryManager, ptr %rcc.tmp.86, i32 0, i32 2
  %rcc.tmp.88 = load i32, ptr %j
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [10000 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = icmp eq i32 %rcc.tmp.91, 0
  br i1 %rcc.tmp.92, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.94 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %MemoryManager, ptr %rcc.tmp.94, i32 0, i32 2
  %rcc.tmp.96 = load i32, ptr %j
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [10000 x i32], ptr %rcc.tmp.95, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %remaining_size
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  br label %while.linker.2
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.103 = load i32, ptr %j
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.104, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.109 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.110 = getelementptr %MemoryManager, ptr %rcc.tmp.109, i32 0, i32 4
  %rcc.tmp.111 = load i32, ptr %size..tmp
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.113 = add i32 %rcc.tmp.112, %rcc.tmp.111
  store i32 %rcc.tmp.113, ptr %rcc.tmp.110
  %rcc.tmp.115 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.116 = getelementptr %MemoryManager, ptr %rcc.tmp.115, i32 0, i32 5
  %rcc.tmp.117 = load i32, ptr %size..tmp
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.119 = sub i32 %rcc.tmp.118, %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.116
  %rcc.tmp.121 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.122 = getelementptr %MemoryManager, ptr %rcc.tmp.121, i32 0, i32 6
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.124, ptr %rcc.tmp.122
  %rcc.tmp.126 = load %MemoryManager*, ptr %self..tmp
  call void @MemoryManager.calculate_fragmentation.(%MemoryManager* %rcc.tmp.126)
  %rcc.tmp.128 = load i32, ptr %i
  ret i32 %rcc.tmp.128
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  store i32 %rcc.tmp.132, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.135 = sub i32 0, 1
  ret i32 %rcc.tmp.135
}
define i1 @MemoryManager.deallocate.(%MemoryManager* %self.tmp, i32 %block_id.tmp) {
entry:
  %self..tmp = alloca %MemoryManager* 
  %block_id..tmp = alloca i32 
  %size = alloca i32 
  store %MemoryManager* %self.tmp, ptr %self..tmp
  store i32 %block_id.tmp, ptr %block_id..tmp
  %rcc.tmp.3 = load i32, ptr %block_id..tmp
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.6 = load i32, ptr %block_id..tmp
  %rcc.tmp.7 = icmp sge i32 %rcc.tmp.6, 10000
  br label %sc.merge
sc.merge:
  %rcc.tmp.9 = phi i1 [1, %entry], [%rcc.tmp.7, %or.rhs]
  br i1 %rcc.tmp.9, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.11 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %MemoryManager, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %block_id..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [10000 x i1], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i1, ptr %rcc.tmp.15
  %rcc.tmp.17 = xor i1 %rcc.tmp.16, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.19 = phi i1 [1, %sc.merge], [%rcc.tmp.17, %or.rhs.2]
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.23 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %MemoryManager, ptr %rcc.tmp.23, i32 0, i32 2
  %rcc.tmp.25 = load i32, ptr %block_id..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [10000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %size
  %rcc.tmp.30 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %MemoryManager, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %block_id..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [10000 x i1], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.33
  store i1 0, ptr %rcc.tmp.34
  %rcc.tmp.36 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.37 = getelementptr %MemoryManager, ptr %rcc.tmp.36, i32 0, i32 4
  %rcc.tmp.38 = load i32, ptr %size
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.40 = sub i32 %rcc.tmp.39, %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.37
  %rcc.tmp.42 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.43 = getelementptr %MemoryManager, ptr %rcc.tmp.42, i32 0, i32 5
  %rcc.tmp.44 = load i32, ptr %size
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.46 = add i32 %rcc.tmp.45, %rcc.tmp.44
  store i32 %rcc.tmp.46, ptr %rcc.tmp.43
  %rcc.tmp.48 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %MemoryManager, ptr %rcc.tmp.48, i32 0, i32 7
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %rcc.tmp.49
  %rcc.tmp.53 = load %MemoryManager*, ptr %self..tmp
  call void @MemoryManager.coalesce_free_blocks.(%MemoryManager* %rcc.tmp.53)
  %rcc.tmp.55 = load %MemoryManager*, ptr %self..tmp
  call void @MemoryManager.calculate_fragmentation.(%MemoryManager* %rcc.tmp.55)
  ret i1 1
}
define void @MemoryManager.coalesce_free_blocks.(%MemoryManager* %self.tmp) {
entry:
  %self..tmp = alloca %MemoryManager* 
  %i = alloca i32 
  store %MemoryManager* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 9999
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %MemoryManager, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [10000 x i1], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = load i1, ptr %rcc.tmp.12
  %rcc.tmp.14 = xor i1 %rcc.tmp.13, true
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %MemoryManager, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [10000 x i1], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i1, ptr %rcc.tmp.21
  %rcc.tmp.23 = xor i1 %rcc.tmp.22, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.25 = phi i1 [0, %while.body], [%rcc.tmp.23, %and.rhs]
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %MemoryManager, ptr %rcc.tmp.27, i32 0, i32 2
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [10000 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %MemoryManager, ptr %rcc.tmp.32, i32 0, i32 2
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [10000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.40 = add i32 %rcc.tmp.39, %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %rcc.tmp.31
  %rcc.tmp.42 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.43 = getelementptr %MemoryManager, ptr %rcc.tmp.42, i32 0, i32 2
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [10000 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.46
  store i32 0, ptr %rcc.tmp.47
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @MemoryManager.calculate_fragmentation.(%MemoryManager* %self.tmp) {
entry:
  %self..tmp = alloca %MemoryManager* 
  %free_block_count = alloca i32 
  %largest_free_block = alloca i32 
  %i = alloca i32 
  store %MemoryManager* %self.tmp, ptr %self..tmp
  store i32 0, ptr %free_block_count
  store i32 0, ptr %largest_free_block
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 10000
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %MemoryManager, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [10000 x i1], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i1, ptr %rcc.tmp.14
  %rcc.tmp.16 = xor i1 %rcc.tmp.15, true
  br i1 %rcc.tmp.16, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.18 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %MemoryManager, ptr %rcc.tmp.18, i32 0, i32 2
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [10000 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = icmp sgt i32 %rcc.tmp.23, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [0, %while.body], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %free_block_count
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %free_block_count
  %rcc.tmp.31 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %MemoryManager, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [10000 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %largest_free_block
  %rcc.tmp.38 = icmp sgt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.40 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.41 = getelementptr %MemoryManager, ptr %rcc.tmp.40, i32 0, i32 2
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [10000 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %largest_free_block
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
  %rcc.tmp.55 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %MemoryManager, ptr %rcc.tmp.55, i32 0, i32 5
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = icmp sgt i32 %rcc.tmp.57, 0
  br i1 %rcc.tmp.58, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.60 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.61 = getelementptr %MemoryManager, ptr %rcc.tmp.60, i32 0, i32 8
  %rcc.tmp.62 = load i32, ptr %largest_free_block
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 100
  %rcc.tmp.64 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.65 = getelementptr %MemoryManager, ptr %rcc.tmp.64, i32 0, i32 5
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = sdiv i32 %rcc.tmp.63, %rcc.tmp.66
  %rcc.tmp.68 = sub i32 100, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %rcc.tmp.61
  br label %if.merge.3
if.else.3:
  %rcc.tmp.71 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.72 = getelementptr %MemoryManager, ptr %rcc.tmp.71, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.72
  br label %if.merge.3
if.merge.3:
  ret void
}
define void @MemoryManager.get_memory_statistics.([6 x i32]* sret([6 x i32]) %ret.slot, %MemoryManager* %self.tmp) {
entry:
  %self..tmp = alloca %MemoryManager* 
  store %MemoryManager* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = getelementptr [6 x i32], ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.3 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %MemoryManager, ptr %rcc.tmp.3, i32 0, i32 4
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %rcc.tmp.2
  %rcc.tmp.7 = getelementptr [6 x i32], ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.8 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %MemoryManager, ptr %rcc.tmp.8, i32 0, i32 5
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %rcc.tmp.7
  %rcc.tmp.12 = getelementptr [6 x i32], ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.13 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %MemoryManager, ptr %rcc.tmp.13, i32 0, i32 6
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %rcc.tmp.12
  %rcc.tmp.17 = getelementptr [6 x i32], ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.18 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %MemoryManager, ptr %rcc.tmp.18, i32 0, i32 7
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %rcc.tmp.17
  %rcc.tmp.22 = getelementptr [6 x i32], ptr %ret.slot, i32 0, i32 4
  %rcc.tmp.23 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %MemoryManager, ptr %rcc.tmp.23, i32 0, i32 8
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %rcc.tmp.22
  %rcc.tmp.27 = getelementptr [6 x i32], ptr %ret.slot, i32 0, i32 5
  %rcc.tmp.28 = load %MemoryManager*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %MemoryManager, ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %rcc.tmp.27
  ret void
}
define void @MemoryManager.new.(%MemoryManager* sret(%MemoryManager) %ret.slot, i32 %total_size.tmp) {
entry:
  %total_size..tmp = alloca i32 
  %manager = alloca %MemoryManager 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  store i32 %total_size.tmp, ptr %total_size..tmp
  %rcc.tmp.2 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 10000
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [10000 x i32], ptr %rcc.tmp.2, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.14 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 10000
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [10000 x i1], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.20
  store i1 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.26 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 10000
  br i1 %rcc.tmp.30, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.32 = load i32, ptr %fill.idx.3
  %rcc.tmp.33 = getelementptr [10000 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.32
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.35, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.38 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 3
  %rcc.tmp.39 = load i32, ptr %total_size..tmp
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 5
  %rcc.tmp.44 = load i32, ptr %total_size..tmp
  store i32 %rcc.tmp.44, ptr %rcc.tmp.43
  %rcc.tmp.46 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr %MemoryManager, ptr %manager, i32 0, i32 2
  %rcc.tmp.53 = getelementptr [10000 x i32], ptr %rcc.tmp.52, i32 0, i32 0
  %rcc.tmp.54 = load i32, ptr %total_size..tmp
  store i32 %rcc.tmp.54, ptr %rcc.tmp.53
  %rcc.tmp.56 = bitcast %MemoryManager* %ret.slot to i8*
  %rcc.tmp.57 = bitcast %MemoryManager* %manager to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.56, i8* %rcc.tmp.57, i32 90024, i1 0)
  ret void
}
define void @main() {
entry:
  %avl_tree = alloca %AVLTree 
  %tree_operations = alloca i32 
  %i = alloca i32 
  %operation = alloca i32 
  %key = alloca i32 
  %value = alloca i32 
  %result = alloca i32 
  %hash_capacity = alloca i32 
  %hash_table = alloca %HashTable 
  %hash_operations = alloca i32 
  %operation.2 = alloca i32 
  %key.2 = alloca i32 
  %value.2 = alloca i32 
  %result.2 = alloca i32 
  %deleted = alloca i1 
  %cache_capacity = alloca i32 
  %lru_cache = alloca %LRUCache 
  %cache_operations = alloca i32 
  %operation.3 = alloca i32 
  %key.3 = alloca i32 
  %value.3 = alloca i32 
  %result.3 = alloca i32 
  %memory_size = alloca i32 
  %memory_manager = alloca %MemoryManager 
  %memory_operations = alloca i32 
  %operation.4 = alloca i32 
  %size = alloca i32 
  %block_id = alloca i32 
  %block_id.2 = alloca i32 
  %success = alloca i1 
  %cache_stats = alloca [5 x i32] 
  %memory_stats = alloca [6 x i32] 
  %tree_score = alloca i32 
  %hash_score = alloca i32 
  %cache_score = alloca i32 
  %memory_score = alloca i32 
  %total_score = alloca i32 
  call void @AVLTree.new.(%AVLTree* %avl_tree)
  %rcc.tmp.2 = call i32 @getInt.()
  store i32 %rcc.tmp.2, ptr %tree_operations
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %tree_operations
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = call i32 @getInt.()
  store i32 %rcc.tmp.11, ptr %operation
  %rcc.tmp.13 = call i32 @getInt.()
  store i32 %rcc.tmp.13, ptr %key
  %rcc.tmp.15 = call i32 @getInt.()
  store i32 %rcc.tmp.15, ptr %value
  %rcc.tmp.17 = load i32, ptr %operation
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 1
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 2
  %rcc.tmp.21 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 2
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %key
  %rcc.tmp.24 = load i32, ptr %value
  %rcc.tmp.25 = call i32 @AVLTree.insert.(%AVLTree* %avl_tree, i32 %rcc.tmp.22, i32 %rcc.tmp.23, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %rcc.tmp.20
  br label %if.merge
if.else:
  %rcc.tmp.28 = load i32, ptr %operation
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.28, 2
  br i1 %rcc.tmp.29, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.31 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 2
  %rcc.tmp.32 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %key
  %rcc.tmp.35 = call i32 @AVLTree.delete_node.(%AVLTree* %avl_tree, i32 %rcc.tmp.33, i32 %rcc.tmp.34)
  store i32 %rcc.tmp.35, ptr %rcc.tmp.31
  br label %if.merge.2
if.else.2:
  %rcc.tmp.38 = load i32, ptr %operation
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, 3
  br i1 %rcc.tmp.39, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.41 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 2
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %key
  %rcc.tmp.44 = call i32 @AVLTree.search.(%AVLTree* %avl_tree, i32 %rcc.tmp.42, i32 %rcc.tmp.43)
  store i32 %rcc.tmp.44, ptr %result
  %rcc.tmp.46 = load i32, ptr %result
  %rcc.tmp.47 = sub i32 0, 1
  %rcc.tmp.48 = icmp ne i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.50 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 0
  %rcc.tmp.51 = load i32, ptr %result
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [2000 x %Node], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = getelementptr %Node, ptr %rcc.tmp.53, i32 0, i32 0
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  call void @printlnInt.(i32 %rcc.tmp.55)
  br label %if.merge.4
if.else.4:
  %rcc.tmp.58 = sub i32 0, 1
  call void @printlnInt.(i32 %rcc.tmp.58)
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.69 = call i32 @getInt.()
  store i32 %rcc.tmp.69, ptr %hash_capacity
  %rcc.tmp.71 = load i32, ptr %hash_capacity
  call void @HashTable.new.(%HashTable* %hash_table, i32 %rcc.tmp.71)
  %rcc.tmp.73 = call i32 @getInt.()
  store i32 %rcc.tmp.73, ptr %hash_operations
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = load i32, ptr %hash_operations
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.82 = call i32 @getInt.()
  store i32 %rcc.tmp.82, ptr %operation.2
  %rcc.tmp.84 = call i32 @getInt.()
  store i32 %rcc.tmp.84, ptr %key.2
  %rcc.tmp.86 = load i32, ptr %operation.2
  %rcc.tmp.87 = icmp eq i32 %rcc.tmp.86, 1
  br i1 %rcc.tmp.87, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.89 = call i32 @getInt.()
  store i32 %rcc.tmp.89, ptr %value.2
  %rcc.tmp.91 = load i32, ptr %key.2
  %rcc.tmp.92 = load i32, ptr %value.2
  call void @HashTable.insert.(%HashTable* %hash_table, i32 %rcc.tmp.91, i32 %rcc.tmp.92)
  br label %if.merge.5
if.else.5:
  %rcc.tmp.95 = load i32, ptr %operation.2
  %rcc.tmp.96 = icmp eq i32 %rcc.tmp.95, 2
  br i1 %rcc.tmp.96, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.98 = load i32, ptr %key.2
  %rcc.tmp.99 = call i32 @HashTable.search.(%HashTable* %hash_table, i32 %rcc.tmp.98)
  store i32 %rcc.tmp.99, ptr %result.2
  %rcc.tmp.101 = load i32, ptr %result.2
  call void @printlnInt.(i32 %rcc.tmp.101)
  br label %if.merge.6
if.else.6:
  %rcc.tmp.104 = load i32, ptr %operation.2
  %rcc.tmp.105 = icmp eq i32 %rcc.tmp.104, 3
  br i1 %rcc.tmp.105, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.107 = load i32, ptr %key.2
  %rcc.tmp.108 = call i1 @HashTable.delete.(%HashTable* %hash_table, i32 %rcc.tmp.107)
  store i1 %rcc.tmp.108, ptr %deleted
  %rcc.tmp.110 = load i1, ptr %deleted
  br i1 %rcc.tmp.110, label %if.then.8, label %if.else.8
if.then.8:
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.114 = phi i32 [1, %if.then.8], [0, %if.else.8]
  call void @printlnInt.(i32 %rcc.tmp.114)
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  store i32 %rcc.tmp.121, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.124 = call i32 @getInt.()
  store i32 %rcc.tmp.124, ptr %cache_capacity
  %rcc.tmp.126 = load i32, ptr %cache_capacity
  call void @LRUCache.new.(%LRUCache* %lru_cache, i32 %rcc.tmp.126)
  %rcc.tmp.128 = call i32 @getInt.()
  store i32 %rcc.tmp.128, ptr %cache_operations
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = load i32, ptr %cache_operations
  %rcc.tmp.134 = icmp slt i32 %rcc.tmp.132, %rcc.tmp.133
  br i1 %rcc.tmp.134, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.137 = call i32 @getInt.()
  store i32 %rcc.tmp.137, ptr %operation.3
  %rcc.tmp.139 = call i32 @getInt.()
  store i32 %rcc.tmp.139, ptr %key.3
  %rcc.tmp.141 = load i32, ptr %operation.3
  %rcc.tmp.142 = icmp eq i32 %rcc.tmp.141, 1
  br i1 %rcc.tmp.142, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.144 = call i32 @getInt.()
  store i32 %rcc.tmp.144, ptr %value.3
  %rcc.tmp.146 = load i32, ptr %key.3
  %rcc.tmp.147 = load i32, ptr %value.3
  call void @LRUCache.put.(%LRUCache* %lru_cache, i32 %rcc.tmp.146, i32 %rcc.tmp.147)
  br label %if.merge.9
if.else.9:
  %rcc.tmp.150 = load i32, ptr %operation.3
  %rcc.tmp.151 = icmp eq i32 %rcc.tmp.150, 2
  br i1 %rcc.tmp.151, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.153 = load i32, ptr %key.3
  %rcc.tmp.154 = call i32 @LRUCache.get.(%LRUCache* %lru_cache, i32 %rcc.tmp.153)
  store i32 %rcc.tmp.154, ptr %result.3
  %rcc.tmp.156 = load i32, ptr %result.3
  call void @printlnInt.(i32 %rcc.tmp.156)
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.161 = load i32, ptr %i
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 1
  store i32 %rcc.tmp.162, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.165 = call i32 @getInt.()
  store i32 %rcc.tmp.165, ptr %memory_size
  %rcc.tmp.167 = load i32, ptr %memory_size
  call void @MemoryManager.new.(%MemoryManager* %memory_manager, i32 %rcc.tmp.167)
  %rcc.tmp.169 = call i32 @getInt.()
  store i32 %rcc.tmp.169, ptr %memory_operations
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = load i32, ptr %memory_operations
  %rcc.tmp.175 = icmp slt i32 %rcc.tmp.173, %rcc.tmp.174
  br i1 %rcc.tmp.175, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.178 = call i32 @getInt.()
  store i32 %rcc.tmp.178, ptr %operation.4
  %rcc.tmp.180 = load i32, ptr %operation.4
  %rcc.tmp.181 = icmp eq i32 %rcc.tmp.180, 1
  br i1 %rcc.tmp.181, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.183 = call i32 @getInt.()
  store i32 %rcc.tmp.183, ptr %size
  %rcc.tmp.185 = load i32, ptr %size
  %rcc.tmp.186 = call i32 @MemoryManager.allocate.(%MemoryManager* %memory_manager, i32 %rcc.tmp.185)
  store i32 %rcc.tmp.186, ptr %block_id
  %rcc.tmp.188 = load i32, ptr %block_id
  call void @printlnInt.(i32 %rcc.tmp.188)
  br label %if.merge.11
if.else.11:
  %rcc.tmp.191 = load i32, ptr %operation.4
  %rcc.tmp.192 = icmp eq i32 %rcc.tmp.191, 2
  br i1 %rcc.tmp.192, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.194 = call i32 @getInt.()
  store i32 %rcc.tmp.194, ptr %block_id.2
  %rcc.tmp.196 = load i32, ptr %block_id.2
  %rcc.tmp.197 = call i1 @MemoryManager.deallocate.(%MemoryManager* %memory_manager, i32 %rcc.tmp.196)
  store i1 %rcc.tmp.197, ptr %success
  %rcc.tmp.199 = load i1, ptr %success
  br i1 %rcc.tmp.199, label %if.then.13, label %if.else.13
if.then.13:
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.203 = phi i32 [1, %if.then.13], [0, %if.else.13]
  call void @printlnInt.(i32 %rcc.tmp.203)
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.208 = load i32, ptr %i
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.212 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 1
  %rcc.tmp.213 = load i32, ptr %rcc.tmp.212
  call void @printlnInt.(i32 %rcc.tmp.213)
  %rcc.tmp.215 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 8
  %rcc.tmp.216 = load i32, ptr %rcc.tmp.215
  call void @printlnInt.(i32 %rcc.tmp.216)
  %rcc.tmp.218 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 9
  %rcc.tmp.219 = load i32, ptr %rcc.tmp.218
  call void @printlnInt.(i32 %rcc.tmp.219)
  %rcc.tmp.221 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 4
  %rcc.tmp.222 = load i32, ptr %rcc.tmp.221
  call void @printlnInt.(i32 %rcc.tmp.222)
  %rcc.tmp.224 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 5
  %rcc.tmp.225 = load i32, ptr %rcc.tmp.224
  call void @printlnInt.(i32 %rcc.tmp.225)
  %rcc.tmp.227 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 6
  %rcc.tmp.228 = load i32, ptr %rcc.tmp.227
  call void @printlnInt.(i32 %rcc.tmp.228)
  call void @LRUCache.get_cache_statistics.([5 x i32]* %cache_stats, %LRUCache* %lru_cache)
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.233 = load i32, ptr %i
  %rcc.tmp.234 = icmp slt i32 %rcc.tmp.233, 5
  br i1 %rcc.tmp.234, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.237 = load i32, ptr %i
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = getelementptr [5 x i32], ptr %cache_stats, i32 0, i32 %rcc.tmp.238
  %rcc.tmp.240 = load i32, ptr %rcc.tmp.239
  call void @printlnInt.(i32 %rcc.tmp.240)
  %rcc.tmp.242 = load i32, ptr %i
  %rcc.tmp.243 = add i32 %rcc.tmp.242, 1
  store i32 %rcc.tmp.243, ptr %i
  br label %while.cond.5
while.end.5:
  call void @MemoryManager.get_memory_statistics.([6 x i32]* %memory_stats, %MemoryManager* %memory_manager)
  store i32 0, ptr %i
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.249 = load i32, ptr %i
  %rcc.tmp.250 = icmp slt i32 %rcc.tmp.249, 6
  br i1 %rcc.tmp.250, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.253 = load i32, ptr %i
  %rcc.tmp.254 = add i32 %rcc.tmp.253, 0
  %rcc.tmp.255 = getelementptr [6 x i32], ptr %memory_stats, i32 0, i32 %rcc.tmp.254
  %rcc.tmp.256 = load i32, ptr %rcc.tmp.255
  call void @printlnInt.(i32 %rcc.tmp.256)
  %rcc.tmp.258 = load i32, ptr %i
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 1
  store i32 %rcc.tmp.259, ptr %i
  br label %while.cond.6
while.end.6:
  %rcc.tmp.262 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 1
  %rcc.tmp.263 = load i32, ptr %rcc.tmp.262
  %rcc.tmp.264 = mul i32 %rcc.tmp.263, 10
  %rcc.tmp.265 = getelementptr %AVLTree, ptr %avl_tree, i32 0, i32 8
  %rcc.tmp.266 = load i32, ptr %rcc.tmp.265
  %rcc.tmp.267 = add i32 %rcc.tmp.264, %rcc.tmp.266
  store i32 %rcc.tmp.267, ptr %tree_score
  %rcc.tmp.269 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 4
  %rcc.tmp.270 = load i32, ptr %rcc.tmp.269
  %rcc.tmp.271 = mul i32 %rcc.tmp.270, 5
  %rcc.tmp.272 = getelementptr %HashTable, ptr %hash_table, i32 0, i32 5
  %rcc.tmp.273 = load i32, ptr %rcc.tmp.272
  %rcc.tmp.274 = add i32 %rcc.tmp.271, %rcc.tmp.273
  store i32 %rcc.tmp.274, ptr %hash_score
  %rcc.tmp.276 = getelementptr [5 x i32], ptr %cache_stats, i32 0, i32 3
  %rcc.tmp.277 = load i32, ptr %rcc.tmp.276
  store i32 %rcc.tmp.277, ptr %cache_score
  %rcc.tmp.279 = getelementptr [6 x i32], ptr %memory_stats, i32 0, i32 4
  %rcc.tmp.280 = load i32, ptr %rcc.tmp.279
  %rcc.tmp.281 = sub i32 100, %rcc.tmp.280
  store i32 %rcc.tmp.281, ptr %memory_score
  %rcc.tmp.283 = load i32, ptr %tree_score
  %rcc.tmp.284 = load i32, ptr %hash_score
  %rcc.tmp.285 = add i32 %rcc.tmp.283, %rcc.tmp.284
  %rcc.tmp.286 = load i32, ptr %cache_score
  %rcc.tmp.287 = add i32 %rcc.tmp.285, %rcc.tmp.286
  %rcc.tmp.288 = load i32, ptr %memory_score
  %rcc.tmp.289 = add i32 %rcc.tmp.287, %rcc.tmp.288
  store i32 %rcc.tmp.289, ptr %total_score
  %rcc.tmp.291 = load i32, ptr %total_score
  call void @printlnInt.(i32 %rcc.tmp.291)
  call void @exit.(i32 0)
  ret void
}
