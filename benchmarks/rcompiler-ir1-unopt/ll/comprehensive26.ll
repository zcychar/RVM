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
  %table_size = alloca i32 
  %index_size = alloca i32 
  %buffer_pool_size = alloca i32 
  %max_transactions = alloca i32 
  %lock_table_size = alloca i32 
  call void @printlnInt.(i32 26000)
  store i32 1000, ptr %table_size
  store i32 500, ptr %index_size
  store i32 100, ptr %buffer_pool_size
  store i32 50, ptr %max_transactions
  store i32 200, ptr %lock_table_size
  %rcc.tmp.7 = load i32, ptr %index_size
  call void @performBPlusTreeOperations.(i32 %rcc.tmp.7)
  %rcc.tmp.9 = load i32, ptr %table_size
  call void @performQueryExecutionTest.(i32 %rcc.tmp.9)
  %rcc.tmp.11 = load i32, ptr %max_transactions
  call void @performTransactionProcessingTest.(i32 %rcc.tmp.11)
  %rcc.tmp.13 = load i32, ptr %buffer_pool_size
  call void @performBufferPoolTest.(i32 %rcc.tmp.13)
  %rcc.tmp.15 = load i32, ptr %table_size
  call void @performQueryOptimizationTest.(i32 %rcc.tmp.15)
  %rcc.tmp.17 = load i32, ptr %table_size
  call void @performHashTableTest.(i32 %rcc.tmp.17)
  call void @printlnInt.(i32 26999)
  call void @exit.(i32 0)
  ret void
}
define void @performBPlusTreeOperations.(i32 %max_keys.tmp) {
entry:
  %max_keys..tmp = alloca i32 
  %btree_keys = alloca [100 x [10 x i32]] 
  %fill.idx = alloca i32 
  %btree_children = alloca [100 x [11 x i32]] 
  %fill.idx.2 = alloca i32 
  %btree_parent = alloca [100 x i32] 
  %fill.idx.3 = alloca i32 
  %btree_is_leaf = alloca [100 x i1] 
  %fill.idx.4 = alloca i32 
  %btree_key_count = alloca [100 x i32] 
  %fill.idx.5 = alloca i32 
  %node_count = alloca i32 
  %root_node = alloca i32 
  %insert_sequence = alloca [100 x i32] 
  %fill.idx.6 = alloca i32 
  %i = alloca i32 
  %key_to_insert = alloca i32 
  %current_node = alloca i32 
  %child_index = alloca i32 
  %j = alloca i32 
  %insert_pos = alloca i32 
  %k = alloca i32 
  %shift_index = alloca i32 
  %new_node = alloca i32 
  %move_index = alloca i32 
  %insert_pos.2 = alloca i32 
  %k.2 = alloca i32 
  %shift_index.2 = alloca i32 
  %insert_pos.3 = alloca i32 
  %k.3 = alloca i32 
  %shift_index.3 = alloca i32 
  %range_sum = alloca i32 
  %query_count = alloca i32 
  %range_start = alloca i32 
  %range_end = alloca i32 
  %current_sum = alloca i32 
  store i32 %max_keys.tmp, ptr %max_keys..tmp
  call void @printlnInt.(i32 26001)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [10 x i32], ptr %rcc.tmp.9, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.30, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.35 = load i32, ptr %fill.idx.2
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 100
  br i1 %rcc.tmp.36, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.38 = load i32, ptr %fill.idx.2
  %rcc.tmp.39 = getelementptr [100 x [11 x i32]], ptr %btree_children, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = sub i32 0, 1
  %rcc.tmp.41 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 0
  store i32 %rcc.tmp.40, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 1
  store i32 %rcc.tmp.40, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 2
  store i32 %rcc.tmp.40, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 3
  store i32 %rcc.tmp.40, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 4
  store i32 %rcc.tmp.40, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 5
  store i32 %rcc.tmp.40, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 6
  store i32 %rcc.tmp.40, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 7
  store i32 %rcc.tmp.40, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 8
  store i32 %rcc.tmp.40, ptr %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 9
  store i32 %rcc.tmp.40, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [11 x i32], ptr %rcc.tmp.39, i32 0, i32 10
  store i32 %rcc.tmp.40, ptr %rcc.tmp.61
  %rcc.tmp.63 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.63, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.68 = load i32, ptr %fill.idx.3
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.68, 100
  br i1 %rcc.tmp.69, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.71 = load i32, ptr %fill.idx.3
  %rcc.tmp.72 = getelementptr [100 x i32], ptr %btree_parent, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = sub i32 0, 1
  store i32 %rcc.tmp.73, ptr %rcc.tmp.72
  %rcc.tmp.75 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.75, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.80 = load i32, ptr %fill.idx.4
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.80, 100
  br i1 %rcc.tmp.81, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.83 = load i32, ptr %fill.idx.4
  %rcc.tmp.84 = getelementptr [100 x i1], ptr %btree_is_leaf, i32 0, i32 %rcc.tmp.83
  store i1 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.86, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.91 = load i32, ptr %fill.idx.5
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.91, 100
  br i1 %rcc.tmp.92, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.94 = load i32, ptr %fill.idx.5
  %rcc.tmp.95 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.94
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.97, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 1, ptr %node_count
  store i32 0, ptr %root_node
  %rcc.tmp.102 = getelementptr [100 x i1], ptr %btree_is_leaf, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.102
  %rcc.tmp.104 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.104
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.108 = load i32, ptr %fill.idx.6
  %rcc.tmp.109 = icmp slt i32 %rcc.tmp.108, 100
  br i1 %rcc.tmp.109, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.111 = load i32, ptr %fill.idx.6
  %rcc.tmp.112 = getelementptr [100 x i32], ptr %insert_sequence, i32 0, i32 %rcc.tmp.111
  store i32 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.114, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = load i32, ptr %max_keys..tmp
  %rcc.tmp.121 = icmp slt i32 %rcc.tmp.119, %rcc.tmp.120
  br i1 %rcc.tmp.121, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = icmp slt i32 %rcc.tmp.123, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.126 = phi i1 [0, %while.cond], [%rcc.tmp.124, %and.rhs]
  br i1 %rcc.tmp.126, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 0
  %rcc.tmp.131 = getelementptr [100 x i32], ptr %insert_sequence, i32 0, i32 %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = mul i32 %rcc.tmp.132, 17
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 23
  %rcc.tmp.135 = srem i32 %rcc.tmp.134, 997
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 1
  store i32 %rcc.tmp.136, ptr %rcc.tmp.131
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.144 = load i32, ptr %i
  %rcc.tmp.145 = load i32, ptr %max_keys..tmp
  %rcc.tmp.146 = icmp slt i32 %rcc.tmp.144, %rcc.tmp.145
  br i1 %rcc.tmp.146, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = icmp slt i32 %rcc.tmp.148, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.151 = phi i1 [0, %while.cond.2], [%rcc.tmp.149, %and.rhs.2]
  br i1 %rcc.tmp.151, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.154 = load i32, ptr %i
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [100 x i32], ptr %insert_sequence, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  store i32 %rcc.tmp.157, ptr %key_to_insert
  %rcc.tmp.159 = load i32, ptr %root_node
  store i32 %rcc.tmp.159, ptr %current_node
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.162 = load i32, ptr %current_node
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 0
  %rcc.tmp.164 = getelementptr [100 x i1], ptr %btree_is_leaf, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.165 = load i1, ptr %rcc.tmp.164
  %rcc.tmp.166 = xor i1 %rcc.tmp.165, true
  br i1 %rcc.tmp.166, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %child_index
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.172 = load i32, ptr %j
  %rcc.tmp.173 = load i32, ptr %current_node
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.174
  %rcc.tmp.176 = load i32, ptr %rcc.tmp.175
  %rcc.tmp.177 = icmp slt i32 %rcc.tmp.172, %rcc.tmp.176
  br i1 %rcc.tmp.177, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.180 = load i32, ptr %key_to_insert
  %rcc.tmp.181 = load i32, ptr %current_node
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = load i32, ptr %j
  %rcc.tmp.185 = add i32 %rcc.tmp.184, 0
  %rcc.tmp.186 = getelementptr [10 x i32], ptr %rcc.tmp.183, i32 0, i32 %rcc.tmp.185
  %rcc.tmp.187 = load i32, ptr %rcc.tmp.186
  %rcc.tmp.188 = icmp sgt i32 %rcc.tmp.180, %rcc.tmp.187
  br i1 %rcc.tmp.188, label %if.then, label %if.else
if.then:
  %rcc.tmp.190 = load i32, ptr %j
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 1
  store i32 %rcc.tmp.191, ptr %child_index
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.195 = load i32, ptr %j
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 1
  store i32 %rcc.tmp.196, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.199 = load i32, ptr %current_node
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 0
  %rcc.tmp.201 = getelementptr [100 x [11 x i32]], ptr %btree_children, i32 0, i32 %rcc.tmp.200
  %rcc.tmp.202 = load i32, ptr %child_index
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 0
  %rcc.tmp.204 = getelementptr [11 x i32], ptr %rcc.tmp.201, i32 0, i32 %rcc.tmp.203
  %rcc.tmp.205 = load i32, ptr %rcc.tmp.204
  store i32 %rcc.tmp.205, ptr %current_node
  br label %while.cond.3
while.end.3:
  %rcc.tmp.208 = load i32, ptr %current_node
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 0
  %rcc.tmp.210 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.209
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.210
  %rcc.tmp.212 = icmp slt i32 %rcc.tmp.211, 9
  br i1 %rcc.tmp.212, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.214 = load i32, ptr %current_node
  %rcc.tmp.215 = add i32 %rcc.tmp.214, 0
  %rcc.tmp.216 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.215
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  store i32 %rcc.tmp.217, ptr %insert_pos
  store i32 0, ptr %k
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.221 = load i32, ptr %k
  %rcc.tmp.222 = load i32, ptr %current_node
  %rcc.tmp.223 = add i32 %rcc.tmp.222, 0
  %rcc.tmp.224 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.223
  %rcc.tmp.225 = load i32, ptr %rcc.tmp.224
  %rcc.tmp.226 = icmp slt i32 %rcc.tmp.221, %rcc.tmp.225
  br i1 %rcc.tmp.226, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.229 = load i32, ptr %key_to_insert
  %rcc.tmp.230 = load i32, ptr %current_node
  %rcc.tmp.231 = add i32 %rcc.tmp.230, 0
  %rcc.tmp.232 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.231
  %rcc.tmp.233 = load i32, ptr %k
  %rcc.tmp.234 = add i32 %rcc.tmp.233, 0
  %rcc.tmp.235 = getelementptr [10 x i32], ptr %rcc.tmp.232, i32 0, i32 %rcc.tmp.234
  %rcc.tmp.236 = load i32, ptr %rcc.tmp.235
  %rcc.tmp.237 = icmp slt i32 %rcc.tmp.229, %rcc.tmp.236
  br i1 %rcc.tmp.237, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.239 = load i32, ptr %k
  store i32 %rcc.tmp.239, ptr %insert_pos
  br label %while.linker.5
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.243 = load i32, ptr %k
  %rcc.tmp.244 = add i32 %rcc.tmp.243, 1
  store i32 %rcc.tmp.244, ptr %k
  br label %while.cond.5
while.end.5:
  %rcc.tmp.247 = load i32, ptr %current_node
  %rcc.tmp.248 = add i32 %rcc.tmp.247, 0
  %rcc.tmp.249 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.248
  %rcc.tmp.250 = load i32, ptr %rcc.tmp.249
  store i32 %rcc.tmp.250, ptr %shift_index
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.253 = load i32, ptr %shift_index
  %rcc.tmp.254 = load i32, ptr %insert_pos
  %rcc.tmp.255 = icmp sgt i32 %rcc.tmp.253, %rcc.tmp.254
  br i1 %rcc.tmp.255, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.258 = load i32, ptr %current_node
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 0
  %rcc.tmp.260 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.259
  %rcc.tmp.261 = load i32, ptr %shift_index
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 0
  %rcc.tmp.263 = getelementptr [10 x i32], ptr %rcc.tmp.260, i32 0, i32 %rcc.tmp.262
  %rcc.tmp.264 = load i32, ptr %current_node
  %rcc.tmp.265 = add i32 %rcc.tmp.264, 0
  %rcc.tmp.266 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.265
  %rcc.tmp.267 = load i32, ptr %shift_index
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = sub i32 %rcc.tmp.268, 1
  %rcc.tmp.270 = getelementptr [10 x i32], ptr %rcc.tmp.266, i32 0, i32 %rcc.tmp.269
  %rcc.tmp.271 = load i32, ptr %rcc.tmp.270
  store i32 %rcc.tmp.271, ptr %rcc.tmp.263
  %rcc.tmp.273 = load i32, ptr %shift_index
  %rcc.tmp.274 = sub i32 %rcc.tmp.273, 1
  store i32 %rcc.tmp.274, ptr %shift_index
  br label %while.cond.6
while.end.6:
  %rcc.tmp.277 = load i32, ptr %current_node
  %rcc.tmp.278 = add i32 %rcc.tmp.277, 0
  %rcc.tmp.279 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.278
  %rcc.tmp.280 = load i32, ptr %insert_pos
  %rcc.tmp.281 = add i32 %rcc.tmp.280, 0
  %rcc.tmp.282 = getelementptr [10 x i32], ptr %rcc.tmp.279, i32 0, i32 %rcc.tmp.281
  %rcc.tmp.283 = load i32, ptr %key_to_insert
  store i32 %rcc.tmp.283, ptr %rcc.tmp.282
  %rcc.tmp.285 = load i32, ptr %current_node
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 0
  %rcc.tmp.287 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.286
  %rcc.tmp.288 = load i32, ptr %current_node
  %rcc.tmp.289 = add i32 %rcc.tmp.288, 0
  %rcc.tmp.290 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.289
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.290
  %rcc.tmp.292 = add i32 %rcc.tmp.291, 1
  store i32 %rcc.tmp.292, ptr %rcc.tmp.287
  br label %if.merge.2
if.else.2:
  %rcc.tmp.295 = load i32, ptr %node_count
  %rcc.tmp.296 = icmp slt i32 %rcc.tmp.295, 99
  br i1 %rcc.tmp.296, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.298 = load i32, ptr %node_count
  store i32 %rcc.tmp.298, ptr %new_node
  %rcc.tmp.300 = load i32, ptr %node_count
  %rcc.tmp.301 = add i32 %rcc.tmp.300, 1
  store i32 %rcc.tmp.301, ptr %node_count
  %rcc.tmp.303 = load i32, ptr %new_node
  %rcc.tmp.304 = add i32 %rcc.tmp.303, 0
  %rcc.tmp.305 = getelementptr [100 x i1], ptr %btree_is_leaf, i32 0, i32 %rcc.tmp.304
  store i1 1, ptr %rcc.tmp.305
  %rcc.tmp.307 = load i32, ptr %new_node
  %rcc.tmp.308 = add i32 %rcc.tmp.307, 0
  %rcc.tmp.309 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.308
  store i32 5, ptr %rcc.tmp.309
  %rcc.tmp.311 = load i32, ptr %new_node
  %rcc.tmp.312 = add i32 %rcc.tmp.311, 0
  %rcc.tmp.313 = getelementptr [100 x i32], ptr %btree_parent, i32 0, i32 %rcc.tmp.312
  %rcc.tmp.314 = load i32, ptr %current_node
  %rcc.tmp.315 = add i32 %rcc.tmp.314, 0
  %rcc.tmp.316 = getelementptr [100 x i32], ptr %btree_parent, i32 0, i32 %rcc.tmp.315
  %rcc.tmp.317 = load i32, ptr %rcc.tmp.316
  store i32 %rcc.tmp.317, ptr %rcc.tmp.313
  store i32 0, ptr %move_index
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.321 = load i32, ptr %move_index
  %rcc.tmp.322 = icmp slt i32 %rcc.tmp.321, 5
  br i1 %rcc.tmp.322, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.325 = load i32, ptr %new_node
  %rcc.tmp.326 = add i32 %rcc.tmp.325, 0
  %rcc.tmp.327 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.326
  %rcc.tmp.328 = load i32, ptr %move_index
  %rcc.tmp.329 = add i32 %rcc.tmp.328, 0
  %rcc.tmp.330 = getelementptr [10 x i32], ptr %rcc.tmp.327, i32 0, i32 %rcc.tmp.329
  %rcc.tmp.331 = load i32, ptr %current_node
  %rcc.tmp.332 = add i32 %rcc.tmp.331, 0
  %rcc.tmp.333 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.332
  %rcc.tmp.334 = load i32, ptr %move_index
  %rcc.tmp.335 = add i32 %rcc.tmp.334, 0
  %rcc.tmp.336 = add i32 %rcc.tmp.335, 5
  %rcc.tmp.337 = getelementptr [10 x i32], ptr %rcc.tmp.333, i32 0, i32 %rcc.tmp.336
  %rcc.tmp.338 = load i32, ptr %rcc.tmp.337
  store i32 %rcc.tmp.338, ptr %rcc.tmp.330
  %rcc.tmp.340 = load i32, ptr %current_node
  %rcc.tmp.341 = add i32 %rcc.tmp.340, 0
  %rcc.tmp.342 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.341
  %rcc.tmp.343 = load i32, ptr %move_index
  %rcc.tmp.344 = add i32 %rcc.tmp.343, 0
  %rcc.tmp.345 = add i32 %rcc.tmp.344, 5
  %rcc.tmp.346 = getelementptr [10 x i32], ptr %rcc.tmp.342, i32 0, i32 %rcc.tmp.345
  store i32 0, ptr %rcc.tmp.346
  %rcc.tmp.348 = load i32, ptr %move_index
  %rcc.tmp.349 = add i32 %rcc.tmp.348, 1
  store i32 %rcc.tmp.349, ptr %move_index
  br label %while.cond.7
while.end.7:
  %rcc.tmp.352 = load i32, ptr %current_node
  %rcc.tmp.353 = add i32 %rcc.tmp.352, 0
  %rcc.tmp.354 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.353
  store i32 5, ptr %rcc.tmp.354
  %rcc.tmp.356 = load i32, ptr %key_to_insert
  %rcc.tmp.357 = load i32, ptr %new_node
  %rcc.tmp.358 = add i32 %rcc.tmp.357, 0
  %rcc.tmp.359 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.358
  %rcc.tmp.360 = getelementptr [10 x i32], ptr %rcc.tmp.359, i32 0, i32 0
  %rcc.tmp.361 = load i32, ptr %rcc.tmp.360
  %rcc.tmp.362 = icmp slt i32 %rcc.tmp.356, %rcc.tmp.361
  br i1 %rcc.tmp.362, label %if.then.5, label %if.else.5
if.then.5:
  store i32 5, ptr %insert_pos.2
  store i32 0, ptr %k.2
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.367 = load i32, ptr %k.2
  %rcc.tmp.368 = icmp slt i32 %rcc.tmp.367, 5
  br i1 %rcc.tmp.368, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.371 = load i32, ptr %key_to_insert
  %rcc.tmp.372 = load i32, ptr %current_node
  %rcc.tmp.373 = add i32 %rcc.tmp.372, 0
  %rcc.tmp.374 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.373
  %rcc.tmp.375 = load i32, ptr %k.2
  %rcc.tmp.376 = add i32 %rcc.tmp.375, 0
  %rcc.tmp.377 = getelementptr [10 x i32], ptr %rcc.tmp.374, i32 0, i32 %rcc.tmp.376
  %rcc.tmp.378 = load i32, ptr %rcc.tmp.377
  %rcc.tmp.379 = icmp slt i32 %rcc.tmp.371, %rcc.tmp.378
  br i1 %rcc.tmp.379, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.381 = load i32, ptr %k.2
  store i32 %rcc.tmp.381, ptr %insert_pos.2
  br label %while.linker.8
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.385 = load i32, ptr %k.2
  %rcc.tmp.386 = add i32 %rcc.tmp.385, 1
  store i32 %rcc.tmp.386, ptr %k.2
  br label %while.cond.8
while.end.8:
  store i32 4, ptr %shift_index.2
  br label %while.cond.9
while.cond.9:
  %rcc.tmp.391 = load i32, ptr %shift_index.2
  %rcc.tmp.392 = load i32, ptr %insert_pos.2
  %rcc.tmp.393 = icmp sge i32 %rcc.tmp.391, %rcc.tmp.392
  br i1 %rcc.tmp.393, label %while.body.9, label %while.linker.9
while.linker.9:
  br label %while.end.9
while.body.9:
  %rcc.tmp.396 = load i32, ptr %current_node
  %rcc.tmp.397 = add i32 %rcc.tmp.396, 0
  %rcc.tmp.398 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.397
  %rcc.tmp.399 = load i32, ptr %shift_index.2
  %rcc.tmp.400 = add i32 %rcc.tmp.399, 0
  %rcc.tmp.401 = add i32 %rcc.tmp.400, 1
  %rcc.tmp.402 = getelementptr [10 x i32], ptr %rcc.tmp.398, i32 0, i32 %rcc.tmp.401
  %rcc.tmp.403 = load i32, ptr %current_node
  %rcc.tmp.404 = add i32 %rcc.tmp.403, 0
  %rcc.tmp.405 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.404
  %rcc.tmp.406 = load i32, ptr %shift_index.2
  %rcc.tmp.407 = add i32 %rcc.tmp.406, 0
  %rcc.tmp.408 = getelementptr [10 x i32], ptr %rcc.tmp.405, i32 0, i32 %rcc.tmp.407
  %rcc.tmp.409 = load i32, ptr %rcc.tmp.408
  store i32 %rcc.tmp.409, ptr %rcc.tmp.402
  %rcc.tmp.411 = load i32, ptr %shift_index.2
  %rcc.tmp.412 = icmp eq i32 %rcc.tmp.411, 0
  br i1 %rcc.tmp.412, label %if.then.7, label %if.else.7
if.then.7:
  br label %while.linker.9
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.416 = load i32, ptr %shift_index.2
  %rcc.tmp.417 = sub i32 %rcc.tmp.416, 1
  store i32 %rcc.tmp.417, ptr %shift_index.2
  br label %while.cond.9
while.end.9:
  %rcc.tmp.420 = load i32, ptr %current_node
  %rcc.tmp.421 = add i32 %rcc.tmp.420, 0
  %rcc.tmp.422 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.421
  %rcc.tmp.423 = load i32, ptr %insert_pos.2
  %rcc.tmp.424 = add i32 %rcc.tmp.423, 0
  %rcc.tmp.425 = getelementptr [10 x i32], ptr %rcc.tmp.422, i32 0, i32 %rcc.tmp.424
  %rcc.tmp.426 = load i32, ptr %key_to_insert
  store i32 %rcc.tmp.426, ptr %rcc.tmp.425
  br label %if.merge.5
if.else.5:
  store i32 5, ptr %insert_pos.3
  store i32 0, ptr %k.3
  br label %while.cond.10
while.cond.10:
  %rcc.tmp.432 = load i32, ptr %k.3
  %rcc.tmp.433 = icmp slt i32 %rcc.tmp.432, 5
  br i1 %rcc.tmp.433, label %while.body.10, label %while.linker.10
while.linker.10:
  br label %while.end.10
while.body.10:
  %rcc.tmp.436 = load i32, ptr %key_to_insert
  %rcc.tmp.437 = load i32, ptr %new_node
  %rcc.tmp.438 = add i32 %rcc.tmp.437, 0
  %rcc.tmp.439 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.438
  %rcc.tmp.440 = load i32, ptr %k.3
  %rcc.tmp.441 = add i32 %rcc.tmp.440, 0
  %rcc.tmp.442 = getelementptr [10 x i32], ptr %rcc.tmp.439, i32 0, i32 %rcc.tmp.441
  %rcc.tmp.443 = load i32, ptr %rcc.tmp.442
  %rcc.tmp.444 = icmp slt i32 %rcc.tmp.436, %rcc.tmp.443
  br i1 %rcc.tmp.444, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.446 = load i32, ptr %k.3
  store i32 %rcc.tmp.446, ptr %insert_pos.3
  br label %while.linker.10
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.450 = load i32, ptr %k.3
  %rcc.tmp.451 = add i32 %rcc.tmp.450, 1
  store i32 %rcc.tmp.451, ptr %k.3
  br label %while.cond.10
while.end.10:
  store i32 4, ptr %shift_index.3
  br label %while.cond.11
while.cond.11:
  %rcc.tmp.456 = load i32, ptr %shift_index.3
  %rcc.tmp.457 = load i32, ptr %insert_pos.3
  %rcc.tmp.458 = icmp sge i32 %rcc.tmp.456, %rcc.tmp.457
  br i1 %rcc.tmp.458, label %while.body.11, label %while.linker.11
while.linker.11:
  br label %while.end.11
while.body.11:
  %rcc.tmp.461 = load i32, ptr %new_node
  %rcc.tmp.462 = add i32 %rcc.tmp.461, 0
  %rcc.tmp.463 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.462
  %rcc.tmp.464 = load i32, ptr %shift_index.3
  %rcc.tmp.465 = add i32 %rcc.tmp.464, 0
  %rcc.tmp.466 = add i32 %rcc.tmp.465, 1
  %rcc.tmp.467 = getelementptr [10 x i32], ptr %rcc.tmp.463, i32 0, i32 %rcc.tmp.466
  %rcc.tmp.468 = load i32, ptr %new_node
  %rcc.tmp.469 = add i32 %rcc.tmp.468, 0
  %rcc.tmp.470 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.469
  %rcc.tmp.471 = load i32, ptr %shift_index.3
  %rcc.tmp.472 = add i32 %rcc.tmp.471, 0
  %rcc.tmp.473 = getelementptr [10 x i32], ptr %rcc.tmp.470, i32 0, i32 %rcc.tmp.472
  %rcc.tmp.474 = load i32, ptr %rcc.tmp.473
  store i32 %rcc.tmp.474, ptr %rcc.tmp.467
  %rcc.tmp.476 = load i32, ptr %shift_index.3
  %rcc.tmp.477 = icmp eq i32 %rcc.tmp.476, 0
  br i1 %rcc.tmp.477, label %if.then.9, label %if.else.9
if.then.9:
  br label %while.linker.11
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.481 = load i32, ptr %shift_index.3
  %rcc.tmp.482 = sub i32 %rcc.tmp.481, 1
  store i32 %rcc.tmp.482, ptr %shift_index.3
  br label %while.cond.11
while.end.11:
  %rcc.tmp.485 = load i32, ptr %new_node
  %rcc.tmp.486 = add i32 %rcc.tmp.485, 0
  %rcc.tmp.487 = getelementptr [100 x [10 x i32]], ptr %btree_keys, i32 0, i32 %rcc.tmp.486
  %rcc.tmp.488 = load i32, ptr %insert_pos.3
  %rcc.tmp.489 = add i32 %rcc.tmp.488, 0
  %rcc.tmp.490 = getelementptr [10 x i32], ptr %rcc.tmp.487, i32 0, i32 %rcc.tmp.489
  %rcc.tmp.491 = load i32, ptr %key_to_insert
  store i32 %rcc.tmp.491, ptr %rcc.tmp.490
  %rcc.tmp.493 = load i32, ptr %new_node
  %rcc.tmp.494 = add i32 %rcc.tmp.493, 0
  %rcc.tmp.495 = getelementptr [100 x i32], ptr %btree_key_count, i32 0, i32 %rcc.tmp.494
  store i32 6, ptr %rcc.tmp.495
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.501 = load i32, ptr %i
  %rcc.tmp.502 = add i32 %rcc.tmp.501, 1
  store i32 %rcc.tmp.502, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %range_sum
  store i32 0, ptr %query_count
  store i32 0, ptr %i
  br label %while.cond.12
while.cond.12:
  %rcc.tmp.509 = load i32, ptr %i
  %rcc.tmp.510 = icmp slt i32 %rcc.tmp.509, 20
  br i1 %rcc.tmp.510, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.512 = load i32, ptr %query_count
  %rcc.tmp.513 = icmp slt i32 %rcc.tmp.512, 100
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.515 = phi i1 [0, %while.cond.12], [%rcc.tmp.513, %and.rhs.3]
  br i1 %rcc.tmp.515, label %while.body.12, label %while.linker.12
while.linker.12:
  br label %while.end.12
while.body.12:
  %rcc.tmp.518 = load i32, ptr %i
  %rcc.tmp.519 = mul i32 %rcc.tmp.518, 13
  %rcc.tmp.520 = add i32 %rcc.tmp.519, 7
  %rcc.tmp.521 = srem i32 %rcc.tmp.520, 500
  %rcc.tmp.522 = add i32 %rcc.tmp.521, 1
  store i32 %rcc.tmp.522, ptr %range_start
  %rcc.tmp.524 = load i32, ptr %range_start
  %rcc.tmp.525 = load i32, ptr %i
  %rcc.tmp.526 = mul i32 %rcc.tmp.525, 3
  %rcc.tmp.527 = add i32 %rcc.tmp.526, 1
  %rcc.tmp.528 = srem i32 %rcc.tmp.527, 50
  %rcc.tmp.529 = add i32 %rcc.tmp.524, %rcc.tmp.528
  %rcc.tmp.530 = add i32 %rcc.tmp.529, 10
  store i32 %rcc.tmp.530, ptr %range_end
  %rcc.tmp.532 = load i32, ptr %root_node
  %rcc.tmp.533 = load i32, ptr %range_start
  %rcc.tmp.534 = load i32, ptr %range_end
  %rcc.tmp.535 = call i32 @performRangeQuery.([100 x [10 x i32]]* %btree_keys, [100 x [11 x i32]]* %btree_children, [100 x i1]* %btree_is_leaf, [100 x i32]* %btree_key_count, i32 %rcc.tmp.532, i32 %rcc.tmp.533, i32 %rcc.tmp.534)
  store i32 %rcc.tmp.535, ptr %current_sum
  %rcc.tmp.537 = load i32, ptr %range_sum
  %rcc.tmp.538 = load i32, ptr %current_sum
  %rcc.tmp.539 = add i32 %rcc.tmp.537, %rcc.tmp.538
  store i32 %rcc.tmp.539, ptr %range_sum
  %rcc.tmp.541 = load i32, ptr %query_count
  %rcc.tmp.542 = add i32 %rcc.tmp.541, 1
  store i32 %rcc.tmp.542, ptr %query_count
  %rcc.tmp.544 = load i32, ptr %i
  %rcc.tmp.545 = add i32 %rcc.tmp.544, 1
  store i32 %rcc.tmp.545, ptr %i
  br label %while.cond.12
while.end.12:
  %rcc.tmp.548 = load i32, ptr %range_sum
  %rcc.tmp.549 = srem i32 %rcc.tmp.548, 10000
  call void @printlnInt.(i32 %rcc.tmp.549)
  call void @printlnInt.(i32 26002)
  ret void
}
define i32 @performRangeQuery.([100 x [10 x i32]]* %keys.tmp, [100 x [11 x i32]]* %children.tmp, [100 x i1]* %is_leaf.tmp, [100 x i32]* %key_count.tmp, i32 %node.tmp, i32 %start.tmp, i32 %end.tmp) {
entry:
  %keys..tmp = alloca [100 x [10 x i32]]* 
  %children..tmp = alloca [100 x [11 x i32]]* 
  %is_leaf..tmp = alloca [100 x i1]* 
  %key_count..tmp = alloca [100 x i32]* 
  %node..tmp = alloca i32 
  %start..tmp = alloca i32 
  %end..tmp = alloca i32 
  %result_sum = alloca i32 
  %i = alloca i32 
  %i.2 = alloca i32 
  %child_sum = alloca i32 
  store [100 x [10 x i32]]* %keys.tmp, ptr %keys..tmp
  store [100 x [11 x i32]]* %children.tmp, ptr %children..tmp
  store [100 x i1]* %is_leaf.tmp, ptr %is_leaf..tmp
  store [100 x i32]* %key_count.tmp, ptr %key_count..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %start.tmp, ptr %start..tmp
  store i32 %end.tmp, ptr %end..tmp
  store i32 0, ptr %result_sum
  %rcc.tmp.9 = load i32, ptr %node..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [100 x i1]*, ptr %is_leaf..tmp
  %rcc.tmp.12 = getelementptr [100 x i1], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i1, ptr %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %node..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [100 x i32]*, ptr %key_count..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load i32, ptr %node..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [100 x [10 x i32]]*, ptr %keys..tmp
  %rcc.tmp.29 = getelementptr [100 x [10 x i32]], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %start..tmp
  %rcc.tmp.35 = icmp sge i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.37 = load i32, ptr %node..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [100 x [10 x i32]]*, ptr %keys..tmp
  %rcc.tmp.40 = getelementptr [100 x [10 x i32]], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %end..tmp
  %rcc.tmp.46 = icmp sle i32 %rcc.tmp.44, %rcc.tmp.45
  br label %sc.merge
sc.merge:
  %rcc.tmp.48 = phi i1 [0, %while.body], [%rcc.tmp.46, %and.rhs]
  br i1 %rcc.tmp.48, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.50 = load i32, ptr %result_sum
  %rcc.tmp.51 = load i32, ptr %node..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [100 x [10 x i32]]*, ptr %keys..tmp
  %rcc.tmp.54 = getelementptr [100 x [10 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [10 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.50, %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %result_sum
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond
while.end:
  br label %if.merge
if.else:
  store i32 0, ptr %i.2
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.70 = load i32, ptr %i.2
  %rcc.tmp.71 = load i32, ptr %node..tmp
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [100 x i32]*, ptr %key_count..tmp
  %rcc.tmp.74 = getelementptr [100 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp sle i32 %rcc.tmp.70, %rcc.tmp.75
  br i1 %rcc.tmp.76, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.79 = load i32, ptr %node..tmp
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = load [100 x [11 x i32]]*, ptr %children..tmp
  %rcc.tmp.82 = getelementptr [100 x [11 x i32]], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = load i32, ptr %i.2
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [11 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = icmp sge i32 %rcc.tmp.86, 0
  br i1 %rcc.tmp.87, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.89 = load i32, ptr %node..tmp
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = load [100 x [11 x i32]]*, ptr %children..tmp
  %rcc.tmp.92 = getelementptr [100 x [11 x i32]], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %i.2
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [11 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = icmp slt i32 %rcc.tmp.96, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.99 = phi i1 [0, %while.body.2], [%rcc.tmp.97, %and.rhs.2]
  br i1 %rcc.tmp.99, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.101 = load [100 x [10 x i32]]*, ptr %keys..tmp
  %rcc.tmp.102 = load [100 x [11 x i32]]*, ptr %children..tmp
  %rcc.tmp.103 = load [100 x i1]*, ptr %is_leaf..tmp
  %rcc.tmp.104 = load [100 x i32]*, ptr %key_count..tmp
  %rcc.tmp.105 = load i32, ptr %node..tmp
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = load [100 x [11 x i32]]*, ptr %children..tmp
  %rcc.tmp.108 = getelementptr [100 x [11 x i32]], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.109 = load i32, ptr %i.2
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = getelementptr [11 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %start..tmp
  %rcc.tmp.114 = load i32, ptr %end..tmp
  %rcc.tmp.115 = call i32 @performRangeQuery.([100 x [10 x i32]]* %rcc.tmp.101, [100 x [11 x i32]]* %rcc.tmp.102, [100 x i1]* %rcc.tmp.103, [100 x i32]* %rcc.tmp.104, i32 %rcc.tmp.112, i32 %rcc.tmp.113, i32 %rcc.tmp.114)
  store i32 %rcc.tmp.115, ptr %child_sum
  %rcc.tmp.117 = load i32, ptr %result_sum
  %rcc.tmp.118 = load i32, ptr %child_sum
  %rcc.tmp.119 = add i32 %rcc.tmp.117, %rcc.tmp.118
  store i32 %rcc.tmp.119, ptr %result_sum
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.123 = load i32, ptr %i.2
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.124, ptr %i.2
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.merge:
  %rcc.tmp.128 = load i32, ptr %result_sum
  ret i32 %rcc.tmp.128
}
define void @performQueryExecutionTest.(i32 %table_size.tmp) {
entry:
  %table_size..tmp = alloca i32 
  %table1_id = alloca [200 x i32] 
  %fill.idx = alloca i32 
  %table1_value = alloca [200 x i32] 
  %fill.idx.2 = alloca i32 
  %table2_id = alloca [200 x i32] 
  %fill.idx.3 = alloca i32 
  %table2_value = alloca [200 x i32] 
  %fill.idx.4 = alloca i32 
  %table1_size = alloca i32 
  %table2_size = alloca i32 
  %i = alloca i32 
  %nested_loop_result = alloca i32 
  %j = alloca i32 
  %hash_buckets = alloca [50 x [5 x i32]] 
  %fill.idx.5 = alloca i32 
  %hash_values = alloca [50 x [5 x i32]] 
  %fill.idx.6 = alloca i32 
  %hash_count = alloca [50 x i32] 
  %fill.idx.7 = alloca i32 
  %hash_key = alloca i32 
  %slot = alloca i32 
  %hash_join_result = alloca i32 
  %hash_key.2 = alloca i32 
  %bucket_index = alloca i32 
  %merge_join_result = alloca i32 
  %i1 = alloca i32 
  %i2 = alloca i32 
  store i32 %table_size.tmp, ptr %table_size..tmp
  call void @printlnInt.(i32 26003)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 200
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 200
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [200 x i32], ptr %table1_value, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 200
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.38 = load i32, ptr %fill.idx.4
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 200
  br i1 %rcc.tmp.39, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.41 = load i32, ptr %fill.idx.4
  %rcc.tmp.42 = getelementptr [200 x i32], ptr %table2_value, i32 0, i32 %rcc.tmp.41
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.44, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %table1_size
  store i32 0, ptr %table2_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = load i32, ptr %table_size..tmp
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.58 = phi i1 [0, %while.cond], [%rcc.tmp.56, %and.rhs]
  br i1 %rcc.tmp.58, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = mul i32 %rcc.tmp.64, 3
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  %rcc.tmp.67 = srem i32 %rcc.tmp.66, 150
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %rcc.tmp.63
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [200 x i32], ptr %table1_value, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = mul i32 %rcc.tmp.73, 7
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 11
  %rcc.tmp.76 = srem i32 %rcc.tmp.75, 1000
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %rcc.tmp.72
  %rcc.tmp.79 = load i32, ptr %table1_size
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %table1_size
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = load i32, ptr %table_size..tmp
  %rcc.tmp.90 = icmp slt i32 %rcc.tmp.88, %rcc.tmp.89
  br i1 %rcc.tmp.90, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = icmp slt i32 %rcc.tmp.92, 200
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.95 = phi i1 [0, %while.cond.2], [%rcc.tmp.93, %and.rhs.2]
  br i1 %rcc.tmp.95, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = mul i32 %rcc.tmp.101, 5
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 3
  %rcc.tmp.104 = srem i32 %rcc.tmp.103, 180
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 1
  store i32 %rcc.tmp.105, ptr %rcc.tmp.100
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = getelementptr [200 x i32], ptr %table2_value, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = mul i32 %rcc.tmp.110, 11
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 13
  %rcc.tmp.113 = srem i32 %rcc.tmp.112, 1200
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %rcc.tmp.109
  %rcc.tmp.116 = load i32, ptr %table2_size
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  store i32 %rcc.tmp.117, ptr %table2_size
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 1
  store i32 %rcc.tmp.120, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %nested_loop_result
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = load i32, ptr %table1_size
  %rcc.tmp.128 = icmp slt i32 %rcc.tmp.126, %rcc.tmp.127
  br i1 %rcc.tmp.128, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.133 = load i32, ptr %j
  %rcc.tmp.134 = load i32, ptr %table2_size
  %rcc.tmp.135 = icmp slt i32 %rcc.tmp.133, %rcc.tmp.134
  br i1 %rcc.tmp.135, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.140
  %rcc.tmp.142 = load i32, ptr %j
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %rcc.tmp.144
  %rcc.tmp.146 = icmp eq i32 %rcc.tmp.141, %rcc.tmp.145
  br i1 %rcc.tmp.146, label %if.then, label %if.else
if.then:
  %rcc.tmp.148 = load i32, ptr %nested_loop_result
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = getelementptr [200 x i32], ptr %table1_value, i32 0, i32 %rcc.tmp.150
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.151
  %rcc.tmp.153 = add i32 %rcc.tmp.148, %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %j
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [200 x i32], ptr %table2_value, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  %rcc.tmp.158 = add i32 %rcc.tmp.153, %rcc.tmp.157
  store i32 %rcc.tmp.158, ptr %nested_loop_result
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.162 = load i32, ptr %j
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 1
  store i32 %rcc.tmp.163, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.166 = load i32, ptr %i
  %rcc.tmp.167 = add i32 %rcc.tmp.166, 1
  store i32 %rcc.tmp.167, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.170 = load i32, ptr %nested_loop_result
  %rcc.tmp.171 = srem i32 %rcc.tmp.170, 10000
  call void @printlnInt.(i32 %rcc.tmp.171)
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.175 = load i32, ptr %fill.idx.5
  %rcc.tmp.176 = icmp slt i32 %rcc.tmp.175, 50
  br i1 %rcc.tmp.176, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.178 = load i32, ptr %fill.idx.5
  %rcc.tmp.179 = getelementptr [50 x [5 x i32]], ptr %hash_buckets, i32 0, i32 %rcc.tmp.178
  %rcc.tmp.180 = sub i32 0, 1
  %rcc.tmp.181 = getelementptr [5 x i32], ptr %rcc.tmp.179, i32 0, i32 0
  store i32 %rcc.tmp.180, ptr %rcc.tmp.181
  %rcc.tmp.183 = getelementptr [5 x i32], ptr %rcc.tmp.179, i32 0, i32 1
  store i32 %rcc.tmp.180, ptr %rcc.tmp.183
  %rcc.tmp.185 = getelementptr [5 x i32], ptr %rcc.tmp.179, i32 0, i32 2
  store i32 %rcc.tmp.180, ptr %rcc.tmp.185
  %rcc.tmp.187 = getelementptr [5 x i32], ptr %rcc.tmp.179, i32 0, i32 3
  store i32 %rcc.tmp.180, ptr %rcc.tmp.187
  %rcc.tmp.189 = getelementptr [5 x i32], ptr %rcc.tmp.179, i32 0, i32 4
  store i32 %rcc.tmp.180, ptr %rcc.tmp.189
  %rcc.tmp.191 = add i32 %rcc.tmp.178, 1
  store i32 %rcc.tmp.191, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.196 = load i32, ptr %fill.idx.6
  %rcc.tmp.197 = icmp slt i32 %rcc.tmp.196, 50
  br i1 %rcc.tmp.197, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.199 = load i32, ptr %fill.idx.6
  %rcc.tmp.200 = getelementptr [50 x [5 x i32]], ptr %hash_values, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.201 = getelementptr [5 x i32], ptr %rcc.tmp.200, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.201
  %rcc.tmp.203 = getelementptr [5 x i32], ptr %rcc.tmp.200, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.203
  %rcc.tmp.205 = getelementptr [5 x i32], ptr %rcc.tmp.200, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.205
  %rcc.tmp.207 = getelementptr [5 x i32], ptr %rcc.tmp.200, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.207
  %rcc.tmp.209 = getelementptr [5 x i32], ptr %rcc.tmp.200, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.209
  %rcc.tmp.211 = add i32 %rcc.tmp.199, 1
  store i32 %rcc.tmp.211, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.216 = load i32, ptr %fill.idx.7
  %rcc.tmp.217 = icmp slt i32 %rcc.tmp.216, 50
  br i1 %rcc.tmp.217, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.219 = load i32, ptr %fill.idx.7
  %rcc.tmp.220 = getelementptr [50 x i32], ptr %hash_count, i32 0, i32 %rcc.tmp.219
  store i32 0, ptr %rcc.tmp.220
  %rcc.tmp.222 = add i32 %rcc.tmp.219, 1
  store i32 %rcc.tmp.222, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.227 = load i32, ptr %i
  %rcc.tmp.228 = load i32, ptr %table1_size
  %rcc.tmp.229 = icmp slt i32 %rcc.tmp.227, %rcc.tmp.228
  br i1 %rcc.tmp.229, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.232 = load i32, ptr %i
  %rcc.tmp.233 = add i32 %rcc.tmp.232, 0
  %rcc.tmp.234 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.233
  %rcc.tmp.235 = load i32, ptr %rcc.tmp.234
  %rcc.tmp.236 = srem i32 %rcc.tmp.235, 50
  store i32 %rcc.tmp.236, ptr %hash_key
  %rcc.tmp.238 = load i32, ptr %hash_key
  %rcc.tmp.239 = add i32 %rcc.tmp.238, 0
  %rcc.tmp.240 = getelementptr [50 x i32], ptr %hash_count, i32 0, i32 %rcc.tmp.239
  %rcc.tmp.241 = load i32, ptr %rcc.tmp.240
  %rcc.tmp.242 = icmp slt i32 %rcc.tmp.241, 5
  br i1 %rcc.tmp.242, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.244 = load i32, ptr %hash_key
  %rcc.tmp.245 = add i32 %rcc.tmp.244, 0
  %rcc.tmp.246 = getelementptr [50 x i32], ptr %hash_count, i32 0, i32 %rcc.tmp.245
  %rcc.tmp.247 = load i32, ptr %rcc.tmp.246
  store i32 %rcc.tmp.247, ptr %slot
  %rcc.tmp.249 = load i32, ptr %hash_key
  %rcc.tmp.250 = add i32 %rcc.tmp.249, 0
  %rcc.tmp.251 = getelementptr [50 x [5 x i32]], ptr %hash_buckets, i32 0, i32 %rcc.tmp.250
  %rcc.tmp.252 = load i32, ptr %slot
  %rcc.tmp.253 = add i32 %rcc.tmp.252, 0
  %rcc.tmp.254 = getelementptr [5 x i32], ptr %rcc.tmp.251, i32 0, i32 %rcc.tmp.253
  %rcc.tmp.255 = load i32, ptr %i
  %rcc.tmp.256 = add i32 %rcc.tmp.255, 0
  %rcc.tmp.257 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.256
  %rcc.tmp.258 = load i32, ptr %rcc.tmp.257
  store i32 %rcc.tmp.258, ptr %rcc.tmp.254
  %rcc.tmp.260 = load i32, ptr %hash_key
  %rcc.tmp.261 = add i32 %rcc.tmp.260, 0
  %rcc.tmp.262 = getelementptr [50 x [5 x i32]], ptr %hash_values, i32 0, i32 %rcc.tmp.261
  %rcc.tmp.263 = load i32, ptr %slot
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [5 x i32], ptr %rcc.tmp.262, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %i
  %rcc.tmp.267 = add i32 %rcc.tmp.266, 0
  %rcc.tmp.268 = getelementptr [200 x i32], ptr %table1_value, i32 0, i32 %rcc.tmp.267
  %rcc.tmp.269 = load i32, ptr %rcc.tmp.268
  store i32 %rcc.tmp.269, ptr %rcc.tmp.265
  %rcc.tmp.271 = load i32, ptr %hash_key
  %rcc.tmp.272 = add i32 %rcc.tmp.271, 0
  %rcc.tmp.273 = getelementptr [50 x i32], ptr %hash_count, i32 0, i32 %rcc.tmp.272
  %rcc.tmp.274 = load i32, ptr %hash_key
  %rcc.tmp.275 = add i32 %rcc.tmp.274, 0
  %rcc.tmp.276 = getelementptr [50 x i32], ptr %hash_count, i32 0, i32 %rcc.tmp.275
  %rcc.tmp.277 = load i32, ptr %rcc.tmp.276
  %rcc.tmp.278 = add i32 %rcc.tmp.277, 1
  store i32 %rcc.tmp.278, ptr %rcc.tmp.273
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.282 = load i32, ptr %i
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 1
  store i32 %rcc.tmp.283, ptr %i
  br label %while.cond.5
while.end.5:
  store i32 0, ptr %hash_join_result
  store i32 0, ptr %i
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.289 = load i32, ptr %i
  %rcc.tmp.290 = load i32, ptr %table2_size
  %rcc.tmp.291 = icmp slt i32 %rcc.tmp.289, %rcc.tmp.290
  br i1 %rcc.tmp.291, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.294 = load i32, ptr %i
  %rcc.tmp.295 = add i32 %rcc.tmp.294, 0
  %rcc.tmp.296 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.295
  %rcc.tmp.297 = load i32, ptr %rcc.tmp.296
  %rcc.tmp.298 = srem i32 %rcc.tmp.297, 50
  store i32 %rcc.tmp.298, ptr %hash_key.2
  store i32 0, ptr %bucket_index
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.302 = load i32, ptr %bucket_index
  %rcc.tmp.303 = load i32, ptr %hash_key.2
  %rcc.tmp.304 = add i32 %rcc.tmp.303, 0
  %rcc.tmp.305 = getelementptr [50 x i32], ptr %hash_count, i32 0, i32 %rcc.tmp.304
  %rcc.tmp.306 = load i32, ptr %rcc.tmp.305
  %rcc.tmp.307 = icmp slt i32 %rcc.tmp.302, %rcc.tmp.306
  br i1 %rcc.tmp.307, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.310 = load i32, ptr %hash_key.2
  %rcc.tmp.311 = add i32 %rcc.tmp.310, 0
  %rcc.tmp.312 = getelementptr [50 x [5 x i32]], ptr %hash_buckets, i32 0, i32 %rcc.tmp.311
  %rcc.tmp.313 = load i32, ptr %bucket_index
  %rcc.tmp.314 = add i32 %rcc.tmp.313, 0
  %rcc.tmp.315 = getelementptr [5 x i32], ptr %rcc.tmp.312, i32 0, i32 %rcc.tmp.314
  %rcc.tmp.316 = load i32, ptr %rcc.tmp.315
  %rcc.tmp.317 = load i32, ptr %i
  %rcc.tmp.318 = add i32 %rcc.tmp.317, 0
  %rcc.tmp.319 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.318
  %rcc.tmp.320 = load i32, ptr %rcc.tmp.319
  %rcc.tmp.321 = icmp eq i32 %rcc.tmp.316, %rcc.tmp.320
  br i1 %rcc.tmp.321, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.323 = load i32, ptr %hash_join_result
  %rcc.tmp.324 = load i32, ptr %hash_key.2
  %rcc.tmp.325 = add i32 %rcc.tmp.324, 0
  %rcc.tmp.326 = getelementptr [50 x [5 x i32]], ptr %hash_values, i32 0, i32 %rcc.tmp.325
  %rcc.tmp.327 = load i32, ptr %bucket_index
  %rcc.tmp.328 = add i32 %rcc.tmp.327, 0
  %rcc.tmp.329 = getelementptr [5 x i32], ptr %rcc.tmp.326, i32 0, i32 %rcc.tmp.328
  %rcc.tmp.330 = load i32, ptr %rcc.tmp.329
  %rcc.tmp.331 = add i32 %rcc.tmp.323, %rcc.tmp.330
  %rcc.tmp.332 = load i32, ptr %i
  %rcc.tmp.333 = add i32 %rcc.tmp.332, 0
  %rcc.tmp.334 = getelementptr [200 x i32], ptr %table2_value, i32 0, i32 %rcc.tmp.333
  %rcc.tmp.335 = load i32, ptr %rcc.tmp.334
  %rcc.tmp.336 = add i32 %rcc.tmp.331, %rcc.tmp.335
  store i32 %rcc.tmp.336, ptr %hash_join_result
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.340 = load i32, ptr %bucket_index
  %rcc.tmp.341 = add i32 %rcc.tmp.340, 1
  store i32 %rcc.tmp.341, ptr %bucket_index
  br label %while.cond.7
while.end.7:
  %rcc.tmp.344 = load i32, ptr %i
  %rcc.tmp.345 = add i32 %rcc.tmp.344, 1
  store i32 %rcc.tmp.345, ptr %i
  br label %while.cond.6
while.end.6:
  %rcc.tmp.348 = load i32, ptr %hash_join_result
  %rcc.tmp.349 = srem i32 %rcc.tmp.348, 10000
  call void @printlnInt.(i32 %rcc.tmp.349)
  %rcc.tmp.351 = load i32, ptr %table1_size
  call void @performTableSort.([200 x i32]* %table1_id, [200 x i32]* %table1_value, i32 %rcc.tmp.351)
  %rcc.tmp.353 = load i32, ptr %table2_size
  call void @performTableSort.([200 x i32]* %table2_id, [200 x i32]* %table2_value, i32 %rcc.tmp.353)
  store i32 0, ptr %merge_join_result
  store i32 0, ptr %i1
  store i32 0, ptr %i2
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.359 = load i32, ptr %i1
  %rcc.tmp.360 = load i32, ptr %table1_size
  %rcc.tmp.361 = icmp slt i32 %rcc.tmp.359, %rcc.tmp.360
  br i1 %rcc.tmp.361, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.363 = load i32, ptr %i2
  %rcc.tmp.364 = load i32, ptr %table2_size
  %rcc.tmp.365 = icmp slt i32 %rcc.tmp.363, %rcc.tmp.364
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.367 = phi i1 [0, %while.cond.8], [%rcc.tmp.365, %and.rhs.3]
  br i1 %rcc.tmp.367, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.370 = load i32, ptr %i1
  %rcc.tmp.371 = add i32 %rcc.tmp.370, 0
  %rcc.tmp.372 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.371
  %rcc.tmp.373 = load i32, ptr %rcc.tmp.372
  %rcc.tmp.374 = load i32, ptr %i2
  %rcc.tmp.375 = add i32 %rcc.tmp.374, 0
  %rcc.tmp.376 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.375
  %rcc.tmp.377 = load i32, ptr %rcc.tmp.376
  %rcc.tmp.378 = icmp eq i32 %rcc.tmp.373, %rcc.tmp.377
  br i1 %rcc.tmp.378, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.380 = load i32, ptr %merge_join_result
  %rcc.tmp.381 = load i32, ptr %i1
  %rcc.tmp.382 = add i32 %rcc.tmp.381, 0
  %rcc.tmp.383 = getelementptr [200 x i32], ptr %table1_value, i32 0, i32 %rcc.tmp.382
  %rcc.tmp.384 = load i32, ptr %rcc.tmp.383
  %rcc.tmp.385 = add i32 %rcc.tmp.380, %rcc.tmp.384
  %rcc.tmp.386 = load i32, ptr %i2
  %rcc.tmp.387 = add i32 %rcc.tmp.386, 0
  %rcc.tmp.388 = getelementptr [200 x i32], ptr %table2_value, i32 0, i32 %rcc.tmp.387
  %rcc.tmp.389 = load i32, ptr %rcc.tmp.388
  %rcc.tmp.390 = add i32 %rcc.tmp.385, %rcc.tmp.389
  store i32 %rcc.tmp.390, ptr %merge_join_result
  %rcc.tmp.392 = load i32, ptr %i1
  %rcc.tmp.393 = add i32 %rcc.tmp.392, 1
  store i32 %rcc.tmp.393, ptr %i1
  %rcc.tmp.395 = load i32, ptr %i2
  %rcc.tmp.396 = add i32 %rcc.tmp.395, 1
  store i32 %rcc.tmp.396, ptr %i2
  br label %if.merge.4
if.else.4:
  %rcc.tmp.399 = load i32, ptr %i1
  %rcc.tmp.400 = add i32 %rcc.tmp.399, 0
  %rcc.tmp.401 = getelementptr [200 x i32], ptr %table1_id, i32 0, i32 %rcc.tmp.400
  %rcc.tmp.402 = load i32, ptr %rcc.tmp.401
  %rcc.tmp.403 = load i32, ptr %i2
  %rcc.tmp.404 = add i32 %rcc.tmp.403, 0
  %rcc.tmp.405 = getelementptr [200 x i32], ptr %table2_id, i32 0, i32 %rcc.tmp.404
  %rcc.tmp.406 = load i32, ptr %rcc.tmp.405
  %rcc.tmp.407 = icmp slt i32 %rcc.tmp.402, %rcc.tmp.406
  br i1 %rcc.tmp.407, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.409 = load i32, ptr %i1
  %rcc.tmp.410 = add i32 %rcc.tmp.409, 1
  store i32 %rcc.tmp.410, ptr %i1
  br label %if.merge.5
if.else.5:
  %rcc.tmp.413 = load i32, ptr %i2
  %rcc.tmp.414 = add i32 %rcc.tmp.413, 1
  store i32 %rcc.tmp.414, ptr %i2
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %while.cond.8
while.end.8:
  %rcc.tmp.419 = load i32, ptr %merge_join_result
  %rcc.tmp.420 = srem i32 %rcc.tmp.419, 10000
  call void @printlnInt.(i32 %rcc.tmp.420)
  call void @printlnInt.(i32 26004)
  ret void
}
define void @performTableSort.([200 x i32]* %ids.tmp, [200 x i32]* %values.tmp, i32 %size.tmp) {
entry:
  %ids..tmp = alloca [200 x i32]* 
  %values..tmp = alloca [200 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %temp_id = alloca i32 
  %temp_value = alloca i32 
  store [200 x i32]* %ids.tmp, ptr %ids..tmp
  store [200 x i32]* %values.tmp, ptr %values..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = sub i32 %rcc.tmp.15, 1
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = sub i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [200 x i32]*, ptr %ids..tmp
  %rcc.tmp.25 = getelementptr [200 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = load [200 x i32]*, ptr %ids..tmp
  %rcc.tmp.31 = getelementptr [200 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp sgt i32 %rcc.tmp.26, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %if.then, label %if.else
if.then:
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [200 x i32]*, ptr %ids..tmp
  %rcc.tmp.38 = getelementptr [200 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %temp_id
  %rcc.tmp.41 = load i32, ptr %j
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load [200 x i32]*, ptr %ids..tmp
  %rcc.tmp.44 = getelementptr [200 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  %rcc.tmp.48 = load [200 x i32]*, ptr %ids..tmp
  %rcc.tmp.49 = getelementptr [200 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %rcc.tmp.44
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  %rcc.tmp.55 = load [200 x i32]*, ptr %ids..tmp
  %rcc.tmp.56 = getelementptr [200 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %temp_id
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.62 = getelementptr [200 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %temp_value
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.68 = getelementptr [200 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.73 = getelementptr [200 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %rcc.tmp.68
  %rcc.tmp.76 = load i32, ptr %j
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  %rcc.tmp.79 = load [200 x i32]*, ptr %values..tmp
  %rcc.tmp.80 = getelementptr [200 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %temp_value
  store i32 %rcc.tmp.81, ptr %rcc.tmp.80
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @performTransactionProcessingTest.(i32 %max_transactions.tmp) {
entry:
  %max_transactions..tmp = alloca i32 
  %transaction_states = alloca [50 x i32] 
  %fill.idx = alloca i32 
  %transaction_start_time = alloca [50 x i32] 
  %fill.idx.2 = alloca i32 
  %transaction_locks = alloca [50 x [10 x i32]] 
  %fill.idx.3 = alloca i32 
  %transaction_lock_count = alloca [50 x i32] 
  %fill.idx.4 = alloca i32 
  %resource_locks = alloca [100 x i32] 
  %fill.idx.5 = alloca i32 
  %lock_wait_queue = alloca [100 x [5 x i32]] 
  %fill.idx.6 = alloca i32 
  %wait_queue_count = alloca [100 x i32] 
  %fill.idx.7 = alloca i32 
  %wait_for_graph = alloca [50 x [50 x i1]] 
  %fill.idx.8 = alloca i32 
  %fill.idx.9 = alloca i32 
  %visited = alloca [50 x i1] 
  %fill.idx.10 = alloca i32 
  %recursion_stack = alloca [50 x i1] 
  %fill.idx.11 = alloca i32 
  %active_transactions = alloca i32 
  %committed_count = alloca i32 
  %aborted_count = alloca i32 
  %current_time = alloca i32 
  %round = alloca i32 
  %new_transactions = alloca i32 
  %i = alloca i32 
  %lock_requests = alloca i32 
  %j = alloca i32 
  %resource_id = alloca i32 
  %deadlock_detected = alloca i1 
  %victim_transaction = alloca i32 
  store i32 %max_transactions.tmp, ptr %max_transactions..tmp
  call void @printlnInt.(i32 26005)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [50 x i32], ptr %transaction_states, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
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
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %transaction_start_time, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 50
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [50 x [10 x i32]], ptr %transaction_locks, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = sub i32 0, 1
  %rcc.tmp.33 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 0
  store i32 %rcc.tmp.32, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 2
  store i32 %rcc.tmp.32, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 3
  store i32 %rcc.tmp.32, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 4
  store i32 %rcc.tmp.32, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 5
  store i32 %rcc.tmp.32, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 6
  store i32 %rcc.tmp.32, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 7
  store i32 %rcc.tmp.32, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 8
  store i32 %rcc.tmp.32, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [10 x i32], ptr %rcc.tmp.31, i32 0, i32 9
  store i32 %rcc.tmp.32, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.53, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.58 = load i32, ptr %fill.idx.4
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.58, 50
  br i1 %rcc.tmp.59, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.61 = load i32, ptr %fill.idx.4
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %transaction_lock_count, i32 0, i32 %rcc.tmp.61
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.64, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.69 = load i32, ptr %fill.idx.5
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.69, 100
  br i1 %rcc.tmp.70, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.72 = load i32, ptr %fill.idx.5
  %rcc.tmp.73 = getelementptr [100 x i32], ptr %resource_locks, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = sub i32 0, 1
  store i32 %rcc.tmp.74, ptr %rcc.tmp.73
  %rcc.tmp.76 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.76, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.81 = load i32, ptr %fill.idx.6
  %rcc.tmp.82 = icmp slt i32 %rcc.tmp.81, 100
  br i1 %rcc.tmp.82, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.84 = load i32, ptr %fill.idx.6
  %rcc.tmp.85 = getelementptr [100 x [5 x i32]], ptr %lock_wait_queue, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = sub i32 0, 1
  %rcc.tmp.87 = getelementptr [5 x i32], ptr %rcc.tmp.85, i32 0, i32 0
  store i32 %rcc.tmp.86, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [5 x i32], ptr %rcc.tmp.85, i32 0, i32 1
  store i32 %rcc.tmp.86, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [5 x i32], ptr %rcc.tmp.85, i32 0, i32 2
  store i32 %rcc.tmp.86, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [5 x i32], ptr %rcc.tmp.85, i32 0, i32 3
  store i32 %rcc.tmp.86, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [5 x i32], ptr %rcc.tmp.85, i32 0, i32 4
  store i32 %rcc.tmp.86, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.97, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.102 = load i32, ptr %fill.idx.7
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.102, 100
  br i1 %rcc.tmp.103, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.105 = load i32, ptr %fill.idx.7
  %rcc.tmp.106 = getelementptr [100 x i32], ptr %wait_queue_count, i32 0, i32 %rcc.tmp.105
  store i32 0, ptr %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.105, 1
  store i32 %rcc.tmp.108, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.113 = load i32, ptr %fill.idx.8
  %rcc.tmp.114 = icmp slt i32 %rcc.tmp.113, 50
  br i1 %rcc.tmp.114, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.116 = load i32, ptr %fill.idx.8
  %rcc.tmp.117 = getelementptr [50 x [50 x i1]], ptr %wait_for_graph, i32 0, i32 %rcc.tmp.116
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.120 = load i32, ptr %fill.idx.9
  %rcc.tmp.121 = icmp slt i32 %rcc.tmp.120, 50
  br i1 %rcc.tmp.121, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.123 = load i32, ptr %fill.idx.9
  %rcc.tmp.124 = getelementptr [50 x i1], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.123
  store i1 0, ptr %rcc.tmp.124
  %rcc.tmp.126 = add i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.126, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  %rcc.tmp.129 = add i32 %rcc.tmp.116, 1
  store i32 %rcc.tmp.129, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.134 = load i32, ptr %fill.idx.10
  %rcc.tmp.135 = icmp slt i32 %rcc.tmp.134, 50
  br i1 %rcc.tmp.135, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.137 = load i32, ptr %fill.idx.10
  %rcc.tmp.138 = getelementptr [50 x i1], ptr %visited, i32 0, i32 %rcc.tmp.137
  store i1 0, ptr %rcc.tmp.138
  %rcc.tmp.140 = add i32 %rcc.tmp.137, 1
  store i32 %rcc.tmp.140, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.145 = load i32, ptr %fill.idx.11
  %rcc.tmp.146 = icmp slt i32 %rcc.tmp.145, 50
  br i1 %rcc.tmp.146, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.148 = load i32, ptr %fill.idx.11
  %rcc.tmp.149 = getelementptr [50 x i1], ptr %recursion_stack, i32 0, i32 %rcc.tmp.148
  store i1 0, ptr %rcc.tmp.149
  %rcc.tmp.151 = add i32 %rcc.tmp.148, 1
  store i32 %rcc.tmp.151, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  store i32 0, ptr %active_transactions
  store i32 0, ptr %committed_count
  store i32 0, ptr %aborted_count
  store i32 1, ptr %current_time
  store i32 0, ptr %round
  br label %while.cond
while.cond:
  %rcc.tmp.160 = load i32, ptr %round
  %rcc.tmp.161 = icmp slt i32 %rcc.tmp.160, 20
  br i1 %rcc.tmp.161, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.163 = load i32, ptr %active_transactions
  %rcc.tmp.164 = load i32, ptr %max_transactions..tmp
  %rcc.tmp.165 = icmp slt i32 %rcc.tmp.163, %rcc.tmp.164
  br label %sc.merge
sc.merge:
  %rcc.tmp.167 = phi i1 [0, %while.cond], [%rcc.tmp.165, %and.rhs]
  br i1 %rcc.tmp.167, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.170 = load i32, ptr %round
  %rcc.tmp.171 = srem i32 %rcc.tmp.170, 3
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 1
  store i32 %rcc.tmp.172, ptr %new_transactions
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.176 = load i32, ptr %i
  %rcc.tmp.177 = load i32, ptr %new_transactions
  %rcc.tmp.178 = icmp slt i32 %rcc.tmp.176, %rcc.tmp.177
  br i1 %rcc.tmp.178, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.180 = load i32, ptr %active_transactions
  %rcc.tmp.181 = load i32, ptr %max_transactions..tmp
  %rcc.tmp.182 = icmp slt i32 %rcc.tmp.180, %rcc.tmp.181
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.184 = phi i1 [0, %while.cond.2], [%rcc.tmp.182, %and.rhs.2]
  br i1 %rcc.tmp.184, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.187 = load i32, ptr %active_transactions
  %rcc.tmp.188 = icmp slt i32 %rcc.tmp.187, 50
  br i1 %rcc.tmp.188, label %if.then, label %if.else
if.then:
  %rcc.tmp.190 = load i32, ptr %active_transactions
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = getelementptr [50 x i32], ptr %transaction_states, i32 0, i32 %rcc.tmp.191
  store i32 1, ptr %rcc.tmp.192
  %rcc.tmp.194 = load i32, ptr %active_transactions
  %rcc.tmp.195 = add i32 %rcc.tmp.194, 0
  %rcc.tmp.196 = getelementptr [50 x i32], ptr %transaction_start_time, i32 0, i32 %rcc.tmp.195
  %rcc.tmp.197 = load i32, ptr %current_time
  store i32 %rcc.tmp.197, ptr %rcc.tmp.196
  %rcc.tmp.199 = load i32, ptr %active_transactions
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 0
  %rcc.tmp.201 = getelementptr [50 x i32], ptr %transaction_lock_count, i32 0, i32 %rcc.tmp.200
  store i32 0, ptr %rcc.tmp.201
  %rcc.tmp.203 = load i32, ptr %active_transactions
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  store i32 %rcc.tmp.204, ptr %active_transactions
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.208 = load i32, ptr %i
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.214 = load i32, ptr %i
  %rcc.tmp.215 = load i32, ptr %active_transactions
  %rcc.tmp.216 = icmp slt i32 %rcc.tmp.214, %rcc.tmp.215
  br i1 %rcc.tmp.216, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.219 = load i32, ptr %i
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 0
  %rcc.tmp.221 = getelementptr [50 x i32], ptr %transaction_states, i32 0, i32 %rcc.tmp.220
  %rcc.tmp.222 = load i32, ptr %rcc.tmp.221
  %rcc.tmp.223 = icmp eq i32 %rcc.tmp.222, 1
  br i1 %rcc.tmp.223, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.225 = load i32, ptr %i
  %rcc.tmp.226 = load i32, ptr %round
  %rcc.tmp.227 = add i32 %rcc.tmp.225, %rcc.tmp.226
  %rcc.tmp.228 = srem i32 %rcc.tmp.227, 3
  %rcc.tmp.229 = add i32 %rcc.tmp.228, 1
  store i32 %rcc.tmp.229, ptr %lock_requests
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.233 = load i32, ptr %j
  %rcc.tmp.234 = load i32, ptr %lock_requests
  %rcc.tmp.235 = icmp slt i32 %rcc.tmp.233, %rcc.tmp.234
  br i1 %rcc.tmp.235, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.237 = load i32, ptr %i
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = getelementptr [50 x i32], ptr %transaction_lock_count, i32 0, i32 %rcc.tmp.238
  %rcc.tmp.240 = load i32, ptr %rcc.tmp.239
  %rcc.tmp.241 = icmp slt i32 %rcc.tmp.240, 10
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.243 = phi i1 [0, %while.cond.4], [%rcc.tmp.241, %and.rhs.3]
  br i1 %rcc.tmp.243, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.246 = load i32, ptr %i
  %rcc.tmp.247 = mul i32 %rcc.tmp.246, 7
  %rcc.tmp.248 = load i32, ptr %j
  %rcc.tmp.249 = mul i32 %rcc.tmp.248, 11
  %rcc.tmp.250 = add i32 %rcc.tmp.247, %rcc.tmp.249
  %rcc.tmp.251 = load i32, ptr %round
  %rcc.tmp.252 = mul i32 %rcc.tmp.251, 3
  %rcc.tmp.253 = add i32 %rcc.tmp.250, %rcc.tmp.252
  %rcc.tmp.254 = srem i32 %rcc.tmp.253, 100
  store i32 %rcc.tmp.254, ptr %resource_id
  %rcc.tmp.256 = load i32, ptr %resource_id
  %rcc.tmp.257 = add i32 %rcc.tmp.256, 0
  %rcc.tmp.258 = getelementptr [100 x i32], ptr %resource_locks, i32 0, i32 %rcc.tmp.257
  %rcc.tmp.259 = load i32, ptr %rcc.tmp.258
  %rcc.tmp.260 = sub i32 0, 1
  %rcc.tmp.261 = icmp eq i32 %rcc.tmp.259, %rcc.tmp.260
  br i1 %rcc.tmp.261, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.263 = load i32, ptr %resource_id
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [100 x i32], ptr %resource_locks, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %i
  store i32 %rcc.tmp.266, ptr %rcc.tmp.265
  %rcc.tmp.268 = load i32, ptr %i
  %rcc.tmp.269 = add i32 %rcc.tmp.268, 0
  %rcc.tmp.270 = getelementptr [50 x [10 x i32]], ptr %transaction_locks, i32 0, i32 %rcc.tmp.269
  %rcc.tmp.271 = load i32, ptr %i
  %rcc.tmp.272 = add i32 %rcc.tmp.271, 0
  %rcc.tmp.273 = getelementptr [50 x i32], ptr %transaction_lock_count, i32 0, i32 %rcc.tmp.272
  %rcc.tmp.274 = load i32, ptr %rcc.tmp.273
  %rcc.tmp.275 = add i32 %rcc.tmp.274, 0
  %rcc.tmp.276 = getelementptr [10 x i32], ptr %rcc.tmp.270, i32 0, i32 %rcc.tmp.275
  %rcc.tmp.277 = load i32, ptr %resource_id
  store i32 %rcc.tmp.277, ptr %rcc.tmp.276
  %rcc.tmp.279 = load i32, ptr %i
  %rcc.tmp.280 = add i32 %rcc.tmp.279, 0
  %rcc.tmp.281 = getelementptr [50 x i32], ptr %transaction_lock_count, i32 0, i32 %rcc.tmp.280
  %rcc.tmp.282 = load i32, ptr %i
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 0
  %rcc.tmp.284 = getelementptr [50 x i32], ptr %transaction_lock_count, i32 0, i32 %rcc.tmp.283
  %rcc.tmp.285 = load i32, ptr %rcc.tmp.284
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 1
  store i32 %rcc.tmp.286, ptr %rcc.tmp.281
  br label %if.merge.3
if.else.3:
  %rcc.tmp.289 = load i32, ptr %resource_id
  %rcc.tmp.290 = add i32 %rcc.tmp.289, 0
  %rcc.tmp.291 = getelementptr [100 x i32], ptr %resource_locks, i32 0, i32 %rcc.tmp.290
  %rcc.tmp.292 = load i32, ptr %rcc.tmp.291
  %rcc.tmp.293 = load i32, ptr %i
  %rcc.tmp.294 = icmp ne i32 %rcc.tmp.292, %rcc.tmp.293
  br i1 %rcc.tmp.294, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.296 = load i32, ptr %resource_id
  %rcc.tmp.297 = add i32 %rcc.tmp.296, 0
  %rcc.tmp.298 = getelementptr [100 x i32], ptr %wait_queue_count, i32 0, i32 %rcc.tmp.297
  %rcc.tmp.299 = load i32, ptr %rcc.tmp.298
  %rcc.tmp.300 = icmp slt i32 %rcc.tmp.299, 5
  br i1 %rcc.tmp.300, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.302 = load i32, ptr %resource_id
  %rcc.tmp.303 = add i32 %rcc.tmp.302, 0
  %rcc.tmp.304 = getelementptr [100 x [5 x i32]], ptr %lock_wait_queue, i32 0, i32 %rcc.tmp.303
  %rcc.tmp.305 = load i32, ptr %resource_id
  %rcc.tmp.306 = add i32 %rcc.tmp.305, 0
  %rcc.tmp.307 = getelementptr [100 x i32], ptr %wait_queue_count, i32 0, i32 %rcc.tmp.306
  %rcc.tmp.308 = load i32, ptr %rcc.tmp.307
  %rcc.tmp.309 = add i32 %rcc.tmp.308, 0
  %rcc.tmp.310 = getelementptr [5 x i32], ptr %rcc.tmp.304, i32 0, i32 %rcc.tmp.309
  %rcc.tmp.311 = load i32, ptr %i
  store i32 %rcc.tmp.311, ptr %rcc.tmp.310
  %rcc.tmp.313 = load i32, ptr %resource_id
  %rcc.tmp.314 = add i32 %rcc.tmp.313, 0
  %rcc.tmp.315 = getelementptr [100 x i32], ptr %wait_queue_count, i32 0, i32 %rcc.tmp.314
  %rcc.tmp.316 = load i32, ptr %resource_id
  %rcc.tmp.317 = add i32 %rcc.tmp.316, 0
  %rcc.tmp.318 = getelementptr [100 x i32], ptr %wait_queue_count, i32 0, i32 %rcc.tmp.317
  %rcc.tmp.319 = load i32, ptr %rcc.tmp.318
  %rcc.tmp.320 = add i32 %rcc.tmp.319, 1
  store i32 %rcc.tmp.320, ptr %rcc.tmp.315
  %rcc.tmp.322 = load i32, ptr %i
  %rcc.tmp.323 = add i32 %rcc.tmp.322, 0
  %rcc.tmp.324 = getelementptr [50 x [50 x i1]], ptr %wait_for_graph, i32 0, i32 %rcc.tmp.323
  %rcc.tmp.325 = load i32, ptr %resource_id
  %rcc.tmp.326 = add i32 %rcc.tmp.325, 0
  %rcc.tmp.327 = getelementptr [100 x i32], ptr %resource_locks, i32 0, i32 %rcc.tmp.326
  %rcc.tmp.328 = load i32, ptr %rcc.tmp.327
  %rcc.tmp.329 = add i32 %rcc.tmp.328, 0
  %rcc.tmp.330 = getelementptr [50 x i1], ptr %rcc.tmp.324, i32 0, i32 %rcc.tmp.329
  store i1 1, ptr %rcc.tmp.330
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.337 = load i32, ptr %j
  %rcc.tmp.338 = add i32 %rcc.tmp.337, 1
  store i32 %rcc.tmp.338, ptr %j
  br label %while.cond.4
while.end.4:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.343 = load i32, ptr %i
  %rcc.tmp.344 = add i32 %rcc.tmp.343, 1
  store i32 %rcc.tmp.344, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.347 = load i32, ptr %active_transactions
  %rcc.tmp.348 = call i1 @detectDeadlock.([50 x [50 x i1]]* %wait_for_graph, [50 x i1]* %visited, [50 x i1]* %recursion_stack, i32 %rcc.tmp.347)
  store i1 %rcc.tmp.348, ptr %deadlock_detected
  %rcc.tmp.350 = load i1, ptr %deadlock_detected
  br i1 %rcc.tmp.350, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.352 = load i32, ptr %active_transactions
  %rcc.tmp.353 = load i32, ptr %current_time
  %rcc.tmp.354 = call i32 @findVictimTransaction.([50 x i32]* %transaction_start_time, [50 x i32]* %transaction_states, i32 %rcc.tmp.352, i32 %rcc.tmp.353)
  store i32 %rcc.tmp.354, ptr %victim_transaction
  %rcc.tmp.356 = load i32, ptr %victim_transaction
  %rcc.tmp.357 = icmp sge i32 %rcc.tmp.356, 0
  br i1 %rcc.tmp.357, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.359 = load i32, ptr %victim_transaction
  call void @abortTransaction.(i32 %rcc.tmp.359, [50 x i32]* %transaction_states, [50 x [10 x i32]]* %transaction_locks, [50 x i32]* %transaction_lock_count, [100 x i32]* %resource_locks, [100 x [5 x i32]]* %lock_wait_queue, [100 x i32]* %wait_queue_count, [50 x [50 x i1]]* %wait_for_graph)
  %rcc.tmp.361 = load i32, ptr %aborted_count
  %rcc.tmp.362 = add i32 %rcc.tmp.361, 1
  store i32 %rcc.tmp.362, ptr %aborted_count
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.370 = load i32, ptr %i
  %rcc.tmp.371 = load i32, ptr %active_transactions
  %rcc.tmp.372 = icmp slt i32 %rcc.tmp.370, %rcc.tmp.371
  br i1 %rcc.tmp.372, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.375 = load i32, ptr %i
  %rcc.tmp.376 = add i32 %rcc.tmp.375, 0
  %rcc.tmp.377 = getelementptr [50 x i32], ptr %transaction_states, i32 0, i32 %rcc.tmp.376
  %rcc.tmp.378 = load i32, ptr %rcc.tmp.377
  %rcc.tmp.379 = icmp eq i32 %rcc.tmp.378, 1
  br i1 %rcc.tmp.379, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.381 = load i32, ptr %current_time
  %rcc.tmp.382 = load i32, ptr %i
  %rcc.tmp.383 = add i32 %rcc.tmp.382, 0
  %rcc.tmp.384 = getelementptr [50 x i32], ptr %transaction_start_time, i32 0, i32 %rcc.tmp.383
  %rcc.tmp.385 = load i32, ptr %rcc.tmp.384
  %rcc.tmp.386 = sub i32 %rcc.tmp.381, %rcc.tmp.385
  %rcc.tmp.387 = icmp sgt i32 %rcc.tmp.386, 3
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.389 = phi i1 [0, %while.body.5], [%rcc.tmp.387, %and.rhs.4]
  br i1 %rcc.tmp.389, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.391 = load i32, ptr %i
  %rcc.tmp.392 = load i32, ptr %round
  %rcc.tmp.393 = add i32 %rcc.tmp.391, %rcc.tmp.392
  %rcc.tmp.394 = srem i32 %rcc.tmp.393, 4
  %rcc.tmp.395 = icmp eq i32 %rcc.tmp.394, 0
  br i1 %rcc.tmp.395, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.397 = load i32, ptr %i
  call void @commitTransaction.(i32 %rcc.tmp.397, [50 x i32]* %transaction_states, [50 x [10 x i32]]* %transaction_locks, [50 x i32]* %transaction_lock_count, [100 x i32]* %resource_locks, [100 x [5 x i32]]* %lock_wait_queue, [100 x i32]* %wait_queue_count)
  %rcc.tmp.399 = load i32, ptr %committed_count
  %rcc.tmp.400 = add i32 %rcc.tmp.399, 1
  store i32 %rcc.tmp.400, ptr %committed_count
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.406 = load i32, ptr %i
  %rcc.tmp.407 = add i32 %rcc.tmp.406, 1
  store i32 %rcc.tmp.407, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.410 = load i32, ptr %current_time
  %rcc.tmp.411 = add i32 %rcc.tmp.410, 1
  store i32 %rcc.tmp.411, ptr %current_time
  %rcc.tmp.413 = load i32, ptr %round
  %rcc.tmp.414 = add i32 %rcc.tmp.413, 1
  store i32 %rcc.tmp.414, ptr %round
  br label %while.cond
while.end:
  %rcc.tmp.417 = load i32, ptr %committed_count
  call void @printlnInt.(i32 %rcc.tmp.417)
  %rcc.tmp.419 = load i32, ptr %aborted_count
  call void @printlnInt.(i32 %rcc.tmp.419)
  call void @printlnInt.(i32 26006)
  ret void
}
define i1 @detectDeadlock.([50 x [50 x i1]]* %wait_graph.tmp, [50 x i1]* %visited.tmp, [50 x i1]* %rec_stack.tmp, i32 %transaction_count.tmp) {
entry:
  %wait_graph..tmp = alloca [50 x [50 x i1]]* 
  %visited..tmp = alloca [50 x i1]* 
  %rec_stack..tmp = alloca [50 x i1]* 
  %transaction_count..tmp = alloca i32 
  %i = alloca i32 
  store [50 x [50 x i1]]* %wait_graph.tmp, ptr %wait_graph..tmp
  store [50 x i1]* %visited.tmp, ptr %visited..tmp
  store [50 x i1]* %rec_stack.tmp, ptr %rec_stack..tmp
  store i32 %transaction_count.tmp, ptr %transaction_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %transaction_count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.15 = getelementptr [50 x i1], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i1 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [50 x i1]*, ptr %rec_stack..tmp
  %rcc.tmp.20 = getelementptr [50 x i1], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  store i1 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %transaction_count..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.36 = getelementptr [50 x i1], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i1, ptr %rcc.tmp.36
  %rcc.tmp.38 = xor i1 %rcc.tmp.37, true
  br i1 %rcc.tmp.38, label %if.then, label %if.else
if.then:
  %rcc.tmp.40 = load [50 x [50 x i1]]*, ptr %wait_graph..tmp
  %rcc.tmp.41 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.42 = load [50 x i1]*, ptr %rec_stack..tmp
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %transaction_count..tmp
  %rcc.tmp.45 = call i1 @detectCycleDFS.([50 x [50 x i1]]* %rcc.tmp.40, [50 x i1]* %rcc.tmp.41, [50 x i1]* %rcc.tmp.42, i32 %rcc.tmp.43, i32 %rcc.tmp.44)
  br i1 %rcc.tmp.45, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 1
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
  br label %while.cond.2
while.end.2:
  ret i1 0
}
define i1 @detectCycleDFS.([50 x [50 x i1]]* %wait_graph.tmp, [50 x i1]* %visited.tmp, [50 x i1]* %rec_stack.tmp, i32 %node.tmp, i32 %transaction_count.tmp) {
entry:
  %wait_graph..tmp = alloca [50 x [50 x i1]]* 
  %visited..tmp = alloca [50 x i1]* 
  %rec_stack..tmp = alloca [50 x i1]* 
  %node..tmp = alloca i32 
  %transaction_count..tmp = alloca i32 
  %i = alloca i32 
  store [50 x [50 x i1]]* %wait_graph.tmp, ptr %wait_graph..tmp
  store [50 x i1]* %visited.tmp, ptr %visited..tmp
  store [50 x i1]* %rec_stack.tmp, ptr %rec_stack..tmp
  store i32 %node.tmp, ptr %node..tmp
  store i32 %transaction_count.tmp, ptr %transaction_count..tmp
  %rcc.tmp.6 = load i32, ptr %node..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.9 = getelementptr [50 x i1], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.7
  store i1 1, ptr %rcc.tmp.9
  %rcc.tmp.11 = load i32, ptr %node..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [50 x i1]*, ptr %rec_stack..tmp
  %rcc.tmp.14 = getelementptr [50 x i1], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  store i1 1, ptr %rcc.tmp.14
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %transaction_count..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %node..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [50 x [50 x i1]]*, ptr %wait_graph..tmp
  %rcc.tmp.26 = getelementptr [50 x [50 x i1]], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [50 x i1], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i1, ptr %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.35 = getelementptr [50 x i1], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i1, ptr %rcc.tmp.35
  %rcc.tmp.37 = xor i1 %rcc.tmp.36, true
  br i1 %rcc.tmp.37, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.39 = load [50 x [50 x i1]]*, ptr %wait_graph..tmp
  %rcc.tmp.40 = load [50 x i1]*, ptr %visited..tmp
  %rcc.tmp.41 = load [50 x i1]*, ptr %rec_stack..tmp
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = load i32, ptr %transaction_count..tmp
  %rcc.tmp.44 = call i1 @detectCycleDFS.([50 x [50 x i1]]* %rcc.tmp.39, [50 x i1]* %rcc.tmp.40, [50 x i1]* %rcc.tmp.41, i32 %rcc.tmp.42, i32 %rcc.tmp.43)
  br i1 %rcc.tmp.44, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 1
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [50 x i1]*, ptr %rec_stack..tmp
  %rcc.tmp.52 = getelementptr [50 x i1], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i1, ptr %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.4, label %if.else.4
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
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.64 = load i32, ptr %node..tmp
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [50 x i1]*, ptr %rec_stack..tmp
  %rcc.tmp.67 = getelementptr [50 x i1], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  store i1 0, ptr %rcc.tmp.67
  ret i1 0
}
define i32 @findVictimTransaction.([50 x i32]* %start_times.tmp, [50 x i32]* %states.tmp, i32 %count.tmp, i32 %current_time.tmp) {
entry:
  %start_times..tmp = alloca [50 x i32]* 
  %states..tmp = alloca [50 x i32]* 
  %count..tmp = alloca i32 
  %current_time..tmp = alloca i32 
  %youngest_transaction = alloca i32 
  %latest_start_time = alloca i32 
  %i = alloca i32 
  store [50 x i32]* %start_times.tmp, ptr %start_times..tmp
  store [50 x i32]* %states.tmp, ptr %states..tmp
  store i32 %count.tmp, ptr %count..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  %rcc.tmp.5 = sub i32 0, 1
  store i32 %rcc.tmp.5, ptr %youngest_transaction
  store i32 0, ptr %latest_start_time
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %count..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [50 x i32]*, ptr %states..tmp
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 1
  br i1 %rcc.tmp.20, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [50 x i32]*, ptr %start_times..tmp
  %rcc.tmp.25 = getelementptr [50 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %latest_start_time
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.26, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.body], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [50 x i32]*, ptr %start_times..tmp
  %rcc.tmp.35 = getelementptr [50 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %latest_start_time
  %rcc.tmp.38 = load i32, ptr %i
  store i32 %rcc.tmp.38, ptr %youngest_transaction
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.46 = load i32, ptr %youngest_transaction
  ret i32 %rcc.tmp.46
}
define void @abortTransaction.(i32 %transaction_id.tmp, [50 x i32]* %states.tmp, [50 x [10 x i32]]* %locks.tmp, [50 x i32]* %lock_counts.tmp, [100 x i32]* %resource_locks.tmp, [100 x [5 x i32]]* %wait_queues.tmp, [100 x i32]* %wait_counts.tmp, [50 x [50 x i1]]* %wait_graph.tmp) {
entry:
  %transaction_id..tmp = alloca i32 
  %states..tmp = alloca [50 x i32]* 
  %locks..tmp = alloca [50 x [10 x i32]]* 
  %lock_counts..tmp = alloca [50 x i32]* 
  %resource_locks..tmp = alloca [100 x i32]* 
  %wait_queues..tmp = alloca [100 x [5 x i32]]* 
  %wait_counts..tmp = alloca [100 x i32]* 
  %wait_graph..tmp = alloca [50 x [50 x i1]]* 
  %i = alloca i32 
  %resource_id = alloca i32 
  %next_transaction = alloca i32 
  %j = alloca i32 
  store i32 %transaction_id.tmp, ptr %transaction_id..tmp
  store [50 x i32]* %states.tmp, ptr %states..tmp
  store [50 x [10 x i32]]* %locks.tmp, ptr %locks..tmp
  store [50 x i32]* %lock_counts.tmp, ptr %lock_counts..tmp
  store [100 x i32]* %resource_locks.tmp, ptr %resource_locks..tmp
  store [100 x [5 x i32]]* %wait_queues.tmp, ptr %wait_queues..tmp
  store [100 x i32]* %wait_counts.tmp, ptr %wait_counts..tmp
  store [50 x [50 x i1]]* %wait_graph.tmp, ptr %wait_graph..tmp
  %rcc.tmp.9 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [50 x i32]*, ptr %states..tmp
  %rcc.tmp.12 = getelementptr [50 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  store i32 3, ptr %rcc.tmp.12
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [50 x i32]*, ptr %lock_counts..tmp
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [50 x [10 x i32]]*, ptr %locks..tmp
  %rcc.tmp.28 = getelementptr [50 x [10 x i32]], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %resource_id
  %rcc.tmp.34 = load i32, ptr %resource_id
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [100 x i32]*, ptr %resource_locks..tmp
  %rcc.tmp.37 = getelementptr [100 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = sub i32 0, 1
  store i32 %rcc.tmp.38, ptr %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %resource_id
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.43 = getelementptr [100 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = icmp sgt i32 %rcc.tmp.44, 0
  br i1 %rcc.tmp.45, label %if.then, label %if.else
if.then:
  %rcc.tmp.47 = load i32, ptr %resource_id
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [100 x [5 x i32]]*, ptr %wait_queues..tmp
  %rcc.tmp.50 = getelementptr [100 x [5 x i32]], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = getelementptr [5 x i32], ptr %rcc.tmp.50, i32 0, i32 0
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %next_transaction
  %rcc.tmp.54 = load i32, ptr %resource_id
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [100 x i32]*, ptr %resource_locks..tmp
  %rcc.tmp.57 = getelementptr [100 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %next_transaction
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.62 = load i32, ptr %j
  %rcc.tmp.63 = load i32, ptr %resource_id
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.66 = getelementptr [100 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = sub i32 %rcc.tmp.67, 1
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.62, %rcc.tmp.68
  br i1 %rcc.tmp.69, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.72 = load i32, ptr %resource_id
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [100 x [5 x i32]]*, ptr %wait_queues..tmp
  %rcc.tmp.75 = getelementptr [100 x [5 x i32]], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %j
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [5 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %resource_id
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = load [100 x [5 x i32]]*, ptr %wait_queues..tmp
  %rcc.tmp.82 = getelementptr [100 x [5 x i32]], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = load i32, ptr %j
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  %rcc.tmp.86 = getelementptr [5 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %rcc.tmp.78
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.93 = load i32, ptr %resource_id
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.96 = getelementptr [100 x i32], ptr %rcc.tmp.95, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.97 = load i32, ptr %resource_id
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.100 = getelementptr [100 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = sub i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %rcc.tmp.96
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = icmp slt i32 %rcc.tmp.112, 50
  br i1 %rcc.tmp.113, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.116 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = load [50 x [50 x i1]]*, ptr %wait_graph..tmp
  %rcc.tmp.119 = getelementptr [50 x [50 x i1]], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [50 x i1], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.121
  store i1 0, ptr %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = load [50 x [50 x i1]]*, ptr %wait_graph..tmp
  %rcc.tmp.127 = getelementptr [50 x [50 x i1]], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = getelementptr [50 x i1], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.129
  store i1 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.136 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = load [50 x i32]*, ptr %lock_counts..tmp
  %rcc.tmp.139 = getelementptr [50 x i32], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.137
  store i32 0, ptr %rcc.tmp.139
  ret void
}
define void @commitTransaction.(i32 %transaction_id.tmp, [50 x i32]* %states.tmp, [50 x [10 x i32]]* %locks.tmp, [50 x i32]* %lock_counts.tmp, [100 x i32]* %resource_locks.tmp, [100 x [5 x i32]]* %wait_queues.tmp, [100 x i32]* %wait_counts.tmp) {
entry:
  %transaction_id..tmp = alloca i32 
  %states..tmp = alloca [50 x i32]* 
  %locks..tmp = alloca [50 x [10 x i32]]* 
  %lock_counts..tmp = alloca [50 x i32]* 
  %resource_locks..tmp = alloca [100 x i32]* 
  %wait_queues..tmp = alloca [100 x [5 x i32]]* 
  %wait_counts..tmp = alloca [100 x i32]* 
  %i = alloca i32 
  %resource_id = alloca i32 
  %next_transaction = alloca i32 
  %j = alloca i32 
  store i32 %transaction_id.tmp, ptr %transaction_id..tmp
  store [50 x i32]* %states.tmp, ptr %states..tmp
  store [50 x [10 x i32]]* %locks.tmp, ptr %locks..tmp
  store [50 x i32]* %lock_counts.tmp, ptr %lock_counts..tmp
  store [100 x i32]* %resource_locks.tmp, ptr %resource_locks..tmp
  store [100 x [5 x i32]]* %wait_queues.tmp, ptr %wait_queues..tmp
  store [100 x i32]* %wait_counts.tmp, ptr %wait_counts..tmp
  %rcc.tmp.8 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [50 x i32]*, ptr %states..tmp
  %rcc.tmp.11 = getelementptr [50 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  store i32 2, ptr %rcc.tmp.11
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [50 x i32]*, ptr %lock_counts..tmp
  %rcc.tmp.19 = getelementptr [50 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [50 x [10 x i32]]*, ptr %locks..tmp
  %rcc.tmp.27 = getelementptr [50 x [10 x i32]], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %resource_id
  %rcc.tmp.33 = load i32, ptr %resource_id
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [100 x i32]*, ptr %resource_locks..tmp
  %rcc.tmp.36 = getelementptr [100 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = sub i32 0, 1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %resource_id
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = icmp sgt i32 %rcc.tmp.43, 0
  br i1 %rcc.tmp.44, label %if.then, label %if.else
if.then:
  %rcc.tmp.46 = load i32, ptr %resource_id
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [100 x [5 x i32]]*, ptr %wait_queues..tmp
  %rcc.tmp.49 = getelementptr [100 x [5 x i32]], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = getelementptr [5 x i32], ptr %rcc.tmp.49, i32 0, i32 0
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %next_transaction
  %rcc.tmp.53 = load i32, ptr %resource_id
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [100 x i32]*, ptr %resource_locks..tmp
  %rcc.tmp.56 = getelementptr [100 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %next_transaction
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.61 = load i32, ptr %j
  %rcc.tmp.62 = load i32, ptr %resource_id
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.61, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.71 = load i32, ptr %resource_id
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [100 x [5 x i32]]*, ptr %wait_queues..tmp
  %rcc.tmp.74 = getelementptr [100 x [5 x i32]], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [5 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %resource_id
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [100 x [5 x i32]]*, ptr %wait_queues..tmp
  %rcc.tmp.81 = getelementptr [100 x [5 x i32]], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %j
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = getelementptr [5 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.86, ptr %rcc.tmp.77
  %rcc.tmp.88 = load i32, ptr %j
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.92 = load i32, ptr %resource_id
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.95 = getelementptr [100 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load i32, ptr %resource_id
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = load [100 x i32]*, ptr %wait_counts..tmp
  %rcc.tmp.99 = getelementptr [100 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = sub i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %rcc.tmp.95
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  store i32 %rcc.tmp.106, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.109 = load i32, ptr %transaction_id..tmp
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [50 x i32]*, ptr %lock_counts..tmp
  %rcc.tmp.112 = getelementptr [50 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  store i32 0, ptr %rcc.tmp.112
  ret void
}
define void @performBufferPoolTest.(i32 %pool_size.tmp) {
entry:
  %pool_size..tmp = alloca i32 
  %buffer_pool = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %buffer_dirty = alloca [100 x i1] 
  %fill.idx.2 = alloca i32 
  %buffer_pin_count = alloca [100 x i32] 
  %fill.idx.3 = alloca i32 
  %buffer_last_used = alloca [100 x i32] 
  %fill.idx.4 = alloca i32 
  %buffer_reference_bit = alloca [100 x i1] 
  %fill.idx.5 = alloca i32 
  %clock_hand = alloca i32 
  %current_time = alloca i32 
  %page_to_buffer = alloca [500 x i32] 
  %fill.idx.6 = alloca i32 
  %buffer_hits = alloca i32 
  %buffer_misses = alloca i32 
  %page_evictions = alloca i32 
  %access_count = alloca i32 
  %round = alloca i32 
  %pattern_type = alloca i32 
  %pages_in_pattern = alloca i32 
  %i = alloca i32 
  %page_id = alloca i32 
  %buffer_slot = alloca i32 
  %free_slot = alloca i32 
  %evict_slot = alloca i32 
  %old_page_id = alloca i32 
  %hit_ratio = alloca i32 
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  call void @printlnInt.(i32 26007)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [100 x i32], ptr %buffer_pool, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.10 = sub i32 0, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 100
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [100 x i1], ptr %buffer_dirty, i32 0, i32 %rcc.tmp.20
  store i1 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 100
  br i1 %rcc.tmp.29, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.31 = load i32, ptr %fill.idx.3
  %rcc.tmp.32 = getelementptr [100 x i32], ptr %buffer_pin_count, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.34, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.39 = load i32, ptr %fill.idx.4
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 100
  br i1 %rcc.tmp.40, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.42 = load i32, ptr %fill.idx.4
  %rcc.tmp.43 = getelementptr [100 x i32], ptr %buffer_last_used, i32 0, i32 %rcc.tmp.42
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.45, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.50 = load i32, ptr %fill.idx.5
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.50, 100
  br i1 %rcc.tmp.51, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.53 = load i32, ptr %fill.idx.5
  %rcc.tmp.54 = getelementptr [100 x i1], ptr %buffer_reference_bit, i32 0, i32 %rcc.tmp.53
  store i1 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.56, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %clock_hand
  store i32 1, ptr %current_time
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.63 = load i32, ptr %fill.idx.6
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.63, 500
  br i1 %rcc.tmp.64, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.66 = load i32, ptr %fill.idx.6
  %rcc.tmp.67 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = sub i32 0, 1
  store i32 %rcc.tmp.68, ptr %rcc.tmp.67
  %rcc.tmp.70 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.70, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %buffer_hits
  store i32 0, ptr %buffer_misses
  store i32 0, ptr %page_evictions
  store i32 0, ptr %access_count
  store i32 0, ptr %round
  br label %while.cond
while.cond:
  %rcc.tmp.79 = load i32, ptr %round
  %rcc.tmp.80 = icmp slt i32 %rcc.tmp.79, 30
  br i1 %rcc.tmp.80, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.82 = load i32, ptr %access_count
  %rcc.tmp.83 = icmp slt i32 %rcc.tmp.82, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.85 = phi i1 [0, %while.cond], [%rcc.tmp.83, %and.rhs]
  br i1 %rcc.tmp.85, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.88 = load i32, ptr %round
  %rcc.tmp.89 = srem i32 %rcc.tmp.88, 4
  store i32 %rcc.tmp.89, ptr %pattern_type
  %rcc.tmp.91 = load i32, ptr %round
  %rcc.tmp.92 = srem i32 %rcc.tmp.91, 5
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 3
  store i32 %rcc.tmp.93, ptr %pages_in_pattern
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = load i32, ptr %pages_in_pattern
  %rcc.tmp.99 = icmp slt i32 %rcc.tmp.97, %rcc.tmp.98
  br i1 %rcc.tmp.99, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.101 = load i32, ptr %access_count
  %rcc.tmp.102 = icmp slt i32 %rcc.tmp.101, 200
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.104 = phi i1 [0, %while.cond.2], [%rcc.tmp.102, %and.rhs.2]
  br i1 %rcc.tmp.104, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.107 = load i32, ptr %pattern_type
  %rcc.tmp.108 = icmp eq i32 %rcc.tmp.107, 0
  br i1 %rcc.tmp.108, label %if.then, label %if.else
if.then:
  %rcc.tmp.110 = load i32, ptr %round
  %rcc.tmp.111 = mul i32 %rcc.tmp.110, 10
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = add i32 %rcc.tmp.111, %rcc.tmp.112
  %rcc.tmp.114 = srem i32 %rcc.tmp.113, 400
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  br label %if.merge
if.else:
  %rcc.tmp.117 = load i32, ptr %pattern_type
  %rcc.tmp.118 = icmp eq i32 %rcc.tmp.117, 1
  br i1 %rcc.tmp.118, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.120 = load i32, ptr %access_count
  %rcc.tmp.121 = mul i32 %rcc.tmp.120, 17
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 23
  %rcc.tmp.123 = srem i32 %rcc.tmp.122, 350
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  br label %if.merge.2
if.else.2:
  %rcc.tmp.126 = load i32, ptr %pattern_type
  %rcc.tmp.127 = icmp eq i32 %rcc.tmp.126, 2
  br i1 %rcc.tmp.127, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.129 = load i32, ptr %access_count
  %rcc.tmp.130 = mul i32 %rcc.tmp.129, 3
  %rcc.tmp.131 = srem i32 %rcc.tmp.130, 50
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  br label %if.merge.3
if.else.3:
  %rcc.tmp.134 = load i32, ptr %access_count
  %rcc.tmp.135 = mul i32 %rcc.tmp.134, 7
  %rcc.tmp.136 = load i32, ptr %round
  %rcc.tmp.137 = mul i32 %rcc.tmp.136, 11
  %rcc.tmp.138 = add i32 %rcc.tmp.135, %rcc.tmp.137
  %rcc.tmp.139 = srem i32 %rcc.tmp.138, 300
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.142 = phi i32 [%rcc.tmp.132, %if.then.3], [%rcc.tmp.140, %if.else.3]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.144 = phi i32 [%rcc.tmp.124, %if.then.2], [%rcc.tmp.142, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.146 = phi i32 [%rcc.tmp.115, %if.then], [%rcc.tmp.144, %if.merge.2]
  store i32 %rcc.tmp.146, ptr %page_id
  %rcc.tmp.148 = load i32, ptr %page_id
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 0
  %rcc.tmp.150 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.149
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.150
  store i32 %rcc.tmp.151, ptr %buffer_slot
  %rcc.tmp.153 = load i32, ptr %buffer_slot
  %rcc.tmp.154 = icmp sge i32 %rcc.tmp.153, 0
  br i1 %rcc.tmp.154, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.156 = load i32, ptr %buffer_slot
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 0
  %rcc.tmp.158 = getelementptr [100 x i32], ptr %buffer_pool, i32 0, i32 %rcc.tmp.157
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %page_id
  %rcc.tmp.161 = icmp eq i32 %rcc.tmp.159, %rcc.tmp.160
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.163 = phi i1 [0, %if.merge], [%rcc.tmp.161, %and.rhs.3]
  br i1 %rcc.tmp.163, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.165 = load i32, ptr %buffer_hits
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %buffer_hits
  %rcc.tmp.168 = load i32, ptr %buffer_slot
  %rcc.tmp.169 = add i32 %rcc.tmp.168, 0
  %rcc.tmp.170 = getelementptr [100 x i32], ptr %buffer_last_used, i32 0, i32 %rcc.tmp.169
  %rcc.tmp.171 = load i32, ptr %current_time
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = load i32, ptr %buffer_slot
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [100 x i1], ptr %buffer_reference_bit, i32 0, i32 %rcc.tmp.174
  store i1 1, ptr %rcc.tmp.175
  br label %if.merge.4
if.else.4:
  %rcc.tmp.178 = load i32, ptr %buffer_misses
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 1
  store i32 %rcc.tmp.179, ptr %buffer_misses
  %rcc.tmp.181 = load i32, ptr %pool_size..tmp
  %rcc.tmp.182 = call i32 @findFreeBufferSlot.([100 x i32]* %buffer_pool, i32 %rcc.tmp.181)
  store i32 %rcc.tmp.182, ptr %free_slot
  %rcc.tmp.184 = load i32, ptr %free_slot
  %rcc.tmp.185 = icmp sge i32 %rcc.tmp.184, 0
  br i1 %rcc.tmp.185, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.187 = load i32, ptr %free_slot
  %rcc.tmp.188 = add i32 %rcc.tmp.187, 0
  %rcc.tmp.189 = getelementptr [100 x i32], ptr %buffer_pool, i32 0, i32 %rcc.tmp.188
  %rcc.tmp.190 = load i32, ptr %page_id
  store i32 %rcc.tmp.190, ptr %rcc.tmp.189
  %rcc.tmp.192 = load i32, ptr %free_slot
  %rcc.tmp.193 = add i32 %rcc.tmp.192, 0
  %rcc.tmp.194 = getelementptr [100 x i1], ptr %buffer_dirty, i32 0, i32 %rcc.tmp.193
  store i1 0, ptr %rcc.tmp.194
  %rcc.tmp.196 = load i32, ptr %free_slot
  %rcc.tmp.197 = add i32 %rcc.tmp.196, 0
  %rcc.tmp.198 = getelementptr [100 x i32], ptr %buffer_pin_count, i32 0, i32 %rcc.tmp.197
  store i32 0, ptr %rcc.tmp.198
  %rcc.tmp.200 = load i32, ptr %free_slot
  %rcc.tmp.201 = add i32 %rcc.tmp.200, 0
  %rcc.tmp.202 = getelementptr [100 x i32], ptr %buffer_last_used, i32 0, i32 %rcc.tmp.201
  %rcc.tmp.203 = load i32, ptr %current_time
  store i32 %rcc.tmp.203, ptr %rcc.tmp.202
  %rcc.tmp.205 = load i32, ptr %free_slot
  %rcc.tmp.206 = add i32 %rcc.tmp.205, 0
  %rcc.tmp.207 = getelementptr [100 x i1], ptr %buffer_reference_bit, i32 0, i32 %rcc.tmp.206
  store i1 1, ptr %rcc.tmp.207
  %rcc.tmp.209 = load i32, ptr %page_id
  %rcc.tmp.210 = add i32 %rcc.tmp.209, 0
  %rcc.tmp.211 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.210
  %rcc.tmp.212 = load i32, ptr %free_slot
  store i32 %rcc.tmp.212, ptr %rcc.tmp.211
  br label %if.merge.5
if.else.5:
  %rcc.tmp.215 = load i32, ptr %clock_hand
  %rcc.tmp.216 = load i32, ptr %pool_size..tmp
  %rcc.tmp.217 = call i32 @clockPageReplacement.([100 x i32]* %buffer_pool, [100 x i32]* %buffer_pin_count, [100 x i1]* %buffer_reference_bit, i32 %rcc.tmp.215, i32 %rcc.tmp.216)
  store i32 %rcc.tmp.217, ptr %evict_slot
  %rcc.tmp.219 = load i32, ptr %evict_slot
  %rcc.tmp.220 = icmp sge i32 %rcc.tmp.219, 0
  br i1 %rcc.tmp.220, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.222 = load i32, ptr %evict_slot
  %rcc.tmp.223 = add i32 %rcc.tmp.222, 1
  %rcc.tmp.224 = load i32, ptr %pool_size..tmp
  %rcc.tmp.225 = srem i32 %rcc.tmp.223, %rcc.tmp.224
  store i32 %rcc.tmp.225, ptr %clock_hand
  %rcc.tmp.227 = load i32, ptr %evict_slot
  %rcc.tmp.228 = add i32 %rcc.tmp.227, 0
  %rcc.tmp.229 = getelementptr [100 x i32], ptr %buffer_pool, i32 0, i32 %rcc.tmp.228
  %rcc.tmp.230 = load i32, ptr %rcc.tmp.229
  store i32 %rcc.tmp.230, ptr %old_page_id
  %rcc.tmp.232 = load i32, ptr %old_page_id
  %rcc.tmp.233 = icmp sge i32 %rcc.tmp.232, 0
  br i1 %rcc.tmp.233, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.235 = load i32, ptr %old_page_id
  %rcc.tmp.236 = icmp slt i32 %rcc.tmp.235, 500
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.238 = phi i1 [0, %if.then.6], [%rcc.tmp.236, %and.rhs.4]
  br i1 %rcc.tmp.238, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.240 = load i32, ptr %old_page_id
  %rcc.tmp.241 = add i32 %rcc.tmp.240, 0
  %rcc.tmp.242 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.241
  %rcc.tmp.243 = sub i32 0, 1
  store i32 %rcc.tmp.243, ptr %rcc.tmp.242
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.247 = load i32, ptr %page_evictions
  %rcc.tmp.248 = add i32 %rcc.tmp.247, 1
  store i32 %rcc.tmp.248, ptr %page_evictions
  %rcc.tmp.250 = load i32, ptr %evict_slot
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 0
  %rcc.tmp.252 = getelementptr [100 x i32], ptr %buffer_pool, i32 0, i32 %rcc.tmp.251
  %rcc.tmp.253 = load i32, ptr %page_id
  store i32 %rcc.tmp.253, ptr %rcc.tmp.252
  %rcc.tmp.255 = load i32, ptr %evict_slot
  %rcc.tmp.256 = add i32 %rcc.tmp.255, 0
  %rcc.tmp.257 = getelementptr [100 x i1], ptr %buffer_dirty, i32 0, i32 %rcc.tmp.256
  store i1 0, ptr %rcc.tmp.257
  %rcc.tmp.259 = load i32, ptr %evict_slot
  %rcc.tmp.260 = add i32 %rcc.tmp.259, 0
  %rcc.tmp.261 = getelementptr [100 x i32], ptr %buffer_pin_count, i32 0, i32 %rcc.tmp.260
  store i32 0, ptr %rcc.tmp.261
  %rcc.tmp.263 = load i32, ptr %evict_slot
  %rcc.tmp.264 = add i32 %rcc.tmp.263, 0
  %rcc.tmp.265 = getelementptr [100 x i32], ptr %buffer_last_used, i32 0, i32 %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %current_time
  store i32 %rcc.tmp.266, ptr %rcc.tmp.265
  %rcc.tmp.268 = load i32, ptr %evict_slot
  %rcc.tmp.269 = add i32 %rcc.tmp.268, 0
  %rcc.tmp.270 = getelementptr [100 x i1], ptr %buffer_reference_bit, i32 0, i32 %rcc.tmp.269
  store i1 1, ptr %rcc.tmp.270
  %rcc.tmp.272 = load i32, ptr %page_id
  %rcc.tmp.273 = add i32 %rcc.tmp.272, 0
  %rcc.tmp.274 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.273
  %rcc.tmp.275 = load i32, ptr %evict_slot
  store i32 %rcc.tmp.275, ptr %rcc.tmp.274
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.281 = load i32, ptr %access_count
  %rcc.tmp.282 = srem i32 %rcc.tmp.281, 3
  %rcc.tmp.283 = icmp eq i32 %rcc.tmp.282, 0
  br i1 %rcc.tmp.283, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.285 = load i32, ptr %page_id
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 0
  %rcc.tmp.287 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.286
  %rcc.tmp.288 = load i32, ptr %rcc.tmp.287
  %rcc.tmp.289 = icmp sge i32 %rcc.tmp.288, 0
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.291 = phi i1 [0, %if.merge.4], [%rcc.tmp.289, %and.rhs.5]
  br i1 %rcc.tmp.291, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.293 = load i32, ptr %page_id
  %rcc.tmp.294 = add i32 %rcc.tmp.293, 0
  %rcc.tmp.295 = getelementptr [500 x i32], ptr %page_to_buffer, i32 0, i32 %rcc.tmp.294
  %rcc.tmp.296 = load i32, ptr %rcc.tmp.295
  %rcc.tmp.297 = add i32 %rcc.tmp.296, 0
  %rcc.tmp.298 = getelementptr [100 x i1], ptr %buffer_dirty, i32 0, i32 %rcc.tmp.297
  store i1 1, ptr %rcc.tmp.298
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.302 = load i32, ptr %current_time
  %rcc.tmp.303 = add i32 %rcc.tmp.302, 1
  store i32 %rcc.tmp.303, ptr %current_time
  %rcc.tmp.305 = load i32, ptr %access_count
  %rcc.tmp.306 = add i32 %rcc.tmp.305, 1
  store i32 %rcc.tmp.306, ptr %access_count
  %rcc.tmp.308 = load i32, ptr %i
  %rcc.tmp.309 = add i32 %rcc.tmp.308, 1
  store i32 %rcc.tmp.309, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.312 = load i32, ptr %round
  %rcc.tmp.313 = add i32 %rcc.tmp.312, 1
  store i32 %rcc.tmp.313, ptr %round
  br label %while.cond
while.end:
  %rcc.tmp.316 = load i32, ptr %buffer_hits
  %rcc.tmp.317 = mul i32 %rcc.tmp.316, 100
  %rcc.tmp.318 = load i32, ptr %buffer_hits
  %rcc.tmp.319 = load i32, ptr %buffer_misses
  %rcc.tmp.320 = add i32 %rcc.tmp.318, %rcc.tmp.319
  %rcc.tmp.321 = sdiv i32 %rcc.tmp.317, %rcc.tmp.320
  store i32 %rcc.tmp.321, ptr %hit_ratio
  %rcc.tmp.323 = load i32, ptr %buffer_hits
  call void @printlnInt.(i32 %rcc.tmp.323)
  %rcc.tmp.325 = load i32, ptr %buffer_misses
  call void @printlnInt.(i32 %rcc.tmp.325)
  %rcc.tmp.327 = load i32, ptr %hit_ratio
  call void @printlnInt.(i32 %rcc.tmp.327)
  %rcc.tmp.329 = load i32, ptr %page_evictions
  call void @printlnInt.(i32 %rcc.tmp.329)
  call void @printlnInt.(i32 26008)
  ret void
}
define i32 @findFreeBufferSlot.([100 x i32]* %buffer_pool.tmp, i32 %pool_size.tmp) {
entry:
  %buffer_pool..tmp = alloca [100 x i32]* 
  %pool_size..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %buffer_pool.tmp, ptr %buffer_pool..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %pool_size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [100 x i32]*, ptr %buffer_pool..tmp
  %rcc.tmp.13 = getelementptr [100 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = sub i32 0, 1
  %rcc.tmp.16 = icmp eq i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %i
  ret i32 %rcc.tmp.18
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = sub i32 0, 1
  ret i32 %rcc.tmp.25
}
define i32 @clockPageReplacement.([100 x i32]* %buffer_pool.tmp, [100 x i32]* %pin_counts.tmp, [100 x i1]* %reference_bits.tmp, i32 %start_hand.tmp, i32 %pool_size.tmp) {
entry:
  %buffer_pool..tmp = alloca [100 x i32]* 
  %pin_counts..tmp = alloca [100 x i32]* 
  %reference_bits..tmp = alloca [100 x i1]* 
  %start_hand..tmp = alloca i32 
  %pool_size..tmp = alloca i32 
  %current_hand = alloca i32 
  %cycles = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %buffer_pool.tmp, ptr %buffer_pool..tmp
  store [100 x i32]* %pin_counts.tmp, ptr %pin_counts..tmp
  store [100 x i1]* %reference_bits.tmp, ptr %reference_bits..tmp
  store i32 %start_hand.tmp, ptr %start_hand..tmp
  store i32 %pool_size.tmp, ptr %pool_size..tmp
  %rcc.tmp.6 = load i32, ptr %start_hand..tmp
  store i32 %rcc.tmp.6, ptr %current_hand
  store i32 0, ptr %cycles
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %cycles
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 2
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %current_hand
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [100 x i32]*, ptr %pin_counts..tmp
  %rcc.tmp.17 = getelementptr [100 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %current_hand
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [100 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.24 = getelementptr [100 x i1], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i1, ptr %rcc.tmp.24
  %rcc.tmp.26 = xor i1 %rcc.tmp.25, true
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.28 = load i32, ptr %current_hand
  ret i32 %rcc.tmp.28
if.else.2:
  %rcc.tmp.30 = load i32, ptr %current_hand
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [100 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.33 = getelementptr [100 x i1], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  store i1 0, ptr %rcc.tmp.33
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %current_hand
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  %rcc.tmp.40 = load i32, ptr %pool_size..tmp
  %rcc.tmp.41 = srem i32 %rcc.tmp.39, %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %current_hand
  %rcc.tmp.43 = load i32, ptr %current_hand
  %rcc.tmp.44 = load i32, ptr %start_hand..tmp
  %rcc.tmp.45 = icmp eq i32 %rcc.tmp.43, %rcc.tmp.44
  br i1 %rcc.tmp.45, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.47 = load i32, ptr %cycles
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %cycles
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load i32, ptr %pool_size..tmp
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.55, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [100 x i32]*, ptr %pin_counts..tmp
  %rcc.tmp.63 = getelementptr [100 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = icmp eq i32 %rcc.tmp.64, 0
  br i1 %rcc.tmp.65, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.67 = load i32, ptr %i
  ret i32 %rcc.tmp.67
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.74 = sub i32 0, 1
  ret i32 %rcc.tmp.74
}
define void @performQueryOptimizationTest.(i32 %table_size.tmp) {
entry:
  %table_size..tmp = alloca i32 
  %table_cardinalities = alloca [5 x i32] 
  %table_pages = alloca [5 x i32] 
  %index_selectivities = alloca [5 x [3 x i32]] 
  %plan_costs = alloca [20 x i32] 
  %fill.idx = alloca i32 
  %plan_types = alloca [20 x i32] 
  %fill.idx.2 = alloca i32 
  %plan_count = alloca i32 
  %query_id = alloca i32 
  %num_tables = alloca i32 
  %best_cost = alloca i32 
  %best_plan = alloca i32 
  %join_order = alloca i32 
  %current_cost = alloca i32 
  %index_cost = alloca i32 
  %actual_cost = alloca i32 
  %cost_accuracy = alloca i32 
  %nested_loop_count = alloca i32 
  %hash_join_count = alloca i32 
  %sort_merge_count = alloca i32 
  %i = alloca i32 
  store i32 %table_size.tmp, ptr %table_size..tmp
  call void @printlnInt.(i32 26009)
  %rcc.tmp.3 = getelementptr [5 x i32], ptr %table_cardinalities, i32 0, i32 0
  store i32 100, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [5 x i32], ptr %table_cardinalities, i32 0, i32 1
  store i32 200, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %table_cardinalities, i32 0, i32 2
  store i32 150, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [5 x i32], ptr %table_cardinalities, i32 0, i32 3
  store i32 300, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [5 x i32], ptr %table_cardinalities, i32 0, i32 4
  store i32 250, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [5 x i32], ptr %table_pages, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [5 x i32], ptr %table_pages, i32 0, i32 1
  store i32 20, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [5 x i32], ptr %table_pages, i32 0, i32 2
  store i32 15, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [5 x i32], ptr %table_pages, i32 0, i32 3
  store i32 30, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [5 x i32], ptr %table_pages, i32 0, i32 4
  store i32 25, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [5 x [3 x i32]], ptr %index_selectivities, i32 0, i32 0
  %rcc.tmp.24 = getelementptr [3 x i32], ptr %rcc.tmp.23, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [3 x i32], ptr %rcc.tmp.23, i32 0, i32 1
  store i32 25, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [3 x i32], ptr %rcc.tmp.23, i32 0, i32 2
  store i32 50, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [5 x [3 x i32]], ptr %index_selectivities, i32 0, i32 1
  %rcc.tmp.31 = getelementptr [3 x i32], ptr %rcc.tmp.30, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [3 x i32], ptr %rcc.tmp.30, i32 0, i32 1
  store i32 25, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [3 x i32], ptr %rcc.tmp.30, i32 0, i32 2
  store i32 50, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [5 x [3 x i32]], ptr %index_selectivities, i32 0, i32 2
  %rcc.tmp.38 = getelementptr [3 x i32], ptr %rcc.tmp.37, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [3 x i32], ptr %rcc.tmp.37, i32 0, i32 1
  store i32 25, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [3 x i32], ptr %rcc.tmp.37, i32 0, i32 2
  store i32 50, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [5 x [3 x i32]], ptr %index_selectivities, i32 0, i32 3
  %rcc.tmp.45 = getelementptr [3 x i32], ptr %rcc.tmp.44, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [3 x i32], ptr %rcc.tmp.44, i32 0, i32 1
  store i32 25, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [3 x i32], ptr %rcc.tmp.44, i32 0, i32 2
  store i32 50, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [5 x [3 x i32]], ptr %index_selectivities, i32 0, i32 4
  %rcc.tmp.52 = getelementptr [3 x i32], ptr %rcc.tmp.51, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [3 x i32], ptr %rcc.tmp.51, i32 0, i32 1
  store i32 25, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [3 x i32], ptr %rcc.tmp.51, i32 0, i32 2
  store i32 50, ptr %rcc.tmp.56
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.60 = load i32, ptr %fill.idx
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.60, 20
  br i1 %rcc.tmp.61, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.63 = load i32, ptr %fill.idx
  %rcc.tmp.64 = getelementptr [20 x i32], ptr %plan_costs, i32 0, i32 %rcc.tmp.63
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.66, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.71 = load i32, ptr %fill.idx.2
  %rcc.tmp.72 = icmp slt i32 %rcc.tmp.71, 20
  br i1 %rcc.tmp.72, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.74 = load i32, ptr %fill.idx.2
  %rcc.tmp.75 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.74
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.77, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %plan_count
  store i32 0, ptr %query_id
  br label %while.cond
while.cond:
  %rcc.tmp.83 = load i32, ptr %query_id
  %rcc.tmp.84 = icmp slt i32 %rcc.tmp.83, 10
  br i1 %rcc.tmp.84, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.87 = load i32, ptr %query_id
  %rcc.tmp.88 = srem i32 %rcc.tmp.87, 3
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 2
  store i32 %rcc.tmp.89, ptr %num_tables
  store i32 999999, ptr %best_cost
  %rcc.tmp.92 = sub i32 0, 1
  store i32 %rcc.tmp.92, ptr %best_plan
  store i32 0, ptr %join_order
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.96 = load i32, ptr %join_order
  %rcc.tmp.97 = icmp slt i32 %rcc.tmp.96, 6
  br i1 %rcc.tmp.97, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.99 = load i32, ptr %plan_count
  %rcc.tmp.100 = icmp slt i32 %rcc.tmp.99, 20
  br label %sc.merge
sc.merge:
  %rcc.tmp.102 = phi i1 [0, %while.cond.2], [%rcc.tmp.100, %and.rhs]
  br i1 %rcc.tmp.102, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %current_cost
  %rcc.tmp.106 = load i32, ptr %join_order
  %rcc.tmp.107 = srem i32 %rcc.tmp.106, 3
  %rcc.tmp.108 = icmp eq i32 %rcc.tmp.107, 0
  br i1 %rcc.tmp.108, label %if.then, label %if.else
if.then:
  %rcc.tmp.110 = load i32, ptr %num_tables
  %rcc.tmp.111 = load i32, ptr %query_id
  %rcc.tmp.112 = call i32 @estimateNestedLoopCost.([5 x i32]* %table_cardinalities, [5 x i32]* %table_pages, i32 %rcc.tmp.110, i32 %rcc.tmp.111)
  store i32 %rcc.tmp.112, ptr %current_cost
  %rcc.tmp.114 = load i32, ptr %plan_count
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.115
  store i32 0, ptr %rcc.tmp.116
  br label %if.merge
if.else:
  %rcc.tmp.119 = load i32, ptr %join_order
  %rcc.tmp.120 = srem i32 %rcc.tmp.119, 3
  %rcc.tmp.121 = icmp eq i32 %rcc.tmp.120, 1
  br i1 %rcc.tmp.121, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.123 = load i32, ptr %num_tables
  %rcc.tmp.124 = load i32, ptr %query_id
  %rcc.tmp.125 = call i32 @estimateHashJoinCost.([5 x i32]* %table_cardinalities, [5 x i32]* %table_pages, i32 %rcc.tmp.123, i32 %rcc.tmp.124)
  store i32 %rcc.tmp.125, ptr %current_cost
  %rcc.tmp.127 = load i32, ptr %plan_count
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.128
  store i32 1, ptr %rcc.tmp.129
  br label %if.merge.2
if.else.2:
  %rcc.tmp.132 = load i32, ptr %num_tables
  %rcc.tmp.133 = load i32, ptr %query_id
  %rcc.tmp.134 = call i32 @estimateSortMergeCost.([5 x i32]* %table_cardinalities, [5 x i32]* %table_pages, i32 %rcc.tmp.132, i32 %rcc.tmp.133)
  store i32 %rcc.tmp.134, ptr %current_cost
  %rcc.tmp.136 = load i32, ptr %plan_count
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.137
  store i32 2, ptr %rcc.tmp.138
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.142 = load i32, ptr %num_tables
  %rcc.tmp.143 = load i32, ptr %query_id
  %rcc.tmp.144 = call i32 @selectOptimalIndex.([5 x [3 x i32]]* %index_selectivities, i32 %rcc.tmp.142, i32 %rcc.tmp.143)
  store i32 %rcc.tmp.144, ptr %index_cost
  %rcc.tmp.146 = load i32, ptr %current_cost
  %rcc.tmp.147 = load i32, ptr %index_cost
  %rcc.tmp.148 = add i32 %rcc.tmp.146, %rcc.tmp.147
  store i32 %rcc.tmp.148, ptr %current_cost
  %rcc.tmp.150 = load i32, ptr %plan_count
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = getelementptr [20 x i32], ptr %plan_costs, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %current_cost
  store i32 %rcc.tmp.153, ptr %rcc.tmp.152
  %rcc.tmp.155 = load i32, ptr %current_cost
  %rcc.tmp.156 = load i32, ptr %best_cost
  %rcc.tmp.157 = icmp slt i32 %rcc.tmp.155, %rcc.tmp.156
  br i1 %rcc.tmp.157, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.159 = load i32, ptr %current_cost
  store i32 %rcc.tmp.159, ptr %best_cost
  %rcc.tmp.161 = load i32, ptr %plan_count
  store i32 %rcc.tmp.161, ptr %best_plan
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.165 = load i32, ptr %plan_count
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %plan_count
  %rcc.tmp.168 = load i32, ptr %join_order
  %rcc.tmp.169 = add i32 %rcc.tmp.168, 1
  store i32 %rcc.tmp.169, ptr %join_order
  br label %while.cond.2
while.end.2:
  %rcc.tmp.172 = load i32, ptr %best_plan
  %rcc.tmp.173 = icmp sge i32 %rcc.tmp.172, 0
  br i1 %rcc.tmp.173, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.175 = load i32, ptr %best_plan
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 0
  %rcc.tmp.177 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.176
  %rcc.tmp.178 = load i32, ptr %rcc.tmp.177
  %rcc.tmp.179 = load i32, ptr %num_tables
  %rcc.tmp.180 = call i32 @simulatePlanExecution.(i32 %rcc.tmp.178, [5 x i32]* %table_cardinalities, i32 %rcc.tmp.179)
  store i32 %rcc.tmp.180, ptr %actual_cost
  %rcc.tmp.182 = load i32, ptr %best_plan
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 0
  %rcc.tmp.184 = getelementptr [20 x i32], ptr %plan_costs, i32 0, i32 %rcc.tmp.183
  %rcc.tmp.185 = load i32, ptr %rcc.tmp.184
  %rcc.tmp.186 = load i32, ptr %actual_cost
  %rcc.tmp.187 = call i32 @calculateCostAccuracy.(i32 %rcc.tmp.185, i32 %rcc.tmp.186)
  store i32 %rcc.tmp.187, ptr %cost_accuracy
  %rcc.tmp.189 = load i32, ptr %cost_accuracy
  call void @printlnInt.(i32 %rcc.tmp.189)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.193 = load i32, ptr %query_id
  %rcc.tmp.194 = add i32 %rcc.tmp.193, 1
  store i32 %rcc.tmp.194, ptr %query_id
  br label %while.cond
while.end:
  store i32 0, ptr %nested_loop_count
  store i32 0, ptr %hash_join_count
  store i32 0, ptr %sort_merge_count
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.202 = load i32, ptr %i
  %rcc.tmp.203 = load i32, ptr %plan_count
  %rcc.tmp.204 = icmp slt i32 %rcc.tmp.202, %rcc.tmp.203
  br i1 %rcc.tmp.204, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.207 = load i32, ptr %i
  %rcc.tmp.208 = add i32 %rcc.tmp.207, 0
  %rcc.tmp.209 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.208
  %rcc.tmp.210 = load i32, ptr %rcc.tmp.209
  %rcc.tmp.211 = icmp eq i32 %rcc.tmp.210, 0
  br i1 %rcc.tmp.211, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.213 = load i32, ptr %nested_loop_count
  %rcc.tmp.214 = add i32 %rcc.tmp.213, 1
  store i32 %rcc.tmp.214, ptr %nested_loop_count
  br label %if.merge.5
if.else.5:
  %rcc.tmp.217 = load i32, ptr %i
  %rcc.tmp.218 = add i32 %rcc.tmp.217, 0
  %rcc.tmp.219 = getelementptr [20 x i32], ptr %plan_types, i32 0, i32 %rcc.tmp.218
  %rcc.tmp.220 = load i32, ptr %rcc.tmp.219
  %rcc.tmp.221 = icmp eq i32 %rcc.tmp.220, 1
  br i1 %rcc.tmp.221, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.223 = load i32, ptr %hash_join_count
  %rcc.tmp.224 = add i32 %rcc.tmp.223, 1
  store i32 %rcc.tmp.224, ptr %hash_join_count
  br label %if.merge.6
if.else.6:
  %rcc.tmp.227 = load i32, ptr %sort_merge_count
  %rcc.tmp.228 = add i32 %rcc.tmp.227, 1
  store i32 %rcc.tmp.228, ptr %sort_merge_count
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.232 = load i32, ptr %i
  %rcc.tmp.233 = add i32 %rcc.tmp.232, 1
  store i32 %rcc.tmp.233, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.236 = load i32, ptr %nested_loop_count
  call void @printlnInt.(i32 %rcc.tmp.236)
  %rcc.tmp.238 = load i32, ptr %hash_join_count
  call void @printlnInt.(i32 %rcc.tmp.238)
  %rcc.tmp.240 = load i32, ptr %sort_merge_count
  call void @printlnInt.(i32 %rcc.tmp.240)
  call void @printlnInt.(i32 26010)
  ret void
}
define i32 @estimateNestedLoopCost.([5 x i32]* %cardinalities.tmp, [5 x i32]* %pages.tmp, i32 %num_tables.tmp, i32 %query_id.tmp) {
entry:
  %cardinalities..local = alloca [5 x i32] 
  %pages..local = alloca [5 x i32] 
  %num_tables..tmp = alloca i32 
  %query_id..tmp = alloca i32 
  %cost = alloca i32 
  %i = alloca i32 
  %outer_table = alloca i32 
  %inner_table = alloca i32 
  %rcc.tmp.1 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 0
  %rcc.tmp.22 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 1
  %rcc.tmp.26 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 1
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 2
  %rcc.tmp.30 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 2
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 3
  %rcc.tmp.34 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 4
  %rcc.tmp.38 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 4
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  store i32 %num_tables.tmp, ptr %num_tables..tmp
  store i32 %query_id.tmp, ptr %query_id..tmp
  store i32 0, ptr %cost
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %num_tables..tmp
  %rcc.tmp.48 = sub i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 5
  store i32 %rcc.tmp.53, ptr %outer_table
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 5
  store i32 %rcc.tmp.57, ptr %inner_table
  %rcc.tmp.59 = load i32, ptr %cost
  %rcc.tmp.60 = load i32, ptr %outer_table
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %inner_table
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = mul i32 %rcc.tmp.63, %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.59, %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %cost
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.75 = load i32, ptr %cost
  %rcc.tmp.76 = load i32, ptr %query_id..tmp
  %rcc.tmp.77 = mul i32 %rcc.tmp.76, 100
  %rcc.tmp.78 = add i32 %rcc.tmp.75, %rcc.tmp.77
  ret i32 %rcc.tmp.78
}
define i32 @estimateHashJoinCost.([5 x i32]* %cardinalities.tmp, [5 x i32]* %pages.tmp, i32 %num_tables.tmp, i32 %query_id.tmp) {
entry:
  %cardinalities..local = alloca [5 x i32] 
  %pages..local = alloca [5 x i32] 
  %num_tables..tmp = alloca i32 
  %query_id..tmp = alloca i32 
  %cost = alloca i32 
  %i = alloca i32 
  %table1 = alloca i32 
  %table2 = alloca i32 
  %rcc.tmp.1 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 0
  %rcc.tmp.22 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 1
  %rcc.tmp.26 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 1
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 2
  %rcc.tmp.30 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 2
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 3
  %rcc.tmp.34 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 4
  %rcc.tmp.38 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 4
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  store i32 %num_tables.tmp, ptr %num_tables..tmp
  store i32 %query_id.tmp, ptr %query_id..tmp
  store i32 0, ptr %cost
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %num_tables..tmp
  %rcc.tmp.48 = sub i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 5
  store i32 %rcc.tmp.53, ptr %table1
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 5
  store i32 %rcc.tmp.57, ptr %table2
  %rcc.tmp.59 = load i32, ptr %cost
  %rcc.tmp.60 = load i32, ptr %table1
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.59, %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %table2
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.64, %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %cost
  %rcc.tmp.71 = load i32, ptr %cost
  %rcc.tmp.72 = load i32, ptr %table1
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = sdiv i32 %rcc.tmp.75, 10
  %rcc.tmp.77 = add i32 %rcc.tmp.71, %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %cost
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.83 = load i32, ptr %cost
  %rcc.tmp.84 = load i32, ptr %query_id..tmp
  %rcc.tmp.85 = mul i32 %rcc.tmp.84, 50
  %rcc.tmp.86 = add i32 %rcc.tmp.83, %rcc.tmp.85
  ret i32 %rcc.tmp.86
}
define i32 @estimateSortMergeCost.([5 x i32]* %cardinalities.tmp, [5 x i32]* %pages.tmp, i32 %num_tables.tmp, i32 %query_id.tmp) {
entry:
  %cardinalities..local = alloca [5 x i32] 
  %pages..local = alloca [5 x i32] 
  %num_tables..tmp = alloca i32 
  %query_id..tmp = alloca i32 
  %cost = alloca i32 
  %i = alloca i32 
  %table1 = alloca i32 
  %table2 = alloca i32 
  %sort_cost1 = alloca i32 
  %sort_cost2 = alloca i32 
  %rcc.tmp.1 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 0
  %rcc.tmp.22 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 1
  %rcc.tmp.26 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 1
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 2
  %rcc.tmp.30 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 2
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 3
  %rcc.tmp.34 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [5 x i32], ptr %pages.tmp, i32 0, i32 4
  %rcc.tmp.38 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 4
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  store i32 %num_tables.tmp, ptr %num_tables..tmp
  store i32 %query_id.tmp, ptr %query_id..tmp
  store i32 0, ptr %cost
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %num_tables..tmp
  %rcc.tmp.48 = sub i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 5
  store i32 %rcc.tmp.53, ptr %table1
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 5
  store i32 %rcc.tmp.57, ptr %table2
  %rcc.tmp.59 = load i32, ptr %table1
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %table1
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = call i32 @logBase2.(i32 %rcc.tmp.66)
  %rcc.tmp.68 = mul i32 %rcc.tmp.62, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %sort_cost1
  %rcc.tmp.70 = load i32, ptr %table2
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %table2
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = call i32 @logBase2.(i32 %rcc.tmp.77)
  %rcc.tmp.79 = mul i32 %rcc.tmp.73, %rcc.tmp.78
  store i32 %rcc.tmp.79, ptr %sort_cost2
  %rcc.tmp.81 = load i32, ptr %cost
  %rcc.tmp.82 = load i32, ptr %sort_cost1
  %rcc.tmp.83 = add i32 %rcc.tmp.81, %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %sort_cost2
  %rcc.tmp.85 = add i32 %rcc.tmp.83, %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %cost
  %rcc.tmp.87 = load i32, ptr %cost
  %rcc.tmp.88 = load i32, ptr %table1
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = add i32 %rcc.tmp.87, %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %table2
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [5 x i32], ptr %pages..local, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.92, %rcc.tmp.96
  store i32 %rcc.tmp.97, ptr %cost
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.103 = load i32, ptr %cost
  %rcc.tmp.104 = load i32, ptr %query_id..tmp
  %rcc.tmp.105 = mul i32 %rcc.tmp.104, 75
  %rcc.tmp.106 = add i32 %rcc.tmp.103, %rcc.tmp.105
  ret i32 %rcc.tmp.106
}
define i32 @logBase2.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 1
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = icmp sle i32 %rcc.tmp.7, 2
  br i1 %rcc.tmp.8, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.12 = load i32, ptr %n..tmp
  %rcc.tmp.13 = icmp sle i32 %rcc.tmp.12, 4
  br i1 %rcc.tmp.13, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 2
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.17 = load i32, ptr %n..tmp
  %rcc.tmp.18 = icmp sle i32 %rcc.tmp.17, 8
  br i1 %rcc.tmp.18, label %if.then.4, label %if.else.4
if.then.4:
  ret i32 3
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.22 = load i32, ptr %n..tmp
  %rcc.tmp.23 = icmp sle i32 %rcc.tmp.22, 16
  br i1 %rcc.tmp.23, label %if.then.5, label %if.else.5
if.then.5:
  ret i32 4
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.27 = load i32, ptr %n..tmp
  %rcc.tmp.28 = icmp sle i32 %rcc.tmp.27, 32
  br i1 %rcc.tmp.28, label %if.then.6, label %if.else.6
if.then.6:
  ret i32 5
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.32 = load i32, ptr %n..tmp
  %rcc.tmp.33 = icmp sle i32 %rcc.tmp.32, 64
  br i1 %rcc.tmp.33, label %if.then.7, label %if.else.7
if.then.7:
  ret i32 6
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.37 = load i32, ptr %n..tmp
  %rcc.tmp.38 = icmp sle i32 %rcc.tmp.37, 128
  br i1 %rcc.tmp.38, label %if.then.8, label %if.else.8
if.then.8:
  ret i32 7
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.42 = load i32, ptr %n..tmp
  %rcc.tmp.43 = icmp sle i32 %rcc.tmp.42, 256
  br i1 %rcc.tmp.43, label %if.then.9, label %if.else.9
if.then.9:
  ret i32 8
if.else.9:
  br label %if.merge.9
if.merge.9:
  ret i32 9
}
define i32 @selectOptimalIndex.([5 x [3 x i32]]* %selectivities.tmp, i32 %num_tables.tmp, i32 %query_id.tmp) {
entry:
  %selectivities..local = alloca [5 x [3 x i32]] 
  %num_tables..tmp = alloca i32 
  %query_id..tmp = alloca i32 
  %total_index_cost = alloca i32 
  %i = alloca i32 
  %table_idx = alloca i32 
  %predicate_type = alloca i32 
  %selectivity = alloca i32 
  %rcc.tmp.1 = getelementptr [5 x [3 x i32]], ptr %selectivities.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [5 x [3 x i32]], ptr %selectivities..local, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [3 x i32], ptr %rcc.tmp.1, i32 0, i32 0
  %rcc.tmp.4 = getelementptr [3 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.3
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  %rcc.tmp.7 = getelementptr [3 x i32], ptr %rcc.tmp.1, i32 0, i32 1
  %rcc.tmp.8 = getelementptr [3 x i32], ptr %rcc.tmp.2, i32 0, i32 1
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = getelementptr [3 x i32], ptr %rcc.tmp.1, i32 0, i32 2
  %rcc.tmp.12 = getelementptr [3 x i32], ptr %rcc.tmp.2, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.13, ptr %rcc.tmp.12
  %rcc.tmp.15 = getelementptr [5 x [3 x i32]], ptr %selectivities.tmp, i32 0, i32 1
  %rcc.tmp.16 = getelementptr [5 x [3 x i32]], ptr %selectivities..local, i32 0, i32 1
  %rcc.tmp.17 = getelementptr [3 x i32], ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.18 = getelementptr [3 x i32], ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [3 x i32], ptr %rcc.tmp.15, i32 0, i32 1
  %rcc.tmp.22 = getelementptr [3 x i32], ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [3 x i32], ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.26 = getelementptr [3 x i32], ptr %rcc.tmp.16, i32 0, i32 2
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [5 x [3 x i32]], ptr %selectivities.tmp, i32 0, i32 2
  %rcc.tmp.30 = getelementptr [5 x [3 x i32]], ptr %selectivities..local, i32 0, i32 2
  %rcc.tmp.31 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 0
  %rcc.tmp.32 = getelementptr [3 x i32], ptr %rcc.tmp.30, i32 0, i32 0
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 1
  %rcc.tmp.36 = getelementptr [3 x i32], ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 2
  %rcc.tmp.40 = getelementptr [3 x i32], ptr %rcc.tmp.30, i32 0, i32 2
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.41, ptr %rcc.tmp.40
  %rcc.tmp.43 = getelementptr [5 x [3 x i32]], ptr %selectivities.tmp, i32 0, i32 3
  %rcc.tmp.44 = getelementptr [5 x [3 x i32]], ptr %selectivities..local, i32 0, i32 3
  %rcc.tmp.45 = getelementptr [3 x i32], ptr %rcc.tmp.43, i32 0, i32 0
  %rcc.tmp.46 = getelementptr [3 x i32], ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [3 x i32], ptr %rcc.tmp.43, i32 0, i32 1
  %rcc.tmp.50 = getelementptr [3 x i32], ptr %rcc.tmp.44, i32 0, i32 1
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [3 x i32], ptr %rcc.tmp.43, i32 0, i32 2
  %rcc.tmp.54 = getelementptr [3 x i32], ptr %rcc.tmp.44, i32 0, i32 2
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [5 x [3 x i32]], ptr %selectivities.tmp, i32 0, i32 4
  %rcc.tmp.58 = getelementptr [5 x [3 x i32]], ptr %selectivities..local, i32 0, i32 4
  %rcc.tmp.59 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 0
  %rcc.tmp.60 = getelementptr [3 x i32], ptr %rcc.tmp.58, i32 0, i32 0
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.61, ptr %rcc.tmp.60
  %rcc.tmp.63 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 1
  %rcc.tmp.64 = getelementptr [3 x i32], ptr %rcc.tmp.58, i32 0, i32 1
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 2
  %rcc.tmp.68 = getelementptr [3 x i32], ptr %rcc.tmp.58, i32 0, i32 2
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.69, ptr %rcc.tmp.68
  store i32 %num_tables.tmp, ptr %num_tables..tmp
  store i32 %query_id.tmp, ptr %query_id..tmp
  store i32 0, ptr %total_index_cost
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = load i32, ptr %num_tables..tmp
  %rcc.tmp.78 = icmp slt i32 %rcc.tmp.76, %rcc.tmp.77
  br i1 %rcc.tmp.78, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = srem i32 %rcc.tmp.81, 5
  store i32 %rcc.tmp.82, ptr %table_idx
  %rcc.tmp.84 = load i32, ptr %query_id..tmp
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  %rcc.tmp.87 = srem i32 %rcc.tmp.86, 3
  store i32 %rcc.tmp.87, ptr %predicate_type
  %rcc.tmp.89 = load i32, ptr %table_idx
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [5 x [3 x i32]], ptr %selectivities..local, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %predicate_type
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = getelementptr [3 x i32], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.94
  store i32 %rcc.tmp.95, ptr %selectivity
  %rcc.tmp.97 = load i32, ptr %selectivity
  %rcc.tmp.98 = icmp slt i32 %rcc.tmp.97, 20
  br i1 %rcc.tmp.98, label %if.then, label %if.else
if.then:
  %rcc.tmp.100 = load i32, ptr %total_index_cost
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 10
  store i32 %rcc.tmp.101, ptr %total_index_cost
  br label %if.merge
if.else:
  %rcc.tmp.104 = load i32, ptr %selectivity
  %rcc.tmp.105 = icmp slt i32 %rcc.tmp.104, 40
  br i1 %rcc.tmp.105, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.107 = load i32, ptr %total_index_cost
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 25
  store i32 %rcc.tmp.108, ptr %total_index_cost
  br label %if.merge.2
if.else.2:
  %rcc.tmp.111 = load i32, ptr %total_index_cost
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 50
  store i32 %rcc.tmp.112, ptr %total_index_cost
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  store i32 %rcc.tmp.117, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.120 = load i32, ptr %total_index_cost
  ret i32 %rcc.tmp.120
}
define i32 @simulatePlanExecution.(i32 %plan_type.tmp, [5 x i32]* %cardinalities.tmp, i32 %num_tables.tmp) {
entry:
  %plan_type..tmp = alloca i32 
  %cardinalities..local = alloca [5 x i32] 
  %num_tables..tmp = alloca i32 
  %execution_cost = alloca i32 
  %i = alloca i32 
  %outer_size = alloca i32 
  %inner_size = alloca i32 
  %i.2 = alloca i32 
  %table1_size = alloca i32 
  %table2_size = alloca i32 
  %i.3 = alloca i32 
  %table1_size.2 = alloca i32 
  %table2_size.2 = alloca i32 
  store i32 %plan_type.tmp, ptr %plan_type..tmp
  %rcc.tmp.2 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 0
  %rcc.tmp.3 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 0
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.2
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 1
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.8, ptr %rcc.tmp.7
  %rcc.tmp.10 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 2
  %rcc.tmp.11 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 3
  %rcc.tmp.15 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr [5 x i32], ptr %cardinalities.tmp, i32 0, i32 4
  %rcc.tmp.19 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 4
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  store i32 %num_tables.tmp, ptr %num_tables..tmp
  store i32 0, ptr %execution_cost
  %rcc.tmp.24 = load i32, ptr %plan_type..tmp
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %num_tables..tmp
  %rcc.tmp.31 = sub i32 %rcc.tmp.30, 1
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.29, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = urem i32 %rcc.tmp.36, 5
  %rcc.tmp.38 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %outer_size
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  %rcc.tmp.44 = urem i32 %rcc.tmp.43, 5
  %rcc.tmp.45 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %inner_size
  %rcc.tmp.48 = load i32, ptr %execution_cost
  %rcc.tmp.49 = load i32, ptr %outer_size
  %rcc.tmp.50 = load i32, ptr %inner_size
  %rcc.tmp.51 = mul i32 %rcc.tmp.49, %rcc.tmp.50
  %rcc.tmp.52 = sdiv i32 %rcc.tmp.51, 100
  %rcc.tmp.53 = add i32 %rcc.tmp.48, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %execution_cost
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  br label %if.merge
if.else:
  %rcc.tmp.60 = load i32, ptr %plan_type..tmp
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 1
  br i1 %rcc.tmp.61, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %i.2
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %i.2
  %rcc.tmp.66 = load i32, ptr %num_tables..tmp
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.71 = load i32, ptr %i.2
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = urem i32 %rcc.tmp.72, 5
  %rcc.tmp.74 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %table1_size
  %rcc.tmp.77 = load i32, ptr %i.2
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = urem i32 %rcc.tmp.79, 5
  %rcc.tmp.81 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %table2_size
  %rcc.tmp.84 = load i32, ptr %execution_cost
  %rcc.tmp.85 = load i32, ptr %table1_size
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %table2_size
  %rcc.tmp.88 = add i32 %rcc.tmp.86, %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %table1_size
  %rcc.tmp.90 = sdiv i32 %rcc.tmp.89, 10
  %rcc.tmp.91 = add i32 %rcc.tmp.88, %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %execution_cost
  %rcc.tmp.93 = load i32, ptr %i.2
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i.2
  br label %while.cond.2
while.end.2:
  br label %if.merge.2
if.else.2:
  store i32 0, ptr %i.3
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.100 = load i32, ptr %i.3
  %rcc.tmp.101 = load i32, ptr %num_tables..tmp
  %rcc.tmp.102 = sub i32 %rcc.tmp.101, 1
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.100, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.106 = load i32, ptr %i.3
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = urem i32 %rcc.tmp.107, 5
  %rcc.tmp.109 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.110, ptr %table1_size.2
  %rcc.tmp.112 = load i32, ptr %i.3
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  %rcc.tmp.115 = urem i32 %rcc.tmp.114, 5
  %rcc.tmp.116 = getelementptr [5 x i32], ptr %cardinalities..local, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  store i32 %rcc.tmp.117, ptr %table2_size.2
  %rcc.tmp.119 = load i32, ptr %execution_cost
  %rcc.tmp.120 = load i32, ptr %table1_size.2
  %rcc.tmp.121 = mul i32 %rcc.tmp.120, 2
  %rcc.tmp.122 = add i32 %rcc.tmp.119, %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %table2_size.2
  %rcc.tmp.124 = mul i32 %rcc.tmp.123, 2
  %rcc.tmp.125 = add i32 %rcc.tmp.122, %rcc.tmp.124
  store i32 %rcc.tmp.125, ptr %execution_cost
  %rcc.tmp.127 = load i32, ptr %execution_cost
  %rcc.tmp.128 = load i32, ptr %table1_size.2
  %rcc.tmp.129 = add i32 %rcc.tmp.127, %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %table2_size.2
  %rcc.tmp.131 = add i32 %rcc.tmp.129, %rcc.tmp.130
  store i32 %rcc.tmp.131, ptr %execution_cost
  %rcc.tmp.133 = load i32, ptr %i.3
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 1
  store i32 %rcc.tmp.134, ptr %i.3
  br label %while.cond.3
while.end.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.139 = load i32, ptr %execution_cost
  ret i32 %rcc.tmp.139
}
define i32 @calculateCostAccuracy.(i32 %estimated_cost.tmp, i32 %actual_cost.tmp) {
entry:
  %estimated_cost..tmp = alloca i32 
  %actual_cost..tmp = alloca i32 
  %difference = alloca i32 
  %accuracy = alloca i32 
  store i32 %estimated_cost.tmp, ptr %estimated_cost..tmp
  store i32 %actual_cost.tmp, ptr %actual_cost..tmp
  %rcc.tmp.3 = load i32, ptr %estimated_cost..tmp
  %rcc.tmp.4 = load i32, ptr %actual_cost..tmp
  %rcc.tmp.5 = icmp sgt i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %estimated_cost..tmp
  %rcc.tmp.8 = load i32, ptr %actual_cost..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.7, %rcc.tmp.8
  br label %if.merge
if.else:
  %rcc.tmp.11 = load i32, ptr %actual_cost..tmp
  %rcc.tmp.12 = load i32, ptr %estimated_cost..tmp
  %rcc.tmp.13 = sub i32 %rcc.tmp.11, %rcc.tmp.12
  br label %if.merge
if.merge:
  %rcc.tmp.15 = phi i32 [%rcc.tmp.9, %if.then], [%rcc.tmp.13, %if.else]
  store i32 %rcc.tmp.15, ptr %difference
  %rcc.tmp.17 = load i32, ptr %difference
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 100
  %rcc.tmp.19 = load i32, ptr %actual_cost..tmp
  %rcc.tmp.20 = sdiv i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = sub i32 100, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %accuracy
  %rcc.tmp.23 = load i32, ptr %accuracy
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.23, 0
  br i1 %rcc.tmp.24, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.27 = load i32, ptr %accuracy
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.29 = phi i32 [0, %if.then.2], [%rcc.tmp.27, %if.else.2]
  ret i32 %rcc.tmp.29
}
define void @performHashTableTest.(i32 %initial_size.tmp) {
entry:
  %initial_size..tmp = alloca i32 
  %hash_table = alloca [500 x i32] 
  %fill.idx = alloca i32 
  %hash_values = alloca [500 x i32] 
  %fill.idx.2 = alloca i32 
  %hash_table_size = alloca i32 
  %hash_entry_count = alloca i32 
  %collision_count = alloca i32 
  %rehash_count = alloca i32 
  %chain_table = alloca [100 x [8 x i32]] 
  %fill.idx.3 = alloca i32 
  %chain_values = alloca [100 x [8 x i32]] 
  %fill.idx.4 = alloca i32 
  %chain_lengths = alloca [100 x i32] 
  %fill.idx.5 = alloca i32 
  %chain_table_size = alloca i32 
  %insert_operations = alloca i32 
  %successful_inserts = alloca i32 
  %key = alloca i32 
  %value = alloca i32 
  %load_factor = alloca i32 
  %old_size = alloca i32 
  %old_keys = alloca [500 x i32] 
  %fill.idx.6 = alloca i32 
  %old_values = alloca [500 x i32] 
  %fill.idx.7 = alloca i32 
  %i = alloca i32 
  %insert_success = alloca i1 
  %chain_operations = alloca i32 
  %chain_successful_inserts = alloca i32 
  %key.2 = alloca i32 
  %value.2 = alloca i32 
  %hash_index = alloca i32 
  %found = alloca i1 
  %i.2 = alloca i32 
  %linear_lookup_success = alloca i32 
  %chain_lookup_success = alloca i32 
  %lookup_operations = alloca i32 
  %search_key = alloca i32 
  %linear_result = alloca i32 
  %chain_result = alloca i32 
  %linear_load_factor = alloca i32 
  %avg_chain_length = alloca i32 
  store i32 %initial_size.tmp, ptr %initial_size..tmp
  call void @printlnInt.(i32 26011)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 500
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [500 x i32], ptr %hash_table, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.10 = sub i32 0, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.9
  %rcc.tmp.12 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 500
  br i1 %rcc.tmp.18, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = getelementptr [500 x i32], ptr %hash_values, i32 0, i32 %rcc.tmp.20
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 100, ptr %hash_table_size
  store i32 0, ptr %hash_entry_count
  store i32 0, ptr %collision_count
  store i32 0, ptr %rehash_count
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.32 = load i32, ptr %fill.idx.3
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 100
  br i1 %rcc.tmp.33, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.35 = load i32, ptr %fill.idx.3
  %rcc.tmp.36 = getelementptr [100 x [8 x i32]], ptr %chain_table, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = sub i32 0, 1
  %rcc.tmp.38 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 0
  store i32 %rcc.tmp.37, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 2
  store i32 %rcc.tmp.37, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 3
  store i32 %rcc.tmp.37, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 4
  store i32 %rcc.tmp.37, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 5
  store i32 %rcc.tmp.37, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 6
  store i32 %rcc.tmp.37, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [8 x i32], ptr %rcc.tmp.36, i32 0, i32 7
  store i32 %rcc.tmp.37, ptr %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.54, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.59 = load i32, ptr %fill.idx.4
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 100
  br i1 %rcc.tmp.60, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.62 = load i32, ptr %fill.idx.4
  %rcc.tmp.63 = getelementptr [100 x [8 x i32]], ptr %chain_values, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.66
  %rcc.tmp.68 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [8 x i32], ptr %rcc.tmp.63, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.80, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.85 = load i32, ptr %fill.idx.5
  %rcc.tmp.86 = icmp slt i32 %rcc.tmp.85, 100
  br i1 %rcc.tmp.86, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.88 = load i32, ptr %fill.idx.5
  %rcc.tmp.89 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.88
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.91, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 100, ptr %chain_table_size
  store i32 0, ptr %insert_operations
  store i32 0, ptr %successful_inserts
  br label %while.cond
while.cond:
  %rcc.tmp.98 = load i32, ptr %insert_operations
  %rcc.tmp.99 = load i32, ptr %initial_size..tmp
  %rcc.tmp.100 = icmp slt i32 %rcc.tmp.98, %rcc.tmp.99
  br i1 %rcc.tmp.100, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.102 = load i32, ptr %insert_operations
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.102, 400
  br label %sc.merge
sc.merge:
  %rcc.tmp.105 = phi i1 [0, %while.cond], [%rcc.tmp.103, %and.rhs]
  br i1 %rcc.tmp.105, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.108 = load i32, ptr %insert_operations
  %rcc.tmp.109 = mul i32 %rcc.tmp.108, 17
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 23
  %rcc.tmp.111 = srem i32 %rcc.tmp.110, 2000
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.112, ptr %key
  %rcc.tmp.114 = load i32, ptr %insert_operations
  %rcc.tmp.115 = mul i32 %rcc.tmp.114, 11
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 7
  %rcc.tmp.117 = srem i32 %rcc.tmp.116, 1000
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %value
  %rcc.tmp.120 = load i32, ptr %hash_entry_count
  %rcc.tmp.121 = mul i32 %rcc.tmp.120, 100
  %rcc.tmp.122 = load i32, ptr %hash_table_size
  %rcc.tmp.123 = sdiv i32 %rcc.tmp.121, %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %load_factor
  %rcc.tmp.125 = load i32, ptr %load_factor
  %rcc.tmp.126 = icmp sgt i32 %rcc.tmp.125, 70
  br i1 %rcc.tmp.126, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.128 = load i32, ptr %hash_table_size
  %rcc.tmp.129 = icmp slt i32 %rcc.tmp.128, 250
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.131 = phi i1 [0, %while.body], [%rcc.tmp.129, %and.rhs.2]
  br i1 %rcc.tmp.131, label %if.then, label %if.else
if.then:
  %rcc.tmp.133 = load i32, ptr %hash_table_size
  store i32 %rcc.tmp.133, ptr %old_size
  %rcc.tmp.135 = load i32, ptr %hash_table_size
  %rcc.tmp.136 = mul i32 %rcc.tmp.135, 2
  store i32 %rcc.tmp.136, ptr %hash_table_size
  %rcc.tmp.138 = load i32, ptr %rehash_count
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %rehash_count
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.143 = load i32, ptr %fill.idx.6
  %rcc.tmp.144 = icmp slt i32 %rcc.tmp.143, 500
  br i1 %rcc.tmp.144, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.146 = load i32, ptr %fill.idx.6
  %rcc.tmp.147 = getelementptr [500 x i32], ptr %old_keys, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = sub i32 0, 1
  store i32 %rcc.tmp.148, ptr %rcc.tmp.147
  %rcc.tmp.150 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.150, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.155 = load i32, ptr %fill.idx.7
  %rcc.tmp.156 = icmp slt i32 %rcc.tmp.155, 500
  br i1 %rcc.tmp.156, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.158 = load i32, ptr %fill.idx.7
  %rcc.tmp.159 = getelementptr [500 x i32], ptr %old_values, i32 0, i32 %rcc.tmp.158
  store i32 0, ptr %rcc.tmp.159
  %rcc.tmp.161 = add i32 %rcc.tmp.158, 1
  store i32 %rcc.tmp.161, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.166 = load i32, ptr %i
  %rcc.tmp.167 = load i32, ptr %old_size
  %rcc.tmp.168 = icmp slt i32 %rcc.tmp.166, %rcc.tmp.167
  br i1 %rcc.tmp.168, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.171 = load i32, ptr %i
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 0
  %rcc.tmp.173 = getelementptr [500 x i32], ptr %old_keys, i32 0, i32 %rcc.tmp.172
  %rcc.tmp.174 = load i32, ptr %i
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 0
  %rcc.tmp.176 = getelementptr [500 x i32], ptr %hash_table, i32 0, i32 %rcc.tmp.175
  %rcc.tmp.177 = load i32, ptr %rcc.tmp.176
  store i32 %rcc.tmp.177, ptr %rcc.tmp.173
  %rcc.tmp.179 = load i32, ptr %i
  %rcc.tmp.180 = add i32 %rcc.tmp.179, 0
  %rcc.tmp.181 = getelementptr [500 x i32], ptr %old_values, i32 0, i32 %rcc.tmp.180
  %rcc.tmp.182 = load i32, ptr %i
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 0
  %rcc.tmp.184 = getelementptr [500 x i32], ptr %hash_values, i32 0, i32 %rcc.tmp.183
  %rcc.tmp.185 = load i32, ptr %rcc.tmp.184
  store i32 %rcc.tmp.185, ptr %rcc.tmp.181
  %rcc.tmp.187 = load i32, ptr %i
  %rcc.tmp.188 = add i32 %rcc.tmp.187, 0
  %rcc.tmp.189 = getelementptr [500 x i32], ptr %hash_table, i32 0, i32 %rcc.tmp.188
  %rcc.tmp.190 = sub i32 0, 1
  store i32 %rcc.tmp.190, ptr %rcc.tmp.189
  %rcc.tmp.192 = load i32, ptr %i
  %rcc.tmp.193 = add i32 %rcc.tmp.192, 0
  %rcc.tmp.194 = getelementptr [500 x i32], ptr %hash_values, i32 0, i32 %rcc.tmp.193
  store i32 0, ptr %rcc.tmp.194
  %rcc.tmp.196 = load i32, ptr %i
  %rcc.tmp.197 = add i32 %rcc.tmp.196, 1
  store i32 %rcc.tmp.197, ptr %i
  br label %while.cond.2
while.end.2:
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.201 = load i32, ptr %i
  %rcc.tmp.202 = load i32, ptr %hash_table_size
  %rcc.tmp.203 = icmp slt i32 %rcc.tmp.201, %rcc.tmp.202
  br i1 %rcc.tmp.203, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.206 = load i32, ptr %i
  %rcc.tmp.207 = add i32 %rcc.tmp.206, 0
  %rcc.tmp.208 = getelementptr [500 x i32], ptr %hash_table, i32 0, i32 %rcc.tmp.207
  %rcc.tmp.209 = sub i32 0, 1
  store i32 %rcc.tmp.209, ptr %rcc.tmp.208
  %rcc.tmp.211 = load i32, ptr %i
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 0
  %rcc.tmp.213 = getelementptr [500 x i32], ptr %hash_values, i32 0, i32 %rcc.tmp.212
  store i32 0, ptr %rcc.tmp.213
  %rcc.tmp.215 = load i32, ptr %i
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 1
  store i32 %rcc.tmp.216, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %hash_entry_count
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.222 = load i32, ptr %i
  %rcc.tmp.223 = load i32, ptr %old_size
  %rcc.tmp.224 = icmp slt i32 %rcc.tmp.222, %rcc.tmp.223
  br i1 %rcc.tmp.224, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.227 = load i32, ptr %i
  %rcc.tmp.228 = add i32 %rcc.tmp.227, 0
  %rcc.tmp.229 = getelementptr [500 x i32], ptr %old_keys, i32 0, i32 %rcc.tmp.228
  %rcc.tmp.230 = load i32, ptr %rcc.tmp.229
  %rcc.tmp.231 = sub i32 0, 1
  %rcc.tmp.232 = icmp ne i32 %rcc.tmp.230, %rcc.tmp.231
  br i1 %rcc.tmp.232, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.234 = load i32, ptr %hash_table_size
  %rcc.tmp.235 = load i32, ptr %i
  %rcc.tmp.236 = add i32 %rcc.tmp.235, 0
  %rcc.tmp.237 = getelementptr [500 x i32], ptr %old_keys, i32 0, i32 %rcc.tmp.236
  %rcc.tmp.238 = load i32, ptr %rcc.tmp.237
  %rcc.tmp.239 = load i32, ptr %i
  %rcc.tmp.240 = add i32 %rcc.tmp.239, 0
  %rcc.tmp.241 = getelementptr [500 x i32], ptr %old_values, i32 0, i32 %rcc.tmp.240
  %rcc.tmp.242 = load i32, ptr %rcc.tmp.241
  %rcc.tmp.243 = load i32, ptr %hash_entry_count
  %rcc.tmp.244 = call i1 @insertLinearProbing.([500 x i32]* %hash_table, [500 x i32]* %hash_values, i32 %rcc.tmp.234, i32 %rcc.tmp.238, i32 %rcc.tmp.242, i32* %collision_count, i32 %rcc.tmp.243)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.247 = load i32, ptr %i
  %rcc.tmp.248 = add i32 %rcc.tmp.247, 1
  store i32 %rcc.tmp.248, ptr %i
  br label %while.cond.4
while.end.4:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.253 = load i32, ptr %hash_table_size
  %rcc.tmp.254 = load i32, ptr %key
  %rcc.tmp.255 = load i32, ptr %value
  %rcc.tmp.256 = load i32, ptr %hash_entry_count
  %rcc.tmp.257 = call i1 @insertLinearProbing.([500 x i32]* %hash_table, [500 x i32]* %hash_values, i32 %rcc.tmp.253, i32 %rcc.tmp.254, i32 %rcc.tmp.255, i32* %collision_count, i32 %rcc.tmp.256)
  store i1 %rcc.tmp.257, ptr %insert_success
  %rcc.tmp.259 = load i1, ptr %insert_success
  br i1 %rcc.tmp.259, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.261 = load i32, ptr %successful_inserts
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 1
  store i32 %rcc.tmp.262, ptr %successful_inserts
  %rcc.tmp.264 = load i32, ptr %hash_entry_count
  %rcc.tmp.265 = add i32 %rcc.tmp.264, 1
  store i32 %rcc.tmp.265, ptr %hash_entry_count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.269 = load i32, ptr %insert_operations
  %rcc.tmp.270 = add i32 %rcc.tmp.269, 1
  store i32 %rcc.tmp.270, ptr %insert_operations
  br label %while.cond
while.end:
  store i32 0, ptr %chain_operations
  store i32 0, ptr %chain_successful_inserts
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.276 = load i32, ptr %chain_operations
  %rcc.tmp.277 = load i32, ptr %initial_size..tmp
  %rcc.tmp.278 = icmp slt i32 %rcc.tmp.276, %rcc.tmp.277
  br i1 %rcc.tmp.278, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.280 = load i32, ptr %chain_operations
  %rcc.tmp.281 = icmp slt i32 %rcc.tmp.280, 300
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.283 = phi i1 [0, %while.cond.5], [%rcc.tmp.281, %and.rhs.3]
  br i1 %rcc.tmp.283, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.286 = load i32, ptr %chain_operations
  %rcc.tmp.287 = mul i32 %rcc.tmp.286, 13
  %rcc.tmp.288 = add i32 %rcc.tmp.287, 31
  %rcc.tmp.289 = srem i32 %rcc.tmp.288, 1500
  %rcc.tmp.290 = add i32 %rcc.tmp.289, 1
  store i32 %rcc.tmp.290, ptr %key.2
  %rcc.tmp.292 = load i32, ptr %chain_operations
  %rcc.tmp.293 = mul i32 %rcc.tmp.292, 19
  %rcc.tmp.294 = add i32 %rcc.tmp.293, 5
  %rcc.tmp.295 = srem i32 %rcc.tmp.294, 800
  %rcc.tmp.296 = add i32 %rcc.tmp.295, 1
  store i32 %rcc.tmp.296, ptr %value.2
  %rcc.tmp.298 = load i32, ptr %key.2
  %rcc.tmp.299 = load i32, ptr %chain_table_size
  %rcc.tmp.300 = srem i32 %rcc.tmp.298, %rcc.tmp.299
  store i32 %rcc.tmp.300, ptr %hash_index
  store i1 0, ptr %found
  store i32 0, ptr %i.2
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.305 = load i32, ptr %i.2
  %rcc.tmp.306 = load i32, ptr %hash_index
  %rcc.tmp.307 = add i32 %rcc.tmp.306, 0
  %rcc.tmp.308 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.307
  %rcc.tmp.309 = load i32, ptr %rcc.tmp.308
  %rcc.tmp.310 = icmp slt i32 %rcc.tmp.305, %rcc.tmp.309
  br i1 %rcc.tmp.310, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.312 = load i32, ptr %i.2
  %rcc.tmp.313 = icmp slt i32 %rcc.tmp.312, 8
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.315 = phi i1 [0, %while.cond.6], [%rcc.tmp.313, %and.rhs.4]
  br i1 %rcc.tmp.315, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.318 = load i32, ptr %hash_index
  %rcc.tmp.319 = add i32 %rcc.tmp.318, 0
  %rcc.tmp.320 = getelementptr [100 x [8 x i32]], ptr %chain_table, i32 0, i32 %rcc.tmp.319
  %rcc.tmp.321 = load i32, ptr %i.2
  %rcc.tmp.322 = add i32 %rcc.tmp.321, 0
  %rcc.tmp.323 = getelementptr [8 x i32], ptr %rcc.tmp.320, i32 0, i32 %rcc.tmp.322
  %rcc.tmp.324 = load i32, ptr %rcc.tmp.323
  %rcc.tmp.325 = load i32, ptr %key.2
  %rcc.tmp.326 = icmp eq i32 %rcc.tmp.324, %rcc.tmp.325
  br i1 %rcc.tmp.326, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.328 = load i32, ptr %hash_index
  %rcc.tmp.329 = add i32 %rcc.tmp.328, 0
  %rcc.tmp.330 = getelementptr [100 x [8 x i32]], ptr %chain_values, i32 0, i32 %rcc.tmp.329
  %rcc.tmp.331 = load i32, ptr %i.2
  %rcc.tmp.332 = add i32 %rcc.tmp.331, 0
  %rcc.tmp.333 = getelementptr [8 x i32], ptr %rcc.tmp.330, i32 0, i32 %rcc.tmp.332
  %rcc.tmp.334 = load i32, ptr %value.2
  store i32 %rcc.tmp.334, ptr %rcc.tmp.333
  store i1 1, ptr %found
  br label %while.linker.6
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.339 = load i32, ptr %i.2
  %rcc.tmp.340 = add i32 %rcc.tmp.339, 1
  store i32 %rcc.tmp.340, ptr %i.2
  br label %while.cond.6
while.end.6:
  %rcc.tmp.343 = load i1, ptr %found
  %rcc.tmp.344 = xor i1 %rcc.tmp.343, true
  br i1 %rcc.tmp.344, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.346 = load i32, ptr %hash_index
  %rcc.tmp.347 = add i32 %rcc.tmp.346, 0
  %rcc.tmp.348 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.347
  %rcc.tmp.349 = load i32, ptr %rcc.tmp.348
  %rcc.tmp.350 = icmp slt i32 %rcc.tmp.349, 8
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.352 = phi i1 [0, %while.end.6], [%rcc.tmp.350, %and.rhs.5]
  br i1 %rcc.tmp.352, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.354 = load i32, ptr %hash_index
  %rcc.tmp.355 = add i32 %rcc.tmp.354, 0
  %rcc.tmp.356 = getelementptr [100 x [8 x i32]], ptr %chain_table, i32 0, i32 %rcc.tmp.355
  %rcc.tmp.357 = load i32, ptr %hash_index
  %rcc.tmp.358 = add i32 %rcc.tmp.357, 0
  %rcc.tmp.359 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.358
  %rcc.tmp.360 = load i32, ptr %rcc.tmp.359
  %rcc.tmp.361 = add i32 %rcc.tmp.360, 0
  %rcc.tmp.362 = getelementptr [8 x i32], ptr %rcc.tmp.356, i32 0, i32 %rcc.tmp.361
  %rcc.tmp.363 = load i32, ptr %key.2
  store i32 %rcc.tmp.363, ptr %rcc.tmp.362
  %rcc.tmp.365 = load i32, ptr %hash_index
  %rcc.tmp.366 = add i32 %rcc.tmp.365, 0
  %rcc.tmp.367 = getelementptr [100 x [8 x i32]], ptr %chain_values, i32 0, i32 %rcc.tmp.366
  %rcc.tmp.368 = load i32, ptr %hash_index
  %rcc.tmp.369 = add i32 %rcc.tmp.368, 0
  %rcc.tmp.370 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.369
  %rcc.tmp.371 = load i32, ptr %rcc.tmp.370
  %rcc.tmp.372 = add i32 %rcc.tmp.371, 0
  %rcc.tmp.373 = getelementptr [8 x i32], ptr %rcc.tmp.367, i32 0, i32 %rcc.tmp.372
  %rcc.tmp.374 = load i32, ptr %value.2
  store i32 %rcc.tmp.374, ptr %rcc.tmp.373
  %rcc.tmp.376 = load i32, ptr %hash_index
  %rcc.tmp.377 = add i32 %rcc.tmp.376, 0
  %rcc.tmp.378 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.377
  %rcc.tmp.379 = load i32, ptr %hash_index
  %rcc.tmp.380 = add i32 %rcc.tmp.379, 0
  %rcc.tmp.381 = getelementptr [100 x i32], ptr %chain_lengths, i32 0, i32 %rcc.tmp.380
  %rcc.tmp.382 = load i32, ptr %rcc.tmp.381
  %rcc.tmp.383 = add i32 %rcc.tmp.382, 1
  store i32 %rcc.tmp.383, ptr %rcc.tmp.378
  %rcc.tmp.385 = load i32, ptr %chain_successful_inserts
  %rcc.tmp.386 = add i32 %rcc.tmp.385, 1
  store i32 %rcc.tmp.386, ptr %chain_successful_inserts
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.390 = load i32, ptr %chain_operations
  %rcc.tmp.391 = add i32 %rcc.tmp.390, 1
  store i32 %rcc.tmp.391, ptr %chain_operations
  br label %while.cond.5
while.end.5:
  store i32 0, ptr %linear_lookup_success
  store i32 0, ptr %chain_lookup_success
  store i32 0, ptr %lookup_operations
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.398 = load i32, ptr %lookup_operations
  %rcc.tmp.399 = icmp slt i32 %rcc.tmp.398, 100
  br i1 %rcc.tmp.399, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.402 = load i32, ptr %lookup_operations
  %rcc.tmp.403 = mul i32 %rcc.tmp.402, 23
  %rcc.tmp.404 = add i32 %rcc.tmp.403, 17
  %rcc.tmp.405 = srem i32 %rcc.tmp.404, 1000
  %rcc.tmp.406 = add i32 %rcc.tmp.405, 1
  store i32 %rcc.tmp.406, ptr %search_key
  %rcc.tmp.408 = load i32, ptr %hash_table_size
  %rcc.tmp.409 = load i32, ptr %search_key
  %rcc.tmp.410 = call i32 @lookupLinearProbing.([500 x i32]* %hash_table, i32 %rcc.tmp.408, i32 %rcc.tmp.409)
  store i32 %rcc.tmp.410, ptr %linear_result
  %rcc.tmp.412 = load i32, ptr %linear_result
  %rcc.tmp.413 = icmp sge i32 %rcc.tmp.412, 0
  br i1 %rcc.tmp.413, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.415 = load i32, ptr %linear_lookup_success
  %rcc.tmp.416 = add i32 %rcc.tmp.415, 1
  store i32 %rcc.tmp.416, ptr %linear_lookup_success
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.420 = load i32, ptr %chain_table_size
  %rcc.tmp.421 = load i32, ptr %search_key
  %rcc.tmp.422 = call i32 @lookupChaining.([100 x [8 x i32]]* %chain_table, [100 x i32]* %chain_lengths, i32 %rcc.tmp.420, i32 %rcc.tmp.421)
  store i32 %rcc.tmp.422, ptr %chain_result
  %rcc.tmp.424 = load i32, ptr %chain_result
  %rcc.tmp.425 = icmp sge i32 %rcc.tmp.424, 0
  br i1 %rcc.tmp.425, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.427 = load i32, ptr %chain_lookup_success
  %rcc.tmp.428 = add i32 %rcc.tmp.427, 1
  store i32 %rcc.tmp.428, ptr %chain_lookup_success
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.432 = load i32, ptr %lookup_operations
  %rcc.tmp.433 = add i32 %rcc.tmp.432, 1
  store i32 %rcc.tmp.433, ptr %lookup_operations
  br label %while.cond.7
while.end.7:
  %rcc.tmp.436 = load i32, ptr %hash_entry_count
  %rcc.tmp.437 = mul i32 %rcc.tmp.436, 100
  %rcc.tmp.438 = load i32, ptr %hash_table_size
  %rcc.tmp.439 = sdiv i32 %rcc.tmp.437, %rcc.tmp.438
  store i32 %rcc.tmp.439, ptr %linear_load_factor
  %rcc.tmp.441 = load i32, ptr %chain_table_size
  %rcc.tmp.442 = call i32 @calculateAverageChainLength.([100 x i32]* %chain_lengths, i32 %rcc.tmp.441)
  store i32 %rcc.tmp.442, ptr %avg_chain_length
  %rcc.tmp.444 = load i32, ptr %successful_inserts
  call void @printlnInt.(i32 %rcc.tmp.444)
  %rcc.tmp.446 = load i32, ptr %chain_successful_inserts
  call void @printlnInt.(i32 %rcc.tmp.446)
  %rcc.tmp.448 = load i32, ptr %collision_count
  call void @printlnInt.(i32 %rcc.tmp.448)
  %rcc.tmp.450 = load i32, ptr %linear_lookup_success
  call void @printlnInt.(i32 %rcc.tmp.450)
  %rcc.tmp.452 = load i32, ptr %chain_lookup_success
  call void @printlnInt.(i32 %rcc.tmp.452)
  %rcc.tmp.454 = load i32, ptr %linear_load_factor
  call void @printlnInt.(i32 %rcc.tmp.454)
  %rcc.tmp.456 = load i32, ptr %avg_chain_length
  call void @printlnInt.(i32 %rcc.tmp.456)
  %rcc.tmp.458 = load i32, ptr %rehash_count
  call void @printlnInt.(i32 %rcc.tmp.458)
  call void @printlnInt.(i32 26012)
  ret void
}
define i1 @insertLinearProbing.([500 x i32]* %table.tmp, [500 x i32]* %values.tmp, i32 %table_size.tmp, i32 %key.tmp, i32 %value.tmp, i32* %collision_count.tmp, i32 %entry_count.tmp) {
entry:
  %table..tmp = alloca [500 x i32]* 
  %values..tmp = alloca [500 x i32]* 
  %table_size..tmp = alloca i32 
  %key..tmp = alloca i32 
  %value..tmp = alloca i32 
  %collision_count..tmp = alloca i32* 
  %entry_count..tmp = alloca i32 
  %hash_index = alloca i32 
  %probe_count = alloca i32 
  store [500 x i32]* %table.tmp, ptr %table..tmp
  store [500 x i32]* %values.tmp, ptr %values..tmp
  store i32 %table_size.tmp, ptr %table_size..tmp
  store i32 %key.tmp, ptr %key..tmp
  store i32 %value.tmp, ptr %value..tmp
  store i32* %collision_count.tmp, ptr %collision_count..tmp
  store i32 %entry_count.tmp, ptr %entry_count..tmp
  %rcc.tmp.8 = load i32, ptr %key..tmp
  %rcc.tmp.9 = load i32, ptr %table_size..tmp
  %rcc.tmp.10 = srem i32 %rcc.tmp.8, %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %hash_index
  store i32 0, ptr %probe_count
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %probe_count
  %rcc.tmp.15 = load i32, ptr %table_size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %hash_index
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [500 x i32]*, ptr %table..tmp
  %rcc.tmp.22 = getelementptr [500 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = sub i32 0, 1
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %hash_index
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [500 x i32]*, ptr %table..tmp
  %rcc.tmp.30 = getelementptr [500 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %key..tmp
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %hash_index
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [500 x i32]*, ptr %values..tmp
  %rcc.tmp.36 = getelementptr [500 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  ret i1 1
if.else:
  %rcc.tmp.40 = load i32, ptr %hash_index
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [500 x i32]*, ptr %table..tmp
  %rcc.tmp.43 = getelementptr [500 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %key..tmp
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.48 = load i32, ptr %hash_index
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [500 x i32]*, ptr %values..tmp
  %rcc.tmp.51 = getelementptr [500 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  ret i1 1
if.else.2:
  %rcc.tmp.55 = load i32*, ptr %collision_count..tmp
  %rcc.tmp.56 = load i32*, ptr %collision_count..tmp
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %rcc.tmp.55
  %rcc.tmp.60 = load i32, ptr %hash_index
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  %rcc.tmp.62 = load i32, ptr %table_size..tmp
  %rcc.tmp.63 = srem i32 %rcc.tmp.61, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %hash_index
  %rcc.tmp.65 = load i32, ptr %probe_count
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %probe_count
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  ret i1 0
}
define i32 @lookupLinearProbing.([500 x i32]* %table.tmp, i32 %table_size.tmp, i32 %key.tmp) {
entry:
  %table..tmp = alloca [500 x i32]* 
  %table_size..tmp = alloca i32 
  %key..tmp = alloca i32 
  %hash_index = alloca i32 
  %probe_count = alloca i32 
  store [500 x i32]* %table.tmp, ptr %table..tmp
  store i32 %table_size.tmp, ptr %table_size..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.4 = load i32, ptr %key..tmp
  %rcc.tmp.5 = load i32, ptr %table_size..tmp
  %rcc.tmp.6 = srem i32 %rcc.tmp.4, %rcc.tmp.5
  store i32 %rcc.tmp.6, ptr %hash_index
  store i32 0, ptr %probe_count
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %probe_count
  %rcc.tmp.11 = load i32, ptr %table_size..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %hash_index
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [500 x i32]*, ptr %table..tmp
  %rcc.tmp.18 = getelementptr [500 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %key..tmp
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load i32, ptr %hash_index
  ret i32 %rcc.tmp.23
if.else:
  %rcc.tmp.25 = load i32, ptr %hash_index
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [500 x i32]*, ptr %table..tmp
  %rcc.tmp.28 = getelementptr [500 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = sub i32 0, 1
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.33 = sub i32 0, 1
  ret i32 %rcc.tmp.33
if.else.2:
  %rcc.tmp.35 = load i32, ptr %hash_index
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load i32, ptr %table_size..tmp
  %rcc.tmp.38 = srem i32 %rcc.tmp.36, %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %hash_index
  %rcc.tmp.40 = load i32, ptr %probe_count
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %probe_count
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  %rcc.tmp.46 = sub i32 0, 1
  ret i32 %rcc.tmp.46
}
define i32 @lookupChaining.([100 x [8 x i32]]* %table.tmp, [100 x i32]* %lengths.tmp, i32 %table_size.tmp, i32 %key.tmp) {
entry:
  %table..tmp = alloca [100 x [8 x i32]]* 
  %lengths..tmp = alloca [100 x i32]* 
  %table_size..tmp = alloca i32 
  %key..tmp = alloca i32 
  %hash_index = alloca i32 
  %i = alloca i32 
  store [100 x [8 x i32]]* %table.tmp, ptr %table..tmp
  store [100 x i32]* %lengths.tmp, ptr %lengths..tmp
  store i32 %table_size.tmp, ptr %table_size..tmp
  store i32 %key.tmp, ptr %key..tmp
  %rcc.tmp.5 = load i32, ptr %key..tmp
  %rcc.tmp.6 = load i32, ptr %table_size..tmp
  %rcc.tmp.7 = srem i32 %rcc.tmp.5, %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %hash_index
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load i32, ptr %hash_index
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x i32]*, ptr %lengths..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 8
  br label %sc.merge
sc.merge:
  %rcc.tmp.22 = phi i1 [0, %while.cond], [%rcc.tmp.20, %and.rhs]
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %hash_index
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [100 x [8 x i32]]*, ptr %table..tmp
  %rcc.tmp.28 = getelementptr [100 x [8 x i32]], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [8 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %key..tmp
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %i
  ret i32 %rcc.tmp.36
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.43 = sub i32 0, 1
  ret i32 %rcc.tmp.43
}
define i32 @calculateAverageChainLength.([100 x i32]* %lengths.tmp, i32 %table_size.tmp) {
entry:
  %lengths..tmp = alloca [100 x i32]* 
  %table_size..tmp = alloca i32 
  %total_length = alloca i32 
  %non_empty_chains = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %lengths.tmp, ptr %lengths..tmp
  store i32 %table_size.tmp, ptr %table_size..tmp
  store i32 0, ptr %total_length
  store i32 0, ptr %non_empty_chains
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %table_size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x i32]*, ptr %lengths..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp sgt i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %total_length
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [100 x i32]*, ptr %lengths..tmp
  %rcc.tmp.23 = getelementptr [100 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.19, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %total_length
  %rcc.tmp.27 = load i32, ptr %non_empty_chains
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %non_empty_chains
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.36 = load i32, ptr %non_empty_chains
  %rcc.tmp.37 = icmp sgt i32 %rcc.tmp.36, 0
  br i1 %rcc.tmp.37, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.39 = load i32, ptr %total_length
  %rcc.tmp.40 = load i32, ptr %non_empty_chains
  %rcc.tmp.41 = sdiv i32 %rcc.tmp.39, %rcc.tmp.40
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.44 = phi i32 [%rcc.tmp.41, %if.then.2], [0, %if.else.2]
  ret i32 %rcc.tmp.44
}
