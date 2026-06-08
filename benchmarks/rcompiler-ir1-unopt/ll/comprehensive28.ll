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
  %tree_size = alloca i32 
  %max_depth = alloca i32 
  %simulation_rounds = alloca i32 
  %tree_nodes = alloca [200 x i32] 
  %fill.idx = alloca i32 
  %tree_left = alloca [200 x i32] 
  %fill.idx.2 = alloca i32 
  %tree_right = alloca [200 x i32] 
  %fill.idx.3 = alloca i32 
  %tree_parent = alloca [200 x i32] 
  %fill.idx.4 = alloca i32 
  %tree_height = alloca [200 x i32] 
  %fill.idx.5 = alloca i32 
  %tree_size_subtree = alloca [200 x i32] 
  %fill.idx.6 = alloca i32 
  %node_count = alloca i32 
  %root_index = alloca i32 
  %i = alloca i32 
  %value = alloca i32 
  %round = alloca i32 
  %analysis_result = alloca i32 
  %mathematical_result = alloca i32 
  %final_validation = alloca i32 
  store i32 50, ptr %tree_size
  store i32 12, ptr %max_depth
  store i32 8, ptr %simulation_rounds
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 200
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [200 x i32], ptr %tree_nodes, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 200
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [200 x i32], ptr %tree_left, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = sub i32 0, 1
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.24, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 200
  br i1 %rcc.tmp.30, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.32 = load i32, ptr %fill.idx.3
  %rcc.tmp.33 = getelementptr [200 x i32], ptr %tree_right, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = sub i32 0, 1
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.36, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.41 = load i32, ptr %fill.idx.4
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 200
  br i1 %rcc.tmp.42, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.44 = load i32, ptr %fill.idx.4
  %rcc.tmp.45 = getelementptr [200 x i32], ptr %tree_parent, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = sub i32 0, 1
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.48, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.53 = load i32, ptr %fill.idx.5
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.53, 200
  br i1 %rcc.tmp.54, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.56 = load i32, ptr %fill.idx.5
  %rcc.tmp.57 = getelementptr [200 x i32], ptr %tree_height, i32 0, i32 %rcc.tmp.56
  store i32 0, ptr %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.59, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.64 = load i32, ptr %fill.idx.6
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 200
  br i1 %rcc.tmp.65, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.67 = load i32, ptr %fill.idx.6
  %rcc.tmp.68 = getelementptr [200 x i32], ptr %tree_size_subtree, i32 0, i32 %rcc.tmp.67
  store i32 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.70, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %node_count
  %rcc.tmp.74 = sub i32 0, 1
  store i32 %rcc.tmp.74, ptr %root_index
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = load i32, ptr %tree_size
  %rcc.tmp.80 = icmp slt i32 %rcc.tmp.78, %rcc.tmp.79
  br i1 %rcc.tmp.80, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = mul i32 %rcc.tmp.83, 17
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 23
  %rcc.tmp.86 = call i32 @generate_pseudo_random_value.(i32 %rcc.tmp.85, i32 1000)
  store i32 %rcc.tmp.86, ptr %value
  %rcc.tmp.88 = load i32, ptr %root_index
  %rcc.tmp.89 = load i32, ptr %value
  %rcc.tmp.90 = load i32, ptr %node_count
  %rcc.tmp.91 = call i32 @insert_into_bst.([200 x i32]* %tree_nodes, [200 x i32]* %tree_left, [200 x i32]* %tree_right, [200 x i32]* %tree_parent, [200 x i32]* %tree_height, [200 x i32]* %tree_size_subtree, i32 %rcc.tmp.88, i32 %rcc.tmp.89, i32 %rcc.tmp.90)
  store i32 %rcc.tmp.91, ptr %root_index
  %rcc.tmp.93 = load i32, ptr %node_count
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %node_count
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.100 = load i32, ptr %root_index
  %rcc.tmp.101 = load i32, ptr %node_count
  %rcc.tmp.102 = call i32 @perform_tree_analysis.([200 x i32]* %tree_nodes, [200 x i32]* %tree_left, [200 x i32]* %tree_right, [200 x i32]* %tree_parent, [200 x i32]* %tree_height, [200 x i32]* %tree_size_subtree, i32 %rcc.tmp.100, i32 %rcc.tmp.101)
  call void @printlnInt.(i32 %rcc.tmp.102)
  store i32 0, ptr %round
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.106 = load i32, ptr %round
  %rcc.tmp.107 = load i32, ptr %simulation_rounds
  %rcc.tmp.108 = icmp slt i32 %rcc.tmp.106, %rcc.tmp.107
  br i1 %rcc.tmp.108, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.111 = load i32, ptr %root_index
  %rcc.tmp.112 = load i32, ptr %node_count
  %rcc.tmp.113 = call i32 @perform_tree_rebalancing.([200 x i32]* %tree_nodes, [200 x i32]* %tree_left, [200 x i32]* %tree_right, [200 x i32]* %tree_parent, [200 x i32]* %tree_height, [200 x i32]* %tree_size_subtree, i32 %rcc.tmp.111, i32 %rcc.tmp.112)
  store i32 %rcc.tmp.113, ptr %root_index
  %rcc.tmp.115 = load i32, ptr %root_index
  %rcc.tmp.116 = load i32, ptr %node_count
  %rcc.tmp.117 = load i32, ptr %round
  %rcc.tmp.118 = call i32 @perform_comprehensive_tree_traversal.([200 x i32]* %tree_nodes, [200 x i32]* %tree_left, [200 x i32]* %tree_right, [200 x i32]* %tree_parent, [200 x i32]* %tree_height, [200 x i32]* %tree_size_subtree, i32 %rcc.tmp.115, i32 %rcc.tmp.116, i32 %rcc.tmp.117)
  store i32 %rcc.tmp.118, ptr %analysis_result
  %rcc.tmp.120 = load i32, ptr %analysis_result
  call void @printlnInt.(i32 %rcc.tmp.120)
  %rcc.tmp.122 = load i32, ptr %root_index
  %rcc.tmp.123 = load i32, ptr %node_count
  %rcc.tmp.124 = load i32, ptr %round
  %rcc.tmp.125 = call i32 @compute_complex_tree_properties.([200 x i32]* %tree_nodes, [200 x i32]* %tree_left, [200 x i32]* %tree_right, [200 x i32]* %tree_parent, [200 x i32]* %tree_height, [200 x i32]* %tree_size_subtree, i32 %rcc.tmp.122, i32 %rcc.tmp.123, i32 %rcc.tmp.124)
  store i32 %rcc.tmp.125, ptr %mathematical_result
  %rcc.tmp.127 = load i32, ptr %mathematical_result
  call void @printlnInt.(i32 %rcc.tmp.127)
  %rcc.tmp.129 = load i32, ptr %round
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %round
  br label %while.cond.2
