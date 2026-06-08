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
%Node = type {i32, i32, i32, i32}
%Tree = type {[512 x %Node], i32, i32}
define void @main() {
entry:
  %tree = alloca %Tree 
  %fill.idx = alloca i32 
  %sum = alloca i32 
  %height = alloca i32 
  %search_val = alloca i32 
  %found = alloca i1 
  %root = alloca i32 
  %error_sum = alloca i32 
  %rcc.tmp.1 = getelementptr %Tree, ptr %tree, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [512 x %Node], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 3
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.22 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %Tree, ptr %tree, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.25
  call void @initialize_pool.(%Tree* %tree)
  %rcc.tmp.28 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.29 = call i32 @build_complex_tree.(%Tree* %tree, i32 4, i32 100)
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = call i32 @sum_tree.(%Tree* %tree, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %sum
  %rcc.tmp.35 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.35)
  %rcc.tmp.37 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = call i32 @find_height.(%Tree* %tree, i32 %rcc.tmp.38)
  store i32 %rcc.tmp.39, ptr %height
  %rcc.tmp.41 = load i32, ptr %height
  call void @printlnInt.(i32 %rcc.tmp.41)
  store i32 125, ptr %search_val
  %rcc.tmp.44 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %search_val
  %rcc.tmp.47 = call i1 @find_value.(%Tree* %tree, i32 %rcc.tmp.45, i32 %rcc.tmp.46)
  store i1 %rcc.tmp.47, ptr %found
  %rcc.tmp.49 = load i1, ptr %found
  br i1 %rcc.tmp.49, label %if.then, label %if.else
if.then:
  %rcc.tmp.51 = load i32, ptr %search_val
  call void @printlnInt.(i32 %rcc.tmp.51)
  br label %if.merge
if.else:
  %rcc.tmp.54 = sub i32 0, 1
  call void @printlnInt.(i32 %rcc.tmp.54)
  br label %if.merge
if.merge:
  %rcc.tmp.57 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %root
  %rcc.tmp.60 = load i32, ptr %root
  call void @mirror_tree.(%Tree* %tree, i32 %rcc.tmp.60)
  %rcc.tmp.62 = load i32, ptr %root
  %rcc.tmp.63 = call i32 @sum_tree.(%Tree* %tree, i32 %rcc.tmp.62)
  store i32 %rcc.tmp.63, ptr %sum
  %rcc.tmp.65 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.65)
  %rcc.tmp.67 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = call i32 @process_with_shadow_error.(%Tree* %tree, i32 %rcc.tmp.68, i32 10)
  store i32 %rcc.tmp.69, ptr %error_sum
  %rcc.tmp.71 = load i32, ptr %error_sum
  call void @printlnInt.(i32 %rcc.tmp.71)
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @initialize_pool.(%Tree* %tree.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %i = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.9 = getelementptr %Tree, ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [512 x %Node], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Node, ptr %rcc.tmp.12, i32 0, i32 2
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %rcc.tmp.13
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.21 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.22 = getelementptr %Tree, ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = sub i32 512, 1
  %rcc.tmp.24 = getelementptr [512 x %Node], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = getelementptr %Node, ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = sub i32 0, 1
  store i32 %rcc.tmp.26, ptr %rcc.tmp.25
  %rcc.tmp.28 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.29 = getelementptr %Tree, ptr %rcc.tmp.28, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.29
  ret void
}
define i32 @alloc_node.(%Tree* %tree.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %new_node_idx = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  %rcc.tmp.2 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.3 = getelementptr %Tree, ptr %rcc.tmp.2, i32 0, i32 2
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = sub i32 0, 1
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = sub i32 0, 1
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.12 = getelementptr %Tree, ptr %rcc.tmp.11, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %new_node_idx
  %rcc.tmp.15 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.16 = getelementptr %Tree, ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.18 = getelementptr %Tree, ptr %rcc.tmp.17, i32 0, i32 0
  %rcc.tmp.19 = load i32, ptr %new_node_idx
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [512 x %Node], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = getelementptr %Node, ptr %rcc.tmp.21, i32 0, i32 2
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.16
  %rcc.tmp.25 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.26 = getelementptr %Tree, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %new_node_idx
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [512 x %Node], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = getelementptr %Node, ptr %rcc.tmp.29, i32 0, i32 2
  %rcc.tmp.31 = sub i32 0, 1
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.34 = getelementptr %Tree, ptr %rcc.tmp.33, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %new_node_idx
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [512 x %Node], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = getelementptr %Node, ptr %rcc.tmp.37, i32 0, i32 3
  %rcc.tmp.39 = sub i32 0, 1
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %new_node_idx
  ret i32 %rcc.tmp.41
}
define i32 @build_complex_tree.(%Tree* %tree.tmp, i32 %depth.tmp, i32 %base_value.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %depth..tmp = alloca i32 
  %base_value..tmp = alloca i32 
  %leaf_idx = alloca i32 
  %root_idx = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 %base_value.tmp, ptr %base_value..tmp
  %rcc.tmp.4 = load i32, ptr %depth..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.8 = call i32 @alloc_node.(%Tree* %rcc.tmp.7)
  store i32 %rcc.tmp.8, ptr %leaf_idx
  %rcc.tmp.10 = load i32, ptr %leaf_idx
  %rcc.tmp.11 = sub i32 0, 1
  %rcc.tmp.12 = icmp ne i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.14 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.15 = getelementptr %Tree, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %leaf_idx
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [512 x %Node], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Node, ptr %rcc.tmp.18, i32 0, i32 0
  store i32 2, ptr %rcc.tmp.19
  %rcc.tmp.21 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.22 = getelementptr %Tree, ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %leaf_idx
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [512 x %Node], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = getelementptr %Node, ptr %rcc.tmp.25, i32 0, i32 1
  %rcc.tmp.27 = load i32, ptr %base_value..tmp
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 256
  store i32 %rcc.tmp.28, ptr %rcc.tmp.26
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.32 = load i32, ptr %leaf_idx
  ret i32 %rcc.tmp.32
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.35 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.36 = call i32 @alloc_node.(%Tree* %rcc.tmp.35)
  store i32 %rcc.tmp.36, ptr %root_idx
  %rcc.tmp.38 = load i32, ptr %root_idx
  %rcc.tmp.39 = sub i32 0, 1
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.42 = sub i32 0, 1
  ret i32 %rcc.tmp.42
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.45 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.46 = getelementptr %Tree, ptr %rcc.tmp.45, i32 0, i32 0
  %rcc.tmp.47 = load i32, ptr %root_idx
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [512 x %Node], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = getelementptr %Node, ptr %rcc.tmp.49, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.50
  %rcc.tmp.52 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.53 = getelementptr %Tree, ptr %rcc.tmp.52, i32 0, i32 0
  %rcc.tmp.54 = load i32, ptr %root_idx
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [512 x %Node], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = getelementptr %Node, ptr %rcc.tmp.56, i32 0, i32 1
  %rcc.tmp.58 = load i32, ptr %base_value..tmp
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  %rcc.tmp.60 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.61 = getelementptr %Tree, ptr %rcc.tmp.60, i32 0, i32 0
  %rcc.tmp.62 = load i32, ptr %root_idx
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [512 x %Node], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = getelementptr %Node, ptr %rcc.tmp.64, i32 0, i32 2
  %rcc.tmp.66 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.67 = load i32, ptr %depth..tmp
  %rcc.tmp.68 = sub i32 %rcc.tmp.67, 1
  %rcc.tmp.69 = load i32, ptr %base_value..tmp
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 2
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = call i32 @build_complex_tree.(%Tree* %rcc.tmp.66, i32 %rcc.tmp.68, i32 %rcc.tmp.71)
  store i32 %rcc.tmp.72, ptr %rcc.tmp.65
  %rcc.tmp.74 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.75 = getelementptr %Tree, ptr %rcc.tmp.74, i32 0, i32 0
  %rcc.tmp.76 = load i32, ptr %root_idx
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [512 x %Node], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = getelementptr %Node, ptr %rcc.tmp.78, i32 0, i32 3
  %rcc.tmp.80 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.81 = load i32, ptr %depth..tmp
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = load i32, ptr %base_value..tmp
  %rcc.tmp.84 = mul i32 %rcc.tmp.83, 3
  %rcc.tmp.85 = sub i32 %rcc.tmp.84, 1
  %rcc.tmp.86 = call i32 @build_complex_tree.(%Tree* %rcc.tmp.80, i32 %rcc.tmp.82, i32 %rcc.tmp.85)
  store i32 %rcc.tmp.86, ptr %rcc.tmp.79
  %rcc.tmp.88 = load i32, ptr %root_idx
  ret i32 %rcc.tmp.88
}
define i32 @sum_tree.(%Tree* %tree.tmp, i32 %node_idx.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  %node = alloca %Node* 
  %left_sum = alloca i32 
  %right_sum = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  %rcc.tmp.3 = load i32, ptr %node_idx..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.10 = getelementptr %Tree, ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %node_idx..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [512 x %Node], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.12
  store %Node* %rcc.tmp.13, ptr %node
  %rcc.tmp.15 = load %Node*, ptr %node
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 2
  br i1 %rcc.tmp.18, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.20 = load %Node*, ptr %node
  %rcc.tmp.21 = getelementptr %Node, ptr %rcc.tmp.20, i32 0, i32 1
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  ret i32 %rcc.tmp.22
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.25 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.26 = load %Node*, ptr %node
  %rcc.tmp.27 = getelementptr %Node, ptr %rcc.tmp.26, i32 0, i32 2
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = call i32 @sum_tree.(%Tree* %rcc.tmp.25, i32 %rcc.tmp.28)
  store i32 %rcc.tmp.29, ptr %left_sum
  %rcc.tmp.31 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.32 = load %Node*, ptr %node
  %rcc.tmp.33 = getelementptr %Node, ptr %rcc.tmp.32, i32 0, i32 3
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = call i32 @sum_tree.(%Tree* %rcc.tmp.31, i32 %rcc.tmp.34)
  store i32 %rcc.tmp.35, ptr %right_sum
  %rcc.tmp.37 = load %Node*, ptr %node
  %rcc.tmp.38 = getelementptr %Node, ptr %rcc.tmp.37, i32 0, i32 1
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %left_sum
  %rcc.tmp.41 = add i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %right_sum
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  ret i32 %rcc.tmp.43
}
define i32 @find_height.(%Tree* %tree.tmp, i32 %node_idx.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  %left_height = alloca i32 
  %right_height = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  %rcc.tmp.3 = load i32, ptr %node_idx..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.10 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.11 = getelementptr %Tree, ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load i32, ptr %node_idx..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [512 x %Node], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Node, ptr %rcc.tmp.14, i32 0, i32 2
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = call i32 @find_height.(%Tree* %rcc.tmp.9, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %left_height
  %rcc.tmp.19 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.20 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.21 = getelementptr %Tree, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %node_idx..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [512 x %Node], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = getelementptr %Node, ptr %rcc.tmp.24, i32 0, i32 3
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = call i32 @find_height.(%Tree* %rcc.tmp.19, i32 %rcc.tmp.26)
  store i32 %rcc.tmp.27, ptr %right_height
  %rcc.tmp.29 = load i32, ptr %left_height
  %rcc.tmp.30 = load i32, ptr %right_height
  %rcc.tmp.31 = icmp sgt i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.33 = load i32, ptr %left_height
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  ret i32 %rcc.tmp.34
if.else.2:
  %rcc.tmp.36 = load i32, ptr %right_height
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  ret i32 %rcc.tmp.37
if.merge.2:
  ret i32 undef
}
define i1 @find_value.(%Tree* %tree.tmp, i32 %node_idx.tmp, i32 %value.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  %value..tmp = alloca i32 
  %node = alloca %Node* 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.4 = load i32, ptr %node_idx..tmp
  %rcc.tmp.5 = sub i32 0, 1
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.11 = getelementptr %Tree, ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load i32, ptr %node_idx..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [512 x %Node], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  store %Node* %rcc.tmp.14, ptr %node
  %rcc.tmp.16 = load %Node*, ptr %node
  %rcc.tmp.17 = getelementptr %Node, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %value..tmp
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.24 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.25 = load %Node*, ptr %node
  %rcc.tmp.26 = getelementptr %Node, ptr %rcc.tmp.25, i32 0, i32 2
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %value..tmp
  %rcc.tmp.29 = call i1 @find_value.(%Tree* %rcc.tmp.24, i32 %rcc.tmp.27, i32 %rcc.tmp.28)
  br i1 %rcc.tmp.29, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 1
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.33 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.34 = load %Node*, ptr %node
  %rcc.tmp.35 = getelementptr %Node, ptr %rcc.tmp.34, i32 0, i32 3
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %value..tmp
  %rcc.tmp.38 = call i1 @find_value.(%Tree* %rcc.tmp.33, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  br i1 %rcc.tmp.38, label %if.then.4, label %if.else.4
if.then.4:
  ret i1 1
if.else.4:
  br label %if.merge.4
if.merge.4:
  ret i1 0
}
define void @mirror_tree.(%Tree* %tree.tmp, i32 %node_idx.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  %node = alloca %Node* 
  %temp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  %rcc.tmp.3 = load i32, ptr %node_idx..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.10 = getelementptr %Tree, ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %node_idx..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [512 x %Node], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.12
  store %Node* %rcc.tmp.13, ptr %node
  %rcc.tmp.15 = load %Node*, ptr %node
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %temp
  %rcc.tmp.19 = load %Node*, ptr %node
  %rcc.tmp.20 = getelementptr %Node, ptr %rcc.tmp.19, i32 0, i32 2
  %rcc.tmp.21 = load %Node*, ptr %node
  %rcc.tmp.22 = getelementptr %Node, ptr %rcc.tmp.21, i32 0, i32 3
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.20
  %rcc.tmp.25 = load %Node*, ptr %node
  %rcc.tmp.26 = getelementptr %Node, ptr %rcc.tmp.25, i32 0, i32 3
  %rcc.tmp.27 = load i32, ptr %temp
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = load %Node*, ptr %node
  %rcc.tmp.30 = getelementptr %Node, ptr %rcc.tmp.29, i32 0, i32 2
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %left
  %rcc.tmp.33 = load %Node*, ptr %node
  %rcc.tmp.34 = getelementptr %Node, ptr %rcc.tmp.33, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %right
  %rcc.tmp.37 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.38 = load i32, ptr %left
  call void @mirror_tree.(%Tree* %rcc.tmp.37, i32 %rcc.tmp.38)
  %rcc.tmp.40 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.41 = load i32, ptr %right
  call void @mirror_tree.(%Tree* %rcc.tmp.40, i32 %rcc.tmp.41)
  ret void
}
define i32 @process_with_shadow_error.(%Tree* %tree.tmp, i32 %node_idx.tmp, i32 %threshold.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  %threshold..tmp = alloca i32 
  %current_sum = alloca i32 
  %node = alloca %Node* 
  %threshold = alloca i32 
  %threshold.2 = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  store i32 %threshold.tmp, ptr %threshold..tmp
  %rcc.tmp.4 = load i32, ptr %node_idx..tmp
  %rcc.tmp.5 = sub i32 0, 1
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %current_sum
  %rcc.tmp.11 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.12 = getelementptr %Tree, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %node_idx..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [512 x %Node], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  store %Node* %rcc.tmp.15, ptr %node
  %rcc.tmp.17 = load %Node*, ptr %node
  %rcc.tmp.18 = getelementptr %Node, ptr %rcc.tmp.17, i32 0, i32 1
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %threshold..tmp
  %rcc.tmp.21 = icmp sgt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.23 = load i32, ptr %current_sum
  %rcc.tmp.24 = load %Node*, ptr %node
  %rcc.tmp.25 = getelementptr %Node, ptr %rcc.tmp.24, i32 0, i32 1
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.23, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %current_sum
  %rcc.tmp.29 = load i32, ptr %threshold..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 10
  store i32 %rcc.tmp.30, ptr %threshold
  %rcc.tmp.32 = load %Node*, ptr %node
  %rcc.tmp.33 = getelementptr %Node, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.34, 1
  br i1 %rcc.tmp.35, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.37 = load i32, ptr %current_sum
  %rcc.tmp.38 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.39 = load %Node*, ptr %node
  %rcc.tmp.40 = getelementptr %Node, ptr %rcc.tmp.39, i32 0, i32 2
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %threshold
  %rcc.tmp.43 = call i32 @process_with_shadow_error.(%Tree* %rcc.tmp.38, i32 %rcc.tmp.41, i32 %rcc.tmp.42)
  %rcc.tmp.44 = add i32 %rcc.tmp.37, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %current_sum
  %rcc.tmp.46 = load i32, ptr %current_sum
  %rcc.tmp.47 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.48 = load %Node*, ptr %node
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 3
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %threshold
  %rcc.tmp.52 = call i32 @process_with_shadow_error.(%Tree* %rcc.tmp.47, i32 %rcc.tmp.50, i32 %rcc.tmp.51)
  %rcc.tmp.53 = add i32 %rcc.tmp.46, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %current_sum
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.58 = load %Node*, ptr %node
  %rcc.tmp.59 = getelementptr %Node, ptr %rcc.tmp.58, i32 0, i32 0
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 1
  br i1 %rcc.tmp.61, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.63 = load i32, ptr %threshold..tmp
  %rcc.tmp.64 = sub i32 %rcc.tmp.63, 2
  store i32 %rcc.tmp.64, ptr %threshold.2
  %rcc.tmp.66 = load i32, ptr %current_sum
  %rcc.tmp.67 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.68 = load %Node*, ptr %node
  %rcc.tmp.69 = getelementptr %Node, ptr %rcc.tmp.68, i32 0, i32 2
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %threshold.2
  %rcc.tmp.72 = call i32 @process_with_shadow_error.(%Tree* %rcc.tmp.67, i32 %rcc.tmp.70, i32 %rcc.tmp.71)
  %rcc.tmp.73 = add i32 %rcc.tmp.66, %rcc.tmp.72
  store i32 %rcc.tmp.73, ptr %current_sum
  %rcc.tmp.75 = load i32, ptr %current_sum
  %rcc.tmp.76 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.77 = load %Node*, ptr %node
  %rcc.tmp.78 = getelementptr %Node, ptr %rcc.tmp.77, i32 0, i32 3
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %threshold.2
  %rcc.tmp.81 = call i32 @process_with_shadow_error.(%Tree* %rcc.tmp.76, i32 %rcc.tmp.79, i32 %rcc.tmp.80)
  %rcc.tmp.82 = add i32 %rcc.tmp.75, %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %current_sum
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.87 = load i32, ptr %current_sum
  ret i32 %rcc.tmp.87
}
define void @prune_tree.(%Tree* %tree.tmp, i32 %node_idx.tmp, i32 %max_depth.tmp, i32 %current_depth.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  %max_depth..tmp = alloca i32 
  %current_depth..tmp = alloca i32 
  %node = alloca %Node* 
  %left = alloca i32 
  %right = alloca i32 
  %node.2 = alloca %Node* 
  %node.3 = alloca %Node* 
  %left.2 = alloca i32 
  %right.2 = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  store i32 %max_depth.tmp, ptr %max_depth..tmp
  store i32 %current_depth.tmp, ptr %current_depth..tmp
  %rcc.tmp.5 = load i32, ptr %node_idx..tmp
  %rcc.tmp.6 = sub i32 0, 1
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.9 = load i32, ptr %current_depth..tmp
  %rcc.tmp.10 = load i32, ptr %max_depth..tmp
  %rcc.tmp.11 = icmp sge i32 %rcc.tmp.9, %rcc.tmp.10
  br label %sc.merge
sc.merge:
  %rcc.tmp.13 = phi i1 [1, %entry], [%rcc.tmp.11, %or.rhs]
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.17 = load i32, ptr %current_depth..tmp
  %rcc.tmp.18 = load i32, ptr %max_depth..tmp
  %rcc.tmp.19 = sub i32 %rcc.tmp.18, 1
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.17, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.22 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.23 = getelementptr %Tree, ptr %rcc.tmp.22, i32 0, i32 0
  %rcc.tmp.24 = load i32, ptr %node_idx..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [512 x %Node], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  store %Node* %rcc.tmp.26, ptr %node
  %rcc.tmp.28 = load %Node*, ptr %node
  %rcc.tmp.29 = getelementptr %Node, ptr %rcc.tmp.28, i32 0, i32 2
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %left
  %rcc.tmp.32 = load %Node*, ptr %node
  %rcc.tmp.33 = getelementptr %Node, ptr %rcc.tmp.32, i32 0, i32 3
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %right
  %rcc.tmp.36 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.37 = load i32, ptr %left
  call void @free_tree.(%Tree* %rcc.tmp.36, i32 %rcc.tmp.37)
  %rcc.tmp.39 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.40 = load i32, ptr %right
  call void @free_tree.(%Tree* %rcc.tmp.39, i32 %rcc.tmp.40)
  %rcc.tmp.42 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.43 = getelementptr %Tree, ptr %rcc.tmp.42, i32 0, i32 0
  %rcc.tmp.44 = load i32, ptr %node_idx..tmp
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [512 x %Node], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.45
  store %Node* %rcc.tmp.46, ptr %node.2
  %rcc.tmp.48 = load %Node*, ptr %node.2
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 2
  %rcc.tmp.50 = sub i32 0, 1
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load %Node*, ptr %node.2
  %rcc.tmp.53 = getelementptr %Node, ptr %rcc.tmp.52, i32 0, i32 3
  %rcc.tmp.54 = sub i32 0, 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.53
  %rcc.tmp.56 = load %Node*, ptr %node.2
  %rcc.tmp.57 = getelementptr %Node, ptr %rcc.tmp.56, i32 0, i32 0
  store i32 2, ptr %rcc.tmp.57
  br label %if.merge.2
if.else.2:
  %rcc.tmp.60 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.61 = getelementptr %Tree, ptr %rcc.tmp.60, i32 0, i32 0
  %rcc.tmp.62 = load i32, ptr %node_idx..tmp
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [512 x %Node], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  store %Node* %rcc.tmp.64, ptr %node.3
  %rcc.tmp.66 = load %Node*, ptr %node.3
  %rcc.tmp.67 = getelementptr %Node, ptr %rcc.tmp.66, i32 0, i32 2
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %left.2
  %rcc.tmp.70 = load %Node*, ptr %node.3
  %rcc.tmp.71 = getelementptr %Node, ptr %rcc.tmp.70, i32 0, i32 3
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %right.2
  %rcc.tmp.74 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.75 = load i32, ptr %left.2
  %rcc.tmp.76 = load i32, ptr %max_depth..tmp
  %rcc.tmp.77 = load i32, ptr %current_depth..tmp
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  call void @prune_tree.(%Tree* %rcc.tmp.74, i32 %rcc.tmp.75, i32 %rcc.tmp.76, i32 %rcc.tmp.78)
  %rcc.tmp.80 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.81 = load i32, ptr %right.2
  %rcc.tmp.82 = load i32, ptr %max_depth..tmp
  %rcc.tmp.83 = load i32, ptr %current_depth..tmp
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  call void @prune_tree.(%Tree* %rcc.tmp.80, i32 %rcc.tmp.81, i32 %rcc.tmp.82, i32 %rcc.tmp.84)
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @free_tree.(%Tree* %tree.tmp, i32 %node_idx.tmp) {
entry:
  %tree..tmp = alloca %Tree* 
  %node_idx..tmp = alloca i32 
  store %Tree* %tree.tmp, ptr %tree..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  %rcc.tmp.3 = load i32, ptr %node_idx..tmp
  %rcc.tmp.4 = sub i32 0, 1
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.10 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.11 = getelementptr %Tree, ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load i32, ptr %node_idx..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [512 x %Node], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Node, ptr %rcc.tmp.14, i32 0, i32 2
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  call void @free_tree.(%Tree* %rcc.tmp.9, i32 %rcc.tmp.16)
  %rcc.tmp.18 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.19 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.20 = getelementptr %Tree, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %node_idx..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [512 x %Node], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Node, ptr %rcc.tmp.23, i32 0, i32 3
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  call void @free_tree.(%Tree* %rcc.tmp.18, i32 %rcc.tmp.25)
  %rcc.tmp.27 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.28 = getelementptr %Tree, ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %node_idx..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [512 x %Node], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %Node, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.34 = getelementptr %Tree, ptr %rcc.tmp.33, i32 0, i32 2
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %rcc.tmp.32
  %rcc.tmp.37 = load %Tree*, ptr %tree..tmp
  %rcc.tmp.38 = getelementptr %Tree, ptr %rcc.tmp.37, i32 0, i32 2
  %rcc.tmp.39 = load i32, ptr %node_idx..tmp
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  ret void
}
define void @another_tree_operation.() {
entry:
  %tree = alloca %Tree 
  %fill.idx = alloca i32 
  %root = alloca i32 
  %sum = alloca i32 
  %rcc.tmp.1 = getelementptr %Tree, ptr %tree, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [512 x %Node], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 3
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.22 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %Tree, ptr %tree, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.25
  call void @initialize_pool.(%Tree* %tree)
  %rcc.tmp.28 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.29 = call i32 @build_complex_tree.(%Tree* %tree, i32 5, i32 50)
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %root
  %rcc.tmp.34 = load i32, ptr %root
  call void @prune_tree.(%Tree* %tree, i32 %rcc.tmp.34, i32 3, i32 0)
  %rcc.tmp.36 = load i32, ptr %root
  %rcc.tmp.37 = call i32 @sum_tree.(%Tree* %tree, i32 %rcc.tmp.36)
  store i32 %rcc.tmp.37, ptr %sum
  %rcc.tmp.39 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.39)
  ret void
}
define void @yet_another_scenario.() {
entry:
  %tree = alloca %Tree 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %root = alloca i32 
  %height = alloca i32 
  %rcc.tmp.1 = getelementptr %Tree, ptr %tree, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [512 x %Node], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = getelementptr %Node, ptr %rcc.tmp.8, i32 0, i32 3
  %rcc.tmp.17 = sub i32 0, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.22 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %Tree, ptr %tree, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.25
  call void @initialize_pool.(%Tree* %tree)
  %rcc.tmp.28 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.29 = call i32 @build_complex_tree.(%Tree* %tree, i32 6, i32 20)
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 10
  br i1 %rcc.tmp.34, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.37 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %root
  %rcc.tmp.40 = load i32, ptr %root
  call void @mirror_tree.(%Tree* %tree, i32 %rcc.tmp.40)
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.46 = getelementptr %Tree, ptr %tree, i32 0, i32 1
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = call i32 @find_height.(%Tree* %tree, i32 %rcc.tmp.47)
  store i32 %rcc.tmp.48, ptr %height
  %rcc.tmp.50 = load i32, ptr %height
  call void @printlnInt.(i32 %rcc.tmp.50)
  call void @another_tree_operation.()
  ret void
}
