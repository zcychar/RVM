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
  %node_count = alloca i32 
  %nodes = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %node_states = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %node_terms = alloca [100 x i32] 
  %fill.idx.3 = alloca i32 
  %node_votes = alloca [100 x i32] 
  %fill.idx.4 = alloca i32 
  %node_logs = alloca [100 x [50 x i32]] 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %node_log_sizes = alloca [100 x i32] 
  %fill.idx.7 = alloca i32 
  %node_commit_indices = alloca [100 x i32] 
  %fill.idx.8 = alloca i32 
  %node_last_applied = alloca [100 x i32] 
  %fill.idx.9 = alloca i32 
  %node_next_indices = alloca [100 x [100 x i32]] 
  %fill.idx.10 = alloca i32 
  %fill.idx.11 = alloca i32 
  %node_match_indices = alloca [100 x [100 x i32]] 
  %fill.idx.12 = alloca i32 
  %fill.idx.13 = alloca i32 
  %message_queue = alloca [1000 x [10 x i32]] 
  %fill.idx.14 = alloca i32 
  %queue_head = alloca i32 
  %queue_tail = alloca i32 
  %network_partition = alloca [100 x i1] 
  %fill.idx.15 = alloca i32 
  %message_delays = alloca [1000 x i32] 
  %fill.idx.16 = alloca i32 
  %consensus_rounds = alloca i32 
  %total_messages = alloca i32 
  %leader_changes = alloca i32 
  %failed_elections = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %max_rounds = alloca i32 
  %round = alloca i32 
  %messages_processed = alloca i32 
  %leader_id = alloca i32 
  %new_entry = alloca i32 
  %consistency_score = alloca i32 
  %final_leader = alloca i32 
  %total_committed = alloca i32 
  %network_efficiency = alloca i32 
  %system_hash = alloca i32 
  call void @printlnInt.(i32 42)
  store i32 100, ptr %node_count
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [100 x i32], ptr %nodes, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 100
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %node_states, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 100
  br i1 %rcc.tmp.28, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = getelementptr [100 x i32], ptr %node_terms, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.38 = load i32, ptr %fill.idx.4
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 100
  br i1 %rcc.tmp.39, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.41 = load i32, ptr %fill.idx.4
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %node_votes, i32 0, i32 %rcc.tmp.41
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.44, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.49 = load i32, ptr %fill.idx.5
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 100
  br i1 %rcc.tmp.50, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.52 = load i32, ptr %fill.idx.5
  %rcc.tmp.53 = getelementptr [100 x [50 x i32]], ptr %node_logs, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.56 = load i32, ptr %fill.idx.6
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.56, 50
  br i1 %rcc.tmp.57, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.59 = load i32, ptr %fill.idx.6
  %rcc.tmp.60 = getelementptr [50 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.59
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.62, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.65 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.65, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.70 = load i32, ptr %fill.idx.7
  %rcc.tmp.71 = icmp slt i32 %rcc.tmp.70, 100
  br i1 %rcc.tmp.71, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.73 = load i32, ptr %fill.idx.7
  %rcc.tmp.74 = getelementptr [100 x i32], ptr %node_log_sizes, i32 0, i32 %rcc.tmp.73
  store i32 0, ptr %rcc.tmp.74
  %rcc.tmp.76 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.76, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.81 = load i32, ptr %fill.idx.8
  %rcc.tmp.82 = icmp slt i32 %rcc.tmp.81, 100
  br i1 %rcc.tmp.82, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.84 = load i32, ptr %fill.idx.8
  %rcc.tmp.85 = getelementptr [100 x i32], ptr %node_commit_indices, i32 0, i32 %rcc.tmp.84
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.87, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.92 = load i32, ptr %fill.idx.9
  %rcc.tmp.93 = icmp slt i32 %rcc.tmp.92, 100
  br i1 %rcc.tmp.93, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.95 = load i32, ptr %fill.idx.9
  %rcc.tmp.96 = getelementptr [100 x i32], ptr %node_last_applied, i32 0, i32 %rcc.tmp.95
  store i32 0, ptr %rcc.tmp.96
  %rcc.tmp.98 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.98, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.103 = load i32, ptr %fill.idx.10
  %rcc.tmp.104 = icmp slt i32 %rcc.tmp.103, 100
  br i1 %rcc.tmp.104, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.106 = load i32, ptr %fill.idx.10
  %rcc.tmp.107 = getelementptr [100 x [100 x i32]], ptr %node_next_indices, i32 0, i32 %rcc.tmp.106
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.110 = load i32, ptr %fill.idx.11
  %rcc.tmp.111 = icmp slt i32 %rcc.tmp.110, 100
  br i1 %rcc.tmp.111, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.113 = load i32, ptr %fill.idx.11
  %rcc.tmp.114 = getelementptr [100 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.113
  store i32 0, ptr %rcc.tmp.114
  %rcc.tmp.116 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.116, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  %rcc.tmp.119 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.119, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.124 = load i32, ptr %fill.idx.12
  %rcc.tmp.125 = icmp slt i32 %rcc.tmp.124, 100
  br i1 %rcc.tmp.125, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.127 = load i32, ptr %fill.idx.12
  %rcc.tmp.128 = getelementptr [100 x [100 x i32]], ptr %node_match_indices, i32 0, i32 %rcc.tmp.127
  store i32 0, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.cond.13:
  %rcc.tmp.131 = load i32, ptr %fill.idx.13
  %rcc.tmp.132 = icmp slt i32 %rcc.tmp.131, 100
  br i1 %rcc.tmp.132, label %array.fill.body.13, label %array.fill.end.13
array.fill.body.13:
  %rcc.tmp.134 = load i32, ptr %fill.idx.13
  %rcc.tmp.135 = getelementptr [100 x i32], ptr %rcc.tmp.128, i32 0, i32 %rcc.tmp.134
  store i32 0, ptr %rcc.tmp.135
  %rcc.tmp.137 = add i32 %rcc.tmp.134, 1
  store i32 %rcc.tmp.137, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.end.13:
  %rcc.tmp.140 = add i32 %rcc.tmp.127, 1
  store i32 %rcc.tmp.140, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  store i32 0, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.cond.14:
  %rcc.tmp.145 = load i32, ptr %fill.idx.14
  %rcc.tmp.146 = icmp slt i32 %rcc.tmp.145, 1000
  br i1 %rcc.tmp.146, label %array.fill.body.14, label %array.fill.end.14
array.fill.body.14:
  %rcc.tmp.148 = load i32, ptr %fill.idx.14
  %rcc.tmp.149 = getelementptr [1000 x [10 x i32]], ptr %message_queue, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.150 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.150
  %rcc.tmp.152 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.152
  %rcc.tmp.154 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.154
  %rcc.tmp.156 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.156
  %rcc.tmp.158 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.158
  %rcc.tmp.160 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.160
  %rcc.tmp.162 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.162
  %rcc.tmp.164 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.164
  %rcc.tmp.166 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.166
  %rcc.tmp.168 = getelementptr [10 x i32], ptr %rcc.tmp.149, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.168
  %rcc.tmp.170 = add i32 %rcc.tmp.148, 1
  store i32 %rcc.tmp.170, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.end.14:
  store i32 0, ptr %queue_head
  store i32 0, ptr %queue_tail
  store i32 0, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.cond.15:
  %rcc.tmp.177 = load i32, ptr %fill.idx.15
  %rcc.tmp.178 = icmp slt i32 %rcc.tmp.177, 100
  br i1 %rcc.tmp.178, label %array.fill.body.15, label %array.fill.end.15
array.fill.body.15:
  %rcc.tmp.180 = load i32, ptr %fill.idx.15
  %rcc.tmp.181 = getelementptr [100 x i1], ptr %network_partition, i32 0, i32 %rcc.tmp.180
  store i1 0, ptr %rcc.tmp.181
  %rcc.tmp.183 = add i32 %rcc.tmp.180, 1
  store i32 %rcc.tmp.183, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.end.15:
  store i32 0, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.cond.16:
  %rcc.tmp.188 = load i32, ptr %fill.idx.16
  %rcc.tmp.189 = icmp slt i32 %rcc.tmp.188, 1000
  br i1 %rcc.tmp.189, label %array.fill.body.16, label %array.fill.end.16
array.fill.body.16:
  %rcc.tmp.191 = load i32, ptr %fill.idx.16
  %rcc.tmp.192 = getelementptr [1000 x i32], ptr %message_delays, i32 0, i32 %rcc.tmp.191
  store i32 0, ptr %rcc.tmp.192
  %rcc.tmp.194 = add i32 %rcc.tmp.191, 1
  store i32 %rcc.tmp.194, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.end.16:
  store i32 0, ptr %consensus_rounds
  store i32 0, ptr %total_messages
  store i32 0, ptr %leader_changes
  store i32 0, ptr %failed_elections
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.203 = load i32, ptr %i
  %rcc.tmp.204 = load i32, ptr %node_count
  %rcc.tmp.205 = icmp slt i32 %rcc.tmp.203, %rcc.tmp.204
  br i1 %rcc.tmp.205, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.208 = load i32, ptr %i
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 0
  %rcc.tmp.210 = getelementptr [100 x i32], ptr %nodes, i32 0, i32 %rcc.tmp.209
  %rcc.tmp.211 = load i32, ptr %i
  %rcc.tmp.212 = mul i32 %rcc.tmp.211, 17
  %rcc.tmp.213 = add i32 %rcc.tmp.212, 23
  store i32 %rcc.tmp.213, ptr %rcc.tmp.210
  %rcc.tmp.215 = load i32, ptr %i
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 0
  %rcc.tmp.217 = getelementptr [100 x i32], ptr %node_states, i32 0, i32 %rcc.tmp.216
  store i32 0, ptr %rcc.tmp.217
  %rcc.tmp.219 = load i32, ptr %i
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 0
  %rcc.tmp.221 = getelementptr [100 x i32], ptr %node_terms, i32 0, i32 %rcc.tmp.220
  store i32 0, ptr %rcc.tmp.221
  %rcc.tmp.223 = load i32, ptr %i
  %rcc.tmp.224 = add i32 %rcc.tmp.223, 0
  %rcc.tmp.225 = getelementptr [100 x i32], ptr %node_votes, i32 0, i32 %rcc.tmp.224
  %rcc.tmp.226 = sub i32 0, 1
  store i32 %rcc.tmp.226, ptr %rcc.tmp.225
  %rcc.tmp.228 = load i32, ptr %i
  %rcc.tmp.229 = add i32 %rcc.tmp.228, 0
  %rcc.tmp.230 = getelementptr [100 x i32], ptr %node_log_sizes, i32 0, i32 %rcc.tmp.229
  store i32 1, ptr %rcc.tmp.230
  %rcc.tmp.232 = load i32, ptr %i
  %rcc.tmp.233 = add i32 %rcc.tmp.232, 0
  %rcc.tmp.234 = getelementptr [100 x [50 x i32]], ptr %node_logs, i32 0, i32 %rcc.tmp.233
  %rcc.tmp.235 = getelementptr [50 x i32], ptr %rcc.tmp.234, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.235
  %rcc.tmp.237 = load i32, ptr %i
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = getelementptr [100 x i32], ptr %node_commit_indices, i32 0, i32 %rcc.tmp.238
  store i32 0, ptr %rcc.tmp.239
  %rcc.tmp.241 = load i32, ptr %i
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 0
  %rcc.tmp.243 = getelementptr [100 x i32], ptr %node_last_applied, i32 0, i32 %rcc.tmp.242
  store i32 0, ptr %rcc.tmp.243
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.247 = load i32, ptr %j
  %rcc.tmp.248 = load i32, ptr %node_count
  %rcc.tmp.249 = icmp slt i32 %rcc.tmp.247, %rcc.tmp.248
  br i1 %rcc.tmp.249, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.252 = load i32, ptr %i
  %rcc.tmp.253 = add i32 %rcc.tmp.252, 0
  %rcc.tmp.254 = getelementptr [100 x [100 x i32]], ptr %node_next_indices, i32 0, i32 %rcc.tmp.253
  %rcc.tmp.255 = load i32, ptr %j
  %rcc.tmp.256 = add i32 %rcc.tmp.255, 0
  %rcc.tmp.257 = getelementptr [100 x i32], ptr %rcc.tmp.254, i32 0, i32 %rcc.tmp.256
  store i32 1, ptr %rcc.tmp.257
  %rcc.tmp.259 = load i32, ptr %i
  %rcc.tmp.260 = add i32 %rcc.tmp.259, 0
  %rcc.tmp.261 = getelementptr [100 x [100 x i32]], ptr %node_match_indices, i32 0, i32 %rcc.tmp.260
  %rcc.tmp.262 = load i32, ptr %j
  %rcc.tmp.263 = add i32 %rcc.tmp.262, 0
  %rcc.tmp.264 = getelementptr [100 x i32], ptr %rcc.tmp.261, i32 0, i32 %rcc.tmp.263
  store i32 0, ptr %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %j
  %rcc.tmp.267 = add i32 %rcc.tmp.266, 1
  store i32 %rcc.tmp.267, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.270 = load i32, ptr %i
  %rcc.tmp.271 = add i32 %rcc.tmp.270, 1
  store i32 %rcc.tmp.271, ptr %i
  br label %while.cond
while.end:
  store i32 1000, ptr %max_rounds
  store i32 0, ptr %round
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.277 = load i32, ptr %round
  %rcc.tmp.278 = load i32, ptr %max_rounds
  %rcc.tmp.279 = icmp slt i32 %rcc.tmp.277, %rcc.tmp.278
  br i1 %rcc.tmp.279, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.282 = load i32, ptr %round
  %rcc.tmp.283 = load i32, ptr %node_count
  call void @simulate_network_conditions.([100 x i1]* %network_partition, i32 %rcc.tmp.282, i32 %rcc.tmp.283)
  %rcc.tmp.285 = load i32, ptr %node_count
  %rcc.tmp.286 = load i32, ptr %round
  call void @process_timeouts.([100 x i32]* %node_states, [100 x i32]* %node_terms, [100 x i32]* %node_votes, [1000 x [10 x i32]]* %message_queue, i32* %queue_tail, i32 %rcc.tmp.285, i32 %rcc.tmp.286)
  %rcc.tmp.288 = load i32, ptr %node_count
  %rcc.tmp.289 = call i32 @process_message_queue.([1000 x [10 x i32]]* %message_queue, i32* %queue_head, i32* %queue_tail, [100 x i32]* %node_states, [100 x i32]* %node_terms, [100 x i32]* %node_votes, [100 x [50 x i32]]* %node_logs, [100 x i32]* %node_log_sizes, [100 x i32]* %node_commit_indices, [100 x [100 x i32]]* %node_next_indices, [100 x [100 x i32]]* %node_match_indices, [100 x i1]* %network_partition, i32 %rcc.tmp.288)
  store i32 %rcc.tmp.289, ptr %messages_processed
  %rcc.tmp.291 = load i32, ptr %total_messages
  %rcc.tmp.292 = load i32, ptr %messages_processed
  %rcc.tmp.293 = add i32 %rcc.tmp.291, %rcc.tmp.292
  store i32 %rcc.tmp.293, ptr %total_messages
  %rcc.tmp.295 = load i32, ptr %node_count
  %rcc.tmp.296 = call i32 @check_leader_election.([100 x i32]* %node_states, [100 x i32]* %node_terms, i32 %rcc.tmp.295)
  store i32 %rcc.tmp.296, ptr %leader_id
  %rcc.tmp.298 = load i32, ptr %leader_id
  %rcc.tmp.299 = icmp sge i32 %rcc.tmp.298, 0
  br i1 %rcc.tmp.299, label %if.then, label %if.else
if.then:
  %rcc.tmp.301 = load i32, ptr %leader_id
  %rcc.tmp.302 = load i32, ptr %node_count
  %rcc.tmp.303 = load i32, ptr %round
  call void @simulate_log_replication.(i32 %rcc.tmp.301, [100 x [50 x i32]]* %node_logs, [100 x i32]* %node_log_sizes, [100 x i32]* %node_commit_indices, [100 x [100 x i32]]* %node_next_indices, [100 x [100 x i32]]* %node_match_indices, [1000 x [10 x i32]]* %message_queue, i32* %queue_tail, [100 x i1]* %network_partition, i32 %rcc.tmp.302, i32 %rcc.tmp.303)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.307 = load i32, ptr %leader_id
  %rcc.tmp.308 = icmp sge i32 %rcc.tmp.307, 0
  br i1 %rcc.tmp.308, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.310 = load i32, ptr %round
  %rcc.tmp.311 = srem i32 %rcc.tmp.310, 10
  %rcc.tmp.312 = icmp eq i32 %rcc.tmp.311, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.314 = phi i1 [0, %if.merge], [%rcc.tmp.312, %and.rhs]
  br i1 %rcc.tmp.314, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.316 = load i32, ptr %round
  %rcc.tmp.317 = sdiv i32 %rcc.tmp.316, 10
  %rcc.tmp.318 = add i32 %rcc.tmp.317, 1000
  store i32 %rcc.tmp.318, ptr %new_entry
  %rcc.tmp.320 = load i32, ptr %leader_id
  %rcc.tmp.321 = load i32, ptr %new_entry
  call void @append_log_entry.(i32 %rcc.tmp.320, i32 %rcc.tmp.321, [100 x [50 x i32]]* %node_logs, [100 x i32]* %node_log_sizes)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.325 = load i32, ptr %node_count
  %rcc.tmp.326 = call i32 @verify_system_consistency.([100 x i32]* %node_states, [100 x i32]* %node_terms, [100 x [50 x i32]]* %node_logs, [100 x i32]* %node_log_sizes, [100 x i32]* %node_commit_indices, i32 %rcc.tmp.325)
  store i32 %rcc.tmp.326, ptr %consistency_score
  %rcc.tmp.328 = load i32, ptr %consistency_score
  %rcc.tmp.329 = icmp slt i32 %rcc.tmp.328, 80
  br i1 %rcc.tmp.329, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.331 = load i32, ptr %round
  %rcc.tmp.332 = icmp sgt i32 %rcc.tmp.331, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.334 = phi i1 [0, %if.merge.2], [%rcc.tmp.332, %and.rhs.2]
  br i1 %rcc.tmp.334, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.336 = load i32, ptr %node_count
  call void @trigger_recovery_protocol.([100 x i32]* %node_states, [100 x i32]* %node_terms, [100 x i32]* %node_votes, i32 %rcc.tmp.336)
  %rcc.tmp.338 = load i32, ptr %failed_elections
  %rcc.tmp.339 = add i32 %rcc.tmp.338, 1
  store i32 %rcc.tmp.339, ptr %failed_elections
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.343 = load i32, ptr %round
  %rcc.tmp.344 = srem i32 %rcc.tmp.343, 50
  %rcc.tmp.345 = icmp eq i32 %rcc.tmp.344, 0
  br i1 %rcc.tmp.345, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.347 = load i32, ptr %node_count
  %rcc.tmp.348 = load i32, ptr %round
  call void @simulate_byzantine_failures.([100 x i32]* %node_states, [100 x i1]* %network_partition, i32 %rcc.tmp.347, i32 %rcc.tmp.348)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.352 = load i32, ptr %round
  %rcc.tmp.353 = srem i32 %rcc.tmp.352, 100
  %rcc.tmp.354 = icmp eq i32 %rcc.tmp.353, 0
  br i1 %rcc.tmp.354, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.356 = load i32, ptr %node_count
  call void @compact_logs.([100 x [50 x i32]]* %node_logs, [100 x i32]* %node_log_sizes, [100 x i32]* %node_commit_indices, i32 %rcc.tmp.356)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.360 = load i32, ptr %round
  %rcc.tmp.361 = add i32 %rcc.tmp.360, 1
  store i32 %rcc.tmp.361, ptr %round
  %rcc.tmp.363 = load i32, ptr %round
  %rcc.tmp.364 = srem i32 %rcc.tmp.363, 100
  %rcc.tmp.365 = icmp eq i32 %rcc.tmp.364, 0
  br i1 %rcc.tmp.365, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.367 = load i32, ptr %consensus_rounds
  %rcc.tmp.368 = add i32 %rcc.tmp.367, 1
  store i32 %rcc.tmp.368, ptr %consensus_rounds
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %while.cond.3
while.end.3:
  %rcc.tmp.373 = load i32, ptr %node_count
  %rcc.tmp.374 = call i32 @find_stable_leader.([100 x i32]* %node_states, [100 x i32]* %node_terms, i32 %rcc.tmp.373)
  store i32 %rcc.tmp.374, ptr %final_leader
  %rcc.tmp.376 = load i32, ptr %node_count
  %rcc.tmp.377 = call i32 @count_total_committed_entries.([100 x i32]* %node_commit_indices, i32 %rcc.tmp.376)
  store i32 %rcc.tmp.377, ptr %total_committed
  %rcc.tmp.379 = load i32, ptr %total_messages
  %rcc.tmp.380 = load i32, ptr %consensus_rounds
  %rcc.tmp.381 = call i32 @calculate_network_efficiency.(i32 %rcc.tmp.379, i32 %rcc.tmp.380)
  store i32 %rcc.tmp.381, ptr %network_efficiency
  %rcc.tmp.383 = load i32, ptr %node_count
  %rcc.tmp.384 = call i32 @compute_system_state_hash.([100 x [50 x i32]]* %node_logs, [100 x i32]* %node_log_sizes, [100 x i32]* %node_commit_indices, i32 %rcc.tmp.383)
  store i32 %rcc.tmp.384, ptr %system_hash
  %rcc.tmp.386 = load i32, ptr %final_leader
  call void @printlnInt.(i32 %rcc.tmp.386)
  %rcc.tmp.388 = load i32, ptr %total_committed
  call void @printlnInt.(i32 %rcc.tmp.388)
  %rcc.tmp.390 = load i32, ptr %network_efficiency
  call void @printlnInt.(i32 %rcc.tmp.390)
  %rcc.tmp.392 = load i32, ptr %system_hash
  call void @printlnInt.(i32 %rcc.tmp.392)
  %rcc.tmp.394 = load i32, ptr %leader_changes
  call void @printlnInt.(i32 %rcc.tmp.394)
  %rcc.tmp.396 = load i32, ptr %failed_elections
  call void @printlnInt.(i32 %rcc.tmp.396)
  %rcc.tmp.398 = load i32, ptr %total_messages
  call void @printlnInt.(i32 %rcc.tmp.398)
  %rcc.tmp.400 = load i32, ptr %consensus_rounds
  call void @printlnInt.(i32 %rcc.tmp.400)
  call void @exit.(i32 0)
  ret void
}
define void @simulate_network_conditions.([100 x i1]* %partition.tmp, i32 %round.tmp, i32 %node_count.tmp) {
entry:
  %partition..tmp = alloca [100 x i1]* 
  %round..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %i = alloca i32 
  %i.2 = alloca i32 
  %i.3 = alloca i32 
  store [100 x i1]* %partition.tmp, ptr %partition..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.4 = load i32, ptr %round..tmp
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 200
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %node_count..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.18 = getelementptr [100 x i1], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = mul i32 %rcc.tmp.19, 7
  %rcc.tmp.21 = load i32, ptr %round..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 3
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 0
  store i1 %rcc.tmp.24, ptr %rcc.tmp.18
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  br label %if.merge
if.else:
  %rcc.tmp.31 = load i32, ptr %round..tmp
  %rcc.tmp.32 = srem i32 %rcc.tmp.31, 200
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.32, 150
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %i.2
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.37 = load i32, ptr %i.2
  %rcc.tmp.38 = load i32, ptr %node_count..tmp
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.42 = load i32, ptr %i.2
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.45 = getelementptr [100 x i1], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  store i1 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %i.2
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %i.2
  br label %while.cond.2
while.end.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.52 = load i32, ptr %round..tmp
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 80
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.53, 0
  br i1 %rcc.tmp.54, label %if.then.3, label %if.else.3
if.then.3:
  store i32 0, ptr %i.3
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.58 = load i32, ptr %i.3
  %rcc.tmp.59 = load i32, ptr %node_count..tmp
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.63 = load i32, ptr %i.3
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.66 = getelementptr [100 x i1], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %i.3
  %rcc.tmp.68 = mul i32 %rcc.tmp.67, 13
  %rcc.tmp.69 = load i32, ptr %round..tmp
  %rcc.tmp.70 = mul i32 %rcc.tmp.69, 7
  %rcc.tmp.71 = add i32 %rcc.tmp.68, %rcc.tmp.70
  %rcc.tmp.72 = srem i32 %rcc.tmp.71, 17
  %rcc.tmp.73 = icmp eq i32 %rcc.tmp.72, 0
  store i1 %rcc.tmp.73, ptr %rcc.tmp.66
  %rcc.tmp.75 = load i32, ptr %i.3
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %i.3
  br label %while.cond.3
while.end.3:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret void
}
define void @process_timeouts.([100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x i32]* %votes.tmp, [1000 x [10 x i32]]* %queue.tmp, i32* %tail.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %votes..tmp = alloca [100 x i32]* 
  %queue..tmp = alloca [1000 x [10 x i32]]* 
  %tail..tmp = alloca i32* 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %i = alloca i32 
  %timeout_trigger = alloca i1 
  %j = alloca i32 
  %j.2 = alloca i32 
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x i32]* %votes.tmp, ptr %votes..tmp
  store [1000 x [10 x i32]]* %queue.tmp, ptr %queue..tmp
  store i32* %tail.tmp, ptr %tail..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %node_count..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = mul i32 %rcc.tmp.15, 23
  %rcc.tmp.17 = load i32, ptr %round..tmp
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 7
  %rcc.tmp.19 = add i32 %rcc.tmp.16, %rcc.tmp.18
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 47
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.20, 0
  store i1 %rcc.tmp.21, ptr %timeout_trigger
  %rcc.tmp.23 = load i1, ptr %timeout_trigger
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.28 = getelementptr [100 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, 0
  br i1 %rcc.tmp.30, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.36, 1
  br label %sc.merge
sc.merge:
  %rcc.tmp.39 = phi i1 [1, %if.then], [%rcc.tmp.37, %or.rhs]
  br i1 %rcc.tmp.39, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.44 = getelementptr [100 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  store i32 1, ptr %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.49 = getelementptr [100 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %rcc.tmp.49
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.60 = getelementptr [100 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %i
  store i32 %rcc.tmp.61, ptr %rcc.tmp.60
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = load i32, ptr %node_count..tmp
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.66
  br i1 %rcc.tmp.67, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = icmp ne i32 %rcc.tmp.70, %rcc.tmp.71
  br i1 %rcc.tmp.72, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.74 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.75 = load i32*, ptr %tail..tmp
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.81 = getelementptr [100 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  call void @enqueue_message.([1000 x [10 x i32]]* %rcc.tmp.74, i32* %rcc.tmp.75, i32 %rcc.tmp.76, i32 %rcc.tmp.77, i32 1, i32 %rcc.tmp.82, i32 0, i32 0, i32 0)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.86 = load i32, ptr %j
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.94 = getelementptr [100 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.94
  %rcc.tmp.96 = icmp eq i32 %rcc.tmp.95, 2
  br i1 %rcc.tmp.96, label %if.then.4, label %if.else.4
if.then.4:
  store i32 0, ptr %j.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.100 = load i32, ptr %j.2
  %rcc.tmp.101 = load i32, ptr %node_count..tmp
  %rcc.tmp.102 = icmp slt i32 %rcc.tmp.100, %rcc.tmp.101
  br i1 %rcc.tmp.102, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.105 = load i32, ptr %j.2
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = icmp ne i32 %rcc.tmp.105, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.109 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.110 = load i32*, ptr %tail..tmp
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = load i32, ptr %j.2
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.116 = getelementptr [100 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  call void @enqueue_message.([1000 x [10 x i32]]* %rcc.tmp.109, i32* %rcc.tmp.110, i32 %rcc.tmp.111, i32 %rcc.tmp.112, i32 2, i32 %rcc.tmp.117, i32 0, i32 0, i32 0)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.121 = load i32, ptr %j.2
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.122, ptr %j.2
  br label %while.cond.3
while.end.3:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @process_message_queue.([1000 x [10 x i32]]* %queue.tmp, i32* %head.tmp, i32* %tail.tmp, [100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x i32]* %votes.tmp, [100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp, [100 x i32]* %commit_indices.tmp, [100 x [100 x i32]]* %next_indices.tmp, [100 x [100 x i32]]* %match_indices.tmp, [100 x i1]* %partition.tmp, i32 %node_count.tmp) {
entry:
  %queue..tmp = alloca [1000 x [10 x i32]]* 
  %head..tmp = alloca i32* 
  %tail..tmp = alloca i32* 
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %votes..tmp = alloca [100 x i32]* 
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  %commit_indices..tmp = alloca [100 x i32]* 
  %next_indices..tmp = alloca [100 x [100 x i32]]* 
  %match_indices..tmp = alloca [100 x [100 x i32]]* 
  %partition..tmp = alloca [100 x i1]* 
  %node_count..tmp = alloca i32 
  %processed = alloca i32 
  %max_process = alloca i32 
  %sender = alloca i32 
  %receiver = alloca i32 
  %msg_type = alloca i32 
  %msg_term = alloca i32 
  %data1 = alloca i32 
  %data2 = alloca i32 
  %data3 = alloca i32 
  %delivered = alloca i1 
  store [1000 x [10 x i32]]* %queue.tmp, ptr %queue..tmp
  store i32* %head.tmp, ptr %head..tmp
  store i32* %tail.tmp, ptr %tail..tmp
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x i32]* %votes.tmp, ptr %votes..tmp
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  store [100 x [100 x i32]]* %next_indices.tmp, ptr %next_indices..tmp
  store [100 x [100 x i32]]* %match_indices.tmp, ptr %match_indices..tmp
  store [100 x i1]* %partition.tmp, ptr %partition..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %processed
  store i32 100, ptr %max_process
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32*, ptr %head..tmp
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32*, ptr %tail..tmp
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp ne i32 %rcc.tmp.18, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %processed
  %rcc.tmp.24 = load i32, ptr %max_process
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br label %sc.merge
sc.merge:
  %rcc.tmp.27 = phi i1 [0, %while.cond], [%rcc.tmp.25, %and.rhs]
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32*, ptr %head..tmp
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.34 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %rcc.tmp.34, i32 0, i32 0
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %sender
  %rcc.tmp.38 = load i32*, ptr %head..tmp
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.42 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %rcc.tmp.42, i32 0, i32 1
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %receiver
  %rcc.tmp.46 = load i32*, ptr %head..tmp
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.50 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = getelementptr [10 x i32], ptr %rcc.tmp.50, i32 0, i32 2
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %msg_type
  %rcc.tmp.54 = load i32*, ptr %head..tmp
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.58 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.59 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 3
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %msg_term
  %rcc.tmp.62 = load i32*, ptr %head..tmp
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.66 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = getelementptr [10 x i32], ptr %rcc.tmp.66, i32 0, i32 4
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %data1
  %rcc.tmp.70 = load i32*, ptr %head..tmp
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.74 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = getelementptr [10 x i32], ptr %rcc.tmp.74, i32 0, i32 5
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  store i32 %rcc.tmp.76, ptr %data2
  %rcc.tmp.78 = load i32*, ptr %head..tmp
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.82 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = getelementptr [10 x i32], ptr %rcc.tmp.82, i32 0, i32 6
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  store i32 %rcc.tmp.84, ptr %data3
  %rcc.tmp.86 = load i32, ptr %sender
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.89 = getelementptr [100 x i1], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i1, ptr %rcc.tmp.89
  %rcc.tmp.91 = xor i1 %rcc.tmp.90, true
  br i1 %rcc.tmp.91, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.93 = load i32, ptr %receiver
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.96 = getelementptr [100 x i1], ptr %rcc.tmp.95, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.97 = load i1, ptr %rcc.tmp.96
  %rcc.tmp.98 = xor i1 %rcc.tmp.97, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.100 = phi i1 [0, %while.body], [%rcc.tmp.98, %and.rhs.2]
  store i1 %rcc.tmp.100, ptr %delivered
  %rcc.tmp.102 = load i1, ptr %delivered
  br i1 %rcc.tmp.102, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.104 = load i32, ptr %sender
  %rcc.tmp.105 = icmp sge i32 %rcc.tmp.104, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.107 = phi i1 [0, %sc.merge.2], [%rcc.tmp.105, %and.rhs.3]
  br i1 %rcc.tmp.107, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.109 = load i32, ptr %sender
  %rcc.tmp.110 = load i32, ptr %node_count..tmp
  %rcc.tmp.111 = icmp slt i32 %rcc.tmp.109, %rcc.tmp.110
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.113 = phi i1 [0, %sc.merge.3], [%rcc.tmp.111, %and.rhs.4]
  br i1 %rcc.tmp.113, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.115 = load i32, ptr %receiver
  %rcc.tmp.116 = icmp sge i32 %rcc.tmp.115, 0
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.118 = phi i1 [0, %sc.merge.4], [%rcc.tmp.116, %and.rhs.5]
  br i1 %rcc.tmp.118, label %and.rhs.6, label %sc.merge.6
and.rhs.6:
  %rcc.tmp.120 = load i32, ptr %receiver
  %rcc.tmp.121 = load i32, ptr %node_count..tmp
  %rcc.tmp.122 = icmp slt i32 %rcc.tmp.120, %rcc.tmp.121
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.124 = phi i1 [0, %sc.merge.5], [%rcc.tmp.122, %and.rhs.6]
  br i1 %rcc.tmp.124, label %if.then, label %if.else
if.then:
  %rcc.tmp.126 = load i32, ptr %msg_type
  %rcc.tmp.127 = icmp eq i32 %rcc.tmp.126, 1
  br i1 %rcc.tmp.127, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.129 = load i32, ptr %sender
  %rcc.tmp.130 = load i32, ptr %receiver
  %rcc.tmp.131 = load i32, ptr %msg_term
  %rcc.tmp.132 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.133 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.134 = load [100 x i32]*, ptr %votes..tmp
  call void @handle_vote_request.(i32 %rcc.tmp.129, i32 %rcc.tmp.130, i32 %rcc.tmp.131, [100 x i32]* %rcc.tmp.132, [100 x i32]* %rcc.tmp.133, [100 x i32]* %rcc.tmp.134)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.137 = load i32, ptr %msg_type
  %rcc.tmp.138 = icmp eq i32 %rcc.tmp.137, 2
  br i1 %rcc.tmp.138, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.140 = load i32, ptr %sender
  %rcc.tmp.141 = load i32, ptr %receiver
  %rcc.tmp.142 = load i32, ptr %msg_term
  %rcc.tmp.143 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.144 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.145 = load [100 x i32]*, ptr %votes..tmp
  call void @handle_heartbeat.(i32 %rcc.tmp.140, i32 %rcc.tmp.141, i32 %rcc.tmp.142, [100 x i32]* %rcc.tmp.143, [100 x i32]* %rcc.tmp.144, [100 x i32]* %rcc.tmp.145)
  br label %if.merge.3
if.else.3:
  %rcc.tmp.148 = load i32, ptr %msg_type
  %rcc.tmp.149 = icmp eq i32 %rcc.tmp.148, 3
  br i1 %rcc.tmp.149, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.151 = load i32, ptr %sender
  %rcc.tmp.152 = load i32, ptr %receiver
  %rcc.tmp.153 = load i32, ptr %msg_term
  %rcc.tmp.154 = load i32, ptr %data1
  %rcc.tmp.155 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.156 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.157 = load i32, ptr %node_count..tmp
  call void @handle_vote_response.(i32 %rcc.tmp.151, i32 %rcc.tmp.152, i32 %rcc.tmp.153, i32 %rcc.tmp.154, [100 x i32]* %rcc.tmp.155, [100 x i32]* %rcc.tmp.156, i32 %rcc.tmp.157)
  br label %if.merge.4
if.else.4:
  %rcc.tmp.160 = load i32, ptr %msg_type
  %rcc.tmp.161 = icmp eq i32 %rcc.tmp.160, 4
  br i1 %rcc.tmp.161, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.163 = load i32, ptr %sender
  %rcc.tmp.164 = load i32, ptr %receiver
  %rcc.tmp.165 = load i32, ptr %msg_term
  %rcc.tmp.166 = load i32, ptr %data1
  %rcc.tmp.167 = load i32, ptr %data2
  %rcc.tmp.168 = load i32, ptr %data3
  %rcc.tmp.169 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.170 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.171 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.172 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.173 = load [100 x i32]*, ptr %commit_indices..tmp
  call void @handle_append_entries.(i32 %rcc.tmp.163, i32 %rcc.tmp.164, i32 %rcc.tmp.165, i32 %rcc.tmp.166, i32 %rcc.tmp.167, i32 %rcc.tmp.168, [100 x i32]* %rcc.tmp.169, [100 x i32]* %rcc.tmp.170, [100 x [50 x i32]]* %rcc.tmp.171, [100 x i32]* %rcc.tmp.172, [100 x i32]* %rcc.tmp.173)
  br label %if.merge.5
if.else.5:
  %rcc.tmp.176 = load i32, ptr %msg_type
  %rcc.tmp.177 = icmp eq i32 %rcc.tmp.176, 5
  br i1 %rcc.tmp.177, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.179 = load i32, ptr %sender
  %rcc.tmp.180 = load i32, ptr %receiver
  %rcc.tmp.181 = load i32, ptr %msg_term
  %rcc.tmp.182 = load i32, ptr %data1
  %rcc.tmp.183 = load i32, ptr %data2
  %rcc.tmp.184 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.185 = load [100 x [100 x i32]]*, ptr %next_indices..tmp
  %rcc.tmp.186 = load [100 x [100 x i32]]*, ptr %match_indices..tmp
  call void @handle_append_response.(i32 %rcc.tmp.179, i32 %rcc.tmp.180, i32 %rcc.tmp.181, i32 %rcc.tmp.182, i32 %rcc.tmp.183, [100 x i32]* %rcc.tmp.184, [100 x [100 x i32]]* %rcc.tmp.185, [100 x [100 x i32]]* %rcc.tmp.186)
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.196 = load i32*, ptr %head..tmp
  %rcc.tmp.197 = load i32*, ptr %head..tmp
  %rcc.tmp.198 = load i32, ptr %rcc.tmp.197
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 1
  %rcc.tmp.200 = srem i32 %rcc.tmp.199, 1000
  store i32 %rcc.tmp.200, ptr %rcc.tmp.196
  %rcc.tmp.202 = load i32, ptr %processed
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 1
  store i32 %rcc.tmp.203, ptr %processed
  br label %while.cond
while.end:
  %rcc.tmp.206 = load i32, ptr %processed
  ret i32 %rcc.tmp.206
}
define void @handle_vote_request.(i32 %sender.tmp, i32 %receiver.tmp, i32 %term.tmp, [100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x i32]* %votes.tmp) {
entry:
  %sender..tmp = alloca i32 
  %receiver..tmp = alloca i32 
  %term..tmp = alloca i32 
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %votes..tmp = alloca [100 x i32]* 
  store i32 %sender.tmp, ptr %sender..tmp
  store i32 %receiver.tmp, ptr %receiver..tmp
  store i32 %term.tmp, ptr %term..tmp
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x i32]* %votes.tmp, ptr %votes..tmp
  %rcc.tmp.7 = load i32, ptr %term..tmp
  %rcc.tmp.8 = load i32, ptr %receiver..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.11 = getelementptr [100 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = icmp sgt i32 %rcc.tmp.7, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load i32, ptr %receiver..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %term..tmp
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %receiver..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.24 = getelementptr [100 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %receiver..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.29 = getelementptr [100 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = sub i32 0, 1
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %term..tmp
  %rcc.tmp.35 = load i32, ptr %receiver..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.38 = getelementptr [100 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.34, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.42 = load i32, ptr %receiver..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = sub i32 0, 1
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.50 = load i32, ptr %receiver..tmp
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %sender..tmp
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.54, %rcc.tmp.55
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.58 = phi i1 [1, %and.rhs], [%rcc.tmp.56, %or.rhs]
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %if.merge], [%rcc.tmp.58, %sc.merge.2]
  br i1 %rcc.tmp.60, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.62 = load i32, ptr %receiver..tmp
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %sender..tmp
  store i32 %rcc.tmp.66, ptr %rcc.tmp.65
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @handle_heartbeat.(i32 %sender.tmp, i32 %receiver.tmp, i32 %term.tmp, [100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x i32]* %votes.tmp) {
entry:
  %sender..tmp = alloca i32 
  %receiver..tmp = alloca i32 
  %term..tmp = alloca i32 
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %votes..tmp = alloca [100 x i32]* 
  store i32 %sender.tmp, ptr %sender..tmp
  store i32 %receiver.tmp, ptr %receiver..tmp
  store i32 %term.tmp, ptr %term..tmp
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x i32]* %votes.tmp, ptr %votes..tmp
  %rcc.tmp.7 = load i32, ptr %term..tmp
  %rcc.tmp.8 = load i32, ptr %receiver..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.11 = getelementptr [100 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = icmp sge i32 %rcc.tmp.7, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load i32, ptr %receiver..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %term..tmp
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %receiver..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.24 = getelementptr [100 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %receiver..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.29 = getelementptr [100 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = sub i32 0, 1
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @handle_vote_response.(i32 %sender.tmp, i32 %receiver.tmp, i32 %term.tmp, i32 %granted.tmp, [100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, i32 %node_count.tmp) {
entry:
  %sender..tmp = alloca i32 
  %receiver..tmp = alloca i32 
  %term..tmp = alloca i32 
  %granted..tmp = alloca i32 
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %vote_threshold = alloca i32 
  store i32 %sender.tmp, ptr %sender..tmp
  store i32 %receiver.tmp, ptr %receiver..tmp
  store i32 %term.tmp, ptr %term..tmp
  store i32 %granted.tmp, ptr %granted..tmp
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.8 = load i32, ptr %receiver..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.11 = getelementptr [100 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 1
  br i1 %rcc.tmp.13, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.15 = load i32, ptr %term..tmp
  %rcc.tmp.16 = load i32, ptr %receiver..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.15, %rcc.tmp.20
  br label %sc.merge
sc.merge:
  %rcc.tmp.23 = phi i1 [0, %entry], [%rcc.tmp.21, %and.rhs]
  br i1 %rcc.tmp.23, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.25 = load i32, ptr %granted..tmp
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 1
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.28 = phi i1 [0, %sc.merge], [%rcc.tmp.26, %and.rhs.2]
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %node_count..tmp
  %rcc.tmp.31 = sdiv i32 %rcc.tmp.30, 2
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %vote_threshold
  %rcc.tmp.34 = load i32, ptr %receiver..tmp
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, 3
  %rcc.tmp.36 = load i32, ptr %node_count..tmp
  %rcc.tmp.37 = srem i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %vote_threshold
  %rcc.tmp.39 = sub i32 %rcc.tmp.38, 1
  %rcc.tmp.40 = icmp sge i32 %rcc.tmp.37, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load i32, ptr %receiver..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  store i32 2, ptr %rcc.tmp.45
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @handle_append_entries.(i32 %sender.tmp, i32 %receiver.tmp, i32 %term.tmp, i32 %prev_log_index.tmp, i32 %prev_log_term.tmp, i32 %entry.tmp, [100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp, [100 x i32]* %commit_indices.tmp) {
entry:
  %sender..tmp = alloca i32 
  %receiver..tmp = alloca i32 
  %term..tmp = alloca i32 
  %prev_log_index..tmp = alloca i32 
  %prev_log_term..tmp = alloca i32 
  %entry..tmp = alloca i32 
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  %commit_indices..tmp = alloca [100 x i32]* 
  store i32 %sender.tmp, ptr %sender..tmp
  store i32 %receiver.tmp, ptr %receiver..tmp
  store i32 %term.tmp, ptr %term..tmp
  store i32 %prev_log_index.tmp, ptr %prev_log_index..tmp
  store i32 %prev_log_term.tmp, ptr %prev_log_term..tmp
  store i32 %entry.tmp, ptr %entry..tmp
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  %rcc.tmp.12 = load i32, ptr %term..tmp
  %rcc.tmp.13 = load i32, ptr %receiver..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %term..tmp
  %rcc.tmp.23 = load i32, ptr %receiver..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.26 = getelementptr [100 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.22, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %receiver..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.33 = getelementptr [100 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %term..tmp
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %receiver..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.39 = getelementptr [100 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  store i32 0, ptr %rcc.tmp.39
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.43 = load i32, ptr %prev_log_index..tmp
  %rcc.tmp.44 = icmp sge i32 %rcc.tmp.43, 0
  br i1 %rcc.tmp.44, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.46 = load i32, ptr %prev_log_index..tmp
  %rcc.tmp.47 = load i32, ptr %receiver..tmp
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.50 = getelementptr [100 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.51
  br label %sc.merge
sc.merge:
  %rcc.tmp.54 = phi i1 [0, %if.merge.2], [%rcc.tmp.52, %and.rhs]
  br i1 %rcc.tmp.54, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.56 = load i32, ptr %receiver..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.59 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %prev_log_index..tmp
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %prev_log_term..tmp
  %rcc.tmp.65 = icmp eq i32 %rcc.tmp.63, %rcc.tmp.64
  br i1 %rcc.tmp.65, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.67 = load i32, ptr %entry..tmp
  %rcc.tmp.68 = icmp sgt i32 %rcc.tmp.67, 0
  br i1 %rcc.tmp.68, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.70 = load i32, ptr %receiver..tmp
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.73 = getelementptr [100 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = icmp slt i32 %rcc.tmp.74, 50
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.77 = phi i1 [0, %if.then.4], [%rcc.tmp.75, %and.rhs.2]
  br i1 %rcc.tmp.77, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.79 = load i32, ptr %receiver..tmp
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.82 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = load i32, ptr %receiver..tmp
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.86 = getelementptr [100 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [50 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %entry..tmp
  store i32 %rcc.tmp.90, ptr %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %receiver..tmp
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.95 = getelementptr [100 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load i32, ptr %receiver..tmp
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.99 = getelementptr [100 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %rcc.tmp.95
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  ret void
}
define void @handle_append_response.(i32 %sender.tmp, i32 %receiver.tmp, i32 %term.tmp, i32 %success.tmp, i32 %match_index.tmp, [100 x i32]* %states.tmp, [100 x [100 x i32]]* %next_indices.tmp, [100 x [100 x i32]]* %match_indices.tmp) {
entry:
  %sender..tmp = alloca i32 
  %receiver..tmp = alloca i32 
  %term..tmp = alloca i32 
  %success..tmp = alloca i32 
  %match_index..tmp = alloca i32 
  %states..tmp = alloca [100 x i32]* 
  %next_indices..tmp = alloca [100 x [100 x i32]]* 
  %match_indices..tmp = alloca [100 x [100 x i32]]* 
  store i32 %sender.tmp, ptr %sender..tmp
  store i32 %receiver.tmp, ptr %receiver..tmp
  store i32 %term.tmp, ptr %term..tmp
  store i32 %success.tmp, ptr %success..tmp
  store i32 %match_index.tmp, ptr %match_index..tmp
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x [100 x i32]]* %next_indices.tmp, ptr %next_indices..tmp
  store [100 x [100 x i32]]* %match_indices.tmp, ptr %match_indices..tmp
  %rcc.tmp.9 = load i32, ptr %receiver..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.12 = getelementptr [100 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 2
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load i32, ptr %term..tmp
  %rcc.tmp.17 = load i32, ptr %receiver..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.16, %rcc.tmp.21
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %entry], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %success..tmp
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.26, 1
  br i1 %rcc.tmp.27, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.29 = load i32, ptr %receiver..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [100 x [100 x i32]]*, ptr %next_indices..tmp
  %rcc.tmp.32 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %sender..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %match_index..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.35
  %rcc.tmp.39 = load i32, ptr %receiver..tmp
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [100 x [100 x i32]]*, ptr %match_indices..tmp
  %rcc.tmp.42 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %sender..tmp
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %match_index..tmp
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  br label %if.merge.2
if.else.2:
  %rcc.tmp.49 = load i32, ptr %receiver..tmp
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [100 x [100 x i32]]*, ptr %next_indices..tmp
  %rcc.tmp.52 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %sender..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [100 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp sgt i32 %rcc.tmp.56, 0
  br i1 %rcc.tmp.57, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.59 = load i32, ptr %receiver..tmp
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [100 x [100 x i32]]*, ptr %next_indices..tmp
  %rcc.tmp.62 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %sender..tmp
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %receiver..tmp
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = load [100 x [100 x i32]]*, ptr %next_indices..tmp
  %rcc.tmp.69 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %sender..tmp
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [100 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = sub i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %rcc.tmp.65
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @check_leader_election.([100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, i32 %node_count.tmp) {
entry:
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %max_term = alloca i32 
  %leader_count = alloca i32 
  %leader_id = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %max_term
  store i32 0, ptr %leader_count
  %rcc.tmp.7 = sub i32 0, 1
  store i32 %rcc.tmp.7, ptr %leader_id
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load i32, ptr %node_count..tmp
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %max_term
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.27 = getelementptr [100 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %max_term
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %node_count..tmp
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.46 = getelementptr [100 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.47, 2
  br i1 %rcc.tmp.48, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %max_term
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.54, %rcc.tmp.55
  br label %sc.merge
sc.merge:
  %rcc.tmp.58 = phi i1 [0, %while.body.2], [%rcc.tmp.56, %and.rhs]
  br i1 %rcc.tmp.58, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.60 = load i32, ptr %leader_count
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %leader_count
  %rcc.tmp.63 = load i32, ptr %i
  store i32 %rcc.tmp.63, ptr %leader_id
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.71 = load i32, ptr %leader_count
  %rcc.tmp.72 = icmp eq i32 %rcc.tmp.71, 1
  br i1 %rcc.tmp.72, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.74 = load i32, ptr %leader_id
  br label %if.merge.3
if.else.3:
  %rcc.tmp.76 = sub i32 0, 1
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.78 = phi i32 [%rcc.tmp.74, %if.then.3], [%rcc.tmp.76, %if.else.3]
  ret i32 %rcc.tmp.78
}
define void @simulate_log_replication.(i32 %leader.tmp, [100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp, [100 x i32]* %commit_indices.tmp, [100 x [100 x i32]]* %next_indices.tmp, [100 x [100 x i32]]* %match_indices.tmp, [1000 x [10 x i32]]* %queue.tmp, i32* %tail.tmp, [100 x i1]* %partition.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %leader..tmp = alloca i32 
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  %commit_indices..tmp = alloca [100 x i32]* 
  %next_indices..tmp = alloca [100 x [100 x i32]]* 
  %match_indices..tmp = alloca [100 x [100 x i32]]* 
  %queue..tmp = alloca [1000 x [10 x i32]]* 
  %tail..tmp = alloca i32* 
  %partition..tmp = alloca [100 x i1]* 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %i = alloca i32 
  %next_index = alloca i32 
  %prev_index = alloca i32 
  %prev_term = alloca i32 
  %entry.2 = alloca i32 
  %new_commit = alloca i32 
  %j = alloca i32 
  %replicated_count = alloca i32 
  %k = alloca i32 
  store i32 %leader.tmp, ptr %leader..tmp
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  store [100 x [100 x i32]]* %next_indices.tmp, ptr %next_indices..tmp
  store [100 x [100 x i32]]* %match_indices.tmp, ptr %match_indices..tmp
  store [1000 x [10 x i32]]* %queue.tmp, ptr %queue..tmp
  store i32* %tail.tmp, ptr %tail..tmp
  store [100 x i1]* %partition.tmp, ptr %partition..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %node_count..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %leader..tmp
  %rcc.tmp.21 = icmp ne i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.26 = getelementptr [100 x i1], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i1, ptr %rcc.tmp.26
  %rcc.tmp.28 = xor i1 %rcc.tmp.27, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.body], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %leader..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [100 x [100 x i32]]*, ptr %next_indices..tmp
  %rcc.tmp.35 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [100 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %next_index
  %rcc.tmp.41 = load i32, ptr %next_index
  %rcc.tmp.42 = load i32, ptr %leader..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.49 = load i32, ptr %next_index
  %rcc.tmp.50 = sub i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %prev_index
  %rcc.tmp.52 = load i32, ptr %prev_index
  %rcc.tmp.53 = icmp sge i32 %rcc.tmp.52, 0
  br i1 %rcc.tmp.53, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.55 = load i32, ptr %leader..tmp
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.58 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.59 = load i32, ptr %prev_index
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = getelementptr [50 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.65 = phi i32 [%rcc.tmp.62, %if.then.3], [0, %if.else.3]
  store i32 %rcc.tmp.65, ptr %prev_term
  %rcc.tmp.67 = load i32, ptr %leader..tmp
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.70 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %next_index
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [50 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %entry.2
  %rcc.tmp.76 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.77 = load i32*, ptr %tail..tmp
  %rcc.tmp.78 = load i32, ptr %leader..tmp
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = load i32, ptr %prev_index
  %rcc.tmp.81 = load i32, ptr %prev_term
  %rcc.tmp.82 = load i32, ptr %entry.2
  call void @enqueue_message.([1000 x [10 x i32]]* %rcc.tmp.76, i32* %rcc.tmp.77, i32 %rcc.tmp.78, i32 %rcc.tmp.79, i32 4, i32 0, i32 %rcc.tmp.80, i32 %rcc.tmp.81, i32 %rcc.tmp.82)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.92 = load i32, ptr %leader..tmp
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.95 = getelementptr [100 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  store i32 %rcc.tmp.96, ptr %new_commit
  %rcc.tmp.98 = load i32, ptr %leader..tmp
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.101 = getelementptr [100 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = load i32, ptr %leader..tmp
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.110 = getelementptr [100 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = icmp slt i32 %rcc.tmp.106, %rcc.tmp.111
  br i1 %rcc.tmp.112, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 1, ptr %replicated_count
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.118 = load i32, ptr %k
  %rcc.tmp.119 = load i32, ptr %node_count..tmp
  %rcc.tmp.120 = icmp slt i32 %rcc.tmp.118, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.123 = load i32, ptr %k
  %rcc.tmp.124 = load i32, ptr %leader..tmp
  %rcc.tmp.125 = icmp ne i32 %rcc.tmp.123, %rcc.tmp.124
  br i1 %rcc.tmp.125, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.127 = load i32, ptr %leader..tmp
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = load [100 x [100 x i32]]*, ptr %match_indices..tmp
  %rcc.tmp.130 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = load i32, ptr %k
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 0
  %rcc.tmp.133 = getelementptr [100 x i32], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.132
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %j
  %rcc.tmp.136 = icmp sge i32 %rcc.tmp.134, %rcc.tmp.135
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.138 = phi i1 [0, %while.body.3], [%rcc.tmp.136, %and.rhs.2]
  br i1 %rcc.tmp.138, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.140 = load i32, ptr %replicated_count
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 1
  store i32 %rcc.tmp.141, ptr %replicated_count
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.145 = load i32, ptr %k
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.149 = load i32, ptr %replicated_count
  %rcc.tmp.150 = load i32, ptr %node_count..tmp
  %rcc.tmp.151 = sdiv i32 %rcc.tmp.150, 2
  %rcc.tmp.152 = icmp sgt i32 %rcc.tmp.149, %rcc.tmp.151
  br i1 %rcc.tmp.152, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.154 = load i32, ptr %j
  store i32 %rcc.tmp.154, ptr %new_commit
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.158 = load i32, ptr %j
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 1
  store i32 %rcc.tmp.159, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.162 = load i32, ptr %leader..tmp
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 0
  %rcc.tmp.164 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.165 = getelementptr [100 x i32], ptr %rcc.tmp.164, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.166 = load i32, ptr %new_commit
  store i32 %rcc.tmp.166, ptr %rcc.tmp.165
  ret void
}
define void @append_log_entry.(i32 %node.tmp, i32 %entry.tmp, [100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp) {
entry:
  %node..tmp = alloca i32 
  %entry..tmp = alloca i32 
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  store i32 %node.tmp, ptr %node..tmp
  store i32 %entry.tmp, ptr %entry..tmp
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  %rcc.tmp.5 = load i32, ptr %node..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 50
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %node..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.15 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %node..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %entry..tmp
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %node..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.28 = getelementptr [100 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %node..tmp
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.32 = getelementptr [100 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %rcc.tmp.28
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @verify_system_consistency.([100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp, [100 x i32]* %commit_indices.tmp, i32 %node_count.tmp) {
entry:
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  %commit_indices..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %consistency_score = alloca i32 
  %leader_count = alloca i32 
  %max_term = alloca i32 
  %i = alloca i32 
  %log_inconsistencies = alloca i32 
  %j = alloca i32 
  %min_commit = alloca i32 
  %k = alloca i32 
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 100, ptr %consistency_score
  store i32 0, ptr %leader_count
  %rcc.tmp.9 = sub i32 0, 1
  store i32 %rcc.tmp.9, ptr %max_term
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
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %max_term
  %rcc.tmp.24 = icmp sgt i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.29 = getelementptr [100 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %max_term
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = load i32, ptr %node_count..tmp
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.48 = getelementptr [100 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.49, 2
  br i1 %rcc.tmp.50, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.55 = getelementptr [100 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %max_term
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.56, %rcc.tmp.57
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %while.body.2], [%rcc.tmp.58, %and.rhs]
  br i1 %rcc.tmp.60, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.62 = load i32, ptr %leader_count
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %leader_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.71 = load i32, ptr %leader_count
  %rcc.tmp.72 = icmp sgt i32 %rcc.tmp.71, 1
  br i1 %rcc.tmp.72, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.74 = load i32, ptr %consistency_score
  %rcc.tmp.75 = sub i32 %rcc.tmp.74, 30
  store i32 %rcc.tmp.75, ptr %consistency_score
  br label %if.merge.3
if.else.3:
  %rcc.tmp.78 = load i32, ptr %leader_count
  %rcc.tmp.79 = icmp eq i32 %rcc.tmp.78, 0
  br i1 %rcc.tmp.79, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.81 = load i32, ptr %consistency_score
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 20
  store i32 %rcc.tmp.82, ptr %consistency_score
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  store i32 0, ptr %log_inconsistencies
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = load i32, ptr %node_count..tmp
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.90, %rcc.tmp.91
  br i1 %rcc.tmp.92, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.99 = load i32, ptr %j
  %rcc.tmp.100 = load i32, ptr %node_count..tmp
  %rcc.tmp.101 = icmp slt i32 %rcc.tmp.99, %rcc.tmp.100
  br i1 %rcc.tmp.101, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.107 = getelementptr [100 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %j
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.112 = getelementptr [100 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = icmp slt i32 %rcc.tmp.108, %rcc.tmp.113
  br i1 %rcc.tmp.114, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.119 = getelementptr [100 x i32], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  br label %if.merge.5
if.else.5:
  %rcc.tmp.122 = load i32, ptr %j
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.125 = getelementptr [100 x i32], ptr %rcc.tmp.124, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.128 = phi i32 [%rcc.tmp.120, %if.then.5], [%rcc.tmp.126, %if.else.5]
  store i32 %rcc.tmp.128, ptr %min_commit
  store i32 0, ptr %k
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.132 = load i32, ptr %k
  %rcc.tmp.133 = load i32, ptr %min_commit
  %rcc.tmp.134 = icmp sle i32 %rcc.tmp.132, %rcc.tmp.133
  br i1 %rcc.tmp.134, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.136 = load i32, ptr %k
  %rcc.tmp.137 = icmp slt i32 %rcc.tmp.136, 50
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.139 = phi i1 [0, %while.cond.5], [%rcc.tmp.137, %and.rhs.2]
  br i1 %rcc.tmp.139, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.145 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.146 = load i32, ptr %k
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = getelementptr [50 x i32], ptr %rcc.tmp.145, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  %rcc.tmp.150 = load i32, ptr %j
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.153 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.154 = load i32, ptr %k
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [50 x i32], ptr %rcc.tmp.153, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  %rcc.tmp.158 = icmp ne i32 %rcc.tmp.149, %rcc.tmp.157
  br i1 %rcc.tmp.158, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.160 = load i32, ptr %log_inconsistencies
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %log_inconsistencies
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.165 = load i32, ptr %k
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %k
  br label %while.cond.5
while.end.5:
  %rcc.tmp.169 = load i32, ptr %j
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 1
  store i32 %rcc.tmp.174, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.177 = load i32, ptr %consistency_score
  %rcc.tmp.178 = load i32, ptr %log_inconsistencies
  %rcc.tmp.179 = mul i32 %rcc.tmp.178, 2
  %rcc.tmp.180 = sub i32 %rcc.tmp.177, %rcc.tmp.179
  store i32 %rcc.tmp.180, ptr %consistency_score
  %rcc.tmp.182 = load i32, ptr %consistency_score
  %rcc.tmp.183 = icmp slt i32 %rcc.tmp.182, 0
  br i1 %rcc.tmp.183, label %if.then.7, label %if.else.7
if.then.7:
  store i32 0, ptr %consistency_score
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.188 = load i32, ptr %consistency_score
  ret i32 %rcc.tmp.188
}
define void @trigger_recovery_protocol.([100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, [100 x i32]* %votes.tmp, i32 %node_count.tmp) {
entry:
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %votes..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store [100 x i32]* %votes.tmp, ptr %votes..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %node_count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [100 x i32]*, ptr %votes..tmp
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = sub i32 0, 1
  store i32 %rcc.tmp.21, ptr %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @simulate_byzantine_failures.([100 x i32]* %states.tmp, [100 x i1]* %partition.tmp, i32 %node_count.tmp, i32 %round.tmp) {
entry:
  %states..tmp = alloca [100 x i32]* 
  %partition..tmp = alloca [100 x i1]* 
  %node_count..tmp = alloca i32 
  %round..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i1]* %partition.tmp, ptr %partition..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %node_count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = mul i32 %rcc.tmp.12, 19
  %rcc.tmp.14 = load i32, ptr %round..tmp
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 5
  %rcc.tmp.16 = add i32 %rcc.tmp.13, %rcc.tmp.15
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 97
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.23 = getelementptr [100 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  store i32 3, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [100 x i1]*, ptr %partition..tmp
  %rcc.tmp.28 = getelementptr [100 x i1], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  store i1 1, ptr %rcc.tmp.28
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @compact_logs.([100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp, [100 x i32]* %commit_indices.tmp, i32 %node_count.tmp) {
entry:
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  %commit_indices..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %i = alloca i32 
  %compact_until = alloca i32 
  %j = alloca i32 
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %node_count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = sdiv i32 %rcc.tmp.16, 2
  store i32 %rcc.tmp.17, ptr %compact_until
  %rcc.tmp.19 = load i32, ptr %compact_until
  %rcc.tmp.20 = icmp sgt i32 %rcc.tmp.19, 0
  br i1 %rcc.tmp.20, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.22 = load i32, ptr %compact_until
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.26 = getelementptr [100 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.body], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = load i32, ptr %compact_until
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.40 = getelementptr [100 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.48 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %j
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [50 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.55 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = load i32, ptr %compact_until
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [50 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %rcc.tmp.51
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.70 = getelementptr [100 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.74 = getelementptr [100 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %compact_until
  %rcc.tmp.77 = sub i32 %rcc.tmp.75, %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %rcc.tmp.70
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @find_stable_leader.([100 x i32]* %states.tmp, [100 x i32]* %terms.tmp, i32 %node_count.tmp) {
entry:
  %states..tmp = alloca [100 x i32]* 
  %terms..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %max_term = alloca i32 
  %stable_leader = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %states.tmp, ptr %states..tmp
  store [100 x i32]* %terms.tmp, ptr %terms..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %max_term
  %rcc.tmp.6 = sub i32 0, 1
  store i32 %rcc.tmp.6, ptr %stable_leader
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %node_count..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [100 x i32]*, ptr %states..tmp
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 2
  br i1 %rcc.tmp.20, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.25 = getelementptr [100 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %max_term
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.26, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.body], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [100 x i32]*, ptr %terms..tmp
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %max_term
  %rcc.tmp.38 = load i32, ptr %i
  store i32 %rcc.tmp.38, ptr %stable_leader
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.46 = load i32, ptr %stable_leader
  ret i32 %rcc.tmp.46
}
define i32 @count_total_committed_entries.([100 x i32]* %commit_indices.tmp, i32 %node_count.tmp) {
entry:
  %commit_indices..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %total = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 0, ptr %total
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %node_count..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %total
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.11, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %total
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %total
  ret i32 %rcc.tmp.23
}
define i32 @calculate_network_efficiency.(i32 %total_messages.tmp, i32 %consensus_rounds.tmp) {
entry:
  %total_messages..tmp = alloca i32 
  %consensus_rounds..tmp = alloca i32 
  store i32 %total_messages.tmp, ptr %total_messages..tmp
  store i32 %consensus_rounds.tmp, ptr %consensus_rounds..tmp
  %rcc.tmp.3 = load i32, ptr %consensus_rounds..tmp
  %rcc.tmp.4 = icmp sgt i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %total_messages..tmp
  %rcc.tmp.7 = mul i32 %rcc.tmp.6, 100
  %rcc.tmp.8 = load i32, ptr %consensus_rounds..tmp
  %rcc.tmp.9 = mul i32 %rcc.tmp.8, 100
  %rcc.tmp.10 = sdiv i32 %rcc.tmp.7, %rcc.tmp.9
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.13 = phi i32 [%rcc.tmp.10, %if.then], [0, %if.else]
  ret i32 %rcc.tmp.13
}
define i32 @compute_system_state_hash.([100 x [50 x i32]]* %logs.tmp, [100 x i32]* %log_sizes.tmp, [100 x i32]* %commit_indices.tmp, i32 %node_count.tmp) {
entry:
  %logs..tmp = alloca [100 x [50 x i32]]* 
  %log_sizes..tmp = alloca [100 x i32]* 
  %commit_indices..tmp = alloca [100 x i32]* 
  %node_count..tmp = alloca i32 
  %hash = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [100 x [50 x i32]]* %logs.tmp, ptr %logs..tmp
  store [100 x i32]* %log_sizes.tmp, ptr %log_sizes..tmp
  store [100 x i32]* %commit_indices.tmp, ptr %commit_indices..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 17, ptr %hash
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %node_count..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %hash
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 31
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.14, %rcc.tmp.19
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 16777219
  store i32 %rcc.tmp.21, ptr %hash
  %rcc.tmp.23 = load i32, ptr %hash
  %rcc.tmp.24 = mul i32 %rcc.tmp.23, 31
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [100 x i32]*, ptr %commit_indices..tmp
  %rcc.tmp.28 = getelementptr [100 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = add i32 %rcc.tmp.24, %rcc.tmp.29
  %rcc.tmp.31 = srem i32 %rcc.tmp.30, 16777219
  store i32 %rcc.tmp.31, ptr %hash
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [100 x i32]*, ptr %log_sizes..tmp
  %rcc.tmp.39 = getelementptr [100 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.35, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.43, 50
  br label %sc.merge
sc.merge:
  %rcc.tmp.46 = phi i1 [0, %while.cond.2], [%rcc.tmp.44, %and.rhs]
  br i1 %rcc.tmp.46, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.49 = load i32, ptr %hash
  %rcc.tmp.50 = mul i32 %rcc.tmp.49, 31
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [100 x [50 x i32]]*, ptr %logs..tmp
  %rcc.tmp.54 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = add i32 %rcc.tmp.50, %rcc.tmp.58
  %rcc.tmp.60 = srem i32 %rcc.tmp.59, 16777219
  store i32 %rcc.tmp.60, ptr %hash
  %rcc.tmp.62 = load i32, ptr %j
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.70 = load i32, ptr %hash
  %rcc.tmp.71 = icmp slt i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %if.then, label %if.else
if.then:
  %rcc.tmp.73 = load i32, ptr %hash
  %rcc.tmp.74 = sub i32 0, %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %hash
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.78 = load i32, ptr %hash
  %rcc.tmp.79 = srem i32 %rcc.tmp.78, 1000000
  ret i32 %rcc.tmp.79
}
define void @enqueue_message.([1000 x [10 x i32]]* %queue.tmp, i32* %tail.tmp, i32 %sender.tmp, i32 %receiver.tmp, i32 %msg_type.tmp, i32 %term.tmp, i32 %data1.tmp, i32 %data2.tmp, i32 %data3.tmp) {
entry:
  %queue..tmp = alloca [1000 x [10 x i32]]* 
  %tail..tmp = alloca i32* 
  %sender..tmp = alloca i32 
  %receiver..tmp = alloca i32 
  %msg_type..tmp = alloca i32 
  %term..tmp = alloca i32 
  %data1..tmp = alloca i32 
  %data2..tmp = alloca i32 
  %data3..tmp = alloca i32 
  store [1000 x [10 x i32]]* %queue.tmp, ptr %queue..tmp
  store i32* %tail.tmp, ptr %tail..tmp
  store i32 %sender.tmp, ptr %sender..tmp
  store i32 %receiver.tmp, ptr %receiver..tmp
  store i32 %msg_type.tmp, ptr %msg_type..tmp
  store i32 %term.tmp, ptr %term..tmp
  store i32 %data1.tmp, ptr %data1..tmp
  store i32 %data2.tmp, ptr %data2..tmp
  store i32 %data3.tmp, ptr %data3..tmp
  %rcc.tmp.10 = load i32*, ptr %tail..tmp
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.14 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %sender..tmp
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = load i32*, ptr %tail..tmp
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.22 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %rcc.tmp.22, i32 0, i32 1
  %rcc.tmp.24 = load i32, ptr %receiver..tmp
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  %rcc.tmp.26 = load i32*, ptr %tail..tmp
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.30 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %rcc.tmp.30, i32 0, i32 2
  %rcc.tmp.32 = load i32, ptr %msg_type..tmp
  store i32 %rcc.tmp.32, ptr %rcc.tmp.31
  %rcc.tmp.34 = load i32*, ptr %tail..tmp
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.38 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %rcc.tmp.38, i32 0, i32 3
  %rcc.tmp.40 = load i32, ptr %term..tmp
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  %rcc.tmp.42 = load i32*, ptr %tail..tmp
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.46 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = getelementptr [10 x i32], ptr %rcc.tmp.46, i32 0, i32 4
  %rcc.tmp.48 = load i32, ptr %data1..tmp
  store i32 %rcc.tmp.48, ptr %rcc.tmp.47
  %rcc.tmp.50 = load i32*, ptr %tail..tmp
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.54 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = getelementptr [10 x i32], ptr %rcc.tmp.54, i32 0, i32 5
  %rcc.tmp.56 = load i32, ptr %data2..tmp
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  %rcc.tmp.58 = load i32*, ptr %tail..tmp
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.62 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 6
  %rcc.tmp.64 = load i32, ptr %data3..tmp
  store i32 %rcc.tmp.64, ptr %rcc.tmp.63
  %rcc.tmp.66 = load i32*, ptr %tail..tmp
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.70 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = getelementptr [10 x i32], ptr %rcc.tmp.70, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = load i32*, ptr %tail..tmp
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.77 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = getelementptr [10 x i32], ptr %rcc.tmp.77, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.78
  %rcc.tmp.80 = load i32*, ptr %tail..tmp
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [1000 x [10 x i32]]*, ptr %queue..tmp
  %rcc.tmp.84 = getelementptr [1000 x [10 x i32]], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [10 x i32], ptr %rcc.tmp.84, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = load i32*, ptr %tail..tmp
  %rcc.tmp.88 = load i32*, ptr %tail..tmp
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  %rcc.tmp.91 = srem i32 %rcc.tmp.90, 1000
  store i32 %rcc.tmp.91, ptr %rcc.tmp.87
  ret void
}
