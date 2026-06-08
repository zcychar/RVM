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
%Pools = type {[200 x [5 x i32]], [200 x [6 x i32]], [200 x i1], [200 x i32], i32, i32}
define i32 @create_node.(%Pools* %pools.tmp, i1 %is_leaf.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %is_leaf..tmp = alloca i1 
  %idx = alloca i32 
  %i = alloca i32 
  store %Pools* %pools.tmp, ptr %pools..tmp
  store i1 %is_leaf.tmp, ptr %is_leaf..tmp
  %rcc.tmp.3 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.4 = getelementptr %Pools, ptr %rcc.tmp.3, i32 0, i32 4
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %idx
  %rcc.tmp.7 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.8 = getelementptr %Pools, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.10 = getelementptr %Pools, ptr %rcc.tmp.9, i32 0, i32 4
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %rcc.tmp.8
  %rcc.tmp.14 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.15 = getelementptr %Pools, ptr %rcc.tmp.14, i32 0, i32 2
  %rcc.tmp.16 = load i32, ptr %idx
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [200 x i1], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i1, ptr %is_leaf..tmp
  store i1 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.22 = getelementptr %Pools, ptr %rcc.tmp.21, i32 0, i32 3
  %rcc.tmp.23 = load i32, ptr %idx
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.25
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 4
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.34 = getelementptr %Pools, ptr %rcc.tmp.33, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %idx
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [5 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 5
  br i1 %rcc.tmp.49, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.52 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.53 = getelementptr %Pools, ptr %rcc.tmp.52, i32 0, i32 1
  %rcc.tmp.54 = load i32, ptr %idx
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [6 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = sub i32 0, 1
  store i32 %rcc.tmp.60, ptr %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.66 = load i32, ptr %idx
  ret i32 %rcc.tmp.66
}
define void @split_child.(%Pools* %pools.tmp, i32 %parent_idx.tmp, i32 %child_idx_in_parent.tmp, i32 %child_idx.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %parent_idx..tmp = alloca i32 
  %child_idx_in_parent..tmp = alloca i32 
  %child_idx..tmp = alloca i32 
  %new_node_idx = alloca i32 
  %j = alloca i32 
  store %Pools* %pools.tmp, ptr %pools..tmp
  store i32 %parent_idx.tmp, ptr %parent_idx..tmp
  store i32 %child_idx_in_parent.tmp, ptr %child_idx_in_parent..tmp
  store i32 %child_idx.tmp, ptr %child_idx..tmp
  %rcc.tmp.5 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.6 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.7 = getelementptr %Pools, ptr %rcc.tmp.6, i32 0, i32 2
  %rcc.tmp.8 = load i32, ptr %child_idx..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = getelementptr [200 x i1], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.11 = load i1, ptr %rcc.tmp.10
  %rcc.tmp.12 = call i32 @create_node.(%Pools* %rcc.tmp.5, i1 %rcc.tmp.11)
  store i32 %rcc.tmp.12, ptr %new_node_idx
  %rcc.tmp.14 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.15 = getelementptr %Pools, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %new_node_idx
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [200 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  store i32 2, ptr %rcc.tmp.18
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.22, 2
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.27 = getelementptr %Pools, ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = load i32, ptr %new_node_idx
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [5 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.35 = getelementptr %Pools, ptr %rcc.tmp.34, i32 0, i32 0
  %rcc.tmp.36 = load i32, ptr %child_idx..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 2
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [5 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %rcc.tmp.33
  %rcc.tmp.46 = load i32, ptr %j
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.50 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.51 = getelementptr %Pools, ptr %rcc.tmp.50, i32 0, i32 2
  %rcc.tmp.52 = load i32, ptr %child_idx..tmp
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [200 x i1], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load i1, ptr %rcc.tmp.54
  %rcc.tmp.56 = xor i1 %rcc.tmp.55, true
  br i1 %rcc.tmp.56, label %if.then, label %if.else
if.then:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 2, 1
  %rcc.tmp.62 = icmp slt i32 %rcc.tmp.60, %rcc.tmp.61
  br i1 %rcc.tmp.62, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.65 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.66 = getelementptr %Pools, ptr %rcc.tmp.65, i32 0, i32 1
  %rcc.tmp.67 = load i32, ptr %new_node_idx
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [6 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.74 = getelementptr %Pools, ptr %rcc.tmp.73, i32 0, i32 1
  %rcc.tmp.75 = load i32, ptr %child_idx..tmp
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %j
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 2
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = getelementptr [6 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  store i32 %rcc.tmp.83, ptr %rcc.tmp.72
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.91 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.92 = getelementptr %Pools, ptr %rcc.tmp.91, i32 0, i32 3
  %rcc.tmp.93 = load i32, ptr %child_idx..tmp
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [200 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.94
  store i32 2, ptr %rcc.tmp.95
  %rcc.tmp.97 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.98 = getelementptr %Pools, ptr %rcc.tmp.97, i32 0, i32 3
  %rcc.tmp.99 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [200 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.102, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = load i32, ptr %child_idx_in_parent..tmp
  %rcc.tmp.107 = icmp sgt i32 %rcc.tmp.105, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.110 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.111 = getelementptr %Pools, ptr %rcc.tmp.110, i32 0, i32 1
  %rcc.tmp.112 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %j
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 0
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  %rcc.tmp.118 = getelementptr [6 x i32], ptr %rcc.tmp.114, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.120 = getelementptr %Pools, ptr %rcc.tmp.119, i32 0, i32 1
  %rcc.tmp.121 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %j
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = getelementptr [6 x i32], ptr %rcc.tmp.123, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  store i32 %rcc.tmp.127, ptr %rcc.tmp.118
  %rcc.tmp.129 = load i32, ptr %j
  %rcc.tmp.130 = sub i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.133 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.134 = getelementptr %Pools, ptr %rcc.tmp.133, i32 0, i32 1
  %rcc.tmp.135 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.134, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %child_idx_in_parent..tmp
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  %rcc.tmp.141 = getelementptr [6 x i32], ptr %rcc.tmp.137, i32 0, i32 %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %new_node_idx
  store i32 %rcc.tmp.142, ptr %rcc.tmp.141
  %rcc.tmp.144 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.145 = getelementptr %Pools, ptr %rcc.tmp.144, i32 0, i32 3
  %rcc.tmp.146 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = getelementptr [200 x i32], ptr %rcc.tmp.145, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  %rcc.tmp.150 = sub i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.153 = load i32, ptr %j
  %rcc.tmp.154 = load i32, ptr %child_idx_in_parent..tmp
  %rcc.tmp.155 = icmp sge i32 %rcc.tmp.153, %rcc.tmp.154
  br i1 %rcc.tmp.155, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.158 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.159 = getelementptr %Pools, ptr %rcc.tmp.158, i32 0, i32 0
  %rcc.tmp.160 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.159, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.163 = load i32, ptr %j
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 0
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 1
  %rcc.tmp.166 = getelementptr [5 x i32], ptr %rcc.tmp.162, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.167 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.168 = getelementptr %Pools, ptr %rcc.tmp.167, i32 0, i32 0
  %rcc.tmp.169 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.168, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.172 = load i32, ptr %j
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 0
  %rcc.tmp.174 = getelementptr [5 x i32], ptr %rcc.tmp.171, i32 0, i32 %rcc.tmp.173
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.174
  store i32 %rcc.tmp.175, ptr %rcc.tmp.166
  %rcc.tmp.177 = load i32, ptr %j
  %rcc.tmp.178 = sub i32 %rcc.tmp.177, 1
  store i32 %rcc.tmp.178, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.181 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.182 = getelementptr %Pools, ptr %rcc.tmp.181, i32 0, i32 0
  %rcc.tmp.183 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 0
  %rcc.tmp.185 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.182, i32 0, i32 %rcc.tmp.184
  %rcc.tmp.186 = load i32, ptr %child_idx_in_parent..tmp
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 0
  %rcc.tmp.188 = getelementptr [5 x i32], ptr %rcc.tmp.185, i32 0, i32 %rcc.tmp.187
  %rcc.tmp.189 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.190 = getelementptr %Pools, ptr %rcc.tmp.189, i32 0, i32 0
  %rcc.tmp.191 = load i32, ptr %child_idx..tmp
  %rcc.tmp.192 = add i32 %rcc.tmp.191, 0
  %rcc.tmp.193 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.190, i32 0, i32 %rcc.tmp.192
  %rcc.tmp.194 = add i32 2, 0
  %rcc.tmp.195 = getelementptr [5 x i32], ptr %rcc.tmp.193, i32 0, i32 %rcc.tmp.194
  %rcc.tmp.196 = load i32, ptr %rcc.tmp.195
  store i32 %rcc.tmp.196, ptr %rcc.tmp.188
  %rcc.tmp.198 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.199 = getelementptr %Pools, ptr %rcc.tmp.198, i32 0, i32 3
  %rcc.tmp.200 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.201 = add i32 %rcc.tmp.200, 0
  %rcc.tmp.202 = getelementptr [200 x i32], ptr %rcc.tmp.199, i32 0, i32 %rcc.tmp.201
  %rcc.tmp.203 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.204 = getelementptr %Pools, ptr %rcc.tmp.203, i32 0, i32 3
  %rcc.tmp.205 = load i32, ptr %parent_idx..tmp
  %rcc.tmp.206 = add i32 %rcc.tmp.205, 0
  %rcc.tmp.207 = getelementptr [200 x i32], ptr %rcc.tmp.204, i32 0, i32 %rcc.tmp.206
  %rcc.tmp.208 = load i32, ptr %rcc.tmp.207
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %rcc.tmp.202
  ret void
}
define void @insert_non_full.(%Pools* %pools.tmp, i32 %node_idx.tmp, i32 %key.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %node_idx..tmp = alloca i32 
  %key..tmp = alloca i32 
  %i = alloca i32 
  %child_to_insert_idx = alloca i32 
  store %Pools* %pools.tmp, ptr %pools..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.4 = load i32, ptr %node_idx..tmp
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.10 = getelementptr %Pools, ptr %rcc.tmp.9, i32 0, i32 3
  %rcc.tmp.11 = load i32, ptr %node_idx..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [200 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = sub i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %i
  %rcc.tmp.17 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.18 = getelementptr %Pools, ptr %rcc.tmp.17, i32 0, i32 2
  %rcc.tmp.19 = load i32, ptr %node_idx..tmp
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [200 x i1], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i1, ptr %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.cond
while.cond:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = icmp sge i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.30 = getelementptr %Pools, ptr %rcc.tmp.29, i32 0, i32 0
  %rcc.tmp.31 = load i32, ptr %node_idx..tmp
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [5 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %key..tmp
  %rcc.tmp.39 = icmp sle i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then.3, label %if.else.3
if.then.3:
  br label %while.linker
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.43 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.44 = getelementptr %Pools, ptr %rcc.tmp.43, i32 0, i32 0
  %rcc.tmp.45 = load i32, ptr %node_idx..tmp
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  %rcc.tmp.51 = getelementptr [5 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.53 = getelementptr %Pools, ptr %rcc.tmp.52, i32 0, i32 0
  %rcc.tmp.54 = load i32, ptr %node_idx..tmp
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [5 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %rcc.tmp.51
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = sub i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.66 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.67 = getelementptr %Pools, ptr %rcc.tmp.66, i32 0, i32 0
  %rcc.tmp.68 = load i32, ptr %node_idx..tmp
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [5 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.78 = getelementptr %Pools, ptr %rcc.tmp.77, i32 0, i32 3
  %rcc.tmp.79 = load i32, ptr %node_idx..tmp
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [200 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.83 = getelementptr %Pools, ptr %rcc.tmp.82, i32 0, i32 3
  %rcc.tmp.84 = load i32, ptr %node_idx..tmp
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [200 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %rcc.tmp.81
  br label %if.merge.2
if.else.2:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = icmp sge i32 %rcc.tmp.92, 0
  br i1 %rcc.tmp.93, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.96 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.97 = getelementptr %Pools, ptr %rcc.tmp.96, i32 0, i32 0
  %rcc.tmp.98 = load i32, ptr %node_idx..tmp
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [5 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = load i32, ptr %key..tmp
  %rcc.tmp.106 = icmp sle i32 %rcc.tmp.104, %rcc.tmp.105
  br i1 %rcc.tmp.106, label %if.then.4, label %if.else.4
if.then.4:
  br label %while.linker.2
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = sub i32 %rcc.tmp.110, 1
  store i32 %rcc.tmp.111, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %i
  %rcc.tmp.117 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.118 = getelementptr %Pools, ptr %rcc.tmp.117, i32 0, i32 1
  %rcc.tmp.119 = load i32, ptr %node_idx..tmp
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [6 x i32], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.124
  store i32 %rcc.tmp.125, ptr %child_to_insert_idx
  %rcc.tmp.127 = load i32, ptr %child_to_insert_idx
  %rcc.tmp.128 = icmp sge i32 %rcc.tmp.127, 0
  br i1 %rcc.tmp.128, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.130 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.131 = getelementptr %Pools, ptr %rcc.tmp.130, i32 0, i32 3
  %rcc.tmp.132 = load i32, ptr %child_to_insert_idx
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = getelementptr [200 x i32], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.134
  %rcc.tmp.136 = icmp eq i32 %rcc.tmp.135, 4
  br label %sc.merge
sc.merge:
  %rcc.tmp.138 = phi i1 [0, %while.end.2], [%rcc.tmp.136, %and.rhs]
  br i1 %rcc.tmp.138, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.140 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.141 = load i32, ptr %node_idx..tmp
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = load i32, ptr %child_to_insert_idx
  call void @split_child.(%Pools* %rcc.tmp.140, i32 %rcc.tmp.141, i32 %rcc.tmp.142, i32 %rcc.tmp.143)
  %rcc.tmp.145 = load i32, ptr %key..tmp
  %rcc.tmp.146 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.147 = getelementptr %Pools, ptr %rcc.tmp.146, i32 0, i32 0
  %rcc.tmp.148 = load i32, ptr %node_idx..tmp
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 0
  %rcc.tmp.150 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.147, i32 0, i32 %rcc.tmp.149
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = getelementptr [5 x i32], ptr %rcc.tmp.150, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = icmp sgt i32 %rcc.tmp.145, %rcc.tmp.154
  br i1 %rcc.tmp.155, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.157 = load i32, ptr %i
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 1
  store i32 %rcc.tmp.158, ptr %i
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.164 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.165 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.166 = getelementptr %Pools, ptr %rcc.tmp.165, i32 0, i32 1
  %rcc.tmp.167 = load i32, ptr %node_idx..tmp
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 0
  %rcc.tmp.169 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.166, i32 0, i32 %rcc.tmp.168
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 0
  %rcc.tmp.172 = getelementptr [6 x i32], ptr %rcc.tmp.169, i32 0, i32 %rcc.tmp.171
  %rcc.tmp.173 = load i32, ptr %rcc.tmp.172
  %rcc.tmp.174 = load i32, ptr %key..tmp
  call void @insert_non_full.(%Pools* %rcc.tmp.164, i32 %rcc.tmp.173, i32 %rcc.tmp.174)
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @insert.(%Pools* %pools.tmp, i32 %key.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %key..tmp = alloca i32 
  %root = alloca i32 
  %new_root_idx = alloca i32 
  store %Pools* %pools.tmp, ptr %pools..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.3 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.4 = getelementptr %Pools, ptr %rcc.tmp.3, i32 0, i32 5
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = sub i32 0, 1
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.10 = getelementptr %Pools, ptr %rcc.tmp.9, i32 0, i32 5
  %rcc.tmp.11 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.12 = call i32 @create_node.(%Pools* %rcc.tmp.11, i1 1)
  store i32 %rcc.tmp.12, ptr %rcc.tmp.10
  %rcc.tmp.14 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.15 = getelementptr %Pools, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.17 = getelementptr %Pools, ptr %rcc.tmp.16, i32 0, i32 5
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [5 x i32], ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.25 = getelementptr %Pools, ptr %rcc.tmp.24, i32 0, i32 3
  %rcc.tmp.26 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.27 = getelementptr %Pools, ptr %rcc.tmp.26, i32 0, i32 5
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [200 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.29
  store i32 1, ptr %rcc.tmp.30
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.35 = getelementptr %Pools, ptr %rcc.tmp.34, i32 0, i32 5
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %root
  %rcc.tmp.38 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.39 = getelementptr %Pools, ptr %rcc.tmp.38, i32 0, i32 3
  %rcc.tmp.40 = load i32, ptr %root
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [200 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.43, 4
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.47 = call i32 @create_node.(%Pools* %rcc.tmp.46, i1 0)
  store i32 %rcc.tmp.47, ptr %new_root_idx
  %rcc.tmp.49 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.50 = getelementptr %Pools, ptr %rcc.tmp.49, i32 0, i32 5
  %rcc.tmp.51 = load i32, ptr %new_root_idx
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.54 = getelementptr %Pools, ptr %rcc.tmp.53, i32 0, i32 1
  %rcc.tmp.55 = load i32, ptr %new_root_idx
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [6 x i32], ptr %rcc.tmp.57, i32 0, i32 0
  %rcc.tmp.59 = load i32, ptr %root
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.62 = load i32, ptr %new_root_idx
  %rcc.tmp.63 = load i32, ptr %root
  call void @split_child.(%Pools* %rcc.tmp.61, i32 %rcc.tmp.62, i32 0, i32 %rcc.tmp.63)
  %rcc.tmp.65 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.66 = load i32, ptr %new_root_idx
  %rcc.tmp.67 = load i32, ptr %key..tmp
  call void @insert_non_full.(%Pools* %rcc.tmp.65, i32 %rcc.tmp.66, i32 %rcc.tmp.67)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.70 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.71 = load i32, ptr %root
  %rcc.tmp.72 = load i32, ptr %key..tmp
  call void @insert_non_full.(%Pools* %rcc.tmp.70, i32 %rcc.tmp.71, i32 %rcc.tmp.72)
  br label %if.merge.2
if.merge.2:
  ret void
}
define i1 @search_recursive.(%Pools* %pools.tmp, i32 %node_idx.tmp, i32 %key.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %node_idx..tmp = alloca i32 
  %key..tmp = alloca i32 
  %i = alloca i32 
  %child_idx = alloca i32 
  store %Pools* %pools.tmp, ptr %pools..tmp
  store i32 %node_idx.tmp, ptr %node_idx..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.8 = getelementptr %Pools, ptr %rcc.tmp.7, i32 0, i32 3
  %rcc.tmp.9 = load i32, ptr %node_idx..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = getelementptr [200 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %key..tmp
  %rcc.tmp.17 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.18 = getelementptr %Pools, ptr %rcc.tmp.17, i32 0, i32 0
  %rcc.tmp.19 = load i32, ptr %node_idx..tmp
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [5 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.30 = load i32, ptr %key..tmp
  %rcc.tmp.31 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.32 = getelementptr %Pools, ptr %rcc.tmp.31, i32 0, i32 0
  %rcc.tmp.33 = load i32, ptr %node_idx..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [5 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.30, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.48 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.49 = getelementptr %Pools, ptr %rcc.tmp.48, i32 0, i32 2
  %rcc.tmp.50 = load i32, ptr %node_idx..tmp
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [200 x i1], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i1, ptr %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  %rcc.tmp.56 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.57 = getelementptr %Pools, ptr %rcc.tmp.56, i32 0, i32 1
  %rcc.tmp.58 = load i32, ptr %node_idx..tmp
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [6 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %child_idx
  %rcc.tmp.66 = load i32, ptr %child_idx
  %rcc.tmp.67 = sub i32 0, 1
  %rcc.tmp.68 = icmp eq i32 %rcc.tmp.66, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %if.then.4, label %if.else.4
if.then.4:
  ret i1 0
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.72 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.73 = load i32, ptr %child_idx
  %rcc.tmp.74 = load i32, ptr %key..tmp
  %rcc.tmp.75 = call i1 @search_recursive.(%Pools* %rcc.tmp.72, i32 %rcc.tmp.73, i32 %rcc.tmp.74)
  ret i1 %rcc.tmp.75
if.merge.3:
  ret i1 undef
}
define i32 @traverse_and_sum.(%Pools* %pools.tmp, i32 %node_idx.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %node_idx..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  %is_leaf = alloca i1 
  store %Pools* %pools.tmp, ptr %pools..tmp
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
  store i32 0, ptr %sum
  store i32 0, ptr %i
  %rcc.tmp.11 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.12 = getelementptr %Pools, ptr %rcc.tmp.11, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %node_idx..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [200 x i1], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i1, ptr %rcc.tmp.15
  store i1 %rcc.tmp.16, ptr %is_leaf
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.21 = getelementptr %Pools, ptr %rcc.tmp.20, i32 0, i32 3
  %rcc.tmp.22 = load i32, ptr %node_idx..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [200 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = load i1, ptr %is_leaf
  %rcc.tmp.30 = xor i1 %rcc.tmp.29, true
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.32 = load i32, ptr %sum
  %rcc.tmp.33 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.34 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.35 = getelementptr %Pools, ptr %rcc.tmp.34, i32 0, i32 1
  %rcc.tmp.36 = load i32, ptr %node_idx..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [6 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = call i32 @traverse_and_sum.(%Pools* %rcc.tmp.33, i32 %rcc.tmp.42)
  %rcc.tmp.44 = add i32 %rcc.tmp.32, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %sum
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.48 = load i32, ptr %sum
  %rcc.tmp.49 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.50 = getelementptr %Pools, ptr %rcc.tmp.49, i32 0, i32 0
  %rcc.tmp.51 = load i32, ptr %node_idx..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [5 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.48, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %sum
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.64 = load i1, ptr %is_leaf
  %rcc.tmp.65 = xor i1 %rcc.tmp.64, true
  br i1 %rcc.tmp.65, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.67 = load i32, ptr %sum
  %rcc.tmp.68 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.69 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.70 = getelementptr %Pools, ptr %rcc.tmp.69, i32 0, i32 1
  %rcc.tmp.71 = load i32, ptr %node_idx..tmp
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [6 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = call i32 @traverse_and_sum.(%Pools* %rcc.tmp.68, i32 %rcc.tmp.77)
  %rcc.tmp.79 = add i32 %rcc.tmp.67, %rcc.tmp.78
  store i32 %rcc.tmp.79, ptr %sum
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.83 = load i32, ptr %sum
  ret i32 %rcc.tmp.83
}
define i32 @get_height.(%Pools* %pools.tmp, i32 %node_idx.tmp) {
entry:
  %pools..tmp = alloca %Pools* 
  %node_idx..tmp = alloca i32 
  store %Pools* %pools.tmp, ptr %pools..tmp
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
  %rcc.tmp.9 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.10 = getelementptr %Pools, ptr %rcc.tmp.9, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %node_idx..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [200 x i1], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.14 = load i1, ptr %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.18 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.19 = load %Pools*, ptr %pools..tmp
  %rcc.tmp.20 = getelementptr %Pools, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = load i32, ptr %node_idx..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [6 x i32], ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = call i32 @get_height.(%Pools* %rcc.tmp.18, i32 %rcc.tmp.25)
  %rcc.tmp.27 = add i32 1, %rcc.tmp.26
  ret i32 %rcc.tmp.27
}
define void @main() {
entry:
  %pools = alloca %Pools 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %i = alloca i32 
  %keys_to_insert = alloca [100 x i32] 
  %fill.idx.5 = alloca i32 
  %current = alloca i32 
  %step = alloca i32 
  %modulus = alloca i32 
  %found_count = alloca i32 
  %not_found_count = alloca i32 
  %sum = alloca i32 
  %height = alloca i32 
  %new_sum = alloca i32 
  %new_height = alloca i32 
  %final_check = alloca i32 
  %j = alloca i32 
  %final_sum = alloca i32 
  %k = alloca i32 
  %total_nodes = alloca i32 
  %error_flag = alloca i1 
  %m = alloca i32 
  %error_flag.2 = alloca i1 
  %rcc.tmp.1 = getelementptr %Pools, ptr %pools, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 200
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [200 x [5 x i32]], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [5 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [5 x i32], ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [5 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [5 x i32], ptr %rcc.tmp.8, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [5 x i32], ptr %rcc.tmp.8, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.22 = getelementptr %Pools, ptr %pools, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.25 = load i32, ptr %fill.idx.2
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 200
  br i1 %rcc.tmp.26, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.28 = load i32, ptr %fill.idx.2
  %rcc.tmp.29 = getelementptr [200 x [6 x i32]], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = sub i32 0, 1
  %rcc.tmp.31 = getelementptr [6 x i32], ptr %rcc.tmp.29, i32 0, i32 0
  store i32 %rcc.tmp.30, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [6 x i32], ptr %rcc.tmp.29, i32 0, i32 1
  store i32 %rcc.tmp.30, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [6 x i32], ptr %rcc.tmp.29, i32 0, i32 2
  store i32 %rcc.tmp.30, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [6 x i32], ptr %rcc.tmp.29, i32 0, i32 3
  store i32 %rcc.tmp.30, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [6 x i32], ptr %rcc.tmp.29, i32 0, i32 4
  store i32 %rcc.tmp.30, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [6 x i32], ptr %rcc.tmp.29, i32 0, i32 5
  store i32 %rcc.tmp.30, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.43, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.46 = getelementptr %Pools, ptr %pools, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.49 = load i32, ptr %fill.idx.3
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 200
  br i1 %rcc.tmp.50, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.52 = load i32, ptr %fill.idx.3
  %rcc.tmp.53 = getelementptr [200 x i1], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.52
  store i1 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.55, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.58 = getelementptr %Pools, ptr %pools, i32 0, i32 3
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.61 = load i32, ptr %fill.idx.4
  %rcc.tmp.62 = icmp slt i32 %rcc.tmp.61, 200
  br i1 %rcc.tmp.62, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.64 = load i32, ptr %fill.idx.4
  %rcc.tmp.65 = getelementptr [200 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.64
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.67, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.70 = getelementptr %Pools, ptr %pools, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.73 = sub i32 0, 1
  store i32 %rcc.tmp.73, ptr %rcc.tmp.72
  store i32 0, ptr %i
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.78 = load i32, ptr %fill.idx.5
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.78, 100
  br i1 %rcc.tmp.79, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.81 = load i32, ptr %fill.idx.5
  %rcc.tmp.82 = getelementptr [100 x i32], ptr %keys_to_insert, i32 0, i32 %rcc.tmp.81
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.84, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 100, ptr %current
  store i32 37, ptr %step
  store i32 251, ptr %modulus
  br label %while.cond
while.cond:
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.91, 100
  br i1 %rcc.tmp.92, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.95 = load i32, ptr %current
  %rcc.tmp.96 = load i32, ptr %step
  %rcc.tmp.97 = add i32 %rcc.tmp.95, %rcc.tmp.96
  %rcc.tmp.98 = load i32, ptr %modulus
  %rcc.tmp.99 = srem i32 %rcc.tmp.97, %rcc.tmp.98
  store i32 %rcc.tmp.99, ptr %current
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [100 x i32], ptr %keys_to_insert, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %current
  store i32 %rcc.tmp.104, ptr %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = icmp slt i32 %rcc.tmp.112, 100
  br i1 %rcc.tmp.113, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [100 x i32], ptr %keys_to_insert, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  call void @insert.(%Pools* %pools, i32 %rcc.tmp.119)
  %rcc.tmp.121 = load i32, ptr %i
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.122, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %found_count
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = icmp slt i32 %rcc.tmp.128, 100
  br i1 %rcc.tmp.129, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.132 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.132
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [100 x i32], ptr %keys_to_insert, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.136
  %rcc.tmp.138 = call i1 @search_recursive.(%Pools* %pools, i32 %rcc.tmp.133, i32 %rcc.tmp.137)
  br i1 %rcc.tmp.138, label %if.then, label %if.else
if.then:
  %rcc.tmp.140 = load i32, ptr %found_count
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 1
  store i32 %rcc.tmp.141, ptr %found_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.145 = load i32, ptr %i
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.149 = load i32, ptr %found_count
  call void @printlnInt.(i32 %rcc.tmp.149)
  store i32 0, ptr %not_found_count
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.154 = load i32, ptr %i
  %rcc.tmp.155 = icmp slt i32 %rcc.tmp.154, 50
  br i1 %rcc.tmp.155, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.158 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = add i32 300, %rcc.tmp.160
  %rcc.tmp.162 = call i1 @search_recursive.(%Pools* %pools, i32 %rcc.tmp.159, i32 %rcc.tmp.161)
  %rcc.tmp.163 = xor i1 %rcc.tmp.162, true
  br i1 %rcc.tmp.163, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.165 = load i32, ptr %not_found_count
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %not_found_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 1
  store i32 %rcc.tmp.171, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.174 = load i32, ptr %not_found_count
  call void @printlnInt.(i32 %rcc.tmp.174)
  %rcc.tmp.176 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.177 = load i32, ptr %rcc.tmp.176
  %rcc.tmp.178 = call i32 @traverse_and_sum.(%Pools* %pools, i32 %rcc.tmp.177)
  store i32 %rcc.tmp.178, ptr %sum
  %rcc.tmp.180 = load i32, ptr %sum
  call void @printlnInt.(i32 %rcc.tmp.180)
  %rcc.tmp.182 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.182
  %rcc.tmp.184 = call i32 @get_height.(%Pools* %pools, i32 %rcc.tmp.183)
  store i32 %rcc.tmp.184, ptr %height
  %rcc.tmp.186 = load i32, ptr %height
  call void @printlnInt.(i32 %rcc.tmp.186)
  call void @insert.(%Pools* %pools, i32 500)
  call void @insert.(%Pools* %pools, i32 501)
  call void @insert.(%Pools* %pools, i32 502)
  call void @insert.(%Pools* %pools, i32 503)
  call void @insert.(%Pools* %pools, i32 504)
  call void @insert.(%Pools* %pools, i32 505)
  %rcc.tmp.194 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.195 = load i32, ptr %rcc.tmp.194
  %rcc.tmp.196 = call i32 @traverse_and_sum.(%Pools* %pools, i32 %rcc.tmp.195)
  store i32 %rcc.tmp.196, ptr %new_sum
  %rcc.tmp.198 = load i32, ptr %new_sum
  call void @printlnInt.(i32 %rcc.tmp.198)
  %rcc.tmp.200 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.201 = load i32, ptr %rcc.tmp.200
  %rcc.tmp.202 = call i32 @get_height.(%Pools* %pools, i32 %rcc.tmp.201)
  store i32 %rcc.tmp.202, ptr %new_height
  %rcc.tmp.204 = load i32, ptr %new_height
  call void @printlnInt.(i32 %rcc.tmp.204)
  store i32 0, ptr %final_check
  %rcc.tmp.207 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.208 = load i32, ptr %rcc.tmp.207
  %rcc.tmp.209 = call i1 @search_recursive.(%Pools* %pools, i32 %rcc.tmp.208, i32 503)
  br i1 %rcc.tmp.209, label %if.then.3, label %if.else.3
if.then.3:
  store i32 1, ptr %final_check
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.214 = load i32, ptr %final_check
  call void @printlnInt.(i32 %rcc.tmp.214)
  %rcc.tmp.216 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  %rcc.tmp.218 = call i1 @search_recursive.(%Pools* %pools, i32 %rcc.tmp.217, i32 999)
  %rcc.tmp.219 = xor i1 %rcc.tmp.218, true
  br i1 %rcc.tmp.219, label %if.then.4, label %if.else.4
if.then.4:
  store i32 2, ptr %final_check
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.224 = load i32, ptr %final_check
  call void @printlnInt.(i32 %rcc.tmp.224)
  store i32 100, ptr %j
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.228 = load i32, ptr %j
  %rcc.tmp.229 = icmp slt i32 %rcc.tmp.228, 150
  br i1 %rcc.tmp.229, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.232 = load i32, ptr %j
  %rcc.tmp.233 = mul i32 %rcc.tmp.232, 3
  call void @insert.(%Pools* %pools, i32 %rcc.tmp.233)
  %rcc.tmp.235 = load i32, ptr %j
  %rcc.tmp.236 = add i32 %rcc.tmp.235, 1
  store i32 %rcc.tmp.236, ptr %j
  br label %while.cond.5
while.end.5:
  %rcc.tmp.239 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.240 = load i32, ptr %rcc.tmp.239
  %rcc.tmp.241 = call i32 @traverse_and_sum.(%Pools* %pools, i32 %rcc.tmp.240)
  store i32 %rcc.tmp.241, ptr %final_sum
  %rcc.tmp.243 = load i32, ptr %final_sum
  call void @printlnInt.(i32 %rcc.tmp.243)
  %rcc.tmp.245 = getelementptr %Pools, ptr %pools, i32 0, i32 5
  %rcc.tmp.246 = load i32, ptr %rcc.tmp.245
  %rcc.tmp.247 = call i32 @get_height.(%Pools* %pools, i32 %rcc.tmp.246)
  call void @printlnInt.(i32 %rcc.tmp.247)
  store i32 0, ptr %k
  store i32 0, ptr %total_nodes
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.252 = load i32, ptr %k
  %rcc.tmp.253 = getelementptr %Pools, ptr %pools, i32 0, i32 4
  %rcc.tmp.254 = load i32, ptr %rcc.tmp.253
  %rcc.tmp.255 = icmp slt i32 %rcc.tmp.252, %rcc.tmp.254
  br i1 %rcc.tmp.255, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.258 = getelementptr %Pools, ptr %pools, i32 0, i32 3
  %rcc.tmp.259 = load i32, ptr %k
  %rcc.tmp.260 = add i32 %rcc.tmp.259, 0
  %rcc.tmp.261 = getelementptr [200 x i32], ptr %rcc.tmp.258, i32 0, i32 %rcc.tmp.260
  %rcc.tmp.262 = load i32, ptr %rcc.tmp.261
  %rcc.tmp.263 = icmp sgt i32 %rcc.tmp.262, 0
  br i1 %rcc.tmp.263, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.265 = load i32, ptr %total_nodes
  %rcc.tmp.266 = add i32 %rcc.tmp.265, 1
  store i32 %rcc.tmp.266, ptr %total_nodes
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.270 = load i32, ptr %k
  %rcc.tmp.271 = add i32 %rcc.tmp.270, 1
  store i32 %rcc.tmp.271, ptr %k
  br label %while.cond.6
while.end.6:
  %rcc.tmp.274 = load i32, ptr %total_nodes
  call void @printlnInt.(i32 %rcc.tmp.274)
  store i1 0, ptr %error_flag
  store i32 0, ptr %m
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.279 = load i32, ptr %m
  %rcc.tmp.280 = icmp slt i32 %rcc.tmp.279, 10
  br i1 %rcc.tmp.280, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.283 = load i32, ptr %m
  %rcc.tmp.284 = icmp sgt i32 %rcc.tmp.283, 5
  br i1 %rcc.tmp.284, label %if.then.6, label %if.else.6
if.then.6:
  store i1 1, ptr %error_flag.2
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.289 = load i32, ptr %m
  %rcc.tmp.290 = add i32 %rcc.tmp.289, 1
  store i32 %rcc.tmp.290, ptr %m
  br label %while.cond.7
while.end.7:
  %rcc.tmp.293 = load i1, ptr %error_flag
  br i1 %rcc.tmp.293, label %if.then.7, label %if.else.7
if.then.7:
  call void @printlnInt.(i32 999)
  br label %if.merge.7
if.else.7:
  call void @printlnInt.(i32 888)
  br label %if.merge.7
if.merge.7:
  call void @exit.(i32 0)
  ret void
}
