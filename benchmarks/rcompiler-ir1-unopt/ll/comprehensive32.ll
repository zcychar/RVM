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
  %text = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %pattern1 = alloca [64 x i32] 
  %fill.idx.2 = alloca i32 
  %pattern1_len = alloca i32 
  %pattern2 = alloca [64 x i32] 
  %fill.idx.3 = alloca i32 
  %pattern2_len = alloca i32 
  %pattern3 = alloca [64 x i32] 
  %fill.idx.4 = alloca i32 
  %pattern3_len = alloca i32 
  %count1 = alloca i32 
  %count2 = alloca i32 
  %count3 = alloca i32 
  %result = alloca i32 
  %error_res = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1024
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %text, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @generate_text.([1024 x i32]* %text, i32 12345)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 64
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [64 x i32], ptr %pattern1, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 3, ptr %pattern1_len
  %rcc.tmp.25 = getelementptr [64 x i32], ptr %pattern1, i32 0, i32 0
  store i32 65, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [64 x i32], ptr %pattern1, i32 0, i32 1
  store i32 66, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [64 x i32], ptr %pattern1, i32 0, i32 2
  store i32 67, ptr %rcc.tmp.29
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.33 = load i32, ptr %fill.idx.3
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 64
  br i1 %rcc.tmp.34, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.36 = load i32, ptr %fill.idx.3
  %rcc.tmp.37 = getelementptr [64 x i32], ptr %pattern2, i32 0, i32 %rcc.tmp.36
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.39, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 5, ptr %pattern2_len
  %rcc.tmp.43 = getelementptr [64 x i32], ptr %pattern2, i32 0, i32 0
  store i32 88, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [64 x i32], ptr %pattern2, i32 0, i32 1
  store i32 89, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [64 x i32], ptr %pattern2, i32 0, i32 2
  store i32 90, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [64 x i32], ptr %pattern2, i32 0, i32 3
  store i32 88, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [64 x i32], ptr %pattern2, i32 0, i32 4
  store i32 89, ptr %rcc.tmp.51
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.55 = load i32, ptr %fill.idx.4
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 64
  br i1 %rcc.tmp.56, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.58 = load i32, ptr %fill.idx.4
  %rcc.tmp.59 = getelementptr [64 x i32], ptr %pattern3, i32 0, i32 %rcc.tmp.58
  store i32 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.61, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 2, ptr %pattern3_len
  %rcc.tmp.65 = getelementptr [64 x i32], ptr %pattern3, i32 0, i32 0
  store i32 100, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [64 x i32], ptr %pattern3, i32 0, i32 1
  store i32 100, ptr %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %pattern1_len
  %rcc.tmp.70 = call i32 @find_pattern.([1024 x i32]* %text, [64 x i32]* %pattern1, i32 %rcc.tmp.69)
  store i32 %rcc.tmp.70, ptr %count1
  %rcc.tmp.72 = load i32, ptr %count1
  call void @printlnInt.(i32 %rcc.tmp.72)
  %rcc.tmp.74 = load i32, ptr %pattern2_len
  %rcc.tmp.75 = call i32 @find_pattern_with_wildcard.([1024 x i32]* %text, [64 x i32]* %pattern2, i32 %rcc.tmp.74, i32 90)
  store i32 %rcc.tmp.75, ptr %count2
  %rcc.tmp.77 = load i32, ptr %count2
  call void @printlnInt.(i32 %rcc.tmp.77)
  %rcc.tmp.79 = call i32 @find_complex_pattern.([1024 x i32]* %text)
  store i32 %rcc.tmp.79, ptr %count3
  %rcc.tmp.81 = load i32, ptr %count3
  call void @printlnInt.(i32 %rcc.tmp.81)
  %rcc.tmp.83 = call i32 @analyze_text_frequency.([1024 x i32]* %text)
  store i32 %rcc.tmp.83, ptr %result
  %rcc.tmp.85 = load i32, ptr %result
  call void @printlnInt.(i32 %rcc.tmp.85)
  %rcc.tmp.87 = load i32, ptr %pattern1_len
  %rcc.tmp.88 = call i32 @trigger_error_path.([1024 x i32]* %text, [64 x i32]* %pattern1, i32 %rcc.tmp.87)
  store i32 %rcc.tmp.88, ptr %error_res
  %rcc.tmp.90 = load i32, ptr %error_res
  call void @printlnInt.(i32 %rcc.tmp.90)
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @generate_text.([1024 x i32]* %text.tmp, i32 %seed.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %seed..tmp = alloca i32 
  %current_seed = alloca i32 
  %i = alloca i32 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store i32 %seed.tmp, ptr %seed..tmp
  %rcc.tmp.3 = load i32, ptr %seed..tmp
  store i32 %rcc.tmp.3, ptr %current_seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 1024
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %current_seed
  %rcc.tmp.12 = call i32 @pm_rand_update.(i32 %rcc.tmp.11)
  %rcc.tmp.13 = sdiv i32 %rcc.tmp.12, 65536
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 32768
  store i32 %rcc.tmp.14, ptr %current_seed
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.19 = getelementptr [1024 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %current_seed
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 26
  %rcc.tmp.22 = add i32 65, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %rcc.tmp.19
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 10
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.31 = getelementptr [1024 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = sdiv i32 %rcc.tmp.32, 100
  %rcc.tmp.34 = add i32 65, %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.31
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 27
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.39, 0
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.45 = getelementptr [1024 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  store i32 66, ptr %rcc.tmp.45
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 42
  %rcc.tmp.51 = icmp eq i32 %rcc.tmp.50, 0
  br i1 %rcc.tmp.51, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.56 = getelementptr [1024 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  store i32 67, ptr %rcc.tmp.56
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @find_pattern.([1024 x i32]* %text.tmp, [64 x i32]* %pattern.tmp, i32 %p_len.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %pattern..tmp = alloca [64 x i32]* 
  %p_len..tmp = alloca i32 
  %count = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %found = alloca i1 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store [64 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %p_len.tmp, ptr %p_len..tmp
  store i32 0, ptr %count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %p_len..tmp
  %rcc.tmp.9 = sub i32 1024, %rcc.tmp.8
  %rcc.tmp.10 = icmp sle i32 %rcc.tmp.7, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i1 1, ptr %found
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = load i32, ptr %p_len..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.26 = getelementptr [1024 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [64 x i32]*, ptr %pattern..tmp
  %rcc.tmp.31 = getelementptr [64 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp ne i32 %rcc.tmp.27, %rcc.tmp.32
  br i1 %rcc.tmp.33, label %if.then, label %if.else
if.then:
  store i1 0, ptr %found
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.42 = load i1, ptr %found
  br i1 %rcc.tmp.42, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.44 = load i32, ptr %count
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.53 = load i32, ptr %count
  ret i32 %rcc.tmp.53
}
define i32 @find_pattern_with_wildcard.([1024 x i32]* %text.tmp, [64 x i32]* %pattern.tmp, i32 %p_len.tmp, i32 %wildcard.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %pattern..tmp = alloca [64 x i32]* 
  %p_len..tmp = alloca i32 
  %wildcard..tmp = alloca i32 
  %count = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %found = alloca i1 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store [64 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %p_len.tmp, ptr %p_len..tmp
  store i32 %wildcard.tmp, ptr %wildcard..tmp
  store i32 0, ptr %count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %p_len..tmp
  %rcc.tmp.10 = sub i32 1024, %rcc.tmp.9
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.8, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i1 1, ptr %found
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.17 = load i32, ptr %j
  %rcc.tmp.18 = load i32, ptr %p_len..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [64 x i32]*, ptr %pattern..tmp
  %rcc.tmp.25 = getelementptr [64 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %wildcard..tmp
  %rcc.tmp.28 = icmp ne i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %j
  %rcc.tmp.32 = add i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.35 = getelementptr [1024 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [64 x i32]*, ptr %pattern..tmp
  %rcc.tmp.40 = getelementptr [64 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.36, %rcc.tmp.41
  br label %sc.merge
sc.merge:
  %rcc.tmp.44 = phi i1 [0, %while.body.2], [%rcc.tmp.42, %and.rhs]
  br i1 %rcc.tmp.44, label %if.then, label %if.else
if.then:
  store i1 0, ptr %found
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.49 = load i32, ptr %j
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.53 = load i1, ptr %found
  br i1 %rcc.tmp.53, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.55 = load i32, ptr %count
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.64 = load i32, ptr %count
  ret i32 %rcc.tmp.64
}
define i32 @find_complex_pattern.([1024 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %count = alloca i32 
  %i = alloca i32 
  %sum = alloca i32 
  %k = alloca i32 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = sub i32 1024, 5
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.13 = getelementptr [1024 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 3
  %rcc.tmp.18 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.19 = getelementptr [1024 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.14, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.27 = getelementptr [1024 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 4
  %rcc.tmp.32 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.33 = getelementptr [1024 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.28, %rcc.tmp.34
  br label %sc.merge
sc.merge:
  %rcc.tmp.37 = phi i1 [0, %while.body], [%rcc.tmp.35, %and.rhs]
  br i1 %rcc.tmp.37, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.42 = getelementptr [1024 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 2
  %rcc.tmp.47 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.48 = getelementptr [1024 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.49
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.52 = phi i1 [0, %sc.merge], [%rcc.tmp.50, %and.rhs.2]
  br i1 %rcc.tmp.52, label %if.then, label %if.else
if.then:
  store i32 0, ptr %sum
  store i32 0, ptr %k
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.57 = load i32, ptr %k
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 5
  br i1 %rcc.tmp.58, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.61 = load i32, ptr %sum
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = load i32, ptr %k
  %rcc.tmp.64 = add i32 %rcc.tmp.62, %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.67 = getelementptr [1024 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.61, %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %sum
  %rcc.tmp.71 = load i32, ptr %k
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %k
  br label %while.cond.2
while.end.2:
  %rcc.tmp.75 = load i32, ptr %sum
  %rcc.tmp.76 = icmp sgt i32 %rcc.tmp.75, 350
  br i1 %rcc.tmp.76, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.78 = load i32, ptr %count
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.89 = load i32, ptr %count
  ret i32 %rcc.tmp.89
}
define i32 @analyze_text_frequency.([1024 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %freq = alloca [26 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %char_code = alloca i32 
  %max_freq = alloca i32 
  %max_char = alloca i32 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 26
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [26 x i32], ptr %freq, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 1024
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.22 = getelementptr [1024 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %char_code
  %rcc.tmp.25 = load i32, ptr %char_code
  %rcc.tmp.26 = icmp sge i32 %rcc.tmp.25, 65
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %char_code
  %rcc.tmp.29 = icmp sle i32 %rcc.tmp.28, 90
  br label %sc.merge
sc.merge:
  %rcc.tmp.31 = phi i1 [0, %while.body], [%rcc.tmp.29, %and.rhs]
  br i1 %rcc.tmp.31, label %if.then, label %if.else
if.then:
  %rcc.tmp.33 = load i32, ptr %char_code
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = sub i32 %rcc.tmp.34, 65
  %rcc.tmp.36 = getelementptr [26 x i32], ptr %freq, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %char_code
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = sub i32 %rcc.tmp.38, 65
  %rcc.tmp.40 = getelementptr [26 x i32], ptr %freq, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %rcc.tmp.36
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %max_freq
  %rcc.tmp.51 = sub i32 0, 1
  store i32 %rcc.tmp.51, ptr %max_char
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 26
  br i1 %rcc.tmp.56, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = getelementptr [26 x i32], ptr %freq, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %max_freq
  %rcc.tmp.64 = icmp sgt i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [26 x i32], ptr %freq, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  store i32 %rcc.tmp.69, ptr %max_freq
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 65
  store i32 %rcc.tmp.72, ptr %max_char
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.76 = load i32, ptr %i
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.80 = load i32, ptr %max_char
  %rcc.tmp.81 = mul i32 %rcc.tmp.80, 1000
  %rcc.tmp.82 = load i32, ptr %max_freq
  %rcc.tmp.83 = add i32 %rcc.tmp.81, %rcc.tmp.82
  ret i32 %rcc.tmp.83
}
define i32 @state_machine_search.([1024 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %state = alloca i32 
  %count = alloca i32 
  %i = alloca i32 
  %current_char = alloca i32 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %state
  store i32 0, ptr %count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 1024
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.13 = getelementptr [1024 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.14, ptr %current_char
  %rcc.tmp.16 = load i32, ptr %state
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %current_char
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 65
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  store i32 1, ptr %state
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.26 = load i32, ptr %state
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.26, 1
  br i1 %rcc.tmp.27, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.29 = load i32, ptr %current_char
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, 66
  br i1 %rcc.tmp.30, label %if.then.4, label %if.else.4
if.then.4:
  store i32 2, ptr %state
  br label %if.merge.4
if.else.4:
  %rcc.tmp.34 = load i32, ptr %current_char
  %rcc.tmp.35 = icmp ne i32 %rcc.tmp.34, 65
  br i1 %rcc.tmp.35, label %if.then.5, label %if.else.5
if.then.5:
  store i32 0, ptr %state
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.42 = load i32, ptr %state
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.42, 2
  br i1 %rcc.tmp.43, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.45 = load i32, ptr %current_char
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.45, 67
  br i1 %rcc.tmp.46, label %if.then.7, label %if.else.7
if.then.7:
  store i32 3, ptr %state
  br label %if.merge.7
if.else.7:
  %rcc.tmp.50 = load i32, ptr %current_char
  %rcc.tmp.51 = icmp eq i32 %rcc.tmp.50, 65
  br i1 %rcc.tmp.51, label %if.then.8, label %if.else.8
if.then.8:
  store i32 1, ptr %state
  br label %if.merge.8
if.else.8:
  store i32 0, ptr %state
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  %rcc.tmp.59 = load i32, ptr %state
  %rcc.tmp.60 = icmp eq i32 %rcc.tmp.59, 3
  br i1 %rcc.tmp.60, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.62 = load i32, ptr %count
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %count
  %rcc.tmp.65 = load i32, ptr %current_char
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.65, 65
  br i1 %rcc.tmp.66, label %if.then.10, label %if.else.10
if.then.10:
  store i32 1, ptr %state
  br label %if.merge.10
if.else.10:
  store i32 0, ptr %state
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.81 = load i32, ptr %count
  ret i32 %rcc.tmp.81
}
define i32 @trigger_error_path.([1024 x i32]* %text.tmp, [64 x i32]* %pattern.tmp, i32 %p_len.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %pattern..tmp = alloca [64 x i32]* 
  %p_len..tmp = alloca i32 
  %local_text = alloca [1024 x i32] 
  %i = alloca i32 
  %count = alloca i32 
  %j = alloca i32 
  %match_score = alloca i32 
  %is_prime = alloca i1 
  %k = alloca i32 
  %another_val = alloca i32 
  %final_result = alloca i32 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store [64 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %p_len.tmp, ptr %p_len..tmp
  %rcc.tmp.4 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.5 = bitcast [1024 x i32]* %local_text to i8*
  %rcc.tmp.6 = bitcast [1024 x i32]* %rcc.tmp.4 to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.5, i8* %rcc.tmp.6, i32 4096, i1 0)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 1024
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [1024 x i32], ptr %local_text, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [1024 x i32], ptr %local_text, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 10
  %rcc.tmp.23 = add i32 %rcc.tmp.20, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.16
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %count
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %p_len..tmp
  %rcc.tmp.34 = sub i32 1024, %rcc.tmp.33
  %rcc.tmp.35 = icmp sle i32 %rcc.tmp.32, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  store i32 0, ptr %match_score
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.41 = load i32, ptr %j
  %rcc.tmp.42 = load i32, ptr %p_len..tmp
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [1024 x i32], ptr %local_text, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [64 x i32]*, ptr %pattern..tmp
  %rcc.tmp.55 = getelementptr [64 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp eq i32 %rcc.tmp.51, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %if.then, label %if.else
if.then:
  %rcc.tmp.59 = load i32, ptr %match_score
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %match_score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.68 = load i32, ptr %match_score
  %rcc.tmp.69 = icmp sgt i32 %rcc.tmp.68, 0
  br i1 %rcc.tmp.69, label %if.then.2, label %if.else.2
if.then.2:
  store i1 1, ptr %is_prime
  %rcc.tmp.72 = load i32, ptr %match_score
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.72, 2
  br i1 %rcc.tmp.73, label %if.then.3, label %if.else.3
if.then.3:
  store i1 0, ptr %is_prime
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  store i32 2, ptr %k
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.80 = load i32, ptr %k
  %rcc.tmp.81 = load i32, ptr %k
  %rcc.tmp.82 = mul i32 %rcc.tmp.80, %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %match_score
  %rcc.tmp.84 = icmp sle i32 %rcc.tmp.82, %rcc.tmp.83
  br i1 %rcc.tmp.84, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.87 = load i32, ptr %match_score
  %rcc.tmp.88 = load i32, ptr %k
  %rcc.tmp.89 = srem i32 %rcc.tmp.87, %rcc.tmp.88
  %rcc.tmp.90 = icmp eq i32 %rcc.tmp.89, 0
  br i1 %rcc.tmp.90, label %if.then.4, label %if.else.4
if.then.4:
  store i1 0, ptr %is_prime
  br label %while.linker.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.95 = load i32, ptr %k
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %k
  br label %while.cond.4
while.end.4:
  %rcc.tmp.99 = load i1, ptr %is_prime
  br i1 %rcc.tmp.99, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.101 = load i32, ptr %count
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %count
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %another_val
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = icmp slt i32 %rcc.tmp.115, 100
  br i1 %rcc.tmp.116, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.119 = load i32, ptr %i
  %rcc.tmp.120 = srem i32 %rcc.tmp.119, 3
  %rcc.tmp.121 = icmp eq i32 %rcc.tmp.120, 0
  br i1 %rcc.tmp.121, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.123 = load i32, ptr %another_val
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.127 = getelementptr [1024 x i32], ptr %rcc.tmp.126, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  %rcc.tmp.129 = add i32 %rcc.tmp.123, %rcc.tmp.128
  store i32 %rcc.tmp.129, ptr %another_val
  br label %if.merge.6
if.else.6:
  %rcc.tmp.132 = load i32, ptr %another_val
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.136 = getelementptr [1024 x i32], ptr %rcc.tmp.135, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.136
  %rcc.tmp.138 = sub i32 %rcc.tmp.132, %rcc.tmp.137
  store i32 %rcc.tmp.138, ptr %another_val
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 1
  store i32 %rcc.tmp.142, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.145 = load i32, ptr %count
  %rcc.tmp.146 = load i32, ptr %another_val
  %rcc.tmp.147 = add i32 %rcc.tmp.145, %rcc.tmp.146
  store i32 %rcc.tmp.147, ptr %final_result
  %rcc.tmp.149 = load i32, ptr %final_result
  %rcc.tmp.150 = icmp sgt i32 %rcc.tmp.149, 1000
  br i1 %rcc.tmp.150, label %if.then.7, label %if.else.7
if.then.7:
  ret i32 0
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.154 = load i32, ptr %final_result
  ret i32 %rcc.tmp.154
}
define void @another_level_of_search.([1024 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1024 x i32]* 
  %pattern = alloca [64 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %pos = alloca i32 
  %found = alloca i1 
  %j = alloca i32 
  store [1024 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 64
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [64 x i32], ptr %pattern, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 64
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [64 x i32], ptr %pattern, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 5
  %rcc.tmp.24 = add i32 70, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %rcc.tmp.21
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.30 = sub i32 0, 1
  store i32 %rcc.tmp.30, ptr %pos
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = sub i32 1024, 64
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i1 1, ptr %found
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.42 = load i32, ptr %j
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 64
  br i1 %rcc.tmp.43, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [1024 x i32]*, ptr %text..tmp
  %rcc.tmp.51 = getelementptr [1024 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %j
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = getelementptr [64 x i32], ptr %pattern, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp ne i32 %rcc.tmp.52, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %if.then, label %if.else
if.then:
  store i1 0, ptr %found
  br label %while.linker.3
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.62 = load i32, ptr %j
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.66 = load i1, ptr %found
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = load i32, ptr %i
  store i32 %rcc.tmp.68, ptr %pos
  br label %while.linker.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.76 = load i32, ptr %pos
  call void @printlnInt.(i32 %rcc.tmp.76)
  ret void
}
define void @yet_another_search_function.() {
entry:
  %text = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %result1 = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1024
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %text, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @generate_text.([1024 x i32]* %text, i32 54321)
  %rcc.tmp.13 = call i32 @state_machine_search.([1024 x i32]* %text)
  store i32 %rcc.tmp.13, ptr %result1
  call void @another_level_of_search.([1024 x i32]* %text)
  %rcc.tmp.16 = load i32, ptr %result1
  call void @printlnInt.(i32 %rcc.tmp.16)
  ret void
}
