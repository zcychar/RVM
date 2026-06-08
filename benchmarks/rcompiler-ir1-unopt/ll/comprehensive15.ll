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
%StringProcessor = type {[20 x i32], i32, [5 x [10 x i32]], [5 x i32], i32, [20 x i32], [20 x i32], [20 x i32], [10 x i32], [256 x i32], [10 x i32], [50 x i32], [20 x i32], i32, i32, [10 x [10 x i32]], [256 x i32], [256 x [20 x i32]], [256 x i32], i32, i32, i32, i32, [5 x [20 x i32]], [5 x i32], [10 x i32], i32, i32}
%RegexMatcher = type {[100 x i32], i32, [100 x [100 x i1]], i32, i1}
define void @StringProcessor.initialize_text.(%StringProcessor* %self.tmp, i32 %length.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %length..tmp = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %length.tmp, ptr %length..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 1
  %rcc.tmp.5 = load i32, ptr %length..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %length..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %StringProcessor, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [20 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load %StringProcessor*, ptr %self..tmp
  call void @StringProcessor.analyze_text_statistics.(%StringProcessor* %rcc.tmp.25)
  %rcc.tmp.27 = load %StringProcessor*, ptr %self..tmp
  call void @StringProcessor.build_suffix_array.(%StringProcessor* %rcc.tmp.27)
  %rcc.tmp.29 = load %StringProcessor*, ptr %self..tmp
  call void @StringProcessor.compute_lcp_array.(%StringProcessor* %rcc.tmp.29)
  %rcc.tmp.31 = load %StringProcessor*, ptr %self..tmp
  call void @StringProcessor.prepare_rabin_karp_hashes.(%StringProcessor* %rcc.tmp.31)
  ret void
}
define void @StringProcessor.add_pattern.(%StringProcessor* %self.tmp, i32 %length.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %length..tmp = alloca i32 
  %pattern_index = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %length.tmp, ptr %length..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 4
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = icmp sge i32 %rcc.tmp.5, 50
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %StringProcessor, ptr %rcc.tmp.10, i32 0, i32 4
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %pattern_index
  %rcc.tmp.14 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %StringProcessor, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %pattern_index
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [5 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %length..tmp
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %length..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %StringProcessor, ptr %rcc.tmp.28, i32 0, i32 2
  %rcc.tmp.30 = load i32, ptr %pattern_index
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = call i32 @getInt.()
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.42 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.43 = load i32, ptr %pattern_index
  call void @StringProcessor.preprocess_kmp.(%StringProcessor* %rcc.tmp.42, i32 %rcc.tmp.43)
  %rcc.tmp.45 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.46 = load i32, ptr %pattern_index
  call void @StringProcessor.preprocess_boyer_moore.(%StringProcessor* %rcc.tmp.45, i32 %rcc.tmp.46)
  %rcc.tmp.48 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.49 = load i32, ptr %pattern_index
  call void @StringProcessor.compute_pattern_hash.(%StringProcessor* %rcc.tmp.48, i32 %rcc.tmp.49)
  %rcc.tmp.51 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.52 = getelementptr %StringProcessor, ptr %rcc.tmp.51, i32 0, i32 4
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.52
  ret void
}
define void @StringProcessor.analyze_text_statistics.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %i = alloca i32 
  %ch = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %StringProcessor, ptr %rcc.tmp.2, i32 0, i32 19
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %StringProcessor, ptr %rcc.tmp.5, i32 0, i32 20
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %StringProcessor, ptr %rcc.tmp.8, i32 0, i32 21
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %StringProcessor, ptr %rcc.tmp.11, i32 0, i32 22
  store i32 0, ptr %rcc.tmp.12
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 256
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %StringProcessor, ptr %rcc.tmp.20, i32 0, i32 16
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [256 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.34 = getelementptr %StringProcessor, ptr %rcc.tmp.33, i32 0, i32 1
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %StringProcessor, ptr %rcc.tmp.39, i32 0, i32 0
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [20 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %ch
  %rcc.tmp.46 = load i32, ptr %ch
  %rcc.tmp.47 = icmp sge i32 %rcc.tmp.46, 0
  br i1 %rcc.tmp.47, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.49 = load i32, ptr %ch
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.52 = phi i1 [0, %while.body.2], [%rcc.tmp.50, %and.rhs]
  br i1 %rcc.tmp.52, label %if.then, label %if.else
if.then:
  %rcc.tmp.54 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.55 = getelementptr %StringProcessor, ptr %rcc.tmp.54, i32 0, i32 16
  %rcc.tmp.56 = load i32, ptr %ch
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [256 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %rcc.tmp.58
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.64 = load i32, ptr %ch
  %rcc.tmp.65 = icmp eq i32 %rcc.tmp.64, 32
  br i1 %rcc.tmp.65, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = icmp sgt i32 %rcc.tmp.67, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.70 = phi i1 [0, %if.merge], [%rcc.tmp.68, %and.rhs.2]
  br i1 %rcc.tmp.70, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.72 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.73 = getelementptr %StringProcessor, ptr %rcc.tmp.72, i32 0, i32 0
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = sub i32 %rcc.tmp.74, 1
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [20 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = icmp ne i32 %rcc.tmp.78, 32
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.81 = phi i1 [0, %sc.merge.2], [%rcc.tmp.79, %and.rhs.3]
  br i1 %rcc.tmp.81, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.83 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.84 = getelementptr %StringProcessor, ptr %rcc.tmp.83, i32 0, i32 19
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %rcc.tmp.84
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.90 = load i32, ptr %ch
  %rcc.tmp.91 = icmp eq i32 %rcc.tmp.90, 46
  br i1 %rcc.tmp.91, label %sc.merge.4, label %or.rhs
or.rhs:
  %rcc.tmp.93 = load i32, ptr %ch
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.93, 33
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.96 = phi i1 [1, %if.merge.2], [%rcc.tmp.94, %or.rhs]
  br i1 %rcc.tmp.96, label %sc.merge.5, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.98 = load i32, ptr %ch
  %rcc.tmp.99 = icmp eq i32 %rcc.tmp.98, 63
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.101 = phi i1 [1, %sc.merge.4], [%rcc.tmp.99, %or.rhs.2]
  br i1 %rcc.tmp.101, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.103 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.104 = getelementptr %StringProcessor, ptr %rcc.tmp.103, i32 0, i32 20
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 1
  store i32 %rcc.tmp.106, ptr %rcc.tmp.104
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.110 = load i32, ptr %ch
  %rcc.tmp.111 = icmp eq i32 %rcc.tmp.110, 10
  br i1 %rcc.tmp.111, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.113 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.114 = getelementptr %StringProcessor, ptr %rcc.tmp.113, i32 0, i32 21
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %rcc.tmp.114
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  store i32 %rcc.tmp.121, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = icmp slt i32 %rcc.tmp.126, 256
  br i1 %rcc.tmp.127, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.130 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.131 = getelementptr %StringProcessor, ptr %rcc.tmp.130, i32 0, i32 16
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = getelementptr [256 x i32], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.134
  %rcc.tmp.136 = icmp sgt i32 %rcc.tmp.135, 0
  br i1 %rcc.tmp.136, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.138 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.139 = getelementptr %StringProcessor, ptr %rcc.tmp.138, i32 0, i32 22
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 1
  store i32 %rcc.tmp.141, ptr %rcc.tmp.139
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.145 = load i32, ptr %i
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.149 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.150 = getelementptr %StringProcessor, ptr %rcc.tmp.149, i32 0, i32 1
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.150
  %rcc.tmp.152 = icmp sgt i32 %rcc.tmp.151, 0
  br i1 %rcc.tmp.152, label %and.rhs.4, label %sc.merge.6
and.rhs.4:
  %rcc.tmp.154 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.155 = getelementptr %StringProcessor, ptr %rcc.tmp.154, i32 0, i32 0
  %rcc.tmp.156 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.157 = getelementptr %StringProcessor, ptr %rcc.tmp.156, i32 0, i32 1
  %rcc.tmp.158 = load i32, ptr %rcc.tmp.157
  %rcc.tmp.159 = sub i32 %rcc.tmp.158, 1
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 0
  %rcc.tmp.161 = getelementptr [20 x i32], ptr %rcc.tmp.155, i32 0, i32 %rcc.tmp.160
  %rcc.tmp.162 = load i32, ptr %rcc.tmp.161
  %rcc.tmp.163 = icmp ne i32 %rcc.tmp.162, 32
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.165 = phi i1 [0, %while.end.3], [%rcc.tmp.163, %and.rhs.4]
  br i1 %rcc.tmp.165, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.167 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.168 = getelementptr %StringProcessor, ptr %rcc.tmp.167, i32 0, i32 19
  %rcc.tmp.169 = load i32, ptr %rcc.tmp.168
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %rcc.tmp.168
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  ret void
}
define void @StringProcessor.build_suffix_array.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %i = alloca i32 
  %sorted = alloca i1 
  %temp = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %StringProcessor, ptr %rcc.tmp.5, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %StringProcessor, ptr %rcc.tmp.11, i32 0, i32 5
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [20 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  store i1 0, ptr %sorted
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.24 = load i1, ptr %sorted
  %rcc.tmp.25 = xor i1 %rcc.tmp.24, true
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i1 1, ptr %sorted
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %StringProcessor, ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = sub i32 %rcc.tmp.34, 1
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.39 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.40 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.41 = getelementptr %StringProcessor, ptr %rcc.tmp.40, i32 0, i32 5
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [20 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %StringProcessor, ptr %rcc.tmp.46, i32 0, i32 5
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [20 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = call i32 @StringProcessor.compare_suffixes.(%StringProcessor* %rcc.tmp.39, i32 %rcc.tmp.45, i32 %rcc.tmp.52)
  %rcc.tmp.54 = icmp sgt i32 %rcc.tmp.53, 0
  br i1 %rcc.tmp.54, label %if.then, label %if.else
if.then:
  %rcc.tmp.56 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %StringProcessor, ptr %rcc.tmp.56, i32 0, i32 5
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [20 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %temp
  %rcc.tmp.63 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %StringProcessor, ptr %rcc.tmp.63, i32 0, i32 5
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [20 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %StringProcessor, ptr %rcc.tmp.68, i32 0, i32 5
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [20 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %rcc.tmp.67
  %rcc.tmp.76 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %StringProcessor, ptr %rcc.tmp.76, i32 0, i32 5
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = getelementptr [20 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %temp
  store i32 %rcc.tmp.82, ptr %rcc.tmp.81
  store i1 0, ptr %sorted
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %i
  br label %while.cond.3
while.end.3:
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.96 = getelementptr %StringProcessor, ptr %rcc.tmp.95, i32 0, i32 1
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  %rcc.tmp.98 = icmp slt i32 %rcc.tmp.94, %rcc.tmp.97
  br i1 %rcc.tmp.98, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.101 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.102 = getelementptr %StringProcessor, ptr %rcc.tmp.101, i32 0, i32 7
  %rcc.tmp.103 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.104 = getelementptr %StringProcessor, ptr %rcc.tmp.103, i32 0, i32 5
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = getelementptr [20 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.107
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [20 x i32], ptr %rcc.tmp.102, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %i
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %i
  br label %while.cond.4
while.end.4:
  ret void
}
define i32 @StringProcessor.compare_suffixes.(%StringProcessor* %self.tmp, i32 %i.tmp, i32 %j.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %i..tmp = alloca i32 
  %j..tmp = alloca i32 
  %k = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %i.tmp, ptr %i..tmp
  store i32 %j.tmp, ptr %j..tmp
  store i32 0, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i..tmp
  %rcc.tmp.7 = load i32, ptr %k
  %rcc.tmp.8 = add i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %StringProcessor, ptr %rcc.tmp.9, i32 0, i32 1
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.14 = load i32, ptr %j..tmp
  %rcc.tmp.15 = load i32, ptr %k
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %StringProcessor, ptr %rcc.tmp.17, i32 0, i32 1
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.19
  br label %sc.merge
sc.merge:
  %rcc.tmp.22 = phi i1 [0, %while.cond], [%rcc.tmp.20, %and.rhs]
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %StringProcessor, ptr %rcc.tmp.25, i32 0, i32 26
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %rcc.tmp.26
  %rcc.tmp.30 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %StringProcessor, ptr %rcc.tmp.30, i32 0, i32 0
  %rcc.tmp.32 = load i32, ptr %i..tmp
  %rcc.tmp.33 = load i32, ptr %k
  %rcc.tmp.34 = add i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [20 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %StringProcessor, ptr %rcc.tmp.38, i32 0, i32 0
  %rcc.tmp.40 = load i32, ptr %j..tmp
  %rcc.tmp.41 = load i32, ptr %k
  %rcc.tmp.42 = add i32 %rcc.tmp.40, %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [20 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %if.then, label %if.else
if.then:
  %rcc.tmp.48 = sub i32 0, 1
  ret i32 %rcc.tmp.48
if.else:
  %rcc.tmp.50 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.51 = getelementptr %StringProcessor, ptr %rcc.tmp.50, i32 0, i32 0
  %rcc.tmp.52 = load i32, ptr %i..tmp
  %rcc.tmp.53 = load i32, ptr %k
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [20 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %StringProcessor, ptr %rcc.tmp.58, i32 0, i32 0
  %rcc.tmp.60 = load i32, ptr %j..tmp
  %rcc.tmp.61 = load i32, ptr %k
  %rcc.tmp.62 = add i32 %rcc.tmp.60, %rcc.tmp.61
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [20 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = icmp sgt i32 %rcc.tmp.57, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.71 = load i32, ptr %k
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %k
  br label %while.cond
while.end:
  %rcc.tmp.75 = load i32, ptr %i..tmp
  %rcc.tmp.76 = load i32, ptr %k
  %rcc.tmp.77 = add i32 %rcc.tmp.75, %rcc.tmp.76
  %rcc.tmp.78 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.79 = getelementptr %StringProcessor, ptr %rcc.tmp.78, i32 0, i32 1
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = icmp sge i32 %rcc.tmp.77, %rcc.tmp.80
  br i1 %rcc.tmp.81, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.83 = load i32, ptr %j..tmp
  %rcc.tmp.84 = load i32, ptr %k
  %rcc.tmp.85 = add i32 %rcc.tmp.83, %rcc.tmp.84
  %rcc.tmp.86 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.87 = getelementptr %StringProcessor, ptr %rcc.tmp.86, i32 0, i32 1
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  %rcc.tmp.89 = icmp sge i32 %rcc.tmp.85, %rcc.tmp.88
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.91 = phi i1 [0, %while.end], [%rcc.tmp.89, %and.rhs.2]
  br i1 %rcc.tmp.91, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 0
if.else.3:
  %rcc.tmp.94 = load i32, ptr %i..tmp
  %rcc.tmp.95 = load i32, ptr %k
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.98 = getelementptr %StringProcessor, ptr %rcc.tmp.97, i32 0, i32 1
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.98
  %rcc.tmp.100 = icmp sge i32 %rcc.tmp.96, %rcc.tmp.99
  br i1 %rcc.tmp.100, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.102 = sub i32 0, 1
  ret i32 %rcc.tmp.102
if.else.4:
  ret i32 1
if.merge.4:
  br label %if.merge.3
if.merge.3:
  ret i32 undef
}
define void @StringProcessor.compute_lcp_array.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %k = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %k
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %StringProcessor, ptr %rcc.tmp.6, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %StringProcessor, ptr %rcc.tmp.12, i32 0, i32 7
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [20 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %StringProcessor, ptr %rcc.tmp.18, i32 0, i32 1
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = sub i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.17, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  store i32 0, ptr %k
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.30 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %StringProcessor, ptr %rcc.tmp.30, i32 0, i32 5
  %rcc.tmp.32 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %StringProcessor, ptr %rcc.tmp.32, i32 0, i32 7
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [20 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [20 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = load i32, ptr %k
  %rcc.tmp.46 = add i32 %rcc.tmp.44, %rcc.tmp.45
  %rcc.tmp.47 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %StringProcessor, ptr %rcc.tmp.47, i32 0, i32 1
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = load i32, ptr %k
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %StringProcessor, ptr %rcc.tmp.55, i32 0, i32 1
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.54, %rcc.tmp.57
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %while.cond.2], [%rcc.tmp.58, %and.rhs]
  br i1 %rcc.tmp.60, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.62 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.63 = getelementptr %StringProcessor, ptr %rcc.tmp.62, i32 0, i32 0
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = load i32, ptr %k
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [20 x i32], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.71 = getelementptr %StringProcessor, ptr %rcc.tmp.70, i32 0, i32 0
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = load i32, ptr %k
  %rcc.tmp.74 = add i32 %rcc.tmp.72, %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [20 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = icmp eq i32 %rcc.tmp.69, %rcc.tmp.77
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.80 = phi i1 [0, %sc.merge], [%rcc.tmp.78, %and.rhs.2]
  br i1 %rcc.tmp.80, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.83 = load i32, ptr %k
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %k
  br label %while.cond.2
while.end.2:
  %rcc.tmp.87 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %StringProcessor, ptr %rcc.tmp.87, i32 0, i32 6
  %rcc.tmp.89 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.90 = getelementptr %StringProcessor, ptr %rcc.tmp.89, i32 0, i32 7
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [20 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = getelementptr [20 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %k
  store i32 %rcc.tmp.97, ptr %rcc.tmp.96
  %rcc.tmp.99 = load i32, ptr %k
  %rcc.tmp.100 = icmp sgt i32 %rcc.tmp.99, 0
  br i1 %rcc.tmp.100, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.102 = load i32, ptr %k
  %rcc.tmp.103 = sub i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %k
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @StringProcessor.preprocess_kmp.(%StringProcessor* %self.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %length = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pattern_len
  store i32 0, ptr %length
  store i32 1, ptr %i
  %rcc.tmp.12 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %StringProcessor, ptr %rcc.tmp.12, i32 0, i32 8
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %rcc.tmp.13, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.14
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %pattern_len
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %StringProcessor, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %StringProcessor, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %length
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.30, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then, label %if.else
if.then:
  %rcc.tmp.42 = load i32, ptr %length
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %length
  %rcc.tmp.45 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %StringProcessor, ptr %rcc.tmp.45, i32 0, i32 8
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [10 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %length
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.56 = load i32, ptr %length
  %rcc.tmp.57 = icmp ne i32 %rcc.tmp.56, 0
  br i1 %rcc.tmp.57, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.59 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.60 = getelementptr %StringProcessor, ptr %rcc.tmp.59, i32 0, i32 8
  %rcc.tmp.61 = load i32, ptr %length
  %rcc.tmp.62 = sub i32 %rcc.tmp.61, 1
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [10 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  store i32 %rcc.tmp.65, ptr %length
  br label %if.merge.2
if.else.2:
  %rcc.tmp.68 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %StringProcessor, ptr %rcc.tmp.68, i32 0, i32 8
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [10 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  store i32 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %i
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  ret void
}
define void @StringProcessor.preprocess_boyer_moore.(%StringProcessor* %self.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %i = alloca i32 
  %ch = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pattern_len
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 256
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %StringProcessor, ptr %rcc.tmp.16, i32 0, i32 9
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [256 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = sub i32 0, 1
  store i32 %rcc.tmp.21, ptr %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %pattern_len
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.34 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %StringProcessor, ptr %rcc.tmp.34, i32 0, i32 2
  %rcc.tmp.36 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [10 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %ch
  %rcc.tmp.44 = load i32, ptr %ch
  %rcc.tmp.45 = icmp sge i32 %rcc.tmp.44, 0
  br i1 %rcc.tmp.45, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.47 = load i32, ptr %ch
  %rcc.tmp.48 = icmp slt i32 %rcc.tmp.47, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.50 = phi i1 [0, %while.body.2], [%rcc.tmp.48, %and.rhs]
  br i1 %rcc.tmp.50, label %if.then, label %if.else
if.then:
  %rcc.tmp.52 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %StringProcessor, ptr %rcc.tmp.52, i32 0, i32 9
  %rcc.tmp.54 = load i32, ptr %ch
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [256 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %i
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = load i32, ptr %pattern_len
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.67, %rcc.tmp.68
  br i1 %rcc.tmp.69, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.72 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.73 = getelementptr %StringProcessor, ptr %rcc.tmp.72, i32 0, i32 10
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [10 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %pattern_len
  store i32 %rcc.tmp.77, ptr %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define void @StringProcessor.compute_pattern_hash.(%StringProcessor* %self.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %hash_value = alloca i32 
  %power = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pattern_len
  store i32 0, ptr %hash_value
  store i32 1, ptr %power
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %pattern_len
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %hash_value
  %rcc.tmp.20 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %StringProcessor, ptr %rcc.tmp.20, i32 0, i32 2
  %rcc.tmp.22 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %power
  %rcc.tmp.30 = mul i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %StringProcessor, ptr %rcc.tmp.31, i32 0, i32 14
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = srem i32 %rcc.tmp.30, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.19, %rcc.tmp.34
  %rcc.tmp.36 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.37 = getelementptr %StringProcessor, ptr %rcc.tmp.36, i32 0, i32 14
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = srem i32 %rcc.tmp.35, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %hash_value
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = load i32, ptr %pattern_len
  %rcc.tmp.43 = sub i32 %rcc.tmp.42, 1
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then, label %if.else
if.then:
  %rcc.tmp.46 = load i32, ptr %power
  %rcc.tmp.47 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %StringProcessor, ptr %rcc.tmp.47, i32 0, i32 13
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = mul i32 %rcc.tmp.46, %rcc.tmp.49
  %rcc.tmp.51 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.52 = getelementptr %StringProcessor, ptr %rcc.tmp.51, i32 0, i32 14
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = srem i32 %rcc.tmp.50, %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %power
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.62 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.63 = getelementptr %StringProcessor, ptr %rcc.tmp.62, i32 0, i32 11
  %rcc.tmp.64 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %hash_value
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  ret void
}
define void @StringProcessor.prepare_rabin_karp_hashes.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %StringProcessor, ptr %rcc.tmp.2, i32 0, i32 1
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %StringProcessor, ptr %rcc.tmp.9, i32 0, i32 12
  %rcc.tmp.11 = getelementptr [20 x i32], ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %StringProcessor, ptr %rcc.tmp.12, i32 0, i32 0
  %rcc.tmp.14 = getelementptr [20 x i32], ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %StringProcessor, ptr %rcc.tmp.16, i32 0, i32 14
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = srem i32 %rcc.tmp.15, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.11
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.25 = getelementptr %StringProcessor, ptr %rcc.tmp.24, i32 0, i32 1
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %StringProcessor, ptr %rcc.tmp.30, i32 0, i32 12
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [20 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %StringProcessor, ptr %rcc.tmp.35, i32 0, i32 12
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = sub i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [20 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.43 = getelementptr %StringProcessor, ptr %rcc.tmp.42, i32 0, i32 14
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = srem i32 %rcc.tmp.41, %rcc.tmp.44
  %rcc.tmp.46 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %StringProcessor, ptr %rcc.tmp.46, i32 0, i32 13
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = mul i32 %rcc.tmp.45, %rcc.tmp.48
  %rcc.tmp.50 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.51 = getelementptr %StringProcessor, ptr %rcc.tmp.50, i32 0, i32 14
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = srem i32 %rcc.tmp.49, %rcc.tmp.52
  %rcc.tmp.54 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.55 = getelementptr %StringProcessor, ptr %rcc.tmp.54, i32 0, i32 0
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [20 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.61 = getelementptr %StringProcessor, ptr %rcc.tmp.60, i32 0, i32 14
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = srem i32 %rcc.tmp.59, %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.53, %rcc.tmp.63
  %rcc.tmp.65 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.66 = getelementptr %StringProcessor, ptr %rcc.tmp.65, i32 0, i32 14
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = srem i32 %rcc.tmp.64, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %rcc.tmp.34
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @StringProcessor.kmp_search.(%StringProcessor* %self.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pattern_len
  %rcc.tmp.10 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %StringProcessor, ptr %rcc.tmp.10, i32 0, i32 24
  %rcc.tmp.12 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [5 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %pattern_len
  %rcc.tmp.17 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %StringProcessor, ptr %rcc.tmp.17, i32 0, i32 1
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp sgt i32 %rcc.tmp.16, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %i
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %StringProcessor, ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.34 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %StringProcessor, ptr %rcc.tmp.34, i32 0, i32 26
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.35
  %rcc.tmp.39 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %StringProcessor, ptr %rcc.tmp.39, i32 0, i32 2
  %rcc.tmp.41 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [10 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %StringProcessor, ptr %rcc.tmp.48, i32 0, i32 0
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [20 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.47, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %j
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = load i32, ptr %pattern_len
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.64, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.68 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %StringProcessor, ptr %rcc.tmp.68, i32 0, i32 24
  %rcc.tmp.70 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [5 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = icmp slt i32 %rcc.tmp.73, 100
  br i1 %rcc.tmp.74, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.76 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %StringProcessor, ptr %rcc.tmp.76, i32 0, i32 23
  %rcc.tmp.78 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [5 x [20 x i32]], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.82 = getelementptr %StringProcessor, ptr %rcc.tmp.81, i32 0, i32 24
  %rcc.tmp.83 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [5 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = getelementptr [20 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = sub i32 %rcc.tmp.89, %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %rcc.tmp.88
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.95 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.96 = getelementptr %StringProcessor, ptr %rcc.tmp.95, i32 0, i32 24
  %rcc.tmp.97 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [5 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %rcc.tmp.99
  %rcc.tmp.103 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.104 = getelementptr %StringProcessor, ptr %rcc.tmp.103, i32 0, i32 8
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = sub i32 %rcc.tmp.105, 1
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [10 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  store i32 %rcc.tmp.109, ptr %j
  br label %if.merge.3
if.else.3:
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.114 = getelementptr %StringProcessor, ptr %rcc.tmp.113, i32 0, i32 1
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = icmp slt i32 %rcc.tmp.112, %rcc.tmp.115
  br i1 %rcc.tmp.116, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.118 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.119 = getelementptr %StringProcessor, ptr %rcc.tmp.118, i32 0, i32 2
  %rcc.tmp.120 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %j
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [10 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.128 = getelementptr %StringProcessor, ptr %rcc.tmp.127, i32 0, i32 0
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 0
  %rcc.tmp.131 = getelementptr [20 x i32], ptr %rcc.tmp.128, i32 0, i32 %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  %rcc.tmp.133 = icmp ne i32 %rcc.tmp.126, %rcc.tmp.132
  br label %sc.merge
sc.merge:
  %rcc.tmp.135 = phi i1 [0, %if.else.3], [%rcc.tmp.133, %and.rhs]
  br i1 %rcc.tmp.135, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.137 = load i32, ptr %j
  %rcc.tmp.138 = icmp ne i32 %rcc.tmp.137, 0
  br i1 %rcc.tmp.138, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.140 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.141 = getelementptr %StringProcessor, ptr %rcc.tmp.140, i32 0, i32 8
  %rcc.tmp.142 = load i32, ptr %j
  %rcc.tmp.143 = sub i32 %rcc.tmp.142, 1
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 0
  %rcc.tmp.145 = getelementptr [10 x i32], ptr %rcc.tmp.141, i32 0, i32 %rcc.tmp.144
  %rcc.tmp.146 = load i32, ptr %rcc.tmp.145
  store i32 %rcc.tmp.146, ptr %j
  br label %if.merge.6
if.else.6:
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %i
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.3
if.merge.3:
  br label %while.cond
while.end:
  ret void
}
define void @StringProcessor.boyer_moore_search.(%StringProcessor* %self.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %matches_found = alloca i32 
  %shift = alloca i32 
  %j = alloca i32 
  %bad_char_shift = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pattern_len
  store i32 0, ptr %matches_found
  %rcc.tmp.11 = load i32, ptr %pattern_len
  %rcc.tmp.12 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %StringProcessor, ptr %rcc.tmp.12, i32 0, i32 1
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp sgt i32 %rcc.tmp.11, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %shift
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %shift
  %rcc.tmp.22 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %StringProcessor, ptr %rcc.tmp.22, i32 0, i32 1
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %pattern_len
  %rcc.tmp.26 = sub i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = icmp sle i32 %rcc.tmp.21, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %pattern_len
  %rcc.tmp.31 = sub i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = icmp sge i32 %rcc.tmp.34, 0
  br i1 %rcc.tmp.35, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.37 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %StringProcessor, ptr %rcc.tmp.37, i32 0, i32 2
  %rcc.tmp.39 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %j
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [10 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %StringProcessor, ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %shift
  %rcc.tmp.49 = load i32, ptr %j
  %rcc.tmp.50 = add i32 %rcc.tmp.48, %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [20 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.45, %rcc.tmp.53
  br label %sc.merge
sc.merge:
  %rcc.tmp.56 = phi i1 [0, %while.cond.2], [%rcc.tmp.54, %and.rhs]
  br i1 %rcc.tmp.56, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = sub i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %j
  %rcc.tmp.62 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.63 = getelementptr %StringProcessor, ptr %rcc.tmp.62, i32 0, i32 26
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %rcc.tmp.63
  br label %while.cond.2
while.end.2:
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.68, 0
  br i1 %rcc.tmp.69, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.71 = load i32, ptr %matches_found
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %matches_found
  %rcc.tmp.74 = load i32, ptr %shift
  %rcc.tmp.75 = load i32, ptr %pattern_len
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  %rcc.tmp.77 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.78 = getelementptr %StringProcessor, ptr %rcc.tmp.77, i32 0, i32 1
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = icmp slt i32 %rcc.tmp.76, %rcc.tmp.79
  br i1 %rcc.tmp.80, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.82 = load i32, ptr %pattern_len
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.85 = phi i32 [%rcc.tmp.82, %if.then.3], [1, %if.else.3]
  %rcc.tmp.86 = load i32, ptr %shift
  %rcc.tmp.87 = add i32 %rcc.tmp.86, %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %shift
  br label %if.merge.2
if.else.2:
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.92 = getelementptr %StringProcessor, ptr %rcc.tmp.91, i32 0, i32 9
  %rcc.tmp.93 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.94 = getelementptr %StringProcessor, ptr %rcc.tmp.93, i32 0, i32 0
  %rcc.tmp.95 = load i32, ptr %shift
  %rcc.tmp.96 = load i32, ptr %j
  %rcc.tmp.97 = add i32 %rcc.tmp.95, %rcc.tmp.96
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [20 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = getelementptr [256 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = sub i32 %rcc.tmp.90, %rcc.tmp.103
  store i32 %rcc.tmp.104, ptr %bad_char_shift
  %rcc.tmp.106 = load i32, ptr %bad_char_shift
  %rcc.tmp.107 = icmp sgt i32 %rcc.tmp.106, 1
  br i1 %rcc.tmp.107, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.109 = load i32, ptr %bad_char_shift
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.112 = phi i32 [%rcc.tmp.109, %if.then.4], [1, %if.else.4]
  %rcc.tmp.113 = load i32, ptr %shift
  %rcc.tmp.114 = add i32 %rcc.tmp.113, %rcc.tmp.112
  store i32 %rcc.tmp.114, ptr %shift
  %rcc.tmp.116 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %StringProcessor, ptr %rcc.tmp.116, i32 0, i32 26
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %rcc.tmp.117
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.123 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.124 = getelementptr %StringProcessor, ptr %rcc.tmp.123, i32 0, i32 25
  %rcc.tmp.125 = getelementptr [10 x i32], ptr %rcc.tmp.124, i32 0, i32 1
  %rcc.tmp.126 = load i32, ptr %matches_found
  store i32 %rcc.tmp.126, ptr %rcc.tmp.125
  ret void
}
define void @StringProcessor.rabin_karp_search.(%StringProcessor* %self.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %pattern_hash = alloca i32 
  %matches_found = alloca i32 
  %window_hash = alloca i32 
  %power = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.3 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %StringProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [5 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pattern_len
  %rcc.tmp.10 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %StringProcessor, ptr %rcc.tmp.10, i32 0, i32 11
  %rcc.tmp.12 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %pattern_hash
  store i32 0, ptr %matches_found
  %rcc.tmp.18 = load i32, ptr %pattern_len
  %rcc.tmp.19 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %StringProcessor, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.18, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %window_hash
  store i32 1, ptr %power
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %pattern_len
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.35 = load i32, ptr %window_hash
  %rcc.tmp.36 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.37 = getelementptr %StringProcessor, ptr %rcc.tmp.36, i32 0, i32 0
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [20 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %power
  %rcc.tmp.43 = mul i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %StringProcessor, ptr %rcc.tmp.44, i32 0, i32 14
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = srem i32 %rcc.tmp.43, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.35, %rcc.tmp.47
  %rcc.tmp.49 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.50 = getelementptr %StringProcessor, ptr %rcc.tmp.49, i32 0, i32 14
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = srem i32 %rcc.tmp.48, %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %window_hash
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = load i32, ptr %pattern_len
  %rcc.tmp.56 = sub i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.54, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.59 = load i32, ptr %power
  %rcc.tmp.60 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.61 = getelementptr %StringProcessor, ptr %rcc.tmp.60, i32 0, i32 13
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = mul i32 %rcc.tmp.59, %rcc.tmp.62
  %rcc.tmp.64 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.65 = getelementptr %StringProcessor, ptr %rcc.tmp.64, i32 0, i32 14
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = srem i32 %rcc.tmp.63, %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %power
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.75 = load i32, ptr %window_hash
  %rcc.tmp.76 = load i32, ptr %pattern_hash
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.75, %rcc.tmp.76
  br i1 %rcc.tmp.77, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.79 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.80 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.81 = call i1 @StringProcessor.verify_match.(%StringProcessor* %rcc.tmp.79, i32 0, i32 %rcc.tmp.80)
  br i1 %rcc.tmp.81, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.83 = load i32, ptr %matches_found
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %matches_found
  br label %if.merge.4
if.else.4:
  %rcc.tmp.87 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %StringProcessor, ptr %rcc.tmp.87, i32 0, i32 27
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %rcc.tmp.88
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.95 = load i32, ptr %pattern_len
  store i32 %rcc.tmp.95, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %StringProcessor, ptr %rcc.tmp.99, i32 0, i32 1
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = icmp slt i32 %rcc.tmp.98, %rcc.tmp.101
  br i1 %rcc.tmp.102, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.105 = load i32, ptr %window_hash
  %rcc.tmp.106 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.107 = getelementptr %StringProcessor, ptr %rcc.tmp.106, i32 0, i32 0
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = load i32, ptr %pattern_len
  %rcc.tmp.110 = sub i32 %rcc.tmp.108, %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [20 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %power
  %rcc.tmp.115 = mul i32 %rcc.tmp.113, %rcc.tmp.114
  %rcc.tmp.116 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %StringProcessor, ptr %rcc.tmp.116, i32 0, i32 14
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.119 = srem i32 %rcc.tmp.115, %rcc.tmp.118
  %rcc.tmp.120 = sub i32 %rcc.tmp.105, %rcc.tmp.119
  %rcc.tmp.121 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.122 = getelementptr %StringProcessor, ptr %rcc.tmp.121, i32 0, i32 14
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  %rcc.tmp.124 = add i32 %rcc.tmp.120, %rcc.tmp.123
  %rcc.tmp.125 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.126 = getelementptr %StringProcessor, ptr %rcc.tmp.125, i32 0, i32 14
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = srem i32 %rcc.tmp.124, %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %window_hash
  %rcc.tmp.130 = load i32, ptr %window_hash
  %rcc.tmp.131 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.132 = getelementptr %StringProcessor, ptr %rcc.tmp.131, i32 0, i32 13
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.132
  %rcc.tmp.134 = mul i32 %rcc.tmp.130, %rcc.tmp.133
  %rcc.tmp.135 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.136 = getelementptr %StringProcessor, ptr %rcc.tmp.135, i32 0, i32 0
  %rcc.tmp.137 = load i32, ptr %i
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [20 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  %rcc.tmp.141 = add i32 %rcc.tmp.134, %rcc.tmp.140
  %rcc.tmp.142 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.143 = getelementptr %StringProcessor, ptr %rcc.tmp.142, i32 0, i32 14
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  %rcc.tmp.145 = srem i32 %rcc.tmp.141, %rcc.tmp.144
  store i32 %rcc.tmp.145, ptr %window_hash
  %rcc.tmp.147 = load i32, ptr %window_hash
  %rcc.tmp.148 = load i32, ptr %pattern_hash
  %rcc.tmp.149 = icmp eq i32 %rcc.tmp.147, %rcc.tmp.148
  br i1 %rcc.tmp.149, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.151 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = load i32, ptr %pattern_len
  %rcc.tmp.154 = sub i32 %rcc.tmp.152, %rcc.tmp.153
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  %rcc.tmp.156 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.157 = call i1 @StringProcessor.verify_match.(%StringProcessor* %rcc.tmp.151, i32 %rcc.tmp.155, i32 %rcc.tmp.156)
  br i1 %rcc.tmp.157, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.159 = load i32, ptr %matches_found
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.160, ptr %matches_found
  br label %if.merge.6
if.else.6:
  %rcc.tmp.163 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.164 = getelementptr %StringProcessor, ptr %rcc.tmp.163, i32 0, i32 27
  %rcc.tmp.165 = load i32, ptr %rcc.tmp.164
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %rcc.tmp.164
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.171 = load i32, ptr %i
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 1
  store i32 %rcc.tmp.172, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.175 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.176 = getelementptr %StringProcessor, ptr %rcc.tmp.175, i32 0, i32 25
  %rcc.tmp.177 = getelementptr [10 x i32], ptr %rcc.tmp.176, i32 0, i32 2
  %rcc.tmp.178 = load i32, ptr %matches_found
  store i32 %rcc.tmp.178, ptr %rcc.tmp.177
  ret void
}
define i1 @StringProcessor.verify_match.(%StringProcessor* %self.tmp, i32 %text_pos.tmp, i32 %pattern_index.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %text_pos..tmp = alloca i32 
  %pattern_index..tmp = alloca i32 
  %pattern_len = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %text_pos.tmp, ptr %text_pos..tmp
  store i32 %pattern_index.tmp, ptr %pattern_index..tmp
  %rcc.tmp.4 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %StringProcessor, ptr %rcc.tmp.4, i32 0, i32 3
  %rcc.tmp.6 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = getelementptr [5 x i32], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %pattern_len
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %pattern_len
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %StringProcessor, ptr %rcc.tmp.18, i32 0, i32 26
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %rcc.tmp.19
  %rcc.tmp.23 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %StringProcessor, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %text_pos..tmp
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [20 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %StringProcessor, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %pattern_index..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp ne i32 %rcc.tmp.30, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define i32 @StringProcessor.compute_edit_distance.(%StringProcessor* %self.tmp, i32 %str1_len.tmp, i32 %str2_len.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %str1_len..tmp = alloca i32 
  %str2_len..tmp = alloca i32 
  %str1 = alloca [500 x i32] 
  %fill.idx = alloca i32 
  %str2 = alloca [500 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %insert_cost = alloca i32 
  %delete_cost = alloca i32 
  %substitute_cost = alloca i32 
  %min_cost = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 %str1_len.tmp, ptr %str1_len..tmp
  store i32 %str2_len.tmp, ptr %str2_len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 500
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [500 x i32], ptr %str1, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
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
  %rcc.tmp.21 = getelementptr [500 x i32], ptr %str2, i32 0, i32 %rcc.tmp.20
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load i32, ptr %str1_len..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [500 x i32], ptr %str1, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = call i32 @getInt.()
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = load i32, ptr %str2_len..tmp
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.44, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [500 x i32], ptr %str2, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = call i32 @getInt.()
  store i32 %rcc.tmp.52, ptr %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = load i32, ptr %str1_len..tmp
  %rcc.tmp.62 = icmp sle i32 %rcc.tmp.60, %rcc.tmp.61
  br i1 %rcc.tmp.62, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.65 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.66 = getelementptr %StringProcessor, ptr %rcc.tmp.65, i32 0, i32 15
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [10 x i32], ptr %rcc.tmp.69, i32 0, i32 0
  %rcc.tmp.71 = load i32, ptr %i
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.79 = load i32, ptr %j
  %rcc.tmp.80 = load i32, ptr %str2_len..tmp
  %rcc.tmp.81 = icmp sle i32 %rcc.tmp.79, %rcc.tmp.80
  br i1 %rcc.tmp.81, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.84 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.85 = getelementptr %StringProcessor, ptr %rcc.tmp.84, i32 0, i32 15
  %rcc.tmp.86 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.85, i32 0, i32 0
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [10 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %j
  store i32 %rcc.tmp.90, ptr %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %j
  br label %while.cond.4
while.end.4:
  store i32 1, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = load i32, ptr %str1_len..tmp
  %rcc.tmp.100 = icmp sle i32 %rcc.tmp.98, %rcc.tmp.99
  br i1 %rcc.tmp.100, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  store i32 1, ptr %j
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = load i32, ptr %str2_len..tmp
  %rcc.tmp.107 = icmp sle i32 %rcc.tmp.105, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = sub i32 %rcc.tmp.110, 1
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [500 x i32], ptr %str1, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %j
  %rcc.tmp.116 = sub i32 %rcc.tmp.115, 1
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [500 x i32], ptr %str2, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = icmp eq i32 %rcc.tmp.114, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %if.then, label %if.else
if.then:
  %rcc.tmp.122 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.123 = getelementptr %StringProcessor, ptr %rcc.tmp.122, i32 0, i32 15
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.123, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %j
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [10 x i32], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.131 = getelementptr %StringProcessor, ptr %rcc.tmp.130, i32 0, i32 15
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = sub i32 %rcc.tmp.132, 1
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %j
  %rcc.tmp.137 = sub i32 %rcc.tmp.136, 1
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [10 x i32], ptr %rcc.tmp.135, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  store i32 %rcc.tmp.140, ptr %rcc.tmp.129
  br label %if.merge
if.else:
  %rcc.tmp.143 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.144 = getelementptr %StringProcessor, ptr %rcc.tmp.143, i32 0, i32 15
  %rcc.tmp.145 = load i32, ptr %i
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %j
  %rcc.tmp.149 = sub i32 %rcc.tmp.148, 1
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = getelementptr [10 x i32], ptr %rcc.tmp.147, i32 0, i32 %rcc.tmp.150
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.151
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.153, ptr %insert_cost
  %rcc.tmp.155 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.156 = getelementptr %StringProcessor, ptr %rcc.tmp.155, i32 0, i32 15
  %rcc.tmp.157 = load i32, ptr %i
  %rcc.tmp.158 = sub i32 %rcc.tmp.157, 1
  %rcc.tmp.159 = add i32 %rcc.tmp.158, 0
  %rcc.tmp.160 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.159
  %rcc.tmp.161 = load i32, ptr %j
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 0
  %rcc.tmp.163 = getelementptr [10 x i32], ptr %rcc.tmp.160, i32 0, i32 %rcc.tmp.162
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.163
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 1
  store i32 %rcc.tmp.165, ptr %delete_cost
  %rcc.tmp.167 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.168 = getelementptr %StringProcessor, ptr %rcc.tmp.167, i32 0, i32 15
  %rcc.tmp.169 = load i32, ptr %i
  %rcc.tmp.170 = sub i32 %rcc.tmp.169, 1
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 0
  %rcc.tmp.172 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.168, i32 0, i32 %rcc.tmp.171
  %rcc.tmp.173 = load i32, ptr %j
  %rcc.tmp.174 = sub i32 %rcc.tmp.173, 1
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 0
  %rcc.tmp.176 = getelementptr [10 x i32], ptr %rcc.tmp.172, i32 0, i32 %rcc.tmp.175
  %rcc.tmp.177 = load i32, ptr %rcc.tmp.176
  %rcc.tmp.178 = add i32 %rcc.tmp.177, 1
  store i32 %rcc.tmp.178, ptr %substitute_cost
  %rcc.tmp.180 = load i32, ptr %insert_cost
  %rcc.tmp.181 = load i32, ptr %delete_cost
  %rcc.tmp.182 = icmp slt i32 %rcc.tmp.180, %rcc.tmp.181
  br i1 %rcc.tmp.182, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.184 = load i32, ptr %insert_cost
  %rcc.tmp.185 = load i32, ptr %substitute_cost
  %rcc.tmp.186 = icmp slt i32 %rcc.tmp.184, %rcc.tmp.185
  br i1 %rcc.tmp.186, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.188 = load i32, ptr %insert_cost
  br label %if.merge.3
if.else.3:
  %rcc.tmp.190 = load i32, ptr %substitute_cost
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.192 = phi i32 [%rcc.tmp.188, %if.then.3], [%rcc.tmp.190, %if.else.3]
  br label %if.merge.2
if.else.2:
  %rcc.tmp.194 = load i32, ptr %delete_cost
  %rcc.tmp.195 = load i32, ptr %substitute_cost
  %rcc.tmp.196 = icmp slt i32 %rcc.tmp.194, %rcc.tmp.195
  br i1 %rcc.tmp.196, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.198 = load i32, ptr %delete_cost
  br label %if.merge.4
if.else.4:
  %rcc.tmp.200 = load i32, ptr %substitute_cost
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.202 = phi i32 [%rcc.tmp.198, %if.then.4], [%rcc.tmp.200, %if.else.4]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.204 = phi i32 [%rcc.tmp.192, %if.merge.3], [%rcc.tmp.202, %if.merge.4]
  store i32 %rcc.tmp.204, ptr %min_cost
  %rcc.tmp.206 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.207 = getelementptr %StringProcessor, ptr %rcc.tmp.206, i32 0, i32 15
  %rcc.tmp.208 = load i32, ptr %i
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 0
  %rcc.tmp.210 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.207, i32 0, i32 %rcc.tmp.209
  %rcc.tmp.211 = load i32, ptr %j
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 0
  %rcc.tmp.213 = getelementptr [10 x i32], ptr %rcc.tmp.210, i32 0, i32 %rcc.tmp.212
  %rcc.tmp.214 = load i32, ptr %min_cost
  store i32 %rcc.tmp.214, ptr %rcc.tmp.213
  br label %if.merge
if.merge:
  %rcc.tmp.217 = load i32, ptr %j
  %rcc.tmp.218 = add i32 %rcc.tmp.217, 1
  store i32 %rcc.tmp.218, ptr %j
  br label %while.cond.6
while.end.6:
  %rcc.tmp.221 = load i32, ptr %i
  %rcc.tmp.222 = add i32 %rcc.tmp.221, 1
  store i32 %rcc.tmp.222, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.225 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.226 = getelementptr %StringProcessor, ptr %rcc.tmp.225, i32 0, i32 15
  %rcc.tmp.227 = load i32, ptr %str1_len..tmp
  %rcc.tmp.228 = add i32 %rcc.tmp.227, 0
  %rcc.tmp.229 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.226, i32 0, i32 %rcc.tmp.228
  %rcc.tmp.230 = load i32, ptr %str2_len..tmp
  %rcc.tmp.231 = add i32 %rcc.tmp.230, 0
  %rcc.tmp.232 = getelementptr [10 x i32], ptr %rcc.tmp.229, i32 0, i32 %rcc.tmp.231
  %rcc.tmp.233 = load i32, ptr %rcc.tmp.232
  ret i32 %rcc.tmp.233
}
define i32 @StringProcessor.analyze_compression_potential.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %total_entropy = alloca i32 
  %i = alloca i32 
  %frequency = alloca i32 
  %probability = alloca i32 
  %log_approx = alloca i32 
  %temp = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %total_entropy
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 256
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %StringProcessor, ptr %rcc.tmp.9, i32 0, i32 16
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = getelementptr [256 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp sgt i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %StringProcessor, ptr %rcc.tmp.17, i32 0, i32 16
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [256 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %frequency
  %rcc.tmp.24 = load i32, ptr %frequency
  %rcc.tmp.25 = mul i32 %rcc.tmp.24, 1000
  %rcc.tmp.26 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.27 = getelementptr %StringProcessor, ptr %rcc.tmp.26, i32 0, i32 1
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = sdiv i32 %rcc.tmp.25, %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %probability
  store i32 0, ptr %log_approx
  %rcc.tmp.32 = load i32, ptr %probability
  store i32 %rcc.tmp.32, ptr %temp
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %temp
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.35, 1
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load i32, ptr %log_approx
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %log_approx
  %rcc.tmp.42 = load i32, ptr %temp
  %rcc.tmp.43 = sdiv i32 %rcc.tmp.42, 2
  store i32 %rcc.tmp.43, ptr %temp
  br label %while.cond.2
while.end.2:
  %rcc.tmp.46 = load i32, ptr %frequency
  %rcc.tmp.47 = load i32, ptr %log_approx
  %rcc.tmp.48 = mul i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %total_entropy
  %rcc.tmp.50 = add i32 %rcc.tmp.49, %rcc.tmp.48
  store i32 %rcc.tmp.50, ptr %total_entropy
  %rcc.tmp.52 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %StringProcessor, ptr %rcc.tmp.52, i32 0, i32 18
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [256 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %log_approx
  %rcc.tmp.58 = icmp sgt i32 %rcc.tmp.57, 0
  br i1 %rcc.tmp.58, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.60 = load i32, ptr %log_approx
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.63 = phi i32 [%rcc.tmp.60, %if.then.2], [1, %if.else.2]
  store i32 %rcc.tmp.63, ptr %rcc.tmp.56
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.71 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.72 = getelementptr %StringProcessor, ptr %rcc.tmp.71, i32 0, i32 1
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = mul i32 %rcc.tmp.73, 8
  %rcc.tmp.75 = load i32, ptr %total_entropy
  %rcc.tmp.76 = sub i32 %rcc.tmp.74, %rcc.tmp.75
  ret i32 %rcc.tmp.76
}
define i32 @StringProcessor.find_longest_repeated_substring.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %max_lcp = alloca i32 
  %i = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %max_lcp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %StringProcessor, ptr %rcc.tmp.6, i32 0, i32 1
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %StringProcessor, ptr %rcc.tmp.13, i32 0, i32 6
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [20 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %max_lcp
  %rcc.tmp.20 = icmp sgt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  %rcc.tmp.22 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %StringProcessor, ptr %rcc.tmp.22, i32 0, i32 6
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [20 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %max_lcp
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i32, ptr %max_lcp
  ret i32 %rcc.tmp.35
}
define void @StringProcessor.perform_comprehensive_analysis.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %pattern_idx = alloca i32 
  %compression_potential = alloca i32 
  %longest_repeat = alloca i32 
  %avg_word_length = alloca i32 
  %text_complexity = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %pattern_idx
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %pattern_idx
  %rcc.tmp.5 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %StringProcessor, ptr %rcc.tmp.5, i32 0, i32 4
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.12 = load i32, ptr %pattern_idx
  call void @StringProcessor.kmp_search.(%StringProcessor* %rcc.tmp.11, i32 %rcc.tmp.12)
  %rcc.tmp.14 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.15 = load i32, ptr %pattern_idx
  call void @StringProcessor.boyer_moore_search.(%StringProcessor* %rcc.tmp.14, i32 %rcc.tmp.15)
  %rcc.tmp.17 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.18 = load i32, ptr %pattern_idx
  call void @StringProcessor.rabin_karp_search.(%StringProcessor* %rcc.tmp.17, i32 %rcc.tmp.18)
  %rcc.tmp.20 = load i32, ptr %pattern_idx
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %pattern_idx
  br label %while.cond
while.end:
  %rcc.tmp.24 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.25 = call i32 @StringProcessor.analyze_compression_potential.(%StringProcessor* %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %compression_potential
  %rcc.tmp.27 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %StringProcessor, ptr %rcc.tmp.27, i32 0, i32 25
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %compression_potential
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.33 = call i32 @StringProcessor.find_longest_repeated_substring.(%StringProcessor* %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %longest_repeat
  %rcc.tmp.35 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %StringProcessor, ptr %rcc.tmp.35, i32 0, i32 25
  %rcc.tmp.37 = getelementptr [10 x i32], ptr %rcc.tmp.36, i32 0, i32 4
  %rcc.tmp.38 = load i32, ptr %longest_repeat
  store i32 %rcc.tmp.38, ptr %rcc.tmp.37
  %rcc.tmp.40 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.41 = getelementptr %StringProcessor, ptr %rcc.tmp.40, i32 0, i32 19
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = icmp sgt i32 %rcc.tmp.42, 0
  br i1 %rcc.tmp.43, label %if.then, label %if.else
if.then:
  %rcc.tmp.45 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %StringProcessor, ptr %rcc.tmp.45, i32 0, i32 1
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %StringProcessor, ptr %rcc.tmp.48, i32 0, i32 19
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = sdiv i32 %rcc.tmp.47, %rcc.tmp.50
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.54 = phi i32 [%rcc.tmp.51, %if.then], [0, %if.else]
  store i32 %rcc.tmp.54, ptr %avg_word_length
  %rcc.tmp.56 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %StringProcessor, ptr %rcc.tmp.56, i32 0, i32 22
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = mul i32 %rcc.tmp.58, 100
  %rcc.tmp.60 = sdiv i32 %rcc.tmp.59, 256
  store i32 %rcc.tmp.60, ptr %text_complexity
  %rcc.tmp.62 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.63 = getelementptr %StringProcessor, ptr %rcc.tmp.62, i32 0, i32 25
  %rcc.tmp.64 = getelementptr [10 x i32], ptr %rcc.tmp.63, i32 0, i32 5
  %rcc.tmp.65 = load i32, ptr %avg_word_length
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.68 = getelementptr %StringProcessor, ptr %rcc.tmp.67, i32 0, i32 25
  %rcc.tmp.69 = getelementptr [10 x i32], ptr %rcc.tmp.68, i32 0, i32 6
  %rcc.tmp.70 = load i32, ptr %text_complexity
  store i32 %rcc.tmp.70, ptr %rcc.tmp.69
  ret void
}
define void @StringProcessor.output_results.(%StringProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %StringProcessor* 
  %i = alloca i32 
  %pattern_complexity = alloca i32 
  %text_complexity = alloca i32 
  %final_score = alloca i32 
  store %StringProcessor* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %StringProcessor, ptr %rcc.tmp.2, i32 0, i32 1
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %StringProcessor, ptr %rcc.tmp.6, i32 0, i32 19
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %StringProcessor, ptr %rcc.tmp.10, i32 0, i32 20
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %StringProcessor, ptr %rcc.tmp.14, i32 0, i32 21
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %StringProcessor, ptr %rcc.tmp.18, i32 0, i32 22
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  call void @printlnInt.(i32 %rcc.tmp.20)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %StringProcessor, ptr %rcc.tmp.25, i32 0, i32 4
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.31 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.32 = getelementptr %StringProcessor, ptr %rcc.tmp.31, i32 0, i32 24
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [5 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  call void @printlnInt.(i32 %rcc.tmp.36)
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.42 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.43 = getelementptr %StringProcessor, ptr %rcc.tmp.42, i32 0, i32 26
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  call void @printlnInt.(i32 %rcc.tmp.44)
  %rcc.tmp.46 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %StringProcessor, ptr %rcc.tmp.46, i32 0, i32 27
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  call void @printlnInt.(i32 %rcc.tmp.48)
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.52, 7
  br i1 %rcc.tmp.53, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.56 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.57 = getelementptr %StringProcessor, ptr %rcc.tmp.56, i32 0, i32 25
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [10 x i32], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  call void @printlnInt.(i32 %rcc.tmp.61)
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.69, 10
  br i1 %rcc.tmp.70, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.74 = getelementptr %StringProcessor, ptr %rcc.tmp.73, i32 0, i32 1
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.72, %rcc.tmp.75
  br label %sc.merge
sc.merge:
  %rcc.tmp.78 = phi i1 [0, %while.cond.3], [%rcc.tmp.76, %and.rhs]
  br i1 %rcc.tmp.78, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.81 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.82 = getelementptr %StringProcessor, ptr %rcc.tmp.81, i32 0, i32 5
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [20 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  call void @printlnInt.(i32 %rcc.tmp.86)
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.92 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.93 = getelementptr %StringProcessor, ptr %rcc.tmp.92, i32 0, i32 26
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.96 = getelementptr %StringProcessor, ptr %rcc.tmp.95, i32 0, i32 4
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  %rcc.tmp.99 = sdiv i32 %rcc.tmp.94, %rcc.tmp.98
  store i32 %rcc.tmp.99, ptr %pattern_complexity
  %rcc.tmp.101 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.102 = getelementptr %StringProcessor, ptr %rcc.tmp.101, i32 0, i32 22
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.105 = getelementptr %StringProcessor, ptr %rcc.tmp.104, i32 0, i32 19
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.105
  %rcc.tmp.107 = mul i32 %rcc.tmp.103, %rcc.tmp.106
  %rcc.tmp.108 = sdiv i32 %rcc.tmp.107, 100
  store i32 %rcc.tmp.108, ptr %text_complexity
  %rcc.tmp.110 = load i32, ptr %pattern_complexity
  %rcc.tmp.111 = load i32, ptr %text_complexity
  %rcc.tmp.112 = add i32 %rcc.tmp.110, %rcc.tmp.111
  %rcc.tmp.113 = load %StringProcessor*, ptr %self..tmp
  %rcc.tmp.114 = getelementptr %StringProcessor, ptr %rcc.tmp.113, i32 0, i32 25
  %rcc.tmp.115 = getelementptr [10 x i32], ptr %rcc.tmp.114, i32 0, i32 3
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = add i32 %rcc.tmp.112, %rcc.tmp.116
  store i32 %rcc.tmp.117, ptr %final_score
  %rcc.tmp.119 = load i32, ptr %final_score
  call void @printlnInt.(i32 %rcc.tmp.119)
  ret void
}
define void @StringProcessor.new.(%StringProcessor* sret(%StringProcessor) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %fill.idx.7 = alloca i32 
  %fill.idx.8 = alloca i32 
  %fill.idx.9 = alloca i32 
  %fill.idx.10 = alloca i32 
  %fill.idx.11 = alloca i32 
  %fill.idx.12 = alloca i32 
  %fill.idx.13 = alloca i32 
  %fill.idx.14 = alloca i32 
  %fill.idx.15 = alloca i32 
  %fill.idx.16 = alloca i32 
  %rcc.tmp.1 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 20
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [20 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.16 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %rcc.tmp.16, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.15, i32 0, i32 1
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.59 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [10 x i32], ptr %rcc.tmp.58, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.15, i32 0, i32 3
  %rcc.tmp.80 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.80
  %rcc.tmp.82 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.90
  %rcc.tmp.92 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.92
  %rcc.tmp.94 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.96
  %rcc.tmp.98 = getelementptr [10 x i32], ptr %rcc.tmp.79, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [5 x [10 x i32]], ptr %rcc.tmp.15, i32 0, i32 4
  %rcc.tmp.101 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.101
  %rcc.tmp.103 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.103
  %rcc.tmp.105 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.111
  %rcc.tmp.113 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.113
  %rcc.tmp.115 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.115
  %rcc.tmp.117 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.117
  %rcc.tmp.119 = getelementptr [10 x i32], ptr %rcc.tmp.100, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.119
  %rcc.tmp.121 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.122 = getelementptr [5 x i32], ptr %rcc.tmp.121, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.122
  %rcc.tmp.124 = getelementptr [5 x i32], ptr %rcc.tmp.121, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.124
  %rcc.tmp.126 = getelementptr [5 x i32], ptr %rcc.tmp.121, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.126
  %rcc.tmp.128 = getelementptr [5 x i32], ptr %rcc.tmp.121, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.128
  %rcc.tmp.130 = getelementptr [5 x i32], ptr %rcc.tmp.121, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.132
  %rcc.tmp.134 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.137 = load i32, ptr %fill.idx.2
  %rcc.tmp.138 = icmp slt i32 %rcc.tmp.137, 20
  br i1 %rcc.tmp.138, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.140 = load i32, ptr %fill.idx.2
  %rcc.tmp.141 = getelementptr [20 x i32], ptr %rcc.tmp.134, i32 0, i32 %rcc.tmp.140
  store i32 0, ptr %rcc.tmp.141
  %rcc.tmp.143 = add i32 %rcc.tmp.140, 1
  store i32 %rcc.tmp.143, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.146 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.149 = load i32, ptr %fill.idx.3
  %rcc.tmp.150 = icmp slt i32 %rcc.tmp.149, 20
  br i1 %rcc.tmp.150, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.152 = load i32, ptr %fill.idx.3
  %rcc.tmp.153 = getelementptr [20 x i32], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.152
  store i32 0, ptr %rcc.tmp.153
  %rcc.tmp.155 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.155, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.158 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 7
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.161 = load i32, ptr %fill.idx.4
  %rcc.tmp.162 = icmp slt i32 %rcc.tmp.161, 20
  br i1 %rcc.tmp.162, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.164 = load i32, ptr %fill.idx.4
  %rcc.tmp.165 = getelementptr [20 x i32], ptr %rcc.tmp.158, i32 0, i32 %rcc.tmp.164
  store i32 0, ptr %rcc.tmp.165
  %rcc.tmp.167 = add i32 %rcc.tmp.164, 1
  store i32 %rcc.tmp.167, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.170 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 8
  %rcc.tmp.171 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.171
  %rcc.tmp.173 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.173
  %rcc.tmp.175 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.175
  %rcc.tmp.177 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.177
  %rcc.tmp.179 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.179
  %rcc.tmp.181 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.181
  %rcc.tmp.183 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.183
  %rcc.tmp.185 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.185
  %rcc.tmp.187 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.187
  %rcc.tmp.189 = getelementptr [10 x i32], ptr %rcc.tmp.170, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.189
  %rcc.tmp.191 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 9
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.194 = load i32, ptr %fill.idx.5
  %rcc.tmp.195 = icmp slt i32 %rcc.tmp.194, 256
  br i1 %rcc.tmp.195, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.197 = load i32, ptr %fill.idx.5
  %rcc.tmp.198 = getelementptr [256 x i32], ptr %rcc.tmp.191, i32 0, i32 %rcc.tmp.197
  store i32 0, ptr %rcc.tmp.198
  %rcc.tmp.200 = add i32 %rcc.tmp.197, 1
  store i32 %rcc.tmp.200, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.203 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 10
  %rcc.tmp.204 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.204
  %rcc.tmp.206 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.206
  %rcc.tmp.208 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.208
  %rcc.tmp.210 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.210
  %rcc.tmp.212 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.212
  %rcc.tmp.214 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.214
  %rcc.tmp.216 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.216
  %rcc.tmp.218 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.218
  %rcc.tmp.220 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.220
  %rcc.tmp.222 = getelementptr [10 x i32], ptr %rcc.tmp.203, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.222
  %rcc.tmp.224 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 11
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.227 = load i32, ptr %fill.idx.6
  %rcc.tmp.228 = icmp slt i32 %rcc.tmp.227, 50
  br i1 %rcc.tmp.228, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.230 = load i32, ptr %fill.idx.6
  %rcc.tmp.231 = getelementptr [50 x i32], ptr %rcc.tmp.224, i32 0, i32 %rcc.tmp.230
  store i32 0, ptr %rcc.tmp.231
  %rcc.tmp.233 = add i32 %rcc.tmp.230, 1
  store i32 %rcc.tmp.233, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.236 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 12
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.239 = load i32, ptr %fill.idx.7
  %rcc.tmp.240 = icmp slt i32 %rcc.tmp.239, 20
  br i1 %rcc.tmp.240, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.242 = load i32, ptr %fill.idx.7
  %rcc.tmp.243 = getelementptr [20 x i32], ptr %rcc.tmp.236, i32 0, i32 %rcc.tmp.242
  store i32 0, ptr %rcc.tmp.243
  %rcc.tmp.245 = add i32 %rcc.tmp.242, 1
  store i32 %rcc.tmp.245, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  %rcc.tmp.248 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 13
  store i32 256, ptr %rcc.tmp.248
  %rcc.tmp.250 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 14
  store i32 10007, ptr %rcc.tmp.250
  %rcc.tmp.252 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 15
  %rcc.tmp.253 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 0
  %rcc.tmp.254 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.254
  %rcc.tmp.256 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.256
  %rcc.tmp.258 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.258
  %rcc.tmp.260 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.260
  %rcc.tmp.262 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.262
  %rcc.tmp.264 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.264
  %rcc.tmp.266 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.266
  %rcc.tmp.268 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.268
  %rcc.tmp.270 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.270
  %rcc.tmp.272 = getelementptr [10 x i32], ptr %rcc.tmp.253, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.272
  %rcc.tmp.274 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 1
  %rcc.tmp.275 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.275
  %rcc.tmp.277 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.277
  %rcc.tmp.279 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.279
  %rcc.tmp.281 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.281
  %rcc.tmp.283 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.283
  %rcc.tmp.285 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.285
  %rcc.tmp.287 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.287
  %rcc.tmp.289 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.289
  %rcc.tmp.291 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.291
  %rcc.tmp.293 = getelementptr [10 x i32], ptr %rcc.tmp.274, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.293
  %rcc.tmp.295 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 2
  %rcc.tmp.296 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.296
  %rcc.tmp.298 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.298
  %rcc.tmp.300 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.300
  %rcc.tmp.302 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.302
  %rcc.tmp.304 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.304
  %rcc.tmp.306 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.306
  %rcc.tmp.308 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.308
  %rcc.tmp.310 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.310
  %rcc.tmp.312 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.312
  %rcc.tmp.314 = getelementptr [10 x i32], ptr %rcc.tmp.295, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.314
  %rcc.tmp.316 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 3
  %rcc.tmp.317 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.317
  %rcc.tmp.319 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.319
  %rcc.tmp.321 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.321
  %rcc.tmp.323 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.323
  %rcc.tmp.325 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.325
  %rcc.tmp.327 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.327
  %rcc.tmp.329 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.329
  %rcc.tmp.331 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.331
  %rcc.tmp.333 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.333
  %rcc.tmp.335 = getelementptr [10 x i32], ptr %rcc.tmp.316, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.335
  %rcc.tmp.337 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 4
  %rcc.tmp.338 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.338
  %rcc.tmp.340 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.340
  %rcc.tmp.342 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.342
  %rcc.tmp.344 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.344
  %rcc.tmp.346 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.346
  %rcc.tmp.348 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.348
  %rcc.tmp.350 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.350
  %rcc.tmp.352 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.352
  %rcc.tmp.354 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.354
  %rcc.tmp.356 = getelementptr [10 x i32], ptr %rcc.tmp.337, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.356
  %rcc.tmp.358 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 5
  %rcc.tmp.359 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.359
  %rcc.tmp.361 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.361
  %rcc.tmp.363 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.363
  %rcc.tmp.365 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.365
  %rcc.tmp.367 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.367
  %rcc.tmp.369 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.369
  %rcc.tmp.371 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.371
  %rcc.tmp.373 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.373
  %rcc.tmp.375 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.375
  %rcc.tmp.377 = getelementptr [10 x i32], ptr %rcc.tmp.358, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.377
  %rcc.tmp.379 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 6
  %rcc.tmp.380 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.380
  %rcc.tmp.382 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.382
  %rcc.tmp.384 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.384
  %rcc.tmp.386 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.386
  %rcc.tmp.388 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.388
  %rcc.tmp.390 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.390
  %rcc.tmp.392 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.392
  %rcc.tmp.394 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.394
  %rcc.tmp.396 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.396
  %rcc.tmp.398 = getelementptr [10 x i32], ptr %rcc.tmp.379, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.398
  %rcc.tmp.400 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 7
  %rcc.tmp.401 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.401
  %rcc.tmp.403 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.403
  %rcc.tmp.405 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.405
  %rcc.tmp.407 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.407
  %rcc.tmp.409 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.409
  %rcc.tmp.411 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.411
  %rcc.tmp.413 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.413
  %rcc.tmp.415 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.415
  %rcc.tmp.417 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.417
  %rcc.tmp.419 = getelementptr [10 x i32], ptr %rcc.tmp.400, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.419
  %rcc.tmp.421 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 8
  %rcc.tmp.422 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.422
  %rcc.tmp.424 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.424
  %rcc.tmp.426 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.426
  %rcc.tmp.428 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.428
  %rcc.tmp.430 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.430
  %rcc.tmp.432 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.432
  %rcc.tmp.434 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.434
  %rcc.tmp.436 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.436
  %rcc.tmp.438 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.438
  %rcc.tmp.440 = getelementptr [10 x i32], ptr %rcc.tmp.421, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.440
  %rcc.tmp.442 = getelementptr [10 x [10 x i32]], ptr %rcc.tmp.252, i32 0, i32 9
  %rcc.tmp.443 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.443
  %rcc.tmp.445 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.445
  %rcc.tmp.447 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.447
  %rcc.tmp.449 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.449
  %rcc.tmp.451 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.451
  %rcc.tmp.453 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.453
  %rcc.tmp.455 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.455
  %rcc.tmp.457 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.457
  %rcc.tmp.459 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.459
  %rcc.tmp.461 = getelementptr [10 x i32], ptr %rcc.tmp.442, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.461
  %rcc.tmp.463 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 16
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.466 = load i32, ptr %fill.idx.8
  %rcc.tmp.467 = icmp slt i32 %rcc.tmp.466, 256
  br i1 %rcc.tmp.467, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.469 = load i32, ptr %fill.idx.8
  %rcc.tmp.470 = getelementptr [256 x i32], ptr %rcc.tmp.463, i32 0, i32 %rcc.tmp.469
  store i32 0, ptr %rcc.tmp.470
  %rcc.tmp.472 = add i32 %rcc.tmp.469, 1
  store i32 %rcc.tmp.472, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  %rcc.tmp.475 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 17
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.478 = load i32, ptr %fill.idx.9
  %rcc.tmp.479 = icmp slt i32 %rcc.tmp.478, 256
  br i1 %rcc.tmp.479, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.481 = load i32, ptr %fill.idx.9
  %rcc.tmp.482 = getelementptr [256 x [20 x i32]], ptr %rcc.tmp.475, i32 0, i32 %rcc.tmp.481
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.485 = load i32, ptr %fill.idx.10
  %rcc.tmp.486 = icmp slt i32 %rcc.tmp.485, 20
  br i1 %rcc.tmp.486, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.488 = load i32, ptr %fill.idx.10
  %rcc.tmp.489 = getelementptr [20 x i32], ptr %rcc.tmp.482, i32 0, i32 %rcc.tmp.488
  store i32 0, ptr %rcc.tmp.489
  %rcc.tmp.491 = add i32 %rcc.tmp.488, 1
  store i32 %rcc.tmp.491, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  %rcc.tmp.494 = add i32 %rcc.tmp.481, 1
  store i32 %rcc.tmp.494, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  %rcc.tmp.497 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 18
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.500 = load i32, ptr %fill.idx.11
  %rcc.tmp.501 = icmp slt i32 %rcc.tmp.500, 256
  br i1 %rcc.tmp.501, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.503 = load i32, ptr %fill.idx.11
  %rcc.tmp.504 = getelementptr [256 x i32], ptr %rcc.tmp.497, i32 0, i32 %rcc.tmp.503
  store i32 0, ptr %rcc.tmp.504
  %rcc.tmp.506 = add i32 %rcc.tmp.503, 1
  store i32 %rcc.tmp.506, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  %rcc.tmp.509 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 19
  store i32 0, ptr %rcc.tmp.509
  %rcc.tmp.511 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 20
  store i32 0, ptr %rcc.tmp.511
  %rcc.tmp.513 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 21
  store i32 0, ptr %rcc.tmp.513
  %rcc.tmp.515 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 22
  store i32 0, ptr %rcc.tmp.515
  %rcc.tmp.517 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 23
  %rcc.tmp.518 = getelementptr [5 x [20 x i32]], ptr %rcc.tmp.517, i32 0, i32 0
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.521 = load i32, ptr %fill.idx.12
  %rcc.tmp.522 = icmp slt i32 %rcc.tmp.521, 20
  br i1 %rcc.tmp.522, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.524 = load i32, ptr %fill.idx.12
  %rcc.tmp.525 = getelementptr [20 x i32], ptr %rcc.tmp.518, i32 0, i32 %rcc.tmp.524
  store i32 0, ptr %rcc.tmp.525
  %rcc.tmp.527 = add i32 %rcc.tmp.524, 1
  store i32 %rcc.tmp.527, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  %rcc.tmp.530 = getelementptr [5 x [20 x i32]], ptr %rcc.tmp.517, i32 0, i32 1
  store i32 0, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.cond.13:
  %rcc.tmp.533 = load i32, ptr %fill.idx.13
  %rcc.tmp.534 = icmp slt i32 %rcc.tmp.533, 20
  br i1 %rcc.tmp.534, label %array.fill.body.13, label %array.fill.end.13
array.fill.body.13:
  %rcc.tmp.536 = load i32, ptr %fill.idx.13
  %rcc.tmp.537 = getelementptr [20 x i32], ptr %rcc.tmp.530, i32 0, i32 %rcc.tmp.536
  store i32 0, ptr %rcc.tmp.537
  %rcc.tmp.539 = add i32 %rcc.tmp.536, 1
  store i32 %rcc.tmp.539, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.end.13:
  %rcc.tmp.542 = getelementptr [5 x [20 x i32]], ptr %rcc.tmp.517, i32 0, i32 2
  store i32 0, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.cond.14:
  %rcc.tmp.545 = load i32, ptr %fill.idx.14
  %rcc.tmp.546 = icmp slt i32 %rcc.tmp.545, 20
  br i1 %rcc.tmp.546, label %array.fill.body.14, label %array.fill.end.14
array.fill.body.14:
  %rcc.tmp.548 = load i32, ptr %fill.idx.14
  %rcc.tmp.549 = getelementptr [20 x i32], ptr %rcc.tmp.542, i32 0, i32 %rcc.tmp.548
  store i32 0, ptr %rcc.tmp.549
  %rcc.tmp.551 = add i32 %rcc.tmp.548, 1
  store i32 %rcc.tmp.551, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.end.14:
  %rcc.tmp.554 = getelementptr [5 x [20 x i32]], ptr %rcc.tmp.517, i32 0, i32 3
  store i32 0, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.cond.15:
  %rcc.tmp.557 = load i32, ptr %fill.idx.15
  %rcc.tmp.558 = icmp slt i32 %rcc.tmp.557, 20
  br i1 %rcc.tmp.558, label %array.fill.body.15, label %array.fill.end.15
array.fill.body.15:
  %rcc.tmp.560 = load i32, ptr %fill.idx.15
  %rcc.tmp.561 = getelementptr [20 x i32], ptr %rcc.tmp.554, i32 0, i32 %rcc.tmp.560
  store i32 0, ptr %rcc.tmp.561
  %rcc.tmp.563 = add i32 %rcc.tmp.560, 1
  store i32 %rcc.tmp.563, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.end.15:
  %rcc.tmp.566 = getelementptr [5 x [20 x i32]], ptr %rcc.tmp.517, i32 0, i32 4
  store i32 0, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.cond.16:
  %rcc.tmp.569 = load i32, ptr %fill.idx.16
  %rcc.tmp.570 = icmp slt i32 %rcc.tmp.569, 20
  br i1 %rcc.tmp.570, label %array.fill.body.16, label %array.fill.end.16
array.fill.body.16:
  %rcc.tmp.572 = load i32, ptr %fill.idx.16
  %rcc.tmp.573 = getelementptr [20 x i32], ptr %rcc.tmp.566, i32 0, i32 %rcc.tmp.572
  store i32 0, ptr %rcc.tmp.573
  %rcc.tmp.575 = add i32 %rcc.tmp.572, 1
  store i32 %rcc.tmp.575, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.end.16:
  %rcc.tmp.578 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 24
  %rcc.tmp.579 = getelementptr [5 x i32], ptr %rcc.tmp.578, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.579
  %rcc.tmp.581 = getelementptr [5 x i32], ptr %rcc.tmp.578, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.581
  %rcc.tmp.583 = getelementptr [5 x i32], ptr %rcc.tmp.578, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.583
  %rcc.tmp.585 = getelementptr [5 x i32], ptr %rcc.tmp.578, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.585
  %rcc.tmp.587 = getelementptr [5 x i32], ptr %rcc.tmp.578, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.587
  %rcc.tmp.589 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 25
  %rcc.tmp.590 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.590
  %rcc.tmp.592 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.592
  %rcc.tmp.594 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.594
  %rcc.tmp.596 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.596
  %rcc.tmp.598 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.598
  %rcc.tmp.600 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.600
  %rcc.tmp.602 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.602
  %rcc.tmp.604 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.604
  %rcc.tmp.606 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.606
  %rcc.tmp.608 = getelementptr [10 x i32], ptr %rcc.tmp.589, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.608
  %rcc.tmp.610 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 26
  store i32 0, ptr %rcc.tmp.610
  %rcc.tmp.612 = getelementptr %StringProcessor, ptr %ret.slot, i32 0, i32 27
  store i32 0, ptr %rcc.tmp.612
  ret void
}
define void @RegexMatcher.compile_pattern.(%RegexMatcher* %self.tmp, i32 %length.tmp) {
entry:
  %self..tmp = alloca %RegexMatcher* 
  %length..tmp = alloca i32 
  %i = alloca i32 
  store %RegexMatcher* %self.tmp, ptr %self..tmp
  store i32 %length.tmp, ptr %length..tmp
  %rcc.tmp.3 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %RegexMatcher, ptr %rcc.tmp.3, i32 0, i32 1
  %rcc.tmp.5 = load i32, ptr %length..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %length..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %RegexMatcher, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load %RegexMatcher*, ptr %self..tmp
  call void @RegexMatcher.build_nfa.(%RegexMatcher* %rcc.tmp.25)
  ret void
}
define void @RegexMatcher.build_nfa.(%RegexMatcher* %self.tmp) {
entry:
  %self..tmp = alloca %RegexMatcher* 
  %i = alloca i32 
  %j = alloca i32 
  %ch = alloca i32 
  store %RegexMatcher* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %RegexMatcher, ptr %rcc.tmp.2, i32 0, i32 3
  %rcc.tmp.4 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %RegexMatcher, ptr %rcc.tmp.4, i32 0, i32 1
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.7, ptr %rcc.tmp.3
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %RegexMatcher, ptr %rcc.tmp.12, i32 0, i32 3
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.20, 100
  br i1 %rcc.tmp.21, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.24 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.25 = getelementptr %RegexMatcher, ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [100 x [100 x i1]], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [100 x i1], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  store i1 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %j
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %RegexMatcher, ptr %rcc.tmp.44, i32 0, i32 1
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.50 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.51 = getelementptr %RegexMatcher, ptr %rcc.tmp.50, i32 0, i32 0
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [100 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  store i32 %rcc.tmp.55, ptr %ch
  %rcc.tmp.57 = load i32, ptr %ch
  %rcc.tmp.58 = icmp sge i32 %rcc.tmp.57, 0
  br i1 %rcc.tmp.58, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.60 = load i32, ptr %ch
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.60, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.63 = phi i1 [0, %while.body.3], [%rcc.tmp.61, %and.rhs]
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  %rcc.tmp.65 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.66 = getelementptr %RegexMatcher, ptr %rcc.tmp.65, i32 0, i32 2
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [100 x [100 x i1]], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %ch
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [100 x i1], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  store i1 1, ptr %rcc.tmp.72
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define i1 @RegexMatcher.match_text.(%RegexMatcher* %self.tmp, [20 x i32]* %text.tmp, i32 %text_length.tmp) {
entry:
  %self..tmp = alloca %RegexMatcher* 
  %text..tmp = alloca [20 x i32]* 
  %text_length..tmp = alloca i32 
  %current_states = alloca [100 x i1] 
  %fill.idx = alloca i32 
  %next_states = alloca [100 x i1] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %ch = alloca i32 
  %j = alloca i32 
  store %RegexMatcher* %self.tmp, ptr %self..tmp
  store [20 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_length.tmp, ptr %text_length..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 100
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [100 x i1], ptr %current_states, i32 0, i32 %rcc.tmp.9
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
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
  %rcc.tmp.21 = getelementptr [100 x i1], ptr %next_states, i32 0, i32 %rcc.tmp.20
  store i1 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.23, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.26 = getelementptr [100 x i1], ptr %current_states, i32 0, i32 0
  store i1 1, ptr %rcc.tmp.26
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %text_length..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [20 x i32]*, ptr %text..tmp
  %rcc.tmp.38 = getelementptr [20 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %ch
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.43, 100
  br i1 %rcc.tmp.44, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [100 x i1], ptr %next_states, i32 0, i32 %rcc.tmp.48
  store i1 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %j
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %RegexMatcher, ptr %rcc.tmp.58, i32 0, i32 3
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.57, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [100 x i1], ptr %current_states, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i1, ptr %rcc.tmp.66
  br i1 %rcc.tmp.67, label %if.then, label %if.else
if.then:
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.71 = getelementptr %RegexMatcher, ptr %rcc.tmp.70, i32 0, i32 1
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.69, %rcc.tmp.72
  br i1 %rcc.tmp.73, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.75 = load i32, ptr %ch
  %rcc.tmp.76 = icmp sge i32 %rcc.tmp.75, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.78 = phi i1 [0, %if.then], [%rcc.tmp.76, %and.rhs]
  br i1 %rcc.tmp.78, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.80 = load i32, ptr %ch
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.80, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.83 = phi i1 [0, %sc.merge], [%rcc.tmp.81, %and.rhs.2]
  br i1 %rcc.tmp.83, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.85 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.86 = getelementptr %RegexMatcher, ptr %rcc.tmp.85, i32 0, i32 2
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [100 x [100 x i1]], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %ch
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [100 x i1], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i1, ptr %rcc.tmp.92
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.95 = phi i1 [0, %sc.merge.2], [%rcc.tmp.93, %and.rhs.3]
  br i1 %rcc.tmp.95, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.97 = load i32, ptr %j
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [100 x i1], ptr %next_states, i32 0, i32 %rcc.tmp.99
  store i1 1, ptr %rcc.tmp.100
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %j
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.112 = load i32, ptr %j
  %rcc.tmp.113 = icmp slt i32 %rcc.tmp.112, 100
  br i1 %rcc.tmp.113, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.116 = load i32, ptr %j
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [100 x i1], ptr %current_states, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %j
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 0
  %rcc.tmp.121 = getelementptr [100 x i1], ptr %next_states, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i1, ptr %rcc.tmp.121
  store i1 %rcc.tmp.122, ptr %rcc.tmp.118
  %rcc.tmp.124 = load i32, ptr %j
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  store i32 %rcc.tmp.129, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.132 = load %RegexMatcher*, ptr %self..tmp
  %rcc.tmp.133 = getelementptr %RegexMatcher, ptr %rcc.tmp.132, i32 0, i32 1
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [100 x i1], ptr %current_states, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i1, ptr %rcc.tmp.136
  ret i1 %rcc.tmp.137
}
define void @RegexMatcher.new.(%RegexMatcher* sret(%RegexMatcher) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %rcc.tmp.1 = getelementptr %RegexMatcher, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %RegexMatcher, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %RegexMatcher, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 100
  br i1 %rcc.tmp.19, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.21 = load i32, ptr %fill.idx.2
  %rcc.tmp.22 = getelementptr [100 x [100 x i1]], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.21
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.25 = load i32, ptr %fill.idx.3
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 100
  br i1 %rcc.tmp.26, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = getelementptr [100 x i1], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.28
  store i1 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.31, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.34 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.34, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.37 = getelementptr %RegexMatcher, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %RegexMatcher, ptr %ret.slot, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.39
  ret void
}
define void @main() {
entry:
  %processor = alloca %StringProcessor 
  %text_length = alloca i32 
  %pattern_count = alloca i32 
  %i = alloca i32 
  %pattern_length = alloca i32 
  %str1_len = alloca i32 
  %str2_len = alloca i32 
  %edit_distance = alloca i32 
  %regex_matcher = alloca %RegexMatcher 
  %regex_pattern_length = alloca i32 
  %regex_result = alloca i1 
  %transformation_iterations = alloca i32 
  %total_transformations = alloca i32 
  %shift = alloca i32 
  %j = alloca i32 
  %ch = alloca i32 
  %final_complexity = alloca i32 
  call void @StringProcessor.new.(%StringProcessor* %processor)
  %rcc.tmp.2 = call i32 @getInt.()
  store i32 %rcc.tmp.2, ptr %text_length
  %rcc.tmp.4 = load i32, ptr %text_length
  call void @StringProcessor.initialize_text.(%StringProcessor* %processor, i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @getInt.()
  store i32 %rcc.tmp.6, ptr %pattern_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %pattern_count
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = call i32 @getInt.()
  store i32 %rcc.tmp.15, ptr %pattern_length
  %rcc.tmp.17 = load i32, ptr %pattern_length
  call void @StringProcessor.add_pattern.(%StringProcessor* %processor, i32 %rcc.tmp.17)
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  call void @StringProcessor.perform_comprehensive_analysis.(%StringProcessor* %processor)
  %rcc.tmp.24 = call i32 @getInt.()
  store i32 %rcc.tmp.24, ptr %str1_len
  %rcc.tmp.26 = call i32 @getInt.()
  store i32 %rcc.tmp.26, ptr %str2_len
  %rcc.tmp.28 = load i32, ptr %str1_len
  %rcc.tmp.29 = load i32, ptr %str2_len
  %rcc.tmp.30 = call i32 @StringProcessor.compute_edit_distance.(%StringProcessor* %processor, i32 %rcc.tmp.28, i32 %rcc.tmp.29)
  store i32 %rcc.tmp.30, ptr %edit_distance
  %rcc.tmp.32 = load i32, ptr %edit_distance
  call void @printlnInt.(i32 %rcc.tmp.32)
  call void @RegexMatcher.new.(%RegexMatcher* %regex_matcher)
  %rcc.tmp.35 = call i32 @getInt.()
  store i32 %rcc.tmp.35, ptr %regex_pattern_length
  %rcc.tmp.37 = load i32, ptr %regex_pattern_length
  call void @RegexMatcher.compile_pattern.(%RegexMatcher* %regex_matcher, i32 %rcc.tmp.37)
  %rcc.tmp.39 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 0
  %rcc.tmp.40 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 1
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = call i1 @RegexMatcher.match_text.(%RegexMatcher* %regex_matcher, [20 x i32]* %rcc.tmp.39, i32 %rcc.tmp.41)
  store i1 %rcc.tmp.42, ptr %regex_result
  %rcc.tmp.44 = load i1, ptr %regex_result
  br i1 %rcc.tmp.44, label %if.then, label %if.else
if.then:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = phi i32 [1, %if.then], [0, %if.else]
  call void @printlnInt.(i32 %rcc.tmp.48)
  call void @StringProcessor.output_results.(%StringProcessor* %processor)
  %rcc.tmp.51 = call i32 @getInt.()
  store i32 %rcc.tmp.51, ptr %transformation_iterations
  store i32 0, ptr %total_transformations
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = load i32, ptr %transformation_iterations
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = mul i32 %rcc.tmp.61, 7
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 3
  %rcc.tmp.64 = srem i32 %rcc.tmp.63, 26
  store i32 %rcc.tmp.64, ptr %shift
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 1
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = icmp slt i32 %rcc.tmp.68, %rcc.tmp.70
  br i1 %rcc.tmp.71, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.74 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 0
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [20 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.78, ptr %ch
  %rcc.tmp.80 = load i32, ptr %ch
  %rcc.tmp.81 = icmp sge i32 %rcc.tmp.80, 65
  br i1 %rcc.tmp.81, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.83 = load i32, ptr %ch
  %rcc.tmp.84 = icmp sle i32 %rcc.tmp.83, 90
  br label %sc.merge
sc.merge:
  %rcc.tmp.86 = phi i1 [0, %while.body.3], [%rcc.tmp.84, %and.rhs]
  br i1 %rcc.tmp.86, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.88 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 0
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [20 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %ch
  %rcc.tmp.93 = sub i32 %rcc.tmp.92, 65
  %rcc.tmp.94 = load i32, ptr %shift
  %rcc.tmp.95 = add i32 %rcc.tmp.93, %rcc.tmp.94
  %rcc.tmp.96 = srem i32 %rcc.tmp.95, 26
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 65
  store i32 %rcc.tmp.97, ptr %rcc.tmp.91
  br label %if.merge.2
if.else.2:
  %rcc.tmp.100 = load i32, ptr %ch
  %rcc.tmp.101 = icmp sge i32 %rcc.tmp.100, 97
  br i1 %rcc.tmp.101, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.103 = load i32, ptr %ch
  %rcc.tmp.104 = icmp sle i32 %rcc.tmp.103, 122
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.106 = phi i1 [0, %if.else.2], [%rcc.tmp.104, %and.rhs.2]
  br i1 %rcc.tmp.106, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.108 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 0
  %rcc.tmp.109 = load i32, ptr %j
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = getelementptr [20 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %ch
  %rcc.tmp.113 = sub i32 %rcc.tmp.112, 97
  %rcc.tmp.114 = load i32, ptr %shift
  %rcc.tmp.115 = add i32 %rcc.tmp.113, %rcc.tmp.114
  %rcc.tmp.116 = srem i32 %rcc.tmp.115, 26
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 97
  store i32 %rcc.tmp.117, ptr %rcc.tmp.111
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.122 = load i32, ptr %j
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %j
  br label %while.cond.3
while.end.3:
  call void @StringProcessor.analyze_text_statistics.(%StringProcessor* %processor)
  %rcc.tmp.127 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 22
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  %rcc.tmp.129 = load i32, ptr %total_transformations
  %rcc.tmp.130 = add i32 %rcc.tmp.129, %rcc.tmp.128
  store i32 %rcc.tmp.130, ptr %total_transformations
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.136 = load i32, ptr %total_transformations
  call void @printlnInt.(i32 %rcc.tmp.136)
  %rcc.tmp.138 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 26
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %total_transformations
  %rcc.tmp.141 = add i32 %rcc.tmp.139, %rcc.tmp.140
  %rcc.tmp.142 = getelementptr %StringProcessor, ptr %processor, i32 0, i32 22
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.142
  %rcc.tmp.144 = mul i32 %rcc.tmp.141, %rcc.tmp.143
  %rcc.tmp.145 = sdiv i32 %rcc.tmp.144, 100
  store i32 %rcc.tmp.145, ptr %final_complexity
  %rcc.tmp.147 = load i32, ptr %final_complexity
  call void @printlnInt.(i32 %rcc.tmp.147)
  call void @exit.(i32 0)
  ret void
}
