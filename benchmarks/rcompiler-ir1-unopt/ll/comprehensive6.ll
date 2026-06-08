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
  call void @printlnInt.(i32 1600)
  call void @testStringSearchAlgorithms.()
  call void @testTextProcessingAlgorithms.()
  call void @testStringParsingAlgorithms.()
  call void @testStringCompressionAlgorithms.()
  call void @testAdvancedStringAlgorithms.()
  call void @printlnInt.(i32 1699)
  call void @exit.(i32 0)
  ret void
}
define void @testStringSearchAlgorithms.() {
entry:
  %text = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %pattern = alloca [10 x i32] 
  %naive_matches = alloca i32 
  %kmp_matches = alloca i32 
  %boyer_moore_matches = alloca i32 
  %multi_pattern_matches = alloca i32 
  call void @printlnInt.(i32 1601)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %text, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %pattern, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.31
  call void @initializeTextString.([1000 x i32]* %text)
  call void @initializePatternString.([10 x i32]* %pattern)
  %rcc.tmp.35 = call i32 @naiveStringSearch.([1000 x i32]* %text, i32 1000, [10 x i32]* %pattern, i32 10)
  store i32 %rcc.tmp.35, ptr %naive_matches
  %rcc.tmp.37 = load i32, ptr %naive_matches
  call void @printlnInt.(i32 %rcc.tmp.37)
  %rcc.tmp.39 = call i32 @kmpStringSearch.([1000 x i32]* %text, i32 1000, [10 x i32]* %pattern, i32 10)
  store i32 %rcc.tmp.39, ptr %kmp_matches
  %rcc.tmp.41 = load i32, ptr %kmp_matches
  call void @printlnInt.(i32 %rcc.tmp.41)
  %rcc.tmp.43 = call i32 @boyerMooreStringSearch.([1000 x i32]* %text, i32 1000, [10 x i32]* %pattern, i32 10)
  store i32 %rcc.tmp.43, ptr %boyer_moore_matches
  %rcc.tmp.45 = load i32, ptr %boyer_moore_matches
  call void @printlnInt.(i32 %rcc.tmp.45)
  %rcc.tmp.47 = call i32 @multiplePatternSearch.([1000 x i32]* %text, i32 1000)
  store i32 %rcc.tmp.47, ptr %multi_pattern_matches
  %rcc.tmp.49 = load i32, ptr %multi_pattern_matches
  call void @printlnInt.(i32 %rcc.tmp.49)
  call void @printlnInt.(i32 1602)
  ret void
}
define void @initializeTextString.([1000 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %i = alloca i32 
  %seed = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %i
  store i32 125, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 1000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %seed
  %rcc.tmp.10 = mul i32 %rcc.tmp.9, 166
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 1013
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 214743
  store i32 %rcc.tmp.12, ptr %seed
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.17 = getelementptr [1000 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %seed
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 95
  %rcc.tmp.20 = add i32 32, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %rcc.tmp.17
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.26 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.27 = getelementptr [1000 x i32], ptr %rcc.tmp.26, i32 0, i32 100
  store i32 65, ptr %rcc.tmp.27
  %rcc.tmp.29 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.30 = getelementptr [1000 x i32], ptr %rcc.tmp.29, i32 0, i32 101
  store i32 66, ptr %rcc.tmp.30
  %rcc.tmp.32 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.33 = getelementptr [1000 x i32], ptr %rcc.tmp.32, i32 0, i32 102
  store i32 67, ptr %rcc.tmp.33
  %rcc.tmp.35 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.36 = getelementptr [1000 x i32], ptr %rcc.tmp.35, i32 0, i32 103
  store i32 68, ptr %rcc.tmp.36
  %rcc.tmp.38 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.39 = getelementptr [1000 x i32], ptr %rcc.tmp.38, i32 0, i32 500
  store i32 65, ptr %rcc.tmp.39
  %rcc.tmp.41 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.42 = getelementptr [1000 x i32], ptr %rcc.tmp.41, i32 0, i32 501
  store i32 66, ptr %rcc.tmp.42
  %rcc.tmp.44 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.45 = getelementptr [1000 x i32], ptr %rcc.tmp.44, i32 0, i32 502
  store i32 67, ptr %rcc.tmp.45
  %rcc.tmp.47 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.48 = getelementptr [1000 x i32], ptr %rcc.tmp.47, i32 0, i32 503
  store i32 68, ptr %rcc.tmp.48
  ret void
}
define void @initializePatternString.([10 x i32]* %pattern.tmp) {
entry:
  %pattern..tmp = alloca [10 x i32]* 
  %i = alloca i32 
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  %rcc.tmp.2 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.3 = getelementptr [10 x i32], ptr %rcc.tmp.2, i32 0, i32 0
  store i32 65, ptr %rcc.tmp.3
  %rcc.tmp.5 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %rcc.tmp.5, i32 0, i32 1
  store i32 66, ptr %rcc.tmp.6
  %rcc.tmp.8 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.9 = getelementptr [10 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  store i32 67, ptr %rcc.tmp.9
  %rcc.tmp.11 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.12 = getelementptr [10 x i32], ptr %rcc.tmp.11, i32 0, i32 3
  store i32 68, ptr %rcc.tmp.12
  store i32 4, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 10
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @naiveStringSearch.([1000 x i32]* %text.tmp, i32 %text_len.tmp, [10 x i32]* %pattern.tmp, i32 %pattern_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %pattern..tmp = alloca [10 x i32]* 
  %pattern_len..tmp = alloca i32 
  %matches = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %match_found = alloca i1 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store i32 0, ptr %matches
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %text_len..tmp
  %rcc.tmp.10 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.9, %rcc.tmp.10
  %rcc.tmp.12 = icmp sle i32 %rcc.tmp.8, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  store i1 1, ptr %match_found
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = add i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.28 = getelementptr [1000 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.33 = getelementptr [10 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp ne i32 %rcc.tmp.29, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  store i1 0, ptr %match_found
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.44 = load i1, ptr %match_found
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load i32, ptr %matches
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %matches
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %matches
  ret i32 %rcc.tmp.55
}
define i32 @kmpStringSearch.([1000 x i32]* %text.tmp, i32 %text_len.tmp, [10 x i32]* %pattern.tmp, i32 %pattern_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %pattern..tmp = alloca [10 x i32]* 
  %pattern_len..tmp = alloca i32 
  %lps = alloca [20 x i32] 
  %fill.idx = alloca i32 
  %matches = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 20
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [20 x i32], ptr %lps, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.16 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.17 = load i32, ptr %pattern_len..tmp
  call void @computeLPSArray.([10 x i32]* %rcc.tmp.16, i32 %rcc.tmp.17, [20 x i32]* %lps)
  store i32 0, ptr %matches
  store i32 0, ptr %i
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %text_len..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 0
  %rcc.tmp.35 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.36 = getelementptr [1000 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.32, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %if.then, label %if.else
if.then:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %i
  %rcc.tmp.43 = load i32, ptr %j
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %j
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.48, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.52 = load i32, ptr %matches
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %matches
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = sub i32 %rcc.tmp.56, 1
  %rcc.tmp.58 = getelementptr [20 x i32], ptr %lps, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %j
  br label %if.merge.2
if.else.2:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = load i32, ptr %text_len..tmp
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.66 = load i32, ptr %j
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.69 = getelementptr [10 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.74 = getelementptr [1000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp ne i32 %rcc.tmp.70, %rcc.tmp.75
  br label %sc.merge
sc.merge:
  %rcc.tmp.78 = phi i1 [0, %if.else.2], [%rcc.tmp.76, %and.rhs]
  br i1 %rcc.tmp.78, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.80 = load i32, ptr %j
  %rcc.tmp.81 = icmp ne i32 %rcc.tmp.80, 0
  br i1 %rcc.tmp.81, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.83 = load i32, ptr %j
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = sub i32 %rcc.tmp.84, 1
  %rcc.tmp.86 = getelementptr [20 x i32], ptr %lps, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %j
  br label %if.merge.4
if.else.4:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %i
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.98 = load i32, ptr %matches
  ret i32 %rcc.tmp.98
}
define void @computeLPSArray.([10 x i32]* %pattern.tmp, i32 %pattern_len.tmp, [20 x i32]* %lps.tmp) {
entry:
  %pattern..tmp = alloca [10 x i32]* 
  %pattern_len..tmp = alloca i32 
  %lps..tmp = alloca [20 x i32]* 
  %len = alloca i32 
  %i = alloca i32 
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store [20 x i32]* %lps.tmp, ptr %lps..tmp
  store i32 0, ptr %len
  store i32 1, ptr %i
  %rcc.tmp.6 = load [20 x i32]*, ptr %lps..tmp
  %rcc.tmp.7 = getelementptr [20 x i32], ptr %rcc.tmp.6, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.7
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %len
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.23 = getelementptr [10 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.19, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %len
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %len
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [20 x i32]*, ptr %lps..tmp
  %rcc.tmp.33 = getelementptr [20 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %len
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.40 = load i32, ptr %len
  %rcc.tmp.41 = icmp ne i32 %rcc.tmp.40, 0
  br i1 %rcc.tmp.41, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.43 = load i32, ptr %len
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = sub i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = load [20 x i32]*, ptr %lps..tmp
  %rcc.tmp.47 = getelementptr [20 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  store i32 %rcc.tmp.48, ptr %len
  br label %if.merge.2
if.else.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [20 x i32]*, ptr %lps..tmp
  %rcc.tmp.54 = getelementptr [20 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  ret void
}
define i32 @boyerMooreStringSearch.([1000 x i32]* %text.tmp, i32 %text_len.tmp, [10 x i32]* %pattern.tmp, i32 %pattern_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %pattern..tmp = alloca [10 x i32]* 
  %pattern_len..tmp = alloca i32 
  %bad_char = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %matches = alloca i32 
  %shift = alloca i32 
  %j = alloca i32 
  %bad_char_shift = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store [10 x i32]* %pattern.tmp, ptr %pattern..tmp
  store i32 %pattern_len.tmp, ptr %pattern_len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 256
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [256 x i32], ptr %bad_char, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.12 = sub i32 0, 1
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.14, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = icmp sge i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.38 = phi i1 [0, %while.body], [%rcc.tmp.36, %and.rhs]
  br i1 %rcc.tmp.38, label %if.then, label %if.else
if.then:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [256 x i32], ptr %bad_char, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %i
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %matches
  store i32 0, ptr %shift
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.58 = load i32, ptr %shift
  %rcc.tmp.59 = load i32, ptr %text_len..tmp
  %rcc.tmp.60 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.61 = sub i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = icmp sle i32 %rcc.tmp.58, %rcc.tmp.61
  br i1 %rcc.tmp.62, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.65 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.66 = sub i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = icmp sge i32 %rcc.tmp.69, 0
  br i1 %rcc.tmp.70, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.72 = load i32, ptr %j
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = load [10 x i32]*, ptr %pattern..tmp
  %rcc.tmp.75 = getelementptr [10 x i32], ptr %rcc.tmp.74, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %shift
  %rcc.tmp.78 = load i32, ptr %j
  %rcc.tmp.79 = add i32 %rcc.tmp.77, %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  %rcc.tmp.81 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.82 = getelementptr [1000 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = icmp eq i32 %rcc.tmp.76, %rcc.tmp.83
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.86 = phi i1 [0, %while.cond.3], [%rcc.tmp.84, %and.rhs.2]
  br i1 %rcc.tmp.86, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = sub i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.93 = load i32, ptr %j
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.93, 0
  br i1 %rcc.tmp.94, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.96 = load i32, ptr %matches
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %matches
  %rcc.tmp.99 = load i32, ptr %shift
  %rcc.tmp.100 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.101 = add i32 %rcc.tmp.99, %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %text_len..tmp
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.101, %rcc.tmp.102
  br i1 %rcc.tmp.103, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.105 = load i32, ptr %shift
  %rcc.tmp.106 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.107 = add i32 %rcc.tmp.105, %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %shift
  %rcc.tmp.109 = load i32, ptr %pattern_len..tmp
  %rcc.tmp.110 = add i32 %rcc.tmp.108, %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.113 = getelementptr [1000 x i32], ptr %rcc.tmp.112, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 0
  %rcc.tmp.116 = getelementptr [256 x i32], ptr %bad_char, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.118 = sub i32 %rcc.tmp.107, %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %shift
  br label %if.merge.3
if.else.3:
  %rcc.tmp.121 = load i32, ptr %shift
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.122, ptr %shift
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.126 = load i32, ptr %shift
  %rcc.tmp.127 = load i32, ptr %j
  %rcc.tmp.128 = add i32 %rcc.tmp.126, %rcc.tmp.127
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.131 = getelementptr [1000 x i32], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  %rcc.tmp.133 = icmp sge i32 %rcc.tmp.132, 0
  br i1 %rcc.tmp.133, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.135 = load i32, ptr %shift
  %rcc.tmp.136 = load i32, ptr %j
  %rcc.tmp.137 = add i32 %rcc.tmp.135, %rcc.tmp.136
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.140 = getelementptr [1000 x i32], ptr %rcc.tmp.139, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.140
  %rcc.tmp.142 = icmp slt i32 %rcc.tmp.141, 256
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.144 = phi i1 [0, %if.else.2], [%rcc.tmp.142, %and.rhs.3]
  br i1 %rcc.tmp.144, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.146 = load i32, ptr %j
  %rcc.tmp.147 = load i32, ptr %shift
  %rcc.tmp.148 = load i32, ptr %j
  %rcc.tmp.149 = add i32 %rcc.tmp.147, %rcc.tmp.148
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.152 = getelementptr [1000 x i32], ptr %rcc.tmp.151, i32 0, i32 %rcc.tmp.150
  %rcc.tmp.153 = load i32, ptr %rcc.tmp.152
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = getelementptr [256 x i32], ptr %bad_char, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.155
  %rcc.tmp.157 = sub i32 %rcc.tmp.146, %rcc.tmp.156
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.160 = phi i32 [%rcc.tmp.157, %if.then.4], [1, %if.else.4]
  store i32 %rcc.tmp.160, ptr %bad_char_shift
  %rcc.tmp.162 = load i32, ptr %bad_char_shift
  %rcc.tmp.163 = icmp sgt i32 %rcc.tmp.162, 1
  br i1 %rcc.tmp.163, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.165 = load i32, ptr %shift
  %rcc.tmp.166 = load i32, ptr %bad_char_shift
  %rcc.tmp.167 = add i32 %rcc.tmp.165, %rcc.tmp.166
  store i32 %rcc.tmp.167, ptr %shift
  br label %if.merge.5
if.else.5:
  %rcc.tmp.170 = load i32, ptr %shift
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 1
  store i32 %rcc.tmp.171, ptr %shift
  br label %if.merge.5
if.merge.5:
  br label %if.merge.2
if.merge.2:
  br label %while.cond.2
while.end.2:
  %rcc.tmp.176 = load i32, ptr %matches
  ret i32 %rcc.tmp.176
}
define i32 @multiplePatternSearch.([1000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %total_matches = alloca i32 
  %pattern1 = alloca [10 x i32] 
  %pattern2 = alloca [10 x i32] 
  %pattern3 = alloca [10 x i32] 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %total_matches
  %rcc.tmp.4 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 0
  store i32 65, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 1
  store i32 66, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [10 x i32], ptr %pattern1, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 0
  store i32 67, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 1
  store i32 68, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.36
  %rcc.tmp.38 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [10 x i32], ptr %pattern2, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 0
  store i32 69, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 1
  store i32 70, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [10 x i32], ptr %pattern3, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %total_matches
  %rcc.tmp.65 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.66 = load i32, ptr %text_len..tmp
  %rcc.tmp.67 = call i32 @naiveStringSearch.([1000 x i32]* %rcc.tmp.65, i32 %rcc.tmp.66, [10 x i32]* %pattern1, i32 2)
  %rcc.tmp.68 = add i32 %rcc.tmp.64, %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %total_matches
  %rcc.tmp.70 = load i32, ptr %total_matches
  %rcc.tmp.71 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.72 = load i32, ptr %text_len..tmp
  %rcc.tmp.73 = call i32 @naiveStringSearch.([1000 x i32]* %rcc.tmp.71, i32 %rcc.tmp.72, [10 x i32]* %pattern2, i32 2)
  %rcc.tmp.74 = add i32 %rcc.tmp.70, %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %total_matches
  %rcc.tmp.76 = load i32, ptr %total_matches
  %rcc.tmp.77 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.78 = load i32, ptr %text_len..tmp
  %rcc.tmp.79 = call i32 @naiveStringSearch.([1000 x i32]* %rcc.tmp.77, i32 %rcc.tmp.78, [10 x i32]* %pattern3, i32 2)
  %rcc.tmp.80 = add i32 %rcc.tmp.76, %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %total_matches
  %rcc.tmp.82 = load i32, ptr %total_matches
  ret i32 %rcc.tmp.82
}
define void @testTextProcessingAlgorithms.() {
entry:
  %text = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %freq_result = alloca i32 
  %transform_result = alloca i32 
  %word_count_result = alloca i32 
  %filter_result = alloca i32 
  call void @printlnInt.(i32 1603)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2000 x i32], ptr %text, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeLargeText.([2000 x i32]* %text)
  %rcc.tmp.14 = call i32 @characterFrequencyAnalysis.([2000 x i32]* %text, i32 2000)
  store i32 %rcc.tmp.14, ptr %freq_result
  %rcc.tmp.16 = load i32, ptr %freq_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @textTransformationAlgorithms.([2000 x i32]* %text, i32 2000)
  store i32 %rcc.tmp.18, ptr %transform_result
  %rcc.tmp.20 = load i32, ptr %transform_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @wordCountingAlgorithms.([2000 x i32]* %text, i32 2000)
  store i32 %rcc.tmp.22, ptr %word_count_result
  %rcc.tmp.24 = load i32, ptr %word_count_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @textFilteringAlgorithms.([2000 x i32]* %text, i32 2000)
  store i32 %rcc.tmp.26, ptr %filter_result
  %rcc.tmp.28 = load i32, ptr %filter_result
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1604)
  ret void
}
define void @initializeLargeText.([2000 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [2000 x i32]* 
  %i = alloca i32 
  %seed = alloca i32 
  %char_type = alloca i32 
  store [2000 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %i
  store i32 521, ptr %seed
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 2000
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %seed
  %rcc.tmp.10 = mul i32 %rcc.tmp.9, 166
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 194223
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 2147447
  store i32 %rcc.tmp.12, ptr %seed
  %rcc.tmp.14 = load i32, ptr %seed
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %seed
  %rcc.tmp.18 = sub i32 0, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.22 = load i32, ptr %seed
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 100
  store i32 %rcc.tmp.23, ptr %char_type
  %rcc.tmp.25 = load i32, ptr %char_type
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.25, 70
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.31 = getelementptr [2000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %seed
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 26
  %rcc.tmp.34 = add i32 97, %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.31
  br label %if.merge.2
if.else.2:
  %rcc.tmp.37 = load i32, ptr %char_type
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 85
  br i1 %rcc.tmp.38, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.43 = getelementptr [2000 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %seed
  %rcc.tmp.45 = srem i32 %rcc.tmp.44, 26
  %rcc.tmp.46 = add i32 65, %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %rcc.tmp.43
  br label %if.merge.3
if.else.3:
  %rcc.tmp.49 = load i32, ptr %char_type
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 95
  br i1 %rcc.tmp.50, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.55 = getelementptr [2000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  store i32 32, ptr %rcc.tmp.55
  br label %if.merge.4
if.else.4:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.61 = getelementptr [2000 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %seed
  %rcc.tmp.63 = srem i32 %rcc.tmp.62, 15
  %rcc.tmp.64 = add i32 33, %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %rcc.tmp.61
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @characterFrequencyAnalysis.([2000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [2000 x i32]* 
  %text_len..tmp = alloca i32 
  %freq_table = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %max_freq = alloca i32 
  %most_frequent_char = alloca i32 
  store [2000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 256
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [256 x i32], ptr %freq_table, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %text_len..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.24 = getelementptr [2000 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp sge i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.31 = getelementptr [2000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.35 = phi i1 [0, %while.body], [%rcc.tmp.33, %and.rhs]
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.40 = getelementptr [2000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [256 x i32], ptr %freq_table, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.47 = getelementptr [2000 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [256 x i32], ptr %freq_table, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %rcc.tmp.43
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %max_freq
  store i32 0, ptr %most_frequent_char
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 256
  br i1 %rcc.tmp.65, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = getelementptr [256 x i32], ptr %freq_table, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %max_freq
  %rcc.tmp.73 = icmp sgt i32 %rcc.tmp.71, %rcc.tmp.72
  br i1 %rcc.tmp.73, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [256 x i32], ptr %freq_table, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.78, ptr %max_freq
  %rcc.tmp.80 = load i32, ptr %i
  store i32 %rcc.tmp.80, ptr %most_frequent_char
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.88 = load i32, ptr %most_frequent_char
  %rcc.tmp.89 = load i32, ptr %max_freq
  %rcc.tmp.90 = add i32 %rcc.tmp.88, %rcc.tmp.89
  ret i32 %rcc.tmp.90
}
define i32 @textTransformationAlgorithms.([2000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [2000 x i32]* 
  %text_len..tmp = alloca i32 
  %transformations = alloca i32 
  %i = alloca i32 
  store [2000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %transformations
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %text_len..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.14 = getelementptr [2000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = icmp sge i32 %rcc.tmp.15, 97
  br i1 %rcc.tmp.16, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = icmp sle i32 %rcc.tmp.22, 122
  br label %sc.merge
sc.merge:
  %rcc.tmp.25 = phi i1 [0, %while.body], [%rcc.tmp.23, %and.rhs]
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.30 = getelementptr [2000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.34 = getelementptr [2000 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = sub i32 %rcc.tmp.35, 32
  store i32 %rcc.tmp.36, ptr %rcc.tmp.30
  %rcc.tmp.38 = load i32, ptr %transformations
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %transformations
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = load i32, ptr %text_len..tmp
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.49, %rcc.tmp.50
  br i1 %rcc.tmp.51, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.57 = getelementptr [2000 x i32], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = icmp sge i32 %rcc.tmp.58, 65
  br i1 %rcc.tmp.59, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.64 = getelementptr [2000 x i32], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.62
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = icmp sle i32 %rcc.tmp.65, 90
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.68 = phi i1 [0, %while.body.2], [%rcc.tmp.66, %and.rhs.2]
  br i1 %rcc.tmp.68, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.73 = getelementptr [2000 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.77 = getelementptr [2000 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  %rcc.tmp.79 = sub i32 %rcc.tmp.78, 65
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 3
  %rcc.tmp.81 = srem i32 %rcc.tmp.80, 26
  %rcc.tmp.82 = add i32 65, %rcc.tmp.81
  store i32 %rcc.tmp.82, ptr %rcc.tmp.73
  %rcc.tmp.84 = load i32, ptr %transformations
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %transformations
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.95 = load i32, ptr %i
  %rcc.tmp.96 = load i32, ptr %text_len..tmp
  %rcc.tmp.97 = icmp slt i32 %rcc.tmp.95, %rcc.tmp.96
  br i1 %rcc.tmp.97, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.100 = load i32, ptr %i
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 0
  %rcc.tmp.102 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.103 = getelementptr [2000 x i32], ptr %rcc.tmp.102, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = icmp sge i32 %rcc.tmp.104, 65
  br i1 %rcc.tmp.105, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.110 = getelementptr [2000 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = icmp sle i32 %rcc.tmp.111, 90
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.114 = phi i1 [0, %while.body.3], [%rcc.tmp.112, %and.rhs.3]
  br i1 %rcc.tmp.114, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.119 = getelementptr [2000 x i32], ptr %rcc.tmp.118, i32 0, i32 %rcc.tmp.117
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.123 = getelementptr [2000 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.125 = sub i32 %rcc.tmp.124, 65
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 13
  %rcc.tmp.127 = srem i32 %rcc.tmp.126, 26
  %rcc.tmp.128 = add i32 65, %rcc.tmp.127
  store i32 %rcc.tmp.128, ptr %rcc.tmp.119
  %rcc.tmp.130 = load i32, ptr %transformations
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %transformations
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 1
  store i32 %rcc.tmp.136, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.139 = load i32, ptr %transformations
  ret i32 %rcc.tmp.139
}
define i32 @wordCountingAlgorithms.([2000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [2000 x i32]* 
  %text_len..tmp = alloca i32 
  %word_count = alloca i32 
  %in_word = alloca i1 
  %i = alloca i32 
  %pattern_count = alloca i32 
  store [2000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %word_count
  store i1 0, ptr %in_word
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %text_len..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.15 = getelementptr [2000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 32
  br i1 %rcc.tmp.17, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.22 = getelementptr [2000 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 9
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [1, %while.body], [%rcc.tmp.24, %or.rhs]
  br i1 %rcc.tmp.26, label %sc.merge.2, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.31 = getelementptr [2000 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.32, 10
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.35 = phi i1 [1, %sc.merge], [%rcc.tmp.33, %or.rhs.2]
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  store i1 0, ptr %in_word
  br label %if.merge
if.else:
  %rcc.tmp.39 = load i1, ptr %in_word
  %rcc.tmp.40 = xor i1 %rcc.tmp.39, true
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load i32, ptr %word_count
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %word_count
  store i1 1, ptr %in_word
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %pattern_count
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = load i32, ptr %text_len..tmp
  %rcc.tmp.58 = sub i32 %rcc.tmp.57, 2
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.56, %rcc.tmp.58
  br i1 %rcc.tmp.59, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.65 = getelementptr [2000 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = icmp eq i32 %rcc.tmp.66, 84
  br i1 %rcc.tmp.67, label %sc.merge.3, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.72 = getelementptr [2000 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = icmp eq i32 %rcc.tmp.73, 116
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.76 = phi i1 [1, %while.body.2], [%rcc.tmp.74, %or.rhs.3]
  br i1 %rcc.tmp.76, label %and.rhs, label %sc.merge.4
and.rhs:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  %rcc.tmp.81 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.82 = getelementptr [2000 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.82
  %rcc.tmp.84 = icmp eq i32 %rcc.tmp.83, 72
  br i1 %rcc.tmp.84, label %sc.merge.5, label %or.rhs.4
or.rhs.4:
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 0
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  %rcc.tmp.89 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.90 = getelementptr [2000 x i32], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = icmp eq i32 %rcc.tmp.91, 104
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.94 = phi i1 [1, %and.rhs], [%rcc.tmp.92, %or.rhs.4]
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.96 = phi i1 [0, %sc.merge.3], [%rcc.tmp.94, %sc.merge.5]
  br i1 %rcc.tmp.96, label %and.rhs.2, label %sc.merge.6
and.rhs.2:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 2
  %rcc.tmp.101 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.102 = getelementptr [2000 x i32], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = icmp eq i32 %rcc.tmp.103, 69
  br i1 %rcc.tmp.104, label %sc.merge.7, label %or.rhs.5
or.rhs.5:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 2
  %rcc.tmp.109 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.110 = getelementptr [2000 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = icmp eq i32 %rcc.tmp.111, 101
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.114 = phi i1 [1, %and.rhs.2], [%rcc.tmp.112, %or.rhs.5]
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.116 = phi i1 [0, %sc.merge.4], [%rcc.tmp.114, %sc.merge.7]
  br i1 %rcc.tmp.116, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.118 = load i32, ptr %pattern_count
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %pattern_count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 1
  store i32 %rcc.tmp.124, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.127 = load i32, ptr %word_count
  %rcc.tmp.128 = load i32, ptr %pattern_count
  %rcc.tmp.129 = add i32 %rcc.tmp.127, %rcc.tmp.128
  ret i32 %rcc.tmp.129
}
define i32 @textFilteringAlgorithms.([2000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [2000 x i32]* 
  %text_len..tmp = alloca i32 
  %filtered_chars = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [2000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %filtered_chars
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %text_len..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.14 = getelementptr [2000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 32
  br i1 %rcc.tmp.16, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = icmp sgt i32 %rcc.tmp.22, 126
  br label %sc.merge
sc.merge:
  %rcc.tmp.25 = phi i1 [1, %while.body], [%rcc.tmp.23, %or.rhs]
  br i1 %rcc.tmp.25, label %if.then, label %if.else
if.then:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.30 = getelementptr [2000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  store i32 32, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %filtered_chars
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %filtered_chars
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %text_len..tmp
  %rcc.tmp.45 = sub i32 %rcc.tmp.44, 1
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.43, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.52 = getelementptr [2000 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = icmp eq i32 %rcc.tmp.53, 32
  br i1 %rcc.tmp.54, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  %rcc.tmp.59 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.60 = getelementptr [2000 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = icmp eq i32 %rcc.tmp.61, 32
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.64 = phi i1 [0, %while.body.2], [%rcc.tmp.62, %and.rhs]
  br i1 %rcc.tmp.64, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.67, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = load i32, ptr %text_len..tmp
  %rcc.tmp.72 = sub i32 %rcc.tmp.71, 1
  %rcc.tmp.73 = icmp slt i32 %rcc.tmp.70, %rcc.tmp.72
  br i1 %rcc.tmp.73, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.76 = load i32, ptr %j
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.79 = getelementptr [2000 x i32], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = load i32, ptr %j
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.84 = getelementptr [2000 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  store i32 %rcc.tmp.85, ptr %rcc.tmp.79
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.91 = load i32, ptr %text_len..tmp
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = sub i32 %rcc.tmp.92, 1
  %rcc.tmp.94 = load [2000 x i32]*, ptr %text..tmp
  %rcc.tmp.95 = getelementptr [2000 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %filtered_chars
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 1
  store i32 %rcc.tmp.98, ptr %filtered_chars
  br label %if.merge.2
if.else.2:
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %i
  br label %if.merge.2
if.merge.2:
  br label %while.cond.2
while.end.2:
  %rcc.tmp.106 = load i32, ptr %filtered_chars
  ret i32 %rcc.tmp.106
}
define void @testStringParsingAlgorithms.() {
entry:
  %input_text = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %number_parsing_result = alloca i32 
  %csv_parsing_result = alloca i32 
  %tokenization_result = alloca i32 
  %expression_result = alloca i32 
  call void @printlnInt.(i32 1605)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %input_text, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeParsingText.([1000 x i32]* %input_text)
  %rcc.tmp.14 = call i32 @parseNumbersFromText.([1000 x i32]* %input_text, i32 1000)
  store i32 %rcc.tmp.14, ptr %number_parsing_result
  %rcc.tmp.16 = load i32, ptr %number_parsing_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @parseCSVLikeData.([1000 x i32]* %input_text, i32 1000)
  store i32 %rcc.tmp.18, ptr %csv_parsing_result
  %rcc.tmp.20 = load i32, ptr %csv_parsing_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @tokenizeText.([1000 x i32]* %input_text, i32 1000)
  store i32 %rcc.tmp.22, ptr %tokenization_result
  %rcc.tmp.24 = load i32, ptr %tokenization_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @parseSimpleExpressions.([1000 x i32]* %input_text, i32 1000)
  store i32 %rcc.tmp.26, ptr %expression_result
  %rcc.tmp.28 = load i32, ptr %expression_result
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1606)
  ret void
}
define void @initializeParsingText.([1000 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %sample_text = alloca [50 x i32] 
  %i = alloca i32 
  %seed = alloca i32 
  %char_type = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  %rcc.tmp.2 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 0
  store i32 49, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 1
  store i32 50, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 2
  store i32 51, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 3
  store i32 44, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 4
  store i32 52, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 5
  store i32 53, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 6
  store i32 54, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 7
  store i32 44, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 8
  store i32 55, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 9
  store i32 56, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 10
  store i32 57, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 11
  store i32 32, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 12
  store i32 43, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 13
  store i32 32, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 14
  store i32 49, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 15
  store i32 50, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 16
  store i32 51, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 17
  store i32 32, ptr %rcc.tmp.36
  %rcc.tmp.38 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 18
  store i32 45, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 19
  store i32 32, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 20
  store i32 52, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 21
  store i32 53, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 22
  store i32 54, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 23
  store i32 32, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 24
  store i32 42, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 25
  store i32 32, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 26
  store i32 55, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 27
  store i32 56, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 28
  store i32 32, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 29
  store i32 47, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 30
  store i32 32, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 31
  store i32 57, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 32
  store i32 32, ptr %rcc.tmp.66
  %rcc.tmp.68 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 33
  store i32 61, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 34
  store i32 32, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 35
  store i32 49, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 36
  store i32 48, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 37
  store i32 48, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 38
  store i32 0, ptr %rcc.tmp.78
  %rcc.tmp.80 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 39
  store i32 0, ptr %rcc.tmp.80
  %rcc.tmp.82 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 40
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 41
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 42
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 43
  store i32 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 44
  store i32 0, ptr %rcc.tmp.90
  %rcc.tmp.92 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 45
  store i32 0, ptr %rcc.tmp.92
  %rcc.tmp.94 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 46
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 47
  store i32 0, ptr %rcc.tmp.96
  %rcc.tmp.98 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 48
  store i32 0, ptr %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 49
  store i32 0, ptr %rcc.tmp.100
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = icmp slt i32 %rcc.tmp.104, 50
  br i1 %rcc.tmp.105, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.107 = load i32, ptr %i
  %rcc.tmp.108 = icmp slt i32 %rcc.tmp.107, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.110 = phi i1 [0, %while.cond], [%rcc.tmp.108, %and.rhs]
  br i1 %rcc.tmp.110, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.116 = getelementptr [1000 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = getelementptr [50 x i32], ptr %sample_text, i32 0, i32 %rcc.tmp.118
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  store i32 %rcc.tmp.120, ptr %rcc.tmp.116
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %i
  br label %while.cond
while.end:
  store i32 99, ptr %seed
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = icmp slt i32 %rcc.tmp.128, 1000
  br i1 %rcc.tmp.129, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.132 = load i32, ptr %seed
  %rcc.tmp.133 = mul i32 %rcc.tmp.132, 525
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 54223
  %rcc.tmp.135 = srem i32 %rcc.tmp.134, 483647
  store i32 %rcc.tmp.135, ptr %seed
  %rcc.tmp.137 = load i32, ptr %seed
  %rcc.tmp.138 = icmp slt i32 %rcc.tmp.137, 0
  br i1 %rcc.tmp.138, label %if.then, label %if.else
if.then:
  %rcc.tmp.140 = load i32, ptr %seed
  %rcc.tmp.141 = sub i32 0, %rcc.tmp.140
  store i32 %rcc.tmp.141, ptr %seed
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.145 = load i32, ptr %seed
  %rcc.tmp.146 = srem i32 %rcc.tmp.145, 100
  store i32 %rcc.tmp.146, ptr %char_type
  %rcc.tmp.148 = load i32, ptr %char_type
  %rcc.tmp.149 = icmp slt i32 %rcc.tmp.148, 40
  br i1 %rcc.tmp.149, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = add i32 %rcc.tmp.151, 0
  %rcc.tmp.153 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.154 = getelementptr [1000 x i32], ptr %rcc.tmp.153, i32 0, i32 %rcc.tmp.152
  %rcc.tmp.155 = load i32, ptr %seed
  %rcc.tmp.156 = srem i32 %rcc.tmp.155, 10
  %rcc.tmp.157 = add i32 48, %rcc.tmp.156
  store i32 %rcc.tmp.157, ptr %rcc.tmp.154
  br label %if.merge.2
if.else.2:
  %rcc.tmp.160 = load i32, ptr %char_type
  %rcc.tmp.161 = icmp slt i32 %rcc.tmp.160, 50
  br i1 %rcc.tmp.161, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.163 = load i32, ptr %i
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 0
  %rcc.tmp.165 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.166 = getelementptr [1000 x i32], ptr %rcc.tmp.165, i32 0, i32 %rcc.tmp.164
  store i32 44, ptr %rcc.tmp.166
  br label %if.merge.3
if.else.3:
  %rcc.tmp.169 = load i32, ptr %char_type
  %rcc.tmp.170 = icmp slt i32 %rcc.tmp.169, 60
  br i1 %rcc.tmp.170, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.172 = load i32, ptr %i
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 0
  %rcc.tmp.174 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.175 = getelementptr [1000 x i32], ptr %rcc.tmp.174, i32 0, i32 %rcc.tmp.173
  store i32 32, ptr %rcc.tmp.175
  br label %if.merge.4
if.else.4:
  %rcc.tmp.178 = load i32, ptr %char_type
  %rcc.tmp.179 = icmp slt i32 %rcc.tmp.178, 70
  br i1 %rcc.tmp.179, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.184 = getelementptr [1000 x i32], ptr %rcc.tmp.183, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.185 = load i32, ptr %seed
  %rcc.tmp.186 = srem i32 %rcc.tmp.185, 4
  %rcc.tmp.187 = add i32 43, %rcc.tmp.186
  store i32 %rcc.tmp.187, ptr %rcc.tmp.184
  br label %if.merge.5
if.else.5:
  %rcc.tmp.190 = load i32, ptr %i
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.193 = getelementptr [1000 x i32], ptr %rcc.tmp.192, i32 0, i32 %rcc.tmp.191
  %rcc.tmp.194 = load i32, ptr %seed
  %rcc.tmp.195 = srem i32 %rcc.tmp.194, 26
  %rcc.tmp.196 = add i32 97, %rcc.tmp.195
  store i32 %rcc.tmp.196, ptr %rcc.tmp.193
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.202 = load i32, ptr %i
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 1
  store i32 %rcc.tmp.203, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @parseNumbersFromText.([1000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %numbers_found = alloca i32 
  %current_number = alloca i32 
  %in_number = alloca i1 
  %i = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %numbers_found
  store i32 0, ptr %current_number
  store i1 0, ptr %in_number
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %text_len..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.16 = getelementptr [1000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp sge i32 %rcc.tmp.17, 48
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.23 = getelementptr [1000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp sle i32 %rcc.tmp.24, 57
  br label %sc.merge
sc.merge:
  %rcc.tmp.27 = phi i1 [0, %while.body], [%rcc.tmp.25, %and.rhs]
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i1, ptr %in_number
  %rcc.tmp.30 = xor i1 %rcc.tmp.29, true
  br i1 %rcc.tmp.30, label %if.then.2, label %if.else.2
if.then.2:
  store i32 0, ptr %current_number
  store i1 1, ptr %in_number
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.36 = load i32, ptr %current_number
  %rcc.tmp.37 = mul i32 %rcc.tmp.36, 10
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.41 = getelementptr [1000 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = sub i32 %rcc.tmp.42, 48
  %rcc.tmp.44 = add i32 %rcc.tmp.37, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %current_number
  br label %if.merge
if.else:
  %rcc.tmp.47 = load i1, ptr %in_number
  br i1 %rcc.tmp.47, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.49 = load i32, ptr %numbers_found
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %numbers_found
  store i1 0, ptr %in_number
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.60 = load i1, ptr %in_number
  br i1 %rcc.tmp.60, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.62 = load i32, ptr %numbers_found
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %numbers_found
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.67 = load i32, ptr %numbers_found
  ret i32 %rcc.tmp.67
}
define i32 @parseCSVLikeData.([1000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %fields = alloca i32 
  %rows = alloca i32 
  %in_field = alloca i1 
  %i = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %fields
  store i32 0, ptr %rows
  store i1 0, ptr %in_field
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %text_len..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.16 = getelementptr [1000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 44
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i1, ptr %in_field
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.22 = load i32, ptr %fields
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %fields
  store i1 0, ptr %in_field
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.32 = getelementptr [1000 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 10
  br i1 %rcc.tmp.34, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.39 = getelementptr [1000 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.40, 13
  br label %sc.merge
sc.merge:
  %rcc.tmp.43 = phi i1 [1, %if.else], [%rcc.tmp.41, %or.rhs]
  br i1 %rcc.tmp.43, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.45 = load i1, ptr %in_field
  br i1 %rcc.tmp.45, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.47 = load i32, ptr %fields
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %fields
  store i1 0, ptr %in_field
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.53 = load i32, ptr %rows
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %rows
  br label %if.merge.3
if.else.3:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.60 = getelementptr [1000 x i32], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = icmp ne i32 %rcc.tmp.61, 32
  br i1 %rcc.tmp.62, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.64 = load i1, ptr %in_field
  %rcc.tmp.65 = xor i1 %rcc.tmp.64, true
  br i1 %rcc.tmp.65, label %if.then.6, label %if.else.6
if.then.6:
  store i1 1, ptr %in_field
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.78 = load i1, ptr %in_field
  br i1 %rcc.tmp.78, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.80 = load i32, ptr %fields
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %fields
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.85 = load i32, ptr %fields
  %rcc.tmp.86 = load i32, ptr %rows
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  ret i32 %rcc.tmp.87
}
define i32 @tokenizeText.([1000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %tokens = alloca i32 
  %current_token_type = alloca i32 
  %i = alloca i32 
  %new_token_type = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %tokens
  store i32 0, ptr %current_token_type
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %text_len..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.15 = getelementptr [1000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp sge i32 %rcc.tmp.16, 48
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.22 = getelementptr [1000 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = icmp sle i32 %rcc.tmp.23, 57
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [0, %while.body], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  br label %if.merge
if.else:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.32 = getelementptr [1000 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp sge i32 %rcc.tmp.33, 65
  br i1 %rcc.tmp.34, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.39 = getelementptr [1000 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = icmp sle i32 %rcc.tmp.40, 90
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.43 = phi i1 [0, %if.else], [%rcc.tmp.41, %and.rhs.2]
  br i1 %rcc.tmp.43, label %sc.merge.3, label %or.rhs
or.rhs:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.48 = getelementptr [1000 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp sge i32 %rcc.tmp.49, 97
  br i1 %rcc.tmp.50, label %and.rhs.3, label %sc.merge.4
and.rhs.3:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.55 = getelementptr [1000 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = icmp sle i32 %rcc.tmp.56, 122
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.59 = phi i1 [0, %or.rhs], [%rcc.tmp.57, %and.rhs.3]
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.61 = phi i1 [1, %sc.merge.2], [%rcc.tmp.59, %sc.merge.4]
  br i1 %rcc.tmp.61, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.67 = getelementptr [1000 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = icmp eq i32 %rcc.tmp.68, 43
  br i1 %rcc.tmp.69, label %sc.merge.5, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.74 = getelementptr [1000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp eq i32 %rcc.tmp.75, 45
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.78 = phi i1 [1, %if.else.2], [%rcc.tmp.76, %or.rhs.2]
  br i1 %rcc.tmp.78, label %sc.merge.6, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.83 = getelementptr [1000 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = icmp eq i32 %rcc.tmp.84, 42
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.87 = phi i1 [1, %sc.merge.5], [%rcc.tmp.85, %or.rhs.3]
  br i1 %rcc.tmp.87, label %sc.merge.7, label %or.rhs.4
or.rhs.4:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.92 = getelementptr [1000 x i32], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.93, 47
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.96 = phi i1 [1, %sc.merge.6], [%rcc.tmp.94, %or.rhs.4]
  br i1 %rcc.tmp.96, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.102 = getelementptr [1000 x i32], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  %rcc.tmp.104 = icmp eq i32 %rcc.tmp.103, 44
  br i1 %rcc.tmp.104, label %sc.merge.8, label %or.rhs.5
or.rhs.5:
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.109 = getelementptr [1000 x i32], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = icmp eq i32 %rcc.tmp.110, 46
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.113 = phi i1 [1, %if.else.3], [%rcc.tmp.111, %or.rhs.5]
  br i1 %rcc.tmp.113, label %sc.merge.9, label %or.rhs.6
or.rhs.6:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 0
  %rcc.tmp.117 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.118 = getelementptr [1000 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.118
  %rcc.tmp.120 = icmp eq i32 %rcc.tmp.119, 59
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.122 = phi i1 [1, %sc.merge.8], [%rcc.tmp.120, %or.rhs.6]
  br i1 %rcc.tmp.122, label %if.then.4, label %if.else.4
if.then.4:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.126 = phi i32 [4, %if.then.4], [0, %if.else.4]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.128 = phi i32 [3, %if.then.3], [%rcc.tmp.126, %if.merge.4]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.130 = phi i32 [2, %if.then.2], [%rcc.tmp.128, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.132 = phi i32 [1, %if.then], [%rcc.tmp.130, %if.merge.2]
  store i32 %rcc.tmp.132, ptr %new_token_type
  %rcc.tmp.134 = load i32, ptr %new_token_type
  %rcc.tmp.135 = icmp ne i32 %rcc.tmp.134, 0
  br i1 %rcc.tmp.135, label %and.rhs.4, label %sc.merge.10
and.rhs.4:
  %rcc.tmp.137 = load i32, ptr %new_token_type
  %rcc.tmp.138 = load i32, ptr %current_token_type
  %rcc.tmp.139 = icmp ne i32 %rcc.tmp.137, %rcc.tmp.138
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.141 = phi i1 [0, %if.merge], [%rcc.tmp.139, %and.rhs.4]
  br i1 %rcc.tmp.141, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.143 = load i32, ptr %current_token_type
  %rcc.tmp.144 = icmp ne i32 %rcc.tmp.143, 0
  br i1 %rcc.tmp.144, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.146 = load i32, ptr %tokens
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %tokens
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.151 = load i32, ptr %new_token_type
  store i32 %rcc.tmp.151, ptr %current_token_type
  br label %if.merge.5
if.else.5:
  %rcc.tmp.154 = load i32, ptr %new_token_type
  %rcc.tmp.155 = icmp eq i32 %rcc.tmp.154, 0
  br i1 %rcc.tmp.155, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.157 = load i32, ptr %current_token_type
  %rcc.tmp.158 = icmp ne i32 %rcc.tmp.157, 0
  br i1 %rcc.tmp.158, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.160 = load i32, ptr %tokens
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %tokens
  store i32 0, ptr %current_token_type
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.169 = load i32, ptr %i
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.173 = load i32, ptr %current_token_type
  %rcc.tmp.174 = icmp ne i32 %rcc.tmp.173, 0
  br i1 %rcc.tmp.174, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.176 = load i32, ptr %tokens
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 1
  store i32 %rcc.tmp.177, ptr %tokens
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.181 = load i32, ptr %tokens
  ret i32 %rcc.tmp.181
}
define i32 @parseSimpleExpressions.([1000 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1000 x i32]* 
  %text_len..tmp = alloca i32 
  %expressions = alloca i32 
  %operators = alloca i32 
  %numbers = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %expressions
  store i32 0, ptr %operators
  store i32 0, ptr %numbers
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %text_len..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.16 = getelementptr [1000 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = icmp sge i32 %rcc.tmp.17, 48
  br i1 %rcc.tmp.18, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.23 = getelementptr [1000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp sle i32 %rcc.tmp.24, 57
  br label %sc.merge
sc.merge:
  %rcc.tmp.27 = phi i1 [0, %while.body], [%rcc.tmp.25, %and.rhs]
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %text_len..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.37 = getelementptr [1000 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = icmp sge i32 %rcc.tmp.38, 48
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.41 = phi i1 [0, %while.cond.2], [%rcc.tmp.39, %and.rhs.2]
  br i1 %rcc.tmp.41, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.46 = getelementptr [1000 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp sle i32 %rcc.tmp.47, 57
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.50 = phi i1 [0, %sc.merge.2], [%rcc.tmp.48, %and.rhs.3]
  br i1 %rcc.tmp.50, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.57 = load i32, ptr %numbers
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %numbers
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = sub i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.67 = getelementptr [1000 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = icmp eq i32 %rcc.tmp.68, 43
  br i1 %rcc.tmp.69, label %sc.merge.4, label %or.rhs
or.rhs:
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.74 = getelementptr [1000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp eq i32 %rcc.tmp.75, 45
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.78 = phi i1 [1, %if.else], [%rcc.tmp.76, %or.rhs]
  br i1 %rcc.tmp.78, label %sc.merge.5, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.83 = getelementptr [1000 x i32], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.81
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = icmp eq i32 %rcc.tmp.84, 42
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.87 = phi i1 [1, %sc.merge.4], [%rcc.tmp.85, %or.rhs.2]
  br i1 %rcc.tmp.87, label %sc.merge.6, label %or.rhs.3
or.rhs.3:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.92 = getelementptr [1000 x i32], ptr %rcc.tmp.91, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.93, 47
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.96 = phi i1 [1, %sc.merge.5], [%rcc.tmp.94, %or.rhs.3]
  br i1 %rcc.tmp.96, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.98 = load i32, ptr %operators
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %operators
  br label %if.merge.2
if.else.2:
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = load [1000 x i32]*, ptr %text..tmp
  %rcc.tmp.105 = getelementptr [1000 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.105
  %rcc.tmp.107 = icmp eq i32 %rcc.tmp.106, 61
  br i1 %rcc.tmp.107, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.109 = load i32, ptr %numbers
  %rcc.tmp.110 = icmp sgt i32 %rcc.tmp.109, 0
  br i1 %rcc.tmp.110, label %and.rhs.4, label %sc.merge.7
and.rhs.4:
  %rcc.tmp.112 = load i32, ptr %operators
  %rcc.tmp.113 = icmp sgt i32 %rcc.tmp.112, 0
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.115 = phi i1 [0, %if.then.3], [%rcc.tmp.113, %and.rhs.4]
  br i1 %rcc.tmp.115, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.117 = load i32, ptr %expressions
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %expressions
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  store i32 0, ptr %numbers
  store i32 0, ptr %operators
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  store i32 %rcc.tmp.129, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.132 = load i32, ptr %expressions
  ret i32 %rcc.tmp.132
}
define void @testStringCompressionAlgorithms.() {
entry:
  %text = alloca [1500 x i32] 
  %fill.idx = alloca i32 
  %rle_result = alloca i32 
  %dict_result = alloca i32 
  %pattern_result = alloca i32 
  %frequency_result = alloca i32 
  call void @printlnInt.(i32 1607)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1500
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1500 x i32], ptr %text, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeCompressionText.([1500 x i32]* %text)
  %rcc.tmp.14 = call i32 @runLengthEncoding.([1500 x i32]* %text, i32 1500)
  store i32 %rcc.tmp.14, ptr %rle_result
  %rcc.tmp.16 = load i32, ptr %rle_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @simpleDictionaryCompression.([1500 x i32]* %text, i32 1500)
  store i32 %rcc.tmp.18, ptr %dict_result
  %rcc.tmp.20 = load i32, ptr %dict_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  %rcc.tmp.22 = call i32 @patternBasedCompression.([1500 x i32]* %text, i32 1500)
  store i32 %rcc.tmp.22, ptr %pattern_result
  %rcc.tmp.24 = load i32, ptr %pattern_result
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = call i32 @frequencyBasedEncoding.([1500 x i32]* %text, i32 1500)
  store i32 %rcc.tmp.26, ptr %frequency_result
  %rcc.tmp.28 = load i32, ptr %frequency_result
  call void @printlnInt.(i32 %rcc.tmp.28)
  call void @printlnInt.(i32 1608)
  ret void
}
define void @initializeCompressionText.([1500 x i32]* %text.tmp) {
entry:
  %text..tmp = alloca [1500 x i32]* 
  %i = alloca i32 
  store [1500 x i32]* %text.tmp, ptr %text..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1500
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 100
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 20
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.15 = getelementptr [1500 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  store i32 65, ptr %rcc.tmp.15
  br label %if.merge
if.else:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 100
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 40
  br i1 %rcc.tmp.20, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.25 = getelementptr [1500 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  store i32 66, ptr %rcc.tmp.25
  br label %if.merge.2
if.else.2:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 100
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 60
  br i1 %rcc.tmp.30, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.35 = getelementptr [1500 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  store i32 67, ptr %rcc.tmp.35
  br label %if.merge.3
if.else.3:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 100
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 80
  br i1 %rcc.tmp.40, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.45 = getelementptr [1500 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.43
  store i32 32, ptr %rcc.tmp.45
  br label %if.merge.4
if.else.4:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.51 = getelementptr [1500 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 5
  %rcc.tmp.54 = add i32 68, %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %rcc.tmp.51
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @runLengthEncoding.([1500 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1500 x i32]* 
  %text_len..tmp = alloca i32 
  %compressed_size = alloca i32 
  %i = alloca i32 
  %current_char = alloca i32 
  %count = alloca i32 
  store [1500 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %compressed_size
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %text_len..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.14 = getelementptr [1500 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %current_char
  store i32 1, ptr %count
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %count
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %text_len..tmp
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = load i32, ptr %count
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.30 = getelementptr [1500 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %current_char
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.31, %rcc.tmp.32
  br label %sc.merge
sc.merge:
  %rcc.tmp.35 = phi i1 [0, %while.cond.2], [%rcc.tmp.33, %and.rhs]
  br i1 %rcc.tmp.35, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.38 = load i32, ptr %count
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %count
  br label %while.cond.2
while.end.2:
  %rcc.tmp.42 = load i32, ptr %count
  %rcc.tmp.43 = icmp sgt i32 %rcc.tmp.42, 3
  br i1 %rcc.tmp.43, label %if.then, label %if.else
if.then:
  %rcc.tmp.45 = load i32, ptr %compressed_size
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 2
  store i32 %rcc.tmp.46, ptr %compressed_size
  br label %if.merge
if.else:
  %rcc.tmp.49 = load i32, ptr %compressed_size
  %rcc.tmp.50 = load i32, ptr %count
  %rcc.tmp.51 = add i32 %rcc.tmp.49, %rcc.tmp.50
  store i32 %rcc.tmp.51, ptr %compressed_size
  br label %if.merge
if.merge:
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = load i32, ptr %count
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.59 = load i32, ptr %compressed_size
  ret i32 %rcc.tmp.59
}
define i32 @simpleDictionaryCompression.([1500 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1500 x i32]* 
  %text_len..tmp = alloca i32 
  %dictionary = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %unique_chars = alloca i32 
  %i = alloca i32 
  %bits_per_char = alloca i32 
  store [1500 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 256
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [256 x i32], ptr %dictionary, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %unique_chars
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %text_len..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.25 = getelementptr [1500 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = icmp sge i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.32 = getelementptr [1500 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.body], [%rcc.tmp.34, %and.rhs]
  br i1 %rcc.tmp.36, label %if.then, label %if.else
if.then:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.41 = getelementptr [1500 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [256 x i32], ptr %dictionary, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.45, 0
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.48 = load i32, ptr %unique_chars
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %unique_chars
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 0
  %rcc.tmp.55 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.56 = getelementptr [1500 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [256 x i32], ptr %dictionary, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.63 = getelementptr [1500 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.64 = load i32, ptr %rcc.tmp.63
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [256 x i32], ptr %dictionary, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %rcc.tmp.59
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.76 = load i32, ptr %unique_chars
  %rcc.tmp.77 = icmp sle i32 %rcc.tmp.76, 2
  br i1 %rcc.tmp.77, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.80 = load i32, ptr %unique_chars
  %rcc.tmp.81 = icmp sle i32 %rcc.tmp.80, 4
  br i1 %rcc.tmp.81, label %if.then.4, label %if.else.4
if.then.4:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.84 = load i32, ptr %unique_chars
  %rcc.tmp.85 = icmp sle i32 %rcc.tmp.84, 16
  br i1 %rcc.tmp.85, label %if.then.5, label %if.else.5
if.then.5:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.89 = phi i32 [4, %if.then.5], [8, %if.else.5]
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.91 = phi i32 [2, %if.then.4], [%rcc.tmp.89, %if.merge.5]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.93 = phi i32 [1, %if.then.3], [%rcc.tmp.91, %if.merge.4]
  store i32 %rcc.tmp.93, ptr %bits_per_char
  %rcc.tmp.95 = load i32, ptr %text_len..tmp
  %rcc.tmp.96 = load i32, ptr %bits_per_char
  %rcc.tmp.97 = mul i32 %rcc.tmp.95, %rcc.tmp.96
  %rcc.tmp.98 = sdiv i32 %rcc.tmp.97, 8
  ret i32 %rcc.tmp.98
}
define i32 @patternBasedCompression.([1500 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1500 x i32]* 
  %text_len..tmp = alloca i32 
  %patterns_found = alloca i32 
  %savings = alloca i32 
  %i = alloca i32 
  %pattern = alloca i32 
  %pattern_count = alloca i32 
  %j = alloca i32 
  store [1500 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %patterns_found
  store i32 0, ptr %savings
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %text_len..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.16 = getelementptr [1500 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 256
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.23 = getelementptr [1500 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.18, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %pattern
  store i32 1, ptr %pattern_count
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 2
  store i32 %rcc.tmp.29, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = load i32, ptr %text_len..tmp
  %rcc.tmp.34 = sub i32 %rcc.tmp.33, 1
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.34
  br i1 %rcc.tmp.35, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.41 = getelementptr [1500 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = mul i32 %rcc.tmp.42, 256
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 1
  %rcc.tmp.47 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.48 = getelementptr [1500 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.43, %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %pattern
  %rcc.tmp.52 = icmp eq i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %if.then, label %if.else
if.then:
  %rcc.tmp.54 = load i32, ptr %pattern_count
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %pattern_count
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 2
  store i32 %rcc.tmp.58, ptr %j
  br label %if.merge
if.else:
  %rcc.tmp.61 = load i32, ptr %j
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %j
  br label %if.merge
if.merge:
  br label %while.cond.2
while.end.2:
  %rcc.tmp.66 = load i32, ptr %pattern_count
  %rcc.tmp.67 = icmp sgt i32 %rcc.tmp.66, 2
  br i1 %rcc.tmp.67, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.69 = load i32, ptr %patterns_found
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %patterns_found
  %rcc.tmp.72 = load i32, ptr %savings
  %rcc.tmp.73 = load i32, ptr %pattern_count
  %rcc.tmp.74 = add i32 %rcc.tmp.72, %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %savings
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.82 = load i32, ptr %patterns_found
  %rcc.tmp.83 = load i32, ptr %savings
  %rcc.tmp.84 = add i32 %rcc.tmp.82, %rcc.tmp.83
  ret i32 %rcc.tmp.84
}
define i32 @frequencyBasedEncoding.([1500 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [1500 x i32]* 
  %text_len..tmp = alloca i32 
  %frequencies = alloca [256 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %total_bits = alloca i32 
  %bit_length = alloca i32 
  store [1500 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 256
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %text_len..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.24 = getelementptr [1500 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp sge i32 %rcc.tmp.25, 0
  br i1 %rcc.tmp.26, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.31 = getelementptr [1500 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.35 = phi i1 [0, %while.body], [%rcc.tmp.33, %and.rhs]
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.40 = getelementptr [1500 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [1500 x i32]*, ptr %text..tmp
  %rcc.tmp.47 = getelementptr [1500 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %rcc.tmp.43
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %total_bits
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.63, 256
  br i1 %rcc.tmp.64, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = icmp sgt i32 %rcc.tmp.70, 0
  br i1 %rcc.tmp.71, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = load i32, ptr %text_len..tmp
  %rcc.tmp.78 = sdiv i32 %rcc.tmp.77, 2
  %rcc.tmp.79 = icmp sgt i32 %rcc.tmp.76, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %text_len..tmp
  %rcc.tmp.87 = sdiv i32 %rcc.tmp.86, 8
  %rcc.tmp.88 = icmp sgt i32 %rcc.tmp.85, %rcc.tmp.87
  br i1 %rcc.tmp.88, label %if.then.4, label %if.else.4
if.then.4:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %text_len..tmp
  %rcc.tmp.96 = sdiv i32 %rcc.tmp.95, 32
  %rcc.tmp.97 = icmp sgt i32 %rcc.tmp.94, %rcc.tmp.96
  br i1 %rcc.tmp.97, label %if.then.5, label %if.else.5
if.then.5:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.101 = phi i32 [5, %if.then.5], [8, %if.else.5]
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.103 = phi i32 [3, %if.then.4], [%rcc.tmp.101, %if.merge.5]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.105 = phi i32 [1, %if.then.3], [%rcc.tmp.103, %if.merge.4]
  store i32 %rcc.tmp.105, ptr %bit_length
  %rcc.tmp.107 = load i32, ptr %total_bits
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [256 x i32], ptr %frequencies, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  %rcc.tmp.112 = load i32, ptr %bit_length
  %rcc.tmp.113 = mul i32 %rcc.tmp.111, %rcc.tmp.112
  %rcc.tmp.114 = add i32 %rcc.tmp.107, %rcc.tmp.113
  store i32 %rcc.tmp.114, ptr %total_bits
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.118 = load i32, ptr %i
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.122 = load i32, ptr %total_bits
  %rcc.tmp.123 = sdiv i32 %rcc.tmp.122, 8
  ret i32 %rcc.tmp.123
}
define void @testAdvancedStringAlgorithms.() {
entry:
  %text1 = alloca [800 x i32] 
  %fill.idx = alloca i32 
  %text2 = alloca [800 x i32] 
  %fill.idx.2 = alloca i32 
  %lcs_result = alloca i32 
  %edit_distance = alloca i32 
  %palindrome_result = alloca i32 
  %rotation_result = alloca i32 
  call void @printlnInt.(i32 1609)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 800
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [800 x i32], ptr %text1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 800
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [800 x i32], ptr %text2, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  call void @initializeAdvancedTestStrings.([800 x i32]* %text1, [800 x i32]* %text2)
  %rcc.tmp.25 = call i32 @longestCommonSubsequence.([800 x i32]* %text1, [800 x i32]* %text2, i32 200, i32 200)
  store i32 %rcc.tmp.25, ptr %lcs_result
  %rcc.tmp.27 = load i32, ptr %lcs_result
  call void @printlnInt.(i32 %rcc.tmp.27)
  %rcc.tmp.29 = call i32 @calculateEditDistance.([800 x i32]* %text1, [800 x i32]* %text2, i32 100, i32 100)
  store i32 %rcc.tmp.29, ptr %edit_distance
  %rcc.tmp.31 = load i32, ptr %edit_distance
  call void @printlnInt.(i32 %rcc.tmp.31)
  %rcc.tmp.33 = call i32 @findLongestPalindrome.([800 x i32]* %text1, i32 400)
  store i32 %rcc.tmp.33, ptr %palindrome_result
  %rcc.tmp.35 = load i32, ptr %palindrome_result
  call void @printlnInt.(i32 %rcc.tmp.35)
  %rcc.tmp.37 = call i32 @detectStringRotations.([800 x i32]* %text1, [800 x i32]* %text2, i32 200, i32 200)
  store i32 %rcc.tmp.37, ptr %rotation_result
  %rcc.tmp.39 = load i32, ptr %rotation_result
  call void @printlnInt.(i32 %rcc.tmp.39)
  call void @printlnInt.(i32 1610)
  ret void
}
define void @initializeAdvancedTestStrings.([800 x i32]* %text1.tmp, [800 x i32]* %text2.tmp) {
entry:
  %text1..tmp = alloca [800 x i32]* 
  %text2..tmp = alloca [800 x i32]* 
  %i = alloca i32 
  store [800 x i32]* %text1.tmp, ptr %text1..tmp
  store [800 x i32]* %text2.tmp, ptr %text2..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 400
  br i1 %rcc.tmp.6, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.12 = getelementptr [800 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 26
  %rcc.tmp.15 = add i32 65, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %rcc.tmp.12
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.20 = getelementptr [800 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 3
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 26
  %rcc.tmp.24 = add i32 65, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %rcc.tmp.20
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.30 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.31 = getelementptr [800 x i32], ptr %rcc.tmp.30, i32 0, i32 100
  store i32 88, ptr %rcc.tmp.31
  %rcc.tmp.33 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.34 = getelementptr [800 x i32], ptr %rcc.tmp.33, i32 0, i32 101
  store i32 89, ptr %rcc.tmp.34
  %rcc.tmp.36 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.37 = getelementptr [800 x i32], ptr %rcc.tmp.36, i32 0, i32 102
  store i32 90, ptr %rcc.tmp.37
  %rcc.tmp.39 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.40 = getelementptr [800 x i32], ptr %rcc.tmp.39, i32 0, i32 150
  store i32 88, ptr %rcc.tmp.40
  %rcc.tmp.42 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.43 = getelementptr [800 x i32], ptr %rcc.tmp.42, i32 0, i32 151
  store i32 89, ptr %rcc.tmp.43
  %rcc.tmp.45 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.46 = getelementptr [800 x i32], ptr %rcc.tmp.45, i32 0, i32 152
  store i32 90, ptr %rcc.tmp.46
  ret void
}
define i32 @longestCommonSubsequence.([800 x i32]* %text1.tmp, [800 x i32]* %text2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %text1..tmp = alloca [800 x i32]* 
  %text2..tmp = alloca [800 x i32]* 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %prev_row = alloca [201 x i32] 
  %fill.idx = alloca i32 
  %curr_row = alloca [201 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [800 x i32]* %text1.tmp, ptr %text1..tmp
  store [800 x i32]* %text2.tmp, ptr %text2..tmp
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 201
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.10
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 201
  br i1 %rcc.tmp.19, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.21 = load i32, ptr %fill.idx.2
  %rcc.tmp.22 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.21
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.24, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %len1..tmp
  %rcc.tmp.31 = icmp sle i32 %rcc.tmp.29, %rcc.tmp.30
  br i1 %rcc.tmp.31, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = icmp sle i32 %rcc.tmp.33, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.36 = phi i1 [0, %while.cond], [%rcc.tmp.34, %and.rhs]
  br i1 %rcc.tmp.36, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.41 = load i32, ptr %j
  %rcc.tmp.42 = load i32, ptr %len2..tmp
  %rcc.tmp.43 = icmp sle i32 %rcc.tmp.41, %rcc.tmp.42
  br i1 %rcc.tmp.43, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = icmp sle i32 %rcc.tmp.45, 200
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.48 = phi i1 [0, %while.cond.2], [%rcc.tmp.46, %and.rhs.2]
  br i1 %rcc.tmp.48, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = sub i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.55 = getelementptr [800 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %j
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = sub i32 %rcc.tmp.58, 1
  %rcc.tmp.60 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.61 = getelementptr [800 x i32], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = icmp eq i32 %rcc.tmp.56, %rcc.tmp.62
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %j
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = sub i32 %rcc.tmp.69, 1
  %rcc.tmp.71 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %rcc.tmp.67
  br label %if.merge
if.else:
  %rcc.tmp.76 = load i32, ptr %j
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %j
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 0
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = icmp sgt i32 %rcc.tmp.79, %rcc.tmp.84
  br i1 %rcc.tmp.85, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  store i32 %rcc.tmp.93, ptr %rcc.tmp.89
  br label %if.merge.2
if.else.2:
  %rcc.tmp.96 = load i32, ptr %j
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load i32, ptr %j
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = sub i32 %rcc.tmp.100, 1
  %rcc.tmp.102 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.102
  store i32 %rcc.tmp.103, ptr %rcc.tmp.98
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.107 = load i32, ptr %j
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.113 = load i32, ptr %j
  %rcc.tmp.114 = load i32, ptr %len2..tmp
  %rcc.tmp.115 = icmp sle i32 %rcc.tmp.113, %rcc.tmp.114
  br i1 %rcc.tmp.115, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.117 = load i32, ptr %j
  %rcc.tmp.118 = icmp sle i32 %rcc.tmp.117, 200
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.120 = phi i1 [0, %while.cond.3], [%rcc.tmp.118, %and.rhs.3]
  br i1 %rcc.tmp.120, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.123 = load i32, ptr %j
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %j
  %rcc.tmp.127 = add i32 %rcc.tmp.126, 0
  %rcc.tmp.128 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.127
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.128
  store i32 %rcc.tmp.129, ptr %rcc.tmp.125
  %rcc.tmp.131 = load i32, ptr %j
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 0
  %rcc.tmp.133 = getelementptr [201 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.132
  store i32 0, ptr %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %j
  %rcc.tmp.136 = add i32 %rcc.tmp.135, 1
  store i32 %rcc.tmp.136, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.139 = load i32, ptr %i
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  store i32 %rcc.tmp.140, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.143 = load i32, ptr %len2..tmp
  %rcc.tmp.144 = icmp sle i32 %rcc.tmp.143, 200
  br i1 %rcc.tmp.144, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.146 = load i32, ptr %len2..tmp
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  br label %if.merge.3
if.else.3:
  %rcc.tmp.151 = getelementptr [201 x i32], ptr %prev_row, i32 0, i32 200
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.151
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.154 = phi i32 [%rcc.tmp.149, %if.then.3], [%rcc.tmp.152, %if.else.3]
  ret i32 %rcc.tmp.154
}
define i32 @calculateEditDistance.([800 x i32]* %text1.tmp, [800 x i32]* %text2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %text1..tmp = alloca [800 x i32]* 
  %text2..tmp = alloca [800 x i32]* 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %max_len = alloca i32 
  %actual_len1 = alloca i32 
  %actual_len2 = alloca i32 
  %prev_row = alloca [101 x i32] 
  %fill.idx = alloca i32 
  %curr_row = alloca [101 x i32] 
  %fill.idx.2 = alloca i32 
  %j = alloca i32 
  %i = alloca i32 
  %cost = alloca i32 
  %delete_cost = alloca i32 
  %insert_cost = alloca i32 
  %substitute_cost = alloca i32 
  %min_cost = alloca i32 
  store [800 x i32]* %text1.tmp, ptr %text1..tmp
  store [800 x i32]* %text2.tmp, ptr %text2..tmp
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  store i32 100, ptr %max_len
  %rcc.tmp.6 = load i32, ptr %len1..tmp
  %rcc.tmp.7 = load i32, ptr %max_len
  %rcc.tmp.8 = icmp sgt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %max_len
  br label %if.merge
if.else:
  %rcc.tmp.12 = load i32, ptr %len1..tmp
  br label %if.merge
if.merge:
  %rcc.tmp.14 = phi i32 [%rcc.tmp.10, %if.then], [%rcc.tmp.12, %if.else]
  store i32 %rcc.tmp.14, ptr %actual_len1
  %rcc.tmp.16 = load i32, ptr %len2..tmp
  %rcc.tmp.17 = load i32, ptr %max_len
  %rcc.tmp.18 = icmp sgt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.20 = load i32, ptr %max_len
  br label %if.merge.2
if.else.2:
  %rcc.tmp.22 = load i32, ptr %len2..tmp
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.24 = phi i32 [%rcc.tmp.20, %if.then.2], [%rcc.tmp.22, %if.else.2]
  store i32 %rcc.tmp.24, ptr %actual_len2
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.28 = load i32, ptr %fill.idx
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 101
  br i1 %rcc.tmp.29, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.31 = load i32, ptr %fill.idx
  %rcc.tmp.32 = getelementptr [101 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.34, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.39 = load i32, ptr %fill.idx.2
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 101
  br i1 %rcc.tmp.40, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.42 = load i32, ptr %fill.idx.2
  %rcc.tmp.43 = getelementptr [101 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.42
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.45, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = load i32, ptr %actual_len2
  %rcc.tmp.52 = icmp sle i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [101 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %j
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %j
  br label %while.cond
while.end:
  store i32 1, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = load i32, ptr %actual_len1
  %rcc.tmp.68 = icmp sle i32 %rcc.tmp.66, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.71 = getelementptr [101 x i32], ptr %curr_row, i32 0, i32 0
  %rcc.tmp.72 = load i32, ptr %i
  store i32 %rcc.tmp.72, ptr %rcc.tmp.71
  store i32 1, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.76 = load i32, ptr %j
  %rcc.tmp.77 = load i32, ptr %actual_len2
  %rcc.tmp.78 = icmp sle i32 %rcc.tmp.76, %rcc.tmp.77
  br i1 %rcc.tmp.78, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = sub i32 %rcc.tmp.82, 1
  %rcc.tmp.84 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.85 = getelementptr [800 x i32], ptr %rcc.tmp.84, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %j
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = sub i32 %rcc.tmp.88, 1
  %rcc.tmp.90 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.91 = getelementptr [800 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = icmp eq i32 %rcc.tmp.86, %rcc.tmp.92
  br i1 %rcc.tmp.93, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.97 = phi i32 [0, %if.then.3], [1, %if.else.3]
  store i32 %rcc.tmp.97, ptr %cost
  %rcc.tmp.99 = load i32, ptr %j
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [101 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  store i32 %rcc.tmp.103, ptr %delete_cost
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = sub i32 %rcc.tmp.106, 1
  %rcc.tmp.108 = getelementptr [101 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %insert_cost
  %rcc.tmp.112 = load i32, ptr %j
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 0
  %rcc.tmp.114 = sub i32 %rcc.tmp.113, 1
  %rcc.tmp.115 = getelementptr [101 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %cost
  %rcc.tmp.118 = add i32 %rcc.tmp.116, %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %substitute_cost
  %rcc.tmp.120 = load i32, ptr %delete_cost
  %rcc.tmp.121 = load i32, ptr %insert_cost
  %rcc.tmp.122 = icmp slt i32 %rcc.tmp.120, %rcc.tmp.121
  br i1 %rcc.tmp.122, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.124 = load i32, ptr %delete_cost
  br label %if.merge.4
if.else.4:
  %rcc.tmp.126 = load i32, ptr %insert_cost
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.128 = phi i32 [%rcc.tmp.124, %if.then.4], [%rcc.tmp.126, %if.else.4]
  store i32 %rcc.tmp.128, ptr %min_cost
  %rcc.tmp.130 = load i32, ptr %substitute_cost
  %rcc.tmp.131 = load i32, ptr %min_cost
  %rcc.tmp.132 = icmp slt i32 %rcc.tmp.130, %rcc.tmp.131
  br i1 %rcc.tmp.132, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.134 = load i32, ptr %j
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [101 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %substitute_cost
  store i32 %rcc.tmp.137, ptr %rcc.tmp.136
  br label %if.merge.5
if.else.5:
  %rcc.tmp.140 = load i32, ptr %j
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 0
  %rcc.tmp.142 = getelementptr [101 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.141
  %rcc.tmp.143 = load i32, ptr %min_cost
  store i32 %rcc.tmp.143, ptr %rcc.tmp.142
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.146 = load i32, ptr %j
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %j
  br label %while.cond.3
while.end.3:
  store i32 0, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.152 = load i32, ptr %j
  %rcc.tmp.153 = load i32, ptr %actual_len2
  %rcc.tmp.154 = icmp sle i32 %rcc.tmp.152, %rcc.tmp.153
  br i1 %rcc.tmp.154, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.157 = load i32, ptr %j
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [101 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %j
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 0
  %rcc.tmp.162 = getelementptr [101 x i32], ptr %curr_row, i32 0, i32 %rcc.tmp.161
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %rcc.tmp.159
  %rcc.tmp.165 = load i32, ptr %j
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 1
  store i32 %rcc.tmp.166, ptr %j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.169 = load i32, ptr %i
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.173 = load i32, ptr %actual_len2
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = getelementptr [101 x i32], ptr %prev_row, i32 0, i32 %rcc.tmp.174
  %rcc.tmp.176 = load i32, ptr %rcc.tmp.175
  ret i32 %rcc.tmp.176
}
define i32 @findLongestPalindrome.([800 x i32]* %text.tmp, i32 %text_len.tmp) {
entry:
  %text..tmp = alloca [800 x i32]* 
  %text_len..tmp = alloca i32 
  %max_length = alloca i32 
  %i = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %current_length = alloca i32 
  %left.2 = alloca i32 
  %right.2 = alloca i32 
  %current_length.2 = alloca i32 
  store [800 x i32]* %text.tmp, ptr %text..tmp
  store i32 %text_len.tmp, ptr %text_len..tmp
  store i32 1, ptr %max_length
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %text_len..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  store i32 %rcc.tmp.11, ptr %left
  %rcc.tmp.13 = load i32, ptr %i
  store i32 %rcc.tmp.13, ptr %right
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %left
  %rcc.tmp.17 = icmp sge i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.19 = load i32, ptr %right
  %rcc.tmp.20 = load i32, ptr %text_len..tmp
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br label %sc.merge
sc.merge:
  %rcc.tmp.23 = phi i1 [0, %while.cond.2], [%rcc.tmp.21, %and.rhs]
  br i1 %rcc.tmp.23, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.25 = load i32, ptr %left
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = load [800 x i32]*, ptr %text..tmp
  %rcc.tmp.28 = getelementptr [800 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %right
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [800 x i32]*, ptr %text..tmp
  %rcc.tmp.33 = getelementptr [800 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.29, %rcc.tmp.34
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.37 = phi i1 [0, %sc.merge], [%rcc.tmp.35, %and.rhs.2]
  br i1 %rcc.tmp.37, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.40 = load i32, ptr %right
  %rcc.tmp.41 = load i32, ptr %left
  %rcc.tmp.42 = sub i32 %rcc.tmp.40, %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %current_length
  %rcc.tmp.45 = load i32, ptr %current_length
  %rcc.tmp.46 = load i32, ptr %max_length
  %rcc.tmp.47 = icmp sgt i32 %rcc.tmp.45, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %if.then, label %if.else
if.then:
  %rcc.tmp.49 = load i32, ptr %current_length
  store i32 %rcc.tmp.49, ptr %max_length
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %left
  %rcc.tmp.54 = sub i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %left
  %rcc.tmp.56 = load i32, ptr %right
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %right
  br label %while.cond.2
while.end.2:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = load i32, ptr %text_len..tmp
  %rcc.tmp.68 = sub i32 %rcc.tmp.67, 1
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.66, %rcc.tmp.68
  br i1 %rcc.tmp.69, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.72 = load i32, ptr %i
  store i32 %rcc.tmp.72, ptr %left.2
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %right.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.78 = load i32, ptr %left.2
  %rcc.tmp.79 = icmp sge i32 %rcc.tmp.78, 0
  br i1 %rcc.tmp.79, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.81 = load i32, ptr %right.2
  %rcc.tmp.82 = load i32, ptr %text_len..tmp
  %rcc.tmp.83 = icmp slt i32 %rcc.tmp.81, %rcc.tmp.82
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.85 = phi i1 [0, %while.cond.4], [%rcc.tmp.83, %and.rhs.3]
  br i1 %rcc.tmp.85, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.87 = load i32, ptr %left.2
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 0
  %rcc.tmp.89 = load [800 x i32]*, ptr %text..tmp
  %rcc.tmp.90 = getelementptr [800 x i32], ptr %rcc.tmp.89, i32 0, i32 %rcc.tmp.88
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %right.2
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = load [800 x i32]*, ptr %text..tmp
  %rcc.tmp.95 = getelementptr [800 x i32], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = icmp eq i32 %rcc.tmp.91, %rcc.tmp.96
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.99 = phi i1 [0, %sc.merge.3], [%rcc.tmp.97, %and.rhs.4]
  br i1 %rcc.tmp.99, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.102 = load i32, ptr %right.2
  %rcc.tmp.103 = load i32, ptr %left.2
  %rcc.tmp.104 = sub i32 %rcc.tmp.102, %rcc.tmp.103
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 1
  store i32 %rcc.tmp.105, ptr %current_length.2
  %rcc.tmp.107 = load i32, ptr %current_length.2
  %rcc.tmp.108 = load i32, ptr %max_length
  %rcc.tmp.109 = icmp sgt i32 %rcc.tmp.107, %rcc.tmp.108
  br i1 %rcc.tmp.109, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.111 = load i32, ptr %current_length.2
  store i32 %rcc.tmp.111, ptr %max_length
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.115 = load i32, ptr %left.2
  %rcc.tmp.116 = sub i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %left.2
  %rcc.tmp.118 = load i32, ptr %right.2
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 1
  store i32 %rcc.tmp.119, ptr %right.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.126 = load i32, ptr %max_length
  ret i32 %rcc.tmp.126
}
define i32 @detectStringRotations.([800 x i32]* %text1.tmp, [800 x i32]* %text2.tmp, i32 %len1.tmp, i32 %len2.tmp) {
entry:
  %text1..tmp = alloca [800 x i32]* 
  %text2..tmp = alloca [800 x i32]* 
  %len1..tmp = alloca i32 
  %len2..tmp = alloca i32 
  %rotations_found = alloca i32 
  %shift = alloca i32 
  %is_rotation = alloca i1 
  %i = alloca i32 
  %rotated_index = alloca i32 
  store [800 x i32]* %text1.tmp, ptr %text1..tmp
  store [800 x i32]* %text2.tmp, ptr %text2..tmp
  store i32 %len1.tmp, ptr %len1..tmp
  store i32 %len2.tmp, ptr %len2..tmp
  %rcc.tmp.5 = load i32, ptr %len1..tmp
  %rcc.tmp.6 = load i32, ptr %len2..tmp
  %rcc.tmp.7 = icmp ne i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %rotations_found
  store i32 0, ptr %shift
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %shift
  %rcc.tmp.15 = load i32, ptr %len1..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.18 = load i32, ptr %shift
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.18, 200
  br label %sc.merge
sc.merge:
  %rcc.tmp.21 = phi i1 [0, %while.cond], [%rcc.tmp.19, %and.rhs]
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i1 1, ptr %is_rotation
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = load i32, ptr %len1..tmp
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.27, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 200
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.34 = phi i1 [0, %while.cond.2], [%rcc.tmp.32, %and.rhs.2]
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = load i32, ptr %shift
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %len1..tmp
  %rcc.tmp.41 = srem i32 %rcc.tmp.39, %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %rotated_index
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [800 x i32]*, ptr %text1..tmp
  %rcc.tmp.46 = getelementptr [800 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %rotated_index
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [800 x i32]*, ptr %text2..tmp
  %rcc.tmp.51 = getelementptr [800 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = icmp ne i32 %rcc.tmp.47, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.2, label %if.else.2
if.then.2:
  store i1 0, ptr %is_rotation
  br label %while.linker.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.62 = load i1, ptr %is_rotation
  br i1 %rcc.tmp.62, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.64 = load i32, ptr %rotations_found
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %rotations_found
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.69 = load i32, ptr %shift
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %shift
  br label %while.cond
while.end:
  %rcc.tmp.73 = load i32, ptr %rotations_found
  ret i32 %rcc.tmp.73
}
