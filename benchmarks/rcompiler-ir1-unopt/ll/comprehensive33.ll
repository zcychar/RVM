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
%Agent = type {i32, i32, i32, i32, i32, i32, i1}
%World = type {[50 x [50 x i32]], [20 x %Agent]}
define i32 @pm_rand_update.(i32 %x.tmp) {
entry:
  %x..tmp = alloca i32 
  %a = alloca i32 
  %m = alloca i32 
  %q = alloca i32 
  %r = alloca i32 
  %k = alloca i32 
  %new_x = alloca i32 
  store i32 %x.tmp, ptr %x..tmp
  store i32 16807, ptr %a
  store i32 2147483647, ptr %m
  store i32 127773, ptr %q
  store i32 2836, ptr %r
  %rcc.tmp.6 = load i32, ptr %x..tmp
  %rcc.tmp.7 = load i32, ptr %q
  %rcc.tmp.8 = sdiv i32 %rcc.tmp.6, %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %k
  %rcc.tmp.10 = load i32, ptr %a
  %rcc.tmp.11 = load i32, ptr %x..tmp
  %rcc.tmp.12 = load i32, ptr %k
  %rcc.tmp.13 = load i32, ptr %q
  %rcc.tmp.14 = mul i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = sub i32 %rcc.tmp.11, %rcc.tmp.14
  %rcc.tmp.16 = mul i32 %rcc.tmp.10, %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %r
  %rcc.tmp.18 = load i32, ptr %k
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = sub i32 %rcc.tmp.16, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %new_x
  %rcc.tmp.22 = load i32, ptr %new_x
  %rcc.tmp.23 = icmp sle i32 %rcc.tmp.22, 0
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  %rcc.tmp.25 = load i32, ptr %m
  %rcc.tmp.26 = load i32, ptr %new_x
  %rcc.tmp.27 = add i32 %rcc.tmp.26, %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %new_x
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %new_x
  ret i32 %rcc.tmp.31
}
define void @main() {
entry:
  %world = alloca %World 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %tick = alloca i32 
  %rcc.tmp.1 = getelementptr %World, ptr %world, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 50
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.11 = load i32, ptr %fill.idx.2
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 50
  br i1 %rcc.tmp.12, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = getelementptr [50 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.20 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.20, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.23 = getelementptr %World, ptr %world, i32 0, i32 1
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 20
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [20 x %Agent], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.45, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @initialize_world.(%World* %world, i32 98765)
  store i32 0, ptr %tick
  br label %while.cond
while.cond:
  %rcc.tmp.51 = load i32, ptr %tick
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.51, 100
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update_world.(%World* %world)
  call void @process_interactions.(%World* %world)
  %rcc.tmp.57 = load i32, ptr %tick
  %rcc.tmp.58 = srem i32 %rcc.tmp.57, 10
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 0
  br i1 %rcc.tmp.59, label %if.then, label %if.else
if.then:
  call void @run_diagnostics.(%World* %world)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.64 = load i32, ptr %tick
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %tick
  br label %while.cond
while.end:
  call void @final_report.(%World* %world)
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @initialize_world.(%World* %world.tmp, i32 %seed.tmp) {
entry:
  %world..tmp = alloca %World* 
  %seed..tmp = alloca i32 
  %current_seed = alloca i32 
  %i = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %energy = alloca i32 
  %j = alloca i32 
  store %World* %world.tmp, ptr %world..tmp
  store i32 %seed.tmp, ptr %seed..tmp
  %rcc.tmp.3 = load i32, ptr %seed..tmp
  store i32 %rcc.tmp.3, ptr %current_seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 20
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %current_seed
  %rcc.tmp.12 = call i32 @pm_rand_update.(i32 %rcc.tmp.11)
  %rcc.tmp.13 = sdiv i32 %rcc.tmp.12, 65536
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 32768
  store i32 %rcc.tmp.14, ptr %current_seed
  %rcc.tmp.16 = load i32, ptr %current_seed
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 50
  store i32 %rcc.tmp.17, ptr %x
  %rcc.tmp.19 = load i32, ptr %current_seed
  %rcc.tmp.20 = call i32 @pm_rand_update.(i32 %rcc.tmp.19)
  %rcc.tmp.21 = sdiv i32 %rcc.tmp.20, 65536
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 32768
  store i32 %rcc.tmp.22, ptr %current_seed
  %rcc.tmp.24 = load i32, ptr %current_seed
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 50
  store i32 %rcc.tmp.25, ptr %y
  %rcc.tmp.27 = load i32, ptr %current_seed
  %rcc.tmp.28 = call i32 @pm_rand_update.(i32 %rcc.tmp.27)
  %rcc.tmp.29 = sdiv i32 %rcc.tmp.28, 65536
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 32768
  store i32 %rcc.tmp.30, ptr %current_seed
  %rcc.tmp.32 = load i32, ptr %current_seed
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 100
  %rcc.tmp.34 = add i32 100, %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %energy
  %rcc.tmp.36 = load %World*, ptr %world..tmp
  %rcc.tmp.37 = getelementptr %World, ptr %rcc.tmp.36, i32 0, i32 1
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [20 x %Agent], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %Agent, ptr %rcc.tmp.40, i32 0, i32 0
  %rcc.tmp.42 = load i32, ptr %i
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = load %World*, ptr %world..tmp
  %rcc.tmp.45 = getelementptr %World, ptr %rcc.tmp.44, i32 0, i32 1
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [20 x %Agent], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = getelementptr %Agent, ptr %rcc.tmp.48, i32 0, i32 1
  %rcc.tmp.50 = load i32, ptr %x
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load %World*, ptr %world..tmp
  %rcc.tmp.53 = getelementptr %World, ptr %rcc.tmp.52, i32 0, i32 1
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [20 x %Agent], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = getelementptr %Agent, ptr %rcc.tmp.56, i32 0, i32 2
  %rcc.tmp.58 = load i32, ptr %y
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  %rcc.tmp.60 = load %World*, ptr %world..tmp
  %rcc.tmp.61 = getelementptr %World, ptr %rcc.tmp.60, i32 0, i32 1
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [20 x %Agent], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = getelementptr %Agent, ptr %rcc.tmp.64, i32 0, i32 3
  %rcc.tmp.66 = load i32, ptr %energy
  store i32 %rcc.tmp.66, ptr %rcc.tmp.65
  %rcc.tmp.68 = load %World*, ptr %world..tmp
  %rcc.tmp.69 = getelementptr %World, ptr %rcc.tmp.68, i32 0, i32 1
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [20 x %Agent], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = getelementptr %Agent, ptr %rcc.tmp.72, i32 0, i32 6
  store i1 1, ptr %rcc.tmp.73
  %rcc.tmp.75 = load %World*, ptr %world..tmp
  %rcc.tmp.76 = getelementptr %World, ptr %rcc.tmp.75, i32 0, i32 0
  %rcc.tmp.77 = load i32, ptr %y
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %x
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %rcc.tmp.82
  %rcc.tmp.86 = load %World*, ptr %world..tmp
  %rcc.tmp.87 = getelementptr %World, ptr %rcc.tmp.86, i32 0, i32 1
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [20 x %Agent], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %current_seed
  call void @update_agent_target.(%Agent* %rcc.tmp.90, i32 %rcc.tmp.91)
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = icmp slt i32 %rcc.tmp.99, 50
  br i1 %rcc.tmp.100, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = icmp slt i32 %rcc.tmp.105, 50
  br i1 %rcc.tmp.106, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.109 = load %World*, ptr %world..tmp
  %rcc.tmp.110 = getelementptr %World, ptr %rcc.tmp.109, i32 0, i32 0
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %j
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = getelementptr [50 x i32], ptr %rcc.tmp.113, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.118 = icmp eq i32 %rcc.tmp.117, 0
  br i1 %rcc.tmp.118, label %if.then, label %if.else
if.then:
  %rcc.tmp.120 = load i32, ptr %current_seed
  %rcc.tmp.121 = call i32 @pm_rand_update.(i32 %rcc.tmp.120)
  %rcc.tmp.122 = sdiv i32 %rcc.tmp.121, 65536
  %rcc.tmp.123 = srem i32 %rcc.tmp.122, 32768
  store i32 %rcc.tmp.123, ptr %current_seed
  %rcc.tmp.125 = load i32, ptr %current_seed
  %rcc.tmp.126 = srem i32 %rcc.tmp.125, 10
  %rcc.tmp.127 = icmp eq i32 %rcc.tmp.126, 0
  br i1 %rcc.tmp.127, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.129 = load %World*, ptr %world..tmp
  %rcc.tmp.130 = getelementptr %World, ptr %rcc.tmp.129, i32 0, i32 0
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 0
  %rcc.tmp.133 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.132
  %rcc.tmp.134 = load i32, ptr %j
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [50 x i32], ptr %rcc.tmp.133, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = sub i32 0, 1
  %rcc.tmp.138 = load i32, ptr %current_seed
  %rcc.tmp.139 = srem i32 %rcc.tmp.138, 5
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  %rcc.tmp.141 = mul i32 %rcc.tmp.137, %rcc.tmp.140
  store i32 %rcc.tmp.141, ptr %rcc.tmp.136
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.147 = load i32, ptr %j
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 1
  store i32 %rcc.tmp.148, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 1
  store i32 %rcc.tmp.152, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define void @update_agent_target.(%Agent* %agent.tmp, i32 %seed.tmp) {
entry:
  %agent..tmp = alloca %Agent* 
  %seed..tmp = alloca i32 
  %new_seed = alloca i32 
  store %Agent* %agent.tmp, ptr %agent..tmp
  store i32 %seed.tmp, ptr %seed..tmp
  %rcc.tmp.3 = load i32, ptr %seed..tmp
  store i32 %rcc.tmp.3, ptr %new_seed
  %rcc.tmp.5 = load i32, ptr %new_seed
  %rcc.tmp.6 = call i32 @pm_rand_update.(i32 %rcc.tmp.5)
  %rcc.tmp.7 = sdiv i32 %rcc.tmp.6, 65536
  %rcc.tmp.8 = srem i32 %rcc.tmp.7, 32768
  store i32 %rcc.tmp.8, ptr %new_seed
  %rcc.tmp.10 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.11 = getelementptr %Agent, ptr %rcc.tmp.10, i32 0, i32 4
  %rcc.tmp.12 = load i32, ptr %new_seed
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 50
  store i32 %rcc.tmp.13, ptr %rcc.tmp.11
  %rcc.tmp.15 = load i32, ptr %new_seed
  %rcc.tmp.16 = call i32 @pm_rand_update.(i32 %rcc.tmp.15)
  %rcc.tmp.17 = sdiv i32 %rcc.tmp.16, 65536
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 32768
  store i32 %rcc.tmp.18, ptr %new_seed
  %rcc.tmp.20 = load %Agent*, ptr %agent..tmp
  %rcc.tmp.21 = getelementptr %Agent, ptr %rcc.tmp.20, i32 0, i32 5
  %rcc.tmp.22 = load i32, ptr %new_seed
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 50
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  ret void
}
define void @update_world.(%World* %world.tmp) {
entry:
  %world..tmp = alloca %World* 
  %i = alloca i32 
  %agent = alloca %Agent* 
  %old_x = alloca i32 
  %old_y = alloca i32 
  store %World* %world.tmp, ptr %world..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 20
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %World*, ptr %world..tmp
  %rcc.tmp.9 = getelementptr %World, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [20 x %Agent], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Agent, ptr %rcc.tmp.12, i32 0, i32 6
  %rcc.tmp.14 = load i1, ptr %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load %World*, ptr %world..tmp
  %rcc.tmp.17 = getelementptr %World, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [20 x %Agent], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  store %Agent* %rcc.tmp.20, ptr %agent
  %rcc.tmp.22 = load %Agent*, ptr %agent
  %rcc.tmp.23 = getelementptr %Agent, ptr %rcc.tmp.22, i32 0, i32 1
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %old_x
  %rcc.tmp.26 = load %Agent*, ptr %agent
  %rcc.tmp.27 = getelementptr %Agent, ptr %rcc.tmp.26, i32 0, i32 2
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %old_y
  %rcc.tmp.30 = load %Agent*, ptr %agent
  %rcc.tmp.31 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load %Agent*, ptr %agent
  %rcc.tmp.34 = getelementptr %Agent, ptr %rcc.tmp.33, i32 0, i32 4
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load %Agent*, ptr %agent
  %rcc.tmp.39 = getelementptr %Agent, ptr %rcc.tmp.38, i32 0, i32 1
  %rcc.tmp.40 = load %Agent*, ptr %agent
  %rcc.tmp.41 = getelementptr %Agent, ptr %rcc.tmp.40, i32 0, i32 1
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %rcc.tmp.39
  br label %if.merge.2
if.else.2:
  %rcc.tmp.46 = load %Agent*, ptr %agent
  %rcc.tmp.47 = getelementptr %Agent, ptr %rcc.tmp.46, i32 0, i32 1
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = load %Agent*, ptr %agent
  %rcc.tmp.50 = getelementptr %Agent, ptr %rcc.tmp.49, i32 0, i32 4
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = icmp sgt i32 %rcc.tmp.48, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.54 = load %Agent*, ptr %agent
  %rcc.tmp.55 = getelementptr %Agent, ptr %rcc.tmp.54, i32 0, i32 1
  %rcc.tmp.56 = load %Agent*, ptr %agent
  %rcc.tmp.57 = getelementptr %Agent, ptr %rcc.tmp.56, i32 0, i32 1
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = sub i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %rcc.tmp.55
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.64 = load %Agent*, ptr %agent
  %rcc.tmp.65 = getelementptr %Agent, ptr %rcc.tmp.64, i32 0, i32 2
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = load %Agent*, ptr %agent
  %rcc.tmp.68 = getelementptr %Agent, ptr %rcc.tmp.67, i32 0, i32 5
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.66, %rcc.tmp.69
  br i1 %rcc.tmp.70, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.72 = load %Agent*, ptr %agent
  %rcc.tmp.73 = getelementptr %Agent, ptr %rcc.tmp.72, i32 0, i32 2
  %rcc.tmp.74 = load %Agent*, ptr %agent
  %rcc.tmp.75 = getelementptr %Agent, ptr %rcc.tmp.74, i32 0, i32 2
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %rcc.tmp.73
  br label %if.merge.4
if.else.4:
  %rcc.tmp.80 = load %Agent*, ptr %agent
  %rcc.tmp.81 = getelementptr %Agent, ptr %rcc.tmp.80, i32 0, i32 2
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = load %Agent*, ptr %agent
  %rcc.tmp.84 = getelementptr %Agent, ptr %rcc.tmp.83, i32 0, i32 5
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = icmp sgt i32 %rcc.tmp.82, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.88 = load %Agent*, ptr %agent
  %rcc.tmp.89 = getelementptr %Agent, ptr %rcc.tmp.88, i32 0, i32 2
  %rcc.tmp.90 = load %Agent*, ptr %agent
  %rcc.tmp.91 = getelementptr %Agent, ptr %rcc.tmp.90, i32 0, i32 2
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = sub i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %rcc.tmp.89
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.98 = load %Agent*, ptr %agent
  %rcc.tmp.99 = getelementptr %Agent, ptr %rcc.tmp.98, i32 0, i32 1
  %rcc.tmp.100 = load %Agent*, ptr %agent
  %rcc.tmp.101 = getelementptr %Agent, ptr %rcc.tmp.100, i32 0, i32 1
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = sub i32 50, 1
  %rcc.tmp.104 = call i32 @clamp.(i32 %rcc.tmp.102, i32 0, i32 %rcc.tmp.103)
  store i32 %rcc.tmp.104, ptr %rcc.tmp.99
  %rcc.tmp.106 = load %Agent*, ptr %agent
  %rcc.tmp.107 = getelementptr %Agent, ptr %rcc.tmp.106, i32 0, i32 2
  %rcc.tmp.108 = load %Agent*, ptr %agent
  %rcc.tmp.109 = getelementptr %Agent, ptr %rcc.tmp.108, i32 0, i32 2
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = sub i32 50, 1
  %rcc.tmp.112 = call i32 @clamp.(i32 %rcc.tmp.110, i32 0, i32 %rcc.tmp.111)
  store i32 %rcc.tmp.112, ptr %rcc.tmp.107
  %rcc.tmp.114 = load %Agent*, ptr %agent
  %rcc.tmp.115 = getelementptr %Agent, ptr %rcc.tmp.114, i32 0, i32 3
  %rcc.tmp.116 = load %Agent*, ptr %agent
  %rcc.tmp.117 = getelementptr %Agent, ptr %rcc.tmp.116, i32 0, i32 3
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.119 = sub i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %rcc.tmp.115
  %rcc.tmp.121 = load %World*, ptr %world..tmp
  %rcc.tmp.122 = getelementptr %World, ptr %rcc.tmp.121, i32 0, i32 0
  %rcc.tmp.123 = load %Agent*, ptr %agent
  %rcc.tmp.124 = getelementptr %Agent, ptr %rcc.tmp.123, i32 0, i32 2
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.124
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.126
  %rcc.tmp.128 = load %Agent*, ptr %agent
  %rcc.tmp.129 = getelementptr %Agent, ptr %rcc.tmp.128, i32 0, i32 1
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.129
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = getelementptr [50 x i32], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.132
  %rcc.tmp.134 = icmp eq i32 %rcc.tmp.133, 0
  br i1 %rcc.tmp.134, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.136 = load %World*, ptr %world..tmp
  %rcc.tmp.137 = getelementptr %World, ptr %rcc.tmp.136, i32 0, i32 0
  %rcc.tmp.138 = load i32, ptr %old_y
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 0
  %rcc.tmp.140 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.137, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %old_x
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [50 x i32], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.142
  store i32 0, ptr %rcc.tmp.143
  %rcc.tmp.145 = load %World*, ptr %world..tmp
  %rcc.tmp.146 = getelementptr %World, ptr %rcc.tmp.145, i32 0, i32 0
  %rcc.tmp.147 = load %Agent*, ptr %agent
  %rcc.tmp.148 = getelementptr %Agent, ptr %rcc.tmp.147, i32 0, i32 2
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.146, i32 0, i32 %rcc.tmp.150
  %rcc.tmp.152 = load %Agent*, ptr %agent
  %rcc.tmp.153 = getelementptr %Agent, ptr %rcc.tmp.152, i32 0, i32 1
  %rcc.tmp.154 = load i32, ptr %rcc.tmp.153
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 0
  %rcc.tmp.156 = getelementptr [50 x i32], ptr %rcc.tmp.151, i32 0, i32 %rcc.tmp.155
  %rcc.tmp.157 = load %Agent*, ptr %agent
  %rcc.tmp.158 = getelementptr %Agent, ptr %rcc.tmp.157, i32 0, i32 0
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.158
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.160, ptr %rcc.tmp.156
  br label %if.merge.6
if.else.6:
  %rcc.tmp.163 = load %Agent*, ptr %agent
  %rcc.tmp.164 = getelementptr %Agent, ptr %rcc.tmp.163, i32 0, i32 1
  %rcc.tmp.165 = load i32, ptr %old_x
  store i32 %rcc.tmp.165, ptr %rcc.tmp.164
  %rcc.tmp.167 = load %Agent*, ptr %agent
  %rcc.tmp.168 = getelementptr %Agent, ptr %rcc.tmp.167, i32 0, i32 2
  %rcc.tmp.169 = load i32, ptr %old_y
  store i32 %rcc.tmp.169, ptr %rcc.tmp.168
  %rcc.tmp.171 = load %Agent*, ptr %agent
  %rcc.tmp.172 = getelementptr %Agent, ptr %rcc.tmp.171, i32 0, i32 3
  %rcc.tmp.173 = load %Agent*, ptr %agent
  %rcc.tmp.174 = getelementptr %Agent, ptr %rcc.tmp.173, i32 0, i32 3
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.174
  %rcc.tmp.176 = sub i32 %rcc.tmp.175, 5
  store i32 %rcc.tmp.176, ptr %rcc.tmp.172
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.179 = load %Agent*, ptr %agent
  %rcc.tmp.180 = getelementptr %Agent, ptr %rcc.tmp.179, i32 0, i32 1
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  %rcc.tmp.182 = load %Agent*, ptr %agent
  %rcc.tmp.183 = getelementptr %Agent, ptr %rcc.tmp.182, i32 0, i32 4
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.183
  %rcc.tmp.185 = icmp eq i32 %rcc.tmp.181, %rcc.tmp.184
  br i1 %rcc.tmp.185, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.187 = load %Agent*, ptr %agent
  %rcc.tmp.188 = getelementptr %Agent, ptr %rcc.tmp.187, i32 0, i32 2
  %rcc.tmp.189 = load i32, ptr %rcc.tmp.188
  %rcc.tmp.190 = load %Agent*, ptr %agent
  %rcc.tmp.191 = getelementptr %Agent, ptr %rcc.tmp.190, i32 0, i32 5
  %rcc.tmp.192 = load i32, ptr %rcc.tmp.191
  %rcc.tmp.193 = icmp eq i32 %rcc.tmp.189, %rcc.tmp.192
  br label %sc.merge
sc.merge:
  %rcc.tmp.195 = phi i1 [0, %if.merge.6], [%rcc.tmp.193, %and.rhs]
  br i1 %rcc.tmp.195, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.197 = load %Agent*, ptr %agent
  %rcc.tmp.198 = load %Agent*, ptr %agent
  %rcc.tmp.199 = getelementptr %Agent, ptr %rcc.tmp.198, i32 0, i32 0
  %rcc.tmp.200 = load i32, ptr %rcc.tmp.199
  %rcc.tmp.201 = load %Agent*, ptr %agent
  %rcc.tmp.202 = getelementptr %Agent, ptr %rcc.tmp.201, i32 0, i32 3
  %rcc.tmp.203 = load i32, ptr %rcc.tmp.202
  %rcc.tmp.204 = add i32 %rcc.tmp.200, %rcc.tmp.203
  call void @update_agent_target.(%Agent* %rcc.tmp.197, i32 %rcc.tmp.204)
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.208 = load %Agent*, ptr %agent
  %rcc.tmp.209 = getelementptr %Agent, ptr %rcc.tmp.208, i32 0, i32 3
  %rcc.tmp.210 = load i32, ptr %rcc.tmp.209
  %rcc.tmp.211 = icmp sle i32 %rcc.tmp.210, 0
  br i1 %rcc.tmp.211, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.213 = load %Agent*, ptr %agent
  %rcc.tmp.214 = getelementptr %Agent, ptr %rcc.tmp.213, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.214
  %rcc.tmp.216 = load %World*, ptr %world..tmp
  %rcc.tmp.217 = getelementptr %World, ptr %rcc.tmp.216, i32 0, i32 0
  %rcc.tmp.218 = load %Agent*, ptr %agent
  %rcc.tmp.219 = getelementptr %Agent, ptr %rcc.tmp.218, i32 0, i32 2
  %rcc.tmp.220 = load i32, ptr %rcc.tmp.219
  %rcc.tmp.221 = add i32 %rcc.tmp.220, 0
  %rcc.tmp.222 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.217, i32 0, i32 %rcc.tmp.221
  %rcc.tmp.223 = load %Agent*, ptr %agent
  %rcc.tmp.224 = getelementptr %Agent, ptr %rcc.tmp.223, i32 0, i32 1
  %rcc.tmp.225 = load i32, ptr %rcc.tmp.224
  %rcc.tmp.226 = add i32 %rcc.tmp.225, 0
  %rcc.tmp.227 = getelementptr [50 x i32], ptr %rcc.tmp.222, i32 0, i32 %rcc.tmp.226
  store i32 0, ptr %rcc.tmp.227
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.233 = load i32, ptr %i
  %rcc.tmp.234 = add i32 %rcc.tmp.233, 1
  store i32 %rcc.tmp.234, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @process_interactions.(%World* %world.tmp) {
entry:
  %world..tmp = alloca %World* 
  %i = alloca i32 
  %j = alloca i32 
  %agent1 = alloca %Agent* 
  %agent2 = alloca %Agent* 
  %dist_x = alloca i32 
  %dist_y = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  store %World* %world.tmp, ptr %world..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 20
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %World*, ptr %world..tmp
  %rcc.tmp.9 = getelementptr %World, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [20 x %Agent], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Agent, ptr %rcc.tmp.12, i32 0, i32 6
  %rcc.tmp.14 = load i1, ptr %rcc.tmp.13
  %rcc.tmp.15 = xor i1 %rcc.tmp.14, true
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 20
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.30 = load %World*, ptr %world..tmp
  %rcc.tmp.31 = getelementptr %World, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [20 x %Agent], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %Agent, ptr %rcc.tmp.34, i32 0, i32 6
  %rcc.tmp.36 = load i1, ptr %rcc.tmp.35
  %rcc.tmp.37 = xor i1 %rcc.tmp.36, true
  br i1 %rcc.tmp.37, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.39 = load i32, ptr %j
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %j
  br label %while.cond.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.44 = load %World*, ptr %world..tmp
  %rcc.tmp.45 = getelementptr %World, ptr %rcc.tmp.44, i32 0, i32 1
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [20 x %Agent], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  store %Agent* %rcc.tmp.48, ptr %agent1
  %rcc.tmp.50 = load %World*, ptr %world..tmp
  %rcc.tmp.51 = getelementptr %World, ptr %rcc.tmp.50, i32 0, i32 1
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [20 x %Agent], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  store %Agent* %rcc.tmp.54, ptr %agent2
  %rcc.tmp.56 = load %Agent*, ptr %agent1
  %rcc.tmp.57 = getelementptr %Agent, ptr %rcc.tmp.56, i32 0, i32 1
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = load %Agent*, ptr %agent2
  %rcc.tmp.60 = getelementptr %Agent, ptr %rcc.tmp.59, i32 0, i32 1
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = sub i32 %rcc.tmp.58, %rcc.tmp.61
  store i32 %rcc.tmp.62, ptr %dist_x
  %rcc.tmp.64 = load %Agent*, ptr %agent1
  %rcc.tmp.65 = getelementptr %Agent, ptr %rcc.tmp.64, i32 0, i32 2
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = load %Agent*, ptr %agent2
  %rcc.tmp.68 = getelementptr %Agent, ptr %rcc.tmp.67, i32 0, i32 2
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = sub i32 %rcc.tmp.66, %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %dist_y
  %rcc.tmp.72 = load i32, ptr %dist_x
  %rcc.tmp.73 = load i32, ptr %dist_x
  %rcc.tmp.74 = mul i32 %rcc.tmp.72, %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %dist_y
  %rcc.tmp.76 = load i32, ptr %dist_y
  %rcc.tmp.77 = mul i32 %rcc.tmp.75, %rcc.tmp.76
  %rcc.tmp.78 = add i32 %rcc.tmp.74, %rcc.tmp.77
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.78, 4
  br i1 %rcc.tmp.79, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.81 = load %Agent*, ptr %agent1
  %rcc.tmp.82 = getelementptr %Agent, ptr %rcc.tmp.81, i32 0, i32 3
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = load %Agent*, ptr %agent2
  %rcc.tmp.85 = getelementptr %Agent, ptr %rcc.tmp.84, i32 0, i32 3
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = icmp sgt i32 %rcc.tmp.83, %rcc.tmp.86
  br i1 %rcc.tmp.87, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.89 = load %World*, ptr %world..tmp
  %rcc.tmp.90 = getelementptr %World, ptr %rcc.tmp.89, i32 0, i32 1
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [20 x %Agent], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = getelementptr %Agent, ptr %rcc.tmp.93, i32 0, i32 3
  %rcc.tmp.95 = load %World*, ptr %world..tmp
  %rcc.tmp.96 = getelementptr %World, ptr %rcc.tmp.95, i32 0, i32 1
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [20 x %Agent], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = getelementptr %Agent, ptr %rcc.tmp.99, i32 0, i32 3
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.100
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 10
  store i32 %rcc.tmp.102, ptr %rcc.tmp.94
  %rcc.tmp.104 = load %World*, ptr %world..tmp
  %rcc.tmp.105 = getelementptr %World, ptr %rcc.tmp.104, i32 0, i32 1
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [20 x %Agent], ptr %rcc.tmp.105, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = getelementptr %Agent, ptr %rcc.tmp.108, i32 0, i32 3
  %rcc.tmp.110 = load %World*, ptr %world..tmp
  %rcc.tmp.111 = getelementptr %World, ptr %rcc.tmp.110, i32 0, i32 1
  %rcc.tmp.112 = load i32, ptr %j
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = getelementptr [20 x %Agent], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.113
  %rcc.tmp.115 = getelementptr %Agent, ptr %rcc.tmp.114, i32 0, i32 3
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = sub i32 %rcc.tmp.116, 10
  store i32 %rcc.tmp.117, ptr %rcc.tmp.109
  br label %if.merge.4
if.else.4:
  %rcc.tmp.120 = load %World*, ptr %world..tmp
  %rcc.tmp.121 = getelementptr %World, ptr %rcc.tmp.120, i32 0, i32 1
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [20 x %Agent], ptr %rcc.tmp.121, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = getelementptr %Agent, ptr %rcc.tmp.124, i32 0, i32 3
  %rcc.tmp.126 = load %World*, ptr %world..tmp
  %rcc.tmp.127 = getelementptr %World, ptr %rcc.tmp.126, i32 0, i32 1
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = getelementptr [20 x %Agent], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.131 = getelementptr %Agent, ptr %rcc.tmp.130, i32 0, i32 3
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  %rcc.tmp.133 = sub i32 %rcc.tmp.132, 10
  store i32 %rcc.tmp.133, ptr %rcc.tmp.125
  %rcc.tmp.135 = load %World*, ptr %world..tmp
  %rcc.tmp.136 = getelementptr %World, ptr %rcc.tmp.135, i32 0, i32 1
  %rcc.tmp.137 = load i32, ptr %j
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [20 x %Agent], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = getelementptr %Agent, ptr %rcc.tmp.139, i32 0, i32 3
  %rcc.tmp.141 = load %World*, ptr %world..tmp
  %rcc.tmp.142 = getelementptr %World, ptr %rcc.tmp.141, i32 0, i32 1
  %rcc.tmp.143 = load i32, ptr %j
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 0
  %rcc.tmp.145 = getelementptr [20 x %Agent], ptr %rcc.tmp.142, i32 0, i32 %rcc.tmp.144
  %rcc.tmp.146 = getelementptr %Agent, ptr %rcc.tmp.145, i32 0, i32 3
  %rcc.tmp.147 = load i32, ptr %rcc.tmp.146
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 10
  store i32 %rcc.tmp.148, ptr %rcc.tmp.140
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.153 = load i32, ptr %j
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.157 = load %World*, ptr %world..tmp
  %rcc.tmp.158 = getelementptr %World, ptr %rcc.tmp.157, i32 0, i32 1
  %rcc.tmp.159 = load i32, ptr %i
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 0
  %rcc.tmp.161 = getelementptr [20 x %Agent], ptr %rcc.tmp.158, i32 0, i32 %rcc.tmp.160
  %rcc.tmp.162 = getelementptr %Agent, ptr %rcc.tmp.161, i32 0, i32 1
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %x
  %rcc.tmp.165 = load %World*, ptr %world..tmp
  %rcc.tmp.166 = getelementptr %World, ptr %rcc.tmp.165, i32 0, i32 1
  %rcc.tmp.167 = load i32, ptr %i
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 0
  %rcc.tmp.169 = getelementptr [20 x %Agent], ptr %rcc.tmp.166, i32 0, i32 %rcc.tmp.168
  %rcc.tmp.170 = getelementptr %Agent, ptr %rcc.tmp.169, i32 0, i32 2
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.170
  store i32 %rcc.tmp.171, ptr %y
  %rcc.tmp.173 = load %World*, ptr %world..tmp
  %rcc.tmp.174 = getelementptr %World, ptr %rcc.tmp.173, i32 0, i32 0
  %rcc.tmp.175 = load i32, ptr %y
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 0
  %rcc.tmp.177 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.174, i32 0, i32 %rcc.tmp.176
  %rcc.tmp.178 = load i32, ptr %x
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 0
  %rcc.tmp.180 = getelementptr [50 x i32], ptr %rcc.tmp.177, i32 0, i32 %rcc.tmp.179
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  %rcc.tmp.182 = icmp slt i32 %rcc.tmp.181, 0
  br i1 %rcc.tmp.182, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.184 = load %World*, ptr %world..tmp
  %rcc.tmp.185 = getelementptr %World, ptr %rcc.tmp.184, i32 0, i32 1
  %rcc.tmp.186 = load i32, ptr %i
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 0
  %rcc.tmp.188 = getelementptr [20 x %Agent], ptr %rcc.tmp.185, i32 0, i32 %rcc.tmp.187
  %rcc.tmp.189 = getelementptr %Agent, ptr %rcc.tmp.188, i32 0, i32 3
  %rcc.tmp.190 = load %World*, ptr %world..tmp
  %rcc.tmp.191 = getelementptr %World, ptr %rcc.tmp.190, i32 0, i32 1
  %rcc.tmp.192 = load i32, ptr %i
  %rcc.tmp.193 = add i32 %rcc.tmp.192, 0
  %rcc.tmp.194 = getelementptr [20 x %Agent], ptr %rcc.tmp.191, i32 0, i32 %rcc.tmp.193
  %rcc.tmp.195 = getelementptr %Agent, ptr %rcc.tmp.194, i32 0, i32 3
  %rcc.tmp.196 = load i32, ptr %rcc.tmp.195
  %rcc.tmp.197 = load %World*, ptr %world..tmp
  %rcc.tmp.198 = getelementptr %World, ptr %rcc.tmp.197, i32 0, i32 0
  %rcc.tmp.199 = load i32, ptr %y
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 0
  %rcc.tmp.201 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.198, i32 0, i32 %rcc.tmp.200
  %rcc.tmp.202 = load i32, ptr %x
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 0
  %rcc.tmp.204 = getelementptr [50 x i32], ptr %rcc.tmp.201, i32 0, i32 %rcc.tmp.203
  %rcc.tmp.205 = load i32, ptr %rcc.tmp.204
  %rcc.tmp.206 = sub i32 0, 10
  %rcc.tmp.207 = mul i32 %rcc.tmp.205, %rcc.tmp.206
  %rcc.tmp.208 = add i32 %rcc.tmp.196, %rcc.tmp.207
  store i32 %rcc.tmp.208, ptr %rcc.tmp.189
  %rcc.tmp.210 = load %World*, ptr %world..tmp
  %rcc.tmp.211 = getelementptr %World, ptr %rcc.tmp.210, i32 0, i32 0
  %rcc.tmp.212 = load i32, ptr %y
  %rcc.tmp.213 = add i32 %rcc.tmp.212, 0
  %rcc.tmp.214 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.211, i32 0, i32 %rcc.tmp.213
  %rcc.tmp.215 = load i32, ptr %x
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 0
  %rcc.tmp.217 = getelementptr [50 x i32], ptr %rcc.tmp.214, i32 0, i32 %rcc.tmp.216
  %rcc.tmp.218 = load %World*, ptr %world..tmp
  %rcc.tmp.219 = getelementptr %World, ptr %rcc.tmp.218, i32 0, i32 1
  %rcc.tmp.220 = load i32, ptr %i
  %rcc.tmp.221 = add i32 %rcc.tmp.220, 0
  %rcc.tmp.222 = getelementptr [20 x %Agent], ptr %rcc.tmp.219, i32 0, i32 %rcc.tmp.221
  %rcc.tmp.223 = getelementptr %Agent, ptr %rcc.tmp.222, i32 0, i32 0
  %rcc.tmp.224 = load i32, ptr %rcc.tmp.223
  %rcc.tmp.225 = add i32 %rcc.tmp.224, 1
  store i32 %rcc.tmp.225, ptr %rcc.tmp.217
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.229 = load i32, ptr %i
  %rcc.tmp.230 = add i32 %rcc.tmp.229, 1
  store i32 %rcc.tmp.230, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @run_diagnostics.(%World* %world.tmp) {
entry:
  %world..tmp = alloca %World* 
  %total_energy = alloca i32 
  %active_agents = alloca i32 
  %i = alloca i32 
  store %World* %world.tmp, ptr %world..tmp
  store i32 0, ptr %total_energy
  store i32 0, ptr %active_agents
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 20
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load %World*, ptr %world..tmp
  %rcc.tmp.11 = getelementptr %World, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = getelementptr [20 x %Agent], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Agent, ptr %rcc.tmp.14, i32 0, i32 6
  %rcc.tmp.16 = load i1, ptr %rcc.tmp.15
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  %rcc.tmp.18 = load i32, ptr %total_energy
  %rcc.tmp.19 = load %World*, ptr %world..tmp
  %rcc.tmp.20 = getelementptr %World, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [20 x %Agent], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Agent, ptr %rcc.tmp.23, i32 0, i32 3
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.18, %rcc.tmp.25
  store i32 %rcc.tmp.26, ptr %total_energy
  %rcc.tmp.28 = load i32, ptr %active_agents
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %active_agents
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.37 = load i32, ptr %active_agents
  %rcc.tmp.38 = add i32 100000, %rcc.tmp.37
  call void @printlnInt.(i32 %rcc.tmp.38)
  %rcc.tmp.40 = load i32, ptr %total_energy
  %rcc.tmp.41 = add i32 200000, %rcc.tmp.40
  call void @printlnInt.(i32 %rcc.tmp.41)
  %rcc.tmp.43 = load %World*, ptr %world..tmp
  call void @provoke_error.(%World* %rcc.tmp.43)
  ret void
}
define void @final_report.(%World* %world.tmp) {
entry:
  %world..tmp = alloca %World* 
  %i = alloca i32 
  store %World* %world.tmp, ptr %world..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 20
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %World*, ptr %world..tmp
  %rcc.tmp.9 = getelementptr %World, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [20 x %Agent], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Agent, ptr %rcc.tmp.12, i32 0, i32 6
  %rcc.tmp.14 = load i1, ptr %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load %World*, ptr %world..tmp
  %rcc.tmp.17 = getelementptr %World, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [20 x %Agent], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %Agent, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 10000
  %rcc.tmp.24 = load %World*, ptr %world..tmp
  %rcc.tmp.25 = getelementptr %World, ptr %rcc.tmp.24, i32 0, i32 1
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [20 x %Agent], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %Agent, ptr %rcc.tmp.28, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.23, %rcc.tmp.30
  call void @printlnInt.(i32 %rcc.tmp.31)
  br label %if.merge
if.else:
  %rcc.tmp.34 = load %World*, ptr %world..tmp
  %rcc.tmp.35 = getelementptr %World, ptr %rcc.tmp.34, i32 0, i32 1
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [20 x %Agent], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %Agent, ptr %rcc.tmp.38, i32 0, i32 0
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = mul i32 %rcc.tmp.40, 10000
  %rcc.tmp.42 = sub i32 0, 1
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  call void @printlnInt.(i32 %rcc.tmp.43)
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @clamp.(i32 %val.tmp, i32 %min.tmp, i32 %max.tmp) {
entry:
  %val..tmp = alloca i32 
  %min..tmp = alloca i32 
  %max..tmp = alloca i32 
  store i32 %val.tmp, ptr %val..tmp
  store i32 %min.tmp, ptr %min..tmp
  store i32 %max.tmp, ptr %max..tmp
  %rcc.tmp.4 = load i32, ptr %val..tmp
  %rcc.tmp.5 = load i32, ptr %min..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %min..tmp
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %val..tmp
  %rcc.tmp.12 = load i32, ptr %max..tmp
  %rcc.tmp.13 = icmp sgt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.15 = load i32, ptr %max..tmp
  ret i32 %rcc.tmp.15
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.18 = load i32, ptr %val..tmp
  ret i32 %rcc.tmp.18
}
define void @provoke_error.(%World* %world.tmp) {
entry:
  %world..tmp = alloca %World* 
  %agent_copy = alloca %Agent 
  %i = alloca i32 
  %temp_agent = alloca %Agent 
  %strongest_agent_id = alloca i32 
  %max_energy = alloca i32 
  store %World* %world.tmp, ptr %world..tmp
  %rcc.tmp.2 = load %World*, ptr %world..tmp
  %rcc.tmp.3 = getelementptr %World, ptr %rcc.tmp.2, i32 0, i32 1
  %rcc.tmp.4 = getelementptr [20 x %Agent], ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 1
  %rcc.tmp.10 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 1
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 2
  %rcc.tmp.14 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 2
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 3
  %rcc.tmp.18 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 3
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 4
  %rcc.tmp.22 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 4
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 5
  %rcc.tmp.26 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 5
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr %Agent, ptr %rcc.tmp.4, i32 0, i32 6
  %rcc.tmp.30 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 6
  %rcc.tmp.31 = load i1, ptr %rcc.tmp.29
  store i1 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr %Agent, ptr %agent_copy, i32 0, i32 3
  %rcc.tmp.34 = sub i32 0, 100
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 20
  br i1 %rcc.tmp.39, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.42 = load %World*, ptr %world..tmp
  %rcc.tmp.43 = getelementptr %World, ptr %rcc.tmp.42, i32 0, i32 1
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [20 x %Agent], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = getelementptr %Agent, ptr %rcc.tmp.46, i32 0, i32 6
  %rcc.tmp.48 = load i1, ptr %rcc.tmp.47
  br i1 %rcc.tmp.48, label %if.then, label %if.else
if.then:
  %rcc.tmp.50 = load %World*, ptr %world..tmp
  %rcc.tmp.51 = getelementptr %World, ptr %rcc.tmp.50, i32 0, i32 1
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = getelementptr [20 x %Agent], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = getelementptr %Agent, ptr %rcc.tmp.54, i32 0, i32 3
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp sgt i32 %rcc.tmp.56, 150
  br i1 %rcc.tmp.57, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.59 = load %World*, ptr %world..tmp
  %rcc.tmp.60 = getelementptr %World, ptr %rcc.tmp.59, i32 0, i32 1
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [20 x %Agent], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.64 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 0
  %rcc.tmp.65 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 0
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.64
  store i32 %rcc.tmp.66, ptr %rcc.tmp.65
  %rcc.tmp.68 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 1
  %rcc.tmp.69 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 1
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.68
  store i32 %rcc.tmp.70, ptr %rcc.tmp.69
  %rcc.tmp.72 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 2
  %rcc.tmp.73 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 2
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.72
  store i32 %rcc.tmp.74, ptr %rcc.tmp.73
  %rcc.tmp.76 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 3
  %rcc.tmp.77 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 3
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.76
  store i32 %rcc.tmp.78, ptr %rcc.tmp.77
  %rcc.tmp.80 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 4
  %rcc.tmp.81 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 4
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.80
  store i32 %rcc.tmp.82, ptr %rcc.tmp.81
  %rcc.tmp.84 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 5
  %rcc.tmp.85 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 5
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.84
  store i32 %rcc.tmp.86, ptr %rcc.tmp.85
  %rcc.tmp.88 = getelementptr %Agent, ptr %rcc.tmp.63, i32 0, i32 6
  %rcc.tmp.89 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 6
  %rcc.tmp.90 = load i1, ptr %rcc.tmp.88
  store i1 %rcc.tmp.90, ptr %rcc.tmp.89
  %rcc.tmp.92 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 3
  %rcc.tmp.93 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 3
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = sdiv i32 %rcc.tmp.94, 2
  store i32 %rcc.tmp.95, ptr %rcc.tmp.92
  %rcc.tmp.97 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 3
  %rcc.tmp.98 = load i32, ptr %rcc.tmp.97
  %rcc.tmp.99 = icmp sgt i32 %rcc.tmp.98, 100
  br i1 %rcc.tmp.99, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.101 = getelementptr %Agent, ptr %temp_agent, i32 0, i32 0
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 5000
  call void @printlnInt.(i32 %rcc.tmp.103)
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
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.112, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.115 = sub i32 0, 1
  store i32 %rcc.tmp.115, ptr %strongest_agent_id
  %rcc.tmp.117 = sub i32 0, 1
  store i32 %rcc.tmp.117, ptr %max_energy
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.121 = load i32, ptr %i
  %rcc.tmp.122 = icmp slt i32 %rcc.tmp.121, 20
  br i1 %rcc.tmp.122, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.125 = load %World*, ptr %world..tmp
  %rcc.tmp.126 = getelementptr %World, ptr %rcc.tmp.125, i32 0, i32 1
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [20 x %Agent], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = getelementptr %Agent, ptr %rcc.tmp.129, i32 0, i32 6
  %rcc.tmp.131 = load i1, ptr %rcc.tmp.130
  br i1 %rcc.tmp.131, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.133 = load %World*, ptr %world..tmp
  %rcc.tmp.134 = getelementptr %World, ptr %rcc.tmp.133, i32 0, i32 1
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 0
  %rcc.tmp.137 = getelementptr [20 x %Agent], ptr %rcc.tmp.134, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.138 = getelementptr %Agent, ptr %rcc.tmp.137, i32 0, i32 3
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %max_energy
  %rcc.tmp.141 = icmp sgt i32 %rcc.tmp.139, %rcc.tmp.140
  br i1 %rcc.tmp.141, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.143 = load %World*, ptr %world..tmp
  %rcc.tmp.144 = getelementptr %World, ptr %rcc.tmp.143, i32 0, i32 1
  %rcc.tmp.145 = load i32, ptr %i
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [20 x %Agent], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = getelementptr %Agent, ptr %rcc.tmp.147, i32 0, i32 3
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  store i32 %rcc.tmp.149, ptr %max_energy
  %rcc.tmp.151 = load %World*, ptr %world..tmp
  %rcc.tmp.152 = getelementptr %World, ptr %rcc.tmp.151, i32 0, i32 1
  %rcc.tmp.153 = load i32, ptr %i
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = getelementptr [20 x %Agent], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.156 = getelementptr %Agent, ptr %rcc.tmp.155, i32 0, i32 0
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  store i32 %rcc.tmp.157, ptr %strongest_agent_id
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.163 = load i32, ptr %i
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 1
  store i32 %rcc.tmp.164, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.167 = load i32, ptr %strongest_agent_id
  %rcc.tmp.168 = sub i32 0, 1
  %rcc.tmp.169 = icmp ne i32 %rcc.tmp.167, %rcc.tmp.168
  br i1 %rcc.tmp.169, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.171 = load %World*, ptr %world..tmp
  %rcc.tmp.172 = getelementptr %World, ptr %rcc.tmp.171, i32 0, i32 1
  %rcc.tmp.173 = load i32, ptr %strongest_agent_id
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [20 x %Agent], ptr %rcc.tmp.172, i32 0, i32 %rcc.tmp.174
  %rcc.tmp.176 = getelementptr %Agent, ptr %rcc.tmp.175, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.176
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  ret void
}
define void @another_simulation_scenario.() {
entry:
  %world = alloca %World 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr %World, ptr %world, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 50
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [50 x [50 x i32]], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.11 = load i32, ptr %fill.idx.2
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 50
  br i1 %rcc.tmp.12, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = getelementptr [50 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.20 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.20, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.23 = getelementptr %World, ptr %world, i32 0, i32 1
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 20
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [20 x %Agent], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr %Agent, ptr %rcc.tmp.30, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.45, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @initialize_world.(%World* %world, i32 11223)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.51, 50
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @update_world.(%World* %world)
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  br label %while.cond
while.end:
  call void @process_interactions.(%World* %world)
  call void @final_report.(%World* %world)
  ret void
}
