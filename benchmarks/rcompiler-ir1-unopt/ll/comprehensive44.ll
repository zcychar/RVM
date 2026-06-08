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
%Agent = type {i32, i32, i32, i32, i32, i32, i32}
define void @init_world.([64 x [64 x i32]]* %world.tmp, [32 x %Agent]* %agents.tmp) {
entry:
  %world..tmp = alloca [64 x [64 x i32]]* 
  %agents..tmp = alloca [32 x %Agent]* 
  %i = alloca i32 
  %j = alloca i32 
  store [64 x [64 x i32]]* %world.tmp, ptr %world..tmp
  store [32 x %Agent]* %agents.tmp, ptr %agents..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 64
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %j
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 64
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.18 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %j
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [64 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = mul i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 100
  store i32 %rcc.tmp.29, ptr %rcc.tmp.21
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
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 32
  br i1 %rcc.tmp.42, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [32 x %Agent]*, ptr %agents..tmp
  %rcc.tmp.48 = getelementptr [32 x %Agent], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = getelementptr %Agent, ptr %rcc.tmp.48, i32 0, i32 0
  %rcc.tmp.50 = load i32, ptr %i
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [32 x %Agent]*, ptr %agents..tmp
  %rcc.tmp.55 = getelementptr [32 x %Agent], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = getelementptr %Agent, ptr %rcc.tmp.55, i32 0, i32 1
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = mul i32 %rcc.tmp.57, 13
  %rcc.tmp.59 = srem i32 %rcc.tmp.58, 64
  store i32 %rcc.tmp.59, ptr %rcc.tmp.56
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = load [32 x %Agent]*, ptr %agents..tmp
  %rcc.tmp.64 = getelementptr [32 x %Agent], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.65 = getelementptr %Agent, ptr %rcc.tmp.64, i32 0, i32 2
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = mul i32 %rcc.tmp.66, 31
  %rcc.tmp.68 = srem i32 %rcc.tmp.67, 64
  store i32 %rcc.tmp.68, ptr %rcc.tmp.65
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [32 x %Agent]*, ptr %agents..tmp
  %rcc.tmp.73 = getelementptr [32 x %Agent], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = getelementptr %Agent, ptr %rcc.tmp.73, i32 0, i32 3
  store i32 100, ptr %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = load [32 x %Agent]*, ptr %agents..tmp
  %rcc.tmp.79 = getelementptr [32 x %Agent], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = getelementptr %Agent, ptr %rcc.tmp.79, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define i32 @find_new_target.(%Agent* %agent.tmp, [64 x [64 x i32]]* %world.tmp) {
entry:
  %agent..tmp = alloca %Agent* 
  %world..tmp = alloca [64 x [64 x i32]]* 
  %best_x = alloca i32 
  %best_y = alloca i32 
  %max_res = alloca i32 
  %dx = alloca i32 
  %dy = alloca i32 
  %nx = alloca i32 
  %ny = alloca i32 
  store %Agent* %agent.tmp, ptr %agent..tmp
  store [64 x [64 x i32]]* %world.tmp, ptr %world..tmp
  %rcc.tmp.3 = sub i32 0, 1
  store i32 %rcc.tmp.3, ptr %best_x
  %rcc.tmp.5 = sub i32 0, 1
  store i32 %rcc.tmp.5, ptr %best_y
  %rcc.tmp.7 = sub i32 0, 1
  store i32 %rcc.tmp.7, ptr %max_res
  %rcc.tmp.9 = sub i32 0, 5
  store i32 %rcc.tmp.9, ptr %dx
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %dx
  %rcc.tmp.13 = icmp sle i32 %rcc.tmp.12, 5
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = sub i32 0, 5
  store i32 %rcc.tmp.16, ptr %dy
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.19 = load i32, ptr %dy
  %rcc.tmp.20 = icmp sle i32 %rcc.tmp.19, 5
  br i1 %rcc.tmp.20, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.23 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.24 = getelementptr %Agent, ptr %rcc.tmp.23, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %dx
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 64
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 64
  store i32 %rcc.tmp.29, ptr %nx
  %rcc.tmp.31 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.32 = getelementptr %Agent, ptr %rcc.tmp.31, i32 0, i32 2
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %dy
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 64
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 64
  store i32 %rcc.tmp.37, ptr %ny
  %rcc.tmp.39 = load i32, ptr %nx
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.42 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %ny
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [64 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %max_res
  %rcc.tmp.48 = icmp sgt i32 %rcc.tmp.46, %rcc.tmp.47
  br i1 %rcc.tmp.48, label %if.then, label %if.else
if.then:
  %rcc.tmp.50 = load i32, ptr %nx
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.53 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.52, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.54 = load i32, ptr %ny
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [64 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %max_res
  %rcc.tmp.59 = load i32, ptr %nx
  store i32 %rcc.tmp.59, ptr %best_x
  %rcc.tmp.61 = load i32, ptr %ny
  store i32 %rcc.tmp.61, ptr %best_y
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.65 = load i32, ptr %dy
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %dy
  br label %while.cond.2
while.end.2:
  %rcc.tmp.69 = load i32, ptr %dx
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %dx
  br label %while.cond
while.end:
  %rcc.tmp.73 = load i32, ptr %best_x
  %rcc.tmp.74 = mul i32 %rcc.tmp.73, 1000
  %rcc.tmp.75 = load i32, ptr %best_y
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  ret i32 %rcc.tmp.76
}
define void @update_agent.(%Agent* %agent.tmp, [64 x [64 x i32]]* %world.tmp) {
entry:
  %agent..tmp = alloca %Agent* 
  %world..tmp = alloca [64 x [64 x i32]]* 
  %target = alloca i32 
  %res = alloca i32 
  store %Agent* %agent.tmp, ptr %agent..tmp
  store [64 x [64 x i32]]* %world.tmp, ptr %world..tmp
  %rcc.tmp.3 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.4 = getelementptr %Agent, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = icmp sle i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.11 = getelementptr %Agent, ptr %rcc.tmp.10, i32 0, i32 3
  %rcc.tmp.12 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.13 = getelementptr %Agent, ptr %rcc.tmp.12, i32 0, i32 3
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = sub i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %rcc.tmp.11
  %rcc.tmp.17 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.18 = getelementptr %Agent, ptr %rcc.tmp.17, i32 0, i32 6
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 0
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.22 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.23 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.24 = call i32 @find_new_target.(%Agent* %rcc.tmp.22, [64 x [64 x i32]]* %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %target
  %rcc.tmp.26 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.27 = getelementptr %Agent, ptr %rcc.tmp.26, i32 0, i32 4
  %rcc.tmp.28 = load i32, ptr %target
  %rcc.tmp.29 = sdiv i32 %rcc.tmp.28, 1000
  store i32 %rcc.tmp.29, ptr %rcc.tmp.27
  %rcc.tmp.31 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.32 = getelementptr %Agent, ptr %rcc.tmp.31, i32 0, i32 5
  %rcc.tmp.33 = load i32, ptr %target
  %rcc.tmp.34 = srem i32 %rcc.tmp.33, 1000
  store i32 %rcc.tmp.34, ptr %rcc.tmp.32
  %rcc.tmp.36 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.37 = getelementptr %Agent, ptr %rcc.tmp.36, i32 0, i32 6
  store i32 1, ptr %rcc.tmp.37
  br label %if.merge.2
if.else.2:
  %rcc.tmp.40 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.41 = getelementptr %Agent, ptr %rcc.tmp.40, i32 0, i32 6
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.42, 1
  br i1 %rcc.tmp.43, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.45 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.46 = getelementptr %Agent, ptr %rcc.tmp.45, i32 0, i32 1
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.49 = getelementptr %Agent, ptr %rcc.tmp.48, i32 0, i32 4
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = icmp eq i32 %rcc.tmp.47, %rcc.tmp.50
  br i1 %rcc.tmp.51, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.53 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.54 = getelementptr %Agent, ptr %rcc.tmp.53, i32 0, i32 2
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.57 = getelementptr %Agent, ptr %rcc.tmp.56, i32 0, i32 5
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.55, %rcc.tmp.58
  br label %sc.merge
sc.merge:
  %rcc.tmp.61 = phi i1 [0, %if.then.3], [%rcc.tmp.59, %and.rhs]
  br i1 %rcc.tmp.61, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.63 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.64 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 6
  store i32 2, ptr %rcc.tmp.64
  br label %if.merge.4
if.else.4:
  %rcc.tmp.67 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.68 = getelementptr %Agent, ptr %rcc.tmp.67, i32 0, i32 1
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.71 = getelementptr %Agent, ptr %rcc.tmp.70, i32 0, i32 4
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.69, %rcc.tmp.72
  br i1 %rcc.tmp.73, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.75 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.76 = getelementptr %Agent, ptr %rcc.tmp.75, i32 0, i32 1
  %rcc.tmp.77 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.78 = getelementptr %Agent, ptr %rcc.tmp.77, i32 0, i32 1
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %rcc.tmp.76
  br label %if.merge.5
if.else.5:
  %rcc.tmp.83 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.84 = getelementptr %Agent, ptr %rcc.tmp.83, i32 0, i32 1
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.87 = getelementptr %Agent, ptr %rcc.tmp.86, i32 0, i32 4
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  %rcc.tmp.89 = icmp sgt i32 %rcc.tmp.85, %rcc.tmp.88
  br i1 %rcc.tmp.89, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.91 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.92 = getelementptr %Agent, ptr %rcc.tmp.91, i32 0, i32 1
  %rcc.tmp.93 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.94 = getelementptr %Agent, ptr %rcc.tmp.93, i32 0, i32 1
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.94
  %rcc.tmp.96 = sub i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %rcc.tmp.92
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.101 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.102 = getelementptr %Agent, ptr %rcc.tmp.101, i32 0, i32 2
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.105 = getelementptr %Agent, ptr %rcc.tmp.104, i32 0, i32 5
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.105
  %rcc.tmp.107 = icmp slt i32 %rcc.tmp.103, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.109 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.110 = getelementptr %Agent, ptr %rcc.tmp.109, i32 0, i32 2
  %rcc.tmp.111 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.112 = getelementptr %Agent, ptr %rcc.tmp.111, i32 0, i32 2
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %rcc.tmp.110
  br label %if.merge.7
if.else.7:
  %rcc.tmp.117 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.118 = getelementptr %Agent, ptr %rcc.tmp.117, i32 0, i32 2
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.121 = getelementptr %Agent, ptr %rcc.tmp.120, i32 0, i32 5
  %rcc.tmp.122 = load i32, ptr %rcc.tmp.121
  %rcc.tmp.123 = icmp sgt i32 %rcc.tmp.119, %rcc.tmp.122
  br i1 %rcc.tmp.123, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.125 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.126 = getelementptr %Agent, ptr %rcc.tmp.125, i32 0, i32 2
  %rcc.tmp.127 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.128 = getelementptr %Agent, ptr %rcc.tmp.127, i32 0, i32 2
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.128
  %rcc.tmp.130 = sub i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %rcc.tmp.126
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.137 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.138 = getelementptr %Agent, ptr %rcc.tmp.137, i32 0, i32 6
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  %rcc.tmp.140 = icmp eq i32 %rcc.tmp.139, 2
  br i1 %rcc.tmp.140, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.142 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.143 = getelementptr %Agent, ptr %rcc.tmp.142, i32 0, i32 1
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.147 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.148 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.149 = getelementptr %Agent, ptr %rcc.tmp.148, i32 0, i32 2
  %rcc.tmp.150 = load i32, ptr %rcc.tmp.149
  %rcc.tmp.151 = add i32 %rcc.tmp.150, 0
  %rcc.tmp.152 = getelementptr [64 x i32], ptr %rcc.tmp.147, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %rcc.tmp.152
  store i32 %rcc.tmp.153, ptr %res
  %rcc.tmp.155 = load i32, ptr %res
  %rcc.tmp.156 = icmp sgt i32 %rcc.tmp.155, 0
  br i1 %rcc.tmp.156, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.158 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.159 = getelementptr %Agent, ptr %rcc.tmp.158, i32 0, i32 3
  %rcc.tmp.160 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.161 = getelementptr %Agent, ptr %rcc.tmp.160, i32 0, i32 3
  %rcc.tmp.162 = load i32, ptr %rcc.tmp.161
  %rcc.tmp.163 = load i32, ptr %res
  %rcc.tmp.164 = sdiv i32 %rcc.tmp.163, 5
  %rcc.tmp.165 = add i32 %rcc.tmp.162, %rcc.tmp.164
  store i32 %rcc.tmp.165, ptr %rcc.tmp.159
  %rcc.tmp.167 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.168 = getelementptr %Agent, ptr %rcc.tmp.167, i32 0, i32 1
  %rcc.tmp.169 = load i32, ptr %rcc.tmp.168
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.172 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.171, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.173 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.174 = getelementptr %Agent, ptr %rcc.tmp.173, i32 0, i32 2
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.174
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 0
  %rcc.tmp.177 = getelementptr [64 x i32], ptr %rcc.tmp.172, i32 0, i32 %rcc.tmp.176
  %rcc.tmp.178 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.179 = getelementptr %Agent, ptr %rcc.tmp.178, i32 0, i32 1
  %rcc.tmp.180 = load i32, ptr %rcc.tmp.179
  %rcc.tmp.181 = add i32 %rcc.tmp.180, 0
  %rcc.tmp.182 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.183 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.182, i32 0, i32 %rcc.tmp.181
  %rcc.tmp.184 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.185 = getelementptr %Agent, ptr %rcc.tmp.184, i32 0, i32 2
  %rcc.tmp.186 = load i32, ptr %rcc.tmp.185
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 0
  %rcc.tmp.188 = getelementptr [64 x i32], ptr %rcc.tmp.183, i32 0, i32 %rcc.tmp.187
  %rcc.tmp.189 = load i32, ptr %rcc.tmp.188
  %rcc.tmp.190 = load i32, ptr %res
  %rcc.tmp.191 = sdiv i32 %rcc.tmp.190, 10
  %rcc.tmp.192 = sub i32 %rcc.tmp.189, %rcc.tmp.191
  %rcc.tmp.193 = sub i32 %rcc.tmp.192, 1
  store i32 %rcc.tmp.193, ptr %rcc.tmp.177
  %rcc.tmp.195 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.196 = getelementptr %Agent, ptr %rcc.tmp.195, i32 0, i32 1
  %rcc.tmp.197 = load i32, ptr %rcc.tmp.196
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 0
  %rcc.tmp.199 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.200 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.199, i32 0, i32 %rcc.tmp.198
  %rcc.tmp.201 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.202 = getelementptr %Agent, ptr %rcc.tmp.201, i32 0, i32 2
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.202
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 0
  %rcc.tmp.205 = getelementptr [64 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.204
  %rcc.tmp.206 = load i32, ptr %rcc.tmp.205
  %rcc.tmp.207 = icmp slt i32 %rcc.tmp.206, 0
  br i1 %rcc.tmp.207, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.209 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.210 = getelementptr %Agent, ptr %rcc.tmp.209, i32 0, i32 1
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.210
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 0
  %rcc.tmp.213 = load [64 x [64 x i32]]*, ptr %world..tmp
  %rcc.tmp.214 = getelementptr [64 x [64 x i32]], ptr %rcc.tmp.213, i32 0, i32 %rcc.tmp.212
  %rcc.tmp.215 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.216 = getelementptr %Agent, ptr %rcc.tmp.215, i32 0, i32 2
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  %rcc.tmp.218 = add i32 %rcc.tmp.217, 0
  %rcc.tmp.219 = getelementptr [64 x i32], ptr %rcc.tmp.214, i32 0, i32 %rcc.tmp.218
  store i32 0, ptr %rcc.tmp.219
  br label %if.merge.11
if.else.11:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.225 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.226 = getelementptr %Agent, ptr %rcc.tmp.225, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.226
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @main() {
entry:
  %world = alloca [64 x [64 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %agents = alloca [32 x %Agent] 
  %fill.idx.3 = alloca i32 
  %num_agents = alloca i32 
  %world_size = alloca i32 
  %time_step = alloca i32 
  %i = alloca i32 
  %total_energy = alloca i32 
  %j = alloca i32 
  %final_world_sum = alloca i32 
  %i.2 = alloca i32 
  %j.2 = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 64
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [64 x [64 x i32]], ptr %world, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.10 = load i32, ptr %fill.idx.2
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 64
  br i1 %rcc.tmp.11, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.13 = load i32, ptr %fill.idx.2
  %rcc.tmp.14 = getelementptr [64 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.19 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.24 = load i32, ptr %fill.idx.3
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 32
  br i1 %rcc.tmp.25, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.27 = load i32, ptr %fill.idx.3
  %rcc.tmp.28 = getelementptr [32 x %Agent], ptr %agents, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.43, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 32, ptr %num_agents
  store i32 64, ptr %world_size
  call void @init_world.([64 x [64 x i32]]* %world, [32 x %Agent]* %agents)
  store i32 0, ptr %time_step
  br label %while.cond
while.cond:
  %rcc.tmp.51 = load i32, ptr %time_step
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.51, 200
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 32
  br i1 %rcc.tmp.58, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [32 x %Agent], ptr %agents, i32 0, i32 %rcc.tmp.62
  call void @update_agent.(%Agent* %rcc.tmp.63, [64 x [64 x i32]]* %world)
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.69 = load i32, ptr %time_step
  %rcc.tmp.70 = srem i32 %rcc.tmp.69, 20
  %rcc.tmp.71 = icmp eq i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %if.then, label %if.else
if.then:
  store i32 0, ptr %total_energy
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.76 = load i32, ptr %j
  %rcc.tmp.77 = icmp slt i32 %rcc.tmp.76, 32
  br i1 %rcc.tmp.77, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.80 = load i32, ptr %total_energy
  %rcc.tmp.81 = load i32, ptr %j
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [32 x %Agent], ptr %agents, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = getelementptr %Agent, ptr %rcc.tmp.83, i32 0, i32 3
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = add i32 %rcc.tmp.80, %rcc.tmp.85
  store i32 %rcc.tmp.86, ptr %total_energy
  %rcc.tmp.88 = load i32, ptr %j
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.92 = load i32, ptr %total_energy
  call void @printlnInt.(i32 %rcc.tmp.92)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.96 = load i32, ptr %time_step
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %time_step
  br label %while.cond
while.end:
  store i32 0, ptr %final_world_sum
  store i32 0, ptr %i.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.103 = load i32, ptr %i.2
  %rcc.tmp.104 = icmp slt i32 %rcc.tmp.103, 64
  br i1 %rcc.tmp.104, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %j.2
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.109 = load i32, ptr %j.2
  %rcc.tmp.110 = icmp slt i32 %rcc.tmp.109, 64
  br i1 %rcc.tmp.110, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.113 = load i32, ptr %final_world_sum
  %rcc.tmp.114 = load i32, ptr %i.2
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = getelementptr [64 x [64 x i32]], ptr %world, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %j.2
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = getelementptr [64 x i32], ptr %rcc.tmp.116, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  %rcc.tmp.121 = add i32 %rcc.tmp.113, %rcc.tmp.120
  store i32 %rcc.tmp.121, ptr %final_world_sum
  %rcc.tmp.123 = load i32, ptr %j.2
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.124, ptr %j.2
  br label %while.cond.5
while.end.5:
  %rcc.tmp.127 = load i32, ptr %i.2
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 1
  store i32 %rcc.tmp.128, ptr %i.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.131 = load i32, ptr %final_world_sum
  call void @printlnInt.(i32 %rcc.tmp.131)
  call void @exit.(i32 0)
  ret void
}