while.end.2:
  %rcc.tmp.133 = load i32, ptr %root_index
  %rcc.tmp.134 = load i32, ptr %node_count
  %rcc.tmp.135 = call i32 @validate_tree_integrity.([200 x i32]* %tree_nodes, [200 x i32]* %tree_left, [200 x i32]* %tree_right, [200 x i32]* %tree_parent, [200 x i32]* %tree_height, [200 x i32]* %tree_size_subtree, i32 %rcc.tmp.133, i32 %rcc.tmp.134)
  store i32 %rcc.tmp.135, ptr %final_validation
  %rcc.tmp.137 = load i32, ptr %final_validation
  call void @printlnInt.(i32 %rcc.tmp.137)
  call void @exit.(i32 0)
  ret void
}
define i32 @generate_pseudo_random_value.(i32 %seed.tmp, i32 %modulus.tmp) {
entry:
  %seed..tmp = alloca i32 
  %modulus..tmp = alloca i32 
  %result = alloca i32 
  store i32 %seed.tmp, ptr %seed..tmp
  store i32 %modulus.tmp, ptr %modulus..tmp
  %rcc.tmp.3 = load i32, ptr %seed..tmp
  store i32 %rcc.tmp.3, ptr %result
  %rcc.tmp.5 = load i32, ptr %result
  %rcc.tmp.6 = mul i32 %rcc.tmp.5, 15
  store i32 %rcc.tmp.6, ptr %result
  %rcc.tmp.8 = load i32, ptr %result
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 12345
  store i32 %rcc.tmp.9, ptr %result
  %rcc.tmp.11 = load i32, ptr %result
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %result
  %rcc.tmp.15 = sub i32 0, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %result
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %result
  %rcc.tmp.20 = load i32, ptr %modulus..tmp
  %rcc.tmp.21 = srem i32 %rcc.tmp.19, %rcc.tmp.20
  ret i32 %rcc.tmp.21
}
define i32 @insert_into_bst.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %value.tmp, i32 %node_index.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %value..tmp = alloca i32 
  %node_index..tmp = alloca i32 
  %current = alloca i32 
  %inserted = alloca i1 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %value.tmp, ptr %value..tmp
  store i32 %node_index.tmp, ptr %node_index..tmp
  %rcc.tmp.10 = load i32, ptr %node_index..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.13 = getelementptr [200 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %node_index..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = sub i32 0, 1
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %node_index..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = sub i32 0, 1
  store i32 %rcc.tmp.26, ptr %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %node_index..tmp
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.31 = getelementptr [200 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = sub i32 0, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %node_index..tmp
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.37 = getelementptr [200 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  store i32 1, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %node_index..tmp
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.42 = getelementptr [200 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  store i32 1, ptr %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %root..tmp
  %rcc.tmp.45 = sub i32 0, 1
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then, label %if.else
if.then:
  %rcc.tmp.48 = load i32, ptr %node_index..tmp
  ret i32 %rcc.tmp.48
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.51, ptr %current
  store i1 0, ptr %inserted
  br label %while.cond
while.cond:
  %rcc.tmp.55 = load i1, ptr %inserted
  %rcc.tmp.56 = xor i1 %rcc.tmp.55, true
  br i1 %rcc.tmp.56, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.59 = load i32, ptr %value..tmp
  %rcc.tmp.60 = load i32, ptr %current
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.63 = getelementptr [200 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.59, %rcc.tmp.64
  br i1 %rcc.tmp.65, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.67 = load i32, ptr %current
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.70 = getelementptr [200 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = sub i32 0, 1
  %rcc.tmp.73 = icmp eq i32 %rcc.tmp.71, %rcc.tmp.72
  br i1 %rcc.tmp.73, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.75 = load i32, ptr %current
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.78 = getelementptr [200 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %node_index..tmp
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %node_index..tmp
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.84 = getelementptr [200 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %current
  store i32 %rcc.tmp.85, ptr %rcc.tmp.84
  store i1 1, ptr %inserted
  br label %if.merge.3
if.else.3:
  %rcc.tmp.89 = load i32, ptr %current
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.92 = getelementptr [200 x i32], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  store i32 %rcc.tmp.93, ptr %current
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.97 = load i32, ptr %current
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.100 = getelementptr [200 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = sub i32 0, 1
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.101, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.105 = load i32, ptr %current
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.108 = getelementptr [200 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.109 = load i32, ptr %node_index..tmp
  store i32 %rcc.tmp.109, ptr %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %node_index..tmp
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.114 = getelementptr [200 x i32], ptr %rcc.tmp.113, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.115 = load i32, ptr %current
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  store i1 1, ptr %inserted
  br label %if.merge.4
if.else.4:
  %rcc.tmp.119 = load i32, ptr %current
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.122 = getelementptr [200 x i32], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %current
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.128 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.129 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.130 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.131 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.132 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.133 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.134 = load i32, ptr %node_index..tmp
  call void @update_tree_properties_bottom_up.([200 x i32]* %rcc.tmp.128, [200 x i32]* %rcc.tmp.129, [200 x i32]* %rcc.tmp.130, [200 x i32]* %rcc.tmp.131, [200 x i32]* %rcc.tmp.132, [200 x i32]* %rcc.tmp.133, i32 %rcc.tmp.134)
  %rcc.tmp.136 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.136
}
define void @update_tree_properties_bottom_up.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %start_node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %start_node..tmp = alloca i32 
  %current = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  %left_size = alloca i32 
  %right_size = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %start_node.tmp, ptr %start_node..tmp
  %rcc.tmp.8 = load i32, ptr %start_node..tmp
  store i32 %rcc.tmp.8, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %current
  %rcc.tmp.12 = sub i32 0, 1
  %rcc.tmp.13 = icmp ne i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %current
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = sub i32 0, 1
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  br label %if.merge
if.else:
  %rcc.tmp.25 = load i32, ptr %current
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.28 = getelementptr [200 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  br label %if.merge
if.merge:
  %rcc.tmp.35 = phi i32 [0, %if.then], [%rcc.tmp.33, %if.else]
  store i32 %rcc.tmp.35, ptr %left_height
  %rcc.tmp.37 = load i32, ptr %current
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.40 = getelementptr [200 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = sub i32 0, 1
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.46 = load i32, ptr %current
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.49 = getelementptr [200 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.53 = getelementptr [200 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.56 = phi i32 [0, %if.then.2], [%rcc.tmp.54, %if.else.2]
  store i32 %rcc.tmp.56, ptr %right_height
  %rcc.tmp.58 = load i32, ptr %current
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.61 = getelementptr [200 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %left_height
  %rcc.tmp.63 = load i32, ptr %right_height
  %rcc.tmp.64 = call i32 @max.(i32 %rcc.tmp.62, i32 %rcc.tmp.63)
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %rcc.tmp.61
  %rcc.tmp.67 = load i32, ptr %current
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.70 = getelementptr [200 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = sub i32 0, 1
  %rcc.tmp.73 = icmp eq i32 %rcc.tmp.71, %rcc.tmp.72
  br i1 %rcc.tmp.73, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.76 = load i32, ptr %current
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.79 = getelementptr [200 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.83 = getelementptr [200 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.86 = phi i32 [0, %if.then.3], [%rcc.tmp.84, %if.else.3]
  store i32 %rcc.tmp.86, ptr %left_size
  %rcc.tmp.88 = load i32, ptr %current
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.91 = getelementptr [200 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = sub i32 0, 1
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %if.then.4, label %if.else.4
if.then.4:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.97 = load i32, ptr %current
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.100 = getelementptr [200 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.104 = getelementptr [200 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.107 = phi i32 [0, %if.then.4], [%rcc.tmp.105, %if.else.4]
  store i32 %rcc.tmp.107, ptr %right_size
  %rcc.tmp.109 = load i32, ptr %current
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.112 = getelementptr [200 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.113 = load i32, ptr %left_size
  %rcc.tmp.114 = load i32, ptr %right_size
  %rcc.tmp.115 = add i32 %rcc.tmp.113, %rcc.tmp.114
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %rcc.tmp.112
  %rcc.tmp.118 = load i32, ptr %current
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.121 = getelementptr [200 x i32], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.122 = load i32, ptr %rcc.tmp.121
  store i32 %rcc.tmp.122, ptr %current
  br label %while.cond
while.end:
  ret void
}
define i32 @max.(i32 %a.tmp, i32 %b.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load i32, ptr %a..tmp
  %rcc.tmp.4 = load i32, ptr %b..tmp
  %rcc.tmp.5 = icmp sgt i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %a..tmp
  br label %if.merge
if.else:
  %rcc.tmp.9 = load i32, ptr %b..tmp
  br label %if.merge
if.merge:
  %rcc.tmp.11 = phi i32 [%rcc.tmp.7, %if.then], [%rcc.tmp.9, %if.else]
  ret i32 %rcc.tmp.11
}
define i32 @min.(i32 %a.tmp, i32 %b.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load i32, ptr %a..tmp
  %rcc.tmp.4 = load i32, ptr %b..tmp
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %a..tmp
  br label %if.merge
if.else:
  %rcc.tmp.9 = load i32, ptr %b..tmp
  br label %if.merge
if.merge:
  %rcc.tmp.11 = phi i32 [%rcc.tmp.7, %if.then], [%rcc.tmp.9, %if.else]
  ret i32 %rcc.tmp.11
}
define i32 @abs.(i32 %x.tmp) {
entry:
  %x..tmp = alloca i32 
  store i32 %x.tmp, ptr %x..tmp
  %rcc.tmp.2 = load i32, ptr %x..tmp
  %rcc.tmp.3 = icmp slt i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %x..tmp
  %rcc.tmp.6 = sub i32 0, %rcc.tmp.5
  br label %if.merge
if.else:
  %rcc.tmp.8 = load i32, ptr %x..tmp
  br label %if.merge
if.merge:
  %rcc.tmp.10 = phi i32 [%rcc.tmp.6, %if.then], [%rcc.tmp.8, %if.else]
  ret i32 %rcc.tmp.10
}
define i32 @perform_tree_analysis.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %tree_height = alloca i32 
  %total_nodes = alloca i32 
  %balance_factor = alloca i32 
  %path_sum = alloca i32 
  %node_depth_variance = alloca i32 
  %complexity_metric = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.9 = load i32, ptr %root..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %root..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %tree_height
  %rcc.tmp.21 = load i32, ptr %root..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.24 = getelementptr [200 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %total_nodes
  %rcc.tmp.27 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.33 = load i32, ptr %root..tmp
  %rcc.tmp.34 = call i32 @compute_tree_balance_factor.([200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, i32 %rcc.tmp.33)
  store i32 %rcc.tmp.34, ptr %balance_factor
  %rcc.tmp.36 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.39 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.40 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.42 = load i32, ptr %root..tmp
  %rcc.tmp.43 = call i32 @compute_all_paths_sum.([200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, [200 x i32]* %rcc.tmp.39, [200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, i32 %rcc.tmp.42, i32 0, i32 0)
  store i32 %rcc.tmp.43, ptr %path_sum
  %rcc.tmp.45 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.46 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.47 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.48 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.51 = load i32, ptr %root..tmp
  %rcc.tmp.52 = call i32 @compute_node_depth_variance.([200 x i32]* %rcc.tmp.45, [200 x i32]* %rcc.tmp.46, [200 x i32]* %rcc.tmp.47, [200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, i32 %rcc.tmp.51, i32 0)
  store i32 %rcc.tmp.52, ptr %node_depth_variance
  %rcc.tmp.54 = load i32, ptr %tree_height
  %rcc.tmp.55 = load i32, ptr %total_nodes
  %rcc.tmp.56 = mul i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %balance_factor
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 17
  %rcc.tmp.59 = add i32 %rcc.tmp.56, %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %path_sum
  %rcc.tmp.61 = srem i32 %rcc.tmp.60, 1000
  %rcc.tmp.62 = add i32 %rcc.tmp.59, %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %node_depth_variance
  %rcc.tmp.64 = add i32 %rcc.tmp.62, %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %complexity_metric
  %rcc.tmp.66 = load i32, ptr %complexity_metric
  %rcc.tmp.67 = srem i32 %rcc.tmp.66, 10000
  ret i32 %rcc.tmp.67
}
define i32 @compute_tree_balance_factor.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  %current_balance = alloca i32 
  %left_balance = alloca i32 
  %right_balance = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.26 = getelementptr [200 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.33 = phi i32 [0, %if.then.2], [%rcc.tmp.31, %if.else.2]
  store i32 %rcc.tmp.33, ptr %left_height
  %rcc.tmp.35 = load i32, ptr %node..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = sub i32 0, 1
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.44 = load i32, ptr %node..tmp
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.51 = getelementptr [200 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.54 = phi i32 [0, %if.then.3], [%rcc.tmp.52, %if.else.3]
  store i32 %rcc.tmp.54, ptr %right_height
  %rcc.tmp.56 = load i32, ptr %left_height
  %rcc.tmp.57 = load i32, ptr %right_height
  %rcc.tmp.58 = sub i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = call i32 @abs.(i32 %rcc.tmp.58)
  store i32 %rcc.tmp.59, ptr %current_balance
  %rcc.tmp.61 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.62 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.63 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.64 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.65 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.66 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.67 = load i32, ptr %node..tmp
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.70 = getelementptr [200 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = call i32 @compute_tree_balance_factor.([200 x i32]* %rcc.tmp.61, [200 x i32]* %rcc.tmp.62, [200 x i32]* %rcc.tmp.63, [200 x i32]* %rcc.tmp.64, [200 x i32]* %rcc.tmp.65, [200 x i32]* %rcc.tmp.66, i32 %rcc.tmp.71)
  store i32 %rcc.tmp.72, ptr %left_balance
  %rcc.tmp.74 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.75 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.76 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.77 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.78 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.79 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.80 = load i32, ptr %node..tmp
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.83 = getelementptr [200 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = call i32 @compute_tree_balance_factor.([200 x i32]* %rcc.tmp.74, [200 x i32]* %rcc.tmp.75, [200 x i32]* %rcc.tmp.76, [200 x i32]* %rcc.tmp.77, [200 x i32]* %rcc.tmp.78, [200 x i32]* %rcc.tmp.79, i32 %rcc.tmp.84)
  store i32 %rcc.tmp.85, ptr %right_balance
  %rcc.tmp.87 = load i32, ptr %current_balance
  %rcc.tmp.88 = load i32, ptr %left_balance
  %rcc.tmp.89 = add i32 %rcc.tmp.87, %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %right_balance
  %rcc.tmp.91 = add i32 %rcc.tmp.89, %rcc.tmp.90
  ret i32 %rcc.tmp.91
}
define i32 @compute_all_paths_sum.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %current_sum.tmp, i32 %depth.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %current_sum..tmp = alloca i32 
  %depth..tmp = alloca i32 
  %new_sum = alloca i32 
  %left_paths = alloca i32 
  %right_paths = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %current_sum.tmp, ptr %current_sum..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  %rcc.tmp.10 = load i32, ptr %node..tmp
  %rcc.tmp.11 = sub i32 0, 1
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %current_sum..tmp
  %rcc.tmp.17 = load i32, ptr %node..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.20 = getelementptr [200 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %depth..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = mul i32 %rcc.tmp.21, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.16, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %new_sum
  %rcc.tmp.27 = load i32, ptr %node..tmp
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = sub i32 0, 1
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.31, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.35 = load i32, ptr %node..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = sub i32 0, 1
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.39, %rcc.tmp.40
  br label %sc.merge
sc.merge:
  %rcc.tmp.43 = phi i1 [0, %if.merge], [%rcc.tmp.41, %and.rhs]
  br i1 %rcc.tmp.43, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.45 = load i32, ptr %new_sum
  ret i32 %rcc.tmp.45
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.48 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.54 = load i32, ptr %node..tmp
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.57 = getelementptr [200 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %new_sum
  %rcc.tmp.60 = load i32, ptr %depth..tmp
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  %rcc.tmp.62 = call i32 @compute_all_paths_sum.([200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, i32 %rcc.tmp.58, i32 %rcc.tmp.59, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %left_paths
  %rcc.tmp.64 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.65 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.66 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.67 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.68 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.69 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.70 = load i32, ptr %node..tmp
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.73 = getelementptr [200 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %new_sum
  %rcc.tmp.76 = load i32, ptr %depth..tmp
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  %rcc.tmp.78 = call i32 @compute_all_paths_sum.([200 x i32]* %rcc.tmp.64, [200 x i32]* %rcc.tmp.65, [200 x i32]* %rcc.tmp.66, [200 x i32]* %rcc.tmp.67, [200 x i32]* %rcc.tmp.68, [200 x i32]* %rcc.tmp.69, i32 %rcc.tmp.74, i32 %rcc.tmp.75, i32 %rcc.tmp.77)
  store i32 %rcc.tmp.78, ptr %right_paths
  %rcc.tmp.80 = load i32, ptr %left_paths
  %rcc.tmp.81 = load i32, ptr %right_paths
  %rcc.tmp.82 = add i32 %rcc.tmp.80, %rcc.tmp.81
  ret i32 %rcc.tmp.82
}
define i32 @compute_node_depth_variance.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %depth.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %depth..tmp = alloca i32 
  %current_variance = alloca i32 
  %left_variance = alloca i32 
  %right_variance = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %depth..tmp
  %rcc.tmp.16 = load i32, ptr %depth..tmp
  %rcc.tmp.17 = mul i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %node..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.21 = getelementptr [200 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 7
  %rcc.tmp.24 = add i32 %rcc.tmp.17, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %current_variance
  %rcc.tmp.26 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.32 = load i32, ptr %node..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.35 = getelementptr [200 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %depth..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = call i32 @compute_node_depth_variance.([200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, i32 %rcc.tmp.36, i32 %rcc.tmp.38)
  store i32 %rcc.tmp.39, ptr %left_variance
  %rcc.tmp.41 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.42 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.45 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.46 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.47 = load i32, ptr %node..tmp
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.50 = getelementptr [200 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %depth..tmp
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = call i32 @compute_node_depth_variance.([200 x i32]* %rcc.tmp.41, [200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, [200 x i32]* %rcc.tmp.45, [200 x i32]* %rcc.tmp.46, i32 %rcc.tmp.51, i32 %rcc.tmp.53)
  store i32 %rcc.tmp.54, ptr %right_variance
  %rcc.tmp.56 = load i32, ptr %current_variance
  %rcc.tmp.57 = load i32, ptr %left_variance
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %right_variance
  %rcc.tmp.60 = add i32 %rcc.tmp.58, %rcc.tmp.59
  ret i32 %rcc.tmp.60
}
define i32 @perform_tree_rebalancing.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %rebalance_operations = alloca i32 
  %current_root = alloca i32 
  %i = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %rebalance_operations
  %rcc.tmp.10 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.10, ptr %current_root
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %node_count..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.18 = load i32, ptr %rebalance_operations
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 5
  br label %sc.merge
sc.merge:
  %rcc.tmp.21 = phi i1 [0, %while.cond], [%rcc.tmp.19, %and.rhs]
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.25 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.26 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = call i1 @needs_rebalancing.([200 x i32]* %rcc.tmp.24, [200 x i32]* %rcc.tmp.25, [200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, i32 %rcc.tmp.30)
  br i1 %rcc.tmp.31, label %if.then, label %if.else
if.then:
  %rcc.tmp.33 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.36 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.39 = load i32, ptr %current_root
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = call i32 @perform_rotation_at_node.([200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, [200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, i32 %rcc.tmp.39, i32 %rcc.tmp.40)
  store i32 %rcc.tmp.41, ptr %current_root
  %rcc.tmp.43 = load i32, ptr %rebalance_operations
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %rebalance_operations
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.52 = load i32, ptr %current_root
  ret i32 %rcc.tmp.52
}
define i1 @needs_rebalancing.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.26 = getelementptr [200 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.33 = phi i32 [0, %if.then.2], [%rcc.tmp.31, %if.else.2]
  store i32 %rcc.tmp.33, ptr %left_height
  %rcc.tmp.35 = load i32, ptr %node..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = sub i32 0, 1
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.44 = load i32, ptr %node..tmp
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.51 = getelementptr [200 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.54 = phi i32 [0, %if.then.3], [%rcc.tmp.52, %if.else.3]
  store i32 %rcc.tmp.54, ptr %right_height
  %rcc.tmp.56 = load i32, ptr %left_height
  %rcc.tmp.57 = load i32, ptr %right_height
  %rcc.tmp.58 = sub i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = call i32 @abs.(i32 %rcc.tmp.58)
  %rcc.tmp.60 = icmp sgt i32 %rcc.tmp.59, 2
  ret i1 %rcc.tmp.60
}
define i32 @perform_rotation_at_node.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  %rcc.tmp.13 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.13
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %node..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = sub i32 0, 1
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.25 = load i32, ptr %node..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.28 = getelementptr [200 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.35 = phi i32 [0, %if.then.2], [%rcc.tmp.33, %if.else.2]
  store i32 %rcc.tmp.35, ptr %left_height
  %rcc.tmp.37 = load i32, ptr %node..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.40 = getelementptr [200 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = sub i32 0, 1
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.46 = load i32, ptr %node..tmp
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.49 = getelementptr [200 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.53 = getelementptr [200 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.56 = phi i32 [0, %if.then.3], [%rcc.tmp.54, %if.else.3]
  store i32 %rcc.tmp.56, ptr %right_height
  %rcc.tmp.58 = load i32, ptr %left_height
  %rcc.tmp.59 = load i32, ptr %right_height
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = icmp sgt i32 %rcc.tmp.58, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.63 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.64 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.65 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.66 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.67 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.68 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.69 = load i32, ptr %root..tmp
  %rcc.tmp.70 = load i32, ptr %node..tmp
  %rcc.tmp.71 = call i32 @perform_right_rotation.([200 x i32]* %rcc.tmp.63, [200 x i32]* %rcc.tmp.64, [200 x i32]* %rcc.tmp.65, [200 x i32]* %rcc.tmp.66, [200 x i32]* %rcc.tmp.67, [200 x i32]* %rcc.tmp.68, i32 %rcc.tmp.69, i32 %rcc.tmp.70)
  ret i32 %rcc.tmp.71
if.else.4:
  %rcc.tmp.73 = load i32, ptr %right_height
  %rcc.tmp.74 = load i32, ptr %left_height
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  %rcc.tmp.76 = icmp sgt i32 %rcc.tmp.73, %rcc.tmp.75
  br i1 %rcc.tmp.76, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.78 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.79 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.80 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.81 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.82 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.83 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.84 = load i32, ptr %root..tmp
  %rcc.tmp.85 = load i32, ptr %node..tmp
  %rcc.tmp.86 = call i32 @perform_left_rotation.([200 x i32]* %rcc.tmp.78, [200 x i32]* %rcc.tmp.79, [200 x i32]* %rcc.tmp.80, [200 x i32]* %rcc.tmp.81, [200 x i32]* %rcc.tmp.82, [200 x i32]* %rcc.tmp.83, i32 %rcc.tmp.84, i32 %rcc.tmp.85)
  ret i32 %rcc.tmp.86
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.90 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.90
}
define i32 @perform_right_rotation.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node..tmp = alloca i32 
  %new_root_candidate = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.12 = getelementptr [200 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = sub i32 0, 1
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.17
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.20 = load i32, ptr %node..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.23 = getelementptr [200 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %new_root_candidate
  %rcc.tmp.26 = load i32, ptr %node..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.29 = getelementptr [200 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %new_root_candidate
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.33 = getelementptr [200 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.29
  %rcc.tmp.36 = load i32, ptr %new_root_candidate
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.39 = getelementptr [200 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = sub i32 0, 1
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.44 = load i32, ptr %new_root_candidate
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.51 = getelementptr [200 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.56 = load i32, ptr %new_root_candidate
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.60, ptr %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %new_root_candidate
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.65 = getelementptr [200 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %node..tmp
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.69 = getelementptr [200 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %rcc.tmp.65
  %rcc.tmp.72 = load i32, ptr %node..tmp
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.75 = getelementptr [200 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %new_root_candidate
  store i32 %rcc.tmp.76, ptr %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %new_root_candidate
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.81 = getelementptr [200 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = sub i32 0, 1
  %rcc.tmp.84 = icmp ne i32 %rcc.tmp.82, %rcc.tmp.83
  br i1 %rcc.tmp.84, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.86 = load i32, ptr %new_root_candidate
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.89 = getelementptr [200 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.93 = getelementptr [200 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %node..tmp
  %rcc.tmp.96 = icmp eq i32 %rcc.tmp.94, %rcc.tmp.95
  br i1 %rcc.tmp.96, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.98 = load i32, ptr %new_root_candidate
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.101 = getelementptr [200 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.105 = getelementptr [200 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %new_root_candidate
  store i32 %rcc.tmp.106, ptr %rcc.tmp.105
  br label %if.merge.4
if.else.4:
  %rcc.tmp.109 = load i32, ptr %new_root_candidate
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.112 = getelementptr [200 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.116 = getelementptr [200 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %new_root_candidate
  store i32 %rcc.tmp.117, ptr %rcc.tmp.116
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.122 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.123 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.124 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.125 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.126 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.127 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.128 = load i32, ptr %node..tmp
  call void @update_tree_properties_bottom_up.([200 x i32]* %rcc.tmp.122, [200 x i32]* %rcc.tmp.123, [200 x i32]* %rcc.tmp.124, [200 x i32]* %rcc.tmp.125, [200 x i32]* %rcc.tmp.126, [200 x i32]* %rcc.tmp.127, i32 %rcc.tmp.128)
  %rcc.tmp.130 = load i32, ptr %root..tmp
  %rcc.tmp.131 = load i32, ptr %node..tmp
  %rcc.tmp.132 = icmp eq i32 %rcc.tmp.130, %rcc.tmp.131
  br i1 %rcc.tmp.132, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.134 = load i32, ptr %new_root_candidate
  ret i32 %rcc.tmp.134
if.else.5:
  %rcc.tmp.136 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.136
if.merge.5:
  ret i32 undef
}
define i32 @perform_left_rotation.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node..tmp = alloca i32 
  %new_root_candidate = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.12 = getelementptr [200 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = sub i32 0, 1
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.17
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.20 = load i32, ptr %node..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.23 = getelementptr [200 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %new_root_candidate
  %rcc.tmp.26 = load i32, ptr %node..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.29 = getelementptr [200 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %new_root_candidate
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.33 = getelementptr [200 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.29
  %rcc.tmp.36 = load i32, ptr %new_root_candidate
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.39 = getelementptr [200 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = sub i32 0, 1
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.44 = load i32, ptr %new_root_candidate
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.51 = getelementptr [200 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.56 = load i32, ptr %new_root_candidate
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.60, ptr %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %new_root_candidate
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.65 = getelementptr [200 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %node..tmp
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.69 = getelementptr [200 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %rcc.tmp.65
  %rcc.tmp.72 = load i32, ptr %node..tmp
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.75 = getelementptr [200 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %new_root_candidate
  store i32 %rcc.tmp.76, ptr %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %new_root_candidate
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.81 = getelementptr [200 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = sub i32 0, 1
  %rcc.tmp.84 = icmp ne i32 %rcc.tmp.82, %rcc.tmp.83
  br i1 %rcc.tmp.84, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.86 = load i32, ptr %new_root_candidate
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.89 = getelementptr [200 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.93 = getelementptr [200 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %node..tmp
  %rcc.tmp.96 = icmp eq i32 %rcc.tmp.94, %rcc.tmp.95
  br i1 %rcc.tmp.96, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.98 = load i32, ptr %new_root_candidate
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.101 = getelementptr [200 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.105 = getelementptr [200 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %new_root_candidate
  store i32 %rcc.tmp.106, ptr %rcc.tmp.105
  br label %if.merge.4
if.else.4:
  %rcc.tmp.109 = load i32, ptr %new_root_candidate
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.112 = getelementptr [200 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.116 = getelementptr [200 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %new_root_candidate
  store i32 %rcc.tmp.117, ptr %rcc.tmp.116
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.122 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.123 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.124 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.125 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.126 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.127 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.128 = load i32, ptr %node..tmp
  call void @update_tree_properties_bottom_up.([200 x i32]* %rcc.tmp.122, [200 x i32]* %rcc.tmp.123, [200 x i32]* %rcc.tmp.124, [200 x i32]* %rcc.tmp.125, [200 x i32]* %rcc.tmp.126, [200 x i32]* %rcc.tmp.127, i32 %rcc.tmp.128)
  %rcc.tmp.130 = load i32, ptr %root..tmp
  %rcc.tmp.131 = load i32, ptr %node..tmp
  %rcc.tmp.132 = icmp eq i32 %rcc.tmp.130, %rcc.tmp.131
  br i1 %rcc.tmp.132, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.134 = load i32, ptr %new_root_candidate
  ret i32 %rcc.tmp.134
if.else.5:
  %rcc.tmp.136 = load i32, ptr %root..tmp
  ret i32 %rcc.tmp.136
if.merge.5:
  ret i32 undef
}
define i32 @perform_comprehensive_tree_traversal.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %inorder_sum = alloca i32 
  %preorder_sum = alloca i32 
  %postorder_sum = alloca i32 
  %level_order_sum = alloca i32 
  %diagonal_sum = alloca i32 
  %combined_result = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.10 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.11 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.12 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.13 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.14 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.15 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.16 = load i32, ptr %root..tmp
  %rcc.tmp.17 = load i32, ptr %round..tmp
  %rcc.tmp.18 = call i32 @perform_inorder_traversal_with_computation.([200 x i32]* %rcc.tmp.10, [200 x i32]* %rcc.tmp.11, [200 x i32]* %rcc.tmp.12, [200 x i32]* %rcc.tmp.13, [200 x i32]* %rcc.tmp.14, [200 x i32]* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %inorder_sum
  %rcc.tmp.20 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.21 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.22 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.23 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.24 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.25 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.26 = load i32, ptr %root..tmp
  %rcc.tmp.27 = load i32, ptr %round..tmp
  %rcc.tmp.28 = call i32 @perform_preorder_traversal_with_computation.([200 x i32]* %rcc.tmp.20, [200 x i32]* %rcc.tmp.21, [200 x i32]* %rcc.tmp.22, [200 x i32]* %rcc.tmp.23, [200 x i32]* %rcc.tmp.24, [200 x i32]* %rcc.tmp.25, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  store i32 %rcc.tmp.28, ptr %preorder_sum
  %rcc.tmp.30 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.36 = load i32, ptr %root..tmp
  %rcc.tmp.37 = load i32, ptr %round..tmp
  %rcc.tmp.38 = call i32 @perform_postorder_traversal_with_computation.([200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %postorder_sum
  %rcc.tmp.40 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.42 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.45 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.46 = load i32, ptr %root..tmp
  %rcc.tmp.47 = load i32, ptr %node_count..tmp
  %rcc.tmp.48 = load i32, ptr %round..tmp
  %rcc.tmp.49 = call i32 @perform_level_order_traversal_simulation.([200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, [200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, [200 x i32]* %rcc.tmp.45, i32 %rcc.tmp.46, i32 %rcc.tmp.47, i32 %rcc.tmp.48)
  store i32 %rcc.tmp.49, ptr %level_order_sum
  %rcc.tmp.51 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.55 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.56 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.57 = load i32, ptr %root..tmp
  %rcc.tmp.58 = load i32, ptr %round..tmp
  %rcc.tmp.59 = call i32 @compute_diagonal_traversal_sum.([200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, [200 x i32]* %rcc.tmp.55, [200 x i32]* %rcc.tmp.56, i32 %rcc.tmp.57, i32 0, i32 %rcc.tmp.58)
  store i32 %rcc.tmp.59, ptr %diagonal_sum
  %rcc.tmp.61 = load i32, ptr %inorder_sum
  %rcc.tmp.62 = mul i32 %rcc.tmp.61, 13
  %rcc.tmp.63 = load i32, ptr %preorder_sum
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 17
  %rcc.tmp.65 = add i32 %rcc.tmp.62, %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %postorder_sum
  %rcc.tmp.67 = mul i32 %rcc.tmp.66, 19
  %rcc.tmp.68 = add i32 %rcc.tmp.65, %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %level_order_sum
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 23
  %rcc.tmp.71 = add i32 %rcc.tmp.68, %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %diagonal_sum
  %rcc.tmp.73 = mul i32 %rcc.tmp.72, 29
  %rcc.tmp.74 = add i32 %rcc.tmp.71, %rcc.tmp.73
  %rcc.tmp.75 = srem i32 %rcc.tmp.74, 100000
  store i32 %rcc.tmp.75, ptr %combined_result
  %rcc.tmp.77 = load i32, ptr %combined_result
  ret i32 %rcc.tmp.77
}
define i32 @perform_inorder_traversal_with_computation.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %multiplier.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %multiplier..tmp = alloca i32 
  %left_sum = alloca i32 
  %current_contribution = alloca i32 
  %right_sum = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %multiplier.tmp, ptr %multiplier..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.18 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.19 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.20 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.21 = load i32, ptr %node..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.24 = getelementptr [200 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %multiplier..tmp
  %rcc.tmp.27 = call i32 @perform_inorder_traversal_with_computation.([200 x i32]* %rcc.tmp.15, [200 x i32]* %rcc.tmp.16, [200 x i32]* %rcc.tmp.17, [200 x i32]* %rcc.tmp.18, [200 x i32]* %rcc.tmp.19, [200 x i32]* %rcc.tmp.20, i32 %rcc.tmp.25, i32 %rcc.tmp.26)
  store i32 %rcc.tmp.27, ptr %left_sum
  %rcc.tmp.29 = load i32, ptr %node..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %multiplier..tmp
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  %rcc.tmp.36 = mul i32 %rcc.tmp.33, %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %node..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.40 = getelementptr [200 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %node..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.45 = getelementptr [200 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = mul i32 %rcc.tmp.41, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.36, %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %current_contribution
  %rcc.tmp.50 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.55 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.56 = load i32, ptr %node..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %multiplier..tmp
  %rcc.tmp.62 = call i32 @perform_inorder_traversal_with_computation.([200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, [200 x i32]* %rcc.tmp.55, i32 %rcc.tmp.60, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %right_sum
  %rcc.tmp.64 = load i32, ptr %left_sum
  %rcc.tmp.65 = load i32, ptr %current_contribution
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %right_sum
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  ret i32 %rcc.tmp.68
}
define i32 @perform_preorder_traversal_with_computation.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %multiplier.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %multiplier..tmp = alloca i32 
  %current_contribution = alloca i32 
  %left_sum = alloca i32 
  %right_sum = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %multiplier.tmp, ptr %multiplier..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %multiplier..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = mul i32 %rcc.tmp.19, %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.26 = getelementptr [200 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %node..tmp
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.31 = getelementptr [200 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = mul i32 %rcc.tmp.27, %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.22, %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %current_contribution
  %rcc.tmp.36 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.39 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.40 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.42 = load i32, ptr %node..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.45 = getelementptr [200 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %multiplier..tmp
  %rcc.tmp.48 = call i32 @perform_preorder_traversal_with_computation.([200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, [200 x i32]* %rcc.tmp.39, [200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, i32 %rcc.tmp.46, i32 %rcc.tmp.47)
  store i32 %rcc.tmp.48, ptr %left_sum
  %rcc.tmp.50 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.55 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.56 = load i32, ptr %node..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %multiplier..tmp
  %rcc.tmp.62 = call i32 @perform_preorder_traversal_with_computation.([200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, [200 x i32]* %rcc.tmp.55, i32 %rcc.tmp.60, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %right_sum
  %rcc.tmp.64 = load i32, ptr %current_contribution
  %rcc.tmp.65 = load i32, ptr %left_sum
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %right_sum
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  ret i32 %rcc.tmp.68
}
define i32 @perform_postorder_traversal_with_computation.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %multiplier.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %multiplier..tmp = alloca i32 
  %left_sum = alloca i32 
  %right_sum = alloca i32 
  %current_contribution = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %multiplier.tmp, ptr %multiplier..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.18 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.19 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.20 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.21 = load i32, ptr %node..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.24 = getelementptr [200 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %multiplier..tmp
  %rcc.tmp.27 = call i32 @perform_postorder_traversal_with_computation.([200 x i32]* %rcc.tmp.15, [200 x i32]* %rcc.tmp.16, [200 x i32]* %rcc.tmp.17, [200 x i32]* %rcc.tmp.18, [200 x i32]* %rcc.tmp.19, [200 x i32]* %rcc.tmp.20, i32 %rcc.tmp.25, i32 %rcc.tmp.26)
  store i32 %rcc.tmp.27, ptr %left_sum
  %rcc.tmp.29 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.35 = load i32, ptr %node..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %multiplier..tmp
  %rcc.tmp.41 = call i32 @perform_postorder_traversal_with_computation.([200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, i32 %rcc.tmp.39, i32 %rcc.tmp.40)
  store i32 %rcc.tmp.41, ptr %right_sum
  %rcc.tmp.43 = load i32, ptr %node..tmp
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.46 = getelementptr [200 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %multiplier..tmp
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 3
  %rcc.tmp.50 = mul i32 %rcc.tmp.47, %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %node..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.54 = getelementptr [200 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %node..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = mul i32 %rcc.tmp.55, %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.50, %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %current_contribution
  %rcc.tmp.64 = load i32, ptr %left_sum
  %rcc.tmp.65 = load i32, ptr %right_sum
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %current_contribution
  %rcc.tmp.68 = add i32 %rcc.tmp.66, %rcc.tmp.67
  ret i32 %rcc.tmp.68
}
define i32 @perform_level_order_traversal_simulation.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %queue = alloca [200 x i32] 
  %fill.idx = alloca i32 
  %queue_front = alloca i32 
  %queue_rear = alloca i32 
  %level_sum = alloca i32 
  %current_level = alloca i32 
  %level_size = alloca i32 
  %level_contribution = alloca i32 
  %processed_in_level = alloca i32 
  %current_node = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.12 = load i32, ptr %fill.idx
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 200
  br i1 %rcc.tmp.13, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.15 = load i32, ptr %fill.idx
  %rcc.tmp.16 = getelementptr [200 x i32], ptr %queue, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %queue_front
  store i32 0, ptr %queue_rear
  store i32 0, ptr %level_sum
  store i32 1, ptr %current_level
  %rcc.tmp.26 = load i32, ptr %root..tmp
  %rcc.tmp.27 = sub i32 0, 1
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %queue_rear
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [200 x i32], ptr %queue, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %queue_rear
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %queue_rear
  br label %while.cond
while.cond:
  %rcc.tmp.41 = load i32, ptr %queue_front
  %rcc.tmp.42 = load i32, ptr %queue_rear
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.46 = load i32, ptr %queue_rear
  %rcc.tmp.47 = load i32, ptr %queue_front
  %rcc.tmp.48 = sub i32 %rcc.tmp.46, %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %level_size
  store i32 0, ptr %level_contribution
  store i32 0, ptr %processed_in_level
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.53 = load i32, ptr %processed_in_level
  %rcc.tmp.54 = load i32, ptr %level_size
  %rcc.tmp.55 = icmp slt i32 %rcc.tmp.53, %rcc.tmp.54
  br i1 %rcc.tmp.55, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.57 = load i32, ptr %queue_front
  %rcc.tmp.58 = load i32, ptr %queue_rear
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.57, %rcc.tmp.58
  br label %sc.merge
sc.merge:
  %rcc.tmp.61 = phi i1 [0, %while.cond.2], [%rcc.tmp.59, %and.rhs]
  br i1 %rcc.tmp.61, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.64 = load i32, ptr %queue_front
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [200 x i32], ptr %queue, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %current_node
  %rcc.tmp.69 = load i32, ptr %queue_front
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %queue_front
  %rcc.tmp.72 = load i32, ptr %level_contribution
  %rcc.tmp.73 = load i32, ptr %current_node
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.76 = getelementptr [200 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %current_level
  %rcc.tmp.79 = mul i32 %rcc.tmp.77, %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.72, %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %current_node
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.84 = getelementptr [200 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %round..tmp
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  %rcc.tmp.88 = mul i32 %rcc.tmp.85, %rcc.tmp.87
  %rcc.tmp.89 = add i32 %rcc.tmp.80, %rcc.tmp.88
  store i32 %rcc.tmp.89, ptr %level_contribution
  %rcc.tmp.91 = load i32, ptr %current_node
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.94 = getelementptr [200 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.94
  %rcc.tmp.96 = sub i32 0, 1
  %rcc.tmp.97 = icmp ne i32 %rcc.tmp.95, %rcc.tmp.96
  br i1 %rcc.tmp.97, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.99 = load i32, ptr %queue_rear
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [200 x i32], ptr %queue, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %current_node
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.105 = getelementptr [200 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.106, ptr %rcc.tmp.101
  %rcc.tmp.108 = load i32, ptr %queue_rear
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %queue_rear
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.113 = load i32, ptr %current_node
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.116 = getelementptr [200 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.118 = sub i32 0, 1
  %rcc.tmp.119 = icmp ne i32 %rcc.tmp.117, %rcc.tmp.118
  br i1 %rcc.tmp.119, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.121 = load i32, ptr %queue_rear
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [200 x i32], ptr %queue, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %current_node
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.127 = getelementptr [200 x i32], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %rcc.tmp.123
  %rcc.tmp.130 = load i32, ptr %queue_rear
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %queue_rear
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.135 = load i32, ptr %processed_in_level
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 1
  store i32 %rcc.tmp.136, ptr %processed_in_level
  br label %while.cond.2
while.end.2:
  %rcc.tmp.139 = load i32, ptr %level_sum
  %rcc.tmp.140 = load i32, ptr %level_contribution
  %rcc.tmp.141 = load i32, ptr %current_level
  %rcc.tmp.142 = mul i32 %rcc.tmp.140, %rcc.tmp.141
  %rcc.tmp.143 = add i32 %rcc.tmp.139, %rcc.tmp.142
  store i32 %rcc.tmp.143, ptr %level_sum
  %rcc.tmp.145 = load i32, ptr %current_level
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %current_level
  br label %while.cond
while.end:
  %rcc.tmp.149 = load i32, ptr %level_sum
  ret i32 %rcc.tmp.149
}
define i32 @compute_diagonal_traversal_sum.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %diagonal_level.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %diagonal_level..tmp = alloca i32 
  %round..tmp = alloca i32 
  %current_contribution = alloca i32 
  %left_diagonal = alloca i32 
  %right_diagonal = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %diagonal_level.tmp, ptr %diagonal_level..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.10 = load i32, ptr %node..tmp
  %rcc.tmp.11 = sub i32 0, 1
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %node..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %diagonal_level..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = mul i32 %rcc.tmp.20, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %node..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.27 = getelementptr [200 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %round..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = mul i32 %rcc.tmp.28, %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.23, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %current_contribution
  %rcc.tmp.34 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.36 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.39 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.40 = load i32, ptr %node..tmp
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.43 = getelementptr [200 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %diagonal_level..tmp
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = load i32, ptr %round..tmp
  %rcc.tmp.48 = call i32 @compute_diagonal_traversal_sum.([200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, [200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, [200 x i32]* %rcc.tmp.39, i32 %rcc.tmp.44, i32 %rcc.tmp.46, i32 %rcc.tmp.47)
  store i32 %rcc.tmp.48, ptr %left_diagonal
  %rcc.tmp.50 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.55 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.56 = load i32, ptr %node..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %diagonal_level..tmp
  %rcc.tmp.62 = load i32, ptr %round..tmp
  %rcc.tmp.63 = call i32 @compute_diagonal_traversal_sum.([200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, [200 x i32]* %rcc.tmp.55, i32 %rcc.tmp.60, i32 %rcc.tmp.61, i32 %rcc.tmp.62)
  store i32 %rcc.tmp.63, ptr %right_diagonal
  %rcc.tmp.65 = load i32, ptr %current_contribution
  %rcc.tmp.66 = load i32, ptr %left_diagonal
  %rcc.tmp.67 = add i32 %rcc.tmp.65, %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %right_diagonal
  %rcc.tmp.69 = add i32 %rcc.tmp.67, %rcc.tmp.68
  ret i32 %rcc.tmp.69
}
define i32 @compute_complex_tree_properties.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %fibonacci_sum = alloca i32 
  %prime_factor_sum = alloca i32 
  %recursive_depth_product = alloca i32 
  %mathematical_complexity = alloca i32 
  %nested_loop_computation = alloca i32 
  %final_result = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.10 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.11 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.12 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.13 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.14 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.15 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.16 = load i32, ptr %root..tmp
  %rcc.tmp.17 = load i32, ptr %round..tmp
  %rcc.tmp.18 = call i32 @compute_fibonacci_sum_for_nodes.([200 x i32]* %rcc.tmp.10, [200 x i32]* %rcc.tmp.11, [200 x i32]* %rcc.tmp.12, [200 x i32]* %rcc.tmp.13, [200 x i32]* %rcc.tmp.14, [200 x i32]* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %fibonacci_sum
  %rcc.tmp.20 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.21 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.22 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.23 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.24 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.25 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.26 = load i32, ptr %root..tmp
  %rcc.tmp.27 = load i32, ptr %node_count..tmp
  %rcc.tmp.28 = call i32 @compute_prime_factor_analysis.([200 x i32]* %rcc.tmp.20, [200 x i32]* %rcc.tmp.21, [200 x i32]* %rcc.tmp.22, [200 x i32]* %rcc.tmp.23, [200 x i32]* %rcc.tmp.24, [200 x i32]* %rcc.tmp.25, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  store i32 %rcc.tmp.28, ptr %prime_factor_sum
  %rcc.tmp.30 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.36 = load i32, ptr %root..tmp
  %rcc.tmp.37 = load i32, ptr %round..tmp
  %rcc.tmp.38 = call i32 @compute_recursive_depth_product.([200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, i32 %rcc.tmp.36, i32 1, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %recursive_depth_product
  %rcc.tmp.40 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.42 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.45 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.46 = load i32, ptr %root..tmp
  %rcc.tmp.47 = load i32, ptr %round..tmp
  %rcc.tmp.48 = call i32 @perform_mathematical_sequence_analysis.([200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, [200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, [200 x i32]* %rcc.tmp.45, i32 %rcc.tmp.46, i32 %rcc.tmp.47)
  store i32 %rcc.tmp.48, ptr %mathematical_complexity
  %rcc.tmp.50 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.55 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.56 = load i32, ptr %root..tmp
  %rcc.tmp.57 = load i32, ptr %node_count..tmp
  %rcc.tmp.58 = load i32, ptr %round..tmp
  %rcc.tmp.59 = call i32 @perform_nested_loop_computation_on_tree.([200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, [200 x i32]* %rcc.tmp.55, i32 %rcc.tmp.56, i32 %rcc.tmp.57, i32 %rcc.tmp.58)
  store i32 %rcc.tmp.59, ptr %nested_loop_computation
  %rcc.tmp.61 = load i32, ptr %fibonacci_sum
  %rcc.tmp.62 = mul i32 %rcc.tmp.61, 7
  %rcc.tmp.63 = load i32, ptr %prime_factor_sum
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 11
  %rcc.tmp.65 = add i32 %rcc.tmp.62, %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %recursive_depth_product
  %rcc.tmp.67 = mul i32 %rcc.tmp.66, 13
  %rcc.tmp.68 = add i32 %rcc.tmp.65, %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %mathematical_complexity
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 17
  %rcc.tmp.71 = add i32 %rcc.tmp.68, %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %nested_loop_computation
  %rcc.tmp.73 = mul i32 %rcc.tmp.72, 19
  %rcc.tmp.74 = add i32 %rcc.tmp.71, %rcc.tmp.73
  %rcc.tmp.75 = srem i32 %rcc.tmp.74, 1000000
  store i32 %rcc.tmp.75, ptr %final_result
  %rcc.tmp.77 = load i32, ptr %final_result
  ret i32 %rcc.tmp.77
}
define i32 @compute_fibonacci_sum_for_nodes.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %round..tmp = alloca i32 
  %node_fibonacci = alloca i32 
  %left_fibonacci = alloca i32 
  %right_fibonacci = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 20
  %rcc.tmp.21 = load i32, ptr %round..tmp
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 5
  %rcc.tmp.23 = add i32 %rcc.tmp.20, %rcc.tmp.22
  %rcc.tmp.24 = call i32 @compute_fibonacci_iterative.(i32 %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %node_fibonacci
  %rcc.tmp.26 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.32 = load i32, ptr %node..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.35 = getelementptr [200 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %round..tmp
  %rcc.tmp.38 = call i32 @compute_fibonacci_sum_for_nodes.([200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %left_fibonacci
  %rcc.tmp.40 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.42 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.45 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.46 = load i32, ptr %node..tmp
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.49 = getelementptr [200 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %round..tmp
  %rcc.tmp.52 = call i32 @compute_fibonacci_sum_for_nodes.([200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, [200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, [200 x i32]* %rcc.tmp.45, i32 %rcc.tmp.50, i32 %rcc.tmp.51)
  store i32 %rcc.tmp.52, ptr %right_fibonacci
  %rcc.tmp.54 = load i32, ptr %node_fibonacci
  %rcc.tmp.55 = load i32, ptr %left_fibonacci
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %right_fibonacci
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  ret i32 %rcc.tmp.58
}
define i32 @compute_fibonacci_iterative.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %a = alloca i32 
  %b = alloca i32 
  %i = alloca i32 
  %temp = alloca i32 
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
  store i32 0, ptr %a
  store i32 1, ptr %b
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
  %rcc.tmp.17 = load i32, ptr %a
  %rcc.tmp.18 = load i32, ptr %b
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %temp
  %rcc.tmp.21 = load i32, ptr %b
  store i32 %rcc.tmp.21, ptr %a
  %rcc.tmp.23 = load i32, ptr %temp
  store i32 %rcc.tmp.23, ptr %b
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %b
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 10000
  ret i32 %rcc.tmp.30
}
define i32 @compute_prime_factor_analysis.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %prime_factors = alloca i32 
  %height_prime_factors = alloca i32 
  %size_prime_factors = alloca i32 
  %current_contribution = alloca i32 
  %left_contribution = alloca i32 
  %right_contribution = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = call i32 @abs.(i32 %rcc.tmp.19)
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = call i32 @count_prime_factors.(i32 %rcc.tmp.21)
  store i32 %rcc.tmp.22, ptr %prime_factors
  %rcc.tmp.24 = load i32, ptr %node..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.27 = getelementptr [200 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = call i32 @count_prime_factors.(i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %height_prime_factors
  %rcc.tmp.32 = load i32, ptr %node..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.35 = getelementptr [200 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  %rcc.tmp.38 = call i32 @count_prime_factors.(i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %size_prime_factors
  %rcc.tmp.40 = load i32, ptr %prime_factors
  %rcc.tmp.41 = mul i32 %rcc.tmp.40, 5
  %rcc.tmp.42 = load i32, ptr %height_prime_factors
  %rcc.tmp.43 = mul i32 %rcc.tmp.42, 3
  %rcc.tmp.44 = add i32 %rcc.tmp.41, %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %size_prime_factors
  %rcc.tmp.46 = mul i32 %rcc.tmp.45, 7
  %rcc.tmp.47 = add i32 %rcc.tmp.44, %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %current_contribution
  %rcc.tmp.49 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.55 = load i32, ptr %node..tmp
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.58 = getelementptr [200 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %node_count..tmp
  %rcc.tmp.61 = call i32 @compute_prime_factor_analysis.([200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, i32 %rcc.tmp.59, i32 %rcc.tmp.60)
  store i32 %rcc.tmp.61, ptr %left_contribution
  %rcc.tmp.63 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.64 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.65 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.66 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.67 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.68 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.69 = load i32, ptr %node..tmp
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.72 = getelementptr [200 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %node_count..tmp
  %rcc.tmp.75 = call i32 @compute_prime_factor_analysis.([200 x i32]* %rcc.tmp.63, [200 x i32]* %rcc.tmp.64, [200 x i32]* %rcc.tmp.65, [200 x i32]* %rcc.tmp.66, [200 x i32]* %rcc.tmp.67, [200 x i32]* %rcc.tmp.68, i32 %rcc.tmp.73, i32 %rcc.tmp.74)
  store i32 %rcc.tmp.75, ptr %right_contribution
  %rcc.tmp.77 = load i32, ptr %current_contribution
  %rcc.tmp.78 = load i32, ptr %left_contribution
  %rcc.tmp.79 = add i32 %rcc.tmp.77, %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %right_contribution
  %rcc.tmp.81 = add i32 %rcc.tmp.79, %rcc.tmp.80
  ret i32 %rcc.tmp.81
}
define i32 @count_prime_factors.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %num = alloca i32 
  %count = alloca i32 
  %factor = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.2, ptr %num
  store i32 0, ptr %count
  store i32 2, ptr %factor
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %factor
  %rcc.tmp.8 = load i32, ptr %factor
  %rcc.tmp.9 = mul i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = load i32, ptr %num
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.15 = load i32, ptr %num
  %rcc.tmp.16 = load i32, ptr %factor
  %rcc.tmp.17 = srem i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load i32, ptr %count
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %count
  %rcc.tmp.24 = load i32, ptr %num
  %rcc.tmp.25 = load i32, ptr %factor
  %rcc.tmp.26 = sdiv i32 %rcc.tmp.24, %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %num
  br label %while.cond.2
while.end.2:
  %rcc.tmp.29 = load i32, ptr %factor
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %factor
  br label %while.cond
while.end:
  %rcc.tmp.33 = load i32, ptr %num
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.33, 1
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %count
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.41 = load i32, ptr %count
  ret i32 %rcc.tmp.41
}
define i32 @compute_recursive_depth_product.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %depth.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %depth..tmp = alloca i32 
  %round..tmp = alloca i32 
  %current_factor = alloca i32 
  %left_product = alloca i32 
  %right_product = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.10 = load i32, ptr %node..tmp
  %rcc.tmp.11 = sub i32 0, 1
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %node..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.19 = getelementptr [200 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 10
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = load i32, ptr %depth..tmp
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 5
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = mul i32 %rcc.tmp.22, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %round..tmp
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 3
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = add i32 %rcc.tmp.26, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %current_factor
  %rcc.tmp.32 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.36 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.38 = load i32, ptr %node..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.41 = getelementptr [200 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %depth..tmp
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  %rcc.tmp.45 = load i32, ptr %round..tmp
  %rcc.tmp.46 = call i32 @compute_recursive_depth_product.([200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, [200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, i32 %rcc.tmp.42, i32 %rcc.tmp.44, i32 %rcc.tmp.45)
  store i32 %rcc.tmp.46, ptr %left_product
  %rcc.tmp.48 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.54 = load i32, ptr %node..tmp
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.57 = getelementptr [200 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %depth..tmp
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  %rcc.tmp.61 = load i32, ptr %round..tmp
  %rcc.tmp.62 = call i32 @compute_recursive_depth_product.([200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, i32 %rcc.tmp.58, i32 %rcc.tmp.60, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %right_product
  %rcc.tmp.64 = load i32, ptr %current_factor
  %rcc.tmp.65 = load i32, ptr %left_product
  %rcc.tmp.66 = mul i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = srem i32 %rcc.tmp.66, 10000
  %rcc.tmp.68 = load i32, ptr %right_product
  %rcc.tmp.69 = mul i32 %rcc.tmp.67, %rcc.tmp.68
  %rcc.tmp.70 = srem i32 %rcc.tmp.69, 10000
  %rcc.tmp.71 = srem i32 %rcc.tmp.70, 100000
  ret i32 %rcc.tmp.71
}
define i32 @perform_mathematical_sequence_analysis.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %round..tmp = alloca i32 
  %arithmetic_sequence = alloca i32 
  %geometric_sequence = alloca i32 
  %quadratic_sequence = alloca i32 
  %left_analysis = alloca i32 
  %right_analysis = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %node..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.23 = getelementptr [200 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %node..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.28 = getelementptr [200 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = call i32 @compute_arithmetic_sequence_sum.(i32 %rcc.tmp.19, i32 %rcc.tmp.24, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %arithmetic_sequence
  %rcc.tmp.32 = load i32, ptr %node..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.35 = getelementptr [200 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 5
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = load i32, ptr %node..tmp
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.42 = getelementptr [200 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = srem i32 %rcc.tmp.43, 3
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = load i32, ptr %round..tmp
  %rcc.tmp.47 = srem i32 %rcc.tmp.46, 7
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 3
  %rcc.tmp.49 = call i32 @compute_geometric_sequence_sum.(i32 %rcc.tmp.38, i32 %rcc.tmp.45, i32 %rcc.tmp.48)
  store i32 %rcc.tmp.49, ptr %geometric_sequence
  %rcc.tmp.51 = load i32, ptr %node..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.54 = getelementptr [200 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %node..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.59 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %round..tmp
  %rcc.tmp.62 = call i32 @compute_quadratic_sequence_sum.(i32 %rcc.tmp.55, i32 %rcc.tmp.60, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %quadratic_sequence
  %rcc.tmp.64 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.65 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.66 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.67 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.68 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.69 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.70 = load i32, ptr %node..tmp
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.73 = getelementptr [200 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %round..tmp
  %rcc.tmp.76 = call i32 @perform_mathematical_sequence_analysis.([200 x i32]* %rcc.tmp.64, [200 x i32]* %rcc.tmp.65, [200 x i32]* %rcc.tmp.66, [200 x i32]* %rcc.tmp.67, [200 x i32]* %rcc.tmp.68, [200 x i32]* %rcc.tmp.69, i32 %rcc.tmp.74, i32 %rcc.tmp.75)
  store i32 %rcc.tmp.76, ptr %left_analysis
  %rcc.tmp.78 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.79 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.80 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.81 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.82 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.83 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.84 = load i32, ptr %node..tmp
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.87 = getelementptr [200 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %round..tmp
  %rcc.tmp.90 = call i32 @perform_mathematical_sequence_analysis.([200 x i32]* %rcc.tmp.78, [200 x i32]* %rcc.tmp.79, [200 x i32]* %rcc.tmp.80, [200 x i32]* %rcc.tmp.81, [200 x i32]* %rcc.tmp.82, [200 x i32]* %rcc.tmp.83, i32 %rcc.tmp.88, i32 %rcc.tmp.89)
  store i32 %rcc.tmp.90, ptr %right_analysis
  %rcc.tmp.92 = load i32, ptr %arithmetic_sequence
  %rcc.tmp.93 = load i32, ptr %geometric_sequence
  %rcc.tmp.94 = add i32 %rcc.tmp.92, %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %quadratic_sequence
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %left_analysis
  %rcc.tmp.98 = add i32 %rcc.tmp.96, %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %right_analysis
  %rcc.tmp.100 = add i32 %rcc.tmp.98, %rcc.tmp.99
  ret i32 %rcc.tmp.100
}
define i32 @compute_arithmetic_sequence_sum.(i32 %first_term.tmp, i32 %common_diff.tmp, i32 %num_terms.tmp) {
entry:
  %first_term..tmp = alloca i32 
  %common_diff..tmp = alloca i32 
  %num_terms..tmp = alloca i32 
  %terms = alloca i32 
  %a = alloca i32 
  %d = alloca i32 
  %sum = alloca i32 
  store i32 %first_term.tmp, ptr %first_term..tmp
  store i32 %common_diff.tmp, ptr %common_diff..tmp
  store i32 %num_terms.tmp, ptr %num_terms..tmp
  %rcc.tmp.4 = load i32, ptr %num_terms..tmp
  %rcc.tmp.5 = call i32 @abs.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @min.(i32 %rcc.tmp.5, i32 20)
  store i32 %rcc.tmp.6, ptr %terms
  %rcc.tmp.8 = load i32, ptr %first_term..tmp
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 100
  store i32 %rcc.tmp.9, ptr %a
  %rcc.tmp.11 = load i32, ptr %common_diff..tmp
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 10
  store i32 %rcc.tmp.12, ptr %d
  %rcc.tmp.14 = load i32, ptr %terms
  %rcc.tmp.15 = load i32, ptr %a
  %rcc.tmp.16 = mul i32 2, %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %terms
  %rcc.tmp.18 = sub i32 %rcc.tmp.17, 1
  %rcc.tmp.19 = load i32, ptr %d
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.16, %rcc.tmp.20
  %rcc.tmp.22 = mul i32 %rcc.tmp.14, %rcc.tmp.21
  %rcc.tmp.23 = sdiv i32 %rcc.tmp.22, 2
  store i32 %rcc.tmp.23, ptr %sum
  %rcc.tmp.25 = load i32, ptr %sum
  %rcc.tmp.26 = call i32 @abs.(i32 %rcc.tmp.25)
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 10000
  ret i32 %rcc.tmp.27
}
define i32 @compute_geometric_sequence_sum.(i32 %first_term.tmp, i32 %ratio.tmp, i32 %num_terms.tmp) {
entry:
  %first_term..tmp = alloca i32 
  %ratio..tmp = alloca i32 
  %num_terms..tmp = alloca i32 
  %terms = alloca i32 
  %a = alloca i32 
  %r = alloca i32 
  %sum = alloca i32 
  %current_term = alloca i32 
  %i = alloca i32 
  store i32 %first_term.tmp, ptr %first_term..tmp
  store i32 %ratio.tmp, ptr %ratio..tmp
  store i32 %num_terms.tmp, ptr %num_terms..tmp
  %rcc.tmp.4 = load i32, ptr %num_terms..tmp
  %rcc.tmp.5 = call i32 @abs.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @min.(i32 %rcc.tmp.5, i32 15)
  store i32 %rcc.tmp.6, ptr %terms
  %rcc.tmp.8 = load i32, ptr %first_term..tmp
  %rcc.tmp.9 = call i32 @abs.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 10
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.11, ptr %a
  %rcc.tmp.13 = load i32, ptr %ratio..tmp
  %rcc.tmp.14 = call i32 @abs.(i32 %rcc.tmp.13)
  %rcc.tmp.15 = srem i32 %rcc.tmp.14, 3
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %r
  %rcc.tmp.18 = load i32, ptr %r
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 1
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %a
  %rcc.tmp.22 = load i32, ptr %terms
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 10000
  ret i32 %rcc.tmp.24
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %sum
  %rcc.tmp.28 = load i32, ptr %a
  store i32 %rcc.tmp.28, ptr %current_term
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %terms
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.37 = load i32, ptr %sum
  %rcc.tmp.38 = load i32, ptr %current_term
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = srem i32 %rcc.tmp.39, 10000
  store i32 %rcc.tmp.40, ptr %sum
  %rcc.tmp.42 = load i32, ptr %current_term
  %rcc.tmp.43 = load i32, ptr %r
  %rcc.tmp.44 = mul i32 %rcc.tmp.42, %rcc.tmp.43
  %rcc.tmp.45 = srem i32 %rcc.tmp.44, 1000
  store i32 %rcc.tmp.45, ptr %current_term
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.51 = load i32, ptr %sum
  ret i32 %rcc.tmp.51
}
define i32 @compute_quadratic_sequence_sum.(i32 %base.tmp, i32 %multiplier.tmp, i32 %rounds.tmp) {
entry:
  %base..tmp = alloca i32 
  %multiplier..tmp = alloca i32 
  %rounds..tmp = alloca i32 
  %terms = alloca i32 
  %a = alloca i32 
  %b = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  %term_value = alloca i32 
  store i32 %base.tmp, ptr %base..tmp
  store i32 %multiplier.tmp, ptr %multiplier..tmp
  store i32 %rounds.tmp, ptr %rounds..tmp
  %rcc.tmp.4 = load i32, ptr %rounds..tmp
  %rcc.tmp.5 = call i32 @abs.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @min.(i32 %rcc.tmp.5, i32 25)
  store i32 %rcc.tmp.6, ptr %terms
  %rcc.tmp.8 = load i32, ptr %base..tmp
  %rcc.tmp.9 = call i32 @abs.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 10
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.11, ptr %a
  %rcc.tmp.13 = load i32, ptr %multiplier..tmp
  %rcc.tmp.14 = call i32 @abs.(i32 %rcc.tmp.13)
  %rcc.tmp.15 = srem i32 %rcc.tmp.14, 5
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %b
  store i32 0, ptr %sum
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %terms
  %rcc.tmp.23 = icmp sle i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load i32, ptr %a
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = mul i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %b
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = mul i32 %rcc.tmp.31, %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.30, %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %rounds..tmp
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 7
  %rcc.tmp.37 = add i32 %rcc.tmp.34, %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %term_value
  %rcc.tmp.39 = load i32, ptr %sum
  %rcc.tmp.40 = load i32, ptr %term_value
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = srem i32 %rcc.tmp.41, 10000
  store i32 %rcc.tmp.42, ptr %sum
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.48 = load i32, ptr %sum
  ret i32 %rcc.tmp.48
}
define i32 @perform_nested_loop_computation_on_tree.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %total_computation = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %computation_value = alloca i32 
  %inner_nested_computation = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %total_computation
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %node_count..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.24 = getelementptr [200 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = call i32 @min.(i32 %rcc.tmp.25, i32 15)
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.20, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.32 = load i32, ptr %k
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.36 = getelementptr [200 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = call i32 @min.(i32 %rcc.tmp.37, i32 8)
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.45 = getelementptr [200 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = mul i32 %rcc.tmp.46, %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %k
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  %rcc.tmp.52 = mul i32 %rcc.tmp.49, %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %round..tmp
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  %rcc.tmp.56 = mul i32 %rcc.tmp.53, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.52, %rcc.tmp.56
  %rcc.tmp.58 = srem i32 %rcc.tmp.57, 1000
  store i32 %rcc.tmp.58, ptr %computation_value
  %rcc.tmp.60 = load i32, ptr %total_computation
  %rcc.tmp.61 = load i32, ptr %computation_value
  %rcc.tmp.62 = add i32 %rcc.tmp.60, %rcc.tmp.61
  %rcc.tmp.63 = srem i32 %rcc.tmp.62, 100000
  store i32 %rcc.tmp.63, ptr %total_computation
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.68 = getelementptr [200 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = load i32, ptr %k
  %rcc.tmp.72 = load i32, ptr %round..tmp
  %rcc.tmp.73 = call i32 @perform_inner_nested_computation.(i32 %rcc.tmp.69, i32 %rcc.tmp.70, i32 %rcc.tmp.71, i32 %rcc.tmp.72)
  store i32 %rcc.tmp.73, ptr %inner_nested_computation
  %rcc.tmp.75 = load i32, ptr %total_computation
  %rcc.tmp.76 = load i32, ptr %inner_nested_computation
  %rcc.tmp.77 = add i32 %rcc.tmp.75, %rcc.tmp.76
  %rcc.tmp.78 = srem i32 %rcc.tmp.77, 100000
  store i32 %rcc.tmp.78, ptr %total_computation
  %rcc.tmp.80 = load i32, ptr %k
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.84 = load i32, ptr %j
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.92 = load i32, ptr %total_computation
  ret i32 %rcc.tmp.92
}
define i32 @perform_inner_nested_computation.(i32 %node_value.tmp, i32 %outer_index.tmp, i32 %inner_index.tmp, i32 %round.tmp) {
entry:
  %node_value..tmp = alloca i32 
  %outer_index..tmp = alloca i32 
  %inner_index..tmp = alloca i32 
  %round..tmp = alloca i32 
  %computation = alloca i32 
  %base_value = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %z = alloca i32 
  %term = alloca i32 
  store i32 %node_value.tmp, ptr %node_value..tmp
  store i32 %outer_index.tmp, ptr %outer_index..tmp
  store i32 %inner_index.tmp, ptr %inner_index..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %computation
  %rcc.tmp.6 = load i32, ptr %node_value..tmp
  %rcc.tmp.7 = call i32 @abs.(i32 %rcc.tmp.6)
  %rcc.tmp.8 = srem i32 %rcc.tmp.7, 50
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %base_value
  store i32 1, ptr %x
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %x
  %rcc.tmp.14 = load i32, ptr %outer_index..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  %rcc.tmp.16 = call i32 @min.(i32 %rcc.tmp.15, i32 5)
  %rcc.tmp.17 = icmp sle i32 %rcc.tmp.13, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %y
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.22 = load i32, ptr %y
  %rcc.tmp.23 = load i32, ptr %inner_index..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = call i32 @min.(i32 %rcc.tmp.24, i32 4)
  %rcc.tmp.26 = icmp sle i32 %rcc.tmp.22, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 1, ptr %z
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.31 = load i32, ptr %z
  %rcc.tmp.32 = load i32, ptr %round..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  %rcc.tmp.34 = call i32 @min.(i32 %rcc.tmp.33, i32 3)
  %rcc.tmp.35 = icmp sle i32 %rcc.tmp.31, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.38 = load i32, ptr %base_value
  %rcc.tmp.39 = load i32, ptr %x
  %rcc.tmp.40 = mul i32 %rcc.tmp.38, %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %y
  %rcc.tmp.42 = mul i32 %rcc.tmp.40, %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %z
  %rcc.tmp.44 = mul i32 %rcc.tmp.42, %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %x
  %rcc.tmp.46 = load i32, ptr %x
  %rcc.tmp.47 = mul i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.44, %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %y
  %rcc.tmp.50 = load i32, ptr %y
  %rcc.tmp.51 = mul i32 %rcc.tmp.49, %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.48, %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %z
  %rcc.tmp.54 = load i32, ptr %z
  %rcc.tmp.55 = mul i32 %rcc.tmp.53, %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.52, %rcc.tmp.55
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 1000
  store i32 %rcc.tmp.57, ptr %term
  %rcc.tmp.59 = load i32, ptr %computation
  %rcc.tmp.60 = load i32, ptr %term
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = srem i32 %rcc.tmp.61, 10000
  store i32 %rcc.tmp.62, ptr %computation
  %rcc.tmp.64 = load i32, ptr %z
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %z
  br label %while.cond.3
while.end.3:
  %rcc.tmp.68 = load i32, ptr %y
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %y
  br label %while.cond.2
while.end.2:
  %rcc.tmp.72 = load i32, ptr %x
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %x
  br label %while.cond
while.end:
  %rcc.tmp.76 = load i32, ptr %computation
  ret i32 %rcc.tmp.76
}
define i32 @validate_tree_integrity.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %structure_validation = alloca i32 
  %property_validation = alloca i32 
  %consistency_validation = alloca i32 
  %edge_case_validation = alloca i32 
  %final_integrity_score = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.9 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.10 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.11 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.12 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.13 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.14 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.15 = load i32, ptr %root..tmp
  %rcc.tmp.16 = sub i32 0, 1
  %rcc.tmp.17 = call i32 @validate_tree_structure_recursive.([200 x i32]* %rcc.tmp.9, [200 x i32]* %rcc.tmp.10, [200 x i32]* %rcc.tmp.11, [200 x i32]* %rcc.tmp.12, [200 x i32]* %rcc.tmp.13, [200 x i32]* %rcc.tmp.14, i32 %rcc.tmp.15, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %structure_validation
  %rcc.tmp.19 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.20 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.21 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.22 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.23 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.24 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.25 = load i32, ptr %root..tmp
  %rcc.tmp.26 = load i32, ptr %node_count..tmp
  %rcc.tmp.27 = call i32 @validate_tree_properties_comprehensive.([200 x i32]* %rcc.tmp.19, [200 x i32]* %rcc.tmp.20, [200 x i32]* %rcc.tmp.21, [200 x i32]* %rcc.tmp.22, [200 x i32]* %rcc.tmp.23, [200 x i32]* %rcc.tmp.24, i32 %rcc.tmp.25, i32 %rcc.tmp.26)
  store i32 %rcc.tmp.27, ptr %property_validation
  %rcc.tmp.29 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.35 = load i32, ptr %root..tmp
  %rcc.tmp.36 = load i32, ptr %node_count..tmp
  %rcc.tmp.37 = call i32 @validate_tree_consistency_checks.([200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, i32 %rcc.tmp.35, i32 %rcc.tmp.36)
  store i32 %rcc.tmp.37, ptr %consistency_validation
  %rcc.tmp.39 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.40 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.42 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.45 = load i32, ptr %root..tmp
  %rcc.tmp.46 = load i32, ptr %node_count..tmp
  %rcc.tmp.47 = call i32 @validate_edge_cases_and_boundaries.([200 x i32]* %rcc.tmp.39, [200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, [200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, i32 %rcc.tmp.45, i32 %rcc.tmp.46)
  store i32 %rcc.tmp.47, ptr %edge_case_validation
  %rcc.tmp.49 = load i32, ptr %structure_validation
  %rcc.tmp.50 = mul i32 %rcc.tmp.49, 13
  %rcc.tmp.51 = load i32, ptr %property_validation
  %rcc.tmp.52 = mul i32 %rcc.tmp.51, 17
  %rcc.tmp.53 = add i32 %rcc.tmp.50, %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %consistency_validation
  %rcc.tmp.55 = mul i32 %rcc.tmp.54, 19
  %rcc.tmp.56 = add i32 %rcc.tmp.53, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %edge_case_validation
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 23
  %rcc.tmp.59 = add i32 %rcc.tmp.56, %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %final_integrity_score
  %rcc.tmp.61 = load i32, ptr %final_integrity_score
  %rcc.tmp.62 = srem i32 %rcc.tmp.61, 1000000
  ret i32 %rcc.tmp.62
}
define i32 @validate_tree_structure_recursive.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %expected_parent.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %expected_parent..tmp = alloca i32 
  %left_validation = alloca i32 
  %right_validation = alloca i32 
  %bst_property = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %expected_parent.tmp, ptr %expected_parent..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %expected_parent..tmp
  %rcc.tmp.21 = icmp ne i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.25 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.26 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.31 = load i32, ptr %node..tmp
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.34 = getelementptr [200 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %node..tmp
  %rcc.tmp.37 = call i32 @validate_tree_structure_recursive.([200 x i32]* %rcc.tmp.25, [200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, i32 %rcc.tmp.35, i32 %rcc.tmp.36)
  store i32 %rcc.tmp.37, ptr %left_validation
  %rcc.tmp.39 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.40 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.42 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.45 = load i32, ptr %node..tmp
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.48 = getelementptr [200 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %node..tmp
  %rcc.tmp.51 = call i32 @validate_tree_structure_recursive.([200 x i32]* %rcc.tmp.39, [200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, [200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, i32 %rcc.tmp.49, i32 %rcc.tmp.50)
  store i32 %rcc.tmp.51, ptr %right_validation
  %rcc.tmp.53 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.55 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.56 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.57 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.58 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.59 = load i32, ptr %node..tmp
  %rcc.tmp.60 = call i32 @validate_bst_property_at_node.([200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, [200 x i32]* %rcc.tmp.55, [200 x i32]* %rcc.tmp.56, [200 x i32]* %rcc.tmp.57, [200 x i32]* %rcc.tmp.58, i32 %rcc.tmp.59)
  store i32 %rcc.tmp.60, ptr %bst_property
  %rcc.tmp.62 = load i32, ptr %left_validation
  %rcc.tmp.63 = load i32, ptr %right_validation
  %rcc.tmp.64 = mul i32 %rcc.tmp.62, %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %bst_property
  %rcc.tmp.66 = mul i32 %rcc.tmp.64, %rcc.tmp.65
  ret i32 %rcc.tmp.66
}
define i32 @validate_bst_property_at_node.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_max = alloca i32 
  %right_min = alloca i32 
  %left_valid = alloca i1 
  %right_valid = alloca i1 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.15 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.16 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.17 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.18 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.19 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.20 = load i32, ptr %node..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.23 = getelementptr [200 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = call i32 @find_maximum_in_subtree.([200 x i32]* %rcc.tmp.14, [200 x i32]* %rcc.tmp.15, [200 x i32]* %rcc.tmp.16, [200 x i32]* %rcc.tmp.17, [200 x i32]* %rcc.tmp.18, [200 x i32]* %rcc.tmp.19, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %left_max
  %rcc.tmp.27 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.33 = load i32, ptr %node..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.36 = getelementptr [200 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = call i32 @find_minimum_in_subtree.([200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %right_min
  %rcc.tmp.40 = load i32, ptr %node..tmp
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.43 = getelementptr [200 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = sub i32 0, 1
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.48 = load i32, ptr %left_max
  %rcc.tmp.49 = load i32, ptr %node..tmp
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.52 = getelementptr [200 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.53
  br label %sc.merge
sc.merge:
  %rcc.tmp.56 = phi i1 [1, %if.merge], [%rcc.tmp.54, %or.rhs]
  store i1 %rcc.tmp.56, ptr %left_valid
  %rcc.tmp.58 = load i32, ptr %node..tmp
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.61 = getelementptr [200 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = sub i32 0, 1
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.66 = load i32, ptr %right_min
  %rcc.tmp.67 = load i32, ptr %node..tmp
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.70 = getelementptr [200 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = icmp sgt i32 %rcc.tmp.66, %rcc.tmp.71
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.74 = phi i1 [1, %sc.merge], [%rcc.tmp.72, %or.rhs.2]
  store i1 %rcc.tmp.74, ptr %right_valid
  %rcc.tmp.76 = load i1, ptr %left_valid
  br i1 %rcc.tmp.76, label %and.rhs, label %sc.merge.3
and.rhs:
  %rcc.tmp.78 = load i1, ptr %right_valid
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.80 = phi i1 [0, %sc.merge.2], [%rcc.tmp.78, %and.rhs]
  br i1 %rcc.tmp.80, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.84 = phi i32 [1, %if.then.2], [0, %if.else.2]
  ret i32 %rcc.tmp.84
}
define i32 @find_maximum_in_subtree.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %current = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = sub i32 0, 100000
  ret i32 %rcc.tmp.12
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.15, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %current
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.21 = getelementptr [200 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = sub i32 0, 1
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load i32, ptr %current
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.34 = load i32, ptr %current
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.37 = getelementptr [200 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  ret i32 %rcc.tmp.38
}
define i32 @find_minimum_in_subtree.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %current = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 100000
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  store i32 %rcc.tmp.14, ptr %current
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %current
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.20 = getelementptr [200 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = sub i32 0, 1
  %rcc.tmp.23 = icmp ne i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load i32, ptr %current
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.29 = getelementptr [200 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %current
  br label %while.cond
while.end:
  %rcc.tmp.33 = load i32, ptr %current
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.36 = getelementptr [200 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  ret i32 %rcc.tmp.37
}
define i32 @validate_tree_properties_comprehensive.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %validation_score = alloca i32 
  %i = alloca i32 
  %expected_height = alloca i32 
  %expected_size = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %validation_score
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %node_count..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.18 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.19 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.20 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.21 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.22 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = call i32 @compute_expected_height.([200 x i32]* %rcc.tmp.17, [200 x i32]* %rcc.tmp.18, [200 x i32]* %rcc.tmp.19, [200 x i32]* %rcc.tmp.20, [200 x i32]* %rcc.tmp.21, [200 x i32]* %rcc.tmp.22, i32 %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %expected_height
  %rcc.tmp.26 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = call i32 @compute_expected_subtree_size.([200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %expected_size
  %rcc.tmp.35 = load i32, ptr %expected_height
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.39 = getelementptr [200 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.35, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then, label %if.else
if.then:
  %rcc.tmp.43 = load i32, ptr %validation_score
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 10
  store i32 %rcc.tmp.44, ptr %validation_score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %expected_size
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.52 = getelementptr [200 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.48, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.56 = load i32, ptr %validation_score
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 15
  store i32 %rcc.tmp.57, ptr %validation_score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.65 = load i32, ptr %validation_score
  ret i32 %rcc.tmp.65
}
define i32 @compute_expected_height.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.23 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.24 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.25 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.26 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.29 = load i32, ptr %node..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = call i32 @compute_expected_height.([200 x i32]* %rcc.tmp.23, [200 x i32]* %rcc.tmp.24, [200 x i32]* %rcc.tmp.25, [200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, i32 %rcc.tmp.33)
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.36 = phi i32 [0, %if.then.2], [%rcc.tmp.34, %if.else.2]
  store i32 %rcc.tmp.36, ptr %left_height
  %rcc.tmp.38 = load i32, ptr %node..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.41 = getelementptr [200 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = sub i32 0, 1
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.42, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.47 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.48 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.53 = load i32, ptr %node..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.56 = getelementptr [200 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = call i32 @compute_expected_height.([200 x i32]* %rcc.tmp.47, [200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, i32 %rcc.tmp.57)
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.60 = phi i32 [0, %if.then.3], [%rcc.tmp.58, %if.else.3]
  store i32 %rcc.tmp.60, ptr %right_height
  %rcc.tmp.62 = load i32, ptr %left_height
  %rcc.tmp.63 = load i32, ptr %right_height
  %rcc.tmp.64 = call i32 @max.(i32 %rcc.tmp.62, i32 %rcc.tmp.63)
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  ret i32 %rcc.tmp.65
}
define i32 @compute_expected_subtree_size.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_size = alloca i32 
  %right_size = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.23 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.24 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.25 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.26 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.27 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.29 = load i32, ptr %node..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.32 = getelementptr [200 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = call i32 @compute_expected_subtree_size.([200 x i32]* %rcc.tmp.23, [200 x i32]* %rcc.tmp.24, [200 x i32]* %rcc.tmp.25, [200 x i32]* %rcc.tmp.26, [200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, i32 %rcc.tmp.33)
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.36 = phi i32 [0, %if.then.2], [%rcc.tmp.34, %if.else.2]
  store i32 %rcc.tmp.36, ptr %left_size
  %rcc.tmp.38 = load i32, ptr %node..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.41 = getelementptr [200 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = sub i32 0, 1
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.42, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.47 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.48 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.53 = load i32, ptr %node..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.56 = getelementptr [200 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = call i32 @compute_expected_subtree_size.([200 x i32]* %rcc.tmp.47, [200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, i32 %rcc.tmp.57)
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.60 = phi i32 [0, %if.then.3], [%rcc.tmp.58, %if.else.3]
  store i32 %rcc.tmp.60, ptr %right_size
  %rcc.tmp.62 = load i32, ptr %left_size
  %rcc.tmp.63 = load i32, ptr %right_size
  %rcc.tmp.64 = add i32 %rcc.tmp.62, %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  ret i32 %rcc.tmp.65
}
define i32 @validate_tree_consistency_checks.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %consistency_score = alloca i32 
  %reachable_nodes = alloca i32 
  %cycle_check = alloca i32 
  %balance_consistency = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %consistency_score
  %rcc.tmp.10 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.11 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.12 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.13 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.14 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.15 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.16 = load i32, ptr %root..tmp
  %rcc.tmp.17 = call i32 @count_reachable_nodes_from_root.([200 x i32]* %rcc.tmp.10, [200 x i32]* %rcc.tmp.11, [200 x i32]* %rcc.tmp.12, [200 x i32]* %rcc.tmp.13, [200 x i32]* %rcc.tmp.14, [200 x i32]* %rcc.tmp.15, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %reachable_nodes
  %rcc.tmp.19 = load i32, ptr %reachable_nodes
  %rcc.tmp.20 = load i32, ptr %node_count..tmp
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load i32, ptr %consistency_score
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 100
  store i32 %rcc.tmp.24, ptr %consistency_score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.28 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.34 = load i32, ptr %root..tmp
  %rcc.tmp.35 = load i32, ptr %node_count..tmp
  %rcc.tmp.36 = call i32 @detect_cycles_in_tree.([200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, i32 %rcc.tmp.34, i32 %rcc.tmp.35)
  store i32 %rcc.tmp.36, ptr %cycle_check
  %rcc.tmp.38 = load i32, ptr %cycle_check
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, 0
  br i1 %rcc.tmp.39, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.41 = load i32, ptr %consistency_score
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 200
  store i32 %rcc.tmp.42, ptr %consistency_score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.46 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.47 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.48 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.52 = load i32, ptr %root..tmp
  %rcc.tmp.53 = call i32 @check_balance_consistency.([200 x i32]* %rcc.tmp.46, [200 x i32]* %rcc.tmp.47, [200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, i32 %rcc.tmp.52)
  store i32 %rcc.tmp.53, ptr %balance_consistency
  %rcc.tmp.55 = load i32, ptr %consistency_score
  %rcc.tmp.56 = load i32, ptr %balance_consistency
  %rcc.tmp.57 = add i32 %rcc.tmp.55, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %consistency_score
  %rcc.tmp.59 = load i32, ptr %consistency_score
  ret i32 %rcc.tmp.59
}
define i32 @count_reachable_nodes_from_root.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_count = alloca i32 
  %right_count = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.15 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.16 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.17 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.18 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.19 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.20 = load i32, ptr %node..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.23 = getelementptr [200 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = call i32 @count_reachable_nodes_from_root.([200 x i32]* %rcc.tmp.14, [200 x i32]* %rcc.tmp.15, [200 x i32]* %rcc.tmp.16, [200 x i32]* %rcc.tmp.17, [200 x i32]* %rcc.tmp.18, [200 x i32]* %rcc.tmp.19, i32 %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %left_count
  %rcc.tmp.27 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.28 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.33 = load i32, ptr %node..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.36 = getelementptr [200 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = call i32 @count_reachable_nodes_from_root.([200 x i32]* %rcc.tmp.27, [200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %right_count
  %rcc.tmp.40 = load i32, ptr %left_count
  %rcc.tmp.41 = add i32 1, %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %right_count
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  ret i32 %rcc.tmp.43
}
define i32 @detect_cycles_in_tree.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %visited = alloca [200 x i1] 
  %fill.idx = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 200
  br i1 %rcc.tmp.12, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.14 = load i32, ptr %fill.idx
  %rcc.tmp.15 = getelementptr [200 x i1], ptr %visited, i32 0, i32 %rcc.tmp.14
  store i1 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.20 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.21 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.22 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.23 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.24 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.25 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.26 = load i32, ptr %root..tmp
  %rcc.tmp.27 = call i32 @perform_dfs_cycle_detection.([200 x i32]* %rcc.tmp.20, [200 x i32]* %rcc.tmp.21, [200 x i32]* %rcc.tmp.22, [200 x i32]* %rcc.tmp.23, [200 x i32]* %rcc.tmp.24, [200 x i32]* %rcc.tmp.25, i32 %rcc.tmp.26, [200 x i1]* %visited)
  ret i32 %rcc.tmp.27
}
define i32 @perform_dfs_cycle_detection.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, [200 x i1]* %visited.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %visited..tmp = alloca [200 x i1]* 
  %left_cycle = alloca i32 
  %right_cycle = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store [200 x i1]* %visited.tmp, ptr %visited..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %node..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [200 x i1]*, ptr %visited..tmp
  %rcc.tmp.18 = getelementptr [200 x i1], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i1, ptr %rcc.tmp.18
  br i1 %rcc.tmp.19, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [200 x i1]*, ptr %visited..tmp
  %rcc.tmp.26 = getelementptr [200 x i1], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  store i1 1, ptr %rcc.tmp.26
  %rcc.tmp.28 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.29 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.30 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.31 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.34 = load i32, ptr %node..tmp
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.37 = getelementptr [200 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load [200 x i1]*, ptr %visited..tmp
  %rcc.tmp.40 = call i32 @perform_dfs_cycle_detection.([200 x i32]* %rcc.tmp.28, [200 x i32]* %rcc.tmp.29, [200 x i32]* %rcc.tmp.30, [200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, i32 %rcc.tmp.38, [200 x i1]* %rcc.tmp.39)
  store i32 %rcc.tmp.40, ptr %left_cycle
  %rcc.tmp.42 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.43 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.45 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.46 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.47 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.48 = load i32, ptr %node..tmp
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.51 = getelementptr [200 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = load [200 x i1]*, ptr %visited..tmp
  %rcc.tmp.54 = call i32 @perform_dfs_cycle_detection.([200 x i32]* %rcc.tmp.42, [200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, [200 x i32]* %rcc.tmp.45, [200 x i32]* %rcc.tmp.46, [200 x i32]* %rcc.tmp.47, i32 %rcc.tmp.52, [200 x i1]* %rcc.tmp.53)
  store i32 %rcc.tmp.54, ptr %right_cycle
  %rcc.tmp.56 = load i32, ptr %node..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [200 x i1]*, ptr %visited..tmp
  %rcc.tmp.59 = getelementptr [200 x i1], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  store i1 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %left_cycle
  %rcc.tmp.62 = load i32, ptr %right_cycle
  %rcc.tmp.63 = add i32 %rcc.tmp.61, %rcc.tmp.62
  ret i32 %rcc.tmp.63
}
define i32 @check_balance_consistency.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  %balance_factor = alloca i32 
  %balance_score = alloca i32 
  %left_balance = alloca i32 
  %right_balance = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.26 = getelementptr [200 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.33 = phi i32 [0, %if.then.2], [%rcc.tmp.31, %if.else.2]
  store i32 %rcc.tmp.33, ptr %left_height
  %rcc.tmp.35 = load i32, ptr %node..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = sub i32 0, 1
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.44 = load i32, ptr %node..tmp
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.47 = getelementptr [200 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.51 = getelementptr [200 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.54 = phi i32 [0, %if.then.3], [%rcc.tmp.52, %if.else.3]
  store i32 %rcc.tmp.54, ptr %right_height
  %rcc.tmp.56 = load i32, ptr %left_height
  %rcc.tmp.57 = load i32, ptr %right_height
  %rcc.tmp.58 = sub i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = call i32 @abs.(i32 %rcc.tmp.58)
  store i32 %rcc.tmp.59, ptr %balance_factor
  %rcc.tmp.61 = load i32, ptr %balance_factor
  %rcc.tmp.62 = icmp sle i32 %rcc.tmp.61, 3
  br i1 %rcc.tmp.62, label %if.then.4, label %if.else.4
if.then.4:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.66 = phi i32 [10, %if.then.4], [0, %if.else.4]
  store i32 %rcc.tmp.66, ptr %balance_score
  %rcc.tmp.68 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.69 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.70 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.71 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.72 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.73 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.74 = load i32, ptr %node..tmp
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.77 = getelementptr [200 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = call i32 @check_balance_consistency.([200 x i32]* %rcc.tmp.68, [200 x i32]* %rcc.tmp.69, [200 x i32]* %rcc.tmp.70, [200 x i32]* %rcc.tmp.71, [200 x i32]* %rcc.tmp.72, [200 x i32]* %rcc.tmp.73, i32 %rcc.tmp.78)
  store i32 %rcc.tmp.79, ptr %left_balance
  %rcc.tmp.81 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.82 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.83 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.84 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.85 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.86 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.87 = load i32, ptr %node..tmp
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.90 = getelementptr [200 x i32], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = call i32 @check_balance_consistency.([200 x i32]* %rcc.tmp.81, [200 x i32]* %rcc.tmp.82, [200 x i32]* %rcc.tmp.83, [200 x i32]* %rcc.tmp.84, [200 x i32]* %rcc.tmp.85, [200 x i32]* %rcc.tmp.86, i32 %rcc.tmp.91)
  store i32 %rcc.tmp.92, ptr %right_balance
  %rcc.tmp.94 = load i32, ptr %balance_score
  %rcc.tmp.95 = load i32, ptr %left_balance
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %right_balance
  %rcc.tmp.98 = add i32 %rcc.tmp.96, %rcc.tmp.97
  ret i32 %rcc.tmp.98
}
define i32 @validate_edge_cases_and_boundaries.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %root.tmp, i32 %node_count.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %root..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %edge_case_score = alloca i32 
  %single_node_trees = alloca i32 
  %leaf_nodes = alloca i32 
  %internal_nodes = alloca i32 
  %max_depth = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %edge_case_score
  %rcc.tmp.10 = load i32, ptr %root..tmp
  %rcc.tmp.11 = sub i32 0, 1
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.14 = load i32, ptr %node_count..tmp
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.17 = phi i1 [0, %entry], [%rcc.tmp.15, %and.rhs]
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %edge_case_score
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 50
  store i32 %rcc.tmp.20, ptr %edge_case_score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.24 = load i32, ptr %root..tmp
  %rcc.tmp.25 = sub i32 0, 1
  %rcc.tmp.26 = icmp ne i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.28 = load i32, ptr %root..tmp
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.31 = getelementptr [200 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = sub i32 0, 1
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.32, %rcc.tmp.33
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.36 = phi i1 [0, %if.merge], [%rcc.tmp.34, %and.rhs.2]
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load i32, ptr %edge_case_score
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 30
  store i32 %rcc.tmp.39, ptr %edge_case_score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.43 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.44 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.45 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.46 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.47 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.48 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.49 = load i32, ptr %root..tmp
  %rcc.tmp.50 = call i32 @count_single_node_subtrees.([200 x i32]* %rcc.tmp.43, [200 x i32]* %rcc.tmp.44, [200 x i32]* %rcc.tmp.45, [200 x i32]* %rcc.tmp.46, [200 x i32]* %rcc.tmp.47, [200 x i32]* %rcc.tmp.48, i32 %rcc.tmp.49)
  store i32 %rcc.tmp.50, ptr %single_node_trees
  %rcc.tmp.52 = load i32, ptr %edge_case_score
  %rcc.tmp.53 = load i32, ptr %single_node_trees
  %rcc.tmp.54 = mul i32 %rcc.tmp.53, 5
  %rcc.tmp.55 = add i32 %rcc.tmp.52, %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %edge_case_score
  %rcc.tmp.57 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.58 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.59 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.60 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.61 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.62 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.63 = load i32, ptr %root..tmp
  %rcc.tmp.64 = call i32 @count_leaf_nodes.([200 x i32]* %rcc.tmp.57, [200 x i32]* %rcc.tmp.58, [200 x i32]* %rcc.tmp.59, [200 x i32]* %rcc.tmp.60, [200 x i32]* %rcc.tmp.61, [200 x i32]* %rcc.tmp.62, i32 %rcc.tmp.63)
  store i32 %rcc.tmp.64, ptr %leaf_nodes
  %rcc.tmp.66 = load i32, ptr %node_count..tmp
  %rcc.tmp.67 = load i32, ptr %leaf_nodes
  %rcc.tmp.68 = sub i32 %rcc.tmp.66, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %internal_nodes
  %rcc.tmp.70 = load i32, ptr %leaf_nodes
  %rcc.tmp.71 = icmp sgt i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.73 = load i32, ptr %internal_nodes
  %rcc.tmp.74 = icmp sge i32 %rcc.tmp.73, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.76 = phi i1 [0, %if.merge.2], [%rcc.tmp.74, %and.rhs.3]
  br i1 %rcc.tmp.76, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.78 = load i32, ptr %edge_case_score
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 25
  store i32 %rcc.tmp.79, ptr %edge_case_score
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.83 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.84 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.85 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.86 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.87 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.88 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.89 = load i32, ptr %root..tmp
  %rcc.tmp.90 = call i32 @find_maximum_depth.([200 x i32]* %rcc.tmp.83, [200 x i32]* %rcc.tmp.84, [200 x i32]* %rcc.tmp.85, [200 x i32]* %rcc.tmp.86, [200 x i32]* %rcc.tmp.87, [200 x i32]* %rcc.tmp.88, i32 %rcc.tmp.89, i32 0)
  store i32 %rcc.tmp.90, ptr %max_depth
  %rcc.tmp.92 = load i32, ptr %max_depth
  %rcc.tmp.93 = icmp sgt i32 %rcc.tmp.92, 0
  br i1 %rcc.tmp.93, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.95 = load i32, ptr %max_depth
  %rcc.tmp.96 = load i32, ptr %node_count..tmp
  %rcc.tmp.97 = icmp sle i32 %rcc.tmp.95, %rcc.tmp.96
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.99 = phi i1 [0, %if.merge.3], [%rcc.tmp.97, %and.rhs.4]
  br i1 %rcc.tmp.99, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.101 = load i32, ptr %edge_case_score
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 20
  store i32 %rcc.tmp.102, ptr %edge_case_score
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.106 = load i32, ptr %edge_case_score
  ret i32 %rcc.tmp.106
}
define i32 @count_single_node_subtrees.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %is_single_node = alloca i32 
  %left_single = alloca i32 
  %right_single = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.22 = load i32, ptr %node..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = sub i32 0, 1
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.26, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %if.merge], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.34 = phi i32 [1, %if.then.2], [0, %if.else.2]
  store i32 %rcc.tmp.34, ptr %is_single_node
  %rcc.tmp.36 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.39 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.40 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.41 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.42 = load i32, ptr %node..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.45 = getelementptr [200 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = call i32 @count_single_node_subtrees.([200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, [200 x i32]* %rcc.tmp.39, [200 x i32]* %rcc.tmp.40, [200 x i32]* %rcc.tmp.41, i32 %rcc.tmp.46)
  store i32 %rcc.tmp.47, ptr %left_single
  %rcc.tmp.49 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.53 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.54 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.55 = load i32, ptr %node..tmp
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.58 = getelementptr [200 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = call i32 @count_single_node_subtrees.([200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, [200 x i32]* %rcc.tmp.53, [200 x i32]* %rcc.tmp.54, i32 %rcc.tmp.59)
  store i32 %rcc.tmp.60, ptr %right_single
  %rcc.tmp.62 = load i32, ptr %is_single_node
  %rcc.tmp.63 = load i32, ptr %left_single
  %rcc.tmp.64 = add i32 %rcc.tmp.62, %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %right_single
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  ret i32 %rcc.tmp.66
}
define i32 @count_leaf_nodes.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %left_leaves = alloca i32 
  %right_leaves = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  %rcc.tmp.8 = load i32, ptr %node..tmp
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %node..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.17 = getelementptr [200 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.22 = load i32, ptr %node..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = sub i32 0, 1
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.26, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %if.merge], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.34 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.36 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.37 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.38 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.39 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.40 = load i32, ptr %node..tmp
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.43 = getelementptr [200 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = call i32 @count_leaf_nodes.([200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, [200 x i32]* %rcc.tmp.36, [200 x i32]* %rcc.tmp.37, [200 x i32]* %rcc.tmp.38, [200 x i32]* %rcc.tmp.39, i32 %rcc.tmp.44)
  store i32 %rcc.tmp.45, ptr %left_leaves
  %rcc.tmp.47 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.48 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.49 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.50 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.51 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.52 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.53 = load i32, ptr %node..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.56 = getelementptr [200 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = call i32 @count_leaf_nodes.([200 x i32]* %rcc.tmp.47, [200 x i32]* %rcc.tmp.48, [200 x i32]* %rcc.tmp.49, [200 x i32]* %rcc.tmp.50, [200 x i32]* %rcc.tmp.51, [200 x i32]* %rcc.tmp.52, i32 %rcc.tmp.57)
  store i32 %rcc.tmp.58, ptr %right_leaves
  %rcc.tmp.60 = load i32, ptr %left_leaves
  %rcc.tmp.61 = load i32, ptr %right_leaves
  %rcc.tmp.62 = add i32 %rcc.tmp.60, %rcc.tmp.61
  ret i32 %rcc.tmp.62
}
define i32 @find_maximum_depth.([200 x i32]* %nodes.tmp, [200 x i32]* %left.tmp, [200 x i32]* %right.tmp, [200 x i32]* %parent.tmp, [200 x i32]* %height.tmp, [200 x i32]* %subtree_size.tmp, i32 %node.tmp, i32 %current_depth.tmp) {
entry:
  %nodes..tmp = alloca [200 x i32]* 
  %left..tmp = alloca [200 x i32]* 
  %right..tmp = alloca [200 x i32]* 
  %parent..tmp = alloca [200 x i32]* 
  %height..tmp = alloca [200 x i32]* 
  %subtree_size..tmp = alloca [200 x i32]* 
  %node..tmp = alloca i32 
  %current_depth..tmp = alloca i32 
  %left_depth = alloca i32 
  %right_depth = alloca i32 
  store [200 x i32]* %nodes.tmp, ptr %nodes..tmp
  store [200 x i32]* %left.tmp, ptr %left..tmp
  store [200 x i32]* %right.tmp, ptr %right..tmp
  store [200 x i32]* %parent.tmp, ptr %parent..tmp
  store [200 x i32]* %height.tmp, ptr %height..tmp
  store [200 x i32]* %subtree_size.tmp, ptr %subtree_size..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %current_depth.tmp, ptr %current_depth..tmp
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = sub i32 0, 1
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  %rcc.tmp.13 = load i32, ptr %current_depth..tmp
  ret i32 %rcc.tmp.13
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.17 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.18 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.19 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.20 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.21 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.22 = load i32, ptr %node..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %current_depth..tmp
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  %rcc.tmp.29 = call i32 @find_maximum_depth.([200 x i32]* %rcc.tmp.16, [200 x i32]* %rcc.tmp.17, [200 x i32]* %rcc.tmp.18, [200 x i32]* %rcc.tmp.19, [200 x i32]* %rcc.tmp.20, [200 x i32]* %rcc.tmp.21, i32 %rcc.tmp.26, i32 %rcc.tmp.28)
  store i32 %rcc.tmp.29, ptr %left_depth
  %rcc.tmp.31 = load [200 x i32]*, ptr %nodes..tmp
  %rcc.tmp.32 = load [200 x i32]*, ptr %left..tmp
  %rcc.tmp.33 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.34 = load [200 x i32]*, ptr %parent..tmp
  %rcc.tmp.35 = load [200 x i32]*, ptr %height..tmp
  %rcc.tmp.36 = load [200 x i32]*, ptr %subtree_size..tmp
  %rcc.tmp.37 = load i32, ptr %node..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [200 x i32]*, ptr %right..tmp
  %rcc.tmp.40 = getelementptr [200 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %current_depth..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  %rcc.tmp.44 = call i32 @find_maximum_depth.([200 x i32]* %rcc.tmp.31, [200 x i32]* %rcc.tmp.32, [200 x i32]* %rcc.tmp.33, [200 x i32]* %rcc.tmp.34, [200 x i32]* %rcc.tmp.35, [200 x i32]* %rcc.tmp.36, i32 %rcc.tmp.41, i32 %rcc.tmp.43)
  store i32 %rcc.tmp.44, ptr %right_depth
  %rcc.tmp.46 = load i32, ptr %left_depth
  %rcc.tmp.47 = load i32, ptr %right_depth
  %rcc.tmp.48 = call i32 @max.(i32 %rcc.tmp.46, i32 %rcc.tmp.47)
  ret i32 %rcc.tmp.48
}
