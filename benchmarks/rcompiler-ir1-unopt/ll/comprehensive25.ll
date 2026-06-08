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
  %byzantine_tolerance = alloca i32 
  %max_consensus_rounds = alloca i32 
  call void @printlnInt.(i32 25000)
  store i32 7, ptr %node_count
  store i32 2, ptr %byzantine_tolerance
  store i32 100, ptr %max_consensus_rounds
  %rcc.tmp.5 = load i32, ptr %node_count
  call void @performBasicConsensusTest.(i32 %rcc.tmp.5)
  %rcc.tmp.7 = load i32, ptr %node_count
  %rcc.tmp.8 = load i32, ptr %byzantine_tolerance
  call void @performByzantineFaultToleranceTest.(i32 %rcc.tmp.7, i32 %rcc.tmp.8)
  %rcc.tmp.10 = load i32, ptr %node_count
  call void @performNetworkPartitionTest.(i32 %rcc.tmp.10)
  %rcc.tmp.12 = load i32, ptr %node_count
  call void @performLeaderElectionTest.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = load i32, ptr %node_count
  %rcc.tmp.15 = load i32, ptr %max_consensus_rounds
  call void @performAsynchronousConsensusTest.(i32 %rcc.tmp.14, i32 %rcc.tmp.15)
  call void @printlnInt.(i32 25999)
  call void @exit.(i32 0)
  ret void
}
define void @performBasicConsensusTest.(i32 %node_count.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_states = alloca [7 x i32] 
  %node_terms = alloca [7 x i32] 
  %node_votes = alloca [7 x i32] 
  %node_logs = alloca [7 x [100 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %fill.idx.7 = alloca i32 
  %log_lengths = alloca [7 x i32] 
  %consensus_round = alloca i32 
  %leader_id = alloca i32 
  %success = alloca i1 
  %consistency_check = alloca i1 
  store i32 %node_count.tmp, ptr %node_count..tmp
  call void @printlnInt.(i32 25001)
  %rcc.tmp.3 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [7 x i32], ptr %node_states, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [7 x i32], ptr %node_terms, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = sub i32 0, 1
  %rcc.tmp.32 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 0
  store i32 %rcc.tmp.31, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 1
  store i32 %rcc.tmp.31, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 2
  store i32 %rcc.tmp.31, ptr %rcc.tmp.36
  %rcc.tmp.38 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 3
  store i32 %rcc.tmp.31, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 4
  store i32 %rcc.tmp.31, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 5
  store i32 %rcc.tmp.31, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [7 x i32], ptr %node_votes, i32 0, i32 6
  store i32 %rcc.tmp.31, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.49 = load i32, ptr %fill.idx
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 100
  br i1 %rcc.tmp.50, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.52 = load i32, ptr %fill.idx
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.55, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.58 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.61 = load i32, ptr %fill.idx.2
  %rcc.tmp.62 = icmp slt i32 %rcc.tmp.61, 100
  br i1 %rcc.tmp.62, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.64 = load i32, ptr %fill.idx.2
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.64
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.67, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.70 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.73 = load i32, ptr %fill.idx.3
  %rcc.tmp.74 = icmp slt i32 %rcc.tmp.73, 100
  br i1 %rcc.tmp.74, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.76 = load i32, ptr %fill.idx.3
  %rcc.tmp.77 = getelementptr [100 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.76
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.79, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.82 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 3
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.85 = load i32, ptr %fill.idx.4
  %rcc.tmp.86 = icmp slt i32 %rcc.tmp.85, 100
  br i1 %rcc.tmp.86, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.88 = load i32, ptr %fill.idx.4
  %rcc.tmp.89 = getelementptr [100 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.88
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.91, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.94 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 4
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.97 = load i32, ptr %fill.idx.5
  %rcc.tmp.98 = icmp slt i32 %rcc.tmp.97, 100
  br i1 %rcc.tmp.98, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.100 = load i32, ptr %fill.idx.5
  %rcc.tmp.101 = getelementptr [100 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.100
  store i32 0, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.103, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.106 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 5
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.109 = load i32, ptr %fill.idx.6
  %rcc.tmp.110 = icmp slt i32 %rcc.tmp.109, 100
  br i1 %rcc.tmp.110, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.112 = load i32, ptr %fill.idx.6
  %rcc.tmp.113 = getelementptr [100 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.112
  store i32 0, ptr %rcc.tmp.113
  %rcc.tmp.115 = add i32 %rcc.tmp.112, 1
  store i32 %rcc.tmp.115, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.118 = getelementptr [7 x [100 x i32]], ptr %node_logs, i32 0, i32 6
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.121 = load i32, ptr %fill.idx.7
  %rcc.tmp.122 = icmp slt i32 %rcc.tmp.121, 100
  br i1 %rcc.tmp.122, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.124 = load i32, ptr %fill.idx.7
  %rcc.tmp.125 = getelementptr [100 x i32], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.124
  store i32 0, ptr %rcc.tmp.125
  %rcc.tmp.127 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.127, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  %rcc.tmp.130 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.132
  %rcc.tmp.134 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.134
  %rcc.tmp.136 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.136
  %rcc.tmp.138 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.138
  %rcc.tmp.140 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.140
  %rcc.tmp.142 = getelementptr [7 x i32], ptr %log_lengths, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.142
  store i32 0, ptr %consensus_round
  br label %while.cond
while.cond:
  %rcc.tmp.146 = load i32, ptr %consensus_round
  %rcc.tmp.147 = icmp slt i32 %rcc.tmp.146, 50
  br i1 %rcc.tmp.147, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.150 = load i32, ptr %node_count..tmp
  %rcc.tmp.151 = call i32 @conductLeaderElection.(i32 %rcc.tmp.150, [7 x i32]* %node_states, [7 x i32]* %node_terms, [7 x i32]* %node_votes)
  store i32 %rcc.tmp.151, ptr %leader_id
  %rcc.tmp.153 = load i32, ptr %leader_id
  %rcc.tmp.154 = icmp sge i32 %rcc.tmp.153, 0
  br i1 %rcc.tmp.154, label %if.then, label %if.else
if.then:
  %rcc.tmp.156 = load i32, ptr %leader_id
  %rcc.tmp.157 = load i32, ptr %node_count..tmp
  %rcc.tmp.158 = call i1 @performLogReplication.(i32 %rcc.tmp.156, i32 %rcc.tmp.157, [7 x [100 x i32]]* %node_logs, [7 x i32]* %log_lengths)
  store i1 %rcc.tmp.158, ptr %success
  %rcc.tmp.160 = load i1, ptr %success
  br i1 %rcc.tmp.160, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.162 = load i32, ptr %consensus_round
  %rcc.tmp.163 = add i32 25000, %rcc.tmp.162
  call void @printlnInt.(i32 %rcc.tmp.163)
  %rcc.tmp.165 = load i32, ptr %node_count..tmp
  %rcc.tmp.166 = call i1 @verifyLogConsistency.(i32 %rcc.tmp.165, [7 x [100 x i32]]* %node_logs, [7 x i32]* %log_lengths)
  store i1 %rcc.tmp.166, ptr %consistency_check
  %rcc.tmp.168 = load i1, ptr %consistency_check
  br i1 %rcc.tmp.168, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.170 = load i32, ptr %consensus_round
  %rcc.tmp.171 = add i32 25100, %rcc.tmp.170
  call void @printlnInt.(i32 %rcc.tmp.171)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.179 = load i32, ptr %consensus_round
  %rcc.tmp.180 = add i32 %rcc.tmp.179, 1
  store i32 %rcc.tmp.180, ptr %consensus_round
  br label %while.cond
while.end:
  call void @printlnInt.(i32 25099)
  ret void
}
define i32 @conductLeaderElection.(i32 %node_count.tmp, [7 x i32]* %node_states.tmp, [7 x i32]* %node_terms.tmp, [7 x i32]* %node_votes.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_states..tmp = alloca [7 x i32]* 
  %node_terms..tmp = alloca [7 x i32]* 
  %node_votes..tmp = alloca [7 x i32]* 
  %current_term = alloca i32 
  %i = alloca i32 
  %candidates = alloca [7 x i1] 
  %candidate_count = alloca i32 
  %vote_counts = alloca [7 x i32] 
  %voter = alloca i32 
  %vote_choice = alloca i32 
  %candidate_id = alloca i32 
  %majority_threshold = alloca i32 
  %winner = alloca i32 
  %check_candidate = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_states.tmp, ptr %node_states..tmp
  store [7 x i32]* %node_terms.tmp, ptr %node_terms..tmp
  store [7 x i32]* %node_votes.tmp, ptr %node_votes..tmp
  %rcc.tmp.5 = load [7 x i32]*, ptr %node_terms..tmp
  %rcc.tmp.6 = load i32, ptr %node_count..tmp
  %rcc.tmp.7 = call i32 @findMaxTerm.([7 x i32]* %rcc.tmp.5, i32 %rcc.tmp.6)
  store i32 %rcc.tmp.7, ptr %current_term
  %rcc.tmp.9 = load i32, ptr %current_term
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %current_term
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
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [7 x i32]*, ptr %node_votes..tmp
  %rcc.tmp.22 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.41
  store i32 0, ptr %candidate_count
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %node_count..tmp
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [7 x i32]*, ptr %node_states..tmp
  %rcc.tmp.55 = getelementptr [7 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = load [7 x i32]*, ptr %node_terms..tmp
  %rcc.tmp.60 = getelementptr [7 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %current_term
  %rcc.tmp.63 = call i1 @shouldBecomeCandidate.(i32 %rcc.tmp.51, i32 %rcc.tmp.56, i32 %rcc.tmp.61, i32 %rcc.tmp.62)
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 %rcc.tmp.66
  store i1 1, ptr %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = load [7 x i32]*, ptr %node_states..tmp
  %rcc.tmp.72 = getelementptr [7 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  store i32 1, ptr %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [7 x i32]*, ptr %node_terms..tmp
  %rcc.tmp.77 = getelementptr [7 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %current_term
  store i32 %rcc.tmp.78, ptr %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %candidate_count
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %candidate_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.89 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.99
  %rcc.tmp.101 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.101
  store i32 0, ptr %voter
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.105 = load i32, ptr %voter
  %rcc.tmp.106 = load i32, ptr %node_count..tmp
  %rcc.tmp.107 = icmp slt i32 %rcc.tmp.105, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.110 = load i32, ptr %voter
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = load [7 x i32]*, ptr %node_states..tmp
  %rcc.tmp.113 = getelementptr [7 x i32], ptr %rcc.tmp.112, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = icmp ne i32 %rcc.tmp.114, 1
  br i1 %rcc.tmp.115, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.117 = load i32, ptr %voter
  %rcc.tmp.118 = load i32, ptr %node_count..tmp
  %rcc.tmp.119 = load [7 x i32]*, ptr %node_terms..tmp
  %rcc.tmp.120 = load i32, ptr %current_term
  %rcc.tmp.121 = call i32 @decideVote.(i32 %rcc.tmp.117, i32 %rcc.tmp.118, [7 x i1]* %candidates, [7 x i32]* %rcc.tmp.119, i32 %rcc.tmp.120)
  store i32 %rcc.tmp.121, ptr %vote_choice
  %rcc.tmp.123 = load i32, ptr %vote_choice
  %rcc.tmp.124 = icmp sge i32 %rcc.tmp.123, 0
  br i1 %rcc.tmp.124, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.126 = load i32, ptr %vote_choice
  %rcc.tmp.127 = load i32, ptr %node_count..tmp
  %rcc.tmp.128 = icmp slt i32 %rcc.tmp.126, %rcc.tmp.127
  br label %sc.merge
sc.merge:
  %rcc.tmp.130 = phi i1 [0, %if.then.2], [%rcc.tmp.128, %and.rhs]
  br i1 %rcc.tmp.130, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.132 = load i32, ptr %voter
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = load [7 x i32]*, ptr %node_votes..tmp
  %rcc.tmp.135 = getelementptr [7 x i32], ptr %rcc.tmp.134, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.136 = load i32, ptr %vote_choice
  store i32 %rcc.tmp.136, ptr %rcc.tmp.135
  %rcc.tmp.138 = load i32, ptr %vote_choice
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %vote_choice
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 1
  store i32 %rcc.tmp.145, ptr %rcc.tmp.140
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.151 = load i32, ptr %voter
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 1
  store i32 %rcc.tmp.152, ptr %voter
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %candidate_id
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.157 = load i32, ptr %candidate_id
  %rcc.tmp.158 = load i32, ptr %node_count..tmp
  %rcc.tmp.159 = icmp slt i32 %rcc.tmp.157, %rcc.tmp.158
  br i1 %rcc.tmp.159, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.162 = load i32, ptr %candidate_id
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 0
  %rcc.tmp.164 = getelementptr [7 x i1], ptr %candidates, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.165 = load i1, ptr %rcc.tmp.164
  br i1 %rcc.tmp.165, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.167 = load i32, ptr %candidate_id
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 0
  %rcc.tmp.169 = load [7 x i32]*, ptr %node_votes..tmp
  %rcc.tmp.170 = getelementptr [7 x i32], ptr %rcc.tmp.169, i32 0, i32 %rcc.tmp.168
  %rcc.tmp.171 = load i32, ptr %candidate_id
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = load i32, ptr %candidate_id
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 %rcc.tmp.174
  %rcc.tmp.176 = load i32, ptr %candidate_id
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 0
  %rcc.tmp.178 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 %rcc.tmp.177
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.178
  %rcc.tmp.180 = add i32 %rcc.tmp.179, 1
  store i32 %rcc.tmp.180, ptr %rcc.tmp.175
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.184 = load i32, ptr %candidate_id
  %rcc.tmp.185 = add i32 %rcc.tmp.184, 1
  store i32 %rcc.tmp.185, ptr %candidate_id
  br label %while.cond.4
while.end.4:
  %rcc.tmp.188 = load i32, ptr %node_count..tmp
  %rcc.tmp.189 = sdiv i32 %rcc.tmp.188, 2
  %rcc.tmp.190 = add i32 %rcc.tmp.189, 1
  store i32 %rcc.tmp.190, ptr %majority_threshold
  %rcc.tmp.192 = sub i32 0, 1
  store i32 %rcc.tmp.192, ptr %winner
  store i32 0, ptr %check_candidate
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.196 = load i32, ptr %check_candidate
  %rcc.tmp.197 = load i32, ptr %node_count..tmp
  %rcc.tmp.198 = icmp slt i32 %rcc.tmp.196, %rcc.tmp.197
  br i1 %rcc.tmp.198, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.201 = load i32, ptr %check_candidate
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 0
  %rcc.tmp.203 = getelementptr [7 x i32], ptr %vote_counts, i32 0, i32 %rcc.tmp.202
  %rcc.tmp.204 = load i32, ptr %rcc.tmp.203
  %rcc.tmp.205 = load i32, ptr %majority_threshold
  %rcc.tmp.206 = icmp sge i32 %rcc.tmp.204, %rcc.tmp.205
  br i1 %rcc.tmp.206, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.208 = load i32, ptr %check_candidate
  store i32 %rcc.tmp.208, ptr %winner
  %rcc.tmp.210 = load i32, ptr %check_candidate
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 0
  %rcc.tmp.212 = load [7 x i32]*, ptr %node_states..tmp
  %rcc.tmp.213 = getelementptr [7 x i32], ptr %rcc.tmp.212, i32 0, i32 %rcc.tmp.211
  store i32 2, ptr %rcc.tmp.213
  br label %while.linker.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.217 = load i32, ptr %check_candidate
  %rcc.tmp.218 = add i32 %rcc.tmp.217, 1
  store i32 %rcc.tmp.218, ptr %check_candidate
  br label %while.cond.5
while.end.5:
  %rcc.tmp.221 = load i32, ptr %winner
  ret i32 %rcc.tmp.221
}
define i32 @decideVote.(i32 %voter_id.tmp, i32 %node_count.tmp, [7 x i1]* %candidates.tmp, [7 x i32]* %node_terms.tmp, i32 %current_term.tmp) {
entry:
  %voter_id..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %candidates..tmp = alloca [7 x i1]* 
  %node_terms..tmp = alloca [7 x i32]* 
  %current_term..tmp = alloca i32 
  %best_candidate = alloca i32 
  %best_term = alloca i32 
  %candidate_id = alloca i32 
  %candidate_score = alloca i32 
  store i32 %voter_id.tmp, ptr %voter_id..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i1]* %candidates.tmp, ptr %candidates..tmp
  store [7 x i32]* %node_terms.tmp, ptr %node_terms..tmp
  store i32 %current_term.tmp, ptr %current_term..tmp
  %rcc.tmp.6 = sub i32 0, 1
  store i32 %rcc.tmp.6, ptr %best_candidate
  %rcc.tmp.8 = sub i32 0, 1
  store i32 %rcc.tmp.8, ptr %best_term
  store i32 0, ptr %candidate_id
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %candidate_id
  %rcc.tmp.13 = load i32, ptr %node_count..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %candidate_id
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [7 x i1]*, ptr %candidates..tmp
  %rcc.tmp.20 = getelementptr [7 x i1], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i1, ptr %rcc.tmp.20
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load i32, ptr %candidate_id
  %rcc.tmp.24 = load i32, ptr %voter_id..tmp
  %rcc.tmp.25 = load i32, ptr %candidate_id
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [7 x i32]*, ptr %node_terms..tmp
  %rcc.tmp.28 = getelementptr [7 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %current_term..tmp
  %rcc.tmp.31 = call i32 @calculateCandidateScore.(i32 %rcc.tmp.23, i32 %rcc.tmp.24, i32 %rcc.tmp.29, i32 %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %candidate_score
  %rcc.tmp.33 = load i32, ptr %candidate_score
  %rcc.tmp.34 = load i32, ptr %best_term
  %rcc.tmp.35 = icmp sgt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load i32, ptr %candidate_score
  store i32 %rcc.tmp.37, ptr %best_term
  %rcc.tmp.39 = load i32, ptr %candidate_id
  store i32 %rcc.tmp.39, ptr %best_candidate
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %candidate_id
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %candidate_id
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %best_candidate
  ret i32 %rcc.tmp.49
}
define i32 @calculateCandidateScore.(i32 %candidate_id.tmp, i32 %voter_id.tmp, i32 %candidate_term.tmp, i32 %current_term.tmp) {
entry:
  %candidate_id..tmp = alloca i32 
  %voter_id..tmp = alloca i32 
  %candidate_term..tmp = alloca i32 
  %current_term..tmp = alloca i32 
  %score = alloca i32 
  %relationship_factor = alloca i32 
  %distance_penalty = alloca i32 
  store i32 %candidate_id.tmp, ptr %candidate_id..tmp
  store i32 %voter_id.tmp, ptr %voter_id..tmp
  store i32 %candidate_term.tmp, ptr %candidate_term..tmp
  store i32 %current_term.tmp, ptr %current_term..tmp
  %rcc.tmp.5 = load i32, ptr %candidate_term..tmp
  %rcc.tmp.6 = mul i32 %rcc.tmp.5, 100
  store i32 %rcc.tmp.6, ptr %score
  %rcc.tmp.8 = load i32, ptr %score
  %rcc.tmp.9 = load i32, ptr %candidate_id..tmp
  %rcc.tmp.10 = sub i32 %rcc.tmp.8, %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %score
  %rcc.tmp.12 = load i32, ptr %voter_id..tmp
  %rcc.tmp.13 = mul i32 %rcc.tmp.12, 7
  %rcc.tmp.14 = load i32, ptr %candidate_id..tmp
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 11
  %rcc.tmp.16 = add i32 %rcc.tmp.13, %rcc.tmp.15
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 50
  store i32 %rcc.tmp.17, ptr %relationship_factor
  %rcc.tmp.19 = load i32, ptr %score
  %rcc.tmp.20 = load i32, ptr %relationship_factor
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %score
  %rcc.tmp.23 = load i32, ptr %voter_id..tmp
  %rcc.tmp.24 = load i32, ptr %candidate_id..tmp
  %rcc.tmp.25 = sub i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = call i32 @abs.(i32 %rcc.tmp.25)
  %rcc.tmp.27 = mul i32 %rcc.tmp.26, 5
  store i32 %rcc.tmp.27, ptr %distance_penalty
  %rcc.tmp.29 = load i32, ptr %score
  %rcc.tmp.30 = load i32, ptr %distance_penalty
  %rcc.tmp.31 = sub i32 %rcc.tmp.29, %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %score
  %rcc.tmp.33 = load i32, ptr %score
  ret i32 %rcc.tmp.33
}
define i1 @performLogReplication.(i32 %leader_id.tmp, i32 %node_count.tmp, [7 x [100 x i32]]* %node_logs.tmp, [7 x i32]* %log_lengths.tmp) {
entry:
  %leader_id..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %node_logs..tmp = alloca [7 x [100 x i32]]* 
  %log_lengths..tmp = alloca [7 x i32]* 
  %new_entry = alloca i32 
  %ack_count = alloca i32 
  %follower = alloca i32 
  %success = alloca i1 
  %majority_threshold = alloca i32 
  store i32 %leader_id.tmp, ptr %leader_id..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [100 x i32]]* %node_logs.tmp, ptr %node_logs..tmp
  store [7 x i32]* %log_lengths.tmp, ptr %log_lengths..tmp
  %rcc.tmp.5 = load i32, ptr %leader_id..tmp
  %rcc.tmp.6 = load i32, ptr %leader_id..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.9 = getelementptr [7 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = call i32 @generateLogEntry.(i32 %rcc.tmp.5, i32 %rcc.tmp.10)
  store i32 %rcc.tmp.11, ptr %new_entry
  %rcc.tmp.13 = load i32, ptr %leader_id..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.16 = getelementptr [7 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 100
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %leader_id..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.23 = getelementptr [7 x [100 x i32]], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %leader_id..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.27 = getelementptr [7 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [100 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %new_entry
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %leader_id..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.36 = getelementptr [7 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %leader_id..tmp
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.40 = getelementptr [7 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %rcc.tmp.36
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %ack_count
  store i32 0, ptr %follower
  br label %while.cond
while.cond:
  %rcc.tmp.49 = load i32, ptr %follower
  %rcc.tmp.50 = load i32, ptr %node_count..tmp
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.49, %rcc.tmp.50
  br i1 %rcc.tmp.51, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.54 = load i32, ptr %follower
  %rcc.tmp.55 = load i32, ptr %leader_id..tmp
  %rcc.tmp.56 = icmp ne i32 %rcc.tmp.54, %rcc.tmp.55
  br i1 %rcc.tmp.56, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.58 = load i32, ptr %leader_id..tmp
  %rcc.tmp.59 = load i32, ptr %follower
  %rcc.tmp.60 = load i32, ptr %new_entry
  %rcc.tmp.61 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.62 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.63 = call i1 @replicateToFollower.(i32 %rcc.tmp.58, i32 %rcc.tmp.59, i32 %rcc.tmp.60, [7 x [100 x i32]]* %rcc.tmp.61, [7 x i32]* %rcc.tmp.62)
  store i1 %rcc.tmp.63, ptr %success
  %rcc.tmp.65 = load i1, ptr %success
  br i1 %rcc.tmp.65, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.67 = load i32, ptr %ack_count
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %ack_count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.74 = load i32, ptr %follower
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %follower
  br label %while.cond
while.end:
  %rcc.tmp.78 = load i32, ptr %node_count..tmp
  %rcc.tmp.79 = sdiv i32 %rcc.tmp.78, 2
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %majority_threshold
  %rcc.tmp.82 = load i32, ptr %ack_count
  %rcc.tmp.83 = load i32, ptr %majority_threshold
  %rcc.tmp.84 = icmp sge i32 %rcc.tmp.82, %rcc.tmp.83
  ret i1 %rcc.tmp.84
}
define i1 @replicateToFollower.(i32 %leader_id.tmp, i32 %follower_id.tmp, i32 %entry.tmp, [7 x [100 x i32]]* %node_logs.tmp, [7 x i32]* %log_lengths.tmp) {
entry:
  %leader_id..tmp = alloca i32 
  %follower_id..tmp = alloca i32 
  %entry..tmp = alloca i32 
  %node_logs..tmp = alloca [7 x [100 x i32]]* 
  %log_lengths..tmp = alloca [7 x i32]* 
  %network_success = alloca i1 
  %consistency_ok = alloca i1 
  store i32 %leader_id.tmp, ptr %leader_id..tmp
  store i32 %follower_id.tmp, ptr %follower_id..tmp
  store i32 %entry.tmp, ptr %entry..tmp
  store [7 x [100 x i32]]* %node_logs.tmp, ptr %node_logs..tmp
  store [7 x i32]* %log_lengths.tmp, ptr %log_lengths..tmp
  %rcc.tmp.6 = load i32, ptr %leader_id..tmp
  %rcc.tmp.7 = load i32, ptr %follower_id..tmp
  %rcc.tmp.8 = call i1 @simulateNetworkReliability.(i32 %rcc.tmp.6, i32 %rcc.tmp.7)
  store i1 %rcc.tmp.8, ptr %network_success
  %rcc.tmp.10 = load i1, ptr %network_success
  %rcc.tmp.11 = xor i1 %rcc.tmp.10, true
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %leader_id..tmp
  %rcc.tmp.16 = load i32, ptr %follower_id..tmp
  %rcc.tmp.17 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.18 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.19 = call i1 @checkLogConsistency.(i32 %rcc.tmp.15, i32 %rcc.tmp.16, [7 x [100 x i32]]* %rcc.tmp.17, [7 x i32]* %rcc.tmp.18)
  store i1 %rcc.tmp.19, ptr %consistency_ok
  %rcc.tmp.21 = load i1, ptr %consistency_ok
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %follower_id..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.26 = getelementptr [7 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %if.merge], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.32 = load i32, ptr %follower_id..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.35 = getelementptr [7 x [100 x i32]], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %follower_id..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.39 = getelementptr [7 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %entry..tmp
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %follower_id..tmp
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.48 = getelementptr [7 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %follower_id..tmp
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.52 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.48
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret i1 0
}
define void @performByzantineFaultToleranceTest.(i32 %node_count.tmp, i32 %byzantine_tolerance.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %byzantine_tolerance..tmp = alloca i32 
  %byzantine_nodes = alloca [7 x i1] 
  %byzantine_count = alloca i32 
  %i = alloca i32 
  %node_values = alloca [7 x i32] 
  %node_signatures = alloca [7 x [10 x i32]] 
  %message_hashes = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %consensus_proposals = alloca [7 x [3 x i32]] 
  %agreement_round = alloca i32 
  %proposal_success = alloca i1 
  %agreement_reached = alloca i1 
  %honest_agreement = alloca i1 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %byzantine_tolerance.tmp, ptr %byzantine_tolerance..tmp
  call void @printlnInt.(i32 25201)
  %rcc.tmp.4 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.16
  store i32 0, ptr %byzantine_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %node_count..tmp
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.25 = load i32, ptr %byzantine_count
  %rcc.tmp.26 = load i32, ptr %byzantine_tolerance..tmp
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.25, %rcc.tmp.26
  br label %sc.merge
sc.merge:
  %rcc.tmp.29 = phi i1 [0, %while.cond], [%rcc.tmp.27, %and.rhs]
  br i1 %rcc.tmp.29, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = call i1 @shouldBeByzantine.(i32 %rcc.tmp.32)
  br i1 %rcc.tmp.33, label %if.then, label %if.else
if.then:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [7 x i1], ptr %byzantine_nodes, i32 0, i32 %rcc.tmp.36
  store i1 1, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %byzantine_count
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %byzantine_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.48 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [7 x i32], ptr %node_values, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 0
  %rcc.tmp.63 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [10 x i32], ptr %rcc.tmp.62, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 1
  %rcc.tmp.84 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.90
  %rcc.tmp.92 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.92
  %rcc.tmp.94 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.96
  %rcc.tmp.98 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.100
  %rcc.tmp.102 = getelementptr [10 x i32], ptr %rcc.tmp.83, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.102
  %rcc.tmp.104 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 2
  %rcc.tmp.105 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.111
  %rcc.tmp.113 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.113
  %rcc.tmp.115 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.115
  %rcc.tmp.117 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.117
  %rcc.tmp.119 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.119
  %rcc.tmp.121 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.121
  %rcc.tmp.123 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.123
  %rcc.tmp.125 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 3
  %rcc.tmp.126 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.126
  %rcc.tmp.128 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.128
  %rcc.tmp.130 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.132
  %rcc.tmp.134 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.134
  %rcc.tmp.136 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.136
  %rcc.tmp.138 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.138
  %rcc.tmp.140 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.140
  %rcc.tmp.142 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.142
  %rcc.tmp.144 = getelementptr [10 x i32], ptr %rcc.tmp.125, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.144
  %rcc.tmp.146 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 4
  %rcc.tmp.147 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.147
  %rcc.tmp.149 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.149
  %rcc.tmp.151 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.151
  %rcc.tmp.153 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.153
  %rcc.tmp.155 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.155
  %rcc.tmp.157 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.157
  %rcc.tmp.159 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.159
  %rcc.tmp.161 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.161
  %rcc.tmp.163 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.163
  %rcc.tmp.165 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.165
  %rcc.tmp.167 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 5
  %rcc.tmp.168 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.168
  %rcc.tmp.170 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.170
  %rcc.tmp.172 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.172
  %rcc.tmp.174 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.174
  %rcc.tmp.176 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.176
  %rcc.tmp.178 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.178
  %rcc.tmp.180 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.180
  %rcc.tmp.182 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.182
  %rcc.tmp.184 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.184
  %rcc.tmp.186 = getelementptr [10 x i32], ptr %rcc.tmp.167, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.186
  %rcc.tmp.188 = getelementptr [7 x [10 x i32]], ptr %node_signatures, i32 0, i32 6
  %rcc.tmp.189 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.189
  %rcc.tmp.191 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.191
  %rcc.tmp.193 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.193
  %rcc.tmp.195 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.195
  %rcc.tmp.197 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.197
  %rcc.tmp.199 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.199
  %rcc.tmp.201 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.201
  %rcc.tmp.203 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.203
  %rcc.tmp.205 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.205
  %rcc.tmp.207 = getelementptr [10 x i32], ptr %rcc.tmp.188, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.207
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.211 = load i32, ptr %fill.idx
  %rcc.tmp.212 = icmp slt i32 %rcc.tmp.211, 100
  br i1 %rcc.tmp.212, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.214 = load i32, ptr %fill.idx
  %rcc.tmp.215 = getelementptr [100 x i32], ptr %message_hashes, i32 0, i32 %rcc.tmp.214
  store i32 0, ptr %rcc.tmp.215
  %rcc.tmp.217 = add i32 %rcc.tmp.214, 1
  store i32 %rcc.tmp.217, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.220 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 0
  %rcc.tmp.221 = getelementptr [3 x i32], ptr %rcc.tmp.220, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.221
  %rcc.tmp.223 = getelementptr [3 x i32], ptr %rcc.tmp.220, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.223
  %rcc.tmp.225 = getelementptr [3 x i32], ptr %rcc.tmp.220, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.225
  %rcc.tmp.227 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 1
  %rcc.tmp.228 = getelementptr [3 x i32], ptr %rcc.tmp.227, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.228
  %rcc.tmp.230 = getelementptr [3 x i32], ptr %rcc.tmp.227, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.230
  %rcc.tmp.232 = getelementptr [3 x i32], ptr %rcc.tmp.227, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.232
  %rcc.tmp.234 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 2
  %rcc.tmp.235 = getelementptr [3 x i32], ptr %rcc.tmp.234, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.235
  %rcc.tmp.237 = getelementptr [3 x i32], ptr %rcc.tmp.234, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.237
  %rcc.tmp.239 = getelementptr [3 x i32], ptr %rcc.tmp.234, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.239
  %rcc.tmp.241 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 3
  %rcc.tmp.242 = getelementptr [3 x i32], ptr %rcc.tmp.241, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.242
  %rcc.tmp.244 = getelementptr [3 x i32], ptr %rcc.tmp.241, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.244
  %rcc.tmp.246 = getelementptr [3 x i32], ptr %rcc.tmp.241, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.246
  %rcc.tmp.248 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 4
  %rcc.tmp.249 = getelementptr [3 x i32], ptr %rcc.tmp.248, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.249
  %rcc.tmp.251 = getelementptr [3 x i32], ptr %rcc.tmp.248, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.251
  %rcc.tmp.253 = getelementptr [3 x i32], ptr %rcc.tmp.248, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.253
  %rcc.tmp.255 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 5
  %rcc.tmp.256 = getelementptr [3 x i32], ptr %rcc.tmp.255, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.256
  %rcc.tmp.258 = getelementptr [3 x i32], ptr %rcc.tmp.255, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.258
  %rcc.tmp.260 = getelementptr [3 x i32], ptr %rcc.tmp.255, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.260
  %rcc.tmp.262 = getelementptr [7 x [3 x i32]], ptr %consensus_proposals, i32 0, i32 6
  %rcc.tmp.263 = getelementptr [3 x i32], ptr %rcc.tmp.262, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.263
  %rcc.tmp.265 = getelementptr [3 x i32], ptr %rcc.tmp.262, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.265
  %rcc.tmp.267 = getelementptr [3 x i32], ptr %rcc.tmp.262, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.267
  store i32 0, ptr %agreement_round
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.271 = load i32, ptr %agreement_round
  %rcc.tmp.272 = icmp slt i32 %rcc.tmp.271, 20
  br i1 %rcc.tmp.272, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.275 = load i32, ptr %node_count..tmp
  %rcc.tmp.276 = load i32, ptr %agreement_round
  %rcc.tmp.277 = call i1 @conductByzantineValueProposal.(i32 %rcc.tmp.275, [7 x i1]* %byzantine_nodes, [7 x i32]* %node_values, [7 x [3 x i32]]* %consensus_proposals, i32 %rcc.tmp.276)
  store i1 %rcc.tmp.277, ptr %proposal_success
  %rcc.tmp.279 = load i1, ptr %proposal_success
  br i1 %rcc.tmp.279, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.281 = load i32, ptr %node_count..tmp
  %rcc.tmp.282 = load i32, ptr %agreement_round
  %rcc.tmp.283 = call i1 @performByzantineAgreement.(i32 %rcc.tmp.281, [7 x i1]* %byzantine_nodes, [7 x [3 x i32]]* %consensus_proposals, [7 x [10 x i32]]* %node_signatures, i32 %rcc.tmp.282)
  store i1 %rcc.tmp.283, ptr %agreement_reached
  %rcc.tmp.285 = load i1, ptr %agreement_reached
  br i1 %rcc.tmp.285, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.287 = load i32, ptr %agreement_round
  %rcc.tmp.288 = add i32 25200, %rcc.tmp.287
  call void @printlnInt.(i32 %rcc.tmp.288)
  %rcc.tmp.290 = load i32, ptr %node_count..tmp
  %rcc.tmp.291 = call i1 @verifyHonestNodeAgreement.(i32 %rcc.tmp.290, [7 x i1]* %byzantine_nodes, [7 x [3 x i32]]* %consensus_proposals)
  store i1 %rcc.tmp.291, ptr %honest_agreement
  %rcc.tmp.293 = load i1, ptr %honest_agreement
  br i1 %rcc.tmp.293, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.295 = load i32, ptr %agreement_round
  %rcc.tmp.296 = add i32 25220, %rcc.tmp.295
  call void @printlnInt.(i32 %rcc.tmp.296)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.304 = load i32, ptr %agreement_round
  %rcc.tmp.305 = add i32 %rcc.tmp.304, 1
  store i32 %rcc.tmp.305, ptr %agreement_round
  br label %while.cond.2
while.end.2:
  call void @printlnInt.(i32 25299)
  ret void
}
define i1 @conductByzantineValueProposal.(i32 %node_count.tmp, [7 x i1]* %byzantine_nodes.tmp, [7 x i32]* %node_values.tmp, [7 x [3 x i32]]* %consensus_proposals.tmp, i32 %round.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %byzantine_nodes..tmp = alloca [7 x i1]* 
  %node_values..tmp = alloca [7 x i32]* 
  %consensus_proposals..tmp = alloca [7 x [3 x i32]]* 
  %round..tmp = alloca i32 
  %proposal_count = alloca i32 
  %node_id = alloca i32 
  %malicious_value1 = alloca i32 
  %malicious_value2 = alloca i32 
  %malicious_value3 = alloca i32 
  %honest_value = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i1]* %byzantine_nodes.tmp, ptr %byzantine_nodes..tmp
  store [7 x i32]* %node_values.tmp, ptr %node_values..tmp
  store [7 x [3 x i32]]* %consensus_proposals.tmp, ptr %consensus_proposals..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 0, ptr %proposal_count
  store i32 0, ptr %node_id
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %node_id
  %rcc.tmp.10 = load i32, ptr %node_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %node_id
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [7 x i1]*, ptr %byzantine_nodes..tmp
  %rcc.tmp.17 = getelementptr [7 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i1, ptr %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %node_id
  %rcc.tmp.21 = load i32, ptr %round..tmp
  %rcc.tmp.22 = call i32 @generateMaliciousValue.(i32 %rcc.tmp.20, i32 %rcc.tmp.21, i32 1)
  store i32 %rcc.tmp.22, ptr %malicious_value1
  %rcc.tmp.24 = load i32, ptr %node_id
  %rcc.tmp.25 = load i32, ptr %round..tmp
  %rcc.tmp.26 = call i32 @generateMaliciousValue.(i32 %rcc.tmp.24, i32 %rcc.tmp.25, i32 2)
  store i32 %rcc.tmp.26, ptr %malicious_value2
  %rcc.tmp.28 = load i32, ptr %node_id
  %rcc.tmp.29 = load i32, ptr %round..tmp
  %rcc.tmp.30 = call i32 @generateMaliciousValue.(i32 %rcc.tmp.28, i32 %rcc.tmp.29, i32 3)
  store i32 %rcc.tmp.30, ptr %malicious_value3
  %rcc.tmp.32 = load i32, ptr %node_id
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.35 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = getelementptr [3 x i32], ptr %rcc.tmp.35, i32 0, i32 0
  %rcc.tmp.37 = load i32, ptr %malicious_value1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %node_id
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.42 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = getelementptr [3 x i32], ptr %rcc.tmp.42, i32 0, i32 1
  %rcc.tmp.44 = load i32, ptr %malicious_value2
  store i32 %rcc.tmp.44, ptr %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %node_id
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.49 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = getelementptr [3 x i32], ptr %rcc.tmp.49, i32 0, i32 2
  %rcc.tmp.51 = load i32, ptr %malicious_value3
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %node_id
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [7 x i32]*, ptr %node_values..tmp
  %rcc.tmp.56 = getelementptr [7 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %malicious_value1
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  br label %if.merge
if.else:
  %rcc.tmp.60 = load i32, ptr %node_id
  %rcc.tmp.61 = load i32, ptr %round..tmp
  %rcc.tmp.62 = call i32 @generateHonestValue.(i32 %rcc.tmp.60, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %honest_value
  %rcc.tmp.64 = load i32, ptr %node_id
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.67 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = getelementptr [3 x i32], ptr %rcc.tmp.67, i32 0, i32 0
  %rcc.tmp.69 = load i32, ptr %honest_value
  store i32 %rcc.tmp.69, ptr %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %node_id
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.74 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = getelementptr [3 x i32], ptr %rcc.tmp.74, i32 0, i32 1
  %rcc.tmp.76 = load i32, ptr %honest_value
  store i32 %rcc.tmp.76, ptr %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %node_id
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.81 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = getelementptr [3 x i32], ptr %rcc.tmp.81, i32 0, i32 2
  %rcc.tmp.83 = load i32, ptr %honest_value
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %node_id
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = load [7 x i32]*, ptr %node_values..tmp
  %rcc.tmp.88 = getelementptr [7 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = load i32, ptr %honest_value
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  br label %if.merge
if.merge:
  %rcc.tmp.92 = load i32, ptr %proposal_count
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %proposal_count
  %rcc.tmp.95 = load i32, ptr %node_id
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %node_id
  br label %while.cond
while.end:
  %rcc.tmp.99 = load i32, ptr %proposal_count
  %rcc.tmp.100 = load i32, ptr %node_count..tmp
  %rcc.tmp.101 = icmp sge i32 %rcc.tmp.99, %rcc.tmp.100
  ret i1 %rcc.tmp.101
}
define i1 @performByzantineAgreement.(i32 %node_count.tmp, [7 x i1]* %byzantine_nodes.tmp, [7 x [3 x i32]]* %consensus_proposals.tmp, [7 x [10 x i32]]* %node_signatures.tmp, i32 %round.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %byzantine_nodes..tmp = alloca [7 x i1]* 
  %consensus_proposals..tmp = alloca [7 x [3 x i32]]* 
  %node_signatures..tmp = alloca [7 x [10 x i32]]* 
  %round..tmp = alloca i32 
  %signature_matrix = alloca [7 x [7 x i32]] 
  %signer = alloca i32 
  %proposal_owner = alloca i32 
  %signature = alloca i32 
  %valid_proposals = alloca [7 x i1] 
  %valid_count = alloca i32 
  %proposal_id = alloca i32 
  %signature_count = alloca i32 
  %required_signatures = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i1]* %byzantine_nodes.tmp, ptr %byzantine_nodes..tmp
  store [7 x [3 x i32]]* %consensus_proposals.tmp, ptr %consensus_proposals..tmp
  store [7 x [10 x i32]]* %node_signatures.tmp, ptr %node_signatures..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.6 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 0
  %rcc.tmp.7 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [7 x i32], ptr %rcc.tmp.6, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 1
  %rcc.tmp.22 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 2
  %rcc.tmp.37 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [7 x i32], ptr %rcc.tmp.36, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 3
  %rcc.tmp.52 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [7 x i32], ptr %rcc.tmp.51, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 4
  %rcc.tmp.67 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [7 x i32], ptr %rcc.tmp.66, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 5
  %rcc.tmp.82 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.90
  %rcc.tmp.92 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.92
  %rcc.tmp.94 = getelementptr [7 x i32], ptr %rcc.tmp.81, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 6
  %rcc.tmp.97 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.99
  %rcc.tmp.101 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.101
  %rcc.tmp.103 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.103
  %rcc.tmp.105 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [7 x i32], ptr %rcc.tmp.96, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.109
  store i32 0, ptr %signer
  br label %while.cond
while.cond:
  %rcc.tmp.113 = load i32, ptr %signer
  %rcc.tmp.114 = load i32, ptr %node_count..tmp
  %rcc.tmp.115 = icmp slt i32 %rcc.tmp.113, %rcc.tmp.114
  br i1 %rcc.tmp.115, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %proposal_owner
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.120 = load i32, ptr %proposal_owner
  %rcc.tmp.121 = load i32, ptr %node_count..tmp
  %rcc.tmp.122 = icmp slt i32 %rcc.tmp.120, %rcc.tmp.121
  br i1 %rcc.tmp.122, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.125 = load i32, ptr %signer
  %rcc.tmp.126 = load i32, ptr %proposal_owner
  %rcc.tmp.127 = load i32, ptr %proposal_owner
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.130 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = getelementptr [3 x i32], ptr %rcc.tmp.130, i32 0, i32 0
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %round..tmp
  %rcc.tmp.134 = call i32 @generateSignature.(i32 %rcc.tmp.125, i32 %rcc.tmp.126, i32 %rcc.tmp.132, i32 %rcc.tmp.133)
  store i32 %rcc.tmp.134, ptr %signature
  %rcc.tmp.136 = load i32, ptr %signer
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = load [7 x i1]*, ptr %byzantine_nodes..tmp
  %rcc.tmp.139 = getelementptr [7 x i1], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.140 = load i1, ptr %rcc.tmp.139
  br i1 %rcc.tmp.140, label %if.then, label %if.else
if.then:
  %rcc.tmp.142 = load i32, ptr %signer
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %proposal_owner
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [7 x i32], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %signature
  %rcc.tmp.149 = load i32, ptr %signer
  %rcc.tmp.150 = load i32, ptr %proposal_owner
  %rcc.tmp.151 = call i32 @corruptSignature.(i32 %rcc.tmp.148, i32 %rcc.tmp.149, i32 %rcc.tmp.150)
  store i32 %rcc.tmp.151, ptr %rcc.tmp.147
  br label %if.merge
if.else:
  %rcc.tmp.154 = load i32, ptr %signer
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [7 x [7 x i32]], ptr %signature_matrix, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load i32, ptr %proposal_owner
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [7 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %signature
  store i32 %rcc.tmp.160, ptr %rcc.tmp.159
  br label %if.merge
if.merge:
  %rcc.tmp.163 = load i32, ptr %proposal_owner
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 1
  store i32 %rcc.tmp.164, ptr %proposal_owner
  br label %while.cond.2
while.end.2:
  %rcc.tmp.167 = load i32, ptr %signer
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  store i32 %rcc.tmp.168, ptr %signer
  br label %while.cond
while.end:
  %rcc.tmp.171 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.171
  %rcc.tmp.173 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.173
  %rcc.tmp.175 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.175
  %rcc.tmp.177 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.177
  %rcc.tmp.179 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.179
  %rcc.tmp.181 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.181
  %rcc.tmp.183 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.183
  store i32 0, ptr %valid_count
  store i32 0, ptr %proposal_id
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.188 = load i32, ptr %proposal_id
  %rcc.tmp.189 = load i32, ptr %node_count..tmp
  %rcc.tmp.190 = icmp slt i32 %rcc.tmp.188, %rcc.tmp.189
  br i1 %rcc.tmp.190, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.193 = load i32, ptr %proposal_id
  %rcc.tmp.194 = load i32, ptr %node_count..tmp
  %rcc.tmp.195 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.196 = load [7 x i1]*, ptr %byzantine_nodes..tmp
  %rcc.tmp.197 = call i32 @countValidSignatures.(i32 %rcc.tmp.193, i32 %rcc.tmp.194, [7 x [7 x i32]]* %signature_matrix, [7 x [3 x i32]]* %rcc.tmp.195, [7 x i1]* %rcc.tmp.196)
  store i32 %rcc.tmp.197, ptr %signature_count
  %rcc.tmp.199 = load i32, ptr %node_count..tmp
  %rcc.tmp.200 = load i32, ptr %node_count..tmp
  %rcc.tmp.201 = sub i32 %rcc.tmp.200, 1
  %rcc.tmp.202 = sdiv i32 %rcc.tmp.201, 3
  %rcc.tmp.203 = sub i32 %rcc.tmp.199, %rcc.tmp.202
  store i32 %rcc.tmp.203, ptr %required_signatures
  %rcc.tmp.205 = load i32, ptr %signature_count
  %rcc.tmp.206 = load i32, ptr %required_signatures
  %rcc.tmp.207 = icmp sge i32 %rcc.tmp.205, %rcc.tmp.206
  br i1 %rcc.tmp.207, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.209 = load i32, ptr %proposal_id
  %rcc.tmp.210 = add i32 %rcc.tmp.209, 0
  %rcc.tmp.211 = getelementptr [7 x i1], ptr %valid_proposals, i32 0, i32 %rcc.tmp.210
  store i1 1, ptr %rcc.tmp.211
  %rcc.tmp.213 = load i32, ptr %valid_count
  %rcc.tmp.214 = add i32 %rcc.tmp.213, 1
  store i32 %rcc.tmp.214, ptr %valid_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.218 = load i32, ptr %proposal_id
  %rcc.tmp.219 = add i32 %rcc.tmp.218, 1
  store i32 %rcc.tmp.219, ptr %proposal_id
  br label %while.cond.3
while.end.3:
  %rcc.tmp.222 = load i32, ptr %node_count..tmp
  %rcc.tmp.223 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.224 = call i1 @checkProposalAgreement.(i32 %rcc.tmp.222, [7 x i1]* %valid_proposals, [7 x [3 x i32]]* %rcc.tmp.223)
  ret i1 %rcc.tmp.224
}
define void @performNetworkPartitionTest.(i32 %node_count.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity = alloca [7 x [7 x i1]] 
  %partition_groups = alloca [7 x i32] 
  %partition_scenario = alloca i32 
  %partition_consensus = alloca i1 
  %recovery_success = alloca i1 
  store i32 %node_count.tmp, ptr %node_count..tmp
  call void @printlnInt.(i32 25301)
  %rcc.tmp.3 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 0
  %rcc.tmp.4 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [7 x i1], ptr %rcc.tmp.3, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 1
  %rcc.tmp.19 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [7 x i1], ptr %rcc.tmp.18, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 2
  %rcc.tmp.34 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.36
  %rcc.tmp.38 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [7 x i1], ptr %rcc.tmp.33, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 3
  %rcc.tmp.49 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [7 x i1], ptr %rcc.tmp.48, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 4
  %rcc.tmp.64 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.66
  %rcc.tmp.68 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [7 x i1], ptr %rcc.tmp.63, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 5
  %rcc.tmp.79 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [7 x i1], ptr %rcc.tmp.78, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [7 x [7 x i1]], ptr %network_connectivity, i32 0, i32 6
  %rcc.tmp.94 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 1
  store i1 1, ptr %rcc.tmp.96
  %rcc.tmp.98 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 2
  store i1 1, ptr %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 3
  store i1 1, ptr %rcc.tmp.100
  %rcc.tmp.102 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 4
  store i1 1, ptr %rcc.tmp.102
  %rcc.tmp.104 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 5
  store i1 1, ptr %rcc.tmp.104
  %rcc.tmp.106 = getelementptr [7 x i1], ptr %rcc.tmp.93, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.106
  %rcc.tmp.108 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.108
  %rcc.tmp.110 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.110
  %rcc.tmp.112 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.114
  %rcc.tmp.116 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.116
  %rcc.tmp.118 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.118
  %rcc.tmp.120 = getelementptr [7 x i32], ptr %partition_groups, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.120
  store i32 0, ptr %partition_scenario
  br label %while.cond
while.cond:
  %rcc.tmp.124 = load i32, ptr %partition_scenario
  %rcc.tmp.125 = icmp slt i32 %rcc.tmp.124, 10
  br i1 %rcc.tmp.125, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.128 = load i32, ptr %node_count..tmp
  %rcc.tmp.129 = load i32, ptr %partition_scenario
  call void @createNetworkPartition.(i32 %rcc.tmp.128, [7 x [7 x i1]]* %network_connectivity, [7 x i32]* %partition_groups, i32 %rcc.tmp.129)
  %rcc.tmp.131 = load i32, ptr %node_count..tmp
  %rcc.tmp.132 = call i1 @testConsensusUnderPartition.(i32 %rcc.tmp.131, [7 x [7 x i1]]* %network_connectivity, [7 x i32]* %partition_groups)
  store i1 %rcc.tmp.132, ptr %partition_consensus
  %rcc.tmp.134 = load i1, ptr %partition_consensus
  br i1 %rcc.tmp.134, label %if.then, label %if.else
if.then:
  %rcc.tmp.136 = load i32, ptr %partition_scenario
  %rcc.tmp.137 = add i32 25300, %rcc.tmp.136
  call void @printlnInt.(i32 %rcc.tmp.137)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.141 = load i32, ptr %node_count..tmp
  call void @healNetworkPartition.(i32 %rcc.tmp.141, [7 x [7 x i1]]* %network_connectivity, [7 x i32]* %partition_groups)
  %rcc.tmp.143 = load i32, ptr %node_count..tmp
  %rcc.tmp.144 = call i1 @testPartitionRecovery.(i32 %rcc.tmp.143, [7 x [7 x i1]]* %network_connectivity)
  store i1 %rcc.tmp.144, ptr %recovery_success
  %rcc.tmp.146 = load i1, ptr %recovery_success
  br i1 %rcc.tmp.146, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.148 = load i32, ptr %partition_scenario
  %rcc.tmp.149 = add i32 25310, %rcc.tmp.148
  call void @printlnInt.(i32 %rcc.tmp.149)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.153 = load i32, ptr %partition_scenario
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %partition_scenario
  br label %while.cond
while.end:
  call void @printlnInt.(i32 25399)
  ret void
}
define void @createNetworkPartition.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp, i32 %scenario.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %scenario..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  store i32 %scenario.tmp, ptr %scenario..tmp
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
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %node_count..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.22 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [7 x i1], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  store i1 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i32, ptr %scenario..tmp
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 3
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.36, 0
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %node_count..tmp
  %rcc.tmp.40 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.41 = load [7 x i32]*, ptr %partition_groups..tmp
  call void @createBinaryPartition.(i32 %rcc.tmp.39, [7 x [7 x i1]]* %rcc.tmp.40, [7 x i32]* %rcc.tmp.41)
  br label %if.merge
if.else:
  %rcc.tmp.44 = load i32, ptr %scenario..tmp
  %rcc.tmp.45 = srem i32 %rcc.tmp.44, 3
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.45, 1
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.48 = load i32, ptr %node_count..tmp
  %rcc.tmp.49 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.50 = load [7 x i32]*, ptr %partition_groups..tmp
  call void @createAsymmetricPartition.(i32 %rcc.tmp.48, [7 x [7 x i1]]* %rcc.tmp.49, [7 x i32]* %rcc.tmp.50)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.53 = load i32, ptr %node_count..tmp
  %rcc.tmp.54 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.55 = load [7 x i32]*, ptr %partition_groups..tmp
  call void @createMultiwayPartition.(i32 %rcc.tmp.53, [7 x [7 x i1]]* %rcc.tmp.54, [7 x i32]* %rcc.tmp.55)
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret void
}
define void @performLeaderElectionTest.(i32 %node_count.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_priorities = alloca [7 x i32] 
  %node_health_status = alloca [7 x i32] 
  %election_timeouts = alloca [7 x i32] 
  %failure_detectors = alloca [7 x [7 x i1]] 
  %i = alloca i32 
  %election_round = alloca i32 
  %elected_leader = alloca i32 
  %leadership_stable = alloca i1 
  store i32 %node_count.tmp, ptr %node_count..tmp
  call void @printlnInt.(i32 25401)
  %rcc.tmp.3 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 0
  store i32 100, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 1
  store i32 100, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 2
  store i32 100, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 3
  store i32 100, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 4
  store i32 100, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 5
  store i32 100, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [7 x i32], ptr %node_health_status, i32 0, i32 6
  store i32 100, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [7 x i32], ptr %election_timeouts, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 0
  %rcc.tmp.46 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [7 x i1], ptr %rcc.tmp.45, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 1
  %rcc.tmp.61 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [7 x i1], ptr %rcc.tmp.60, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 2
  %rcc.tmp.76 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.78
  %rcc.tmp.80 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.80
  %rcc.tmp.82 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [7 x i1], ptr %rcc.tmp.75, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 3
  %rcc.tmp.91 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.99
  %rcc.tmp.101 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.101
  %rcc.tmp.103 = getelementptr [7 x i1], ptr %rcc.tmp.90, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.103
  %rcc.tmp.105 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 4
  %rcc.tmp.106 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.106
  %rcc.tmp.108 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.108
  %rcc.tmp.110 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.110
  %rcc.tmp.112 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.114
  %rcc.tmp.116 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.116
  %rcc.tmp.118 = getelementptr [7 x i1], ptr %rcc.tmp.105, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.118
  %rcc.tmp.120 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 5
  %rcc.tmp.121 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.121
  %rcc.tmp.123 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.123
  %rcc.tmp.125 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.125
  %rcc.tmp.127 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.127
  %rcc.tmp.129 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.129
  %rcc.tmp.131 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.131
  %rcc.tmp.133 = getelementptr [7 x i1], ptr %rcc.tmp.120, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.133
  %rcc.tmp.135 = getelementptr [7 x [7 x i1]], ptr %failure_detectors, i32 0, i32 6
  %rcc.tmp.136 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.136
  %rcc.tmp.138 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.138
  %rcc.tmp.140 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.140
  %rcc.tmp.142 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.142
  %rcc.tmp.144 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.144
  %rcc.tmp.146 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.146
  %rcc.tmp.148 = getelementptr [7 x i1], ptr %rcc.tmp.135, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.148
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = load i32, ptr %node_count..tmp
  %rcc.tmp.154 = icmp slt i32 %rcc.tmp.152, %rcc.tmp.153
  br i1 %rcc.tmp.154, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.157 = load i32, ptr %i
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [7 x i32], ptr %node_priorities, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = call i32 @generateNodePriority.(i32 %rcc.tmp.160)
  store i32 %rcc.tmp.161, ptr %rcc.tmp.159
  %rcc.tmp.163 = load i32, ptr %i
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 1
  store i32 %rcc.tmp.164, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %election_round
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.169 = load i32, ptr %election_round
  %rcc.tmp.170 = icmp slt i32 %rcc.tmp.169, 15
  br i1 %rcc.tmp.170, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.173 = load i32, ptr %node_count..tmp
  %rcc.tmp.174 = load i32, ptr %election_round
  call void @simulateNodeFailures.(i32 %rcc.tmp.173, [7 x i32]* %node_health_status, i32 %rcc.tmp.174)
  %rcc.tmp.176 = load i32, ptr %node_count..tmp
  call void @updateFailureDetectors.(i32 %rcc.tmp.176, [7 x i32]* %node_health_status, [7 x [7 x i1]]* %failure_detectors)
  %rcc.tmp.178 = load i32, ptr %node_count..tmp
  %rcc.tmp.179 = call i32 @conductFailureAwareElection.(i32 %rcc.tmp.178, [7 x i32]* %node_priorities, [7 x i32]* %node_health_status, [7 x [7 x i1]]* %failure_detectors, [7 x i32]* %election_timeouts)
  store i32 %rcc.tmp.179, ptr %elected_leader
  %rcc.tmp.181 = load i32, ptr %elected_leader
  %rcc.tmp.182 = icmp sge i32 %rcc.tmp.181, 0
  br i1 %rcc.tmp.182, label %if.then, label %if.else
if.then:
  %rcc.tmp.184 = load i32, ptr %elected_leader
  %rcc.tmp.185 = add i32 25400, %rcc.tmp.184
  call void @printlnInt.(i32 %rcc.tmp.185)
  %rcc.tmp.187 = load i32, ptr %elected_leader
  %rcc.tmp.188 = load i32, ptr %node_count..tmp
  %rcc.tmp.189 = call i1 @testLeadershipStability.(i32 %rcc.tmp.187, i32 %rcc.tmp.188, [7 x i32]* %node_health_status, [7 x [7 x i1]]* %failure_detectors)
  store i1 %rcc.tmp.189, ptr %leadership_stable
  %rcc.tmp.191 = load i1, ptr %leadership_stable
  br i1 %rcc.tmp.191, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.193 = load i32, ptr %election_round
  %rcc.tmp.194 = add i32 25410, %rcc.tmp.193
  call void @printlnInt.(i32 %rcc.tmp.194)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.200 = load i32, ptr %node_count..tmp
  call void @simulateNodeRecovery.(i32 %rcc.tmp.200, [7 x i32]* %node_health_status)
  %rcc.tmp.202 = load i32, ptr %election_round
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 1
  store i32 %rcc.tmp.203, ptr %election_round
  br label %while.cond.2
while.end.2:
  call void @printlnInt.(i32 25499)
  ret void
}
define void @performAsynchronousConsensusTest.(i32 %node_count.tmp, i32 %max_rounds.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %max_rounds..tmp = alloca i32 
  %message_queue = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %queue_head = alloca i32 
  %queue_tail = alloca i32 
  %queue_size = alloca i32 
  %message_delays = alloca [1000 x i32] 
  %fill.idx.2 = alloca i32 
  %message_timestamps = alloca [1000 x i32] 
  %fill.idx.3 = alloca i32 
  %node_proposals = alloca [7 x i32] 
  %node_decisions = alloca [7 x i32] 
  %consensus_values = alloca [100 x i32] 
  %fill.idx.4 = alloca i32 
  %consensus_count = alloca i32 
  %async_round = alloca i32 
  %messages_processed = alloca i32 
  %consensus_reached = alloca i1 
  %consensus_value = alloca i32 
  %history_consistent = alloca i1 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store i32 %max_rounds.tmp, ptr %max_rounds..tmp
  call void @printlnInt.(i32 25501)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 1000
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [1000 x i32], ptr %message_queue, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %queue_head
  store i32 0, ptr %queue_tail
  store i32 0, ptr %queue_size
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.20 = load i32, ptr %fill.idx.2
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.20, 1000
  br i1 %rcc.tmp.21, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.23 = load i32, ptr %fill.idx.2
  %rcc.tmp.24 = getelementptr [1000 x i32], ptr %message_delays, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.26, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.31 = load i32, ptr %fill.idx.3
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 1000
  br i1 %rcc.tmp.32, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.34 = load i32, ptr %fill.idx.3
  %rcc.tmp.35 = getelementptr [1000 x i32], ptr %message_timestamps, i32 0, i32 %rcc.tmp.34
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.37, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.40 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [7 x i32], ptr %node_proposals, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = sub i32 0, 1
  %rcc.tmp.55 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 0
  store i32 %rcc.tmp.54, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 2
  store i32 %rcc.tmp.54, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 3
  store i32 %rcc.tmp.54, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 4
  store i32 %rcc.tmp.54, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 5
  store i32 %rcc.tmp.54, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [7 x i32], ptr %node_decisions, i32 0, i32 6
  store i32 %rcc.tmp.54, ptr %rcc.tmp.67
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.71 = load i32, ptr %fill.idx.4
  %rcc.tmp.72 = icmp slt i32 %rcc.tmp.71, 100
  br i1 %rcc.tmp.72, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.74 = load i32, ptr %fill.idx.4
  %rcc.tmp.75 = getelementptr [100 x i32], ptr %consensus_values, i32 0, i32 %rcc.tmp.74
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.77, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %consensus_count
  store i32 0, ptr %async_round
  br label %while.cond
while.cond:
  %rcc.tmp.83 = load i32, ptr %async_round
  %rcc.tmp.84 = load i32, ptr %max_rounds..tmp
  %rcc.tmp.85 = icmp slt i32 %rcc.tmp.83, %rcc.tmp.84
  br i1 %rcc.tmp.85, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.87 = load i32, ptr %consensus_count
  %rcc.tmp.88 = icmp slt i32 %rcc.tmp.87, 50
  br label %sc.merge
sc.merge:
  %rcc.tmp.90 = phi i1 [0, %while.cond], [%rcc.tmp.88, %and.rhs]
  br i1 %rcc.tmp.90, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.93 = load i32, ptr %node_count..tmp
  %rcc.tmp.94 = load i32, ptr %async_round
  call void @generateAsyncProposals.(i32 %rcc.tmp.93, [7 x i32]* %node_proposals, i32 %rcc.tmp.94)
  %rcc.tmp.96 = load i32, ptr %node_count..tmp
  %rcc.tmp.97 = load i32, ptr %async_round
  call void @enqueueProposalsWithDelays.(i32 %rcc.tmp.96, [7 x i32]* %node_proposals, [1000 x i32]* %message_queue, [1000 x i32]* %message_delays, [1000 x i32]* %message_timestamps, i32* %queue_head, i32* %queue_tail, i32* %queue_size, i32 %rcc.tmp.97)
  %rcc.tmp.99 = load i32, ptr %async_round
  %rcc.tmp.100 = call i32 @processAsyncMessages.([1000 x i32]* %message_queue, [1000 x i32]* %message_delays, [1000 x i32]* %message_timestamps, i32* %queue_head, i32* %queue_tail, i32* %queue_size, [7 x i32]* %node_decisions, i32 %rcc.tmp.99)
  store i32 %rcc.tmp.100, ptr %messages_processed
  %rcc.tmp.102 = load i32, ptr %messages_processed
  %rcc.tmp.103 = icmp sgt i32 %rcc.tmp.102, 0
  br i1 %rcc.tmp.103, label %if.then, label %if.else
if.then:
  %rcc.tmp.105 = load i32, ptr %node_count..tmp
  %rcc.tmp.106 = call i1 @checkAsyncConsensus.(i32 %rcc.tmp.105, [7 x i32]* %node_decisions)
  store i1 %rcc.tmp.106, ptr %consensus_reached
  %rcc.tmp.108 = load i1, ptr %consensus_reached
  br i1 %rcc.tmp.108, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.110 = load i32, ptr %node_count..tmp
  %rcc.tmp.111 = call i32 @extractConsensusValue.(i32 %rcc.tmp.110, [7 x i32]* %node_decisions)
  store i32 %rcc.tmp.111, ptr %consensus_value
  %rcc.tmp.113 = load i32, ptr %consensus_count
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [100 x i32], ptr %consensus_values, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %consensus_value
  store i32 %rcc.tmp.116, ptr %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %consensus_count
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %consensus_count
  %rcc.tmp.121 = load i32, ptr %consensus_count
  %rcc.tmp.122 = add i32 25500, %rcc.tmp.121
  call void @printlnInt.(i32 %rcc.tmp.122)
  %rcc.tmp.124 = load i32, ptr %node_count..tmp
  call void @resetNodeDecisions.(i32 %rcc.tmp.124, [7 x i32]* %node_decisions)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.130 = load i32, ptr %async_round
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %async_round
  br label %while.cond
while.end:
  %rcc.tmp.134 = load i32, ptr %consensus_count
  %rcc.tmp.135 = call i1 @verifyConsensusHistory.([100 x i32]* %consensus_values, i32 %rcc.tmp.134)
  store i1 %rcc.tmp.135, ptr %history_consistent
  %rcc.tmp.137 = load i1, ptr %history_consistent
  br i1 %rcc.tmp.137, label %if.then.3, label %if.else.3
if.then.3:
  call void @printlnInt.(i32 25550)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  call void @printlnInt.(i32 25599)
  ret void
}
define i32 @findMaxTerm.([7 x i32]* %terms.tmp, i32 %count.tmp) {
entry:
  %terms..tmp = alloca [7 x i32]* 
  %count..tmp = alloca i32 
  %max_term = alloca i32 
  %i = alloca i32 
  store [7 x i32]* %terms.tmp, ptr %terms..tmp
  store i32 %count.tmp, ptr %count..tmp
  store i32 0, ptr %max_term
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %count..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [7 x i32]*, ptr %terms..tmp
  %rcc.tmp.14 = getelementptr [7 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %max_term
  %rcc.tmp.17 = icmp sgt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [7 x i32]*, ptr %terms..tmp
  %rcc.tmp.22 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %max_term
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.31 = load i32, ptr %max_term
  ret i32 %rcc.tmp.31
}
define i1 @shouldBecomeCandidate.(i32 %node_id.tmp, i32 %current_state.tmp, i32 %current_term.tmp, i32 %new_term.tmp) {
entry:
  %node_id..tmp = alloca i32 
  %current_state..tmp = alloca i32 
  %current_term..tmp = alloca i32 
  %new_term..tmp = alloca i32 
  %candidacy_probability = alloca i32 
  store i32 %node_id.tmp, ptr %node_id..tmp
  store i32 %current_state.tmp, ptr %current_state..tmp
  store i32 %current_term.tmp, ptr %current_term..tmp
  store i32 %new_term.tmp, ptr %new_term..tmp
  %rcc.tmp.5 = load i32, ptr %current_state..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 2
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %node_id..tmp
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 17
  %rcc.tmp.12 = load i32, ptr %new_term..tmp
  %rcc.tmp.13 = mul i32 %rcc.tmp.12, 7
  %rcc.tmp.14 = add i32 %rcc.tmp.11, %rcc.tmp.13
  %rcc.tmp.15 = srem i32 %rcc.tmp.14, 100
  store i32 %rcc.tmp.15, ptr %candidacy_probability
  %rcc.tmp.17 = load i32, ptr %candidacy_probability
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 30
  ret i1 %rcc.tmp.18
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
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %x..tmp
  ret i32 %rcc.tmp.9
}
define i32 @generateLogEntry.(i32 %leader_id.tmp, i32 %log_position.tmp) {
entry:
  %leader_id..tmp = alloca i32 
  %log_position..tmp = alloca i32 
  store i32 %leader_id.tmp, ptr %leader_id..tmp
  store i32 %log_position.tmp, ptr %log_position..tmp
  %rcc.tmp.3 = load i32, ptr %leader_id..tmp
  %rcc.tmp.4 = mul i32 %rcc.tmp.3, 1000
  %rcc.tmp.5 = load i32, ptr %log_position..tmp
  %rcc.tmp.6 = mul i32 %rcc.tmp.5, 10
  %rcc.tmp.7 = add i32 %rcc.tmp.4, %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %leader_id..tmp
  %rcc.tmp.9 = load i32, ptr %log_position..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.8, %rcc.tmp.9
  %rcc.tmp.11 = srem i32 %rcc.tmp.10, 7
  %rcc.tmp.12 = add i32 %rcc.tmp.7, %rcc.tmp.11
  ret i32 %rcc.tmp.12
}
define i1 @simulateNetworkReliability.(i32 %from_node.tmp, i32 %to_node.tmp) {
entry:
  %from_node..tmp = alloca i32 
  %to_node..tmp = alloca i32 
  %reliability_factor = alloca i32 
  store i32 %from_node.tmp, ptr %from_node..tmp
  store i32 %to_node.tmp, ptr %to_node..tmp
  %rcc.tmp.3 = load i32, ptr %from_node..tmp
  %rcc.tmp.4 = mul i32 %rcc.tmp.3, 13
  %rcc.tmp.5 = load i32, ptr %to_node..tmp
  %rcc.tmp.6 = mul i32 %rcc.tmp.5, 19
  %rcc.tmp.7 = add i32 %rcc.tmp.4, %rcc.tmp.6
  %rcc.tmp.8 = srem i32 %rcc.tmp.7, 100
  store i32 %rcc.tmp.8, ptr %reliability_factor
  %rcc.tmp.10 = load i32, ptr %reliability_factor
  %rcc.tmp.11 = icmp sgt i32 %rcc.tmp.10, 15
  ret i1 %rcc.tmp.11
}
define i1 @checkLogConsistency.(i32 %leader_id.tmp, i32 %follower_id.tmp, [7 x [100 x i32]]* %node_logs.tmp, [7 x i32]* %log_lengths.tmp) {
entry:
  %leader_id..tmp = alloca i32 
  %follower_id..tmp = alloca i32 
  %node_logs..tmp = alloca [7 x [100 x i32]]* 
  %log_lengths..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  store i32 %leader_id.tmp, ptr %leader_id..tmp
  store i32 %follower_id.tmp, ptr %follower_id..tmp
  store [7 x [100 x i32]]* %node_logs.tmp, ptr %node_logs..tmp
  store [7 x i32]* %log_lengths.tmp, ptr %log_lengths..tmp
  %rcc.tmp.5 = load i32, ptr %follower_id..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.8 = getelementptr [7 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = load i32, ptr %leader_id..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp sgt i32 %rcc.tmp.9, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %follower_id..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.25 = getelementptr [7 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %leader_id..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.33 = getelementptr [7 x [100 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [100 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %follower_id..tmp
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.41 = getelementptr [7 x [100 x i32]], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [100 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = icmp ne i32 %rcc.tmp.37, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define i1 @verifyLogConsistency.(i32 %node_count.tmp, [7 x [100 x i32]]* %node_logs.tmp, [7 x i32]* %log_lengths.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_logs..tmp = alloca [7 x [100 x i32]]* 
  %log_lengths..tmp = alloca [7 x i32]* 
  %reference_length = alloca i32 
  %i = alloca i32 
  %log_pos = alloca i32 
  %reference_entry = alloca i32 
  %node_id = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [100 x i32]]* %node_logs.tmp, ptr %node_logs..tmp
  store [7 x i32]* %log_lengths.tmp, ptr %log_lengths..tmp
  %rcc.tmp.4 = load i32, ptr %node_count..tmp
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 1
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.10 = getelementptr [7 x i32], ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %reference_length
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = load i32, ptr %node_count..tmp
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [7 x i32]*, ptr %log_lengths..tmp
  %rcc.tmp.23 = getelementptr [7 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %reference_length
  %rcc.tmp.26 = icmp ne i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %log_pos
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.36 = load i32, ptr %log_pos
  %rcc.tmp.37 = load i32, ptr %reference_length
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.41 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.42 = getelementptr [7 x [100 x i32]], ptr %rcc.tmp.41, i32 0, i32 0
  %rcc.tmp.43 = load i32, ptr %log_pos
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %reference_entry
  store i32 1, ptr %node_id
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.50 = load i32, ptr %node_id
  %rcc.tmp.51 = load i32, ptr %node_count..tmp
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.55 = load i32, ptr %node_id
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = load [7 x [100 x i32]]*, ptr %node_logs..tmp
  %rcc.tmp.58 = getelementptr [7 x [100 x i32]], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.59 = load i32, ptr %log_pos
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = getelementptr [100 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %reference_entry
  %rcc.tmp.64 = icmp ne i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.68 = load i32, ptr %node_id
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %node_id
  br label %while.cond.3
while.end.3:
  %rcc.tmp.72 = load i32, ptr %log_pos
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %log_pos
  br label %while.cond.2
while.end.2:
  ret i1 1
}
define i1 @shouldBeByzantine.(i32 %node_id.tmp) {
entry:
  %node_id..tmp = alloca i32 
  store i32 %node_id.tmp, ptr %node_id..tmp
  %rcc.tmp.2 = load i32, ptr %node_id..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 23
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 7
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2
  ret i1 %rcc.tmp.5
}
define i32 @generateMaliciousValue.(i32 %node_id.tmp, i32 %round.tmp, i32 %variant.tmp) {
entry:
  %node_id..tmp = alloca i32 
  %round..tmp = alloca i32 
  %variant..tmp = alloca i32 
  store i32 %node_id.tmp, ptr %node_id..tmp
  store i32 %round.tmp, ptr %round..tmp
  store i32 %variant.tmp, ptr %variant..tmp
  %rcc.tmp.4 = load i32, ptr %node_id..tmp
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 100
  %rcc.tmp.6 = load i32, ptr %round..tmp
  %rcc.tmp.7 = mul i32 %rcc.tmp.6, 10
  %rcc.tmp.8 = add i32 %rcc.tmp.5, %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %variant..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.8, %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 9999
  ret i32 %rcc.tmp.11
}
define i32 @generateHonestValue.(i32 %node_id.tmp, i32 %round.tmp) {
entry:
  %node_id..tmp = alloca i32 
  %round..tmp = alloca i32 
  store i32 %node_id.tmp, ptr %node_id..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.3 = load i32, ptr %round..tmp
  %rcc.tmp.4 = mul i32 %rcc.tmp.3, 42
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 1000
  ret i32 %rcc.tmp.5
}
define i32 @generateSignature.(i32 %signer.tmp, i32 %proposal_owner.tmp, i32 %value.tmp, i32 %round.tmp) {
entry:
  %signer..tmp = alloca i32 
  %proposal_owner..tmp = alloca i32 
  %value..tmp = alloca i32 
  %round..tmp = alloca i32 
  store i32 %signer.tmp, ptr %signer..tmp
  store i32 %proposal_owner.tmp, ptr %proposal_owner..tmp
  store i32 %value.tmp, ptr %value..tmp
  store i32 %round.tmp, ptr %round..tmp
  %rcc.tmp.5 = load i32, ptr %signer..tmp
  %rcc.tmp.6 = mul i32 %rcc.tmp.5, 1000
  %rcc.tmp.7 = load i32, ptr %proposal_owner..tmp
  %rcc.tmp.8 = mul i32 %rcc.tmp.7, 100
  %rcc.tmp.9 = add i32 %rcc.tmp.6, %rcc.tmp.8
  %rcc.tmp.10 = load i32, ptr %value..tmp
  %rcc.tmp.11 = srem i32 %rcc.tmp.10, 100
  %rcc.tmp.12 = add i32 %rcc.tmp.9, %rcc.tmp.11
  %rcc.tmp.13 = load i32, ptr %round..tmp
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 10
  %rcc.tmp.15 = add i32 %rcc.tmp.12, %rcc.tmp.14
  ret i32 %rcc.tmp.15
}
define i32 @corruptSignature.(i32 %original_signature.tmp, i32 %signer.tmp, i32 %target.tmp) {
entry:
  %original_signature..tmp = alloca i32 
  %signer..tmp = alloca i32 
  %target..tmp = alloca i32 
  %corruption_factor = alloca i32 
  store i32 %original_signature.tmp, ptr %original_signature..tmp
  store i32 %signer.tmp, ptr %signer..tmp
  store i32 %target.tmp, ptr %target..tmp
  %rcc.tmp.4 = load i32, ptr %signer..tmp
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 7
  %rcc.tmp.6 = load i32, ptr %target..tmp
  %rcc.tmp.7 = mul i32 %rcc.tmp.6, 11
  %rcc.tmp.8 = add i32 %rcc.tmp.5, %rcc.tmp.7
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 1000
  store i32 %rcc.tmp.9, ptr %corruption_factor
  %rcc.tmp.11 = load i32, ptr %original_signature..tmp
  %rcc.tmp.12 = load i32, ptr %corruption_factor
  %rcc.tmp.13 = add i32 %rcc.tmp.11, %rcc.tmp.12
  ret i32 %rcc.tmp.13
}
define i32 @countValidSignatures.(i32 %proposal_id.tmp, i32 %node_count.tmp, [7 x [7 x i32]]* %signature_matrix.tmp, [7 x [3 x i32]]* %consensus_proposals.tmp, [7 x i1]* %byzantine_nodes.tmp) {
entry:
  %proposal_id..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %signature_matrix..tmp = alloca [7 x [7 x i32]]* 
  %consensus_proposals..tmp = alloca [7 x [3 x i32]]* 
  %byzantine_nodes..tmp = alloca [7 x i1]* 
  %valid_signatures = alloca i32 
  %signer = alloca i32 
  %expected_signature = alloca i32 
  %signature_valid = alloca i1 
  store i32 %proposal_id.tmp, ptr %proposal_id..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i32]]* %signature_matrix.tmp, ptr %signature_matrix..tmp
  store [7 x [3 x i32]]* %consensus_proposals.tmp, ptr %consensus_proposals..tmp
  store [7 x i1]* %byzantine_nodes.tmp, ptr %byzantine_nodes..tmp
  store i32 0, ptr %valid_signatures
  store i32 0, ptr %signer
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %signer
  %rcc.tmp.10 = load i32, ptr %node_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %signer
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [7 x i1]*, ptr %byzantine_nodes..tmp
  %rcc.tmp.17 = getelementptr [7 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i1, ptr %rcc.tmp.17
  %rcc.tmp.19 = xor i1 %rcc.tmp.18, true
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %signer
  %rcc.tmp.22 = load i32, ptr %proposal_id..tmp
  %rcc.tmp.23 = load i32, ptr %proposal_id..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.26 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = getelementptr [3 x i32], ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = call i32 @generateSignature.(i32 %rcc.tmp.21, i32 %rcc.tmp.22, i32 %rcc.tmp.28, i32 0)
  store i32 %rcc.tmp.29, ptr %expected_signature
  %rcc.tmp.31 = load i32, ptr %signer
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [7 x [7 x i32]]*, ptr %signature_matrix..tmp
  %rcc.tmp.34 = getelementptr [7 x [7 x i32]], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %proposal_id..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [7 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %expected_signature
  %rcc.tmp.40 = call i1 @verifySignature.(i32 %rcc.tmp.38, i32 %rcc.tmp.39)
  store i1 %rcc.tmp.40, ptr %signature_valid
  %rcc.tmp.42 = load i1, ptr %signature_valid
  br i1 %rcc.tmp.42, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.44 = load i32, ptr %valid_signatures
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %valid_signatures
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %signer
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %signer
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %valid_signatures
  ret i32 %rcc.tmp.55
}
define i1 @verifySignature.(i32 %received_signature.tmp, i32 %expected_signature.tmp) {
entry:
  %received_signature..tmp = alloca i32 
  %expected_signature..tmp = alloca i32 
  %difference = alloca i32 
  store i32 %received_signature.tmp, ptr %received_signature..tmp
  store i32 %expected_signature.tmp, ptr %expected_signature..tmp
  %rcc.tmp.3 = load i32, ptr %received_signature..tmp
  %rcc.tmp.4 = load i32, ptr %expected_signature..tmp
  %rcc.tmp.5 = sub i32 %rcc.tmp.3, %rcc.tmp.4
  %rcc.tmp.6 = call i32 @abs.(i32 %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %difference
  %rcc.tmp.8 = load i32, ptr %difference
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 100
  ret i1 %rcc.tmp.9
}
define i1 @checkProposalAgreement.(i32 %node_count.tmp, [7 x i1]* %valid_proposals.tmp, [7 x [3 x i32]]* %consensus_proposals.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %valid_proposals..tmp = alloca [7 x i1]* 
  %consensus_proposals..tmp = alloca [7 x [3 x i32]]* 
  %first_valid_value = alloca i32 
  %found_first = alloca i1 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i1]* %valid_proposals.tmp, ptr %valid_proposals..tmp
  store [7 x [3 x i32]]* %consensus_proposals.tmp, ptr %consensus_proposals..tmp
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %first_valid_value
  store i1 0, ptr %found_first
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %node_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [7 x i1]*, ptr %valid_proposals..tmp
  %rcc.tmp.17 = getelementptr [7 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i1, ptr %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i1, ptr %found_first
  %rcc.tmp.21 = xor i1 %rcc.tmp.20, true
  br i1 %rcc.tmp.21, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.26 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = getelementptr [3 x i32], ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %first_valid_value
  store i1 1, ptr %found_first
  br label %if.merge.2
if.else.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.35 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = getelementptr [3 x i32], ptr %rcc.tmp.35, i32 0, i32 0
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %first_valid_value
  %rcc.tmp.39 = icmp ne i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.50 = load i1, ptr %found_first
  ret i1 %rcc.tmp.50
}
define i1 @verifyHonestNodeAgreement.(i32 %node_count.tmp, [7 x i1]* %byzantine_nodes.tmp, [7 x [3 x i32]]* %consensus_proposals.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %byzantine_nodes..tmp = alloca [7 x i1]* 
  %consensus_proposals..tmp = alloca [7 x [3 x i32]]* 
  %honest_value = alloca i32 
  %found_honest_value = alloca i1 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i1]* %byzantine_nodes.tmp, ptr %byzantine_nodes..tmp
  store [7 x [3 x i32]]* %consensus_proposals.tmp, ptr %consensus_proposals..tmp
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %honest_value
  store i1 0, ptr %found_honest_value
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %node_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [7 x i1]*, ptr %byzantine_nodes..tmp
  %rcc.tmp.17 = getelementptr [7 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i1, ptr %rcc.tmp.17
  %rcc.tmp.19 = xor i1 %rcc.tmp.18, true
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i1, ptr %found_honest_value
  %rcc.tmp.22 = xor i1 %rcc.tmp.21, true
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.27 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = getelementptr [3 x i32], ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %honest_value
  store i1 1, ptr %found_honest_value
  br label %if.merge.2
if.else.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [7 x [3 x i32]]*, ptr %consensus_proposals..tmp
  %rcc.tmp.36 = getelementptr [7 x [3 x i32]], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [3 x i32], ptr %rcc.tmp.36, i32 0, i32 0
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %honest_value
  %rcc.tmp.40 = icmp ne i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.51 = load i1, ptr %found_honest_value
  ret i1 %rcc.tmp.51
}
define void @createBinaryPartition.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %partition_size = alloca i32 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  %rcc.tmp.4 = load i32, ptr %node_count..tmp
  %rcc.tmp.5 = sdiv i32 %rcc.tmp.4, 2
  store i32 %rcc.tmp.5, ptr %partition_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %node_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %partition_size
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.21 = getelementptr [7 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.21
  br label %if.merge
if.else:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.27 = getelementptr [7 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  store i32 1, ptr %rcc.tmp.27
  br label %if.merge
if.merge:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.34 = load i32, ptr %node_count..tmp
  %rcc.tmp.35 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.36 = load [7 x i32]*, ptr %partition_groups..tmp
  call void @updateConnectivityMatrix.(i32 %rcc.tmp.34, [7 x [7 x i1]]* %rcc.tmp.35, [7 x i32]* %rcc.tmp.36)
  ret void
}
define void @createAsymmetricPartition.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %majority_size = alloca i32 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  %rcc.tmp.4 = load i32, ptr %node_count..tmp
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 2
  %rcc.tmp.6 = sdiv i32 %rcc.tmp.5, 3
  store i32 %rcc.tmp.6, ptr %majority_size
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
  %rcc.tmp.16 = load i32, ptr %majority_size
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.22 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  store i32 0, ptr %rcc.tmp.22
  br label %if.merge
if.else:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.28 = getelementptr [7 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  store i32 1, ptr %rcc.tmp.28
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i32, ptr %node_count..tmp
  %rcc.tmp.36 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.37 = load [7 x i32]*, ptr %partition_groups..tmp
  call void @updateConnectivityMatrix.(i32 %rcc.tmp.35, [7 x [7 x i1]]* %rcc.tmp.36, [7 x i32]* %rcc.tmp.37)
  ret void
}
define void @createMultiwayPartition.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
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
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.14 = getelementptr [7 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 3
  store i32 %rcc.tmp.16, ptr %rcc.tmp.14
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.22 = load i32, ptr %node_count..tmp
  %rcc.tmp.23 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.24 = load [7 x i32]*, ptr %partition_groups..tmp
  call void @updateConnectivityMatrix.(i32 %rcc.tmp.22, [7 x [7 x i1]]* %rcc.tmp.23, [7 x i32]* %rcc.tmp.24)
  ret void
}
define void @updateConnectivityMatrix.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
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
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load i32, ptr %node_count..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %j
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.25 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [7 x i1], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  store i1 1, ptr %rcc.tmp.28
  br label %if.merge
if.else:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.34 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [7 x i1], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.41 = getelementptr [7 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.46 = getelementptr [7 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.42, %rcc.tmp.47
  store i1 %rcc.tmp.48, ptr %rcc.tmp.37
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i1 @testConsensusUnderPartition.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %max_partition_id = alloca i32 
  %partition_id = alloca i32 
  %partition_size = alloca i32 
  %internal_consensus = alloca i1 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  %rcc.tmp.4 = load i32, ptr %node_count..tmp
  %rcc.tmp.5 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.6 = call i32 @findMaxPartitionId.(i32 %rcc.tmp.4, [7 x i32]* %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %max_partition_id
  store i32 0, ptr %partition_id
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %partition_id
  %rcc.tmp.11 = load i32, ptr %max_partition_id
  %rcc.tmp.12 = icmp sle i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %node_count..tmp
  %rcc.tmp.16 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.17 = load i32, ptr %partition_id
  %rcc.tmp.18 = call i32 @countPartitionSize.(i32 %rcc.tmp.15, [7 x i32]* %rcc.tmp.16, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %partition_size
  %rcc.tmp.20 = load i32, ptr %partition_size
  %rcc.tmp.21 = icmp sgt i32 %rcc.tmp.20, 0
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load i32, ptr %node_count..tmp
  %rcc.tmp.24 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.25 = load i32, ptr %partition_id
  %rcc.tmp.26 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.27 = call i1 @testPartitionInternalConsensus.(i32 %rcc.tmp.23, [7 x i32]* %rcc.tmp.24, i32 %rcc.tmp.25, [7 x [7 x i1]]* %rcc.tmp.26)
  store i1 %rcc.tmp.27, ptr %internal_consensus
  %rcc.tmp.29 = load i1, ptr %internal_consensus
  %rcc.tmp.30 = xor i1 %rcc.tmp.29, true
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %partition_id
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %partition_id
  br label %while.cond
while.end:
  ret i1 1
}
define void @healNetworkPartition.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_groups..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
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
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.14 = getelementptr [7 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  store i32 0, ptr %rcc.tmp.14
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = load i32, ptr %node_count..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.26 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [7 x i1], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  store i1 1, ptr %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i1 @testPartitionRecovery.(i32 %node_count.tmp, [7 x [7 x i1]]* %network_connectivity.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %node_count..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %j
  %rcc.tmp.13 = load i32, ptr %node_count..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.20 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %j
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [7 x i1], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i1, ptr %rcc.tmp.23
  %rcc.tmp.25 = xor i1 %rcc.tmp.24, true
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define i32 @generateNodePriority.(i32 %node_id.tmp) {
entry:
  %node_id..tmp = alloca i32 
  store i32 %node_id.tmp, ptr %node_id..tmp
  %rcc.tmp.2 = load i32, ptr %node_id..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 147
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 73
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 1000
  ret i32 %rcc.tmp.5
}
define void @simulateNodeFailures.(i32 %node_count.tmp, [7 x i32]* %node_health_status.tmp, i32 %round.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_health_status..tmp = alloca [7 x i32]* 
  %round..tmp = alloca i32 
  %i = alloca i32 
  %failure_probability = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_health_status.tmp, ptr %node_health_status..tmp
  store i32 %round.tmp, ptr %round..tmp
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
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = mul i32 %rcc.tmp.11, 19
  %rcc.tmp.13 = load i32, ptr %round..tmp
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 7
  %rcc.tmp.15 = add i32 %rcc.tmp.12, %rcc.tmp.14
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 100
  store i32 %rcc.tmp.16, ptr %failure_probability
  %rcc.tmp.18 = load i32, ptr %failure_probability
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 20
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.24 = getelementptr [7 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.28 = getelementptr [7 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = sub i32 %rcc.tmp.29, 25
  store i32 %rcc.tmp.30, ptr %rcc.tmp.24
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.35 = getelementptr [7 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 0
  br i1 %rcc.tmp.37, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.42 = getelementptr [7 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  store i32 0, ptr %rcc.tmp.42
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @updateFailureDetectors.(i32 %node_count.tmp, [7 x i32]* %node_health_status.tmp, [7 x [7 x i1]]* %failure_detectors.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_health_status..tmp = alloca [7 x i32]* 
  %failure_detectors..tmp = alloca [7 x [7 x i1]]* 
  %detector = alloca i32 
  %target = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_health_status.tmp, ptr %node_health_status..tmp
  store [7 x [7 x i1]]* %failure_detectors.tmp, ptr %failure_detectors..tmp
  store i32 0, ptr %detector
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %detector
  %rcc.tmp.7 = load i32, ptr %node_count..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %target
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %target
  %rcc.tmp.14 = load i32, ptr %node_count..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %detector
  %rcc.tmp.19 = load i32, ptr %target
  %rcc.tmp.20 = icmp ne i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  %rcc.tmp.22 = load i32, ptr %detector
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [7 x [7 x i1]]*, ptr %failure_detectors..tmp
  %rcc.tmp.25 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %target
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [7 x i1], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %target
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.32 = getelementptr [7 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 30
  store i1 %rcc.tmp.34, ptr %rcc.tmp.28
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %target
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %target
  br label %while.cond.2
while.end.2:
  %rcc.tmp.42 = load i32, ptr %detector
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %detector
  br label %while.cond
while.end:
  ret void
}
define i32 @conductFailureAwareElection.(i32 %node_count.tmp, [7 x i32]* %node_priorities.tmp, [7 x i32]* %node_health_status.tmp, [7 x [7 x i1]]* %failure_detectors.tmp, [7 x i32]* %election_timeouts.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_priorities..tmp = alloca [7 x i32]* 
  %node_health_status..tmp = alloca [7 x i32]* 
  %failure_detectors..tmp = alloca [7 x [7 x i1]]* 
  %election_timeouts..tmp = alloca [7 x i32]* 
  %best_candidate = alloca i32 
  %best_score = alloca i32 
  %candidate = alloca i32 
  %failure_count = alloca i32 
  %health_score = alloca i32 
  %priority_score = alloca i32 
  %reliability_score = alloca i32 
  %total_score = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_priorities.tmp, ptr %node_priorities..tmp
  store [7 x i32]* %node_health_status.tmp, ptr %node_health_status..tmp
  store [7 x [7 x i1]]* %failure_detectors.tmp, ptr %failure_detectors..tmp
  store [7 x i32]* %election_timeouts.tmp, ptr %election_timeouts..tmp
  %rcc.tmp.6 = sub i32 0, 1
  store i32 %rcc.tmp.6, ptr %best_candidate
  %rcc.tmp.8 = sub i32 0, 1
  store i32 %rcc.tmp.8, ptr %best_score
  store i32 0, ptr %candidate
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %candidate
  %rcc.tmp.13 = load i32, ptr %node_count..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %candidate
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.20 = getelementptr [7 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.21, 30
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  %rcc.tmp.24 = load i32, ptr %candidate
  %rcc.tmp.25 = load i32, ptr %node_count..tmp
  %rcc.tmp.26 = load [7 x [7 x i1]]*, ptr %failure_detectors..tmp
  %rcc.tmp.27 = call i32 @countDetectedFailures.(i32 %rcc.tmp.24, i32 %rcc.tmp.25, [7 x [7 x i1]]* %rcc.tmp.26)
  store i32 %rcc.tmp.27, ptr %failure_count
  %rcc.tmp.29 = load i32, ptr %candidate
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.32 = getelementptr [7 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = mul i32 %rcc.tmp.33, 10
  store i32 %rcc.tmp.34, ptr %health_score
  %rcc.tmp.36 = load i32, ptr %candidate
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [7 x i32]*, ptr %node_priorities..tmp
  %rcc.tmp.39 = getelementptr [7 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %priority_score
  %rcc.tmp.42 = load i32, ptr %node_count..tmp
  %rcc.tmp.43 = load i32, ptr %failure_count
  %rcc.tmp.44 = sub i32 %rcc.tmp.42, %rcc.tmp.43
  %rcc.tmp.45 = mul i32 %rcc.tmp.44, 100
  store i32 %rcc.tmp.45, ptr %reliability_score
  %rcc.tmp.47 = load i32, ptr %health_score
  %rcc.tmp.48 = load i32, ptr %priority_score
  %rcc.tmp.49 = add i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %reliability_score
  %rcc.tmp.51 = add i32 %rcc.tmp.49, %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %total_score
  %rcc.tmp.53 = load i32, ptr %total_score
  %rcc.tmp.54 = load i32, ptr %best_score
  %rcc.tmp.55 = icmp sgt i32 %rcc.tmp.53, %rcc.tmp.54
  br i1 %rcc.tmp.55, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.57 = load i32, ptr %total_score
  store i32 %rcc.tmp.57, ptr %best_score
  %rcc.tmp.59 = load i32, ptr %candidate
  store i32 %rcc.tmp.59, ptr %best_candidate
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.65 = load i32, ptr %candidate
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %candidate
  br label %while.cond
while.end:
  %rcc.tmp.69 = load i32, ptr %best_candidate
  ret i32 %rcc.tmp.69
}
define i1 @testLeadershipStability.(i32 %leader_id.tmp, i32 %node_count.tmp, [7 x i32]* %node_health_status.tmp, [7 x [7 x i1]]* %failure_detectors.tmp) {
entry:
  %leader_id..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %node_health_status..tmp = alloca [7 x i32]* 
  %failure_detectors..tmp = alloca [7 x [7 x i1]]* 
  %support_count = alloca i32 
  %voter = alloca i32 
  %required_support = alloca i32 
  store i32 %leader_id.tmp, ptr %leader_id..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_health_status.tmp, ptr %node_health_status..tmp
  store [7 x [7 x i1]]* %failure_detectors.tmp, ptr %failure_detectors..tmp
  store i32 0, ptr %support_count
  store i32 0, ptr %voter
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %voter
  %rcc.tmp.9 = load i32, ptr %node_count..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %voter
  %rcc.tmp.14 = load i32, ptr %leader_id..tmp
  %rcc.tmp.15 = icmp ne i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.17 = load i32, ptr %voter
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.20 = getelementptr [7 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.21, 30
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %while.body], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %voter
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [7 x [7 x i1]]*, ptr %failure_detectors..tmp
  %rcc.tmp.29 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %leader_id..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [7 x i1], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i1, ptr %rcc.tmp.32
  %rcc.tmp.34 = xor i1 %rcc.tmp.33, true
  br i1 %rcc.tmp.34, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.36 = load i32, ptr %support_count
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %support_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.43 = load i32, ptr %voter
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %voter
  br label %while.cond
while.end:
  %rcc.tmp.47 = load i32, ptr %node_count..tmp
  %rcc.tmp.48 = sub i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = sdiv i32 %rcc.tmp.48, 2
  store i32 %rcc.tmp.49, ptr %required_support
  %rcc.tmp.51 = load i32, ptr %support_count
  %rcc.tmp.52 = load i32, ptr %required_support
  %rcc.tmp.53 = icmp sge i32 %rcc.tmp.51, %rcc.tmp.52
  ret i1 %rcc.tmp.53
}
define void @simulateNodeRecovery.(i32 %node_count.tmp, [7 x i32]* %node_health_status.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_health_status..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_health_status.tmp, ptr %node_health_status..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %node_count..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 100
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.20 = getelementptr [7 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.24 = getelementptr [7 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 15
  store i32 %rcc.tmp.26, ptr %rcc.tmp.20
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.31 = getelementptr [7 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp sgt i32 %rcc.tmp.32, 100
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [7 x i32]*, ptr %node_health_status..tmp
  %rcc.tmp.38 = getelementptr [7 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  store i32 100, ptr %rcc.tmp.38
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @generateAsyncProposals.(i32 %node_count.tmp, [7 x i32]* %node_proposals.tmp, i32 %round.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_proposals..tmp = alloca [7 x i32]* 
  %round..tmp = alloca i32 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_proposals.tmp, ptr %node_proposals..tmp
  store i32 %round.tmp, ptr %round..tmp
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
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [7 x i32]*, ptr %node_proposals..tmp
  %rcc.tmp.14 = getelementptr [7 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %round..tmp
  %rcc.tmp.16 = mul i32 %rcc.tmp.15, 100
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 10
  %rcc.tmp.19 = add i32 %rcc.tmp.16, %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %round..tmp
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 7
  %rcc.tmp.24 = add i32 %rcc.tmp.19, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %rcc.tmp.14
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @enqueueProposalsWithDelays.(i32 %node_count.tmp, [7 x i32]* %node_proposals.tmp, [1000 x i32]* %message_queue.tmp, [1000 x i32]* %message_delays.tmp, [1000 x i32]* %message_timestamps.tmp, i32* %queue_head.tmp, i32* %queue_tail.tmp, i32* %queue_size.tmp, i32 %current_time.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_proposals..tmp = alloca [7 x i32]* 
  %message_queue..tmp = alloca [1000 x i32]* 
  %message_delays..tmp = alloca [1000 x i32]* 
  %message_timestamps..tmp = alloca [1000 x i32]* 
  %queue_head..tmp = alloca i32* 
  %queue_tail..tmp = alloca i32* 
  %queue_size..tmp = alloca i32* 
  %current_time..tmp = alloca i32 
  %i = alloca i32 
  %delay = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_proposals.tmp, ptr %node_proposals..tmp
  store [1000 x i32]* %message_queue.tmp, ptr %message_queue..tmp
  store [1000 x i32]* %message_delays.tmp, ptr %message_delays..tmp
  store [1000 x i32]* %message_timestamps.tmp, ptr %message_timestamps..tmp
  store i32* %queue_head.tmp, ptr %queue_head..tmp
  store i32* %queue_tail.tmp, ptr %queue_tail..tmp
  store i32* %queue_size.tmp, ptr %queue_size..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %node_count..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.20 = phi i1 [0, %while.cond], [%rcc.tmp.18, %and.rhs]
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = mul i32 %rcc.tmp.23, 13
  %rcc.tmp.25 = load i32, ptr %current_time..tmp
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 7
  %rcc.tmp.27 = add i32 %rcc.tmp.24, %rcc.tmp.26
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 20
  store i32 %rcc.tmp.28, ptr %delay
  %rcc.tmp.30 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [1000 x i32]*, ptr %message_queue..tmp
  %rcc.tmp.34 = getelementptr [1000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [7 x i32]*, ptr %node_proposals..tmp
  %rcc.tmp.38 = getelementptr [7 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %rcc.tmp.34
  %rcc.tmp.41 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [1000 x i32]*, ptr %message_delays..tmp
  %rcc.tmp.45 = getelementptr [1000 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %delay
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [1000 x i32]*, ptr %message_timestamps..tmp
  %rcc.tmp.52 = getelementptr [1000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %current_time..tmp
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.56 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  %rcc.tmp.59 = srem i32 %rcc.tmp.58, 1000
  store i32 %rcc.tmp.59, ptr %rcc.tmp.55
  %rcc.tmp.61 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.62 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %rcc.tmp.61
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @processAsyncMessages.([1000 x i32]* %message_queue.tmp, [1000 x i32]* %message_delays.tmp, [1000 x i32]* %message_timestamps.tmp, i32* %queue_head.tmp, i32* %queue_tail.tmp, i32* %queue_size.tmp, [7 x i32]* %node_decisions.tmp, i32 %current_time.tmp) {
entry:
  %message_queue..tmp = alloca [1000 x i32]* 
  %message_delays..tmp = alloca [1000 x i32]* 
  %message_timestamps..tmp = alloca [1000 x i32]* 
  %queue_head..tmp = alloca i32* 
  %queue_tail..tmp = alloca i32* 
  %queue_size..tmp = alloca i32* 
  %node_decisions..tmp = alloca [7 x i32]* 
  %current_time..tmp = alloca i32 
  %processed_count = alloca i32 
  %checked = alloca i32 
  %message_ready_time = alloca i32 
  %message_value = alloca i32 
  %old_head = alloca i32 
  store [1000 x i32]* %message_queue.tmp, ptr %message_queue..tmp
  store [1000 x i32]* %message_delays.tmp, ptr %message_delays..tmp
  store [1000 x i32]* %message_timestamps.tmp, ptr %message_timestamps..tmp
  store i32* %queue_head.tmp, ptr %queue_head..tmp
  store i32* %queue_tail.tmp, ptr %queue_tail..tmp
  store i32* %queue_size.tmp, ptr %queue_size..tmp
  store [7 x i32]* %node_decisions.tmp, ptr %node_decisions..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  store i32 0, ptr %processed_count
  store i32 0, ptr %checked
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %checked
  %rcc.tmp.13 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.17 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = icmp sgt i32 %rcc.tmp.18, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.21 = phi i1 [0, %while.cond], [%rcc.tmp.19, %and.rhs]
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [1000 x i32]*, ptr %message_timestamps..tmp
  %rcc.tmp.28 = getelementptr [1000 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [1000 x i32]*, ptr %message_delays..tmp
  %rcc.tmp.34 = getelementptr [1000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.29, %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %message_ready_time
  %rcc.tmp.38 = load i32, ptr %current_time..tmp
  %rcc.tmp.39 = load i32, ptr %message_ready_time
  %rcc.tmp.40 = icmp sge i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then, label %if.else
if.then:
  %rcc.tmp.42 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [1000 x i32]*, ptr %message_queue..tmp
  %rcc.tmp.46 = getelementptr [1000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %message_value
  %rcc.tmp.49 = load i32, ptr %message_value
  %rcc.tmp.50 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.51 = load i32, ptr %current_time..tmp
  call void @processAsyncMessage.(i32 %rcc.tmp.49, [7 x i32]* %rcc.tmp.50, i32 %rcc.tmp.51)
  %rcc.tmp.53 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.54 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = srem i32 %rcc.tmp.56, 1000
  store i32 %rcc.tmp.57, ptr %rcc.tmp.53
  %rcc.tmp.59 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.60 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = sub i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %rcc.tmp.59
  %rcc.tmp.64 = load i32, ptr %processed_count
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %processed_count
  br label %if.merge
if.else:
  %rcc.tmp.68 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %old_head
  %rcc.tmp.71 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.72 = load i32*, ptr %queue_head..tmp
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  %rcc.tmp.75 = srem i32 %rcc.tmp.74, 1000
  store i32 %rcc.tmp.75, ptr %rcc.tmp.71
  %rcc.tmp.77 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.78 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = sub i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %rcc.tmp.77
  %rcc.tmp.82 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = load [1000 x i32]*, ptr %message_queue..tmp
  %rcc.tmp.86 = getelementptr [1000 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.87 = load i32, ptr %old_head
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = load [1000 x i32]*, ptr %message_queue..tmp
  %rcc.tmp.90 = getelementptr [1000 x i32], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %rcc.tmp.86
  %rcc.tmp.93 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = load [1000 x i32]*, ptr %message_delays..tmp
  %rcc.tmp.97 = getelementptr [1000 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.98 = load i32, ptr %old_head
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = load [1000 x i32]*, ptr %message_delays..tmp
  %rcc.tmp.101 = getelementptr [1000 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.102, ptr %rcc.tmp.97
  %rcc.tmp.104 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = load [1000 x i32]*, ptr %message_timestamps..tmp
  %rcc.tmp.108 = getelementptr [1000 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.109 = load i32, ptr %old_head
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [1000 x i32]*, ptr %message_timestamps..tmp
  %rcc.tmp.112 = getelementptr [1000 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  store i32 %rcc.tmp.113, ptr %rcc.tmp.108
  %rcc.tmp.115 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.116 = load i32*, ptr %queue_tail..tmp
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  %rcc.tmp.119 = srem i32 %rcc.tmp.118, 1000
  store i32 %rcc.tmp.119, ptr %rcc.tmp.115
  %rcc.tmp.121 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.122 = load i32*, ptr %queue_size..tmp
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.124, ptr %rcc.tmp.121
  br label %if.merge
if.merge:
  %rcc.tmp.127 = load i32, ptr %checked
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 1
  store i32 %rcc.tmp.128, ptr %checked
  br label %while.cond
while.end:
  %rcc.tmp.131 = load i32, ptr %processed_count
  ret i32 %rcc.tmp.131
}
define void @processAsyncMessage.(i32 %message_value.tmp, [7 x i32]* %node_decisions.tmp, i32 %current_time.tmp) {
entry:
  %message_value..tmp = alloca i32 
  %node_decisions..tmp = alloca [7 x i32]* 
  %current_time..tmp = alloca i32 
  %sender_id = alloca i32 
  store i32 %message_value.tmp, ptr %message_value..tmp
  store [7 x i32]* %node_decisions.tmp, ptr %node_decisions..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  %rcc.tmp.4 = load i32, ptr %message_value..tmp
  %rcc.tmp.5 = sdiv i32 %rcc.tmp.4, 10
  %rcc.tmp.6 = srem i32 %rcc.tmp.5, 7
  store i32 %rcc.tmp.6, ptr %sender_id
  %rcc.tmp.8 = load i32, ptr %sender_id
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.11 = load i32, ptr %sender_id
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 7
  br label %sc.merge
sc.merge:
  %rcc.tmp.14 = phi i1 [0, %entry], [%rcc.tmp.12, %and.rhs]
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load i32, ptr %sender_id
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.19 = getelementptr [7 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = sub i32 0, 1
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.24 = load i32, ptr %sender_id
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.27 = getelementptr [7 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %message_value..tmp
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
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
define i1 @checkAsyncConsensus.(i32 %node_count.tmp, [7 x i32]* %node_decisions.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_decisions..tmp = alloca [7 x i32]* 
  %decided_nodes = alloca i32 
  %consensus_value = alloca i32 
  %consensus_found = alloca i1 
  %i = alloca i32 
  %majority_threshold = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_decisions.tmp, ptr %node_decisions..tmp
  store i32 0, ptr %decided_nodes
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %consensus_value
  store i1 1, ptr %consensus_found
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %node_count..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.17 = getelementptr [7 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, 1
  %rcc.tmp.20 = icmp ne i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  %rcc.tmp.22 = load i32, ptr %decided_nodes
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %decided_nodes
  %rcc.tmp.25 = load i32, ptr %consensus_value
  %rcc.tmp.26 = sub i32 0, 1
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.32 = getelementptr [7 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %consensus_value
  br label %if.merge.2
if.else.2:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.39 = getelementptr [7 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %consensus_value
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %if.then.3, label %if.else.3
if.then.3:
  store i1 0, ptr %consensus_found
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
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.54 = load i32, ptr %node_count..tmp
  %rcc.tmp.55 = sdiv i32 %rcc.tmp.54, 2
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %majority_threshold
  %rcc.tmp.58 = load i32, ptr %decided_nodes
  %rcc.tmp.59 = load i32, ptr %majority_threshold
  %rcc.tmp.60 = icmp sge i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.62 = load i1, ptr %consensus_found
  br label %sc.merge
sc.merge:
  %rcc.tmp.64 = phi i1 [0, %while.end], [%rcc.tmp.62, %and.rhs]
  ret i1 %rcc.tmp.64
}
define i32 @extractConsensusValue.(i32 %node_count.tmp, [7 x i32]* %node_decisions.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_decisions..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_decisions.tmp, ptr %node_decisions..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %node_count..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = sub i32 0, 1
  %rcc.tmp.16 = icmp ne i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.21 = getelementptr [7 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  ret i32 %rcc.tmp.22
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = sub i32 0, 1
  ret i32 %rcc.tmp.29
}
define void @resetNodeDecisions.(i32 %node_count.tmp, [7 x i32]* %node_decisions.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %node_decisions..tmp = alloca [7 x i32]* 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %node_decisions.tmp, ptr %node_decisions..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %node_count..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [7 x i32]*, ptr %node_decisions..tmp
  %rcc.tmp.13 = getelementptr [7 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = sub i32 0, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i1 @verifyConsensusHistory.([100 x i32]* %consensus_values.tmp, i32 %consensus_count.tmp) {
entry:
  %consensus_values..tmp = alloca [100 x i32]* 
  %consensus_count..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %consensus_values.tmp, ptr %consensus_values..tmp
  store i32 %consensus_count.tmp, ptr %consensus_count..tmp
  %rcc.tmp.3 = load i32, ptr %consensus_count..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 1
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %consensus_count..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [100 x i32]*, ptr %consensus_values..tmp
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = sub i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = load [100 x i32]*, ptr %consensus_values..tmp
  %rcc.tmp.24 = getelementptr [100 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp sle i32 %rcc.tmp.19, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define i32 @findMaxPartitionId.(i32 %node_count.tmp, [7 x i32]* %partition_groups.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %partition_groups..tmp = alloca [7 x i32]* 
  %max_id = alloca i32 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  store i32 0, ptr %max_id
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
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.14 = getelementptr [7 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %max_id
  %rcc.tmp.17 = icmp sgt i32 %rcc.tmp.15, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.22 = getelementptr [7 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %max_id
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.31 = load i32, ptr %max_id
  ret i32 %rcc.tmp.31
}
define i32 @countPartitionSize.(i32 %node_count.tmp, [7 x i32]* %partition_groups.tmp, i32 %target_partition.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %partition_groups..tmp = alloca [7 x i32]* 
  %target_partition..tmp = alloca i32 
  %size = alloca i32 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  store i32 %target_partition.tmp, ptr %target_partition..tmp
  store i32 0, ptr %size
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
  %rcc.tmp.14 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.15 = getelementptr [7 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %target_partition..tmp
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %size
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %size
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %size
  ret i32 %rcc.tmp.29
}
define i1 @testPartitionInternalConsensus.(i32 %node_count.tmp, [7 x i32]* %partition_groups.tmp, i32 %target_partition.tmp, [7 x [7 x i1]]* %network_connectivity.tmp) {
entry:
  %node_count..tmp = alloca i32 
  %partition_groups..tmp = alloca [7 x i32]* 
  %target_partition..tmp = alloca i32 
  %network_connectivity..tmp = alloca [7 x [7 x i1]]* 
  %partition_size = alloca i32 
  %first_node = alloca i32 
  %i = alloca i32 
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x i32]* %partition_groups.tmp, ptr %partition_groups..tmp
  store i32 %target_partition.tmp, ptr %target_partition..tmp
  store [7 x [7 x i1]]* %network_connectivity.tmp, ptr %network_connectivity..tmp
  %rcc.tmp.5 = load i32, ptr %node_count..tmp
  %rcc.tmp.6 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.7 = load i32, ptr %target_partition..tmp
  %rcc.tmp.8 = call i32 @countPartitionSize.(i32 %rcc.tmp.5, [7 x i32]* %rcc.tmp.6, i32 %rcc.tmp.7)
  store i32 %rcc.tmp.8, ptr %partition_size
  %rcc.tmp.10 = load i32, ptr %partition_size
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = sub i32 0, 1
  store i32 %rcc.tmp.15, ptr %first_node
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %node_count..tmp
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [7 x i32]*, ptr %partition_groups..tmp
  %rcc.tmp.27 = getelementptr [7 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %target_partition..tmp
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.32 = load i32, ptr %first_node
  %rcc.tmp.33 = sub i32 0, 1
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.36 = load i32, ptr %i
  store i32 %rcc.tmp.36, ptr %first_node
  br label %if.merge.3
if.else.3:
  %rcc.tmp.39 = load i32, ptr %first_node
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [7 x [7 x i1]]*, ptr %network_connectivity..tmp
  %rcc.tmp.42 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [7 x i1], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i1, ptr %rcc.tmp.45
  %rcc.tmp.47 = xor i1 %rcc.tmp.46, true
  br i1 %rcc.tmp.47, label %if.then.4, label %if.else.4
if.then.4:
  ret i1 0
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define i32 @countDetectedFailures.(i32 %node_id.tmp, i32 %node_count.tmp, [7 x [7 x i1]]* %failure_detectors.tmp) {
entry:
  %node_id..tmp = alloca i32 
  %node_count..tmp = alloca i32 
  %failure_detectors..tmp = alloca [7 x [7 x i1]]* 
  %failure_count = alloca i32 
  %i = alloca i32 
  store i32 %node_id.tmp, ptr %node_id..tmp
  store i32 %node_count.tmp, ptr %node_count..tmp
  store [7 x [7 x i1]]* %failure_detectors.tmp, ptr %failure_detectors..tmp
  store i32 0, ptr %failure_count
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
  %rcc.tmp.13 = load i32, ptr %node_id..tmp
  %rcc.tmp.14 = icmp ne i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load i32, ptr %node_id..tmp
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [7 x [7 x i1]]*, ptr %failure_detectors..tmp
  %rcc.tmp.19 = getelementptr [7 x [7 x i1]], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [7 x i1], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i1, ptr %rcc.tmp.22
  br label %sc.merge
sc.merge:
  %rcc.tmp.25 = phi i1 [0, %while.body], [%rcc.tmp.23, %and.rhs]
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %failure_count
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %failure_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.36 = load i32, ptr %failure_count
  ret i32 %rcc.tmp.36
}
