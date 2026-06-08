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
  call void @printlnInt.(i32 1100)
  call void @testBooleanExpressionOptimization.()
  call void @testBooleanArrayOperations.()
  call void @testLogicalAlgorithms.()
  call void @testBooleanSearchAndFilter.()
  call void @testBooleanStateMachine.()
  call void @printlnInt.(i32 1199)
  call void @exit.(i32 0)
  ret void
}
define void @testBooleanExpressionOptimization.() {
entry:
  %result_count = alloca i32 
  %i = alloca i32 
  %a = alloca i1 
  %b = alloca i1 
  %c = alloca i1 
  %d = alloca i1 
  %complex_result = alloca i1 
  call void @printlnInt.(i32 1101)
  store i32 0, ptr %result_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 10000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 2
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  store i1 %rcc.tmp.11, ptr %a
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 3
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  store i1 %rcc.tmp.15, ptr %b
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 5
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 0
  store i1 %rcc.tmp.19, ptr %c
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 7
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 0
  store i1 %rcc.tmp.23, ptr %d
  %rcc.tmp.25 = load i1, ptr %a
  br i1 %rcc.tmp.25, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.27 = load i1, ptr %b
  br label %sc.merge
sc.merge:
  %rcc.tmp.29 = phi i1 [0, %while.body], [%rcc.tmp.27, %and.rhs]
  br i1 %rcc.tmp.29, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.31 = load i1, ptr %c
  br i1 %rcc.tmp.31, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.33 = load i1, ptr %d
  %rcc.tmp.34 = xor i1 %rcc.tmp.33, true
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.36 = phi i1 [0, %or.rhs], [%rcc.tmp.34, %and.rhs.2]
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.38 = phi i1 [1, %sc.merge], [%rcc.tmp.36, %sc.merge.3]
  br i1 %rcc.tmp.38, label %sc.merge.4, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.40 = load i1, ptr %a
  %rcc.tmp.41 = xor i1 %rcc.tmp.40, true
  br i1 %rcc.tmp.41, label %and.rhs.3, label %sc.merge.5
and.rhs.3:
  %rcc.tmp.43 = load i1, ptr %b
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.45 = phi i1 [0, %or.rhs.2], [%rcc.tmp.43, %and.rhs.3]
  br i1 %rcc.tmp.45, label %and.rhs.4, label %sc.merge.6
and.rhs.4:
  %rcc.tmp.47 = load i1, ptr %c
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.49 = phi i1 [0, %sc.merge.5], [%rcc.tmp.47, %and.rhs.4]
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.51 = phi i1 [1, %sc.merge.2], [%rcc.tmp.49, %sc.merge.6]
  br i1 %rcc.tmp.51, label %sc.merge.7, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.53 = load i1, ptr %a
  br i1 %rcc.tmp.53, label %and.rhs.5, label %sc.merge.8
and.rhs.5:
  %rcc.tmp.55 = load i1, ptr %b
  %rcc.tmp.56 = xor i1 %rcc.tmp.55, true
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.58 = phi i1 [0, %or.rhs.3], [%rcc.tmp.56, %and.rhs.5]
  br i1 %rcc.tmp.58, label %and.rhs.6, label %sc.merge.9
and.rhs.6:
  %rcc.tmp.60 = load i1, ptr %c
  %rcc.tmp.61 = xor i1 %rcc.tmp.60, true
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.63 = phi i1 [0, %sc.merge.8], [%rcc.tmp.61, %and.rhs.6]
  br i1 %rcc.tmp.63, label %and.rhs.7, label %sc.merge.10
and.rhs.7:
  %rcc.tmp.65 = load i1, ptr %d
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.67 = phi i1 [0, %sc.merge.9], [%rcc.tmp.65, %and.rhs.7]
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.69 = phi i1 [1, %sc.merge.4], [%rcc.tmp.67, %sc.merge.10]
  store i1 %rcc.tmp.69, ptr %complex_result
  %rcc.tmp.71 = load i1, ptr %complex_result
  br i1 %rcc.tmp.71, label %if.then, label %if.else
if.then:
  %rcc.tmp.73 = load i32, ptr %result_count
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %result_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = call i1 @evaluateComplexCondition.(i32 %rcc.tmp.78)
  br i1 %rcc.tmp.79, label %and.rhs.8, label %sc.merge.11
and.rhs.8:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = srem i32 %rcc.tmp.81, 100
  %rcc.tmp.83 = icmp eq i32 %rcc.tmp.82, 0
  br label %sc.merge.11
sc.merge.11:
  %rcc.tmp.85 = phi i1 [0, %if.merge], [%rcc.tmp.83, %and.rhs.8]
  br i1 %rcc.tmp.85, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.87 = load i32, ptr %result_count
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 2
  store i32 %rcc.tmp.88, ptr %result_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.96 = load i32, ptr %result_count
  call void @printlnInt.(i32 %rcc.tmp.96)
  call void @printlnInt.(i32 1102)
  ret void
}
define i1 @evaluateComplexCondition.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  %condition1 = alloca i1 
  %condition2 = alloca i1 
  %condition3 = alloca i1 
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.2 = load i32, ptr %value..tmp
  %rcc.tmp.3 = call i1 @isPrime.(i32 %rcc.tmp.2)
  store i1 %rcc.tmp.3, ptr %condition1
  %rcc.tmp.5 = load i32, ptr %value..tmp
  %rcc.tmp.6 = srem i32 %rcc.tmp.5, 4
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  store i1 %rcc.tmp.7, ptr %condition2
  %rcc.tmp.9 = load i32, ptr %value..tmp
  %rcc.tmp.10 = icmp sgt i32 %rcc.tmp.9, 100
  br i1 %rcc.tmp.10, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.12 = load i32, ptr %value..tmp
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 9900
  br label %sc.merge
