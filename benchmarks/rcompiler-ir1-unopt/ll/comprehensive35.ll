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
  %maze = alloca [20 x [20 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %start_x = alloca i32 
  %start_y = alloca i32 
  %end_x = alloca i32 
  %end_y = alloca i32 
  %path_len = alloca i32 
  %puzzle_result = alloca i32 
  %error_val = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 20
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [20 x [20 x i32]], ptr %maze, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.10 = load i32, ptr %fill.idx.2
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 20
  br i1 %rcc.tmp.11, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.13 = load i32, ptr %fill.idx.2
  %rcc.tmp.14 = getelementptr [20 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.19 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @generate_maze.([20 x [20 x i32]]* %maze, i32 54321)
  store i32 1, ptr %start_x
  store i32 1, ptr %start_y
  %rcc.tmp.25 = load i32, ptr %start_y
  %rcc.tmp.26 = getelementptr [20 x [20 x i32]], ptr %maze, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %start_x
  %rcc.tmp.28 = getelementptr [20 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.27
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = sub i32 20, 2
  store i32 %rcc.tmp.30, ptr %end_x
  %rcc.tmp.32 = sub i32 20, 2
  store i32 %rcc.tmp.32, ptr %end_y
  %rcc.tmp.34 = load i32, ptr %end_y
  %rcc.tmp.35 = getelementptr [20 x [20 x i32]], ptr %maze, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %end_x
  %rcc.tmp.37 = getelementptr [20 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.36
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %start_x
  %rcc.tmp.40 = load i32, ptr %start_y
  %rcc.tmp.41 = load i32, ptr %end_x
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load i32, ptr %end_y
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = call i32 @solve_maze.([20 x [20 x i32]]* %maze, i32 %rcc.tmp.39, i32 %rcc.tmp.40, i32 %rcc.tmp.42, i32 %rcc.tmp.44)
  store i32 %rcc.tmp.45, ptr %path_len
  %rcc.tmp.47 = load i32, ptr %path_len
  call void @printlnInt.(i32 %rcc.tmp.47)
  %rcc.tmp.49 = call i32 @solve_logic_puzzle.()
  store i32 %rcc.tmp.49, ptr %puzzle_result
  %rcc.tmp.51 = load i32, ptr %puzzle_result
  call void @printlnInt.(i32 %rcc.tmp.51)
  %rcc.tmp.53 = call i32 @run_control_flow_puzzle.()
  store i32 %rcc.tmp.53, ptr %error_val
  %rcc.tmp.55 = load i32, ptr %error_val
  call void @printlnInt.(i32 %rcc.tmp.55)
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @generate_maze.([20 x [20 x i32]]* %maze.tmp, i32 %seed.tmp) {
entry:
  %maze..tmp = alloca [20 x [20 x i32]]* 
  %seed..tmp = alloca i32 
  %current_seed = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [20 x [20 x i32]]* %maze.tmp, ptr %maze..tmp
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
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 20
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.20, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.23 = phi i1 [1, %while.body.2], [%rcc.tmp.21, %or.rhs]
  br i1 %rcc.tmp.23, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = sub i32 20, 1
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.25, %rcc.tmp.26
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.29 = phi i1 [1, %sc.merge], [%rcc.tmp.27, %or.rhs.2]
  br i1 %rcc.tmp.29, label %sc.merge.3, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = sub i32 20, 1
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.31, %rcc.tmp.32
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.35 = phi i1 [1, %sc.merge.2], [%rcc.tmp.33, %or.rhs.3]
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = load [20 x [20 x i32]]*, ptr %maze..tmp
  %rcc.tmp.39 = getelementptr [20 x [20 x i32]], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = getelementptr [20 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.40
  store i32 1, ptr %rcc.tmp.41
  br label %if.merge
if.else:
  %rcc.tmp.44 = load i32, ptr %current_seed
  %rcc.tmp.45 = call i32 @pm_rand_update.(i32 %rcc.tmp.44)
  %rcc.tmp.46 = sdiv i32 %rcc.tmp.45, 65536
  %rcc.tmp.47 = srem i32 %rcc.tmp.46, 32768
  store i32 %rcc.tmp.47, ptr %current_seed
  %rcc.tmp.49 = load i32, ptr %current_seed
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 4
  %rcc.tmp.51 = icmp eq i32 %rcc.tmp.50, 0
  br i1 %rcc.tmp.51, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = load [20 x [20 x i32]]*, ptr %maze..tmp
  %rcc.tmp.55 = getelementptr [20 x [20 x i32]], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = getelementptr [20 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.56
  store i32 1, ptr %rcc.tmp.57
  br label %if.merge.2
if.else.2:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = load [20 x [20 x i32]]*, ptr %maze..tmp
  %rcc.tmp.62 = getelementptr [20 x [20 x i32]], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = getelementptr [20 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.63
  store i32 0, ptr %rcc.tmp.64
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @solve_maze.([20 x [20 x i32]]* %maze.tmp, i32 %start_x.tmp, i32 %start_y.tmp, i32 %end_x.tmp, i32 %end_y.tmp) {
entry:
  %maze..tmp = alloca [20 x [20 x i32]]* 
  %start_x..tmp = alloca i32 
  %start_y..tmp = alloca i32 
  %end_x..tmp = alloca i32 
  %end_y..tmp = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %steps = alloca i32 
  %dir = alloca i32 
  %turned = alloca i1 
  %i = alloca i32 
  %next_dir = alloca i32 
  %next_x = alloca i32 
  %next_y = alloca i32 
  store [20 x [20 x i32]]* %maze.tmp, ptr %maze..tmp
  store i32 %start_x.tmp, ptr %start_x..tmp
  store i32 %start_y.tmp, ptr %start_y..tmp
  store i32 %end_x.tmp, ptr %end_x..tmp
  store i32 %end_y.tmp, ptr %end_y..tmp
  %rcc.tmp.6 = load i32, ptr %start_x..tmp
  store i32 %rcc.tmp.6, ptr %x
  %rcc.tmp.8 = load i32, ptr %start_y..tmp
  store i32 %rcc.tmp.8, ptr %y
  store i32 0, ptr %steps
  store i32 0, ptr %dir
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %steps
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 1000
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %x
  %rcc.tmp.18 = load i32, ptr %end_x..tmp
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.21 = load i32, ptr %y
  %rcc.tmp.22 = load i32, ptr %end_y..tmp
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.21, %rcc.tmp.22
  br label %sc.merge
sc.merge:
  %rcc.tmp.25 = phi i1 [0, %while.body], [%rcc.tmp.23, %and.rhs]
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %steps
  ret i32 %rcc.tmp.27
if.else:
  br label %if.merge
if.merge:
  store i1 0, ptr %turned
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 4
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.37 = load i32, ptr %dir
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 3
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.38, %rcc.tmp.39
  %rcc.tmp.41 = srem i32 %rcc.tmp.40, 4
  store i32 %rcc.tmp.41, ptr %next_dir
  %rcc.tmp.43 = load i32, ptr %x
  store i32 %rcc.tmp.43, ptr %next_x
  %rcc.tmp.45 = load i32, ptr %y
  store i32 %rcc.tmp.45, ptr %next_y
  %rcc.tmp.47 = load i32, ptr %next_dir
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.47, 0
  br i1 %rcc.tmp.48, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.50 = load i32, ptr %next_y
  %rcc.tmp.51 = sub i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %next_y
  br label %if.merge.2
if.else.2:
  %rcc.tmp.54 = load i32, ptr %next_dir
  %rcc.tmp.55 = icmp eq i32 %rcc.tmp.54, 1
  br i1 %rcc.tmp.55, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.57 = load i32, ptr %next_x
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %next_x
  br label %if.merge.3
if.else.3:
  %rcc.tmp.61 = load i32, ptr %next_dir
  %rcc.tmp.62 = icmp eq i32 %rcc.tmp.61, 2
  br i1 %rcc.tmp.62, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.64 = load i32, ptr %next_y
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %next_y
  br label %if.merge.4
if.else.4:
  %rcc.tmp.68 = load i32, ptr %next_x
  %rcc.tmp.69 = sub i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %next_x
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.74 = load i32, ptr %next_y
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [20 x [20 x i32]]*, ptr %maze..tmp
  %rcc.tmp.77 = getelementptr [20 x [20 x i32]], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %next_x
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [20 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = icmp eq i32 %rcc.tmp.81, 0
  br i1 %rcc.tmp.82, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.84 = load i32, ptr %next_x
  store i32 %rcc.tmp.84, ptr %x
  %rcc.tmp.86 = load i32, ptr %next_y
  store i32 %rcc.tmp.86, ptr %y
  %rcc.tmp.88 = load i32, ptr %next_dir
  store i32 %rcc.tmp.88, ptr %dir
  store i1 1, ptr %turned
  br label %while.linker.2
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 1
  store i32 %rcc.tmp.94, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.97 = load i1, ptr %turned
  %rcc.tmp.98 = xor i1 %rcc.tmp.97, true
  br i1 %rcc.tmp.98, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.100 = sub i32 0, 1
  ret i32 %rcc.tmp.100
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.103 = load i32, ptr %steps
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.104, ptr %steps
  br label %while.cond
while.end:
  %rcc.tmp.107 = sub i32 0, 1
  ret i32 %rcc.tmp.107
}
define i32 @solve_logic_puzzle.() {
entry:
  %a = alloca i32 
  %b = alloca i32 
  %c = alloca i32 
  %d = alloca i32 
  %e = alloca i32 
  %i = alloca i32 
  %cond1 = alloca i1 
  %cond2 = alloca i1 
  %cond3 = alloca i1 
  %cond4 = alloca i1 
  %cond5 = alloca i1 
  store i32 0, ptr %a
  store i32 0, ptr %b
  store i32 0, ptr %c
  store i32 0, ptr %d
  store i32 0, ptr %e
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 10000
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 5
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %a
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = sdiv i32 %rcc.tmp.16, 5
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 5
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %b
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = sdiv i32 %rcc.tmp.21, 25
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 5
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %c
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = sdiv i32 %rcc.tmp.26, 125
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 5
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %d
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = sdiv i32 %rcc.tmp.31, 625
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 5
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %e
  %rcc.tmp.36 = load i32, ptr %a
  %rcc.tmp.37 = load i32, ptr %b
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.40 = load i32, ptr %a
  %rcc.tmp.41 = load i32, ptr %c
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.40, %rcc.tmp.41
  br label %sc.merge
sc.merge:
  %rcc.tmp.44 = phi i1 [1, %while.body], [%rcc.tmp.42, %or.rhs]
  br i1 %rcc.tmp.44, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.46 = load i32, ptr %a
  %rcc.tmp.47 = load i32, ptr %d
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.46, %rcc.tmp.47
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.50 = phi i1 [1, %sc.merge], [%rcc.tmp.48, %or.rhs.2]
  br i1 %rcc.tmp.50, label %sc.merge.3, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.52 = load i32, ptr %a
  %rcc.tmp.53 = load i32, ptr %e
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.52, %rcc.tmp.53
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.56 = phi i1 [1, %sc.merge.2], [%rcc.tmp.54, %or.rhs.3]
  br i1 %rcc.tmp.56, label %sc.merge.4, label %or.rhs.4
or.rhs.4:
  %rcc.tmp.58 = load i32, ptr %b
  %rcc.tmp.59 = load i32, ptr %c
  %rcc.tmp.60 = icmp eq i32 %rcc.tmp.58, %rcc.tmp.59
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.62 = phi i1 [1, %sc.merge.3], [%rcc.tmp.60, %or.rhs.4]
  br i1 %rcc.tmp.62, label %sc.merge.5, label %or.rhs.5
or.rhs.5:
  %rcc.tmp.64 = load i32, ptr %b
  %rcc.tmp.65 = load i32, ptr %d
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.64, %rcc.tmp.65
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.68 = phi i1 [1, %sc.merge.4], [%rcc.tmp.66, %or.rhs.5]
  br i1 %rcc.tmp.68, label %sc.merge.6, label %or.rhs.6
or.rhs.6:
  %rcc.tmp.70 = load i32, ptr %b
  %rcc.tmp.71 = load i32, ptr %e
  %rcc.tmp.72 = icmp eq i32 %rcc.tmp.70, %rcc.tmp.71
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.74 = phi i1 [1, %sc.merge.5], [%rcc.tmp.72, %or.rhs.6]
  br i1 %rcc.tmp.74, label %sc.merge.7, label %or.rhs.7
or.rhs.7:
  %rcc.tmp.76 = load i32, ptr %c
  %rcc.tmp.77 = load i32, ptr %d
  %rcc.tmp.78 = icmp eq i32 %rcc.tmp.76, %rcc.tmp.77
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.80 = phi i1 [1, %sc.merge.6], [%rcc.tmp.78, %or.rhs.7]
  br i1 %rcc.tmp.80, label %sc.merge.8, label %or.rhs.8
or.rhs.8:
  %rcc.tmp.82 = load i32, ptr %c
  %rcc.tmp.83 = load i32, ptr %e
  %rcc.tmp.84 = icmp eq i32 %rcc.tmp.82, %rcc.tmp.83
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.86 = phi i1 [1, %sc.merge.7], [%rcc.tmp.84, %or.rhs.8]
  br i1 %rcc.tmp.86, label %sc.merge.9, label %or.rhs.9
or.rhs.9:
  %rcc.tmp.88 = load i32, ptr %d
  %rcc.tmp.89 = load i32, ptr %e
  %rcc.tmp.90 = icmp eq i32 %rcc.tmp.88, %rcc.tmp.89
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.92 = phi i1 [1, %sc.merge.8], [%rcc.tmp.90, %or.rhs.9]
  br i1 %rcc.tmp.92, label %if.then, label %if.else
if.then:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %i
  br label %while.cond
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.99 = load i32, ptr %c
  %rcc.tmp.100 = icmp eq i32 %rcc.tmp.99, 1
  store i1 %rcc.tmp.100, ptr %cond1
  %rcc.tmp.102 = load i32, ptr %b
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.102, 2
  store i1 %rcc.tmp.103, ptr %cond2
  %rcc.tmp.105 = load i32, ptr %a
  %rcc.tmp.106 = icmp eq i32 %rcc.tmp.105, 5
  store i1 %rcc.tmp.106, ptr %cond3
  %rcc.tmp.108 = load i32, ptr %d
  %rcc.tmp.109 = icmp ne i32 %rcc.tmp.108, 1
  store i1 %rcc.tmp.109, ptr %cond4
  %rcc.tmp.111 = load i32, ptr %e
  %rcc.tmp.112 = icmp eq i32 %rcc.tmp.111, 4
  store i1 %rcc.tmp.112, ptr %cond5
  %rcc.tmp.114 = load i32, ptr %a
  %rcc.tmp.115 = icmp eq i32 %rcc.tmp.114, 3
  %rcc.tmp.116 = load i1, ptr %cond1
  %rcc.tmp.117 = icmp ne i1 %rcc.tmp.115, %rcc.tmp.116
  br i1 %rcc.tmp.117, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = add i32 %rcc.tmp.119, 1
  store i32 %rcc.tmp.120, ptr %i
  br label %while.cond
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.124 = load i32, ptr %b
  %rcc.tmp.125 = icmp eq i32 %rcc.tmp.124, 2
  %rcc.tmp.126 = load i1, ptr %cond2
  %rcc.tmp.127 = icmp ne i1 %rcc.tmp.125, %rcc.tmp.126
  br i1 %rcc.tmp.127, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %i
  br label %while.cond
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.134 = load i32, ptr %c
  %rcc.tmp.135 = icmp eq i32 %rcc.tmp.134, 4
  %rcc.tmp.136 = load i1, ptr %cond3
  %rcc.tmp.137 = icmp ne i1 %rcc.tmp.135, %rcc.tmp.136
  br i1 %rcc.tmp.137, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.139 = load i32, ptr %i
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  store i32 %rcc.tmp.140, ptr %i
  br label %while.cond
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.144 = load i32, ptr %d
  %rcc.tmp.145 = icmp eq i32 %rcc.tmp.144, 1
  %rcc.tmp.146 = load i1, ptr %cond4
  %rcc.tmp.147 = icmp ne i1 %rcc.tmp.145, %rcc.tmp.146
  br i1 %rcc.tmp.147, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %i
  br label %while.cond
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.154 = load i32, ptr %e
  %rcc.tmp.155 = icmp eq i32 %rcc.tmp.154, 3
  %rcc.tmp.156 = load i1, ptr %cond5
  %rcc.tmp.157 = icmp ne i1 %rcc.tmp.155, %rcc.tmp.156
  br i1 %rcc.tmp.157, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.159 = load i32, ptr %i
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.160, ptr %i
  br label %while.cond
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.164 = load i32, ptr %a
  %rcc.tmp.165 = mul i32 %rcc.tmp.164, 10000
  %rcc.tmp.166 = load i32, ptr %b
  %rcc.tmp.167 = mul i32 %rcc.tmp.166, 1000
  %rcc.tmp.168 = add i32 %rcc.tmp.165, %rcc.tmp.167
  %rcc.tmp.169 = load i32, ptr %c
  %rcc.tmp.170 = mul i32 %rcc.tmp.169, 100
  %rcc.tmp.171 = add i32 %rcc.tmp.168, %rcc.tmp.170
  %rcc.tmp.172 = load i32, ptr %d
  %rcc.tmp.173 = mul i32 %rcc.tmp.172, 10
  %rcc.tmp.174 = add i32 %rcc.tmp.171, %rcc.tmp.173
  %rcc.tmp.175 = load i32, ptr %e
  %rcc.tmp.176 = add i32 %rcc.tmp.174, %rcc.tmp.175
  ret i32 %rcc.tmp.176
while.end:
  %rcc.tmp.178 = sub i32 0, 1
  ret i32 %rcc.tmp.178
}
define i32 @run_control_flow_puzzle.() {
entry:
  %x = alloca i32 
  %y = alloca i32 
  %z = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %k.2 = alloca i32 
  %temp_val = alloca i32 
  %immutable_val = alloca i32 
  store i32 1, ptr %x
  store i32 1, ptr %y
  store i32 1, ptr %z
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 100
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %j
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 5
  br i1 %rcc.tmp.13, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 2
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %x
  %rcc.tmp.21 = load i32, ptr %y
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = srem i32 %rcc.tmp.21, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.20, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %x
  %rcc.tmp.27 = load i32, ptr %x
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.27, 100
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.32 = load i32, ptr %k
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 3
  br i1 %rcc.tmp.33, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.36 = load i32, ptr %y
  %rcc.tmp.37 = load i32, ptr %z
  %rcc.tmp.38 = load i32, ptr %k
  %rcc.tmp.39 = mul i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.36, %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %y
  %rcc.tmp.42 = load i32, ptr %k
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %k
  br label %while.cond.3
while.end.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.47 = load i32, ptr %y
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %y
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.52 = load i32, ptr %y
  %rcc.tmp.53 = load i32, ptr %x
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  %rcc.tmp.56 = srem i32 %rcc.tmp.53, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.52, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %y
  %rcc.tmp.59 = load i32, ptr %y
  %rcc.tmp.60 = icmp sgt i32 %rcc.tmp.59, 150
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  store i32 0, ptr %k.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.64 = load i32, ptr %k.2
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 4
  br i1 %rcc.tmp.65, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.68 = load i32, ptr %z
  %rcc.tmp.69 = load i32, ptr %x
  %rcc.tmp.70 = load i32, ptr %k.2
  %rcc.tmp.71 = mul i32 %rcc.tmp.69, %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.68, %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %z
  %rcc.tmp.74 = load i32, ptr %z
  %rcc.tmp.75 = srem i32 %rcc.tmp.74, 3
  %rcc.tmp.76 = icmp eq i32 %rcc.tmp.75, 0
  br i1 %rcc.tmp.76, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.78 = load i32, ptr %x
  %rcc.tmp.79 = load i32, ptr %k.2
  %rcc.tmp.80 = sub i32 %rcc.tmp.78, %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %x
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.84 = load i32, ptr %k.2
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %k.2
  br label %while.cond.4
while.end.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.91 = load i32, ptr %j
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 1
  store i32 %rcc.tmp.92, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = srem i32 %rcc.tmp.95, 10
  %rcc.tmp.97 = icmp eq i32 %rcc.tmp.96, 0
  br i1 %rcc.tmp.97, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.99 = load i32, ptr %x
  %rcc.tmp.100 = load i32, ptr %y
  %rcc.tmp.101 = add i32 %rcc.tmp.99, %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %z
  %rcc.tmp.103 = add i32 %rcc.tmp.101, %rcc.tmp.102
  store i32 %rcc.tmp.103, ptr %temp_val
  %rcc.tmp.105 = load i32, ptr %temp_val
  %rcc.tmp.106 = srem i32 %rcc.tmp.105, 7
  %rcc.tmp.107 = icmp eq i32 %rcc.tmp.106, 0
  br i1 %rcc.tmp.107, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.109 = load i32, ptr %i
  store i32 %rcc.tmp.109, ptr %immutable_val
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = icmp sgt i32 %rcc.tmp.111, 50
  br i1 %rcc.tmp.112, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %immutable_val
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.119 = load i32, ptr %z
  %rcc.tmp.120 = load i32, ptr %immutable_val
  %rcc.tmp.121 = add i32 %rcc.tmp.119, %rcc.tmp.120
  store i32 %rcc.tmp.121, ptr %z
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 1
  store i32 %rcc.tmp.128, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.131 = load i32, ptr %x
  %rcc.tmp.132 = load i32, ptr %y
  %rcc.tmp.133 = add i32 %rcc.tmp.131, %rcc.tmp.132
  %rcc.tmp.134 = load i32, ptr %z
  %rcc.tmp.135 = add i32 %rcc.tmp.133, %rcc.tmp.134
  ret i32 %rcc.tmp.135
}
define void @another_puzzle.() {
entry:
  %state = alloca i32 
  %counter = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %j.2 = alloca i32 
  store i32 0, ptr %state
  store i32 0, ptr %counter
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 500
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %counter
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %counter
  %rcc.tmp.12 = load i32, ptr %state
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 3
  %rcc.tmp.15 = add i32 %rcc.tmp.12, %rcc.tmp.14
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 17
  store i32 %rcc.tmp.16, ptr %state
  %rcc.tmp.18 = load i32, ptr %state
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 5
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.23 = load i32, ptr %j
  %rcc.tmp.24 = load i32, ptr %state
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.28 = load i32, ptr %counter
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %counter
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge
if.else:
  %rcc.tmp.37 = load i32, ptr %state
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 12
  br i1 %rcc.tmp.38, label %if.then.2, label %if.else.2
if.then.2:
  store i32 10, ptr %j.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.42 = load i32, ptr %j.2
  %rcc.tmp.43 = load i32, ptr %state
  %rcc.tmp.44 = icmp sgt i32 %rcc.tmp.42, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.47 = load i32, ptr %counter
  %rcc.tmp.48 = load i32, ptr %j.2
  %rcc.tmp.49 = sub i32 %rcc.tmp.47, %rcc.tmp.48
  store i32 %rcc.tmp.49, ptr %counter
  %rcc.tmp.51 = load i32, ptr %j.2
  %rcc.tmp.52 = sub i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %j.2
  br label %while.cond.3
while.end.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.56 = load i32, ptr %counter
  %rcc.tmp.57 = mul i32 %rcc.tmp.56, 2
  store i32 %rcc.tmp.57, ptr %counter
  %rcc.tmp.59 = load i32, ptr %counter
  %rcc.tmp.60 = icmp sgt i32 %rcc.tmp.59, 10000
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.62 = load i32, ptr %counter
  %rcc.tmp.63 = sdiv i32 %rcc.tmp.62, 3
  store i32 %rcc.tmp.63, ptr %counter
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.73 = load i32, ptr %counter
  call void @printlnInt.(i32 %rcc.tmp.73)
  ret void
}
define void @yet_another_control_flow.() {
entry:
  %a = alloca i32 
  %b = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %temp = alloca i32 
  store i32 1, ptr %a
  store i32 1, ptr %b
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 10
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %j
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 10
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.17 = load i32, ptr %k
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 10
  br i1 %rcc.tmp.18, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 2
  %rcc.tmp.24 = add i32 %rcc.tmp.21, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %k
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 3
  %rcc.tmp.27 = add i32 %rcc.tmp.24, %rcc.tmp.26
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 5
  %rcc.tmp.29 = icmp eq i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %a
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %a
  br label %if.merge
if.else:
  %rcc.tmp.35 = load i32, ptr %b
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %b
  br label %if.merge
if.merge:
  %rcc.tmp.39 = load i32, ptr %a
  %rcc.tmp.40 = load i32, ptr %b
  %rcc.tmp.41 = icmp sgt i32 %rcc.tmp.39, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.43 = load i32, ptr %a
  store i32 %rcc.tmp.43, ptr %temp
  %rcc.tmp.45 = load i32, ptr %b
  store i32 %rcc.tmp.45, ptr %a
  %rcc.tmp.47 = load i32, ptr %temp
  store i32 %rcc.tmp.47, ptr %b
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.51 = load i32, ptr %k
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.63 = load i32, ptr %a
  %rcc.tmp.64 = mul i32 %rcc.tmp.63, 1000
  %rcc.tmp.65 = load i32, ptr %b
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  call void @printlnInt.(i32 %rcc.tmp.66)
  ret void
}
