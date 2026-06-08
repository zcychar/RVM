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
%SortingAnalyzer = type {[2000 x i32], [2000 x i32], i32, i32, i32, i32, [2000 x i32], i32, [10 x [200 x i32]], [10 x i32], [100 x i32], [100 x [50 x i32]], [100 x i32], i32, [10 x i32], [10 x i32]}
%DataProcessor = type {[1000 x i32], [1000 x i32], [2000 x i32], i32, [100 x [100 x i32]], i32, [10000 x i32], [20 x i32]}
define void @SortingAnalyzer.initialize_data.(%SortingAnalyzer* %self.tmp, i32 %size.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.3, i32 0, i32 2
  %rcc.tmp.5 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %size..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [2000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = call i32 @getInt.()
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %rcc.tmp.25)
  ret void
}
define void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.2, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.5, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.8, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.9
  ret void
}
define void @SortingAnalyzer.copy_to_temp.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %i = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.5, i32 0, i32 2
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [2000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.15
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.27 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.27, i32 0, i32 5
  %rcc.tmp.29 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.30 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.29, i32 0, i32 2
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.33 = add i32 %rcc.tmp.32, %rcc.tmp.31
  store i32 %rcc.tmp.33, ptr %rcc.tmp.28
  ret void
}
define void @SortingAnalyzer.restore_from_temp.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %i = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.5, i32 0, i32 2
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [2000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.15
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.27 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.27, i32 0, i32 5
  %rcc.tmp.29 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.30 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.29, i32 0, i32 2
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.33 = add i32 %rcc.tmp.32, %rcc.tmp.31
  store i32 %rcc.tmp.33, ptr %rcc.tmp.28
  ret void
}
define void @SortingAnalyzer.merge_sort.(%SortingAnalyzer* %self.tmp, i32 %left.tmp, i32 %right.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %mid = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.4 = load i32, ptr %left..tmp
  %rcc.tmp.5 = load i32, ptr %right..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %left..tmp
  %rcc.tmp.9 = load i32, ptr %right..tmp
  %rcc.tmp.10 = load i32, ptr %left..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.9, %rcc.tmp.10
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.11, 2
  %rcc.tmp.13 = add i32 %rcc.tmp.8, %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %mid
  %rcc.tmp.15 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.16 = load i32, ptr %left..tmp
  %rcc.tmp.17 = load i32, ptr %mid
  call void @SortingAnalyzer.merge_sort.(%SortingAnalyzer* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  %rcc.tmp.19 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.20 = load i32, ptr %mid
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load i32, ptr %right..tmp
  call void @SortingAnalyzer.merge_sort.(%SortingAnalyzer* %rcc.tmp.19, i32 %rcc.tmp.21, i32 %rcc.tmp.22)
  %rcc.tmp.24 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.25 = load i32, ptr %left..tmp
  %rcc.tmp.26 = load i32, ptr %mid
  %rcc.tmp.27 = load i32, ptr %right..tmp
  call void @SortingAnalyzer.merge.(%SortingAnalyzer* %rcc.tmp.24, i32 %rcc.tmp.25, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @SortingAnalyzer.merge.(%SortingAnalyzer* %self.tmp, i32 %left.tmp, i32 %mid.tmp, i32 %right.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %left..tmp = alloca i32 
  %mid..tmp = alloca i32 
  %right..tmp = alloca i32 
  %n1 = alloca i32 
  %n2 = alloca i32 
  %left_arr = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %right_arr = alloca [1000 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %mid.tmp, ptr %mid..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.5 = load i32, ptr %mid..tmp
  %rcc.tmp.6 = load i32, ptr %left..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %n1
  %rcc.tmp.10 = load i32, ptr %right..tmp
  %rcc.tmp.11 = load i32, ptr %mid..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %n2
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.16 = load i32, ptr %fill.idx
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 1000
  br i1 %rcc.tmp.17, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.19 = load i32, ptr %fill.idx
  %rcc.tmp.20 = getelementptr [1000 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.27 = load i32, ptr %fill.idx.2
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 1000
  br i1 %rcc.tmp.28, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.30 = load i32, ptr %fill.idx.2
  %rcc.tmp.31 = getelementptr [1000 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %n1
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [1000 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %left..tmp
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.48, %rcc.tmp.49
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [2000 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %rcc.tmp.45
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.61 = load i32, ptr %j
  %rcc.tmp.62 = load i32, ptr %n2
  %rcc.tmp.63 = icmp slt i32 %rcc.tmp.61, %rcc.tmp.62
  br i1 %rcc.tmp.63, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [1000 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.70 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.69, i32 0, i32 0
  %rcc.tmp.71 = load i32, ptr %mid..tmp
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = add i32 %rcc.tmp.72, %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [2000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %rcc.tmp.68
  %rcc.tmp.79 = load i32, ptr %j
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.83 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.84 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.83, i32 0, i32 5
  %rcc.tmp.85 = load i32, ptr %n1
  %rcc.tmp.86 = load i32, ptr %n2
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.89 = add i32 %rcc.tmp.88, %rcc.tmp.87
  store i32 %rcc.tmp.89, ptr %rcc.tmp.84
  store i32 0, ptr %i
  store i32 0, ptr %j
  %rcc.tmp.93 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.93, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = load i32, ptr %n1
  %rcc.tmp.98 = icmp slt i32 %rcc.tmp.96, %rcc.tmp.97
  br i1 %rcc.tmp.98, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.100 = load i32, ptr %j
  %rcc.tmp.101 = load i32, ptr %n2
  %rcc.tmp.102 = icmp slt i32 %rcc.tmp.100, %rcc.tmp.101
  br label %sc.merge
sc.merge:
  %rcc.tmp.104 = phi i1 [0, %while.cond.3], [%rcc.tmp.102, %and.rhs]
  br i1 %rcc.tmp.104, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.107 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.108 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.107, i32 0, i32 3
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %rcc.tmp.108
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = getelementptr [1000 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %j
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [1000 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = icmp sle i32 %rcc.tmp.115, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %if.then, label %if.else
if.then:
  %rcc.tmp.122 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.123 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.122, i32 0, i32 0
  %rcc.tmp.124 = load i32, ptr %k
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = getelementptr [2000 x i32], ptr %rcc.tmp.123, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [1000 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  store i32 %rcc.tmp.130, ptr %rcc.tmp.126
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.136 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.137 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.136, i32 0, i32 0
  %rcc.tmp.138 = load i32, ptr %k
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = getelementptr [2000 x i32], ptr %rcc.tmp.137, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %j
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [1000 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  store i32 %rcc.tmp.144, ptr %rcc.tmp.140
  %rcc.tmp.146 = load i32, ptr %j
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %j
  br label %if.merge
if.merge:
  %rcc.tmp.150 = load i32, ptr %k
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 1
  store i32 %rcc.tmp.151, ptr %k
  %rcc.tmp.153 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.154 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.153, i32 0, i32 5
  %rcc.tmp.155 = load i32, ptr %rcc.tmp.154
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 1
  store i32 %rcc.tmp.156, ptr %rcc.tmp.154
  br label %while.cond.3
while.end.3:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = load i32, ptr %n1
  %rcc.tmp.162 = icmp slt i32 %rcc.tmp.160, %rcc.tmp.161
  br i1 %rcc.tmp.162, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.165 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.166 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.165, i32 0, i32 0
  %rcc.tmp.167 = load i32, ptr %k
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 0
  %rcc.tmp.169 = getelementptr [2000 x i32], ptr %rcc.tmp.166, i32 0, i32 %rcc.tmp.168
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 0
  %rcc.tmp.172 = getelementptr [1000 x i32], ptr %left_arr, i32 0, i32 %rcc.tmp.171
  %rcc.tmp.173 = load i32, ptr %rcc.tmp.172
  store i32 %rcc.tmp.173, ptr %rcc.tmp.169
  %rcc.tmp.175 = load i32, ptr %i
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 1
  store i32 %rcc.tmp.176, ptr %i
  %rcc.tmp.178 = load i32, ptr %k
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 1
  store i32 %rcc.tmp.179, ptr %k
  %rcc.tmp.181 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.182 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.181, i32 0, i32 5
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.182
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 1
  store i32 %rcc.tmp.184, ptr %rcc.tmp.182
  br label %while.cond.4
while.end.4:
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.188 = load i32, ptr %j
  %rcc.tmp.189 = load i32, ptr %n2
  %rcc.tmp.190 = icmp slt i32 %rcc.tmp.188, %rcc.tmp.189
  br i1 %rcc.tmp.190, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.193 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.194 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.193, i32 0, i32 0
  %rcc.tmp.195 = load i32, ptr %k
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 0
  %rcc.tmp.197 = getelementptr [2000 x i32], ptr %rcc.tmp.194, i32 0, i32 %rcc.tmp.196
  %rcc.tmp.198 = load i32, ptr %j
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 0
  %rcc.tmp.200 = getelementptr [1000 x i32], ptr %right_arr, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %rcc.tmp.200
  store i32 %rcc.tmp.201, ptr %rcc.tmp.197
  %rcc.tmp.203 = load i32, ptr %j
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  store i32 %rcc.tmp.204, ptr %j
  %rcc.tmp.206 = load i32, ptr %k
  %rcc.tmp.207 = add i32 %rcc.tmp.206, 1
  store i32 %rcc.tmp.207, ptr %k
  %rcc.tmp.209 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.210 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.209, i32 0, i32 5
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.210
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 1
  store i32 %rcc.tmp.212, ptr %rcc.tmp.210
  br label %while.cond.5
while.end.5:
  ret void
}
define void @SortingAnalyzer.quick_sort_3way.(%SortingAnalyzer* %self.tmp, i32 %low.tmp, i32 %high.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %low..tmp = alloca i32 
  %high..tmp = alloca i32 
  %lt = alloca i32 
  %gt = alloca i32 
  %i = alloca i32 
  %pivot = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %low.tmp, ptr %low..tmp
  store i32 %high.tmp, ptr %high..tmp
  %rcc.tmp.4 = load i32, ptr %low..tmp
  %rcc.tmp.5 = load i32, ptr %high..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %low..tmp
  store i32 %rcc.tmp.8, ptr %lt
  %rcc.tmp.10 = load i32, ptr %high..tmp
  store i32 %rcc.tmp.10, ptr %gt
  %rcc.tmp.12 = load i32, ptr %low..tmp
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %i
  %rcc.tmp.15 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.16 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %low..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [2000 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %pivot
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %gt
  %rcc.tmp.25 = icmp sle i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %rcc.tmp.29
  %rcc.tmp.33 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.34 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.33, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [2000 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %pivot
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.43 = load i32, ptr %lt
  %rcc.tmp.44 = load i32, ptr %i
  call void @SortingAnalyzer.swap_elements.(%SortingAnalyzer* %rcc.tmp.42, i32 %rcc.tmp.43, i32 %rcc.tmp.44)
  %rcc.tmp.46 = load i32, ptr %lt
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %lt
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %i
  br label %if.merge.2
if.else.2:
  %rcc.tmp.53 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.54 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.53, i32 0, i32 0
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [2000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %pivot
  %rcc.tmp.60 = icmp sgt i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.62 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = load i32, ptr %gt
  call void @SortingAnalyzer.swap_elements.(%SortingAnalyzer* %rcc.tmp.62, i32 %rcc.tmp.63, i32 %rcc.tmp.64)
  %rcc.tmp.66 = load i32, ptr %gt
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %gt
  br label %if.merge.3
if.else.3:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %i
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.76 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.77 = load i32, ptr %low..tmp
  %rcc.tmp.78 = load i32, ptr %lt
  %rcc.tmp.79 = sub i32 %rcc.tmp.78, 1
  call void @SortingAnalyzer.quick_sort_3way.(%SortingAnalyzer* %rcc.tmp.76, i32 %rcc.tmp.77, i32 %rcc.tmp.79)
  %rcc.tmp.81 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.82 = load i32, ptr %gt
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  %rcc.tmp.84 = load i32, ptr %high..tmp
  call void @SortingAnalyzer.quick_sort_3way.(%SortingAnalyzer* %rcc.tmp.81, i32 %rcc.tmp.83, i32 %rcc.tmp.84)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @SortingAnalyzer.swap_elements.(%SortingAnalyzer* %self.tmp, i32 %i.tmp, i32 %j.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %i..tmp = alloca i32 
  %j..tmp = alloca i32 
  %temp = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %i.tmp, ptr %i..tmp
  store i32 %j.tmp, ptr %j..tmp
  %rcc.tmp.4 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %i..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = getelementptr [2000 x i32], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %temp
  %rcc.tmp.11 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %i..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %j..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [2000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %rcc.tmp.15
  %rcc.tmp.23 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %j..tmp
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [2000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %temp
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.30, i32 0, i32 4
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %rcc.tmp.31
  %rcc.tmp.35 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.35, i32 0, i32 5
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 3
  store i32 %rcc.tmp.38, ptr %rcc.tmp.36
  ret void
}
define void @SortingAnalyzer.heap_sort.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %heap_end = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.build_max_heap.(%SortingAnalyzer* %rcc.tmp.2)
  %rcc.tmp.4 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.4, i32 0, i32 2
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = sub i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.7, ptr %heap_end
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %heap_end
  %rcc.tmp.11 = icmp sgt i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.15 = load i32, ptr %heap_end
  call void @SortingAnalyzer.swap_elements.(%SortingAnalyzer* %rcc.tmp.14, i32 0, i32 %rcc.tmp.15)
  %rcc.tmp.17 = load i32, ptr %heap_end
  %rcc.tmp.18 = sub i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %heap_end
  %rcc.tmp.20 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.21 = load i32, ptr %heap_end
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  call void @SortingAnalyzer.max_heapify.(%SortingAnalyzer* %rcc.tmp.20, i32 0, i32 %rcc.tmp.22)
  br label %while.cond
while.end:
  ret void
}
define void @SortingAnalyzer.build_max_heap.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %i = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.2, i32 0, i32 2
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = sdiv i32 %rcc.tmp.4, 2
  %rcc.tmp.6 = sub i32 %rcc.tmp.5, 1
  store i32 %rcc.tmp.6, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = icmp sge i32 %rcc.tmp.9, 0
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.16 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  call void @SortingAnalyzer.max_heapify.(%SortingAnalyzer* %rcc.tmp.13, i32 %rcc.tmp.14, i32 %rcc.tmp.17)
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = sub i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @SortingAnalyzer.max_heapify.(%SortingAnalyzer* %self.tmp, i32 %root.tmp, i32 %heap_size.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %root..tmp = alloca i32 
  %heap_size..tmp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %largest = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %root.tmp, ptr %root..tmp
  store i32 %heap_size.tmp, ptr %heap_size..tmp
  %rcc.tmp.4 = load i32, ptr %root..tmp
  %rcc.tmp.5 = mul i32 2, %rcc.tmp.4
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 1
  store i32 %rcc.tmp.6, ptr %left
  %rcc.tmp.8 = load i32, ptr %root..tmp
  %rcc.tmp.9 = mul i32 2, %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 2
  store i32 %rcc.tmp.10, ptr %right
  %rcc.tmp.12 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.12, ptr %largest
  %rcc.tmp.14 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %rcc.tmp.15
  %rcc.tmp.19 = load i32, ptr %left
  %rcc.tmp.20 = load i32, ptr %heap_size..tmp
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %left
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [2000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.30 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.29, i32 0, i32 0
  %rcc.tmp.31 = load i32, ptr %largest
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [2000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp sgt i32 %rcc.tmp.28, %rcc.tmp.34
  br label %sc.merge
sc.merge:
  %rcc.tmp.37 = phi i1 [0, %entry], [%rcc.tmp.35, %and.rhs]
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %left
  store i32 %rcc.tmp.39, ptr %largest
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.43 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.44 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.43, i32 0, i32 3
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %rcc.tmp.44
  %rcc.tmp.48 = load i32, ptr %right
  %rcc.tmp.49 = load i32, ptr %heap_size..tmp
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.52 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.52, i32 0, i32 0
  %rcc.tmp.54 = load i32, ptr %right
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [2000 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.58, i32 0, i32 0
  %rcc.tmp.60 = load i32, ptr %largest
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [2000 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = icmp sgt i32 %rcc.tmp.57, %rcc.tmp.63
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.66 = phi i1 [0, %if.merge], [%rcc.tmp.64, %and.rhs.2]
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %right
  store i32 %rcc.tmp.68, ptr %largest
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.72 = load i32, ptr %largest
  %rcc.tmp.73 = load i32, ptr %root..tmp
  %rcc.tmp.74 = icmp ne i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.76 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.77 = load i32, ptr %root..tmp
  %rcc.tmp.78 = load i32, ptr %largest
  call void @SortingAnalyzer.swap_elements.(%SortingAnalyzer* %rcc.tmp.76, i32 %rcc.tmp.77, i32 %rcc.tmp.78)
  %rcc.tmp.80 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.81 = load i32, ptr %largest
  %rcc.tmp.82 = load i32, ptr %heap_size..tmp
  call void @SortingAnalyzer.max_heapify.(%SortingAnalyzer* %rcc.tmp.80, i32 %rcc.tmp.81, i32 %rcc.tmp.82)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  ret void
}
define void @SortingAnalyzer.radix_sort.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %max_val = alloca i32 
  %exp = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.3 = call i32 @SortingAnalyzer.find_maximum.(%SortingAnalyzer* %rcc.tmp.2)
  store i32 %rcc.tmp.3, ptr %max_val
  store i32 1, ptr %exp
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %max_val
  %rcc.tmp.8 = load i32, ptr %exp
  %rcc.tmp.9 = sdiv i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp sgt i32 %rcc.tmp.9, 0
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.14 = load i32, ptr %exp
  call void @SortingAnalyzer.counting_sort_by_digit.(%SortingAnalyzer* %rcc.tmp.13, i32 %rcc.tmp.14)
  %rcc.tmp.16 = load i32, ptr %exp
  %rcc.tmp.17 = mul i32 %rcc.tmp.16, 10
  store i32 %rcc.tmp.17, ptr %exp
  br label %while.cond
while.end:
  ret void
}
define i32 @SortingAnalyzer.find_maximum.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %max_val = alloca i32 
  %i = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.2, i32 0, i32 0
  %rcc.tmp.4 = getelementptr [2000 x i32], ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %max_val
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.11 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.10, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [2000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %max_val
  %rcc.tmp.23 = icmp sgt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  %rcc.tmp.25 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [2000 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %max_val
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %max_val
  ret i32 %rcc.tmp.38
}
define void @SortingAnalyzer.counting_sort_by_digit.(%SortingAnalyzer* %self.tmp, i32 %exp.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %exp..tmp = alloca i32 
  %output = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %count = alloca [10 x i32] 
  %i = alloca i32 
  %digit = alloca i32 
  %digit.2 = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %exp.tmp, ptr %exp..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 2000
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [2000 x i32], ptr %output, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %count, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %count, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %count, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %count, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %count, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [10 x i32], ptr %count, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %count, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [10 x i32], ptr %count, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %count, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %count, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.32
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.37, i32 0, i32 2
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.43 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.44 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.43, i32 0, i32 0
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = getelementptr [2000 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %exp..tmp
  %rcc.tmp.50 = sdiv i32 %rcc.tmp.48, %rcc.tmp.49
  %rcc.tmp.51 = srem i32 %rcc.tmp.50, 10
  store i32 %rcc.tmp.51, ptr %digit
  %rcc.tmp.53 = load i32, ptr %digit
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [10 x i32], ptr %count, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %rcc.tmp.55
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %i
  br label %while.cond
while.end:
  store i32 1, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.65, 10
  br i1 %rcc.tmp.66, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [10 x i32], ptr %count, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = sub i32 %rcc.tmp.72, 1
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = getelementptr [10 x i32], ptr %count, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.78 = add i32 %rcc.tmp.77, %rcc.tmp.76
  store i32 %rcc.tmp.78, ptr %rcc.tmp.71
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.84 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.85 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.84, i32 0, i32 2
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = sub i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = icmp sge i32 %rcc.tmp.90, 0
  br i1 %rcc.tmp.91, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.94 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.94, i32 0, i32 0
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [2000 x i32], ptr %rcc.tmp.95, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %exp..tmp
  %rcc.tmp.101 = sdiv i32 %rcc.tmp.99, %rcc.tmp.100
  %rcc.tmp.102 = srem i32 %rcc.tmp.101, 10
  store i32 %rcc.tmp.102, ptr %digit.2
  %rcc.tmp.104 = load i32, ptr %digit.2
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = getelementptr [10 x i32], ptr %count, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.106
  %rcc.tmp.108 = sub i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %rcc.tmp.106
  %rcc.tmp.110 = load i32, ptr %digit.2
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [10 x i32], ptr %count, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [2000 x i32], ptr %output, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.116, i32 0, i32 0
  %rcc.tmp.118 = load i32, ptr %i
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [2000 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  store i32 %rcc.tmp.121, ptr %rcc.tmp.115
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = sub i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.124, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.131 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.130, i32 0, i32 2
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  %rcc.tmp.133 = icmp slt i32 %rcc.tmp.129, %rcc.tmp.132
  br i1 %rcc.tmp.133, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.136 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.137 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.136, i32 0, i32 0
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = getelementptr [2000 x i32], ptr %rcc.tmp.137, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [2000 x i32], ptr %output, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  store i32 %rcc.tmp.144, ptr %rcc.tmp.140
  %rcc.tmp.146 = load i32, ptr %i
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.150 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.151 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.150, i32 0, i32 5
  %rcc.tmp.152 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.153 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.152, i32 0, i32 2
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = mul i32 %rcc.tmp.154, 3
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.151
  %rcc.tmp.157 = add i32 %rcc.tmp.156, %rcc.tmp.155
  store i32 %rcc.tmp.157, ptr %rcc.tmp.151
  ret void
}
define void @SortingAnalyzer.bucket_sort.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %min_val = alloca i32 
  %max_val = alloca i32 
  %i = alloca i32 
  %range = alloca i32 
  %bucket_range = alloca i32 
  %bucket_index = alloca i32 
  %adjusted_index = alloca i32 
  %index = alloca i32 
  %j = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.2, i32 0, i32 2
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 1
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = getelementptr [2000 x i32], ptr %rcc.tmp.10, i32 0, i32 0
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %min_val
  %rcc.tmp.14 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = getelementptr [2000 x i32], ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %max_val
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [2000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %min_val
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.33, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.37, i32 0, i32 0
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [2000 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %min_val
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.46 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [2000 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %max_val
  %rcc.tmp.53 = icmp sgt i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.55 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.55, i32 0, i32 0
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [2000 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %max_val
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.68 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.68, i32 0, i32 13
  %rcc.tmp.70 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.71 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.70, i32 0, i32 2
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = sdiv i32 %rcc.tmp.72, 4
  store i32 %rcc.tmp.73, ptr %rcc.tmp.69
  %rcc.tmp.75 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.76 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.75, i32 0, i32 13
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = icmp sgt i32 %rcc.tmp.77, 99
  br i1 %rcc.tmp.78, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.80 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.81 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.80, i32 0, i32 13
  store i32 99, ptr %rcc.tmp.81
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.85 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.86 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.85, i32 0, i32 13
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = icmp slt i32 %rcc.tmp.87, 1
  br i1 %rcc.tmp.88, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.90 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.91 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.90, i32 0, i32 13
  store i32 1, ptr %rcc.tmp.91
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.95 = load i32, ptr %max_val
  %rcc.tmp.96 = load i32, ptr %min_val
  %rcc.tmp.97 = sub i32 %rcc.tmp.95, %rcc.tmp.96
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  store i32 %rcc.tmp.98, ptr %range
  %rcc.tmp.100 = load i32, ptr %range
  %rcc.tmp.101 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.102 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.101, i32 0, i32 13
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = sdiv i32 %rcc.tmp.100, %rcc.tmp.103
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 1
  store i32 %rcc.tmp.105, ptr %bucket_range
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.111 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.110, i32 0, i32 13
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  %rcc.tmp.113 = icmp slt i32 %rcc.tmp.109, %rcc.tmp.112
  br i1 %rcc.tmp.113, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.116 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.116, i32 0, i32 12
  %rcc.tmp.118 = load i32, ptr %i
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [100 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.119
  store i32 0, ptr %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.130 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.129, i32 0, i32 2
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = icmp slt i32 %rcc.tmp.128, %rcc.tmp.131
  br i1 %rcc.tmp.132, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.135 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.136 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.135, i32 0, i32 0
  %rcc.tmp.137 = load i32, ptr %i
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [2000 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %min_val
  %rcc.tmp.142 = sub i32 %rcc.tmp.140, %rcc.tmp.141
  %rcc.tmp.143 = load i32, ptr %bucket_range
  %rcc.tmp.144 = sdiv i32 %rcc.tmp.142, %rcc.tmp.143
  store i32 %rcc.tmp.144, ptr %bucket_index
  %rcc.tmp.146 = load i32, ptr %bucket_index
  %rcc.tmp.147 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.148 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.147, i32 0, i32 13
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  %rcc.tmp.150 = icmp sge i32 %rcc.tmp.146, %rcc.tmp.149
  br i1 %rcc.tmp.150, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.152 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.153 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.152, i32 0, i32 13
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = sub i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %adjusted_index
  %rcc.tmp.157 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.158 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.157, i32 0, i32 11
  %rcc.tmp.159 = load i32, ptr %adjusted_index
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 0
  %rcc.tmp.161 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.158, i32 0, i32 %rcc.tmp.160
  %rcc.tmp.162 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.163 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.162, i32 0, i32 12
  %rcc.tmp.164 = load i32, ptr %adjusted_index
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 0
  %rcc.tmp.166 = getelementptr [100 x i32], ptr %rcc.tmp.163, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.166
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 0
  %rcc.tmp.169 = getelementptr [50 x i32], ptr %rcc.tmp.161, i32 0, i32 %rcc.tmp.168
  %rcc.tmp.170 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.171 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.170, i32 0, i32 0
  %rcc.tmp.172 = load i32, ptr %i
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 0
  %rcc.tmp.174 = getelementptr [2000 x i32], ptr %rcc.tmp.171, i32 0, i32 %rcc.tmp.173
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.174
  store i32 %rcc.tmp.175, ptr %rcc.tmp.169
  %rcc.tmp.177 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.178 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.177, i32 0, i32 12
  %rcc.tmp.179 = load i32, ptr %adjusted_index
  %rcc.tmp.180 = add i32 %rcc.tmp.179, 0
  %rcc.tmp.181 = getelementptr [100 x i32], ptr %rcc.tmp.178, i32 0, i32 %rcc.tmp.180
  %rcc.tmp.182 = load i32, ptr %rcc.tmp.181
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 1
  store i32 %rcc.tmp.183, ptr %rcc.tmp.181
  br label %if.merge.6
if.else.6:
  %rcc.tmp.186 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.187 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.186, i32 0, i32 11
  %rcc.tmp.188 = load i32, ptr %bucket_index
  %rcc.tmp.189 = add i32 %rcc.tmp.188, 0
  %rcc.tmp.190 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.187, i32 0, i32 %rcc.tmp.189
  %rcc.tmp.191 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.192 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.191, i32 0, i32 12
  %rcc.tmp.193 = load i32, ptr %bucket_index
  %rcc.tmp.194 = add i32 %rcc.tmp.193, 0
  %rcc.tmp.195 = getelementptr [100 x i32], ptr %rcc.tmp.192, i32 0, i32 %rcc.tmp.194
  %rcc.tmp.196 = load i32, ptr %rcc.tmp.195
  %rcc.tmp.197 = add i32 %rcc.tmp.196, 0
  %rcc.tmp.198 = getelementptr [50 x i32], ptr %rcc.tmp.190, i32 0, i32 %rcc.tmp.197
  %rcc.tmp.199 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.200 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.199, i32 0, i32 0
  %rcc.tmp.201 = load i32, ptr %i
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 0
  %rcc.tmp.203 = getelementptr [2000 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.202
  %rcc.tmp.204 = load i32, ptr %rcc.tmp.203
  store i32 %rcc.tmp.204, ptr %rcc.tmp.198
  %rcc.tmp.206 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.207 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.206, i32 0, i32 12
  %rcc.tmp.208 = load i32, ptr %bucket_index
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 0
  %rcc.tmp.210 = getelementptr [100 x i32], ptr %rcc.tmp.207, i32 0, i32 %rcc.tmp.209
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.210
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 1
  store i32 %rcc.tmp.212, ptr %rcc.tmp.210
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.215 = load i32, ptr %i
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 1
  store i32 %rcc.tmp.216, ptr %i
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.221 = load i32, ptr %i
  %rcc.tmp.222 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.223 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.222, i32 0, i32 13
  %rcc.tmp.224 = load i32, ptr %rcc.tmp.223
  %rcc.tmp.225 = icmp slt i32 %rcc.tmp.221, %rcc.tmp.224
  br i1 %rcc.tmp.225, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.228 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.229 = load i32, ptr %i
  call void @SortingAnalyzer.insertion_sort_bucket.(%SortingAnalyzer* %rcc.tmp.228, i32 %rcc.tmp.229)
  %rcc.tmp.231 = load i32, ptr %i
  %rcc.tmp.232 = add i32 %rcc.tmp.231, 1
  store i32 %rcc.tmp.232, ptr %i
  br label %while.cond.4
while.end.4:
  store i32 0, ptr %index
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.238 = load i32, ptr %i
  %rcc.tmp.239 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.240 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.239, i32 0, i32 13
  %rcc.tmp.241 = load i32, ptr %rcc.tmp.240
  %rcc.tmp.242 = icmp slt i32 %rcc.tmp.238, %rcc.tmp.241
  br i1 %rcc.tmp.242, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  store i32 0, ptr %j
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.247 = load i32, ptr %j
  %rcc.tmp.248 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.249 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.248, i32 0, i32 12
  %rcc.tmp.250 = load i32, ptr %i
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 0
  %rcc.tmp.252 = getelementptr [100 x i32], ptr %rcc.tmp.249, i32 0, i32 %rcc.tmp.251
  %rcc.tmp.253 = load i32, ptr %rcc.tmp.252
  %rcc.tmp.254 = icmp slt i32 %rcc.tmp.247, %rcc.tmp.253
  br i1 %rcc.tmp.254, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.257 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.258 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.257, i32 0, i32 0
  %rcc.tmp.259 = load i32, ptr %index
  %rcc.tmp.260 = add i32 %rcc.tmp.259, 0
  %rcc.tmp.261 = getelementptr [2000 x i32], ptr %rcc.tmp.258, i32 0, i32 %rcc.tmp.260
  %rcc.tmp.262 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.263 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.262, i32 0, i32 11
  %rcc.tmp.264 = load i32, ptr %i
  %rcc.tmp.265 = add i32 %rcc.tmp.264, 0
  %rcc.tmp.266 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.263, i32 0, i32 %rcc.tmp.265
  %rcc.tmp.267 = load i32, ptr %j
  %rcc.tmp.268 = add i32 %rcc.tmp.267, 0
  %rcc.tmp.269 = getelementptr [50 x i32], ptr %rcc.tmp.266, i32 0, i32 %rcc.tmp.268
  %rcc.tmp.270 = load i32, ptr %rcc.tmp.269
  store i32 %rcc.tmp.270, ptr %rcc.tmp.261
  %rcc.tmp.272 = load i32, ptr %index
  %rcc.tmp.273 = add i32 %rcc.tmp.272, 1
  store i32 %rcc.tmp.273, ptr %index
  %rcc.tmp.275 = load i32, ptr %j
  %rcc.tmp.276 = add i32 %rcc.tmp.275, 1
  store i32 %rcc.tmp.276, ptr %j
  br label %while.cond.6
while.end.6:
  %rcc.tmp.279 = load i32, ptr %i
  %rcc.tmp.280 = add i32 %rcc.tmp.279, 1
  store i32 %rcc.tmp.280, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.283 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.284 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.283, i32 0, i32 5
  %rcc.tmp.285 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.286 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.285, i32 0, i32 2
  %rcc.tmp.287 = load i32, ptr %rcc.tmp.286
  %rcc.tmp.288 = mul i32 %rcc.tmp.287, 2
  %rcc.tmp.289 = load i32, ptr %rcc.tmp.284
  %rcc.tmp.290 = add i32 %rcc.tmp.289, %rcc.tmp.288
  store i32 %rcc.tmp.290, ptr %rcc.tmp.284
  ret void
}
define void @SortingAnalyzer.insertion_sort_bucket.(%SortingAnalyzer* %self.tmp, i32 %bucket_index.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %bucket_index..tmp = alloca i32 
  %count = alloca i32 
  %i = alloca i32 
  %key = alloca i32 
  %j = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 %bucket_index.tmp, ptr %bucket_index..tmp
  %rcc.tmp.3 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.3, i32 0, i32 12
  %rcc.tmp.5 = load i32, ptr %bucket_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [100 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %count
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %count
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.17, i32 0, i32 11
  %rcc.tmp.19 = load i32, ptr %bucket_index..tmp
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [50 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %key
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = sub i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = icmp sge i32 %rcc.tmp.31, 0
  br i1 %rcc.tmp.32, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.34 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.34, i32 0, i32 11
  %rcc.tmp.36 = load i32, ptr %bucket_index..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [50 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %key
  %rcc.tmp.44 = icmp sgt i32 %rcc.tmp.42, %rcc.tmp.43
  br label %sc.merge
sc.merge:
  %rcc.tmp.46 = phi i1 [0, %while.cond.2], [%rcc.tmp.44, %and.rhs]
  br i1 %rcc.tmp.46, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.49 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.50 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.49, i32 0, i32 11
  %rcc.tmp.51 = load i32, ptr %bucket_index..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [50 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.58, i32 0, i32 11
  %rcc.tmp.60 = load i32, ptr %bucket_index..tmp
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [50 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %rcc.tmp.57
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = sub i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %j
  %rcc.tmp.71 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.72 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.71, i32 0, i32 3
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %rcc.tmp.72
  %rcc.tmp.76 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.76, i32 0, i32 5
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %rcc.tmp.77
  br label %while.cond.2
while.end.2:
  %rcc.tmp.82 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.83 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.82, i32 0, i32 11
  %rcc.tmp.84 = load i32, ptr %bucket_index..tmp
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %key
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  %rcc.tmp.96 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.97 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.96, i32 0, i32 5
  %rcc.tmp.98 = load i32, ptr %rcc.tmp.97
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %rcc.tmp.97
  br label %while.cond
while.end:
  ret void
}
define i32 @SortingAnalyzer.analyze_sorted_array.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %analysis_score = alloca i32 
  %is_sorted = alloca i1 
  %i = alloca i32 
  %sum = alloca i32 
  %unique_count = alloca i32 
  %duplicates = alloca i32 
  %median = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  store i32 0, ptr %analysis_score
  store i1 1, ptr %is_sorted
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.7, i32 0, i32 2
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [2000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = sub i32 %rcc.tmp.21, 1
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [2000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  store i1 0, ptr %is_sorted
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i1, ptr %is_sorted
  br i1 %rcc.tmp.35, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.37 = load i32, ptr %analysis_score
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1000
  store i32 %rcc.tmp.38, ptr %analysis_score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  store i32 0, ptr %sum
  store i32 0, ptr %unique_count
  store i32 0, ptr %duplicates
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.48, i32 0, i32 2
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.47, %rcc.tmp.50
  br i1 %rcc.tmp.51, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.54 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.55 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.54, i32 0, i32 0
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [2000 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %sum
  %rcc.tmp.61 = add i32 %rcc.tmp.60, %rcc.tmp.59
  store i32 %rcc.tmp.61, ptr %sum
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 0
  br i1 %rcc.tmp.64, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.66 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.67 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.66, i32 0, i32 0
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = getelementptr [2000 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.73 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.72, i32 0, i32 0
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = sub i32 %rcc.tmp.74, 1
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [2000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = icmp ne i32 %rcc.tmp.71, %rcc.tmp.78
  br label %sc.merge
sc.merge:
  %rcc.tmp.81 = phi i1 [1, %while.body.2], [%rcc.tmp.79, %or.rhs]
  br i1 %rcc.tmp.81, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.83 = load i32, ptr %unique_count
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %unique_count
  br label %if.merge.3
if.else.3:
  %rcc.tmp.87 = load i32, ptr %duplicates
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %duplicates
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.95 = load i32, ptr %unique_count
  %rcc.tmp.96 = mul i32 %rcc.tmp.95, 10
  %rcc.tmp.97 = load i32, ptr %duplicates
  %rcc.tmp.98 = mul i32 %rcc.tmp.97, 5
  %rcc.tmp.99 = add i32 %rcc.tmp.96, %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %analysis_score
  %rcc.tmp.101 = add i32 %rcc.tmp.100, %rcc.tmp.99
  store i32 %rcc.tmp.101, ptr %analysis_score
  %rcc.tmp.103 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.104 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.103, i32 0, i32 2
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = srem i32 %rcc.tmp.105, 2
  %rcc.tmp.107 = icmp eq i32 %rcc.tmp.106, 0
  br i1 %rcc.tmp.107, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.109 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.110 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.109, i32 0, i32 0
  %rcc.tmp.111 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.112 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.111, i32 0, i32 2
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = sdiv i32 %rcc.tmp.113, 2
  %rcc.tmp.115 = sub i32 %rcc.tmp.114, 1
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 0
  %rcc.tmp.117 = getelementptr [2000 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.119 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.120 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.119, i32 0, i32 0
  %rcc.tmp.121 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.122 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.121, i32 0, i32 2
  %rcc.tmp.123 = load i32, ptr %rcc.tmp.122
  %rcc.tmp.124 = sdiv i32 %rcc.tmp.123, 2
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = getelementptr [2000 x i32], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = add i32 %rcc.tmp.118, %rcc.tmp.127
  %rcc.tmp.129 = sdiv i32 %rcc.tmp.128, 2
  br label %if.merge.4
if.else.4:
  %rcc.tmp.131 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.132 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.131, i32 0, i32 0
  %rcc.tmp.133 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.134 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.133, i32 0, i32 2
  %rcc.tmp.135 = load i32, ptr %rcc.tmp.134
  %rcc.tmp.136 = sdiv i32 %rcc.tmp.135, 2
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  %rcc.tmp.138 = getelementptr [2000 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.137
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.141 = phi i32 [%rcc.tmp.129, %if.then.4], [%rcc.tmp.139, %if.else.4]
  store i32 %rcc.tmp.141, ptr %median
  %rcc.tmp.143 = load i32, ptr %median
  %rcc.tmp.144 = load i32, ptr %analysis_score
  %rcc.tmp.145 = add i32 %rcc.tmp.144, %rcc.tmp.143
  store i32 %rcc.tmp.145, ptr %analysis_score
  %rcc.tmp.147 = load i32, ptr %analysis_score
  ret i32 %rcc.tmp.147
}
define void @SortingAnalyzer.run_comprehensive_tests.(%SortingAnalyzer* %self.tmp) {
entry:
  %self..tmp = alloca %SortingAnalyzer* 
  %best_algorithm = alloca i32 
  %best_efficiency = alloca i32 
  %i = alloca i32 
  store %SortingAnalyzer* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.2, i32 0, i32 2
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.copy_to_temp.(%SortingAnalyzer* %rcc.tmp.6)
  %rcc.tmp.8 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %rcc.tmp.8)
  %rcc.tmp.10 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.11 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.11, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  call void @SortingAnalyzer.merge_sort.(%SortingAnalyzer* %rcc.tmp.10, i32 0, i32 %rcc.tmp.14)
  %rcc.tmp.16 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.16, i32 0, i32 14
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %rcc.tmp.17, i32 0, i32 0
  %rcc.tmp.19 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.19, i32 0, i32 3
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.22, i32 0, i32 4
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.21, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %rcc.tmp.18
  %rcc.tmp.27 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.28 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.27, i32 0, i32 15
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.31 = call i32 @SortingAnalyzer.analyze_sorted_array.(%SortingAnalyzer* %rcc.tmp.30)
  store i32 %rcc.tmp.31, ptr %rcc.tmp.29
  %rcc.tmp.33 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.34 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.33, i32 0, i32 15
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %rcc.tmp.34, i32 0, i32 0
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  call void @printlnInt.(i32 %rcc.tmp.36)
  %rcc.tmp.38 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.restore_from_temp.(%SortingAnalyzer* %rcc.tmp.38)
  %rcc.tmp.40 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %rcc.tmp.40)
  %rcc.tmp.42 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.43 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.44 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.43, i32 0, i32 2
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = sub i32 %rcc.tmp.45, 1
  call void @SortingAnalyzer.quick_sort_3way.(%SortingAnalyzer* %rcc.tmp.42, i32 0, i32 %rcc.tmp.46)
  %rcc.tmp.48 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.48, i32 0, i32 14
  %rcc.tmp.50 = getelementptr [10 x i32], ptr %rcc.tmp.49, i32 0, i32 1
  %rcc.tmp.51 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.52 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.51, i32 0, i32 3
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.55 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.54, i32 0, i32 4
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.53, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %rcc.tmp.50
  %rcc.tmp.59 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.60 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.59, i32 0, i32 15
  %rcc.tmp.61 = getelementptr [10 x i32], ptr %rcc.tmp.60, i32 0, i32 1
  %rcc.tmp.62 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.63 = call i32 @SortingAnalyzer.analyze_sorted_array.(%SortingAnalyzer* %rcc.tmp.62)
  store i32 %rcc.tmp.63, ptr %rcc.tmp.61
  %rcc.tmp.65 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.66 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.65, i32 0, i32 15
  %rcc.tmp.67 = getelementptr [10 x i32], ptr %rcc.tmp.66, i32 0, i32 1
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  call void @printlnInt.(i32 %rcc.tmp.68)
  %rcc.tmp.70 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.restore_from_temp.(%SortingAnalyzer* %rcc.tmp.70)
  %rcc.tmp.72 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %rcc.tmp.72)
  %rcc.tmp.74 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.heap_sort.(%SortingAnalyzer* %rcc.tmp.74)
  %rcc.tmp.76 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.77 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.76, i32 0, i32 14
  %rcc.tmp.78 = getelementptr [10 x i32], ptr %rcc.tmp.77, i32 0, i32 2
  %rcc.tmp.79 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.80 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.79, i32 0, i32 3
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.83 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.82, i32 0, i32 4
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = add i32 %rcc.tmp.81, %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %rcc.tmp.78
  %rcc.tmp.87 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.87, i32 0, i32 15
  %rcc.tmp.89 = getelementptr [10 x i32], ptr %rcc.tmp.88, i32 0, i32 2
  %rcc.tmp.90 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.91 = call i32 @SortingAnalyzer.analyze_sorted_array.(%SortingAnalyzer* %rcc.tmp.90)
  store i32 %rcc.tmp.91, ptr %rcc.tmp.89
  %rcc.tmp.93 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.94 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.93, i32 0, i32 15
  %rcc.tmp.95 = getelementptr [10 x i32], ptr %rcc.tmp.94, i32 0, i32 2
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  call void @printlnInt.(i32 %rcc.tmp.96)
  %rcc.tmp.98 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.restore_from_temp.(%SortingAnalyzer* %rcc.tmp.98)
  %rcc.tmp.100 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %rcc.tmp.100)
  %rcc.tmp.102 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.radix_sort.(%SortingAnalyzer* %rcc.tmp.102)
  %rcc.tmp.104 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.105 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.104, i32 0, i32 14
  %rcc.tmp.106 = getelementptr [10 x i32], ptr %rcc.tmp.105, i32 0, i32 3
  %rcc.tmp.107 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.108 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.107, i32 0, i32 5
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  store i32 %rcc.tmp.109, ptr %rcc.tmp.106
  %rcc.tmp.111 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.112 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.111, i32 0, i32 15
  %rcc.tmp.113 = getelementptr [10 x i32], ptr %rcc.tmp.112, i32 0, i32 3
  %rcc.tmp.114 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.115 = call i32 @SortingAnalyzer.analyze_sorted_array.(%SortingAnalyzer* %rcc.tmp.114)
  store i32 %rcc.tmp.115, ptr %rcc.tmp.113
  %rcc.tmp.117 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.118 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.117, i32 0, i32 15
  %rcc.tmp.119 = getelementptr [10 x i32], ptr %rcc.tmp.118, i32 0, i32 3
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  call void @printlnInt.(i32 %rcc.tmp.120)
  %rcc.tmp.122 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.restore_from_temp.(%SortingAnalyzer* %rcc.tmp.122)
  %rcc.tmp.124 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %rcc.tmp.124)
  %rcc.tmp.126 = load %SortingAnalyzer*, ptr %self..tmp
  call void @SortingAnalyzer.bucket_sort.(%SortingAnalyzer* %rcc.tmp.126)
  %rcc.tmp.128 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.129 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.128, i32 0, i32 14
  %rcc.tmp.130 = getelementptr [10 x i32], ptr %rcc.tmp.129, i32 0, i32 4
  %rcc.tmp.131 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.132 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.131, i32 0, i32 5
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.132
  %rcc.tmp.134 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.135 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.134, i32 0, i32 3
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  %rcc.tmp.137 = add i32 %rcc.tmp.133, %rcc.tmp.136
  store i32 %rcc.tmp.137, ptr %rcc.tmp.130
  %rcc.tmp.139 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.140 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.139, i32 0, i32 15
  %rcc.tmp.141 = getelementptr [10 x i32], ptr %rcc.tmp.140, i32 0, i32 4
  %rcc.tmp.142 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.143 = call i32 @SortingAnalyzer.analyze_sorted_array.(%SortingAnalyzer* %rcc.tmp.142)
  store i32 %rcc.tmp.143, ptr %rcc.tmp.141
  %rcc.tmp.145 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.146 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.145, i32 0, i32 15
  %rcc.tmp.147 = getelementptr [10 x i32], ptr %rcc.tmp.146, i32 0, i32 4
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.147
  call void @printlnInt.(i32 %rcc.tmp.148)
  store i32 0, ptr %best_algorithm
  %rcc.tmp.151 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.152 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.151, i32 0, i32 15
  %rcc.tmp.153 = getelementptr [10 x i32], ptr %rcc.tmp.152, i32 0, i32 0
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  store i32 %rcc.tmp.154, ptr %best_efficiency
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.158 = load i32, ptr %i
  %rcc.tmp.159 = icmp slt i32 %rcc.tmp.158, 5
  br i1 %rcc.tmp.159, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.162 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.163 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.162, i32 0, i32 15
  %rcc.tmp.164 = load i32, ptr %i
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 0
  %rcc.tmp.166 = getelementptr [10 x i32], ptr %rcc.tmp.163, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.166
  %rcc.tmp.168 = load i32, ptr %best_efficiency
  %rcc.tmp.169 = icmp sgt i32 %rcc.tmp.167, %rcc.tmp.168
  br i1 %rcc.tmp.169, label %if.then, label %if.else
if.then:
  %rcc.tmp.171 = load %SortingAnalyzer*, ptr %self..tmp
  %rcc.tmp.172 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.171, i32 0, i32 15
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [10 x i32], ptr %rcc.tmp.172, i32 0, i32 %rcc.tmp.174
  %rcc.tmp.176 = load i32, ptr %rcc.tmp.175
  store i32 %rcc.tmp.176, ptr %best_efficiency
  %rcc.tmp.178 = load i32, ptr %i
  store i32 %rcc.tmp.178, ptr %best_algorithm
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.182 = load i32, ptr %i
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 1
  store i32 %rcc.tmp.183, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.186 = load i32, ptr %best_algorithm
  call void @printlnInt.(i32 %rcc.tmp.186)
  %rcc.tmp.188 = load i32, ptr %best_efficiency
  call void @printlnInt.(i32 %rcc.tmp.188)
  ret void
}
define void @SortingAnalyzer.new.(%SortingAnalyzer* sret(%SortingAnalyzer) %ret.slot) {
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
  %fill.idx.17 = alloca i32 
  %rcc.tmp.1 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2000 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 2000
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [2000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.25 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.36 = load i32, ptr %fill.idx.3
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.36, 2000
  br i1 %rcc.tmp.37, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.39 = load i32, ptr %fill.idx.3
  %rcc.tmp.40 = getelementptr [2000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.39
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.42, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.45 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 8
  %rcc.tmp.48 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 0
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.51 = load i32, ptr %fill.idx.4
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.51, 200
  br i1 %rcc.tmp.52, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.54 = load i32, ptr %fill.idx.4
  %rcc.tmp.55 = getelementptr [200 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.54
  store i32 0, ptr %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.57, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.60 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 1
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.63 = load i32, ptr %fill.idx.5
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.63, 200
  br i1 %rcc.tmp.64, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.66 = load i32, ptr %fill.idx.5
  %rcc.tmp.67 = getelementptr [200 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.66
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.69, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.72 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 2
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.75 = load i32, ptr %fill.idx.6
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.75, 200
  br i1 %rcc.tmp.76, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.78 = load i32, ptr %fill.idx.6
  %rcc.tmp.79 = getelementptr [200 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.78
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.81, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.84 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 3
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.87 = load i32, ptr %fill.idx.7
  %rcc.tmp.88 = icmp slt i32 %rcc.tmp.87, 200
  br i1 %rcc.tmp.88, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.90 = load i32, ptr %fill.idx.7
  %rcc.tmp.91 = getelementptr [200 x i32], ptr %rcc.tmp.84, i32 0, i32 %rcc.tmp.90
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.93, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  %rcc.tmp.96 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 4
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.99 = load i32, ptr %fill.idx.8
  %rcc.tmp.100 = icmp slt i32 %rcc.tmp.99, 200
  br i1 %rcc.tmp.100, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.102 = load i32, ptr %fill.idx.8
  %rcc.tmp.103 = getelementptr [200 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.102
  store i32 0, ptr %rcc.tmp.103
  %rcc.tmp.105 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.105, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  %rcc.tmp.108 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 5
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.111 = load i32, ptr %fill.idx.9
  %rcc.tmp.112 = icmp slt i32 %rcc.tmp.111, 200
  br i1 %rcc.tmp.112, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.114 = load i32, ptr %fill.idx.9
  %rcc.tmp.115 = getelementptr [200 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.114
  store i32 0, ptr %rcc.tmp.115
  %rcc.tmp.117 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.117, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  %rcc.tmp.120 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 6
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.123 = load i32, ptr %fill.idx.10
  %rcc.tmp.124 = icmp slt i32 %rcc.tmp.123, 200
  br i1 %rcc.tmp.124, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.126 = load i32, ptr %fill.idx.10
  %rcc.tmp.127 = getelementptr [200 x i32], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.126
  store i32 0, ptr %rcc.tmp.127
  %rcc.tmp.129 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.129, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  %rcc.tmp.132 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 7
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.135 = load i32, ptr %fill.idx.11
  %rcc.tmp.136 = icmp slt i32 %rcc.tmp.135, 200
  br i1 %rcc.tmp.136, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.138 = load i32, ptr %fill.idx.11
  %rcc.tmp.139 = getelementptr [200 x i32], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.138
  store i32 0, ptr %rcc.tmp.139
  %rcc.tmp.141 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.141, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  %rcc.tmp.144 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 8
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.147 = load i32, ptr %fill.idx.12
  %rcc.tmp.148 = icmp slt i32 %rcc.tmp.147, 200
  br i1 %rcc.tmp.148, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.150 = load i32, ptr %fill.idx.12
  %rcc.tmp.151 = getelementptr [200 x i32], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.150
  store i32 0, ptr %rcc.tmp.151
  %rcc.tmp.153 = add i32 %rcc.tmp.150, 1
  store i32 %rcc.tmp.153, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  %rcc.tmp.156 = getelementptr [10 x [200 x i32]], ptr %rcc.tmp.47, i32 0, i32 9
  store i32 0, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.cond.13:
  %rcc.tmp.159 = load i32, ptr %fill.idx.13
  %rcc.tmp.160 = icmp slt i32 %rcc.tmp.159, 200
  br i1 %rcc.tmp.160, label %array.fill.body.13, label %array.fill.end.13
array.fill.body.13:
  %rcc.tmp.162 = load i32, ptr %fill.idx.13
  %rcc.tmp.163 = getelementptr [200 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.162
  store i32 0, ptr %rcc.tmp.163
  %rcc.tmp.165 = add i32 %rcc.tmp.162, 1
  store i32 %rcc.tmp.165, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.end.13:
  %rcc.tmp.168 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 9
  %rcc.tmp.169 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.169
  %rcc.tmp.171 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.171
  %rcc.tmp.173 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.173
  %rcc.tmp.175 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.175
  %rcc.tmp.177 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.177
  %rcc.tmp.179 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.179
  %rcc.tmp.181 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.181
  %rcc.tmp.183 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.183
  %rcc.tmp.185 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.185
  %rcc.tmp.187 = getelementptr [10 x i32], ptr %rcc.tmp.168, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.187
  %rcc.tmp.189 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 10
  store i32 0, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.cond.14:
  %rcc.tmp.192 = load i32, ptr %fill.idx.14
  %rcc.tmp.193 = icmp slt i32 %rcc.tmp.192, 100
  br i1 %rcc.tmp.193, label %array.fill.body.14, label %array.fill.end.14
array.fill.body.14:
  %rcc.tmp.195 = load i32, ptr %fill.idx.14
  %rcc.tmp.196 = getelementptr [100 x i32], ptr %rcc.tmp.189, i32 0, i32 %rcc.tmp.195
  store i32 0, ptr %rcc.tmp.196
  %rcc.tmp.198 = add i32 %rcc.tmp.195, 1
  store i32 %rcc.tmp.198, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.end.14:
  %rcc.tmp.201 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 11
  store i32 0, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.cond.15:
  %rcc.tmp.204 = load i32, ptr %fill.idx.15
  %rcc.tmp.205 = icmp slt i32 %rcc.tmp.204, 100
  br i1 %rcc.tmp.205, label %array.fill.body.15, label %array.fill.end.15
array.fill.body.15:
  %rcc.tmp.207 = load i32, ptr %fill.idx.15
  %rcc.tmp.208 = getelementptr [100 x [50 x i32]], ptr %rcc.tmp.201, i32 0, i32 %rcc.tmp.207
  store i32 0, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.cond.16:
  %rcc.tmp.211 = load i32, ptr %fill.idx.16
  %rcc.tmp.212 = icmp slt i32 %rcc.tmp.211, 50
  br i1 %rcc.tmp.212, label %array.fill.body.16, label %array.fill.end.16
array.fill.body.16:
  %rcc.tmp.214 = load i32, ptr %fill.idx.16
  %rcc.tmp.215 = getelementptr [50 x i32], ptr %rcc.tmp.208, i32 0, i32 %rcc.tmp.214
  store i32 0, ptr %rcc.tmp.215
  %rcc.tmp.217 = add i32 %rcc.tmp.214, 1
  store i32 %rcc.tmp.217, ptr %fill.idx.16
  br label %array.fill.cond.16
array.fill.end.16:
  %rcc.tmp.220 = add i32 %rcc.tmp.207, 1
  store i32 %rcc.tmp.220, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.end.15:
  %rcc.tmp.223 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 12
  store i32 0, ptr %fill.idx.17
  br label %array.fill.cond.17
array.fill.cond.17:
  %rcc.tmp.226 = load i32, ptr %fill.idx.17
  %rcc.tmp.227 = icmp slt i32 %rcc.tmp.226, 100
  br i1 %rcc.tmp.227, label %array.fill.body.17, label %array.fill.end.17
array.fill.body.17:
  %rcc.tmp.229 = load i32, ptr %fill.idx.17
  %rcc.tmp.230 = getelementptr [100 x i32], ptr %rcc.tmp.223, i32 0, i32 %rcc.tmp.229
  store i32 0, ptr %rcc.tmp.230
  %rcc.tmp.232 = add i32 %rcc.tmp.229, 1
  store i32 %rcc.tmp.232, ptr %fill.idx.17
  br label %array.fill.cond.17
array.fill.end.17:
  %rcc.tmp.235 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.235
  %rcc.tmp.237 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 14
  %rcc.tmp.238 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.238
  %rcc.tmp.240 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.240
  %rcc.tmp.242 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.242
  %rcc.tmp.244 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.244
  %rcc.tmp.246 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.246
  %rcc.tmp.248 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.248
  %rcc.tmp.250 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.250
  %rcc.tmp.252 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.252
  %rcc.tmp.254 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.254
  %rcc.tmp.256 = getelementptr [10 x i32], ptr %rcc.tmp.237, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.256
  %rcc.tmp.258 = getelementptr %SortingAnalyzer, ptr %ret.slot, i32 0, i32 15
  %rcc.tmp.259 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.259
  %rcc.tmp.261 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.261
  %rcc.tmp.263 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.263
  %rcc.tmp.265 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.265
  %rcc.tmp.267 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.267
  %rcc.tmp.269 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.269
  %rcc.tmp.271 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.271
  %rcc.tmp.273 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.273
  %rcc.tmp.275 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.275
  %rcc.tmp.277 = getelementptr [10 x i32], ptr %rcc.tmp.258, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.277
  ret void
}
define void @DataProcessor.perform_advanced_operations.(%DataProcessor* %self.tmp, %SortingAnalyzer* %analyzer.tmp) {
entry:
  %self..tmp = alloca %DataProcessor* 
  %analyzer..tmp = alloca %SortingAnalyzer* 
  %i = alloca i32 
  store %DataProcessor* %self.tmp, ptr %self..tmp
  store %SortingAnalyzer* %analyzer.tmp, ptr %analyzer..tmp
  %rcc.tmp.3 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %DataProcessor, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load %SortingAnalyzer*, ptr %analyzer..tmp
  %rcc.tmp.6 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.5, i32 0, i32 2
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %rcc.tmp.4
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %DataProcessor, ptr %rcc.tmp.12, i32 0, i32 3
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %DataProcessor, ptr %rcc.tmp.18, i32 0, i32 0
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [1000 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load %SortingAnalyzer*, ptr %analyzer..tmp
  %rcc.tmp.24 = getelementptr %SortingAnalyzer, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [2000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %rcc.tmp.22
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.34 = load %DataProcessor*, ptr %self..tmp
  call void @DataProcessor.generate_fibonacci_transform.(%DataProcessor* %rcc.tmp.34)
  %rcc.tmp.36 = load %DataProcessor*, ptr %self..tmp
  call void @DataProcessor.apply_mathematical_operations.(%DataProcessor* %rcc.tmp.36)
  %rcc.tmp.38 = load %DataProcessor*, ptr %self..tmp
  call void @DataProcessor.perform_statistical_analysis.(%DataProcessor* %rcc.tmp.38)
  %rcc.tmp.40 = load %DataProcessor*, ptr %self..tmp
  call void @DataProcessor.execute_matrix_operations.(%DataProcessor* %rcc.tmp.40)
  %rcc.tmp.42 = load %DataProcessor*, ptr %self..tmp
  call void @DataProcessor.output_analysis_results.(%DataProcessor* %rcc.tmp.42)
  ret void
}
define void @DataProcessor.generate_fibonacci_transform.(%DataProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %DataProcessor* 
  %fib_prev = alloca i32 
  %fib_curr = alloca i32 
  %i = alloca i32 
  %fib_next = alloca i32 
  store %DataProcessor* %self.tmp, ptr %self..tmp
  store i32 1, ptr %fib_prev
  store i32 1, ptr %fib_curr
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %DataProcessor, ptr %rcc.tmp.7, i32 0, i32 3
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %DataProcessor, ptr %rcc.tmp.13, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [1000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %DataProcessor, ptr %rcc.tmp.18, i32 0, i32 0
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [1000 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %fib_curr
  %rcc.tmp.25 = mul i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = srem i32 %rcc.tmp.25, 1000000
  store i32 %rcc.tmp.26, ptr %rcc.tmp.17
  %rcc.tmp.28 = load i32, ptr %fib_prev
  %rcc.tmp.29 = load i32, ptr %fib_curr
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %fib_next
  %rcc.tmp.32 = load i32, ptr %fib_curr
  store i32 %rcc.tmp.32, ptr %fib_prev
  %rcc.tmp.34 = load i32, ptr %fib_next
  store i32 %rcc.tmp.34, ptr %fib_curr
  %rcc.tmp.36 = load i32, ptr %fib_curr
  %rcc.tmp.37 = icmp sgt i32 %rcc.tmp.36, 1000000
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  store i32 1, ptr %fib_curr
  store i32 1, ptr %fib_prev
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @DataProcessor.apply_mathematical_operations.(%DataProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %DataProcessor* 
  %i = alloca i32 
  %primary = alloca i32 
  %secondary = alloca i32 
  store %DataProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %DataProcessor, ptr %rcc.tmp.5, i32 0, i32 3
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %DataProcessor, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [1000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %primary
  %rcc.tmp.18 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %DataProcessor, ptr %rcc.tmp.18, i32 0, i32 1
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [1000 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %secondary
  %rcc.tmp.25 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %DataProcessor, ptr %rcc.tmp.25, i32 0, i32 2
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [2000 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %primary
  %rcc.tmp.31 = load i32, ptr %primary
  %rcc.tmp.32 = mul i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %secondary
  %rcc.tmp.34 = add i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 32768
  store i32 %rcc.tmp.35, ptr %rcc.tmp.29
  %rcc.tmp.37 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %DataProcessor, ptr %rcc.tmp.37, i32 0, i32 2
  %rcc.tmp.39 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %DataProcessor, ptr %rcc.tmp.39, i32 0, i32 3
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [2000 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %primary
  %rcc.tmp.47 = load i32, ptr %secondary
  %rcc.tmp.48 = srem i32 %rcc.tmp.47, 32768
  %rcc.tmp.49 = load i32, ptr %secondary
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 32768
  %rcc.tmp.51 = mul i32 %rcc.tmp.48, %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.46, %rcc.tmp.51
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 32768
  store i32 %rcc.tmp.53, ptr %rcc.tmp.45
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @DataProcessor.perform_statistical_analysis.(%DataProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %DataProcessor* 
  %i = alloca i32 
  %sum = alloca i32 
  %sum_squares = alloca i32 
  %min_val = alloca i32 
  %max_val = alloca i32 
  %value = alloca i32 
  %max_frequency = alloca i32 
  %mode = alloca i32 
  store %DataProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 10000
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %DataProcessor, ptr %rcc.tmp.8, i32 0, i32 6
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [10000 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %sum
  store i32 0, ptr %sum_squares
  %rcc.tmp.20 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.21 = getelementptr %DataProcessor, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = getelementptr [1000 x i32], ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %min_val
  %rcc.tmp.25 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %DataProcessor, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = getelementptr [1000 x i32], ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %max_val
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.34 = getelementptr %DataProcessor, ptr %rcc.tmp.33, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %DataProcessor, ptr %rcc.tmp.39, i32 0, i32 0
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [1000 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %value
  %rcc.tmp.46 = load i32, ptr %value
  %rcc.tmp.47 = load i32, ptr %sum
  %rcc.tmp.48 = add i32 %rcc.tmp.47, %rcc.tmp.46
  store i32 %rcc.tmp.48, ptr %sum
  %rcc.tmp.50 = load i32, ptr %value
  %rcc.tmp.51 = load i32, ptr %value
  %rcc.tmp.52 = mul i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %sum_squares
  %rcc.tmp.54 = add i32 %rcc.tmp.53, %rcc.tmp.52
  store i32 %rcc.tmp.54, ptr %sum_squares
  %rcc.tmp.56 = load i32, ptr %value
  %rcc.tmp.57 = load i32, ptr %min_val
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %if.then, label %if.else
if.then:
  %rcc.tmp.60 = load i32, ptr %value
  store i32 %rcc.tmp.60, ptr %min_val
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.64 = load i32, ptr %value
  %rcc.tmp.65 = load i32, ptr %max_val
  %rcc.tmp.66 = icmp sgt i32 %rcc.tmp.64, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %value
  store i32 %rcc.tmp.68, ptr %max_val
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.72 = load i32, ptr %value
  %rcc.tmp.73 = icmp sge i32 %rcc.tmp.72, 0
  br i1 %rcc.tmp.73, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.75 = load i32, ptr %value
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.75, 10000
  br label %sc.merge
sc.merge:
  %rcc.tmp.78 = phi i1 [0, %if.merge.2], [%rcc.tmp.76, %and.rhs]
  br i1 %rcc.tmp.78, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.80 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.81 = getelementptr %DataProcessor, ptr %rcc.tmp.80, i32 0, i32 6
  %rcc.tmp.82 = load i32, ptr %value
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [10000 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %rcc.tmp.84
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.94 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %DataProcessor, ptr %rcc.tmp.94, i32 0, i32 7
  %rcc.tmp.96 = getelementptr [20 x i32], ptr %rcc.tmp.95, i32 0, i32 0
  %rcc.tmp.97 = load i32, ptr %sum
  store i32 %rcc.tmp.97, ptr %rcc.tmp.96
  %rcc.tmp.99 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %DataProcessor, ptr %rcc.tmp.99, i32 0, i32 7
  %rcc.tmp.101 = getelementptr [20 x i32], ptr %rcc.tmp.100, i32 0, i32 1
  %rcc.tmp.102 = load i32, ptr %sum_squares
  store i32 %rcc.tmp.102, ptr %rcc.tmp.101
  %rcc.tmp.104 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.105 = getelementptr %DataProcessor, ptr %rcc.tmp.104, i32 0, i32 7
  %rcc.tmp.106 = getelementptr [20 x i32], ptr %rcc.tmp.105, i32 0, i32 2
  %rcc.tmp.107 = load i32, ptr %min_val
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.110 = getelementptr %DataProcessor, ptr %rcc.tmp.109, i32 0, i32 7
  %rcc.tmp.111 = getelementptr [20 x i32], ptr %rcc.tmp.110, i32 0, i32 3
  %rcc.tmp.112 = load i32, ptr %max_val
  store i32 %rcc.tmp.112, ptr %rcc.tmp.111
  %rcc.tmp.114 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.115 = getelementptr %DataProcessor, ptr %rcc.tmp.114, i32 0, i32 7
  %rcc.tmp.116 = getelementptr [20 x i32], ptr %rcc.tmp.115, i32 0, i32 4
  %rcc.tmp.117 = load i32, ptr %sum
  %rcc.tmp.118 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.119 = getelementptr %DataProcessor, ptr %rcc.tmp.118, i32 0, i32 3
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  %rcc.tmp.121 = sdiv i32 %rcc.tmp.117, %rcc.tmp.120
  store i32 %rcc.tmp.121, ptr %rcc.tmp.116
  %rcc.tmp.123 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.124 = getelementptr %DataProcessor, ptr %rcc.tmp.123, i32 0, i32 7
  %rcc.tmp.125 = getelementptr [20 x i32], ptr %rcc.tmp.124, i32 0, i32 5
  %rcc.tmp.126 = load i32, ptr %max_val
  %rcc.tmp.127 = load i32, ptr %min_val
  %rcc.tmp.128 = sub i32 %rcc.tmp.126, %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %rcc.tmp.125
  store i32 0, ptr %max_frequency
  %rcc.tmp.131 = load i32, ptr %min_val
  store i32 %rcc.tmp.131, ptr %mode
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = icmp slt i32 %rcc.tmp.135, 10000
  br i1 %rcc.tmp.136, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.139 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.140 = getelementptr %DataProcessor, ptr %rcc.tmp.139, i32 0, i32 6
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [10000 x i32], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %max_frequency
  %rcc.tmp.146 = icmp sgt i32 %rcc.tmp.144, %rcc.tmp.145
  br i1 %rcc.tmp.146, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.148 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.149 = getelementptr %DataProcessor, ptr %rcc.tmp.148, i32 0, i32 6
  %rcc.tmp.150 = load i32, ptr %i
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = getelementptr [10000 x i32], ptr %rcc.tmp.149, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %rcc.tmp.152
  store i32 %rcc.tmp.153, ptr %max_frequency
  %rcc.tmp.155 = load i32, ptr %i
  store i32 %rcc.tmp.155, ptr %mode
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.159 = load i32, ptr %i
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.160, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.163 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.164 = getelementptr %DataProcessor, ptr %rcc.tmp.163, i32 0, i32 7
  %rcc.tmp.165 = getelementptr [20 x i32], ptr %rcc.tmp.164, i32 0, i32 6
  %rcc.tmp.166 = load i32, ptr %mode
  store i32 %rcc.tmp.166, ptr %rcc.tmp.165
  %rcc.tmp.168 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.169 = getelementptr %DataProcessor, ptr %rcc.tmp.168, i32 0, i32 7
  %rcc.tmp.170 = getelementptr [20 x i32], ptr %rcc.tmp.169, i32 0, i32 7
  %rcc.tmp.171 = load i32, ptr %max_frequency
  store i32 %rcc.tmp.171, ptr %rcc.tmp.170
  %rcc.tmp.173 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.174 = getelementptr %DataProcessor, ptr %rcc.tmp.173, i32 0, i32 7
  %rcc.tmp.175 = getelementptr [20 x i32], ptr %rcc.tmp.174, i32 0, i32 8
  %rcc.tmp.176 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.177 = getelementptr %DataProcessor, ptr %rcc.tmp.176, i32 0, i32 0
  %rcc.tmp.178 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.179 = getelementptr %DataProcessor, ptr %rcc.tmp.178, i32 0, i32 3
  %rcc.tmp.180 = load i32, ptr %rcc.tmp.179
  %rcc.tmp.181 = sdiv i32 %rcc.tmp.180, 2
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = getelementptr [1000 x i32], ptr %rcc.tmp.177, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.183
  store i32 %rcc.tmp.184, ptr %rcc.tmp.175
  ret void
}
define void @DataProcessor.execute_matrix_operations.(%DataProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %DataProcessor* 
  %i = alloca i32 
  %j = alloca i32 
  %idx1 = alloca i32 
  %idx2 = alloca i32 
  %matrix_sum = alloca i32 
  %diagonal_sum = alloca i32 
  %j.2 = alloca i32 
  store %DataProcessor* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %DataProcessor, ptr %rcc.tmp.2, i32 0, i32 5
  %rcc.tmp.4 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %DataProcessor, ptr %rcc.tmp.4, i32 0, i32 3
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 100
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %DataProcessor, ptr %rcc.tmp.9, i32 0, i32 3
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = phi i32 [%rcc.tmp.11, %if.then], [100, %if.else]
  store i32 %rcc.tmp.14, ptr %rcc.tmp.3
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %DataProcessor, ptr %rcc.tmp.19, i32 0, i32 5
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %DataProcessor, ptr %rcc.tmp.28, i32 0, i32 5
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %DataProcessor, ptr %rcc.tmp.35, i32 0, i32 3
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = mul i32 %rcc.tmp.34, %rcc.tmp.37
  %rcc.tmp.39 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.40 = getelementptr %DataProcessor, ptr %rcc.tmp.39, i32 0, i32 5
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = sdiv i32 %rcc.tmp.38, %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  store i32 %rcc.tmp.43, ptr %idx1
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.47 = getelementptr %DataProcessor, ptr %rcc.tmp.46, i32 0, i32 3
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = mul i32 %rcc.tmp.45, %rcc.tmp.48
  %rcc.tmp.50 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.51 = getelementptr %DataProcessor, ptr %rcc.tmp.50, i32 0, i32 5
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = sdiv i32 %rcc.tmp.49, %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  store i32 %rcc.tmp.54, ptr %idx2
  %rcc.tmp.56 = load i32, ptr %idx1
  %rcc.tmp.57 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.58 = getelementptr %DataProcessor, ptr %rcc.tmp.57, i32 0, i32 3
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = icmp ult i32 %rcc.tmp.56, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.63 = load i32, ptr %idx2
  %rcc.tmp.64 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.65 = getelementptr %DataProcessor, ptr %rcc.tmp.64, i32 0, i32 3
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = icmp ult i32 %rcc.tmp.63, %rcc.tmp.67
  br label %sc.merge
sc.merge:
  %rcc.tmp.70 = phi i1 [0, %while.body.2], [%rcc.tmp.68, %and.rhs]
  br i1 %rcc.tmp.70, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.72 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.73 = getelementptr %DataProcessor, ptr %rcc.tmp.72, i32 0, i32 4
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [100 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.81 = getelementptr %DataProcessor, ptr %rcc.tmp.80, i32 0, i32 0
  %rcc.tmp.82 = load i32, ptr %idx1
  %rcc.tmp.83 = getelementptr [1000 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.86 = getelementptr %DataProcessor, ptr %rcc.tmp.85, i32 0, i32 1
  %rcc.tmp.87 = load i32, ptr %idx2
  %rcc.tmp.88 = getelementptr [1000 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.88
  %rcc.tmp.90 = add i32 %rcc.tmp.84, %rcc.tmp.89
  %rcc.tmp.91 = srem i32 %rcc.tmp.90, 1000
  store i32 %rcc.tmp.91, ptr %rcc.tmp.79
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.95 = load i32, ptr %j
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %matrix_sum
  store i32 0, ptr %diagonal_sum
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.109 = getelementptr %DataProcessor, ptr %rcc.tmp.108, i32 0, i32 5
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = icmp slt i32 %rcc.tmp.107, %rcc.tmp.110
  br i1 %rcc.tmp.111, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %j.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.116 = load i32, ptr %j.2
  %rcc.tmp.117 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.118 = getelementptr %DataProcessor, ptr %rcc.tmp.117, i32 0, i32 5
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = icmp slt i32 %rcc.tmp.116, %rcc.tmp.119
  br i1 %rcc.tmp.120, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.123 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.124 = getelementptr %DataProcessor, ptr %rcc.tmp.123, i32 0, i32 4
  %rcc.tmp.125 = load i32, ptr %i
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.124, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.128 = load i32, ptr %j.2
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = getelementptr [100 x i32], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %matrix_sum
  %rcc.tmp.133 = add i32 %rcc.tmp.132, %rcc.tmp.131
  store i32 %rcc.tmp.133, ptr %matrix_sum
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = load i32, ptr %j.2
  %rcc.tmp.137 = icmp eq i32 %rcc.tmp.135, %rcc.tmp.136
  br i1 %rcc.tmp.137, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.139 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.140 = getelementptr %DataProcessor, ptr %rcc.tmp.139, i32 0, i32 4
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %j.2
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = getelementptr [100 x i32], ptr %rcc.tmp.143, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %diagonal_sum
  %rcc.tmp.149 = add i32 %rcc.tmp.148, %rcc.tmp.147
  store i32 %rcc.tmp.149, ptr %diagonal_sum
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.153 = load i32, ptr %j.2
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %j.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.157 = load i32, ptr %i
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 1
  store i32 %rcc.tmp.158, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.161 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.162 = getelementptr %DataProcessor, ptr %rcc.tmp.161, i32 0, i32 7
  %rcc.tmp.163 = getelementptr [20 x i32], ptr %rcc.tmp.162, i32 0, i32 9
  %rcc.tmp.164 = load i32, ptr %matrix_sum
  store i32 %rcc.tmp.164, ptr %rcc.tmp.163
  %rcc.tmp.166 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.167 = getelementptr %DataProcessor, ptr %rcc.tmp.166, i32 0, i32 7
  %rcc.tmp.168 = getelementptr [20 x i32], ptr %rcc.tmp.167, i32 0, i32 10
  %rcc.tmp.169 = load i32, ptr %diagonal_sum
  store i32 %rcc.tmp.169, ptr %rcc.tmp.168
  ret void
}
define void @DataProcessor.output_analysis_results.(%DataProcessor* %self.tmp) {
entry:
  %self..tmp = alloca %DataProcessor* 
  %i = alloca i32 
  %complexity_metric = alloca i32 
  %efficiency_metric = alloca i32 
  %final_score = alloca i32 
  store %DataProcessor* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 11
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %DataProcessor, ptr %rcc.tmp.8, i32 0, i32 7
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [20 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  call void @printlnInt.(i32 %rcc.tmp.13)
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.19 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %DataProcessor, ptr %rcc.tmp.19, i32 0, i32 7
  %rcc.tmp.21 = getelementptr [20 x i32], ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %DataProcessor, ptr %rcc.tmp.23, i32 0, i32 7
  %rcc.tmp.25 = getelementptr [20 x i32], ptr %rcc.tmp.24, i32 0, i32 9
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.22, %rcc.tmp.26
  %rcc.tmp.28 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %DataProcessor, ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  %rcc.tmp.32 = sdiv i32 %rcc.tmp.27, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %complexity_metric
  %rcc.tmp.34 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %DataProcessor, ptr %rcc.tmp.34, i32 0, i32 7
  %rcc.tmp.36 = getelementptr [20 x i32], ptr %rcc.tmp.35, i32 0, i32 10
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load %DataProcessor*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %DataProcessor, ptr %rcc.tmp.38, i32 0, i32 7
  %rcc.tmp.40 = getelementptr [20 x i32], ptr %rcc.tmp.39, i32 0, i32 4
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = mul i32 %rcc.tmp.37, %rcc.tmp.41
  %rcc.tmp.43 = sdiv i32 %rcc.tmp.42, 1000
  store i32 %rcc.tmp.43, ptr %efficiency_metric
  %rcc.tmp.45 = load i32, ptr %complexity_metric
  %rcc.tmp.46 = load i32, ptr %efficiency_metric
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %final_score
  %rcc.tmp.49 = load i32, ptr %complexity_metric
  call void @printlnInt.(i32 %rcc.tmp.49)
  %rcc.tmp.51 = load i32, ptr %efficiency_metric
  call void @printlnInt.(i32 %rcc.tmp.51)
  %rcc.tmp.53 = load i32, ptr %final_score
  call void @printlnInt.(i32 %rcc.tmp.53)
  ret void
}
define void @DataProcessor.new.(%DataProcessor* sret(%DataProcessor) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %fill.idx.7 = alloca i32 
  %rcc.tmp.1 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 1000
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [1000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.25 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 2000
  br i1 %rcc.tmp.29, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.31 = load i32, ptr %fill.idx.3
  %rcc.tmp.32 = getelementptr [2000 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.34, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.37 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.42 = load i32, ptr %fill.idx.4
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 100
  br i1 %rcc.tmp.43, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.45 = load i32, ptr %fill.idx.4
  %rcc.tmp.46 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.45
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.49 = load i32, ptr %fill.idx.5
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 100
  br i1 %rcc.tmp.50, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.52 = load i32, ptr %fill.idx.5
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.55, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.58 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.58, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.61 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.66 = load i32, ptr %fill.idx.6
  %rcc.tmp.67 = icmp slt i32 %rcc.tmp.66, 10000
  br i1 %rcc.tmp.67, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.69 = load i32, ptr %fill.idx.6
  %rcc.tmp.70 = getelementptr [10000 x i32], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.69
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.72, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.75 = getelementptr %DataProcessor, ptr %ret.slot, i32 0, i32 7
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.78 = load i32, ptr %fill.idx.7
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.78, 20
  br i1 %rcc.tmp.79, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.81 = load i32, ptr %fill.idx.7
  %rcc.tmp.82 = getelementptr [20 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.81
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.84, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  ret void
}
define void @main() {
entry:
  %data_size = alloca i32 
  %analyzer = alloca %SortingAnalyzer 
  %processor = alloca %DataProcessor 
  %iterations = alloca i32 
  %total_performance = alloca i32 
  %iter = alloca i32 
  %modifier = alloca i32 
  %i = alloca i32 
  %final_metric = alloca i32 
  %rcc.tmp.1 = call i32 @getInt.()
  store i32 %rcc.tmp.1, ptr %data_size
  call void @SortingAnalyzer.new.(%SortingAnalyzer* %analyzer)
  %rcc.tmp.4 = load i32, ptr %data_size
  call void @SortingAnalyzer.initialize_data.(%SortingAnalyzer* %analyzer, i32 %rcc.tmp.4)
  call void @SortingAnalyzer.run_comprehensive_tests.(%SortingAnalyzer* %analyzer)
  call void @DataProcessor.new.(%DataProcessor* %processor)
  call void @DataProcessor.perform_advanced_operations.(%DataProcessor* %processor, %SortingAnalyzer* %analyzer)
  %rcc.tmp.9 = call i32 @getInt.()
  store i32 %rcc.tmp.9, ptr %iterations
  store i32 0, ptr %total_performance
  store i32 0, ptr %iter
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %iter
  %rcc.tmp.15 = load i32, ptr %iterations
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %iter
  %rcc.tmp.20 = mul i32 %rcc.tmp.19, 17
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 23
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 100
  store i32 %rcc.tmp.22, ptr %modifier
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = getelementptr %SortingAnalyzer, ptr %analyzer, i32 0, i32 2
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.32 = getelementptr %SortingAnalyzer, ptr %analyzer, i32 0, i32 0
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = getelementptr [2000 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = getelementptr %SortingAnalyzer, ptr %analyzer, i32 0, i32 1
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [2000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %modifier
  %rcc.tmp.42 = add i32 %rcc.tmp.40, %rcc.tmp.41
  %rcc.tmp.43 = srem i32 %rcc.tmp.42, 10000
  store i32 %rcc.tmp.43, ptr %rcc.tmp.35
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.46, ptr %i
  br label %while.cond.2
while.end.2:
  call void @SortingAnalyzer.reset_statistics.(%SortingAnalyzer* %analyzer)
  %rcc.tmp.50 = getelementptr %SortingAnalyzer, ptr %analyzer, i32 0, i32 2
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = sub i32 %rcc.tmp.51, 1
  call void @SortingAnalyzer.quick_sort_3way.(%SortingAnalyzer* %analyzer, i32 0, i32 %rcc.tmp.52)
  %rcc.tmp.54 = getelementptr %SortingAnalyzer, ptr %analyzer, i32 0, i32 3
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr %SortingAnalyzer, ptr %analyzer, i32 0, i32 4
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.55, %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %total_performance
  %rcc.tmp.60 = add i32 %rcc.tmp.59, %rcc.tmp.58
  store i32 %rcc.tmp.60, ptr %total_performance
  %rcc.tmp.62 = load i32, ptr %iter
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %iter
  br label %while.cond
while.end:
  %rcc.tmp.66 = load i32, ptr %total_performance
  call void @printlnInt.(i32 %rcc.tmp.66)
  %rcc.tmp.68 = load i32, ptr %total_performance
  %rcc.tmp.69 = getelementptr %DataProcessor, ptr %processor, i32 0, i32 7
  %rcc.tmp.70 = getelementptr [20 x i32], ptr %rcc.tmp.69, i32 0, i32 4
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = mul i32 %rcc.tmp.68, %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %iterations
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  %rcc.tmp.75 = sdiv i32 %rcc.tmp.72, %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %final_metric
  %rcc.tmp.77 = load i32, ptr %final_metric
  call void @printlnInt.(i32 %rcc.tmp.77)
  call void @exit.(i32 0)
  ret void
}