sc.merge:
  %rcc.tmp.15 = phi i1 [0, %entry], [%rcc.tmp.13, %and.rhs]
  store i1 %rcc.tmp.15, ptr %condition3
  %rcc.tmp.17 = load i1, ptr %condition1
  br i1 %rcc.tmp.17, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.19 = load i1, ptr %condition2
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.21 = phi i1 [1, %sc.merge], [%rcc.tmp.19, %or.rhs]
  br i1 %rcc.tmp.21, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.23 = load i1, ptr %condition3
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.25 = phi i1 [0, %sc.merge.2], [%rcc.tmp.23, %and.rhs.2]
  ret i1 %rcc.tmp.25
}
define void @testBooleanArrayOperations.() {
entry:
  %bool_grid = alloca [10000 x i1] 
  %fill.idx = alloca i32 
  %pattern_count = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %index = alloca i32 
  call void @printlnInt.(i32 1103)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 10000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [10000 x i1], ptr %bool_grid, i32 0, i32 %rcc.tmp.7
  store i1 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %pattern_count
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %row
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 100
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.22 = load i32, ptr %col
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.22, 100
  br i1 %rcc.tmp.23, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.26 = load i32, ptr %row
  %rcc.tmp.27 = mul i32 %rcc.tmp.26, 100
  %rcc.tmp.28 = load i32, ptr %col
  %rcc.tmp.29 = add i32 %rcc.tmp.27, %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %index
  %rcc.tmp.31 = load i32, ptr %index
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = getelementptr [10000 x i1], ptr %bool_grid, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %row
  %rcc.tmp.35 = load i32, ptr %col
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 2
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.37, 0
  br i1 %rcc.tmp.38, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.40 = load i32, ptr %row
  %rcc.tmp.41 = srem i32 %rcc.tmp.40, 3
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.41, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.44 = phi i1 [0, %while.body.2], [%rcc.tmp.42, %and.rhs]
  store i1 %rcc.tmp.44, ptr %rcc.tmp.33
  %rcc.tmp.46 = load i32, ptr %col
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.50 = load i32, ptr %row
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %row
  br label %while.cond
while.end:
  call void @performBooleanGridOperations.([10000 x i1]* %bool_grid, i32* %pattern_count)
  %rcc.tmp.55 = load i32, ptr %pattern_count
  %rcc.tmp.56 = call i32 @countBooleanPatterns.([10000 x i1]* %bool_grid)
  %rcc.tmp.57 = add i32 %rcc.tmp.55, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %pattern_count
  %rcc.tmp.59 = load i32, ptr %pattern_count
  call void @printlnInt.(i32 %rcc.tmp.59)
  call void @printlnInt.(i32 1104)
  ret void
}
define void @performBooleanGridOperations.([10000 x i1]* %grid.tmp, i32* %pattern_count.tmp) {
entry:
  %grid..tmp = alloca [10000 x i1]* 
  %pattern_count..tmp = alloca i32* 
  %operations = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  %index = alloca i32 
  %neighbor_count = alloca i32 
  store [10000 x i1]* %grid.tmp, ptr %grid..tmp
  store i32* %pattern_count.tmp, ptr %pattern_count..tmp
  store i32 0, ptr %operations
  store i32 1, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %row
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 99
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %col
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 99
  br i1 %rcc.tmp.13, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.16 = load i32, ptr %row
  %rcc.tmp.17 = mul i32 %rcc.tmp.16, 100
  %rcc.tmp.18 = load i32, ptr %col
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %index
  %rcc.tmp.21 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.22 = load i32, ptr %row
  %rcc.tmp.23 = load i32, ptr %col
  %rcc.tmp.24 = call i32 @countBooleanNeighbors.([10000 x i1]* %rcc.tmp.21, i32 %rcc.tmp.22, i32 %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %neighbor_count
  %rcc.tmp.26 = load i32, ptr %index
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.29 = getelementptr [10000 x i1], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i1, ptr %rcc.tmp.29
  br i1 %rcc.tmp.30, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.32 = load i32, ptr %neighbor_count
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 2
  br i1 %rcc.tmp.33, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.35 = load i32, ptr %neighbor_count
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.35, 3
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.38 = phi i1 [1, %and.rhs], [%rcc.tmp.36, %or.rhs]
  br label %sc.merge
sc.merge:
  %rcc.tmp.40 = phi i1 [0, %while.body.2], [%rcc.tmp.38, %sc.merge.2]
  br i1 %rcc.tmp.40, label %if.then, label %if.else
if.then:
  %rcc.tmp.42 = load i32, ptr %index
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.45 = getelementptr [10000 x i1], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  store i1 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %operations
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %operations
  br label %if.merge
if.else:
  %rcc.tmp.51 = load i32, ptr %index
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.54 = getelementptr [10000 x i1], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = load i1, ptr %rcc.tmp.54
  %rcc.tmp.56 = xor i1 %rcc.tmp.55, true
  br i1 %rcc.tmp.56, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.58 = load i32, ptr %neighbor_count
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 3
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.61 = phi i1 [0, %if.else], [%rcc.tmp.59, %and.rhs.2]
  br i1 %rcc.tmp.61, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.63 = load i32, ptr %index
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.66 = getelementptr [10000 x i1], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  store i1 1, ptr %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %operations
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %operations
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.74 = load i32, ptr %col
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.78 = load i32, ptr %row
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %row
  br label %while.cond
while.end:
  %rcc.tmp.82 = load i32*, ptr %pattern_count..tmp
  %rcc.tmp.83 = load i32*, ptr %pattern_count..tmp
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %operations
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  store i32 %rcc.tmp.86, ptr %rcc.tmp.82
  ret void
}
define i32 @countBooleanNeighbors.([10000 x i1]* %grid.tmp, i32 %row.tmp, i32 %col.tmp) {
entry:
  %grid..tmp = alloca [10000 x i1]* 
  %row..tmp = alloca i32 
  %col..tmp = alloca i32 
  %count = alloca i32 
  %dr = alloca i32 
  %dc = alloca i32 
  %nr = alloca i32 
  %nc = alloca i32 
  %neighbor_index = alloca i32 
  store [10000 x i1]* %grid.tmp, ptr %grid..tmp
  store i32 %row.tmp, ptr %row..tmp
  store i32 %col.tmp, ptr %col..tmp
  store i32 0, ptr %count
  %rcc.tmp.5 = sub i32 0, 1
  store i32 %rcc.tmp.5, ptr %dr
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %dr
  %rcc.tmp.9 = icmp sle i32 %rcc.tmp.8, 1
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = sub i32 0, 1
  store i32 %rcc.tmp.12, ptr %dc
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.15 = load i32, ptr %dc
  %rcc.tmp.16 = icmp sle i32 %rcc.tmp.15, 1
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %dr
  %rcc.tmp.20 = icmp ne i32 %rcc.tmp.19, 0
  br i1 %rcc.tmp.20, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.22 = load i32, ptr %dc
  %rcc.tmp.23 = icmp ne i32 %rcc.tmp.22, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.25 = phi i1 [1, %while.body.2], [%rcc.tmp.23, %or.rhs]
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %row..tmp
  %rcc.tmp.28 = load i32, ptr %dr
  %rcc.tmp.29 = add i32 %rcc.tmp.27, %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %nr
  %rcc.tmp.31 = load i32, ptr %col..tmp
  %rcc.tmp.32 = load i32, ptr %dc
  %rcc.tmp.33 = add i32 %rcc.tmp.31, %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %nc
  %rcc.tmp.35 = load i32, ptr %nr
  %rcc.tmp.36 = icmp sge i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.38 = load i32, ptr %nr
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 100
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.41 = phi i1 [0, %if.then], [%rcc.tmp.39, %and.rhs]
  br i1 %rcc.tmp.41, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.43 = load i32, ptr %nc
  %rcc.tmp.44 = icmp sge i32 %rcc.tmp.43, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.46 = phi i1 [0, %sc.merge.2], [%rcc.tmp.44, %and.rhs.2]
  br i1 %rcc.tmp.46, label %and.rhs.3, label %sc.merge.4
and.rhs.3:
  %rcc.tmp.48 = load i32, ptr %nc
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 100
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.51 = phi i1 [0, %sc.merge.3], [%rcc.tmp.49, %and.rhs.3]
  br i1 %rcc.tmp.51, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.53 = load i32, ptr %nr
  %rcc.tmp.54 = mul i32 %rcc.tmp.53, 100
  %rcc.tmp.55 = load i32, ptr %nc
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %neighbor_index
  %rcc.tmp.58 = load i32, ptr %neighbor_index
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.61 = getelementptr [10000 x i1], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i1, ptr %rcc.tmp.61
  br i1 %rcc.tmp.62, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.64 = load i32, ptr %count
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %count
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
  %rcc.tmp.73 = load i32, ptr %dc
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %dc
  br label %while.cond.2
while.end.2:
  %rcc.tmp.77 = load i32, ptr %dr
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %dr
  br label %while.cond
while.end:
  %rcc.tmp.81 = load i32, ptr %count
  ret i32 %rcc.tmp.81
}
define i32 @countBooleanPatterns.([10000 x i1]* %grid.tmp) {
entry:
  %grid..tmp = alloca [10000 x i1]* 
  %pattern_count = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  store [10000 x i1]* %grid.tmp, ptr %grid..tmp
  store i32 0, ptr %pattern_count
  store i32 0, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %row
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 98
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.11 = load i32, ptr %col
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 98
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.16 = load i32, ptr %row
  %rcc.tmp.17 = load i32, ptr %col
  %rcc.tmp.18 = call i1 @checkBooleanPattern2x2.([10000 x i1]* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %pattern_count
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %pattern_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.25 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.26 = load i32, ptr %row
  %rcc.tmp.27 = load i32, ptr %col
  %rcc.tmp.28 = call i1 @checkBooleanPattern3x3.([10000 x i1]* %rcc.tmp.25, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %pattern_count
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 2
  store i32 %rcc.tmp.31, ptr %pattern_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.35 = load i32, ptr %col
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.39 = load i32, ptr %row
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %row
  br label %while.cond
while.end:
  %rcc.tmp.43 = load i32, ptr %pattern_count
  ret i32 %rcc.tmp.43
}
define i1 @checkBooleanPattern2x2.([10000 x i1]* %grid.tmp, i32 %row.tmp, i32 %col.tmp) {
entry:
  %grid..tmp = alloca [10000 x i1]* 
  %row..tmp = alloca i32 
  %col..tmp = alloca i32 
  %tl = alloca i1 
  %tr = alloca i1 
  %bl = alloca i1 
  %br = alloca i1 
  store [10000 x i1]* %grid.tmp, ptr %grid..tmp
  store i32 %row.tmp, ptr %row..tmp
  store i32 %col.tmp, ptr %col..tmp
  %rcc.tmp.4 = load i32, ptr %row..tmp
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 100
  %rcc.tmp.6 = load i32, ptr %col..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.10 = getelementptr [10000 x i1], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.11 = load i1, ptr %rcc.tmp.10
  store i1 %rcc.tmp.11, ptr %tl
  %rcc.tmp.13 = load i32, ptr %row..tmp
  %rcc.tmp.14 = mul i32 %rcc.tmp.13, 100
  %rcc.tmp.15 = load i32, ptr %col..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.20 = getelementptr [10000 x i1], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i1, ptr %rcc.tmp.20
  store i1 %rcc.tmp.21, ptr %tr
  %rcc.tmp.23 = load i32, ptr %row..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = mul i32 %rcc.tmp.24, 100
  %rcc.tmp.26 = load i32, ptr %col..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.30 = getelementptr [10000 x i1], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i1, ptr %rcc.tmp.30
  store i1 %rcc.tmp.31, ptr %bl
  %rcc.tmp.33 = load i32, ptr %row..tmp
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, 100
  %rcc.tmp.36 = load i32, ptr %col..tmp
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.41 = getelementptr [10000 x i1], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i1, ptr %rcc.tmp.41
  store i1 %rcc.tmp.42, ptr %br
  %rcc.tmp.44 = load i1, ptr %tl
  br i1 %rcc.tmp.44, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.46 = load i1, ptr %tr
  %rcc.tmp.47 = xor i1 %rcc.tmp.46, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.49 = phi i1 [0, %entry], [%rcc.tmp.47, %and.rhs]
  br i1 %rcc.tmp.49, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.51 = load i1, ptr %bl
  %rcc.tmp.52 = xor i1 %rcc.tmp.51, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.54 = phi i1 [0, %sc.merge], [%rcc.tmp.52, %and.rhs.2]
  br i1 %rcc.tmp.54, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.56 = load i1, ptr %br
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.58 = phi i1 [0, %sc.merge.2], [%rcc.tmp.56, %and.rhs.3]
  br i1 %rcc.tmp.58, label %sc.merge.4, label %or.rhs
or.rhs:
  %rcc.tmp.60 = load i1, ptr %tl
  %rcc.tmp.61 = xor i1 %rcc.tmp.60, true
  br i1 %rcc.tmp.61, label %and.rhs.4, label %sc.merge.5
and.rhs.4:
  %rcc.tmp.63 = load i1, ptr %tr
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.65 = phi i1 [0, %or.rhs], [%rcc.tmp.63, %and.rhs.4]
  br i1 %rcc.tmp.65, label %and.rhs.5, label %sc.merge.6
and.rhs.5:
  %rcc.tmp.67 = load i1, ptr %bl
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.69 = phi i1 [0, %sc.merge.5], [%rcc.tmp.67, %and.rhs.5]
  br i1 %rcc.tmp.69, label %and.rhs.6, label %sc.merge.7
and.rhs.6:
  %rcc.tmp.71 = load i1, ptr %br
  %rcc.tmp.72 = xor i1 %rcc.tmp.71, true
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.74 = phi i1 [0, %sc.merge.6], [%rcc.tmp.72, %and.rhs.6]
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.76 = phi i1 [1, %sc.merge.3], [%rcc.tmp.74, %sc.merge.7]
  ret i1 %rcc.tmp.76
}
define i1 @checkBooleanPattern3x3.([10000 x i1]* %grid.tmp, i32 %row.tmp, i32 %col.tmp) {
entry:
  %grid..tmp = alloca [10000 x i1]* 
  %row..tmp = alloca i32 
  %col..tmp = alloca i32 
  %true_count = alloca i32 
  %r = alloca i32 
  %c = alloca i32 
  store [10000 x i1]* %grid.tmp, ptr %grid..tmp
  store i32 %row.tmp, ptr %row..tmp
  store i32 %col.tmp, ptr %col..tmp
  %rcc.tmp.4 = load i32, ptr %row..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 2
  %rcc.tmp.6 = icmp sge i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.8 = load i32, ptr %col..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 2
  %rcc.tmp.10 = icmp sge i32 %rcc.tmp.9, 100
  br label %sc.merge
sc.merge:
  %rcc.tmp.12 = phi i1 [1, %entry], [%rcc.tmp.10, %or.rhs]
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %true_count
  store i32 0, ptr %r
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %r
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 3
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %c
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.25 = load i32, ptr %c
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 3
  br i1 %rcc.tmp.26, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.29 = load i32, ptr %row..tmp
  %rcc.tmp.30 = load i32, ptr %r
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = mul i32 %rcc.tmp.31, 100
  %rcc.tmp.33 = load i32, ptr %col..tmp
  %rcc.tmp.34 = load i32, ptr %c
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.32, %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [10000 x i1]*, ptr %grid..tmp
  %rcc.tmp.39 = getelementptr [10000 x i1], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i1, ptr %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load i32, ptr %true_count
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %true_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.47 = load i32, ptr %c
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %c
  br label %while.cond.2
while.end.2:
  %rcc.tmp.51 = load i32, ptr %r
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %r
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %true_count
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.55, 5
  ret i1 %rcc.tmp.56
}
define void @testLogicalAlgorithms.() {
entry:
  %result_sum = alloca i32 
  call void @printlnInt.(i32 1105)
  store i32 0, ptr %result_sum
  %rcc.tmp.3 = load i32, ptr %result_sum
  %rcc.tmp.4 = call i32 @testBooleanSATSolver.()
  %rcc.tmp.5 = add i32 %rcc.tmp.3, %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %result_sum
  %rcc.tmp.7 = load i32, ptr %result_sum
  %rcc.tmp.8 = call i32 @testBooleanFunctionEvaluation.()
  %rcc.tmp.9 = add i32 %rcc.tmp.7, %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %result_sum
  %rcc.tmp.11 = load i32, ptr %result_sum
  %rcc.tmp.12 = call i32 @solveBooleanPuzzles.()
  %rcc.tmp.13 = add i32 %rcc.tmp.11, %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %result_sum
  %rcc.tmp.15 = load i32, ptr %result_sum
  call void @printlnInt.(i32 %rcc.tmp.15)
  call void @printlnInt.(i32 1106)
  ret void
}
define i32 @testBooleanSATSolver.() {
entry:
  %satisfiable_count = alloca i32 
  %assignment = alloca i32 
  store i32 0, ptr %satisfiable_count
  store i32 0, ptr %assignment
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %assignment
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1024
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %assignment
  %rcc.tmp.9 = call i1 @evaluateBooleanFormula.(i32 %rcc.tmp.8)
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %satisfiable_count
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %satisfiable_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %assignment
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %assignment
  br label %while.cond
while.end:
  %rcc.tmp.20 = load i32, ptr %satisfiable_count
  ret i32 %rcc.tmp.20
}
define i1 @evaluateBooleanFormula.(i32 %assignment.tmp) {
entry:
  %assignment..tmp = alloca i32 
  %x0 = alloca i1 
  %x1 = alloca i1 
  %x2 = alloca i1 
  %x3 = alloca i1 
  %x4 = alloca i1 
  %x5 = alloca i1 
  %x6 = alloca i1 
  %x7 = alloca i1 
  %x8 = alloca i1 
  %x9 = alloca i1 
  %clause1 = alloca i1 
  %clause2 = alloca i1 
  %clause3 = alloca i1 
  %clause4 = alloca i1 
  %clause5 = alloca i1 
  %clause6 = alloca i1 
  %clause7 = alloca i1 
  %clause8 = alloca i1 
  store i32 %assignment.tmp, ptr %assignment..tmp
  %rcc.tmp.2 = load i32, ptr %assignment..tmp
  %rcc.tmp.3 = and i32 %rcc.tmp.2, 1
  %rcc.tmp.4 = icmp ne i32 %rcc.tmp.3, 0
  store i1 %rcc.tmp.4, ptr %x0
  %rcc.tmp.6 = load i32, ptr %assignment..tmp
  %rcc.tmp.7 = and i32 %rcc.tmp.6, 2
  %rcc.tmp.8 = icmp ne i32 %rcc.tmp.7, 0
  store i1 %rcc.tmp.8, ptr %x1
  %rcc.tmp.10 = load i32, ptr %assignment..tmp
  %rcc.tmp.11 = and i32 %rcc.tmp.10, 4
  %rcc.tmp.12 = icmp ne i32 %rcc.tmp.11, 0
  store i1 %rcc.tmp.12, ptr %x2
  %rcc.tmp.14 = load i32, ptr %assignment..tmp
  %rcc.tmp.15 = and i32 %rcc.tmp.14, 8
  %rcc.tmp.16 = icmp ne i32 %rcc.tmp.15, 0
  store i1 %rcc.tmp.16, ptr %x3
  %rcc.tmp.18 = load i32, ptr %assignment..tmp
  %rcc.tmp.19 = and i32 %rcc.tmp.18, 16
  %rcc.tmp.20 = icmp ne i32 %rcc.tmp.19, 0
  store i1 %rcc.tmp.20, ptr %x4
  %rcc.tmp.22 = load i32, ptr %assignment..tmp
  %rcc.tmp.23 = and i32 %rcc.tmp.22, 32
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.23, 0
  store i1 %rcc.tmp.24, ptr %x5
  %rcc.tmp.26 = load i32, ptr %assignment..tmp
  %rcc.tmp.27 = and i32 %rcc.tmp.26, 64
  %rcc.tmp.28 = icmp ne i32 %rcc.tmp.27, 0
  store i1 %rcc.tmp.28, ptr %x6
  %rcc.tmp.30 = load i32, ptr %assignment..tmp
  %rcc.tmp.31 = and i32 %rcc.tmp.30, 128
  %rcc.tmp.32 = icmp ne i32 %rcc.tmp.31, 0
  store i1 %rcc.tmp.32, ptr %x7
  %rcc.tmp.34 = load i32, ptr %assignment..tmp
  %rcc.tmp.35 = and i32 %rcc.tmp.34, 256
  %rcc.tmp.36 = icmp ne i32 %rcc.tmp.35, 0
  store i1 %rcc.tmp.36, ptr %x8
  %rcc.tmp.38 = load i32, ptr %assignment..tmp
  %rcc.tmp.39 = and i32 %rcc.tmp.38, 512
  %rcc.tmp.40 = icmp ne i32 %rcc.tmp.39, 0
  store i1 %rcc.tmp.40, ptr %x9
  %rcc.tmp.42 = load i1, ptr %x0
  br i1 %rcc.tmp.42, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.44 = load i1, ptr %x1
  %rcc.tmp.45 = xor i1 %rcc.tmp.44, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.47 = phi i1 [1, %entry], [%rcc.tmp.45, %or.rhs]
  br i1 %rcc.tmp.47, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.49 = load i1, ptr %x2
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.51 = phi i1 [1, %sc.merge], [%rcc.tmp.49, %or.rhs.2]
  store i1 %rcc.tmp.51, ptr %clause1
  %rcc.tmp.53 = load i1, ptr %x0
  %rcc.tmp.54 = xor i1 %rcc.tmp.53, true
  br i1 %rcc.tmp.54, label %sc.merge.3, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.56 = load i1, ptr %x3
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.58 = phi i1 [1, %sc.merge.2], [%rcc.tmp.56, %or.rhs.3]
  br i1 %rcc.tmp.58, label %sc.merge.4, label %or.rhs.4
or.rhs.4:
  %rcc.tmp.60 = load i1, ptr %x4
  %rcc.tmp.61 = xor i1 %rcc.tmp.60, true
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.63 = phi i1 [1, %sc.merge.3], [%rcc.tmp.61, %or.rhs.4]
  store i1 %rcc.tmp.63, ptr %clause2
  %rcc.tmp.65 = load i1, ptr %x1
  br i1 %rcc.tmp.65, label %sc.merge.5, label %or.rhs.5
or.rhs.5:
  %rcc.tmp.67 = load i1, ptr %x2
  %rcc.tmp.68 = xor i1 %rcc.tmp.67, true
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.70 = phi i1 [1, %sc.merge.4], [%rcc.tmp.68, %or.rhs.5]
  br i1 %rcc.tmp.70, label %sc.merge.6, label %or.rhs.6
or.rhs.6:
  %rcc.tmp.72 = load i1, ptr %x5
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.74 = phi i1 [1, %sc.merge.5], [%rcc.tmp.72, %or.rhs.6]
  store i1 %rcc.tmp.74, ptr %clause3
  %rcc.tmp.76 = load i1, ptr %x3
  %rcc.tmp.77 = xor i1 %rcc.tmp.76, true
  br i1 %rcc.tmp.77, label %sc.merge.7, label %or.rhs.7
or.rhs.7:
  %rcc.tmp.79 = load i1, ptr %x4
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.81 = phi i1 [1, %sc.merge.6], [%rcc.tmp.79, %or.rhs.7]
  br i1 %rcc.tmp.81, label %sc.merge.8, label %or.rhs.8
or.rhs.8:
  %rcc.tmp.83 = load i1, ptr %x6
  %rcc.tmp.84 = xor i1 %rcc.tmp.83, true
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.86 = phi i1 [1, %sc.merge.7], [%rcc.tmp.84, %or.rhs.8]
  store i1 %rcc.tmp.86, ptr %clause4
  %rcc.tmp.88 = load i1, ptr %x2
  br i1 %rcc.tmp.88, label %sc.merge.9, label %or.rhs.9
or.rhs.9:
  %rcc.tmp.90 = load i1, ptr %x7
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.92 = phi i1 [1, %sc.merge.8], [%rcc.tmp.90, %or.rhs.9]
  br i1 %rcc.tmp.92, label %sc.merge.10, label %or.rhs.10
or.rhs.10:
  %rcc.tmp.94 = load i1, ptr %x8
  %rcc.tmp.95 = xor i1 %rcc.tmp.94, true
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.97 = phi i1 [1, %sc.merge.9], [%rcc.tmp.95, %or.rhs.10]
  store i1 %rcc.tmp.97, ptr %clause5
  %rcc.tmp.99 = load i1, ptr %x5
  %rcc.tmp.100 = xor i1 %rcc.tmp.99, true
  br i1 %rcc.tmp.100, label %sc.merge.11, label %or.rhs.11
or.rhs.11:
  %rcc.tmp.102 = load i1, ptr %x7
  %rcc.tmp.103 = xor i1 %rcc.tmp.102, true
  br label %sc.merge.11
sc.merge.11:
  %rcc.tmp.105 = phi i1 [1, %sc.merge.10], [%rcc.tmp.103, %or.rhs.11]
  br i1 %rcc.tmp.105, label %sc.merge.12, label %or.rhs.12
or.rhs.12:
  %rcc.tmp.107 = load i1, ptr %x9
  br label %sc.merge.12
sc.merge.12:
  %rcc.tmp.109 = phi i1 [1, %sc.merge.11], [%rcc.tmp.107, %or.rhs.12]
  store i1 %rcc.tmp.109, ptr %clause6
  %rcc.tmp.111 = load i1, ptr %x6
  br i1 %rcc.tmp.111, label %sc.merge.13, label %or.rhs.13
or.rhs.13:
  %rcc.tmp.113 = load i1, ptr %x8
  br label %sc.merge.13
sc.merge.13:
  %rcc.tmp.115 = phi i1 [1, %sc.merge.12], [%rcc.tmp.113, %or.rhs.13]
  br i1 %rcc.tmp.115, label %sc.merge.14, label %or.rhs.14
or.rhs.14:
  %rcc.tmp.117 = load i1, ptr %x9
  %rcc.tmp.118 = xor i1 %rcc.tmp.117, true
  br label %sc.merge.14
sc.merge.14:
  %rcc.tmp.120 = phi i1 [1, %sc.merge.13], [%rcc.tmp.118, %or.rhs.14]
  store i1 %rcc.tmp.120, ptr %clause7
  %rcc.tmp.122 = load i1, ptr %x0
  %rcc.tmp.123 = xor i1 %rcc.tmp.122, true
  br i1 %rcc.tmp.123, label %sc.merge.15, label %or.rhs.15
or.rhs.15:
  %rcc.tmp.125 = load i1, ptr %x1
  %rcc.tmp.126 = xor i1 %rcc.tmp.125, true
  br label %sc.merge.15
sc.merge.15:
  %rcc.tmp.128 = phi i1 [1, %sc.merge.14], [%rcc.tmp.126, %or.rhs.15]
  br i1 %rcc.tmp.128, label %sc.merge.16, label %or.rhs.16
or.rhs.16:
  %rcc.tmp.130 = load i1, ptr %x2
  %rcc.tmp.131 = xor i1 %rcc.tmp.130, true
  br label %sc.merge.16
sc.merge.16:
  %rcc.tmp.133 = phi i1 [1, %sc.merge.15], [%rcc.tmp.131, %or.rhs.16]
  store i1 %rcc.tmp.133, ptr %clause8
  %rcc.tmp.135 = load i1, ptr %clause1
  br i1 %rcc.tmp.135, label %and.rhs, label %sc.merge.17
and.rhs:
  %rcc.tmp.137 = load i1, ptr %clause2
  br label %sc.merge.17
sc.merge.17:
  %rcc.tmp.139 = phi i1 [0, %sc.merge.16], [%rcc.tmp.137, %and.rhs]
  br i1 %rcc.tmp.139, label %and.rhs.2, label %sc.merge.18
and.rhs.2:
  %rcc.tmp.141 = load i1, ptr %clause3
  br label %sc.merge.18
sc.merge.18:
  %rcc.tmp.143 = phi i1 [0, %sc.merge.17], [%rcc.tmp.141, %and.rhs.2]
  br i1 %rcc.tmp.143, label %and.rhs.3, label %sc.merge.19
and.rhs.3:
  %rcc.tmp.145 = load i1, ptr %clause4
  br label %sc.merge.19
sc.merge.19:
  %rcc.tmp.147 = phi i1 [0, %sc.merge.18], [%rcc.tmp.145, %and.rhs.3]
  br i1 %rcc.tmp.147, label %and.rhs.4, label %sc.merge.20
and.rhs.4:
  %rcc.tmp.149 = load i1, ptr %clause5
  br label %sc.merge.20
sc.merge.20:
  %rcc.tmp.151 = phi i1 [0, %sc.merge.19], [%rcc.tmp.149, %and.rhs.4]
  br i1 %rcc.tmp.151, label %and.rhs.5, label %sc.merge.21
and.rhs.5:
  %rcc.tmp.153 = load i1, ptr %clause6
  br label %sc.merge.21
sc.merge.21:
  %rcc.tmp.155 = phi i1 [0, %sc.merge.20], [%rcc.tmp.153, %and.rhs.5]
  br i1 %rcc.tmp.155, label %and.rhs.6, label %sc.merge.22
and.rhs.6:
  %rcc.tmp.157 = load i1, ptr %clause7
  br label %sc.merge.22
sc.merge.22:
  %rcc.tmp.159 = phi i1 [0, %sc.merge.21], [%rcc.tmp.157, %and.rhs.6]
  br i1 %rcc.tmp.159, label %and.rhs.7, label %sc.merge.23
and.rhs.7:
  %rcc.tmp.161 = load i1, ptr %clause8
  br label %sc.merge.23
sc.merge.23:
  %rcc.tmp.163 = phi i1 [0, %sc.merge.22], [%rcc.tmp.161, %and.rhs.7]
  ret i1 %rcc.tmp.163
}
define i32 @testBooleanFunctionEvaluation.() {
entry:
  %evaluation_count = alloca i32 
  %input = alloca i32 
  store i32 0, ptr %evaluation_count
  store i32 0, ptr %input
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %input
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 256
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %input
  %rcc.tmp.9 = call i1 @evaluateParityFunction.(i32 %rcc.tmp.8)
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %evaluation_count
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %evaluation_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %input
  %rcc.tmp.17 = call i1 @evaluateMajorityFunction.(i32 %rcc.tmp.16)
  br i1 %rcc.tmp.17, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.19 = load i32, ptr %evaluation_count
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 2
  store i32 %rcc.tmp.20, ptr %evaluation_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.24 = load i32, ptr %input
  %rcc.tmp.25 = call i1 @evaluateThresholdFunction.(i32 %rcc.tmp.24)
  br i1 %rcc.tmp.25, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.27 = load i32, ptr %evaluation_count
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 3
  store i32 %rcc.tmp.28, ptr %evaluation_count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.32 = load i32, ptr %input
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %input
  br label %while.cond
while.end:
  %rcc.tmp.36 = load i32, ptr %evaluation_count
  ret i32 %rcc.tmp.36
}
define i1 @evaluateParityFunction.(i32 %input.tmp) {
entry:
  %input..tmp = alloca i32 
  %parity = alloca i1 
  %temp = alloca i32 
  store i32 %input.tmp, ptr %input..tmp
  store i1 0, ptr %parity
  %rcc.tmp.3 = load i32, ptr %input..tmp
  store i32 %rcc.tmp.3, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %temp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %temp
  %rcc.tmp.11 = and i32 %rcc.tmp.10, 1
  %rcc.tmp.12 = icmp ne i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i1, ptr %parity
  %rcc.tmp.15 = xor i1 %rcc.tmp.14, true
  store i1 %rcc.tmp.15, ptr %parity
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %temp
  %rcc.tmp.20 = sdiv i32 %rcc.tmp.19, 2
  store i32 %rcc.tmp.20, ptr %temp
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i1, ptr %parity
  ret i1 %rcc.tmp.23
}
define i1 @evaluateMajorityFunction.(i32 %input.tmp) {
entry:
  %input..tmp = alloca i32 
  %count = alloca i32 
  %temp = alloca i32 
  store i32 %input.tmp, ptr %input..tmp
  store i32 0, ptr %count
  %rcc.tmp.3 = load i32, ptr %input..tmp
  store i32 %rcc.tmp.3, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %temp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %temp
  %rcc.tmp.11 = and i32 %rcc.tmp.10, 1
  %rcc.tmp.12 = icmp ne i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %count
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %temp
  %rcc.tmp.20 = sdiv i32 %rcc.tmp.19, 2
  store i32 %rcc.tmp.20, ptr %temp
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %count
  %rcc.tmp.24 = icmp sgt i32 %rcc.tmp.23, 4
  ret i1 %rcc.tmp.24
}
define i1 @evaluateThresholdFunction.(i32 %input.tmp) {
entry:
  %input..tmp = alloca i32 
  %count = alloca i32 
  %temp = alloca i32 
  store i32 %input.tmp, ptr %input..tmp
  store i32 0, ptr %count
  %rcc.tmp.3 = load i32, ptr %input..tmp
  store i32 %rcc.tmp.3, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %temp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %temp
  %rcc.tmp.11 = and i32 %rcc.tmp.10, 1
  %rcc.tmp.12 = icmp ne i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %count
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %temp
  %rcc.tmp.20 = sdiv i32 %rcc.tmp.19, 2
  store i32 %rcc.tmp.20, ptr %temp
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %count
  %rcc.tmp.24 = icmp sge i32 %rcc.tmp.23, 3
  ret i1 %rcc.tmp.24
}
define i32 @solveBooleanPuzzles.() {
entry:
  %solutions = alloca i32 
  store i32 0, ptr %solutions
  %rcc.tmp.2 = load i32, ptr %solutions
  %rcc.tmp.3 = call i32 @solveNQueensBooleanVersion.(i32 8)
  %rcc.tmp.4 = add i32 %rcc.tmp.2, %rcc.tmp.3
  store i32 %rcc.tmp.4, ptr %solutions
  %rcc.tmp.6 = load i32, ptr %solutions
  %rcc.tmp.7 = call i32 @solveBooleanConstraints.()
  %rcc.tmp.8 = add i32 %rcc.tmp.6, %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %solutions
  %rcc.tmp.10 = load i32, ptr %solutions
  ret i32 %rcc.tmp.10
}
define i32 @solveNQueensBooleanVersion.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %board = alloca [64 x i1] 
  %fill.idx = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 64
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [64 x i1], ptr %board, i32 0, i32 %rcc.tmp.7
  store i1 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = call i32 @nQueensBacktrack.([64 x i1]* %board, i32 0, i32 %rcc.tmp.13)
  ret i32 %rcc.tmp.14
}
define i32 @nQueensBacktrack.([64 x i1]* %board.tmp, i32 %row.tmp, i32 %n.tmp) {
entry:
  %board..tmp = alloca [64 x i1]* 
  %row..tmp = alloca i32 
  %n..tmp = alloca i32 
  %solutions = alloca i32 
  %col = alloca i32 
  store [64 x i1]* %board.tmp, ptr %board..tmp
  store i32 %row.tmp, ptr %row..tmp
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.4 = load i32, ptr %row..tmp
  %rcc.tmp.5 = load i32, ptr %n..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %solutions
  store i32 0, ptr %col
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %col
  %rcc.tmp.14 = load i32, ptr %n..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.19 = load i32, ptr %row..tmp
  %rcc.tmp.20 = load i32, ptr %col
  %rcc.tmp.21 = load i32, ptr %n..tmp
  %rcc.tmp.22 = call i1 @isSafePosition.([64 x i1]* %rcc.tmp.18, i32 %rcc.tmp.19, i32 %rcc.tmp.20, i32 %rcc.tmp.21)
  br i1 %rcc.tmp.22, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.24 = load i32, ptr %row..tmp
  %rcc.tmp.25 = load i32, ptr %n..tmp
  %rcc.tmp.26 = mul i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %col
  %rcc.tmp.28 = add i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.31 = getelementptr [64 x i1], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  store i1 1, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %solutions
  %rcc.tmp.34 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.35 = load i32, ptr %row..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  %rcc.tmp.37 = load i32, ptr %n..tmp
  %rcc.tmp.38 = call i32 @nQueensBacktrack.([64 x i1]* %rcc.tmp.34, i32 %rcc.tmp.36, i32 %rcc.tmp.37)
  %rcc.tmp.39 = add i32 %rcc.tmp.33, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %solutions
  %rcc.tmp.41 = load i32, ptr %row..tmp
  %rcc.tmp.42 = load i32, ptr %n..tmp
  %rcc.tmp.43 = mul i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %col
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.48 = getelementptr [64 x i1], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  store i1 0, ptr %rcc.tmp.48
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.52 = load i32, ptr %col
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %col
  br label %while.cond
while.end:
  %rcc.tmp.56 = load i32, ptr %solutions
  ret i32 %rcc.tmp.56
}
define i1 @isSafePosition.([64 x i1]* %board.tmp, i32 %row.tmp, i32 %col.tmp, i32 %n.tmp) {
entry:
  %board..tmp = alloca [64 x i1]* 
  %row..tmp = alloca i32 
  %col..tmp = alloca i32 
  %n..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [64 x i1]* %board.tmp, ptr %board..tmp
  store i32 %row.tmp, ptr %row..tmp
  store i32 %col.tmp, ptr %col..tmp
  store i32 %n.tmp, ptr %n..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %row..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = mul i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %col..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.19 = getelementptr [64 x i1], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i1, ptr %rcc.tmp.19
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = load i32, ptr %row..tmp
  %rcc.tmp.29 = sub i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %i
  %rcc.tmp.31 = load i32, ptr %col..tmp
  %rcc.tmp.32 = sub i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = icmp sge i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = icmp sge i32 %rcc.tmp.38, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.41 = phi i1 [0, %while.cond.2], [%rcc.tmp.39, %and.rhs]
  br i1 %rcc.tmp.41, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = load i32, ptr %n..tmp
  %rcc.tmp.46 = mul i32 %rcc.tmp.44, %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.51 = getelementptr [64 x i1], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i1, ptr %rcc.tmp.51
  br i1 %rcc.tmp.52, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 0
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = sub i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  %rcc.tmp.59 = load i32, ptr %j
  %rcc.tmp.60 = sub i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.63 = load i32, ptr %row..tmp
  %rcc.tmp.64 = sub i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  %rcc.tmp.66 = load i32, ptr %col..tmp
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = icmp sge i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = load i32, ptr %n..tmp
  %rcc.tmp.75 = icmp slt i32 %rcc.tmp.73, %rcc.tmp.74
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.77 = phi i1 [0, %while.cond.3], [%rcc.tmp.75, %and.rhs.2]
  br i1 %rcc.tmp.77, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = load i32, ptr %n..tmp
  %rcc.tmp.82 = mul i32 %rcc.tmp.80, %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %j
  %rcc.tmp.84 = add i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = load [64 x i1]*, ptr %board..tmp
  %rcc.tmp.87 = getelementptr [64 x i1], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i1, ptr %rcc.tmp.87
  br i1 %rcc.tmp.88, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = sub i32 %rcc.tmp.92, 1
  store i32 %rcc.tmp.93, ptr %i
  %rcc.tmp.95 = load i32, ptr %j
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %j
  br label %while.cond.3
while.end.3:
  ret i1 1
}
define i32 @solveBooleanConstraints.() {
entry:
  %solution_count = alloca i32 
  %assignment = alloca i32 
  store i32 0, ptr %solution_count
  store i32 0, ptr %assignment
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %assignment
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 65536
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %assignment
  %rcc.tmp.9 = call i1 @satisfiesAllBooleanConstraints.(i32 %rcc.tmp.8)
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %solution_count
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %solution_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.16 = load i32, ptr %assignment
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %assignment
  br label %while.cond
while.end:
  %rcc.tmp.20 = load i32, ptr %solution_count
  ret i32 %rcc.tmp.20
}
define i1 @satisfiesAllBooleanConstraints.(i32 %assignment.tmp) {
entry:
  %assignment..tmp = alloca i32 
  %vars = alloca [16 x i1] 
  %constraint1 = alloca i1 
  %constraint2 = alloca i1 
  %constraint3 = alloca i1 
  %constraint4 = alloca i1 
  %constraint5 = alloca i1 
  store i32 %assignment.tmp, ptr %assignment..tmp
  %rcc.tmp.2 = load i32, ptr %assignment..tmp
  call void @extractBooleanVariables.([16 x i1]* %vars, i32 %rcc.tmp.2)
  %rcc.tmp.4 = getelementptr [16 x i1], ptr %vars, i32 0, i32 0
  %rcc.tmp.5 = load i1, ptr %rcc.tmp.4
  br i1 %rcc.tmp.5, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.7 = getelementptr [16 x i1], ptr %vars, i32 0, i32 1
  %rcc.tmp.8 = load i1, ptr %rcc.tmp.7
  %rcc.tmp.9 = xor i1 %rcc.tmp.8, true
  br i1 %rcc.tmp.9, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.11 = getelementptr [16 x i1], ptr %vars, i32 0, i32 2
  %rcc.tmp.12 = load i1, ptr %rcc.tmp.11
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.14 = phi i1 [0, %or.rhs], [%rcc.tmp.12, %and.rhs]
  br label %sc.merge
sc.merge:
  %rcc.tmp.16 = phi i1 [1, %entry], [%rcc.tmp.14, %sc.merge.2]
  store i1 %rcc.tmp.16, ptr %constraint1
  %rcc.tmp.18 = getelementptr [16 x i1], ptr %vars, i32 0, i32 3
  %rcc.tmp.19 = load i1, ptr %rcc.tmp.18
  %rcc.tmp.20 = xor i1 %rcc.tmp.19, true
  br i1 %rcc.tmp.20, label %sc.merge.3, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.22 = getelementptr [16 x i1], ptr %vars, i32 0, i32 4
  %rcc.tmp.23 = load i1, ptr %rcc.tmp.22
  br i1 %rcc.tmp.23, label %and.rhs.2, label %sc.merge.4
and.rhs.2:
  %rcc.tmp.25 = getelementptr [16 x i1], ptr %vars, i32 0, i32 5
  %rcc.tmp.26 = load i1, ptr %rcc.tmp.25
  %rcc.tmp.27 = xor i1 %rcc.tmp.26, true
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.29 = phi i1 [0, %or.rhs.2], [%rcc.tmp.27, %and.rhs.2]
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.31 = phi i1 [1, %sc.merge], [%rcc.tmp.29, %sc.merge.4]
  store i1 %rcc.tmp.31, ptr %constraint2
  %rcc.tmp.33 = getelementptr [16 x i1], ptr %vars, i32 0, i32 6
  %rcc.tmp.34 = load i1, ptr %rcc.tmp.33
  br i1 %rcc.tmp.34, label %sc.merge.5, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.36 = getelementptr [16 x i1], ptr %vars, i32 0, i32 7
  %rcc.tmp.37 = load i1, ptr %rcc.tmp.36
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.39 = phi i1 [1, %sc.merge.3], [%rcc.tmp.37, %or.rhs.3]
  br i1 %rcc.tmp.39, label %and.rhs.3, label %sc.merge.6
and.rhs.3:
  %rcc.tmp.41 = getelementptr [16 x i1], ptr %vars, i32 0, i32 8
  %rcc.tmp.42 = load i1, ptr %rcc.tmp.41
  %rcc.tmp.43 = xor i1 %rcc.tmp.42, true
  br i1 %rcc.tmp.43, label %sc.merge.7, label %or.rhs.4
or.rhs.4:
  %rcc.tmp.45 = getelementptr [16 x i1], ptr %vars, i32 0, i32 9
  %rcc.tmp.46 = load i1, ptr %rcc.tmp.45
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.48 = phi i1 [1, %and.rhs.3], [%rcc.tmp.46, %or.rhs.4]
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.50 = phi i1 [0, %sc.merge.5], [%rcc.tmp.48, %sc.merge.7]
  store i1 %rcc.tmp.50, ptr %constraint3
  %rcc.tmp.52 = getelementptr [16 x i1], ptr %vars, i32 0, i32 10
  %rcc.tmp.53 = load i1, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [16 x i1], ptr %vars, i32 0, i32 11
  %rcc.tmp.55 = load i1, ptr %rcc.tmp.54
  br i1 %rcc.tmp.55, label %and.rhs.4, label %sc.merge.8
and.rhs.4:
  %rcc.tmp.57 = getelementptr [16 x i1], ptr %vars, i32 0, i32 12
  %rcc.tmp.58 = load i1, ptr %rcc.tmp.57
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.60 = phi i1 [0, %sc.merge.6], [%rcc.tmp.58, %and.rhs.4]
  %rcc.tmp.61 = icmp eq i1 %rcc.tmp.53, %rcc.tmp.60
  store i1 %rcc.tmp.61, ptr %constraint4
  %rcc.tmp.63 = getelementptr [16 x i1], ptr %vars, i32 0, i32 13
  %rcc.tmp.64 = load i1, ptr %rcc.tmp.63
  br i1 %rcc.tmp.64, label %sc.merge.9, label %or.rhs.5
or.rhs.5:
  %rcc.tmp.66 = getelementptr [16 x i1], ptr %vars, i32 0, i32 14
  %rcc.tmp.67 = load i1, ptr %rcc.tmp.66
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.69 = phi i1 [1, %sc.merge.8], [%rcc.tmp.67, %or.rhs.5]
  %rcc.tmp.70 = getelementptr [16 x i1], ptr %vars, i32 0, i32 15
  %rcc.tmp.71 = load i1, ptr %rcc.tmp.70
  %rcc.tmp.72 = icmp ne i1 %rcc.tmp.69, %rcc.tmp.71
  store i1 %rcc.tmp.72, ptr %constraint5
  %rcc.tmp.74 = load i1, ptr %constraint1
  br i1 %rcc.tmp.74, label %and.rhs.5, label %sc.merge.10
and.rhs.5:
  %rcc.tmp.76 = load i1, ptr %constraint2
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.78 = phi i1 [0, %sc.merge.9], [%rcc.tmp.76, %and.rhs.5]
  br i1 %rcc.tmp.78, label %and.rhs.6, label %sc.merge.11
and.rhs.6:
  %rcc.tmp.80 = load i1, ptr %constraint3
  br label %sc.merge.11
sc.merge.11:
  %rcc.tmp.82 = phi i1 [0, %sc.merge.10], [%rcc.tmp.80, %and.rhs.6]
  br i1 %rcc.tmp.82, label %and.rhs.7, label %sc.merge.12
and.rhs.7:
  %rcc.tmp.84 = load i1, ptr %constraint4
  br label %sc.merge.12
sc.merge.12:
  %rcc.tmp.86 = phi i1 [0, %sc.merge.11], [%rcc.tmp.84, %and.rhs.7]
  br i1 %rcc.tmp.86, label %and.rhs.8, label %sc.merge.13
and.rhs.8:
  %rcc.tmp.88 = load i1, ptr %constraint5
  br label %sc.merge.13
sc.merge.13:
  %rcc.tmp.90 = phi i1 [0, %sc.merge.12], [%rcc.tmp.88, %and.rhs.8]
  ret i1 %rcc.tmp.90
}
define void @extractBooleanVariables.([16 x i1]* sret([16 x i1]) %ret.slot, i32 %assignment.tmp) {
entry:
  %assignment..tmp = alloca i32 
  %vars = alloca [16 x i1] 
  %i = alloca i32 
  %temp = alloca i32 
  store i32 %assignment.tmp, ptr %assignment..tmp
  %rcc.tmp.2 = getelementptr [16 x i1], ptr %vars, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [16 x i1], ptr %vars, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [16 x i1], ptr %vars, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [16 x i1], ptr %vars, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [16 x i1], ptr %vars, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [16 x i1], ptr %vars, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [16 x i1], ptr %vars, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [16 x i1], ptr %vars, i32 0, i32 7
  store i1 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [16 x i1], ptr %vars, i32 0, i32 8
  store i1 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [16 x i1], ptr %vars, i32 0, i32 9
  store i1 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [16 x i1], ptr %vars, i32 0, i32 10
  store i1 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [16 x i1], ptr %vars, i32 0, i32 11
  store i1 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [16 x i1], ptr %vars, i32 0, i32 12
  store i1 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [16 x i1], ptr %vars, i32 0, i32 13
  store i1 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [16 x i1], ptr %vars, i32 0, i32 14
  store i1 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [16 x i1], ptr %vars, i32 0, i32 15
  store i1 0, ptr %rcc.tmp.32
  store i32 0, ptr %i
  %rcc.tmp.35 = load i32, ptr %assignment..tmp
  store i32 %rcc.tmp.35, ptr %temp
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = icmp slt i32 %rcc.tmp.38, 16
  br i1 %rcc.tmp.39, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [16 x i1], ptr %vars, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %temp
  %rcc.tmp.46 = and i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = icmp ne i32 %rcc.tmp.46, 0
  store i1 %rcc.tmp.47, ptr %rcc.tmp.44
  %rcc.tmp.49 = load i32, ptr %temp
  %rcc.tmp.50 = sdiv i32 %rcc.tmp.49, 2
  store i32 %rcc.tmp.50, ptr %temp
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.56 = getelementptr [16 x i1], ptr %vars, i32 0, i32 0
  %rcc.tmp.57 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.58 = load i1, ptr %rcc.tmp.56
  store i1 %rcc.tmp.58, ptr %rcc.tmp.57
  %rcc.tmp.60 = getelementptr [16 x i1], ptr %vars, i32 0, i32 1
  %rcc.tmp.61 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.62 = load i1, ptr %rcc.tmp.60
  store i1 %rcc.tmp.62, ptr %rcc.tmp.61
  %rcc.tmp.64 = getelementptr [16 x i1], ptr %vars, i32 0, i32 2
  %rcc.tmp.65 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.66 = load i1, ptr %rcc.tmp.64
  store i1 %rcc.tmp.66, ptr %rcc.tmp.65
  %rcc.tmp.68 = getelementptr [16 x i1], ptr %vars, i32 0, i32 3
  %rcc.tmp.69 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.70 = load i1, ptr %rcc.tmp.68
  store i1 %rcc.tmp.70, ptr %rcc.tmp.69
  %rcc.tmp.72 = getelementptr [16 x i1], ptr %vars, i32 0, i32 4
  %rcc.tmp.73 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 4
  %rcc.tmp.74 = load i1, ptr %rcc.tmp.72
  store i1 %rcc.tmp.74, ptr %rcc.tmp.73
  %rcc.tmp.76 = getelementptr [16 x i1], ptr %vars, i32 0, i32 5
  %rcc.tmp.77 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 5
  %rcc.tmp.78 = load i1, ptr %rcc.tmp.76
  store i1 %rcc.tmp.78, ptr %rcc.tmp.77
  %rcc.tmp.80 = getelementptr [16 x i1], ptr %vars, i32 0, i32 6
  %rcc.tmp.81 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 6
  %rcc.tmp.82 = load i1, ptr %rcc.tmp.80
  store i1 %rcc.tmp.82, ptr %rcc.tmp.81
  %rcc.tmp.84 = getelementptr [16 x i1], ptr %vars, i32 0, i32 7
  %rcc.tmp.85 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 7
  %rcc.tmp.86 = load i1, ptr %rcc.tmp.84
  store i1 %rcc.tmp.86, ptr %rcc.tmp.85
  %rcc.tmp.88 = getelementptr [16 x i1], ptr %vars, i32 0, i32 8
  %rcc.tmp.89 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 8
  %rcc.tmp.90 = load i1, ptr %rcc.tmp.88
  store i1 %rcc.tmp.90, ptr %rcc.tmp.89
  %rcc.tmp.92 = getelementptr [16 x i1], ptr %vars, i32 0, i32 9
  %rcc.tmp.93 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 9
  %rcc.tmp.94 = load i1, ptr %rcc.tmp.92
  store i1 %rcc.tmp.94, ptr %rcc.tmp.93
  %rcc.tmp.96 = getelementptr [16 x i1], ptr %vars, i32 0, i32 10
  %rcc.tmp.97 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 10
  %rcc.tmp.98 = load i1, ptr %rcc.tmp.96
  store i1 %rcc.tmp.98, ptr %rcc.tmp.97
  %rcc.tmp.100 = getelementptr [16 x i1], ptr %vars, i32 0, i32 11
  %rcc.tmp.101 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 11
  %rcc.tmp.102 = load i1, ptr %rcc.tmp.100
  store i1 %rcc.tmp.102, ptr %rcc.tmp.101
  %rcc.tmp.104 = getelementptr [16 x i1], ptr %vars, i32 0, i32 12
  %rcc.tmp.105 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 12
  %rcc.tmp.106 = load i1, ptr %rcc.tmp.104
  store i1 %rcc.tmp.106, ptr %rcc.tmp.105
  %rcc.tmp.108 = getelementptr [16 x i1], ptr %vars, i32 0, i32 13
  %rcc.tmp.109 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 13
  %rcc.tmp.110 = load i1, ptr %rcc.tmp.108
  store i1 %rcc.tmp.110, ptr %rcc.tmp.109
  %rcc.tmp.112 = getelementptr [16 x i1], ptr %vars, i32 0, i32 14
  %rcc.tmp.113 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 14
  %rcc.tmp.114 = load i1, ptr %rcc.tmp.112
  store i1 %rcc.tmp.114, ptr %rcc.tmp.113
  %rcc.tmp.116 = getelementptr [16 x i1], ptr %vars, i32 0, i32 15
  %rcc.tmp.117 = getelementptr [16 x i1], ptr %ret.slot, i32 0, i32 15
  %rcc.tmp.118 = load i1, ptr %rcc.tmp.116
  store i1 %rcc.tmp.118, ptr %rcc.tmp.117
  ret void
}
define void @testBooleanSearchAndFilter.() {
entry:
  %search_results = alloca i32 
  %data = alloca [5000 x i32] 
  %fill.idx = alloca i32 
  call void @printlnInt.(i32 1107)
  store i32 0, ptr %search_results
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 5000
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [5000 x i32], ptr %data, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeSearchData.([5000 x i32]* %data)
  %rcc.tmp.15 = load i32, ptr %search_results
  %rcc.tmp.16 = call i32 @performBooleanFilter.([5000 x i32]* %data)
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %search_results
  %rcc.tmp.19 = load i32, ptr %search_results
  %rcc.tmp.20 = call i32 @performMultiCriteriaSearch.([5000 x i32]* %data)
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %search_results
  %rcc.tmp.23 = load i32, ptr %search_results
  %rcc.tmp.24 = call i32 @performBooleanRangeSearch.([5000 x i32]* %data)
  %rcc.tmp.25 = add i32 %rcc.tmp.23, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %search_results
  %rcc.tmp.27 = load i32, ptr %search_results
  call void @printlnInt.(i32 %rcc.tmp.27)
  call void @printlnInt.(i32 1108)
  ret void
}
define void @initializeSearchData.([5000 x i32]* %data.tmp) {
entry:
  %data..tmp = alloca [5000 x i32]* 
  %i = alloca i32 
  %seed = alloca i32 
  store [5000 x i32]* %data.tmp, ptr %data..tmp
  store i32 0, ptr %i
  store i32 54321, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 5000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %seed
  %rcc.tmp.10 = call i32 @pm_rand_update.(i32 %rcc.tmp.9)
  store i32 %rcc.tmp.10, ptr %seed
  %rcc.tmp.12 = load i32, ptr %seed
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load i32, ptr %seed
  %rcc.tmp.16 = sub i32 0, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.23 = getelementptr [5000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %seed
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 10000
  store i32 %rcc.tmp.25, ptr %rcc.tmp.23
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @performBooleanFilter.([5000 x i32]* %data.tmp) {
entry:
  %data..tmp = alloca [5000 x i32]* 
  %filtered_count = alloca i32 
  %i = alloca i32 
  %condition1 = alloca i1 
  %condition2 = alloca i1 
  %condition3 = alloca i1 
  %condition4 = alloca i1 
  store [5000 x i32]* %data.tmp, ptr %data..tmp
  store i32 0, ptr %filtered_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 5000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.12 = getelementptr [5000 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp sgt i32 %rcc.tmp.13, 1000
  store i1 %rcc.tmp.14, ptr %condition1
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.19 = getelementptr [5000 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.21, 0
  store i1 %rcc.tmp.22, ptr %condition2
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.27 = getelementptr [5000 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 8000
  store i1 %rcc.tmp.29, ptr %condition3
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.34 = getelementptr [5000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = srem i32 %rcc.tmp.35, 100
  %rcc.tmp.37 = call i1 @isPrime.(i32 %rcc.tmp.36)
  store i1 %rcc.tmp.37, ptr %condition4
  %rcc.tmp.39 = load i1, ptr %condition1
  br i1 %rcc.tmp.39, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.41 = load i1, ptr %condition2
  br label %sc.merge
sc.merge:
  %rcc.tmp.43 = phi i1 [0, %while.body], [%rcc.tmp.41, %and.rhs]
  br i1 %rcc.tmp.43, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.45 = load i1, ptr %condition3
  br i1 %rcc.tmp.45, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.47 = load i1, ptr %condition4
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.49 = phi i1 [0, %or.rhs], [%rcc.tmp.47, %and.rhs.2]
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.51 = phi i1 [1, %sc.merge], [%rcc.tmp.49, %sc.merge.3]
  br i1 %rcc.tmp.51, label %if.then, label %if.else
if.then:
  %rcc.tmp.53 = load i32, ptr %filtered_count
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %filtered_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.62 = load i32, ptr %filtered_count
  ret i32 %rcc.tmp.62
}
define i32 @performMultiCriteriaSearch.([5000 x i32]* %data.tmp) {
entry:
  %data..tmp = alloca [5000 x i32]* 
  %match_count = alloca i32 
  %i = alloca i32 
  %criteria_met = alloca i32 
  store [5000 x i32]* %data.tmp, ptr %data..tmp
  store i32 0, ptr %match_count
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 5000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.12 = getelementptr [5000 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = call i32 @countCriteriaMet.(i32 %rcc.tmp.13)
  store i32 %rcc.tmp.14, ptr %criteria_met
  %rcc.tmp.16 = load i32, ptr %criteria_met
  %rcc.tmp.17 = icmp sge i32 %rcc.tmp.16, 3
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load i32, ptr %match_count
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %match_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = load i32, ptr %match_count
  ret i32 %rcc.tmp.28
}
define i32 @countCriteriaMet.(i32 %value.tmp) {
entry:
  %value..tmp = alloca i32 
  %count = alloca i32 
  store i32 %value.tmp, ptr %value..tmp
  store i32 0, ptr %count
  %rcc.tmp.3 = load i32, ptr %value..tmp
  %rcc.tmp.4 = srem i32 %rcc.tmp.3, 3
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %count
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.12 = load i32, ptr %value..tmp
  %rcc.tmp.13 = icmp sgt i32 %rcc.tmp.12, 5000
  br i1 %rcc.tmp.13, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.15 = load i32, ptr %count
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.20 = load i32, ptr %value..tmp
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 7
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.21, 0
  br i1 %rcc.tmp.22, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.24 = load i32, ptr %count
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.29 = load i32, ptr %value..tmp
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 2000
  br i1 %rcc.tmp.30, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.32 = load i32, ptr %count
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %count
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.37 = load i32, ptr %value..tmp
  %rcc.tmp.38 = srem i32 %rcc.tmp.37, 100
  %rcc.tmp.39 = icmp sgt i32 %rcc.tmp.38, 50
  br i1 %rcc.tmp.39, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.41 = load i32, ptr %count
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %count
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.46 = load i32, ptr %count
  ret i32 %rcc.tmp.46
}
define i32 @performBooleanRangeSearch.([5000 x i32]* %data.tmp) {
entry:
  %data..tmp = alloca [5000 x i32]* 
  %range_matches = alloca i32 
  %i = alloca i32 
  %in_range1 = alloca i1 
  %in_range2 = alloca i1 
  %in_range3 = alloca i1 
  store [5000 x i32]* %data.tmp, ptr %data..tmp
  store i32 0, ptr %range_matches
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 5000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.12 = getelementptr [5000 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp sge i32 %rcc.tmp.13, 1000
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.19 = getelementptr [5000 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp sle i32 %rcc.tmp.20, 3000
  br label %sc.merge
sc.merge:
  %rcc.tmp.23 = phi i1 [0, %while.body], [%rcc.tmp.21, %and.rhs]
  store i1 %rcc.tmp.23, ptr %in_range1
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.28 = getelementptr [5000 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = icmp sge i32 %rcc.tmp.29, 6000
  br i1 %rcc.tmp.30, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.35 = getelementptr [5000 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = icmp sle i32 %rcc.tmp.36, 8000
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.39 = phi i1 [0, %sc.merge], [%rcc.tmp.37, %and.rhs.2]
  store i1 %rcc.tmp.39, ptr %in_range2
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.44 = getelementptr [5000 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = icmp sge i32 %rcc.tmp.45, 500
  br i1 %rcc.tmp.46, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.51 = getelementptr [5000 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = icmp sle i32 %rcc.tmp.52, 1500
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.55 = phi i1 [0, %sc.merge.2], [%rcc.tmp.53, %and.rhs.3]
  store i1 %rcc.tmp.55, ptr %in_range3
  %rcc.tmp.57 = load i1, ptr %in_range1
  br i1 %rcc.tmp.57, label %sc.merge.4, label %or.rhs
or.rhs:
  %rcc.tmp.59 = load i1, ptr %in_range2
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.61 = phi i1 [1, %sc.merge.3], [%rcc.tmp.59, %or.rhs]
  br i1 %rcc.tmp.61, label %sc.merge.5, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.63 = load i1, ptr %in_range3
  br i1 %rcc.tmp.63, label %and.rhs.4, label %sc.merge.6
and.rhs.4:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = load [5000 x i32]*, ptr %data..tmp
  %rcc.tmp.68 = getelementptr [5000 x i32], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = srem i32 %rcc.tmp.69, 2
  %rcc.tmp.71 = icmp eq i32 %rcc.tmp.70, 0
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.73 = phi i1 [0, %or.rhs.2], [%rcc.tmp.71, %and.rhs.4]
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.75 = phi i1 [1, %sc.merge.4], [%rcc.tmp.73, %sc.merge.6]
  br i1 %rcc.tmp.75, label %if.then, label %if.else
if.then:
  %rcc.tmp.77 = load i32, ptr %range_matches
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %range_matches
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.86 = load i32, ptr %range_matches
  ret i32 %rcc.tmp.86
}
define void @testBooleanStateMachine.() {
entry:
  %transitions = alloca i32 
  call void @printlnInt.(i32 1109)
  store i32 0, ptr %transitions
  %rcc.tmp.3 = load i32, ptr %transitions
  %rcc.tmp.4 = call i32 @simulateTrafficLightController.()
  %rcc.tmp.5 = add i32 %rcc.tmp.3, %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %transitions
  %rcc.tmp.7 = load i32, ptr %transitions
  %rcc.tmp.8 = call i32 @simulateDigitalCircuit.()
  %rcc.tmp.9 = add i32 %rcc.tmp.7, %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %transitions
  %rcc.tmp.11 = load i32, ptr %transitions
  %rcc.tmp.12 = call i32 @simulateBooleanAutomaton.()
  %rcc.tmp.13 = add i32 %rcc.tmp.11, %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %transitions
  %rcc.tmp.15 = load i32, ptr %transitions
  call void @printlnInt.(i32 %rcc.tmp.15)
  call void @printlnInt.(i32 1110)
  ret void
}
define i32 @simulateTrafficLightController.() {
entry:
  %state = alloca i32 
  %transitions = alloca i32 
  %time = alloca i32 
  %pedestrian_button = alloca i1 
  %emergency_vehicle = alloca i1 
  %traffic_sensor = alloca i1 
  %old_state = alloca i32 
  store i32 0, ptr %state
  store i32 0, ptr %transitions
  store i32 0, ptr %time
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %time
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 10000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %time
  %rcc.tmp.10 = srem i32 %rcc.tmp.9, 100
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 10
  store i1 %rcc.tmp.11, ptr %pedestrian_button
  %rcc.tmp.13 = load i32, ptr %time
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 500
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 5
  store i1 %rcc.tmp.15, ptr %emergency_vehicle
  %rcc.tmp.17 = load i32, ptr %time
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 50
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 25
  store i1 %rcc.tmp.19, ptr %traffic_sensor
  %rcc.tmp.21 = load i32, ptr %state
  store i32 %rcc.tmp.21, ptr %old_state
  %rcc.tmp.23 = load i32, ptr %state
  %rcc.tmp.24 = load i1, ptr %pedestrian_button
  %rcc.tmp.25 = load i1, ptr %emergency_vehicle
  %rcc.tmp.26 = load i1, ptr %traffic_sensor
  %rcc.tmp.27 = load i32, ptr %time
  %rcc.tmp.28 = call i32 @getNextTrafficState.(i32 %rcc.tmp.23, i1 %rcc.tmp.24, i1 %rcc.tmp.25, i1 %rcc.tmp.26, i32 %rcc.tmp.27)
  store i32 %rcc.tmp.28, ptr %state
  %rcc.tmp.30 = load i32, ptr %state
  %rcc.tmp.31 = load i32, ptr %old_state
  %rcc.tmp.32 = icmp ne i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  %rcc.tmp.34 = load i32, ptr %transitions
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %transitions
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.39 = load i32, ptr %time
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %time
  br label %while.cond
while.end:
  %rcc.tmp.43 = load i32, ptr %transitions
  ret i32 %rcc.tmp.43
}
define i32 @getNextTrafficState.(i32 %current_state.tmp, i1 %pedestrian.tmp, i1 %emergency.tmp, i1 %traffic.tmp, i32 %time.tmp) {
entry:
  %current_state..tmp = alloca i32 
  %pedestrian..tmp = alloca i1 
  %emergency..tmp = alloca i1 
  %traffic..tmp = alloca i1 
  %time..tmp = alloca i32 
  store i32 %current_state.tmp, ptr %current_state..tmp
  store i1 %pedestrian.tmp, ptr %pedestrian..tmp
  store i1 %emergency.tmp, ptr %emergency..tmp
  store i1 %traffic.tmp, ptr %traffic..tmp
  store i32 %time.tmp, ptr %time..tmp
  %rcc.tmp.6 = load i1, ptr %emergency..tmp
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %current_state..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %time..tmp
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 60
  %rcc.tmp.15 = icmp sgt i32 %rcc.tmp.14, 30
  br i1 %rcc.tmp.15, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.17 = load i1, ptr %pedestrian..tmp
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.19 = load i1, ptr %traffic..tmp
  %rcc.tmp.20 = xor i1 %rcc.tmp.19, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.22 = phi i1 [0, %or.rhs], [%rcc.tmp.20, %and.rhs]
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [1, %if.then.2], [%rcc.tmp.22, %sc.merge.2]
  br i1 %rcc.tmp.24, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 1
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.29 = load i32, ptr %current_state..tmp
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.29, 1
  br i1 %rcc.tmp.30, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.32 = load i32, ptr %time..tmp
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 60
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.33, 50
  br i1 %rcc.tmp.34, label %sc.merge.3, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.36 = load i1, ptr %pedestrian..tmp
  br i1 %rcc.tmp.36, label %and.rhs.2, label %sc.merge.4
and.rhs.2:
  %rcc.tmp.38 = load i32, ptr %time..tmp
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 120
  %rcc.tmp.40 = icmp sgt i32 %rcc.tmp.39, 60
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.42 = phi i1 [0, %or.rhs.2], [%rcc.tmp.40, %and.rhs.2]
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.44 = phi i1 [1, %if.then.4], [%rcc.tmp.42, %sc.merge.4]
  br i1 %rcc.tmp.44, label %if.then.5, label %if.else.5
if.then.5:
  ret i32 2
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.49 = load i32, ptr %current_state..tmp
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.49, 2
  br i1 %rcc.tmp.50, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.52 = load i32, ptr %time..tmp
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 60
  %rcc.tmp.54 = icmp sgt i32 %rcc.tmp.53, 55
  br i1 %rcc.tmp.54, label %if.then.7, label %if.else.7
if.then.7:
  ret i32 0
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.62 = load i32, ptr %current_state..tmp
  ret i32 %rcc.tmp.62
}
define i32 @simulateDigitalCircuit.() {
entry:
  %output_changes = alloca i32 
  %clock_cycle = alloca i32 
  %reg_a = alloca i1 
  %reg_b = alloca i1 
  %reg_c = alloca i1 
  %reg_d = alloca i1 
  %input1 = alloca i1 
  %input2 = alloca i1 
  %input3 = alloca i1 
  %old_a = alloca i1 
  %old_b = alloca i1 
  %old_c = alloca i1 
  %old_d = alloca i1 
  store i32 0, ptr %output_changes
  store i32 0, ptr %clock_cycle
  store i1 0, ptr %reg_a
  store i1 0, ptr %reg_b
  store i1 0, ptr %reg_c
  store i1 0, ptr %reg_d
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %clock_cycle
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 1000
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %clock_cycle
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 4
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 2
  store i1 %rcc.tmp.14, ptr %input1
  %rcc.tmp.16 = load i32, ptr %clock_cycle
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 8
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 4
  store i1 %rcc.tmp.18, ptr %input2
  %rcc.tmp.20 = load i32, ptr %clock_cycle
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 16
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 8
  store i1 %rcc.tmp.22, ptr %input3
  %rcc.tmp.24 = load i1, ptr %reg_a
  store i1 %rcc.tmp.24, ptr %old_a
  %rcc.tmp.26 = load i1, ptr %reg_b
  store i1 %rcc.tmp.26, ptr %old_b
  %rcc.tmp.28 = load i1, ptr %reg_c
  store i1 %rcc.tmp.28, ptr %old_c
  %rcc.tmp.30 = load i1, ptr %reg_d
  store i1 %rcc.tmp.30, ptr %old_d
  %rcc.tmp.32 = load i1, ptr %input1
  br i1 %rcc.tmp.32, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.34 = load i1, ptr %input2
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.body], [%rcc.tmp.34, %and.rhs]
  store i1 %rcc.tmp.36, ptr %reg_a
  %rcc.tmp.38 = load i1, ptr %input2
  br i1 %rcc.tmp.38, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.40 = load i1, ptr %input3
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.42 = phi i1 [1, %sc.merge], [%rcc.tmp.40, %or.rhs]
  store i1 %rcc.tmp.42, ptr %reg_b
  %rcc.tmp.44 = load i1, ptr %reg_a
  %rcc.tmp.45 = load i1, ptr %reg_b
  %rcc.tmp.46 = icmp ne i1 %rcc.tmp.44, %rcc.tmp.45
  store i1 %rcc.tmp.46, ptr %reg_c
  %rcc.tmp.48 = load i1, ptr %reg_a
  br i1 %rcc.tmp.48, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.50 = load i1, ptr %reg_b
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.52 = phi i1 [0, %sc.merge.2], [%rcc.tmp.50, %and.rhs.2]
  br i1 %rcc.tmp.52, label %and.rhs.3, label %sc.merge.4
and.rhs.3:
  %rcc.tmp.54 = load i1, ptr %reg_c
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.56 = phi i1 [0, %sc.merge.3], [%rcc.tmp.54, %and.rhs.3]
  %rcc.tmp.57 = xor i1 %rcc.tmp.56, true
  store i1 %rcc.tmp.57, ptr %reg_d
  %rcc.tmp.59 = load i1, ptr %old_a
  %rcc.tmp.60 = load i1, ptr %reg_a
  %rcc.tmp.61 = icmp ne i1 %rcc.tmp.59, %rcc.tmp.60
  br i1 %rcc.tmp.61, label %if.then, label %if.else
if.then:
  %rcc.tmp.63 = load i32, ptr %output_changes
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %output_changes
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.68 = load i1, ptr %old_b
  %rcc.tmp.69 = load i1, ptr %reg_b
  %rcc.tmp.70 = icmp ne i1 %rcc.tmp.68, %rcc.tmp.69
  br i1 %rcc.tmp.70, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.72 = load i32, ptr %output_changes
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %output_changes
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.77 = load i1, ptr %old_c
  %rcc.tmp.78 = load i1, ptr %reg_c
  %rcc.tmp.79 = icmp ne i1 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.81 = load i32, ptr %output_changes
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %output_changes
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.86 = load i1, ptr %old_d
  %rcc.tmp.87 = load i1, ptr %reg_d
  %rcc.tmp.88 = icmp ne i1 %rcc.tmp.86, %rcc.tmp.87
  br i1 %rcc.tmp.88, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.90 = load i32, ptr %output_changes
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %output_changes
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.95 = load i32, ptr %clock_cycle
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %clock_cycle
  br label %while.cond
while.end:
  %rcc.tmp.99 = load i32, ptr %output_changes
  ret i32 %rcc.tmp.99
}
define i32 @simulateBooleanAutomaton.() {
entry:
  %cells = alloca [100 x i1] 
  %fill.idx = alloca i32 
  %generation = alloca i32 
  %total_changes = alloca i32 
  %new_cells = alloca [100 x i1] 
  %fill.idx.2 = alloca i32 
  %changes = alloca i32 
  %i = alloca i32 
  %left = alloca i1 
  %center = alloca i1 
  %right = alloca i1 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 100
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [100 x i1], ptr %cells, i32 0, i32 %rcc.tmp.6
  store i1 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %generation
  store i32 0, ptr %total_changes
  %rcc.tmp.14 = getelementptr [100 x i1], ptr %cells, i32 0, i32 49
  store i1 1, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [100 x i1], ptr %cells, i32 0, i32 50
  store i1 1, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [100 x i1], ptr %cells, i32 0, i32 51
  store i1 1, ptr %rcc.tmp.18
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %generation
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 500
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.27 = load i32, ptr %fill.idx.2
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 100
  br i1 %rcc.tmp.28, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.30 = load i32, ptr %fill.idx.2
  %rcc.tmp.31 = getelementptr [100 x i1], ptr %new_cells, i32 0, i32 %rcc.tmp.30
  store i1 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %changes
  store i32 1, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 99
  br i1 %rcc.tmp.40, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = sub i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = getelementptr [100 x i1], ptr %cells, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i1, ptr %rcc.tmp.46
  store i1 %rcc.tmp.47, ptr %left
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [100 x i1], ptr %cells, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i1, ptr %rcc.tmp.51
  store i1 %rcc.tmp.52, ptr %center
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  %rcc.tmp.57 = getelementptr [100 x i1], ptr %cells, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i1, ptr %rcc.tmp.57
  store i1 %rcc.tmp.58, ptr %right
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [100 x i1], ptr %new_cells, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i1, ptr %left
  br i1 %rcc.tmp.63, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.65 = load i1, ptr %center
  %rcc.tmp.66 = xor i1 %rcc.tmp.65, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.68 = phi i1 [0, %while.body.2], [%rcc.tmp.66, %and.rhs]
  br i1 %rcc.tmp.68, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.70 = load i1, ptr %right
  %rcc.tmp.71 = xor i1 %rcc.tmp.70, true
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.73 = phi i1 [0, %sc.merge], [%rcc.tmp.71, %and.rhs.2]
  br i1 %rcc.tmp.73, label %sc.merge.3, label %or.rhs
or.rhs:
  %rcc.tmp.75 = load i1, ptr %left
  %rcc.tmp.76 = xor i1 %rcc.tmp.75, true
  br i1 %rcc.tmp.76, label %and.rhs.3, label %sc.merge.4
and.rhs.3:
  %rcc.tmp.78 = load i1, ptr %center
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.80 = phi i1 [0, %or.rhs], [%rcc.tmp.78, %and.rhs.3]
  br i1 %rcc.tmp.80, label %and.rhs.4, label %sc.merge.5
and.rhs.4:
  %rcc.tmp.82 = load i1, ptr %right
  %rcc.tmp.83 = xor i1 %rcc.tmp.82, true
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.85 = phi i1 [0, %sc.merge.4], [%rcc.tmp.83, %and.rhs.4]
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.87 = phi i1 [1, %sc.merge.2], [%rcc.tmp.85, %sc.merge.5]
  br i1 %rcc.tmp.87, label %sc.merge.6, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.89 = load i1, ptr %left
  %rcc.tmp.90 = xor i1 %rcc.tmp.89, true
  br i1 %rcc.tmp.90, label %and.rhs.5, label %sc.merge.7
and.rhs.5:
  %rcc.tmp.92 = load i1, ptr %center
  %rcc.tmp.93 = xor i1 %rcc.tmp.92, true
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.95 = phi i1 [0, %or.rhs.2], [%rcc.tmp.93, %and.rhs.5]
  br i1 %rcc.tmp.95, label %and.rhs.6, label %sc.merge.8
and.rhs.6:
  %rcc.tmp.97 = load i1, ptr %right
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.99 = phi i1 [0, %sc.merge.7], [%rcc.tmp.97, %and.rhs.6]
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.101 = phi i1 [1, %sc.merge.3], [%rcc.tmp.99, %sc.merge.8]
  br i1 %rcc.tmp.101, label %sc.merge.9, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.103 = load i1, ptr %left
  %rcc.tmp.104 = xor i1 %rcc.tmp.103, true
  br i1 %rcc.tmp.104, label %and.rhs.7, label %sc.merge.10
and.rhs.7:
  %rcc.tmp.106 = load i1, ptr %center
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.108 = phi i1 [0, %or.rhs.3], [%rcc.tmp.106, %and.rhs.7]
  br i1 %rcc.tmp.108, label %and.rhs.8, label %sc.merge.11
and.rhs.8:
  %rcc.tmp.110 = load i1, ptr %right
  br label %sc.merge.11
sc.merge.11:
  %rcc.tmp.112 = phi i1 [0, %sc.merge.10], [%rcc.tmp.110, %and.rhs.8]
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.114 = phi i1 [1, %sc.merge.6], [%rcc.tmp.112, %sc.merge.11]
  store i1 %rcc.tmp.114, ptr %rcc.tmp.62
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [100 x i1], ptr %new_cells, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.119 = load i1, ptr %rcc.tmp.118
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [100 x i1], ptr %cells, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = load i1, ptr %rcc.tmp.122
  %rcc.tmp.124 = icmp ne i1 %rcc.tmp.119, %rcc.tmp.123
  br i1 %rcc.tmp.124, label %if.then, label %if.else
if.then:
  %rcc.tmp.126 = load i32, ptr %changes
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 1
  store i32 %rcc.tmp.127, ptr %changes
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  store i32 %rcc.tmp.132, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.137 = load i32, ptr %i
  %rcc.tmp.138 = icmp slt i32 %rcc.tmp.137, 100
  br i1 %rcc.tmp.138, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [100 x i1], ptr %cells, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %i
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = getelementptr [100 x i1], ptr %new_cells, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.147 = load i1, ptr %rcc.tmp.146
  store i1 %rcc.tmp.147, ptr %rcc.tmp.143
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 1
  store i32 %rcc.tmp.150, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.153 = load i32, ptr %total_changes
  %rcc.tmp.154 = load i32, ptr %changes
  %rcc.tmp.155 = add i32 %rcc.tmp.153, %rcc.tmp.154
  store i32 %rcc.tmp.155, ptr %total_changes
  %rcc.tmp.157 = load i32, ptr %generation
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 1
  store i32 %rcc.tmp.158, ptr %generation
  br label %while.cond
while.end:
  %rcc.tmp.161 = load i32, ptr %total_changes
  ret i32 %rcc.tmp.161
}
define i1 @isPrime.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 1
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = icmp sle i32 %rcc.tmp.7, 3
  br i1 %rcc.tmp.8, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.12 = load i32, ptr %n..tmp
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 2
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 0
  br i1 %rcc.tmp.14, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.16 = load i32, ptr %n..tmp
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 3
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.20 = phi i1 [1, %if.merge.2], [%rcc.tmp.18, %or.rhs]
  br i1 %rcc.tmp.20, label %if.then.3, label %if.else.3
if.then.3:
  ret i1 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  store i32 5, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %n..tmp
  %rcc.tmp.30 = icmp sle i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.33 = load i32, ptr %n..tmp
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = srem i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.38 = load i32, ptr %n..tmp
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 2
  %rcc.tmp.41 = srem i32 %rcc.tmp.38, %rcc.tmp.40
  %rcc.tmp.42 = icmp eq i32 %rcc.tmp.41, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.44 = phi i1 [1, %while.body], [%rcc.tmp.42, %or.rhs.2]
  br i1 %rcc.tmp.44, label %if.then.4, label %if.else.4
if.then.4:
  ret i1 0
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 6
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond
while.end:
  ret i1 1
}
