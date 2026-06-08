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
%DataSet = type {[10000 x i32], i32, i1, i32, i32, i32, i32}
%Matrix = type {[100 x [100 x i32]], i32, i32}
%PerformanceCounter = type {i32, i32, i32, i32, i32}
%SortingResults = type {i32, i32, i32, i32, i32, i32}
define void @init_dataset_pattern.(%DataSet* sret(%DataSet) %ret.slot, i32 %pattern.tmp, i32 %size.tmp) {
entry:
  %pattern..tmp = alloca i32 
  %size..tmp = alloca i32 
  %dataset = alloca %DataSet 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %value = alloca i32 
  store i32 %pattern.tmp, ptr %pattern..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = getelementptr %DataSet, ptr %dataset, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 10000
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [10000 x i32], ptr %rcc.tmp.3, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.15 = getelementptr %DataSet, ptr %dataset, i32 0, i32 1
  %rcc.tmp.16 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr %DataSet, ptr %dataset, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr %DataSet, ptr %dataset, i32 0, i32 3
  store i32 999999, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr %DataSet, ptr %dataset, i32 0, i32 4
  %rcc.tmp.23 = sub i32 0, 999999
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %DataSet, ptr %dataset, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr %DataSet, ptr %dataset, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.27
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = load i32, ptr %size..tmp
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.31, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.36 = load i32, ptr %pattern..tmp
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.36, 0
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = mul i32 %rcc.tmp.39, 11047
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 12345
  %rcc.tmp.42 = srem i32 %rcc.tmp.41, 100000
  br label %if.merge
if.else:
  %rcc.tmp.44 = load i32, ptr %pattern..tmp
  %rcc.tmp.45 = icmp eq i32 %rcc.tmp.44, 1
  br i1 %rcc.tmp.45, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = mul i32 %rcc.tmp.47, 3
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 7
  br label %if.merge.2
if.else.2:
  %rcc.tmp.51 = load i32, ptr %pattern..tmp
  %rcc.tmp.52 = icmp eq i32 %rcc.tmp.51, 2
  br i1 %rcc.tmp.52, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.54 = load i32, ptr %size..tmp
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = sub i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = mul i32 %rcc.tmp.56, 5
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 13
  br label %if.merge.3
if.else.3:
  %rcc.tmp.60 = load i32, ptr %pattern..tmp
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 3
  br i1 %rcc.tmp.61, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = load i32, ptr %size..tmp
  %rcc.tmp.65 = sdiv i32 %rcc.tmp.64, 2
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.63, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = mul i32 %rcc.tmp.68, 4
  br label %if.merge.5
if.else.5:
  %rcc.tmp.71 = load i32, ptr %size..tmp
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = sub i32 %rcc.tmp.71, %rcc.tmp.72
  %rcc.tmp.74 = mul i32 %rcc.tmp.73, 4
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.76 = phi i32 [%rcc.tmp.69, %if.then.5], [%rcc.tmp.74, %if.else.5]
  br label %if.merge.4
if.else.4:
  %rcc.tmp.78 = load i32, ptr %pattern..tmp
  %rcc.tmp.79 = icmp eq i32 %rcc.tmp.78, 4
  br i1 %rcc.tmp.79, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = load i32, ptr %size..tmp
  %rcc.tmp.83 = sdiv i32 %rcc.tmp.82, 2
  %rcc.tmp.84 = icmp slt i32 %rcc.tmp.81, %rcc.tmp.83
  br i1 %rcc.tmp.84, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.86 = load i32, ptr %size..tmp
  %rcc.tmp.87 = sdiv i32 %rcc.tmp.86, 2
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = sub i32 %rcc.tmp.87, %rcc.tmp.88
  %rcc.tmp.90 = mul i32 %rcc.tmp.89, 3
  br label %if.merge.7
if.else.7:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = load i32, ptr %size..tmp
  %rcc.tmp.94 = sdiv i32 %rcc.tmp.93, 2
  %rcc.tmp.95 = sub i32 %rcc.tmp.92, %rcc.tmp.94
  %rcc.tmp.96 = mul i32 %rcc.tmp.95, 3
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.98 = phi i32 [%rcc.tmp.90, %if.then.7], [%rcc.tmp.96, %if.else.7]
  br label %if.merge.6
if.else.6:
  %rcc.tmp.100 = load i32, ptr %pattern..tmp
  %rcc.tmp.101 = icmp eq i32 %rcc.tmp.100, 5
  br i1 %rcc.tmp.101, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = mul i32 %rcc.tmp.103, 2
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = srem i32 %rcc.tmp.105, 10
  %rcc.tmp.107 = icmp eq i32 %rcc.tmp.106, 5
  %rcc.tmp.108 = zext i1 %rcc.tmp.107 to i32
  %rcc.tmp.109 = mul i32 %rcc.tmp.108, 100
  %rcc.tmp.110 = add i32 %rcc.tmp.104, %rcc.tmp.109
  br label %if.merge.8
if.else.8:
  %rcc.tmp.112 = load i32, ptr %pattern..tmp
  %rcc.tmp.113 = icmp eq i32 %rcc.tmp.112, 6
  br i1 %rcc.tmp.113, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = sdiv i32 %rcc.tmp.115, 10
  %rcc.tmp.117 = mul i32 %rcc.tmp.116, 7
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 23
  br label %if.merge.9
if.else.9:
  %rcc.tmp.120 = load i32, ptr %pattern..tmp
  %rcc.tmp.121 = icmp eq i32 %rcc.tmp.120, 7
  br i1 %rcc.tmp.121, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = srem i32 %rcc.tmp.123, 2
  %rcc.tmp.125 = icmp eq i32 %rcc.tmp.124, 0
  br i1 %rcc.tmp.125, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.127 = load i32, ptr %i
  br label %if.merge.11
if.else.11:
  %rcc.tmp.129 = load i32, ptr %size..tmp
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = sub i32 %rcc.tmp.129, %rcc.tmp.130
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.133 = phi i32 [%rcc.tmp.127, %if.then.11], [%rcc.tmp.131, %if.else.11]
  br label %if.merge.10
if.else.10:
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = load i32, ptr %i
  %rcc.tmp.137 = mul i32 %rcc.tmp.135, %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = mul i32 %rcc.tmp.138, 7
  %rcc.tmp.140 = add i32 %rcc.tmp.137, %rcc.tmp.139
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 17
  %rcc.tmp.142 = srem i32 %rcc.tmp.141, 1000
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.144 = phi i32 [%rcc.tmp.133, %if.merge.11], [%rcc.tmp.142, %if.else.10]
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.146 = phi i32 [%rcc.tmp.118, %if.then.9], [%rcc.tmp.144, %if.merge.10]
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.148 = phi i32 [%rcc.tmp.110, %if.then.8], [%rcc.tmp.146, %if.merge.9]
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.150 = phi i32 [%rcc.tmp.98, %if.merge.7], [%rcc.tmp.148, %if.merge.8]
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.152 = phi i32 [%rcc.tmp.76, %if.merge.5], [%rcc.tmp.150, %if.merge.6]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.154 = phi i32 [%rcc.tmp.58, %if.then.3], [%rcc.tmp.152, %if.merge.4]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.156 = phi i32 [%rcc.tmp.49, %if.then.2], [%rcc.tmp.154, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.158 = phi i32 [%rcc.tmp.42, %if.then], [%rcc.tmp.156, %if.merge.2]
  store i32 %rcc.tmp.158, ptr %value
  %rcc.tmp.160 = getelementptr %DataSet, ptr %dataset, i32 0, i32 0
  %rcc.tmp.161 = load i32, ptr %i
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 0
  %rcc.tmp.163 = getelementptr [10000 x i32], ptr %rcc.tmp.160, i32 0, i32 %rcc.tmp.162
  %rcc.tmp.164 = load i32, ptr %value
  store i32 %rcc.tmp.164, ptr %rcc.tmp.163
  %rcc.tmp.166 = getelementptr %DataSet, ptr %dataset, i32 0, i32 5
  %rcc.tmp.167 = getelementptr %DataSet, ptr %dataset, i32 0, i32 5
  %rcc.tmp.168 = load i32, ptr %rcc.tmp.167
  %rcc.tmp.169 = load i32, ptr %value
  %rcc.tmp.170 = add i32 %rcc.tmp.168, %rcc.tmp.169
  store i32 %rcc.tmp.170, ptr %rcc.tmp.166
  %rcc.tmp.172 = load i32, ptr %value
  %rcc.tmp.173 = getelementptr %DataSet, ptr %dataset, i32 0, i32 3
  %rcc.tmp.174 = load i32, ptr %rcc.tmp.173
  %rcc.tmp.175 = icmp slt i32 %rcc.tmp.172, %rcc.tmp.174
  br i1 %rcc.tmp.175, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.177 = getelementptr %DataSet, ptr %dataset, i32 0, i32 3
  %rcc.tmp.178 = load i32, ptr %value
  store i32 %rcc.tmp.178, ptr %rcc.tmp.177
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.182 = load i32, ptr %value
  %rcc.tmp.183 = getelementptr %DataSet, ptr %dataset, i32 0, i32 4
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.183
  %rcc.tmp.185 = icmp sgt i32 %rcc.tmp.182, %rcc.tmp.184
  br i1 %rcc.tmp.185, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.187 = getelementptr %DataSet, ptr %dataset, i32 0, i32 4
  %rcc.tmp.188 = load i32, ptr %value
  store i32 %rcc.tmp.188, ptr %rcc.tmp.187
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.192 = load i32, ptr %i
  %rcc.tmp.193 = add i32 %rcc.tmp.192, 1
  store i32 %rcc.tmp.193, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.196 = getelementptr %DataSet, ptr %dataset, i32 0, i32 6
  %rcc.tmp.197 = getelementptr %DataSet, ptr %dataset, i32 0, i32 5
  %rcc.tmp.198 = load i32, ptr %rcc.tmp.197
  %rcc.tmp.199 = load i32, ptr %size..tmp
  %rcc.tmp.200 = sdiv i32 %rcc.tmp.198, %rcc.tmp.199
  store i32 %rcc.tmp.200, ptr %rcc.tmp.196
  %rcc.tmp.202 = bitcast %DataSet* %ret.slot to i8*
  %rcc.tmp.203 = bitcast %DataSet* %dataset to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.202, i8* %rcc.tmp.203, i32 40024, i1 0)
  ret void
}
define void @init_performance_counter.(%PerformanceCounter* sret(%PerformanceCounter) %ret.slot) {
entry:
  %rcc.tmp.1 = getelementptr %PerformanceCounter, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr %PerformanceCounter, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr %PerformanceCounter, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr %PerformanceCounter, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr %PerformanceCounter, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.9
  ret void
}
define void @bubble_sort.([10000 x i32]* %data.tmp, i32 %size.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %i = alloca i32 
  %j = alloca i32 
  %swapped = alloca i1 
  %temp = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.4 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.5 = getelementptr %PerformanceCounter, ptr %rcc.tmp.4, i32 0, i32 4
  %rcc.tmp.6 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.7 = getelementptr %PerformanceCounter, ptr %rcc.tmp.6, i32 0, i32 4
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %rcc.tmp.5
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = sub i32 %rcc.tmp.14, 1
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i1 0, ptr %swapped
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = load i32, ptr %size..tmp
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = sub i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = sub i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.30 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.31 = getelementptr %PerformanceCounter, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.33 = getelementptr %PerformanceCounter, ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %rcc.tmp.31
  %rcc.tmp.37 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.38 = getelementptr %PerformanceCounter, ptr %rcc.tmp.37, i32 0, i32 3
  %rcc.tmp.39 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.40 = getelementptr %PerformanceCounter, ptr %rcc.tmp.39, i32 0, i32 3
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 2
  store i32 %rcc.tmp.42, ptr %rcc.tmp.38
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.47 = getelementptr [10000 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %j
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  %rcc.tmp.52 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.53 = getelementptr [10000 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = icmp sgt i32 %rcc.tmp.48, %rcc.tmp.54
  br i1 %rcc.tmp.55, label %if.then, label %if.else
if.then:
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.60 = getelementptr [10000 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %temp
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.66 = getelementptr [10000 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %j
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  %rcc.tmp.70 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.71 = getelementptr [10000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.66
  %rcc.tmp.74 = load i32, ptr %j
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  %rcc.tmp.77 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.78 = getelementptr [10000 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %temp
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.82 = getelementptr %PerformanceCounter, ptr %rcc.tmp.81, i32 0, i32 2
  %rcc.tmp.83 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.84 = getelementptr %PerformanceCounter, ptr %rcc.tmp.83, i32 0, i32 2
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %rcc.tmp.82
  %rcc.tmp.88 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.89 = getelementptr %PerformanceCounter, ptr %rcc.tmp.88, i32 0, i32 3
  %rcc.tmp.90 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.91 = getelementptr %PerformanceCounter, ptr %rcc.tmp.90, i32 0, i32 3
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 4
  store i32 %rcc.tmp.93, ptr %rcc.tmp.89
  store i1 1, ptr %swapped
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.98 = load i32, ptr %j
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.102 = load i1, ptr %swapped
  %rcc.tmp.103 = xor i1 %rcc.tmp.102, true
  br i1 %rcc.tmp.103, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.111 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.112 = getelementptr %PerformanceCounter, ptr %rcc.tmp.111, i32 0, i32 0
  %rcc.tmp.113 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.114 = getelementptr %PerformanceCounter, ptr %rcc.tmp.113, i32 0, i32 0
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %size..tmp
  %rcc.tmp.117 = load i32, ptr %size..tmp
  %rcc.tmp.118 = mul i32 %rcc.tmp.116, %rcc.tmp.117
  %rcc.tmp.119 = add i32 %rcc.tmp.115, %rcc.tmp.118
  store i32 %rcc.tmp.119, ptr %rcc.tmp.112
  ret void
}
define void @selection_sort.([10000 x i32]* %data.tmp, i32 %size.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %i = alloca i32 
  %min_idx = alloca i32 
  %j = alloca i32 
  %temp = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.4 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.5 = getelementptr %PerformanceCounter, ptr %rcc.tmp.4, i32 0, i32 4
  %rcc.tmp.6 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.7 = getelementptr %PerformanceCounter, ptr %rcc.tmp.6, i32 0, i32 4
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %rcc.tmp.5
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = sub i32 %rcc.tmp.14, 1
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  store i32 %rcc.tmp.19, ptr %min_idx
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = load i32, ptr %size..tmp
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.30 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.31 = getelementptr %PerformanceCounter, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.33 = getelementptr %PerformanceCounter, ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %rcc.tmp.31
  %rcc.tmp.37 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.38 = getelementptr %PerformanceCounter, ptr %rcc.tmp.37, i32 0, i32 3
  %rcc.tmp.39 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.40 = getelementptr %PerformanceCounter, ptr %rcc.tmp.39, i32 0, i32 3
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 2
  store i32 %rcc.tmp.42, ptr %rcc.tmp.38
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.47 = getelementptr [10000 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %min_idx
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.52 = getelementptr [10000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %if.then, label %if.else
if.then:
  %rcc.tmp.56 = load i32, ptr %j
  store i32 %rcc.tmp.56, ptr %min_idx
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.64 = load i32, ptr %min_idx
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = icmp ne i32 %rcc.tmp.64, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.71 = getelementptr [10000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %temp
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.77 = getelementptr [10000 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %min_idx
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.81 = getelementptr [10000 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %rcc.tmp.77
  %rcc.tmp.84 = load i32, ptr %min_idx
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.87 = getelementptr [10000 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %temp
  store i32 %rcc.tmp.88, ptr %rcc.tmp.87
  %rcc.tmp.90 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.91 = getelementptr %PerformanceCounter, ptr %rcc.tmp.90, i32 0, i32 2
  %rcc.tmp.92 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.93 = getelementptr %PerformanceCounter, ptr %rcc.tmp.92, i32 0, i32 2
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %rcc.tmp.91
  %rcc.tmp.97 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.98 = getelementptr %PerformanceCounter, ptr %rcc.tmp.97, i32 0, i32 3
  %rcc.tmp.99 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.100 = getelementptr %PerformanceCounter, ptr %rcc.tmp.99, i32 0, i32 3
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 4
  store i32 %rcc.tmp.102, ptr %rcc.tmp.98
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.110 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.111 = getelementptr %PerformanceCounter, ptr %rcc.tmp.110, i32 0, i32 0
  %rcc.tmp.112 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.113 = getelementptr %PerformanceCounter, ptr %rcc.tmp.112, i32 0, i32 0
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = load i32, ptr %size..tmp
  %rcc.tmp.116 = load i32, ptr %size..tmp
  %rcc.tmp.117 = mul i32 %rcc.tmp.115, %rcc.tmp.116
  %rcc.tmp.118 = add i32 %rcc.tmp.114, %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %rcc.tmp.111
  ret void
}
define void @insertion_sort.([10000 x i32]* %data.tmp, i32 %size.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %i = alloca i32 
  %key = alloca i32 
  %j = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.4 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.5 = getelementptr %PerformanceCounter, ptr %rcc.tmp.4, i32 0, i32 4
  %rcc.tmp.6 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.7 = getelementptr %PerformanceCounter, ptr %rcc.tmp.6, i32 0, i32 4
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %rcc.tmp.5
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.21 = getelementptr [10000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %key
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = sub i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %j
  %rcc.tmp.27 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.28 = getelementptr %PerformanceCounter, ptr %rcc.tmp.27, i32 0, i32 3
  %rcc.tmp.29 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.30 = getelementptr %PerformanceCounter, ptr %rcc.tmp.29, i32 0, i32 3
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.28
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = icmp sge i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.41 = getelementptr [10000 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
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
  %rcc.tmp.49 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.50 = getelementptr %PerformanceCounter, ptr %rcc.tmp.49, i32 0, i32 1
  %rcc.tmp.51 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.52 = getelementptr %PerformanceCounter, ptr %rcc.tmp.51, i32 0, i32 1
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.50
  %rcc.tmp.56 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.57 = getelementptr %PerformanceCounter, ptr %rcc.tmp.56, i32 0, i32 3
  %rcc.tmp.58 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.59 = getelementptr %PerformanceCounter, ptr %rcc.tmp.58, i32 0, i32 3
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 2
  store i32 %rcc.tmp.61, ptr %rcc.tmp.57
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  %rcc.tmp.66 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.67 = getelementptr [10000 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.71 = getelementptr [10000 x i32], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.67
  %rcc.tmp.74 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.75 = getelementptr %PerformanceCounter, ptr %rcc.tmp.74, i32 0, i32 3
  %rcc.tmp.76 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.77 = getelementptr %PerformanceCounter, ptr %rcc.tmp.76, i32 0, i32 3
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 2
  store i32 %rcc.tmp.79, ptr %rcc.tmp.75
  %rcc.tmp.81 = load i32, ptr %j
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  %rcc.tmp.88 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.89 = getelementptr [10000 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %key
  store i32 %rcc.tmp.90, ptr %rcc.tmp.89
  %rcc.tmp.92 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.93 = getelementptr %PerformanceCounter, ptr %rcc.tmp.92, i32 0, i32 3
  %rcc.tmp.94 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.95 = getelementptr %PerformanceCounter, ptr %rcc.tmp.94, i32 0, i32 3
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %rcc.tmp.93
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.103 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.104 = getelementptr %PerformanceCounter, ptr %rcc.tmp.103, i32 0, i32 0
  %rcc.tmp.105 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.106 = getelementptr %PerformanceCounter, ptr %rcc.tmp.105, i32 0, i32 0
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %size..tmp
  %rcc.tmp.109 = load i32, ptr %size..tmp
  %rcc.tmp.110 = mul i32 %rcc.tmp.108, %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.107, %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %rcc.tmp.104
  ret void
}
define i32 @partition.([10000 x i32]* %data.tmp, i32 %low.tmp, i32 %high.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %low..tmp = alloca i32 
  %high..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %pivot = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %temp = alloca i32 
  %temp.2 = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %low.tmp, ptr %low..tmp
  store i32 %high.tmp, ptr %high..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.5 = load i32, ptr %high..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.8 = getelementptr [10000 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %pivot
  %rcc.tmp.11 = load i32, ptr %low..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %i
  %rcc.tmp.14 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.15 = getelementptr %PerformanceCounter, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.17 = getelementptr %PerformanceCounter, ptr %rcc.tmp.16, i32 0, i32 3
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %rcc.tmp.15
  %rcc.tmp.21 = load i32, ptr %low..tmp
  store i32 %rcc.tmp.21, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = load i32, ptr %high..tmp
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.30 = getelementptr %PerformanceCounter, ptr %rcc.tmp.29, i32 0, i32 1
  %rcc.tmp.31 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.32 = getelementptr %PerformanceCounter, ptr %rcc.tmp.31, i32 0, i32 1
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %rcc.tmp.30
  %rcc.tmp.36 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.37 = getelementptr %PerformanceCounter, ptr %rcc.tmp.36, i32 0, i32 3
  %rcc.tmp.38 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.39 = getelementptr %PerformanceCounter, ptr %rcc.tmp.38, i32 0, i32 3
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %rcc.tmp.37
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.46 = getelementptr [10000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %pivot
  %rcc.tmp.49 = icmp sle i32 %rcc.tmp.47, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %if.then, label %if.else
if.then:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.57 = getelementptr [10000 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %temp
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.63 = getelementptr [10000 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.67 = getelementptr [10000 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %rcc.tmp.63
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.73 = getelementptr [10000 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %temp
  store i32 %rcc.tmp.74, ptr %rcc.tmp.73
  %rcc.tmp.76 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.77 = getelementptr %PerformanceCounter, ptr %rcc.tmp.76, i32 0, i32 2
  %rcc.tmp.78 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.79 = getelementptr %PerformanceCounter, ptr %rcc.tmp.78, i32 0, i32 2
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %rcc.tmp.77
  %rcc.tmp.83 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.84 = getelementptr %PerformanceCounter, ptr %rcc.tmp.83, i32 0, i32 3
  %rcc.tmp.85 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.86 = getelementptr %PerformanceCounter, ptr %rcc.tmp.85, i32 0, i32 3
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 4
  store i32 %rcc.tmp.88, ptr %rcc.tmp.84
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.100 = getelementptr [10000 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  store i32 %rcc.tmp.101, ptr %temp.2
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.107 = getelementptr [10000 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %high..tmp
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.111 = getelementptr [10000 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  store i32 %rcc.tmp.112, ptr %rcc.tmp.107
  %rcc.tmp.114 = load i32, ptr %high..tmp
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.117 = getelementptr [10000 x i32], ptr %rcc.tmp.116, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %temp.2
  store i32 %rcc.tmp.118, ptr %rcc.tmp.117
  %rcc.tmp.120 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.121 = getelementptr %PerformanceCounter, ptr %rcc.tmp.120, i32 0, i32 2
  %rcc.tmp.122 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.123 = getelementptr %PerformanceCounter, ptr %rcc.tmp.122, i32 0, i32 2
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %rcc.tmp.121
  %rcc.tmp.127 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.128 = getelementptr %PerformanceCounter, ptr %rcc.tmp.127, i32 0, i32 3
  %rcc.tmp.129 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.130 = getelementptr %PerformanceCounter, ptr %rcc.tmp.129, i32 0, i32 3
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 4
  store i32 %rcc.tmp.132, ptr %rcc.tmp.128
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 1
  ret i32 %rcc.tmp.135
}
define void @quick_sort_range.([10000 x i32]* %data.tmp, i32 %low.tmp, i32 %high.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %low..tmp = alloca i32 
  %high..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %pi = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %low.tmp, ptr %low..tmp
  store i32 %high.tmp, ptr %high..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.5 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.6 = getelementptr %PerformanceCounter, ptr %rcc.tmp.5, i32 0, i32 4
  %rcc.tmp.7 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.8 = getelementptr %PerformanceCounter, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.6
  %rcc.tmp.12 = load i32, ptr %low..tmp
  %rcc.tmp.13 = load i32, ptr %high..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.17 = load i32, ptr %low..tmp
  %rcc.tmp.18 = load i32, ptr %high..tmp
  %rcc.tmp.19 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.20 = call i32 @partition.([10000 x i32]* %rcc.tmp.16, i32 %rcc.tmp.17, i32 %rcc.tmp.18, %PerformanceCounter* %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %pi
  %rcc.tmp.22 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.23 = load i32, ptr %low..tmp
  %rcc.tmp.24 = load i32, ptr %pi
  %rcc.tmp.25 = sub i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load %PerformanceCounter*, ptr %counter..tmp
  call void @quick_sort_range.([10000 x i32]* %rcc.tmp.22, i32 %rcc.tmp.23, i32 %rcc.tmp.25, %PerformanceCounter* %rcc.tmp.26)
  %rcc.tmp.28 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.29 = load i32, ptr %pi
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = load i32, ptr %high..tmp
  %rcc.tmp.32 = load %PerformanceCounter*, ptr %counter..tmp
  call void @quick_sort_range.([10000 x i32]* %rcc.tmp.28, i32 %rcc.tmp.30, i32 %rcc.tmp.31, %PerformanceCounter* %rcc.tmp.32)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.37 = getelementptr %PerformanceCounter, ptr %rcc.tmp.36, i32 0, i32 0
  %rcc.tmp.38 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.39 = getelementptr %PerformanceCounter, ptr %rcc.tmp.38, i32 0, i32 0
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %high..tmp
  %rcc.tmp.42 = load i32, ptr %low..tmp
  %rcc.tmp.43 = sub i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  %rcc.tmp.45 = add i32 %rcc.tmp.40, %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %rcc.tmp.37
  ret void
}
define void @quick_sort.([10000 x i32]* %data.tmp, i32 %size.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = icmp sgt i32 %rcc.tmp.4, 1
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = load %PerformanceCounter*, ptr %counter..tmp
  call void @quick_sort_range.([10000 x i32]* %rcc.tmp.7, i32 0, i32 %rcc.tmp.9, %PerformanceCounter* %rcc.tmp.10)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @merge.([10000 x i32]* %data.tmp, i32 %left.tmp, i32 %mid.tmp, i32 %right.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %left..tmp = alloca i32 
  %mid..tmp = alloca i32 
  %right..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %n1 = alloca i32 
  %n2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %temp_start = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %mid.tmp, ptr %mid..tmp
  store i32 %right.tmp, ptr %right..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.6 = load i32, ptr %mid..tmp
  %rcc.tmp.7 = load i32, ptr %left..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.6, %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %n1
  %rcc.tmp.11 = load i32, ptr %right..tmp
  %rcc.tmp.12 = load i32, ptr %mid..tmp
  %rcc.tmp.13 = sub i32 %rcc.tmp.11, %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %n2
  store i32 0, ptr %i
  store i32 0, ptr %j
  %rcc.tmp.17 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.17, ptr %k
  %rcc.tmp.19 = load i32, ptr %n1
  %rcc.tmp.20 = sub i32 10000, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %temp_start
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %n1
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = load i32, ptr %temp_start
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.34 = getelementptr [10000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %left..tmp
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.40 = getelementptr [10000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %rcc.tmp.34
  %rcc.tmp.43 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.44 = getelementptr %PerformanceCounter, ptr %rcc.tmp.43, i32 0, i32 3
  %rcc.tmp.45 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.46 = getelementptr %PerformanceCounter, ptr %rcc.tmp.45, i32 0, i32 3
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 2
  store i32 %rcc.tmp.48, ptr %rcc.tmp.44
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  store i32 0, ptr %j
  %rcc.tmp.56 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.56, ptr %k
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = load i32, ptr %n1
  %rcc.tmp.61 = icmp slt i32 %rcc.tmp.59, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = load i32, ptr %n2
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.63, %rcc.tmp.64
  br label %sc.merge
sc.merge:
  %rcc.tmp.67 = phi i1 [0, %while.cond.2], [%rcc.tmp.65, %and.rhs]
  br i1 %rcc.tmp.67, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.70 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.71 = getelementptr %PerformanceCounter, ptr %rcc.tmp.70, i32 0, i32 1
  %rcc.tmp.72 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.73 = getelementptr %PerformanceCounter, ptr %rcc.tmp.72, i32 0, i32 1
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %rcc.tmp.71
  %rcc.tmp.77 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.78 = getelementptr %PerformanceCounter, ptr %rcc.tmp.77, i32 0, i32 3
  %rcc.tmp.79 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.80 = getelementptr %PerformanceCounter, ptr %rcc.tmp.79, i32 0, i32 3
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 2
  store i32 %rcc.tmp.82, ptr %rcc.tmp.78
  %rcc.tmp.84 = load i32, ptr %temp_start
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.89 = getelementptr [10000 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %mid..tmp
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  %rcc.tmp.93 = load i32, ptr %j
  %rcc.tmp.94 = add i32 %rcc.tmp.92, %rcc.tmp.93
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.97 = getelementptr [10000 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.98 = load i32, ptr %rcc.tmp.97
  %rcc.tmp.99 = icmp sle i32 %rcc.tmp.90, %rcc.tmp.98
  br i1 %rcc.tmp.99, label %if.then, label %if.else
if.then:
  %rcc.tmp.101 = load i32, ptr %k
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.104 = getelementptr [10000 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %temp_start
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.105, %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.110 = getelementptr [10000 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %rcc.tmp.104
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.117 = load i32, ptr %k
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.120 = getelementptr [10000 x i32], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.121 = load i32, ptr %mid..tmp
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  %rcc.tmp.123 = load i32, ptr %j
  %rcc.tmp.124 = add i32 %rcc.tmp.122, %rcc.tmp.123
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.127 = getelementptr [10000 x i32], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %rcc.tmp.120
  %rcc.tmp.130 = load i32, ptr %j
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %j
  br label %if.merge
if.merge:
  %rcc.tmp.134 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.135 = getelementptr %PerformanceCounter, ptr %rcc.tmp.134, i32 0, i32 3
  %rcc.tmp.136 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.137 = getelementptr %PerformanceCounter, ptr %rcc.tmp.136, i32 0, i32 3
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %rcc.tmp.135
  %rcc.tmp.141 = load i32, ptr %k
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 1
  store i32 %rcc.tmp.142, ptr %k
  br label %while.cond.2
while.end.2:
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.146 = load i32, ptr %i
  %rcc.tmp.147 = load i32, ptr %n1
  %rcc.tmp.148 = icmp slt i32 %rcc.tmp.146, %rcc.tmp.147
  br i1 %rcc.tmp.148, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.151 = load i32, ptr %k
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.154 = getelementptr [10000 x i32], ptr %rcc.tmp.153, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.155 = load i32, ptr %temp_start
  %rcc.tmp.156 = load i32, ptr %i
  %rcc.tmp.157 = add i32 %rcc.tmp.155, %rcc.tmp.156
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.160 = getelementptr [10000 x i32], ptr %rcc.tmp.159, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.161 = load i32, ptr %rcc.tmp.160
  store i32 %rcc.tmp.161, ptr %rcc.tmp.154
  %rcc.tmp.163 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.164 = getelementptr %PerformanceCounter, ptr %rcc.tmp.163, i32 0, i32 3
  %rcc.tmp.165 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.166 = getelementptr %PerformanceCounter, ptr %rcc.tmp.165, i32 0, i32 3
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.166
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 2
  store i32 %rcc.tmp.168, ptr %rcc.tmp.164
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 1
  store i32 %rcc.tmp.171, ptr %i
  %rcc.tmp.173 = load i32, ptr %k
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 1
  store i32 %rcc.tmp.174, ptr %k
  br label %while.cond.3
while.end.3:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.178 = load i32, ptr %j
  %rcc.tmp.179 = load i32, ptr %n2
  %rcc.tmp.180 = icmp slt i32 %rcc.tmp.178, %rcc.tmp.179
  br i1 %rcc.tmp.180, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.183 = load i32, ptr %k
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 0
  %rcc.tmp.185 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.186 = getelementptr [10000 x i32], ptr %rcc.tmp.185, i32 0, i32 %rcc.tmp.184
  %rcc.tmp.187 = load i32, ptr %mid..tmp
  %rcc.tmp.188 = add i32 %rcc.tmp.187, 1
  %rcc.tmp.189 = load i32, ptr %j
  %rcc.tmp.190 = add i32 %rcc.tmp.188, %rcc.tmp.189
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.193 = getelementptr [10000 x i32], ptr %rcc.tmp.192, i32 0, i32 %rcc.tmp.191
  %rcc.tmp.194 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.194, ptr %rcc.tmp.186
  %rcc.tmp.196 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.197 = getelementptr %PerformanceCounter, ptr %rcc.tmp.196, i32 0, i32 3
  %rcc.tmp.198 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.199 = getelementptr %PerformanceCounter, ptr %rcc.tmp.198, i32 0, i32 3
  %rcc.tmp.200 = load i32, ptr %rcc.tmp.199
  %rcc.tmp.201 = add i32 %rcc.tmp.200, 2
  store i32 %rcc.tmp.201, ptr %rcc.tmp.197
  %rcc.tmp.203 = load i32, ptr %j
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  store i32 %rcc.tmp.204, ptr %j
  %rcc.tmp.206 = load i32, ptr %k
  %rcc.tmp.207 = add i32 %rcc.tmp.206, 1
  store i32 %rcc.tmp.207, ptr %k
  br label %while.cond.4
while.end.4:
  ret void
}
define void @merge_sort_range.([10000 x i32]* %data.tmp, i32 %left.tmp, i32 %right.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %mid = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %right.tmp, ptr %right..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.5 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.6 = getelementptr %PerformanceCounter, ptr %rcc.tmp.5, i32 0, i32 4
  %rcc.tmp.7 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.8 = getelementptr %PerformanceCounter, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.6
  %rcc.tmp.12 = load i32, ptr %left..tmp
  %rcc.tmp.13 = load i32, ptr %right..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load i32, ptr %left..tmp
  %rcc.tmp.17 = load i32, ptr %right..tmp
  %rcc.tmp.18 = load i32, ptr %left..tmp
  %rcc.tmp.19 = sub i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = sdiv i32 %rcc.tmp.19, 2
  %rcc.tmp.21 = add i32 %rcc.tmp.16, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %mid
  %rcc.tmp.23 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.24 = load i32, ptr %left..tmp
  %rcc.tmp.25 = load i32, ptr %mid
  %rcc.tmp.26 = load %PerformanceCounter*, ptr %counter..tmp
  call void @merge_sort_range.([10000 x i32]* %rcc.tmp.23, i32 %rcc.tmp.24, i32 %rcc.tmp.25, %PerformanceCounter* %rcc.tmp.26)
  %rcc.tmp.28 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.29 = load i32, ptr %mid
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  %rcc.tmp.31 = load i32, ptr %right..tmp
  %rcc.tmp.32 = load %PerformanceCounter*, ptr %counter..tmp
  call void @merge_sort_range.([10000 x i32]* %rcc.tmp.28, i32 %rcc.tmp.30, i32 %rcc.tmp.31, %PerformanceCounter* %rcc.tmp.32)
  %rcc.tmp.34 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.35 = load i32, ptr %left..tmp
  %rcc.tmp.36 = load i32, ptr %mid
  %rcc.tmp.37 = load i32, ptr %right..tmp
  %rcc.tmp.38 = load %PerformanceCounter*, ptr %counter..tmp
  call void @merge.([10000 x i32]* %rcc.tmp.34, i32 %rcc.tmp.35, i32 %rcc.tmp.36, i32 %rcc.tmp.37, %PerformanceCounter* %rcc.tmp.38)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.42 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.43 = getelementptr %PerformanceCounter, ptr %rcc.tmp.42, i32 0, i32 0
  %rcc.tmp.44 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.45 = getelementptr %PerformanceCounter, ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %right..tmp
  %rcc.tmp.48 = load i32, ptr %left..tmp
  %rcc.tmp.49 = sub i32 %rcc.tmp.47, %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  %rcc.tmp.51 = add i32 %rcc.tmp.46, %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %rcc.tmp.43
  ret void
}
define void @merge_sort.([10000 x i32]* %data.tmp, i32 %size.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.4 = load i32, ptr %size..tmp
  %rcc.tmp.5 = icmp sgt i32 %rcc.tmp.4, 1
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = load %PerformanceCounter*, ptr %counter..tmp
  call void @merge_sort_range.([10000 x i32]* %rcc.tmp.7, i32 0, i32 %rcc.tmp.9, %PerformanceCounter* %rcc.tmp.10)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @heapify.([10000 x i32]* %data.tmp, i32 %n.tmp, i32 %i.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %n..tmp = alloca i32 
  %i..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %largest = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %temp = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %n.tmp, ptr %n..tmp
  store i32 %i.tmp, ptr %i..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.5 = load i32, ptr %i..tmp
  store i32 %rcc.tmp.5, ptr %largest
  %rcc.tmp.7 = load i32, ptr %i..tmp
  %rcc.tmp.8 = mul i32 2, %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %left
  %rcc.tmp.11 = load i32, ptr %i..tmp
  %rcc.tmp.12 = mul i32 2, %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 2
  store i32 %rcc.tmp.13, ptr %right
  %rcc.tmp.15 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.16 = getelementptr %PerformanceCounter, ptr %rcc.tmp.15, i32 0, i32 3
  %rcc.tmp.17 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.18 = getelementptr %PerformanceCounter, ptr %rcc.tmp.17, i32 0, i32 3
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %rcc.tmp.16
  %rcc.tmp.22 = load i32, ptr %left
  %rcc.tmp.23 = load i32, ptr %n..tmp
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.27 = getelementptr %PerformanceCounter, ptr %rcc.tmp.26, i32 0, i32 1
  %rcc.tmp.28 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.29 = getelementptr %PerformanceCounter, ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %rcc.tmp.27
  %rcc.tmp.33 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.34 = getelementptr %PerformanceCounter, ptr %rcc.tmp.33, i32 0, i32 3
  %rcc.tmp.35 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.36 = getelementptr %PerformanceCounter, ptr %rcc.tmp.35, i32 0, i32 3
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 2
  store i32 %rcc.tmp.38, ptr %rcc.tmp.34
  %rcc.tmp.40 = load i32, ptr %left
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.43 = getelementptr [10000 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %largest
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.48 = getelementptr [10000 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp sgt i32 %rcc.tmp.44, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.52 = load i32, ptr %left
  store i32 %rcc.tmp.52, ptr %largest
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.58 = load i32, ptr %right
  %rcc.tmp.59 = load i32, ptr %n..tmp
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.62 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.63 = getelementptr %PerformanceCounter, ptr %rcc.tmp.62, i32 0, i32 1
  %rcc.tmp.64 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.65 = getelementptr %PerformanceCounter, ptr %rcc.tmp.64, i32 0, i32 1
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %rcc.tmp.63
  %rcc.tmp.69 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.70 = getelementptr %PerformanceCounter, ptr %rcc.tmp.69, i32 0, i32 3
  %rcc.tmp.71 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.72 = getelementptr %PerformanceCounter, ptr %rcc.tmp.71, i32 0, i32 3
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 2
  store i32 %rcc.tmp.74, ptr %rcc.tmp.70
  %rcc.tmp.76 = load i32, ptr %right
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.79 = getelementptr [10000 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %largest
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.84 = getelementptr [10000 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = icmp sgt i32 %rcc.tmp.80, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.88 = load i32, ptr %right
  store i32 %rcc.tmp.88, ptr %largest
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.94 = load i32, ptr %largest
  %rcc.tmp.95 = load i32, ptr %i..tmp
  %rcc.tmp.96 = icmp ne i32 %rcc.tmp.94, %rcc.tmp.95
  br i1 %rcc.tmp.96, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.98 = load i32, ptr %i..tmp
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.101 = getelementptr [10000 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.102, ptr %temp
  %rcc.tmp.104 = load i32, ptr %i..tmp
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.107 = getelementptr [10000 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %largest
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.111 = getelementptr [10000 x i32], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  store i32 %rcc.tmp.112, ptr %rcc.tmp.107
  %rcc.tmp.114 = load i32, ptr %largest
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.117 = getelementptr [10000 x i32], ptr %rcc.tmp.116, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %temp
  store i32 %rcc.tmp.118, ptr %rcc.tmp.117
  %rcc.tmp.120 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.121 = getelementptr %PerformanceCounter, ptr %rcc.tmp.120, i32 0, i32 2
  %rcc.tmp.122 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.123 = getelementptr %PerformanceCounter, ptr %rcc.tmp.122, i32 0, i32 2
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %rcc.tmp.121
  %rcc.tmp.127 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.128 = getelementptr %PerformanceCounter, ptr %rcc.tmp.127, i32 0, i32 3
  %rcc.tmp.129 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.130 = getelementptr %PerformanceCounter, ptr %rcc.tmp.129, i32 0, i32 3
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 4
  store i32 %rcc.tmp.132, ptr %rcc.tmp.128
  %rcc.tmp.134 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.135 = load i32, ptr %n..tmp
  %rcc.tmp.136 = load i32, ptr %largest
  %rcc.tmp.137 = load %PerformanceCounter*, ptr %counter..tmp
  call void @heapify.([10000 x i32]* %rcc.tmp.134, i32 %rcc.tmp.135, i32 %rcc.tmp.136, %PerformanceCounter* %rcc.tmp.137)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  ret void
}
define void @heap_sort.([10000 x i32]* %data.tmp, i32 %size.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %i = alloca i32 
  %temp = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.4 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.5 = getelementptr %PerformanceCounter, ptr %rcc.tmp.4, i32 0, i32 4
  %rcc.tmp.6 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.7 = getelementptr %PerformanceCounter, ptr %rcc.tmp.6, i32 0, i32 4
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %rcc.tmp.5
  %rcc.tmp.11 = load i32, ptr %size..tmp
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.11, 2
  %rcc.tmp.13 = sub i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = icmp sge i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.21 = load i32, ptr %size..tmp
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = load %PerformanceCounter*, ptr %counter..tmp
  call void @heapify.([10000 x i32]* %rcc.tmp.20, i32 %rcc.tmp.21, i32 %rcc.tmp.22, %PerformanceCounter* %rcc.tmp.23)
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = sub i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %size..tmp
  %rcc.tmp.30 = sub i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.33, 0
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.37 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.38 = getelementptr [10000 x i32], ptr %rcc.tmp.37, i32 0, i32 0
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %temp
  %rcc.tmp.41 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.42 = getelementptr [10000 x i32], ptr %rcc.tmp.41, i32 0, i32 0
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.46 = getelementptr [10000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %rcc.tmp.42
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.52 = getelementptr [10000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %temp
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.56 = getelementptr %PerformanceCounter, ptr %rcc.tmp.55, i32 0, i32 2
  %rcc.tmp.57 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.58 = getelementptr %PerformanceCounter, ptr %rcc.tmp.57, i32 0, i32 2
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %rcc.tmp.56
  %rcc.tmp.62 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.63 = getelementptr %PerformanceCounter, ptr %rcc.tmp.62, i32 0, i32 3
  %rcc.tmp.64 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.65 = getelementptr %PerformanceCounter, ptr %rcc.tmp.64, i32 0, i32 3
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 4
  store i32 %rcc.tmp.67, ptr %rcc.tmp.63
  %rcc.tmp.69 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = load %PerformanceCounter*, ptr %counter..tmp
  call void @heapify.([10000 x i32]* %rcc.tmp.69, i32 %rcc.tmp.70, i32 0, %PerformanceCounter* %rcc.tmp.71)
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = sub i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.77 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.78 = getelementptr %PerformanceCounter, ptr %rcc.tmp.77, i32 0, i32 0
  %rcc.tmp.79 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.80 = getelementptr %PerformanceCounter, ptr %rcc.tmp.79, i32 0, i32 0
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %size..tmp
  %rcc.tmp.83 = load i32, ptr %size..tmp
  %rcc.tmp.84 = mul i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = add i32 %rcc.tmp.81, %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %rcc.tmp.78
  ret void
}
define i32 @binary_search.([10000 x i32]* %data.tmp, i32 %size.tmp, i32 %target.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %target..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %left = alloca i32 
  %right = alloca i32 
  %mid = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %target.tmp, ptr %target..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.5 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.6 = getelementptr %PerformanceCounter, ptr %rcc.tmp.5, i32 0, i32 4
  %rcc.tmp.7 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.8 = getelementptr %PerformanceCounter, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.6
  store i32 0, ptr %left
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %right
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %left
  %rcc.tmp.18 = load i32, ptr %right
  %rcc.tmp.19 = icmp sle i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %left
  %rcc.tmp.23 = load i32, ptr %right
  %rcc.tmp.24 = load i32, ptr %left
  %rcc.tmp.25 = sub i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = sdiv i32 %rcc.tmp.25, 2
  %rcc.tmp.27 = add i32 %rcc.tmp.22, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %mid
  %rcc.tmp.29 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.30 = getelementptr %PerformanceCounter, ptr %rcc.tmp.29, i32 0, i32 1
  %rcc.tmp.31 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.32 = getelementptr %PerformanceCounter, ptr %rcc.tmp.31, i32 0, i32 1
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %rcc.tmp.30
  %rcc.tmp.36 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.37 = getelementptr %PerformanceCounter, ptr %rcc.tmp.36, i32 0, i32 3
  %rcc.tmp.38 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.39 = getelementptr %PerformanceCounter, ptr %rcc.tmp.38, i32 0, i32 3
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %rcc.tmp.37
  %rcc.tmp.43 = load i32, ptr %mid
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.46 = getelementptr [10000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %target..tmp
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.47, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %if.then, label %if.else
if.then:
  %rcc.tmp.51 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.52 = getelementptr %PerformanceCounter, ptr %rcc.tmp.51, i32 0, i32 0
  %rcc.tmp.53 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.54 = getelementptr %PerformanceCounter, ptr %rcc.tmp.53, i32 0, i32 0
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %rcc.tmp.52
  %rcc.tmp.58 = load i32, ptr %mid
  ret i32 %rcc.tmp.58
if.else:
  %rcc.tmp.60 = load i32, ptr %mid
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.63 = getelementptr [10000 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %target..tmp
  %rcc.tmp.66 = icmp slt i32 %rcc.tmp.64, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %mid
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %left
  br label %if.merge.2
if.else.2:
  %rcc.tmp.72 = load i32, ptr %mid
  %rcc.tmp.73 = sub i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %right
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.77 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.78 = getelementptr %PerformanceCounter, ptr %rcc.tmp.77, i32 0, i32 0
  %rcc.tmp.79 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.80 = getelementptr %PerformanceCounter, ptr %rcc.tmp.79, i32 0, i32 0
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %rcc.tmp.78
  br label %while.cond
while.end:
  %rcc.tmp.85 = sub i32 0, 1
  ret i32 %rcc.tmp.85
}
define i32 @linear_search.([10000 x i32]* %data.tmp, i32 %size.tmp, i32 %target.tmp, %PerformanceCounter* %counter.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %target..tmp = alloca i32 
  %counter..tmp = alloca %PerformanceCounter* 
  %i = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %target.tmp, ptr %target..tmp
  store %PerformanceCounter* %counter.tmp, ptr %counter..tmp
  %rcc.tmp.5 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.6 = getelementptr %PerformanceCounter, ptr %rcc.tmp.5, i32 0, i32 4
  %rcc.tmp.7 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.8 = getelementptr %PerformanceCounter, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %rcc.tmp.6
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.20 = getelementptr %PerformanceCounter, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.22 = getelementptr %PerformanceCounter, ptr %rcc.tmp.21, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %rcc.tmp.20
  %rcc.tmp.26 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.27 = getelementptr %PerformanceCounter, ptr %rcc.tmp.26, i32 0, i32 3
  %rcc.tmp.28 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.29 = getelementptr %PerformanceCounter, ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %rcc.tmp.27
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.36 = getelementptr [10000 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %target..tmp
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  %rcc.tmp.41 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.42 = getelementptr %PerformanceCounter, ptr %rcc.tmp.41, i32 0, i32 0
  %rcc.tmp.43 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.44 = getelementptr %PerformanceCounter, ptr %rcc.tmp.43, i32 0, i32 0
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %rcc.tmp.42
  %rcc.tmp.50 = load i32, ptr %i
  ret i32 %rcc.tmp.50
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.57 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.58 = getelementptr %PerformanceCounter, ptr %rcc.tmp.57, i32 0, i32 0
  %rcc.tmp.59 = load %PerformanceCounter*, ptr %counter..tmp
  %rcc.tmp.60 = getelementptr %PerformanceCounter, ptr %rcc.tmp.59, i32 0, i32 0
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %size..tmp
  %rcc.tmp.63 = add i32 %rcc.tmp.61, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %rcc.tmp.58
  %rcc.tmp.65 = sub i32 0, 1
  ret i32 %rcc.tmp.65
}
define i32 @compute_variance.([10000 x i32]* %data.tmp, i32 %size.tmp, i32 %mean.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %mean..tmp = alloca i32 
  %sum_squared_diff = alloca i32 
  %i = alloca i32 
  %diff = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %mean.tmp, ptr %mean..tmp
  store i32 0, ptr %sum_squared_diff
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.15 = getelementptr [10000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %mean..tmp
  %rcc.tmp.18 = sub i32 %rcc.tmp.16, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %diff
  %rcc.tmp.20 = load i32, ptr %sum_squared_diff
  %rcc.tmp.21 = load i32, ptr %diff
  %rcc.tmp.22 = load i32, ptr %diff
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.20, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %sum_squared_diff
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.30 = load i32, ptr %sum_squared_diff
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = sdiv i32 %rcc.tmp.30, %rcc.tmp.31
  ret i32 %rcc.tmp.32
}
define i32 @compute_median.([10000 x i32]* %data.tmp, i32 %size.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %counter = alloca %PerformanceCounter 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  call void @init_performance_counter.(%PerformanceCounter* %counter)
  %rcc.tmp.4 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.5 = load i32, ptr %size..tmp
  call void @quick_sort.([10000 x i32]* %rcc.tmp.4, i32 %rcc.tmp.5, %PerformanceCounter* %counter)
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = srem i32 %rcc.tmp.7, 2
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %size..tmp
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = udiv i32 %rcc.tmp.12, 2
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.16 = getelementptr [10000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = udiv i32 %rcc.tmp.19, 2
  %rcc.tmp.21 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.22 = getelementptr [10000 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.17, %rcc.tmp.23
  %rcc.tmp.25 = sdiv i32 %rcc.tmp.24, 2
  br label %if.merge
if.else:
  %rcc.tmp.27 = load i32, ptr %size..tmp
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = udiv i32 %rcc.tmp.28, 2
  %rcc.tmp.30 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.31 = getelementptr [10000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  br label %if.merge
if.merge:
  %rcc.tmp.34 = phi i32 [%rcc.tmp.25, %if.then], [%rcc.tmp.32, %if.else]
  ret i32 %rcc.tmp.34
}
define void @init_matrix.(%Matrix* sret(%Matrix) %ret.slot, i32 %rows.tmp, i32 %cols.tmp, i32 %pattern.tmp) {
entry:
  %rows..tmp = alloca i32 
  %cols..tmp = alloca i32 
  %pattern..tmp = alloca i32 
  %matrix = alloca %Matrix 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %rows.tmp, ptr %rows..tmp
  store i32 %cols.tmp, ptr %cols..tmp
  store i32 %pattern.tmp, ptr %pattern..tmp
  %rcc.tmp.4 = getelementptr %Matrix, ptr %matrix, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 100
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 100
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.23 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.23, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.26 = getelementptr %Matrix, ptr %matrix, i32 0, i32 1
  %rcc.tmp.27 = load i32, ptr %rows..tmp
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr %Matrix, ptr %matrix, i32 0, i32 2
  %rcc.tmp.30 = load i32, ptr %cols..tmp
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = load i32, ptr %rows..tmp
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.41 = load i32, ptr %j
  %rcc.tmp.42 = load i32, ptr %cols..tmp
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.46 = load i32, ptr %pattern..tmp
  %rcc.tmp.47 = icmp eq i32 %rcc.tmp.46, 0
  br i1 %rcc.tmp.47, label %if.then, label %if.else
if.then:
  %rcc.tmp.49 = getelementptr %Matrix, ptr %matrix, i32 0, i32 0
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [100 x i32], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.62 = phi i32 [1, %if.then.2], [0, %if.else.2]
  store i32 %rcc.tmp.62, ptr %rcc.tmp.55
  br label %if.merge
if.else:
  %rcc.tmp.65 = load i32, ptr %pattern..tmp
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.65, 1
  br i1 %rcc.tmp.66, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.68 = getelementptr %Matrix, ptr %matrix, i32 0, i32 0
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [100 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = mul i32 %rcc.tmp.75, 17
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = mul i32 %rcc.tmp.77, 23
  %rcc.tmp.79 = add i32 %rcc.tmp.76, %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 13
  %rcc.tmp.81 = srem i32 %rcc.tmp.80, 100
  store i32 %rcc.tmp.81, ptr %rcc.tmp.74
  br label %if.merge.3
if.else.3:
  %rcc.tmp.84 = load i32, ptr %pattern..tmp
  %rcc.tmp.85 = icmp eq i32 %rcc.tmp.84, 2
  br i1 %rcc.tmp.85, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.87 = getelementptr %Matrix, ptr %matrix, i32 0, i32 0
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %j
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [100 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = load i32, ptr %cols..tmp
  %rcc.tmp.96 = mul i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %j
  %rcc.tmp.98 = add i32 %rcc.tmp.96, %rcc.tmp.97
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %rcc.tmp.93
  br label %if.merge.4
if.else.4:
  %rcc.tmp.102 = getelementptr %Matrix, ptr %matrix, i32 0, i32 0
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 0
  %rcc.tmp.105 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.102, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [100 x i32], ptr %rcc.tmp.105, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = mul i32 %rcc.tmp.109, %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %j
  %rcc.tmp.113 = load i32, ptr %j
  %rcc.tmp.114 = mul i32 %rcc.tmp.112, %rcc.tmp.113
  %rcc.tmp.115 = add i32 %rcc.tmp.111, %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = load i32, ptr %j
  %rcc.tmp.118 = mul i32 %rcc.tmp.116, %rcc.tmp.117
  %rcc.tmp.119 = add i32 %rcc.tmp.115, %rcc.tmp.118
  %rcc.tmp.120 = srem i32 %rcc.tmp.119, 50
  store i32 %rcc.tmp.120, ptr %rcc.tmp.108
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.125 = load i32, ptr %j
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 1
  store i32 %rcc.tmp.126, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.133 = bitcast %Matrix* %ret.slot to i8*
  %rcc.tmp.134 = bitcast %Matrix* %matrix to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.133, i8* %rcc.tmp.134, i32 40008, i1 0)
  ret void
}
define i1 @matrix_multiply.(%Matrix* %a.tmp, %Matrix* %b.tmp, %Matrix* %result.tmp) {
entry:
  %a..tmp = alloca %Matrix* 
  %b..tmp = alloca %Matrix* 
  %result..tmp = alloca %Matrix* 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store %Matrix* %a.tmp, ptr %a..tmp
  store %Matrix* %b.tmp, ptr %b..tmp
  store %Matrix* %result.tmp, ptr %result..tmp
  %rcc.tmp.4 = load %Matrix*, ptr %a..tmp
  %rcc.tmp.5 = getelementptr %Matrix, ptr %rcc.tmp.4, i32 0, i32 2
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = load %Matrix*, ptr %b..tmp
  %rcc.tmp.8 = getelementptr %Matrix, ptr %rcc.tmp.7, i32 0, i32 1
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp ne i32 %rcc.tmp.6, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load %Matrix*, ptr %result..tmp
  %rcc.tmp.15 = getelementptr %Matrix, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = load %Matrix*, ptr %a..tmp
  %rcc.tmp.17 = getelementptr %Matrix, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %rcc.tmp.15
  %rcc.tmp.20 = load %Matrix*, ptr %result..tmp
  %rcc.tmp.21 = getelementptr %Matrix, ptr %rcc.tmp.20, i32 0, i32 2
  %rcc.tmp.22 = load %Matrix*, ptr %b..tmp
  %rcc.tmp.23 = getelementptr %Matrix, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %rcc.tmp.21
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = load %Matrix*, ptr %a..tmp
  %rcc.tmp.30 = getelementptr %Matrix, ptr %rcc.tmp.29, i32 0, i32 1
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.28, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = load %Matrix*, ptr %b..tmp
  %rcc.tmp.39 = getelementptr %Matrix, ptr %rcc.tmp.38, i32 0, i32 2
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.44 = load %Matrix*, ptr %result..tmp
  %rcc.tmp.45 = getelementptr %Matrix, ptr %rcc.tmp.44, i32 0, i32 0
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %j
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [100 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.51
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.55 = load i32, ptr %k
  %rcc.tmp.56 = load %Matrix*, ptr %a..tmp
  %rcc.tmp.57 = getelementptr %Matrix, ptr %rcc.tmp.56, i32 0, i32 2
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.55, %rcc.tmp.58
  br i1 %rcc.tmp.59, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.62 = load %Matrix*, ptr %result..tmp
  %rcc.tmp.63 = getelementptr %Matrix, ptr %rcc.tmp.62, i32 0, i32 0
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %j
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [100 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load %Matrix*, ptr %result..tmp
  %rcc.tmp.71 = getelementptr %Matrix, ptr %rcc.tmp.70, i32 0, i32 0
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [100 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = load %Matrix*, ptr %a..tmp
  %rcc.tmp.80 = getelementptr %Matrix, ptr %rcc.tmp.79, i32 0, i32 0
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %k
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [100 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  %rcc.tmp.88 = load %Matrix*, ptr %b..tmp
  %rcc.tmp.89 = getelementptr %Matrix, ptr %rcc.tmp.88, i32 0, i32 0
  %rcc.tmp.90 = load i32, ptr %k
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %j
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [100 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = mul i32 %rcc.tmp.87, %rcc.tmp.96
  %rcc.tmp.98 = add i32 %rcc.tmp.78, %rcc.tmp.97
  store i32 %rcc.tmp.98, ptr %rcc.tmp.69
  %rcc.tmp.100 = load i32, ptr %k
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.104 = load i32, ptr %j
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 1
  store i32 %rcc.tmp.105, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define void @copy_array.([10000 x i32]* %source.tmp, [10000 x i32]* %dest.tmp, i32 %size.tmp) {
entry:
  %source..tmp = alloca [10000 x i32]* 
  %dest..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [10000 x i32]* %source.tmp, ptr %source..tmp
  store [10000 x i32]* %dest.tmp, ptr %dest..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [10000 x i32]*, ptr %dest..tmp
  %rcc.tmp.14 = getelementptr [10000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [10000 x i32]*, ptr %source..tmp
  %rcc.tmp.18 = getelementptr [10000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.14
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i1 @is_sorted.([10000 x i32]* %data.tmp, i32 %size.tmp) {
entry:
  %data..tmp = alloca [10000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [10000 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.6, 1
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.14 = getelementptr [10000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [10000 x i32]*, ptr %data..tmp
  %rcc.tmp.20 = getelementptr [10000 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.15, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
define void @test_large_scale_performance.() {
entry:
  %test_sizes = alloca [4 x i32] 
  %size_idx = alloca i32 
  %size = alloca i32 
  %pattern = alloca i32 
  %original_data = alloca %DataSet 
  %working_data = alloca [10000 x i32] 
  %fill.idx = alloca i32 
  %bubble_counter = alloca %PerformanceCounter 
  %quick_counter = alloca %PerformanceCounter 
  %merge_counter = alloca %PerformanceCounter 
  %search_data = alloca %DataSet 
  %sorted_data = alloca [10000 x i32] 
  %fill.idx.2 = alloca i32 
  %sort_counter = alloca %PerformanceCounter 
  %search_hits = alloca i32 
  %linear_ops = alloca i32 
  %binary_ops = alloca i32 
  %i = alloca i32 
  %target = alloca i32 
  %linear_counter = alloca %PerformanceCounter 
  %linear_result = alloca i32 
  %binary_counter = alloca %PerformanceCounter 
  %binary_result = alloca i32 
  %stats_data = alloca %DataSet 
  %variance = alloca i32 
  %median_data = alloca [10000 x i32] 
  %fill.idx.3 = alloca i32 
  %median = alloca i32 
  %matrix_a = alloca %Matrix 
  %matrix_b = alloca %Matrix 
  %result_matrix = alloca %Matrix 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %matrix_sum = alloca i32 
  %i.2 = alloca i32 
  %j = alloca i32 
  %access_counter = alloca %PerformanceCounter 
  %sequential_sum = alloca i32 
  %random_sum = alloca i32 
  %index = alloca i32 
  %strided_sum = alloca i32 
  %index.2 = alloca i32 
  %same_data = alloca [10000 x i32] 
  %fill.idx.6 = alloca i32 
  %same_counter = alloca %PerformanceCounter 
  %alternating_data = alloca [10000 x i32] 
  %fill.idx.7 = alloca i32 
  %alt_counter = alloca %PerformanceCounter 
  %single_data = alloca [10000 x i32] 
  %fill.idx.8 = alloca i32 
  %single_counter = alloca %PerformanceCounter 
  call void @printlnInt.(i32 21001)
  %rcc.tmp.2 = getelementptr [4 x i32], ptr %test_sizes, i32 0, i32 0
  store i32 100, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [4 x i32], ptr %test_sizes, i32 0, i32 1
  store i32 500, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [4 x i32], ptr %test_sizes, i32 0, i32 2
  store i32 1000, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [4 x i32], ptr %test_sizes, i32 0, i32 3
  store i32 2000, ptr %rcc.tmp.8
  store i32 0, ptr %size_idx
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %size_idx
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 4
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %size_idx
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [4 x i32], ptr %test_sizes, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %size
  %rcc.tmp.21 = load i32, ptr %size_idx
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 100
  %rcc.tmp.23 = add i32 21000, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 10
  call void @printlnInt.(i32 %rcc.tmp.24)
  store i32 0, ptr %pattern
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.28 = load i32, ptr %pattern
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 8
  br i1 %rcc.tmp.29, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.32 = load i32, ptr %pattern
  %rcc.tmp.33 = load i32, ptr %size
  call void @init_dataset_pattern.(%DataSet* %original_data, i32 %rcc.tmp.32, i32 %rcc.tmp.33)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.37 = load i32, ptr %fill.idx
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 10000
  br i1 %rcc.tmp.38, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.40 = load i32, ptr %fill.idx
  %rcc.tmp.41 = getelementptr [10000 x i32], ptr %working_data, i32 0, i32 %rcc.tmp.40
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.43, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.46 = getelementptr %DataSet, ptr %original_data, i32 0, i32 0
  %rcc.tmp.47 = load i32, ptr %size
  call void @copy_array.([10000 x i32]* %rcc.tmp.46, [10000 x i32]* %working_data, i32 %rcc.tmp.47)
  call void @init_performance_counter.(%PerformanceCounter* %bubble_counter)
  %rcc.tmp.50 = load i32, ptr %size
  call void @bubble_sort.([10000 x i32]* %working_data, i32 %rcc.tmp.50, %PerformanceCounter* %bubble_counter)
  %rcc.tmp.52 = load i32, ptr %size
  %rcc.tmp.53 = call i1 @is_sorted.([10000 x i32]* %working_data, i32 %rcc.tmp.52)
  %rcc.tmp.54 = xor i1 %rcc.tmp.53, true
  br i1 %rcc.tmp.54, label %if.then, label %if.else
if.then:
  call void @printlnInt.(i32 21901)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.59 = getelementptr %DataSet, ptr %original_data, i32 0, i32 0
  %rcc.tmp.60 = load i32, ptr %size
  call void @copy_array.([10000 x i32]* %rcc.tmp.59, [10000 x i32]* %working_data, i32 %rcc.tmp.60)
  call void @init_performance_counter.(%PerformanceCounter* %quick_counter)
  %rcc.tmp.63 = load i32, ptr %size
  call void @quick_sort.([10000 x i32]* %working_data, i32 %rcc.tmp.63, %PerformanceCounter* %quick_counter)
  %rcc.tmp.65 = load i32, ptr %size
  %rcc.tmp.66 = call i1 @is_sorted.([10000 x i32]* %working_data, i32 %rcc.tmp.65)
  %rcc.tmp.67 = xor i1 %rcc.tmp.66, true
  br i1 %rcc.tmp.67, label %if.then.2, label %if.else.2
if.then.2:
  call void @printlnInt.(i32 21902)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.72 = getelementptr %DataSet, ptr %original_data, i32 0, i32 0
  %rcc.tmp.73 = load i32, ptr %size
  call void @copy_array.([10000 x i32]* %rcc.tmp.72, [10000 x i32]* %working_data, i32 %rcc.tmp.73)
  call void @init_performance_counter.(%PerformanceCounter* %merge_counter)
  %rcc.tmp.76 = load i32, ptr %size
  call void @merge_sort.([10000 x i32]* %working_data, i32 %rcc.tmp.76, %PerformanceCounter* %merge_counter)
  %rcc.tmp.78 = load i32, ptr %size
  %rcc.tmp.79 = call i1 @is_sorted.([10000 x i32]* %working_data, i32 %rcc.tmp.78)
  %rcc.tmp.80 = xor i1 %rcc.tmp.79, true
  br i1 %rcc.tmp.80, label %if.then.3, label %if.else.3
if.then.3:
  call void @printlnInt.(i32 21903)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.85 = getelementptr %PerformanceCounter, ptr %bubble_counter, i32 0, i32 1
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = sdiv i32 %rcc.tmp.86, 100
  call void @printlnInt.(i32 %rcc.tmp.87)
  %rcc.tmp.89 = getelementptr %PerformanceCounter, ptr %quick_counter, i32 0, i32 1
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = sdiv i32 %rcc.tmp.90, 100
  call void @printlnInt.(i32 %rcc.tmp.91)
  %rcc.tmp.93 = getelementptr %PerformanceCounter, ptr %merge_counter, i32 0, i32 1
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = sdiv i32 %rcc.tmp.94, 100
  call void @printlnInt.(i32 %rcc.tmp.95)
  %rcc.tmp.97 = load i32, ptr %pattern
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  store i32 %rcc.tmp.98, ptr %pattern
  br label %while.cond.2
while.end.2:
  %rcc.tmp.101 = load i32, ptr %size_idx
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %size_idx
  br label %while.cond
while.end:
  call void @init_dataset_pattern.(%DataSet* %search_data, i32 0, i32 5000)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.108 = load i32, ptr %fill.idx.2
  %rcc.tmp.109 = icmp slt i32 %rcc.tmp.108, 10000
  br i1 %rcc.tmp.109, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.111 = load i32, ptr %fill.idx.2
  %rcc.tmp.112 = getelementptr [10000 x i32], ptr %sorted_data, i32 0, i32 %rcc.tmp.111
  store i32 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.114, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.117 = getelementptr %DataSet, ptr %search_data, i32 0, i32 0
  call void @copy_array.([10000 x i32]* %rcc.tmp.117, [10000 x i32]* %sorted_data, i32 5000)
  call void @init_performance_counter.(%PerformanceCounter* %sort_counter)
  call void @quick_sort.([10000 x i32]* %sorted_data, i32 5000, %PerformanceCounter* %sort_counter)
  store i32 0, ptr %search_hits
  store i32 0, ptr %linear_ops
  store i32 0, ptr %binary_ops
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.126 = load i32, ptr %i
  %rcc.tmp.127 = icmp slt i32 %rcc.tmp.126, 1000
  br i1 %rcc.tmp.127, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = mul i32 %rcc.tmp.130, 73
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 29
  %rcc.tmp.133 = srem i32 %rcc.tmp.132, 100000
  store i32 %rcc.tmp.133, ptr %target
  call void @init_performance_counter.(%PerformanceCounter* %linear_counter)
  %rcc.tmp.136 = getelementptr %DataSet, ptr %search_data, i32 0, i32 0
  %rcc.tmp.137 = load i32, ptr %target
  %rcc.tmp.138 = call i32 @linear_search.([10000 x i32]* %rcc.tmp.136, i32 5000, i32 %rcc.tmp.137, %PerformanceCounter* %linear_counter)
  store i32 %rcc.tmp.138, ptr %linear_result
  call void @init_performance_counter.(%PerformanceCounter* %binary_counter)
  %rcc.tmp.141 = load i32, ptr %target
  %rcc.tmp.142 = call i32 @binary_search.([10000 x i32]* %sorted_data, i32 5000, i32 %rcc.tmp.141, %PerformanceCounter* %binary_counter)
  store i32 %rcc.tmp.142, ptr %binary_result
  %rcc.tmp.144 = load i32, ptr %linear_result
  %rcc.tmp.145 = sub i32 0, 1
  %rcc.tmp.146 = icmp ne i32 %rcc.tmp.144, %rcc.tmp.145
  br i1 %rcc.tmp.146, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.148 = load i32, ptr %binary_result
  %rcc.tmp.149 = sub i32 0, 1
  %rcc.tmp.150 = icmp ne i32 %rcc.tmp.148, %rcc.tmp.149
  br label %sc.merge
sc.merge:
  %rcc.tmp.152 = phi i1 [0, %while.body.3], [%rcc.tmp.150, %and.rhs]
  br i1 %rcc.tmp.152, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.154 = load i32, ptr %search_hits
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %search_hits
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.159 = load i32, ptr %linear_ops
  %rcc.tmp.160 = getelementptr %PerformanceCounter, ptr %linear_counter, i32 0, i32 0
  %rcc.tmp.161 = load i32, ptr %rcc.tmp.160
  %rcc.tmp.162 = add i32 %rcc.tmp.159, %rcc.tmp.161
  store i32 %rcc.tmp.162, ptr %linear_ops
  %rcc.tmp.164 = load i32, ptr %binary_ops
  %rcc.tmp.165 = getelementptr %PerformanceCounter, ptr %binary_counter, i32 0, i32 0
  %rcc.tmp.166 = load i32, ptr %rcc.tmp.165
  %rcc.tmp.167 = add i32 %rcc.tmp.164, %rcc.tmp.166
  store i32 %rcc.tmp.167, ptr %binary_ops
  %rcc.tmp.169 = load i32, ptr %i
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.173 = load i32, ptr %search_hits
  call void @printlnInt.(i32 %rcc.tmp.173)
  %rcc.tmp.175 = load i32, ptr %linear_ops
  %rcc.tmp.176 = sdiv i32 %rcc.tmp.175, 1000
  call void @printlnInt.(i32 %rcc.tmp.176)
  %rcc.tmp.178 = load i32, ptr %binary_ops
  %rcc.tmp.179 = sdiv i32 %rcc.tmp.178, 1000
  call void @printlnInt.(i32 %rcc.tmp.179)
  call void @init_dataset_pattern.(%DataSet* %stats_data, i32 1, i32 300)
  %rcc.tmp.182 = getelementptr %DataSet, ptr %stats_data, i32 0, i32 0
  %rcc.tmp.183 = getelementptr %DataSet, ptr %stats_data, i32 0, i32 6
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.183
  %rcc.tmp.185 = call i32 @compute_variance.([10000 x i32]* %rcc.tmp.182, i32 300, i32 %rcc.tmp.184)
  store i32 %rcc.tmp.185, ptr %variance
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.189 = load i32, ptr %fill.idx.3
  %rcc.tmp.190 = icmp slt i32 %rcc.tmp.189, 10000
  br i1 %rcc.tmp.190, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.192 = load i32, ptr %fill.idx.3
  %rcc.tmp.193 = getelementptr [10000 x i32], ptr %median_data, i32 0, i32 %rcc.tmp.192
  store i32 0, ptr %rcc.tmp.193
  %rcc.tmp.195 = add i32 %rcc.tmp.192, 1
  store i32 %rcc.tmp.195, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.198 = getelementptr %DataSet, ptr %stats_data, i32 0, i32 0
  call void @copy_array.([10000 x i32]* %rcc.tmp.198, [10000 x i32]* %median_data, i32 300)
  %rcc.tmp.200 = call i32 @compute_median.([10000 x i32]* %median_data, i32 300)
  store i32 %rcc.tmp.200, ptr %median
  %rcc.tmp.202 = getelementptr %DataSet, ptr %stats_data, i32 0, i32 6
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.202
  call void @printlnInt.(i32 %rcc.tmp.203)
  %rcc.tmp.205 = load i32, ptr %variance
  %rcc.tmp.206 = sdiv i32 %rcc.tmp.205, 1000
  call void @printlnInt.(i32 %rcc.tmp.206)
  %rcc.tmp.208 = load i32, ptr %median
  call void @printlnInt.(i32 %rcc.tmp.208)
  call void @init_matrix.(%Matrix* %matrix_a, i32 50, i32 50, i32 1)
  call void @init_matrix.(%Matrix* %matrix_b, i32 50, i32 50, i32 2)
  %rcc.tmp.212 = getelementptr %Matrix, ptr %result_matrix, i32 0, i32 0
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.215 = load i32, ptr %fill.idx.4
  %rcc.tmp.216 = icmp slt i32 %rcc.tmp.215, 100
  br i1 %rcc.tmp.216, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.218 = load i32, ptr %fill.idx.4
  %rcc.tmp.219 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.212, i32 0, i32 %rcc.tmp.218
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.222 = load i32, ptr %fill.idx.5
  %rcc.tmp.223 = icmp slt i32 %rcc.tmp.222, 100
  br i1 %rcc.tmp.223, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.225 = load i32, ptr %fill.idx.5
  %rcc.tmp.226 = getelementptr [100 x i32], ptr %rcc.tmp.219, i32 0, i32 %rcc.tmp.225
  store i32 0, ptr %rcc.tmp.226
  %rcc.tmp.228 = add i32 %rcc.tmp.225, 1
  store i32 %rcc.tmp.228, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.231 = add i32 %rcc.tmp.218, 1
  store i32 %rcc.tmp.231, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.234 = getelementptr %Matrix, ptr %result_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.234
  %rcc.tmp.236 = getelementptr %Matrix, ptr %result_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.236
  %rcc.tmp.238 = call i1 @matrix_multiply.(%Matrix* %matrix_a, %Matrix* %matrix_b, %Matrix* %result_matrix)
  br i1 %rcc.tmp.238, label %if.then.5, label %if.else.5
if.then.5:
  store i32 0, ptr %matrix_sum
  store i32 0, ptr %i.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.243 = load i32, ptr %i.2
  %rcc.tmp.244 = icmp slt i32 %rcc.tmp.243, 50
  br i1 %rcc.tmp.244, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %j
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.249 = load i32, ptr %j
  %rcc.tmp.250 = icmp slt i32 %rcc.tmp.249, 50
  br i1 %rcc.tmp.250, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.253 = load i32, ptr %matrix_sum
  %rcc.tmp.254 = getelementptr %Matrix, ptr %result_matrix, i32 0, i32 0
  %rcc.tmp.255 = load i32, ptr %i.2
  %rcc.tmp.256 = add i32 %rcc.tmp.255, 0
  %rcc.tmp.257 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.254, i32 0, i32 %rcc.tmp.256
  %rcc.tmp.258 = load i32, ptr %j
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 0
  %rcc.tmp.260 = getelementptr [100 x i32], ptr %rcc.tmp.257, i32 0, i32 %rcc.tmp.259
  %rcc.tmp.261 = load i32, ptr %rcc.tmp.260
  %rcc.tmp.262 = add i32 %rcc.tmp.253, %rcc.tmp.261
  %rcc.tmp.263 = and i32 %rcc.tmp.262, 1000000000
  store i32 %rcc.tmp.263, ptr %matrix_sum
  %rcc.tmp.265 = load i32, ptr %j
  %rcc.tmp.266 = add i32 %rcc.tmp.265, 1
  store i32 %rcc.tmp.266, ptr %j
  br label %while.cond.5
while.end.5:
  %rcc.tmp.269 = load i32, ptr %i.2
  %rcc.tmp.270 = add i32 %rcc.tmp.269, 1
  store i32 %rcc.tmp.270, ptr %i.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.273 = load i32, ptr %matrix_sum
  %rcc.tmp.274 = srem i32 %rcc.tmp.273, 1000000000
  call void @printlnInt.(i32 %rcc.tmp.274)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  call void @init_performance_counter.(%PerformanceCounter* %access_counter)
  store i32 0, ptr %sequential_sum
  store i32 0, ptr %i
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.282 = load i32, ptr %i
  %rcc.tmp.283 = icmp slt i32 %rcc.tmp.282, 5000
  br i1 %rcc.tmp.283, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.286 = load i32, ptr %sequential_sum
  %rcc.tmp.287 = getelementptr %DataSet, ptr %search_data, i32 0, i32 0
  %rcc.tmp.288 = load i32, ptr %i
  %rcc.tmp.289 = add i32 %rcc.tmp.288, 0
  %rcc.tmp.290 = getelementptr [10000 x i32], ptr %rcc.tmp.287, i32 0, i32 %rcc.tmp.289
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.290
  %rcc.tmp.292 = add i32 %rcc.tmp.286, %rcc.tmp.291
  store i32 %rcc.tmp.292, ptr %sequential_sum
  %rcc.tmp.294 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.295 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.296 = load i32, ptr %rcc.tmp.295
  %rcc.tmp.297 = add i32 %rcc.tmp.296, 1
  store i32 %rcc.tmp.297, ptr %rcc.tmp.294
  %rcc.tmp.299 = load i32, ptr %i
  %rcc.tmp.300 = add i32 %rcc.tmp.299, 1
  store i32 %rcc.tmp.300, ptr %i
  br label %while.cond.6
while.end.6:
  store i32 0, ptr %random_sum
  store i32 0, ptr %i
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.306 = load i32, ptr %i
  %rcc.tmp.307 = icmp slt i32 %rcc.tmp.306, 5000
  br i1 %rcc.tmp.307, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.310 = load i32, ptr %i
  %rcc.tmp.311 = mul i32 %rcc.tmp.310, 11241
  %rcc.tmp.312 = add i32 %rcc.tmp.311, 12345
  %rcc.tmp.313 = srem i32 %rcc.tmp.312, 5000
  store i32 %rcc.tmp.313, ptr %index
  %rcc.tmp.315 = load i32, ptr %random_sum
  %rcc.tmp.316 = getelementptr %DataSet, ptr %search_data, i32 0, i32 0
  %rcc.tmp.317 = load i32, ptr %index
  %rcc.tmp.318 = add i32 %rcc.tmp.317, 0
  %rcc.tmp.319 = getelementptr [10000 x i32], ptr %rcc.tmp.316, i32 0, i32 %rcc.tmp.318
  %rcc.tmp.320 = load i32, ptr %rcc.tmp.319
  %rcc.tmp.321 = add i32 %rcc.tmp.315, %rcc.tmp.320
  store i32 %rcc.tmp.321, ptr %random_sum
  %rcc.tmp.323 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.324 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.325 = load i32, ptr %rcc.tmp.324
  %rcc.tmp.326 = add i32 %rcc.tmp.325, 1
  store i32 %rcc.tmp.326, ptr %rcc.tmp.323
  %rcc.tmp.328 = load i32, ptr %i
  %rcc.tmp.329 = add i32 %rcc.tmp.328, 1
  store i32 %rcc.tmp.329, ptr %i
  br label %while.cond.7
while.end.7:
  store i32 0, ptr %strided_sum
  store i32 0, ptr %i
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.335 = load i32, ptr %i
  %rcc.tmp.336 = icmp slt i32 %rcc.tmp.335, 1000
  br i1 %rcc.tmp.336, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.339 = load i32, ptr %i
  %rcc.tmp.340 = mul i32 %rcc.tmp.339, 5
  %rcc.tmp.341 = srem i32 %rcc.tmp.340, 5000
  store i32 %rcc.tmp.341, ptr %index.2
  %rcc.tmp.343 = load i32, ptr %strided_sum
  %rcc.tmp.344 = getelementptr %DataSet, ptr %search_data, i32 0, i32 0
  %rcc.tmp.345 = load i32, ptr %index.2
  %rcc.tmp.346 = add i32 %rcc.tmp.345, 0
  %rcc.tmp.347 = getelementptr [10000 x i32], ptr %rcc.tmp.344, i32 0, i32 %rcc.tmp.346
  %rcc.tmp.348 = load i32, ptr %rcc.tmp.347
  %rcc.tmp.349 = add i32 %rcc.tmp.343, %rcc.tmp.348
  store i32 %rcc.tmp.349, ptr %strided_sum
  %rcc.tmp.351 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.352 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.353 = load i32, ptr %rcc.tmp.352
  %rcc.tmp.354 = add i32 %rcc.tmp.353, 1
  store i32 %rcc.tmp.354, ptr %rcc.tmp.351
  %rcc.tmp.356 = load i32, ptr %i
  %rcc.tmp.357 = add i32 %rcc.tmp.356, 1
  store i32 %rcc.tmp.357, ptr %i
  br label %while.cond.8
while.end.8:
  %rcc.tmp.360 = load i32, ptr %sequential_sum
  %rcc.tmp.361 = sdiv i32 %rcc.tmp.360, 1000
  call void @printlnInt.(i32 %rcc.tmp.361)
  %rcc.tmp.363 = load i32, ptr %random_sum
  %rcc.tmp.364 = sdiv i32 %rcc.tmp.363, 1000
  call void @printlnInt.(i32 %rcc.tmp.364)
  %rcc.tmp.366 = load i32, ptr %strided_sum
  %rcc.tmp.367 = sdiv i32 %rcc.tmp.366, 100
  call void @printlnInt.(i32 %rcc.tmp.367)
  %rcc.tmp.369 = getelementptr %PerformanceCounter, ptr %access_counter, i32 0, i32 3
  %rcc.tmp.370 = load i32, ptr %rcc.tmp.369
  %rcc.tmp.371 = sdiv i32 %rcc.tmp.370, 1000
  call void @printlnInt.(i32 %rcc.tmp.371)
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.375 = load i32, ptr %fill.idx.6
  %rcc.tmp.376 = icmp slt i32 %rcc.tmp.375, 10000
  br i1 %rcc.tmp.376, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.378 = load i32, ptr %fill.idx.6
  %rcc.tmp.379 = getelementptr [10000 x i32], ptr %same_data, i32 0, i32 %rcc.tmp.378
  store i32 42, ptr %rcc.tmp.379
  %rcc.tmp.381 = add i32 %rcc.tmp.378, 1
  store i32 %rcc.tmp.381, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  call void @init_performance_counter.(%PerformanceCounter* %same_counter)
  call void @quick_sort.([10000 x i32]* %same_data, i32 1000, %PerformanceCounter* %same_counter)
  %rcc.tmp.386 = getelementptr %PerformanceCounter, ptr %same_counter, i32 0, i32 1
  %rcc.tmp.387 = load i32, ptr %rcc.tmp.386
  %rcc.tmp.388 = sdiv i32 %rcc.tmp.387, 100
  call void @printlnInt.(i32 %rcc.tmp.388)
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.392 = load i32, ptr %fill.idx.7
  %rcc.tmp.393 = icmp slt i32 %rcc.tmp.392, 10000
  br i1 %rcc.tmp.393, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.395 = load i32, ptr %fill.idx.7
  %rcc.tmp.396 = getelementptr [10000 x i32], ptr %alternating_data, i32 0, i32 %rcc.tmp.395
  store i32 0, ptr %rcc.tmp.396
  %rcc.tmp.398 = add i32 %rcc.tmp.395, 1
  store i32 %rcc.tmp.398, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %i
  br label %while.cond.9
while.cond.9:
  %rcc.tmp.403 = load i32, ptr %i
  %rcc.tmp.404 = icmp slt i32 %rcc.tmp.403, 1000
  br i1 %rcc.tmp.404, label %while.body.9, label %while.linker.9
while.linker.9:
  br label %while.end.9
while.body.9:
  %rcc.tmp.407 = load i32, ptr %i
  %rcc.tmp.408 = add i32 %rcc.tmp.407, 0
  %rcc.tmp.409 = getelementptr [10000 x i32], ptr %alternating_data, i32 0, i32 %rcc.tmp.408
  %rcc.tmp.410 = load i32, ptr %i
  %rcc.tmp.411 = srem i32 %rcc.tmp.410, 2
  %rcc.tmp.412 = icmp eq i32 %rcc.tmp.411, 0
  br i1 %rcc.tmp.412, label %if.then.6, label %if.else.6
if.then.6:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.416 = phi i32 [1, %if.then.6], [2, %if.else.6]
  store i32 %rcc.tmp.416, ptr %rcc.tmp.409
  %rcc.tmp.418 = load i32, ptr %i
  %rcc.tmp.419 = add i32 %rcc.tmp.418, 1
  store i32 %rcc.tmp.419, ptr %i
  br label %while.cond.9
while.end.9:
  call void @init_performance_counter.(%PerformanceCounter* %alt_counter)
  call void @merge_sort.([10000 x i32]* %alternating_data, i32 1000, %PerformanceCounter* %alt_counter)
  %rcc.tmp.424 = getelementptr %PerformanceCounter, ptr %alt_counter, i32 0, i32 1
  %rcc.tmp.425 = load i32, ptr %rcc.tmp.424
  %rcc.tmp.426 = sdiv i32 %rcc.tmp.425, 100
  call void @printlnInt.(i32 %rcc.tmp.426)
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.430 = load i32, ptr %fill.idx.8
  %rcc.tmp.431 = icmp slt i32 %rcc.tmp.430, 10000
  br i1 %rcc.tmp.431, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.433 = load i32, ptr %fill.idx.8
  %rcc.tmp.434 = getelementptr [10000 x i32], ptr %single_data, i32 0, i32 %rcc.tmp.433
  store i32 0, ptr %rcc.tmp.434
  %rcc.tmp.436 = add i32 %rcc.tmp.433, 1
  store i32 %rcc.tmp.436, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  %rcc.tmp.439 = getelementptr [10000 x i32], ptr %single_data, i32 0, i32 0
  store i32 123, ptr %rcc.tmp.439
  call void @init_performance_counter.(%PerformanceCounter* %single_counter)
  call void @heap_sort.([10000 x i32]* %single_data, i32 1, %PerformanceCounter* %single_counter)
  %rcc.tmp.443 = getelementptr [10000 x i32], ptr %single_data, i32 0, i32 0
  %rcc.tmp.444 = load i32, ptr %rcc.tmp.443
  call void @printlnInt.(i32 %rcc.tmp.444)
  call void @printlnInt.(i32 21999)
  ret void
}
define void @main() {
entry:
  call void @test_large_scale_performance.()
  call void @exit.(i32 0)
  ret void
}
