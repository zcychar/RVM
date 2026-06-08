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
  call void @printlnInt.(i32 1000)
  call void @performSortingBenchmark.()
  call void @performMatrixOperations.()
  call void @performRecursiveOperations.()
  call void @performMathematicalOperations.()
  call void @performMemoryAccessPatterns.()
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @performSortingBenchmark.() {
entry:
  %test_array = alloca [1000 x i32] 
  %fill.idx = alloca i32 
  %quick_array = alloca [1000 x i32] 
  %fill.idx.2 = alloca i32 
  %heap_array = alloca [1000 x i32] 
  %fill.idx.3 = alloca i32 
  %merge_array = alloca [1000 x i32] 
  %fill.idx.4 = alloca i32 
  %selection_array = alloca [1000 x i32] 
  %fill.idx.5 = alloca i32 
  call void @printlnInt.(i32 1001)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1000 x i32], ptr %test_array, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  call void @initializeReverseArray.([1000 x i32]* %test_array, i32 1000)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 1000
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [1000 x i32], ptr %quick_array, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  call void @copyArray.([1000 x i32]* %test_array, [1000 x i32]* %quick_array, i32 1000)
  call void @quickSort.([1000 x i32]* %quick_array, i32 0, i32 999)
  call void @validateSortedArray.([1000 x i32]* %quick_array, i32 1000)
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.30 = load i32, ptr %fill.idx.3
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.30, 1000
  br i1 %rcc.tmp.31, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.33 = load i32, ptr %fill.idx.3
  %rcc.tmp.34 = getelementptr [1000 x i32], ptr %heap_array, i32 0, i32 %rcc.tmp.33
  store i32 0, ptr %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.36, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @copyArray.([1000 x i32]* %test_array, [1000 x i32]* %heap_array, i32 1000)
  call void @heapSort.([1000 x i32]* %heap_array, i32 1000)
  call void @validateSortedArray.([1000 x i32]* %heap_array, i32 1000)
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.44 = load i32, ptr %fill.idx.4
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.44, 1000
  br i1 %rcc.tmp.45, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.47 = load i32, ptr %fill.idx.4
  %rcc.tmp.48 = getelementptr [1000 x i32], ptr %merge_array, i32 0, i32 %rcc.tmp.47
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.50, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  call void @copyArray.([1000 x i32]* %test_array, [1000 x i32]* %merge_array, i32 1000)
  call void @mergeSort.([1000 x i32]* %merge_array, i32 0, i32 999)
  call void @validateSortedArray.([1000 x i32]* %merge_array, i32 1000)
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.58 = load i32, ptr %fill.idx.5
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.58, 1000
  br i1 %rcc.tmp.59, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.61 = load i32, ptr %fill.idx.5
  %rcc.tmp.62 = getelementptr [1000 x i32], ptr %selection_array, i32 0, i32 %rcc.tmp.61
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.64, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  call void @copyArray.([1000 x i32]* %test_array, [1000 x i32]* %selection_array, i32 1000)
  call void @selectionSort.([1000 x i32]* %selection_array, i32 1000)
  call void @validateSortedArray.([1000 x i32]* %selection_array, i32 1000)
  call void @printlnInt.(i32 1002)
  ret void
}
define void @initializeReverseArray.([1000 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.13 = getelementptr [1000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = sub i32 %rcc.tmp.14, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %rcc.tmp.13
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @copyArray.([1000 x i32]* %source.tmp, [1000 x i32]* %dest.tmp, i32 %size.tmp) {
entry:
  %source..tmp = alloca [1000 x i32]* 
  %dest..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %source.tmp, ptr %source..tmp
  store [1000 x i32]* %dest.tmp, ptr %dest..tmp
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
  %rcc.tmp.13 = load [1000 x i32]*, ptr %dest..tmp
  %rcc.tmp.14 = getelementptr [1000 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [1000 x i32]*, ptr %source..tmp
  %rcc.tmp.18 = getelementptr [1000 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.14
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @quickSort.([1000 x i32]* %arr.tmp, i32 %low.tmp, i32 %high.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %low..tmp = alloca i32 
  %high..tmp = alloca i32 
  %pivot_index = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %low.tmp, ptr %low..tmp
  store i32 %high.tmp, ptr %high..tmp
  %rcc.tmp.4 = load i32, ptr %low..tmp
  %rcc.tmp.5 = load i32, ptr %high..tmp
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.9 = load i32, ptr %low..tmp
  %rcc.tmp.10 = load i32, ptr %high..tmp
  %rcc.tmp.11 = call i32 @partition.([1000 x i32]* %rcc.tmp.8, i32 %rcc.tmp.9, i32 %rcc.tmp.10)
  store i32 %rcc.tmp.11, ptr %pivot_index
  %rcc.tmp.13 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.14 = load i32, ptr %low..tmp
  %rcc.tmp.15 = load i32, ptr %pivot_index
  %rcc.tmp.16 = sub i32 %rcc.tmp.15, 1
  call void @quickSort.([1000 x i32]* %rcc.tmp.13, i32 %rcc.tmp.14, i32 %rcc.tmp.16)
  %rcc.tmp.18 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.19 = load i32, ptr %pivot_index
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  %rcc.tmp.21 = load i32, ptr %high..tmp
  call void @quickSort.([1000 x i32]* %rcc.tmp.18, i32 %rcc.tmp.20, i32 %rcc.tmp.21)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @partition.([1000 x i32]* %arr.tmp, i32 %low.tmp, i32 %high.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %low..tmp = alloca i32 
  %high..tmp = alloca i32 
  %pivot = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %low.tmp, ptr %low..tmp
  store i32 %high.tmp, ptr %high..tmp
  %rcc.tmp.4 = load i32, ptr %high..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 0
  %rcc.tmp.6 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.7 = getelementptr [1000 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %pivot
  %rcc.tmp.10 = load i32, ptr %low..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.11, ptr %i
  %rcc.tmp.13 = load i32, ptr %low..tmp
  store i32 %rcc.tmp.13, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = load i32, ptr %high..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %j
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.24 = getelementptr [1000 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %pivot
  %rcc.tmp.27 = icmp sle i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %if.then, label %if.else
if.then:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  %rcc.tmp.32 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = load i32, ptr %j
  call void @swapElements.([1000 x i32]* %rcc.tmp.32, i32 %rcc.tmp.33, i32 %rcc.tmp.34)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.42 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  %rcc.tmp.45 = load i32, ptr %high..tmp
  call void @swapElements.([1000 x i32]* %rcc.tmp.42, i32 %rcc.tmp.44, i32 %rcc.tmp.45)
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  ret i32 %rcc.tmp.48
}
define void @swapElements.([1000 x i32]* %arr.tmp, i32 %i.tmp, i32 %j.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %i..tmp = alloca i32 
  %j..tmp = alloca i32 
  %temp = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %i.tmp, ptr %i..tmp
  store i32 %j.tmp, ptr %j..tmp
  %rcc.tmp.4 = load i32, ptr %i..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 0
  %rcc.tmp.6 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.7 = getelementptr [1000 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %temp
  %rcc.tmp.10 = load i32, ptr %i..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.13 = getelementptr [1000 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %j..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.17 = getelementptr [1000 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %rcc.tmp.13
  %rcc.tmp.20 = load i32, ptr %j..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.23 = getelementptr [1000 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %temp
  store i32 %rcc.tmp.24, ptr %rcc.tmp.23
  ret void
}
define void @heapSort.([1000 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = sdiv i32 %rcc.tmp.3, 2
  %rcc.tmp.5 = sub i32 %rcc.tmp.4, 1
  store i32 %rcc.tmp.5, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = load i32, ptr %i
  call void @heapify.([1000 x i32]* %rcc.tmp.12, i32 %rcc.tmp.13, i32 %rcc.tmp.14)
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = sub i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = sub i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = icmp sgt i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.28 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.29 = load i32, ptr %i
  call void @swapElements.([1000 x i32]* %rcc.tmp.28, i32 0, i32 %rcc.tmp.29)
  %rcc.tmp.31 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.32 = load i32, ptr %i
  call void @heapify.([1000 x i32]* %rcc.tmp.31, i32 %rcc.tmp.32, i32 0)
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = sub i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define void @heapify.([1000 x i32]* %arr.tmp, i32 %size.tmp, i32 %root.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %root..tmp = alloca i32 
  %largest = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %root.tmp, ptr %root..tmp
  %rcc.tmp.4 = load i32, ptr %root..tmp
  store i32 %rcc.tmp.4, ptr %largest
  %rcc.tmp.6 = load i32, ptr %root..tmp
  %rcc.tmp.7 = mul i32 2, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %left
  %rcc.tmp.10 = load i32, ptr %root..tmp
  %rcc.tmp.11 = mul i32 2, %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 2
  store i32 %rcc.tmp.12, ptr %right
  %rcc.tmp.14 = load i32, ptr %left
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.18 = load i32, ptr %left
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.21 = getelementptr [1000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %largest
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.26 = getelementptr [1000 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp sgt i32 %rcc.tmp.22, %rcc.tmp.27
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %entry], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  %rcc.tmp.32 = load i32, ptr %left
  store i32 %rcc.tmp.32, ptr %largest
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %right
  %rcc.tmp.37 = load i32, ptr %size..tmp
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.40 = load i32, ptr %right
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.43 = getelementptr [1000 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %largest
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.48 = getelementptr [1000 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp sgt i32 %rcc.tmp.44, %rcc.tmp.49
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.52 = phi i1 [0, %if.merge], [%rcc.tmp.50, %and.rhs.2]
  br i1 %rcc.tmp.52, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.54 = load i32, ptr %right
  store i32 %rcc.tmp.54, ptr %largest
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.58 = load i32, ptr %largest
  %rcc.tmp.59 = load i32, ptr %root..tmp
  %rcc.tmp.60 = icmp ne i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.62 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.63 = load i32, ptr %root..tmp
  %rcc.tmp.64 = load i32, ptr %largest
  call void @swapElements.([1000 x i32]* %rcc.tmp.62, i32 %rcc.tmp.63, i32 %rcc.tmp.64)
  %rcc.tmp.66 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.67 = load i32, ptr %size..tmp
  %rcc.tmp.68 = load i32, ptr %largest
  call void @heapify.([1000 x i32]* %rcc.tmp.66, i32 %rcc.tmp.67, i32 %rcc.tmp.68)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  ret void
}
define void @mergeSort.([1000 x i32]* %arr.tmp, i32 %left.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %left..tmp = alloca i32 
  %right..tmp = alloca i32 
  %mid = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
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
  %rcc.tmp.15 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.16 = load i32, ptr %left..tmp
  %rcc.tmp.17 = load i32, ptr %mid
  call void @mergeSort.([1000 x i32]* %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  %rcc.tmp.19 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.20 = load i32, ptr %mid
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  %rcc.tmp.22 = load i32, ptr %right..tmp
  call void @mergeSort.([1000 x i32]* %rcc.tmp.19, i32 %rcc.tmp.21, i32 %rcc.tmp.22)
  %rcc.tmp.24 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.25 = load i32, ptr %left..tmp
  %rcc.tmp.26 = load i32, ptr %mid
  %rcc.tmp.27 = load i32, ptr %right..tmp
  call void @merge.([1000 x i32]* %rcc.tmp.24, i32 %rcc.tmp.25, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @merge.([1000 x i32]* %arr.tmp, i32 %left.tmp, i32 %mid.tmp, i32 %right.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %left..tmp = alloca i32 
  %mid..tmp = alloca i32 
  %right..tmp = alloca i32 
  %left_size = alloca i32 
  %right_size = alloca i32 
  %left_array = alloca [500 x i32] 
  %fill.idx = alloca i32 
  %right_array = alloca [500 x i32] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %left.tmp, ptr %left..tmp
  store i32 %mid.tmp, ptr %mid..tmp
  store i32 %right.tmp, ptr %right..tmp
  %rcc.tmp.5 = load i32, ptr %mid..tmp
  %rcc.tmp.6 = load i32, ptr %left..tmp
  %rcc.tmp.7 = sub i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %left_size
  %rcc.tmp.10 = load i32, ptr %right..tmp
  %rcc.tmp.11 = load i32, ptr %mid..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %right_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.16 = load i32, ptr %fill.idx
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 500
  br i1 %rcc.tmp.17, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.19 = load i32, ptr %fill.idx
  %rcc.tmp.20 = getelementptr [500 x i32], ptr %left_array, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.27 = load i32, ptr %fill.idx.2
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 500
  br i1 %rcc.tmp.28, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.30 = load i32, ptr %fill.idx.2
  %rcc.tmp.31 = getelementptr [500 x i32], ptr %right_array, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.33, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = load i32, ptr %left_size
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [500 x i32], ptr %left_array, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %left..tmp
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.46, %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.51 = getelementptr [1000 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %rcc.tmp.45
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = load i32, ptr %right_size
  %rcc.tmp.62 = icmp slt i32 %rcc.tmp.60, %rcc.tmp.61
  br i1 %rcc.tmp.62, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [500 x i32], ptr %right_array, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %mid..tmp
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  %rcc.tmp.70 = load i32, ptr %j
  %rcc.tmp.71 = add i32 %rcc.tmp.69, %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.74 = getelementptr [1000 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %rcc.tmp.67
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 1
  store i32 %rcc.tmp.78, ptr %j
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  store i32 0, ptr %j
  %rcc.tmp.83 = load i32, ptr %left..tmp
  store i32 %rcc.tmp.83, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = load i32, ptr %left_size
  %rcc.tmp.88 = icmp slt i32 %rcc.tmp.86, %rcc.tmp.87
  br i1 %rcc.tmp.88, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = load i32, ptr %right_size
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.90, %rcc.tmp.91
  br label %sc.merge
sc.merge:
  %rcc.tmp.94 = phi i1 [0, %while.cond.3], [%rcc.tmp.92, %and.rhs]
  br i1 %rcc.tmp.94, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [500 x i32], ptr %left_array, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %j
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [500 x i32], ptr %right_array, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  %rcc.tmp.105 = icmp sle i32 %rcc.tmp.100, %rcc.tmp.104
  br i1 %rcc.tmp.105, label %if.then, label %if.else
if.then:
  %rcc.tmp.107 = load i32, ptr %k
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.110 = getelementptr [1000 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [500 x i32], ptr %left_array, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.114, ptr %rcc.tmp.110
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 1
  store i32 %rcc.tmp.117, ptr %i
  br label %if.merge
if.else:
  %rcc.tmp.120 = load i32, ptr %k
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.123 = getelementptr [1000 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %j
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = getelementptr [500 x i32], ptr %right_array, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  store i32 %rcc.tmp.127, ptr %rcc.tmp.123
  %rcc.tmp.129 = load i32, ptr %j
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %j
  br label %if.merge
if.merge:
  %rcc.tmp.133 = load i32, ptr %k
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 1
  store i32 %rcc.tmp.134, ptr %k
  br label %while.cond.3
while.end.3:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = load i32, ptr %left_size
  %rcc.tmp.140 = icmp slt i32 %rcc.tmp.138, %rcc.tmp.139
  br i1 %rcc.tmp.140, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.143 = load i32, ptr %k
  %rcc.tmp.144 = add i32 %rcc.tmp.143, 0
  %rcc.tmp.145 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.146 = getelementptr [1000 x i32], ptr %rcc.tmp.145, i32 0, i32 %rcc.tmp.144
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 0
  %rcc.tmp.149 = getelementptr [500 x i32], ptr %left_array, i32 0, i32 %rcc.tmp.148
  %rcc.tmp.150 = load i32, ptr %rcc.tmp.149
  store i32 %rcc.tmp.150, ptr %rcc.tmp.146
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.153, ptr %i
  %rcc.tmp.155 = load i32, ptr %k
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 1
  store i32 %rcc.tmp.156, ptr %k
  br label %while.cond.4
while.end.4:
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.160 = load i32, ptr %j
  %rcc.tmp.161 = load i32, ptr %right_size
  %rcc.tmp.162 = icmp slt i32 %rcc.tmp.160, %rcc.tmp.161
  br i1 %rcc.tmp.162, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.165 = load i32, ptr %k
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 0
  %rcc.tmp.167 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.168 = getelementptr [1000 x i32], ptr %rcc.tmp.167, i32 0, i32 %rcc.tmp.166
  %rcc.tmp.169 = load i32, ptr %j
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 0
  %rcc.tmp.171 = getelementptr [500 x i32], ptr %right_array, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.172 = load i32, ptr %rcc.tmp.171
  store i32 %rcc.tmp.172, ptr %rcc.tmp.168
  %rcc.tmp.174 = load i32, ptr %j
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 1
  store i32 %rcc.tmp.175, ptr %j
  %rcc.tmp.177 = load i32, ptr %k
  %rcc.tmp.178 = add i32 %rcc.tmp.177, 1
  store i32 %rcc.tmp.178, ptr %k
  br label %while.cond.5
while.end.5:
  ret void
}
define void @selectionSort.([1000 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %min_index = alloca i32 
  %j = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
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
  store i32 %rcc.tmp.11, ptr %min_index
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.17 = load i32, ptr %j
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.25 = getelementptr [1000 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %min_index
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.30 = getelementptr [1000 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %if.then, label %if.else
if.then:
  %rcc.tmp.34 = load i32, ptr %j
  store i32 %rcc.tmp.34, ptr %min_index
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.39, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.42 = load i32, ptr %min_index
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = icmp ne i32 %rcc.tmp.42, %rcc.tmp.43
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = load i32, ptr %min_index
  call void @swapElements.([1000 x i32]* %rcc.tmp.46, i32 %rcc.tmp.47, i32 %rcc.tmp.48)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @validateSortedArray.([1000 x i32]* %arr.tmp, i32 %size.tmp) {
entry:
  %arr..tmp = alloca [1000 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %is_sorted = alloca i32 
  store [1000 x i32]* %arr.tmp, ptr %arr..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  store i32 1, ptr %is_sorted
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = load i32, ptr %size..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.6, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.15 = getelementptr [1000 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [1000 x i32]*, ptr %arr..tmp
  %rcc.tmp.21 = getelementptr [1000 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = icmp sgt i32 %rcc.tmp.16, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  store i32 0, ptr %is_sorted
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.32 = load i32, ptr %is_sorted
  %rcc.tmp.33 = icmp eq i32 %rcc.tmp.32, 1
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  call void @printlnInt.(i32 2000)
  br label %if.merge.2
if.else.2:
  call void @printlnInt.(i32 2001)
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @performMatrixOperations.() {
entry:
  %matrix_a = alloca [400 x i32] 
  %fill.idx = alloca i32 
  %matrix_b = alloca [400 x i32] 
  %fill.idx.2 = alloca i32 
  %result_matrix = alloca [400 x i32] 
  %fill.idx.3 = alloca i32 
  %transposed = alloca [400 x i32] 
  %fill.idx.4 = alloca i32 
  %determinant = alloca i32 
  call void @printlnInt.(i32 2002)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 400
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [400 x i32], ptr %matrix_a, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 400
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [400 x i32], ptr %matrix_b, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 400
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [400 x i32], ptr %result_matrix, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  call void @initializeMatrix.([400 x i32]* %matrix_a, i32 20)
  call void @initializeMatrix.([400 x i32]* %matrix_b, i32 20)
  call void @matrixMultiply.([400 x i32]* %matrix_a, [400 x i32]* %matrix_b, [400 x i32]* %result_matrix, i32 20)
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.40 = load i32, ptr %fill.idx.4
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.40, 400
  br i1 %rcc.tmp.41, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.43 = load i32, ptr %fill.idx.4
  %rcc.tmp.44 = getelementptr [400 x i32], ptr %transposed, i32 0, i32 %rcc.tmp.43
  store i32 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.46, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  call void @matrixTranspose.([400 x i32]* %result_matrix, [400 x i32]* %transposed, i32 20)
  %rcc.tmp.50 = call i32 @calculateDeterminant.([400 x i32]* %result_matrix, i32 10)
  store i32 %rcc.tmp.50, ptr %determinant
  %rcc.tmp.52 = load i32, ptr %determinant
  call void @printlnInt.(i32 %rcc.tmp.52)
  call void @printlnInt.(i32 2003)
  ret void
}
define void @initializeMatrix.([400 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [400 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %j
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %size..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.24 = getelementptr [400 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  %rcc.tmp.29 = mul i32 %rcc.tmp.26, %rcc.tmp.28
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 50
  store i32 %rcc.tmp.30, ptr %rcc.tmp.24
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @matrixMultiply.([400 x i32]* %a.tmp, [400 x i32]* %b.tmp, [400 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %a..tmp = alloca [400 x i32]* 
  %b..tmp = alloca [400 x i32]* 
  %result..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  store [400 x i32]* %a.tmp, ptr %a..tmp
  store [400 x i32]* %b.tmp, ptr %b..tmp
  store [400 x i32]* %result.tmp, ptr %result..tmp
  store i32 %size.tmp, ptr %size..tmp
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
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.26 = getelementptr [400 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.26
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.30 = load i32, ptr %k
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.30, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = mul i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %j
  %rcc.tmp.39 = add i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = load [400 x i32]*, ptr %result..tmp
  %rcc.tmp.42 = getelementptr [400 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = load i32, ptr %size..tmp
  %rcc.tmp.45 = mul i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %k
  %rcc.tmp.47 = add i32 %rcc.tmp.45, %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = load [400 x i32]*, ptr %a..tmp
  %rcc.tmp.50 = getelementptr [400 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %k
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = mul i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %j
  %rcc.tmp.56 = add i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [400 x i32]*, ptr %b..tmp
  %rcc.tmp.59 = getelementptr [400 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = mul i32 %rcc.tmp.51, %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.63 = add i32 %rcc.tmp.62, %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.42
  %rcc.tmp.65 = load i32, ptr %k
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %k
  br label %while.cond.3
while.end.3:
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @matrixTranspose.([400 x i32]* %source.tmp, [400 x i32]* %dest.tmp, i32 %size.tmp) {
entry:
  %source..tmp = alloca [400 x i32]* 
  %dest..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [400 x i32]* %source.tmp, ptr %source..tmp
  store [400 x i32]* %dest.tmp, ptr %dest..tmp
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
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.13 = load i32, ptr %j
  %rcc.tmp.14 = load i32, ptr %size..tmp
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = load i32, ptr %size..tmp
  %rcc.tmp.20 = mul i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = load [400 x i32]*, ptr %dest..tmp
  %rcc.tmp.25 = getelementptr [400 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = load i32, ptr %size..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [400 x i32]*, ptr %source..tmp
  %rcc.tmp.33 = getelementptr [400 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.25
  %rcc.tmp.36 = load i32, ptr %j
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateDeterminant.([400 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [400 x i32]* 
  %size..tmp = alloca i32 
  %determinant = alloca i32 
  %sign = alloca i32 
  %col = alloca i32 
  %minor = alloca [81 x i32] 
  %fill.idx = alloca i32 
  store [400 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 1
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.7 = getelementptr [400 x i32], ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %size..tmp
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 2
  br i1 %rcc.tmp.12, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.14 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.15 = getelementptr [400 x i32], ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.18 = getelementptr [400 x i32], ptr %rcc.tmp.17, i32 0, i32 3
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = mul i32 %rcc.tmp.16, %rcc.tmp.19
  %rcc.tmp.21 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.22 = getelementptr [400 x i32], ptr %rcc.tmp.21, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.25 = getelementptr [400 x i32], ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = mul i32 %rcc.tmp.23, %rcc.tmp.26
  %rcc.tmp.28 = sub i32 %rcc.tmp.20, %rcc.tmp.27
  ret i32 %rcc.tmp.28
if.else.2:
  br label %if.merge.2
if.merge.2:
  store i32 0, ptr %determinant
  store i32 1, ptr %sign
  store i32 0, ptr %col
  br label %while.cond
while.cond:
  %rcc.tmp.35 = load i32, ptr %col
  %rcc.tmp.36 = load i32, ptr %size..tmp
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.42 = load i32, ptr %fill.idx
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 81
  br i1 %rcc.tmp.43, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.45 = load i32, ptr %fill.idx
  %rcc.tmp.46 = getelementptr [81 x i32], ptr %minor, i32 0, i32 %rcc.tmp.45
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = add i32 %rcc.tmp.45, 1
  store i32 %rcc.tmp.48, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.51 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.52 = load i32, ptr %size..tmp
  %rcc.tmp.53 = load i32, ptr %col
  call void @createMinorMatrix.([400 x i32]* %rcc.tmp.51, [81 x i32]* %minor, i32 %rcc.tmp.52, i32 0, i32 %rcc.tmp.53)
  %rcc.tmp.55 = load i32, ptr %sign
  %rcc.tmp.56 = load i32, ptr %col
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [400 x i32]*, ptr %matrix..tmp
  %rcc.tmp.59 = getelementptr [400 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = mul i32 %rcc.tmp.55, %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %size..tmp
  %rcc.tmp.63 = sub i32 %rcc.tmp.62, 1
  %rcc.tmp.64 = call i32 @calculateDeterminantSmall.([81 x i32]* %minor, i32 %rcc.tmp.63)
  %rcc.tmp.65 = mul i32 %rcc.tmp.61, %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %determinant
  %rcc.tmp.67 = add i32 %rcc.tmp.66, %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %determinant
  %rcc.tmp.69 = load i32, ptr %sign
  %rcc.tmp.70 = sub i32 0, %rcc.tmp.69
  store i32 %rcc.tmp.70, ptr %sign
  %rcc.tmp.72 = load i32, ptr %col
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %col
  br label %while.cond
while.end:
  %rcc.tmp.76 = load i32, ptr %determinant
  ret i32 %rcc.tmp.76
}
define void @createMinorMatrix.([400 x i32]* %source.tmp, [81 x i32]* %minor.tmp, i32 %size.tmp, i32 %skip_row.tmp, i32 %skip_col.tmp) {
entry:
  %source..tmp = alloca [400 x i32]* 
  %minor..tmp = alloca [81 x i32]* 
  %size..tmp = alloca i32 
  %skip_row..tmp = alloca i32 
  %skip_col..tmp = alloca i32 
  %minor_i = alloca i32 
  %i = alloca i32 
  %minor_j = alloca i32 
  %j = alloca i32 
  store [400 x i32]* %source.tmp, ptr %source..tmp
  store [81 x i32]* %minor.tmp, ptr %minor..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 %skip_row.tmp, ptr %skip_row..tmp
  store i32 %skip_col.tmp, ptr %skip_col..tmp
  store i32 0, ptr %minor_i
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
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %skip_row..tmp
  %rcc.tmp.16 = icmp ne i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  store i32 0, ptr %minor_j
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.21 = load i32, ptr %j
  %rcc.tmp.22 = load i32, ptr %size..tmp
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = load i32, ptr %skip_col..tmp
  %rcc.tmp.28 = icmp ne i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %minor_i
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = sub i32 %rcc.tmp.31, 1
  %rcc.tmp.33 = mul i32 %rcc.tmp.30, %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %minor_j
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [81 x i32]*, ptr %minor..tmp
  %rcc.tmp.38 = getelementptr [81 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = load i32, ptr %size..tmp
  %rcc.tmp.41 = mul i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %j
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [400 x i32]*, ptr %source..tmp
  %rcc.tmp.46 = getelementptr [400 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %rcc.tmp.38
  %rcc.tmp.49 = load i32, ptr %minor_j
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.50, ptr %minor_j
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  store i32 %rcc.tmp.55, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.58 = load i32, ptr %minor_i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 1
  store i32 %rcc.tmp.59, ptr %minor_i
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateDeterminantSmall.([81 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [81 x i32]* 
  %size..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store [81 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  %rcc.tmp.3 = load i32, ptr %size..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 1
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load [81 x i32]*, ptr %matrix..tmp
  %rcc.tmp.7 = getelementptr [81 x i32], ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %size..tmp
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 2
  br i1 %rcc.tmp.12, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.14 = load [81 x i32]*, ptr %matrix..tmp
  %rcc.tmp.15 = getelementptr [81 x i32], ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = load [81 x i32]*, ptr %matrix..tmp
  %rcc.tmp.18 = getelementptr [81 x i32], ptr %rcc.tmp.17, i32 0, i32 3
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = mul i32 %rcc.tmp.16, %rcc.tmp.19
  %rcc.tmp.21 = load [81 x i32]*, ptr %matrix..tmp
  %rcc.tmp.22 = getelementptr [81 x i32], ptr %rcc.tmp.21, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = load [81 x i32]*, ptr %matrix..tmp
  %rcc.tmp.25 = getelementptr [81 x i32], ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = mul i32 %rcc.tmp.23, %rcc.tmp.26
  %rcc.tmp.28 = sub i32 %rcc.tmp.20, %rcc.tmp.27
  ret i32 %rcc.tmp.28
if.else.2:
  br label %if.merge.2
if.merge.2:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = load i32, ptr %size..tmp
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = load i32, ptr %size..tmp
  %rcc.tmp.41 = mul i32 %rcc.tmp.39, %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [81 x i32]*, ptr %matrix..tmp
  %rcc.tmp.46 = getelementptr [81 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %sum
  %rcc.tmp.49 = add i32 %rcc.tmp.48, %rcc.tmp.47
  store i32 %rcc.tmp.49, ptr %sum
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.52, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.55 = load i32, ptr %sum
  ret i32 %rcc.tmp.55
}
define void @performRecursiveOperations.() {
entry:
  %fib_result = alloca i32 
  %fact_result = alloca i32 
  %ack_result = alloca i32 
  %tree_sum = alloca i32 
  call void @printlnInt.(i32 3001)
  %rcc.tmp.2 = call i32 @fibonacciIterative.(i32 30)
  store i32 %rcc.tmp.2, ptr %fib_result
  %rcc.tmp.4 = load i32, ptr %fib_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @factorialIterative.(i32 10)
  store i32 %rcc.tmp.6, ptr %fact_result
  %rcc.tmp.8 = load i32, ptr %fact_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @ackermannLimited.(i32 3, i32 5)
  store i32 %rcc.tmp.10, ptr %ack_result
  %rcc.tmp.12 = load i32, ptr %ack_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @simulateTreeTraversal.(i32 10)
  store i32 %rcc.tmp.14, ptr %tree_sum
  %rcc.tmp.16 = load i32, ptr %tree_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 3002)
  ret void
}
define i32 @fibonacciIterative.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %prev = alloca i32 
  %curr = alloca i32 
  %i = alloca i32 
  %temp = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 1
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %n..tmp
  ret i32 %rcc.tmp.5
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %prev
  store i32 1, ptr %curr
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %curr
  store i32 %rcc.tmp.17, ptr %temp
  %rcc.tmp.19 = load i32, ptr %prev
  %rcc.tmp.20 = load i32, ptr %curr
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %curr
  %rcc.tmp.23 = load i32, ptr %temp
  store i32 %rcc.tmp.23, ptr %prev
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %curr
  ret i32 %rcc.tmp.29
}
define i32 @factorialIterative.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 1, ptr %result
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %n..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %result
  %rcc.tmp.12 = mul i32 %rcc.tmp.11, %rcc.tmp.10
  store i32 %rcc.tmp.12, ptr %result
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.18 = load i32, ptr %result
  ret i32 %rcc.tmp.18
}
define i32 @ackermannLimited.(i32 %m.tmp, i32 %n.tmp) {
entry:
  %m..tmp = alloca i32 
  %n..tmp = alloca i32 
  store i32 %m.tmp, ptr %m..tmp
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.3 = load i32, ptr %m..tmp
  %rcc.tmp.4 = icmp eq i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %n..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  ret i32 %rcc.tmp.7
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load i32, ptr %m..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 2
  ret i32 %rcc.tmp.14
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.17 = load i32, ptr %m..tmp
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 2
  br i1 %rcc.tmp.18, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.20 = load i32, ptr %n..tmp
  %rcc.tmp.21 = mul i32 2, %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 3
  ret i32 %rcc.tmp.22
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.25 = load i32, ptr %m..tmp
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 3
  br i1 %rcc.tmp.26, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.28 = load i32, ptr %n..tmp
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  %rcc.tmp.30 = mul i32 8, %rcc.tmp.29
  %rcc.tmp.31 = sub i32 %rcc.tmp.30, 3
  ret i32 %rcc.tmp.31
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.34 = load i32, ptr %m..tmp
  %rcc.tmp.35 = load i32, ptr %n..tmp
  %rcc.tmp.36 = mul i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 42
  ret i32 %rcc.tmp.37
}
define i32 @simulateTreeTraversal.(i32 %depth.tmp) {
entry:
  %depth..tmp = alloca i32 
  %left_sum = alloca i32 
  %right_sum = alloca i32 
  store i32 %depth.tmp, ptr %depth..tmp
  %rcc.tmp.2 = load i32, ptr %depth..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %depth..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = call i32 @simulateTreeTraversal.(i32 %rcc.tmp.8)
  store i32 %rcc.tmp.9, ptr %left_sum
  %rcc.tmp.11 = load i32, ptr %depth..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.11, 1
  %rcc.tmp.13 = call i32 @simulateTreeTraversal.(i32 %rcc.tmp.12)
  store i32 %rcc.tmp.13, ptr %right_sum
  %rcc.tmp.15 = load i32, ptr %left_sum
  %rcc.tmp.16 = load i32, ptr %right_sum
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %depth..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.17, %rcc.tmp.18
  ret i32 %rcc.tmp.19
}
define void @performMathematicalOperations.() {
entry:
  %prime_count = alloca i32 
  %gcd_result = alloca i32 
  %power_result = alloca i32 
  %sqrt_result = alloca i32 
  call void @printlnInt.(i32 4001)
  %rcc.tmp.2 = call i32 @countPrimesUpTo.(i32 1000)
  store i32 %rcc.tmp.2, ptr %prime_count
  %rcc.tmp.4 = load i32, ptr %prime_count
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @performGcdOperations.()
  store i32 %rcc.tmp.6, ptr %gcd_result
  %rcc.tmp.8 = load i32, ptr %gcd_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @performPowerOperations.()
  store i32 %rcc.tmp.10, ptr %power_result
  %rcc.tmp.12 = load i32, ptr %power_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @performSquareRootOperations.()
  store i32 %rcc.tmp.14, ptr %sqrt_result
  %rcc.tmp.16 = load i32, ptr %sqrt_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 4002)
  ret void
}
define i32 @countPrimesUpTo.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %count = alloca i32 
  %num = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %count
  store i32 2, ptr %num
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %num
  %rcc.tmp.6 = load i32, ptr %limit..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %num
  %rcc.tmp.11 = call i32 @isPrimeOptimized.(i32 %rcc.tmp.10)
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 1
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %count
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %num
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %num
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %count
  ret i32 %rcc.tmp.23
}
define i32 @isPrimeOptimized.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp sle i32 %rcc.tmp.2, 1
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  %rcc.tmp.8 = icmp sle i32 %rcc.tmp.7, 3
  br i1 %rcc.tmp.8, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
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
  ret i32 0
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
  ret i32 0
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 6
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond
while.end:
  ret i32 1
}
define i32 @performGcdOperations.() {
entry:
  %total_gcd = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 0, ptr %total_gcd
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.10 = load i32, ptr %j
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.10, 100
  br i1 %rcc.tmp.11, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = mul i32 %rcc.tmp.14, 17
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = mul i32 %rcc.tmp.16, 23
  %rcc.tmp.18 = call i32 @gcdEuclidean.(i32 %rcc.tmp.15, i32 %rcc.tmp.17)
  %rcc.tmp.19 = load i32, ptr %total_gcd
  %rcc.tmp.20 = add i32 %rcc.tmp.19, %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %total_gcd
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 10
  store i32 %rcc.tmp.23, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 10
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.30 = load i32, ptr %total_gcd
  %rcc.tmp.31 = srem i32 %rcc.tmp.30, 10000
  ret i32 %rcc.tmp.31
}
define i32 @gcdEuclidean.(i32 %a.tmp, i32 %b.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %temp = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load i32, ptr %a..tmp
  store i32 %rcc.tmp.3, ptr %x
  %rcc.tmp.5 = load i32, ptr %b..tmp
  store i32 %rcc.tmp.5, ptr %y
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %y
  %rcc.tmp.9 = icmp ne i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %y
  store i32 %rcc.tmp.12, ptr %temp
  %rcc.tmp.14 = load i32, ptr %x
  %rcc.tmp.15 = load i32, ptr %y
  %rcc.tmp.16 = srem i32 %rcc.tmp.14, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %y
  %rcc.tmp.18 = load i32, ptr %temp
  store i32 %rcc.tmp.18, ptr %x
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %x
  ret i32 %rcc.tmp.21
}
define i32 @performPowerOperations.() {
entry:
  %total = alloca i32 
  %base = alloca i32 
  %exp = alloca i32 
  store i32 0, ptr %total
  store i32 2, ptr %base
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %base
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 10
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %exp
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.10 = load i32, ptr %exp
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.10, 10
  br i1 %rcc.tmp.11, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.14 = load i32, ptr %base
  %rcc.tmp.15 = load i32, ptr %exp
  %rcc.tmp.16 = call i32 @fastPower.(i32 %rcc.tmp.14, i32 %rcc.tmp.15, i32 1000)
  %rcc.tmp.17 = load i32, ptr %total
  %rcc.tmp.18 = add i32 %rcc.tmp.17, %rcc.tmp.16
  store i32 %rcc.tmp.18, ptr %total
  %rcc.tmp.20 = load i32, ptr %exp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %exp
  br label %while.cond.2
while.end.2:
  %rcc.tmp.24 = load i32, ptr %base
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %base
  br label %while.cond
while.end:
  %rcc.tmp.28 = load i32, ptr %total
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 10000
  ret i32 %rcc.tmp.29
}
define i32 @fastPower.(i32 %base.tmp, i32 %exp.tmp, i32 %m.tmp) {
entry:
  %base..tmp = alloca i32 
  %exp..tmp = alloca i32 
  %m..tmp = alloca i32 
  %result = alloca i32 
  %current_base = alloca i32 
  %current_exp = alloca i32 
  store i32 %base.tmp, ptr %base..tmp
  store i32 %exp.tmp, ptr %exp..tmp
  store i32 %m.tmp, ptr %m..tmp
  %rcc.tmp.4 = load i32, ptr %exp..tmp
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 1
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %result
  %rcc.tmp.10 = load i32, ptr %base..tmp
  store i32 %rcc.tmp.10, ptr %current_base
  %rcc.tmp.12 = load i32, ptr %exp..tmp
  store i32 %rcc.tmp.12, ptr %current_exp
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %current_exp
  %rcc.tmp.16 = icmp sgt i32 %rcc.tmp.15, 0
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %current_exp
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 2
  %rcc.tmp.21 = icmp eq i32 %rcc.tmp.20, 1
  br i1 %rcc.tmp.21, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.23 = load i32, ptr %current_base
  %rcc.tmp.24 = load i32, ptr %result
  %rcc.tmp.25 = mul i32 %rcc.tmp.24, %rcc.tmp.23
  store i32 %rcc.tmp.25, ptr %result
  %rcc.tmp.27 = load i32, ptr %m..tmp
  %rcc.tmp.28 = load i32, ptr %result
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, %rcc.tmp.27
  store i32 %rcc.tmp.29, ptr %result
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.33 = load i32, ptr %current_base
  %rcc.tmp.34 = load i32, ptr %current_base
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %current_base
  %rcc.tmp.37 = load i32, ptr %m..tmp
  %rcc.tmp.38 = load i32, ptr %current_base
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %current_base
  %rcc.tmp.41 = load i32, ptr %current_exp
  %rcc.tmp.42 = sdiv i32 %rcc.tmp.41, 2
  store i32 %rcc.tmp.42, ptr %current_exp
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %result
  ret i32 %rcc.tmp.45
}
define i32 @performSquareRootOperations.() {
entry:
  %total = alloca i32 
  %num = alloca i32 
  store i32 0, ptr %total
  store i32 1, ptr %num
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %num
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %num
  %rcc.tmp.9 = call i32 @integerSquareRoot.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = load i32, ptr %total
  %rcc.tmp.11 = add i32 %rcc.tmp.10, %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %total
  %rcc.tmp.13 = load i32, ptr %num
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %num
  br label %while.cond
while.end:
  %rcc.tmp.17 = load i32, ptr %total
  ret i32 %rcc.tmp.17
}
define i32 @integerSquareRoot.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %left = alloca i32 
  %right = alloca i32 
  %result = alloca i32 
  %mid = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp eq i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %left
  %rcc.tmp.8 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.8, ptr %right
  store i32 0, ptr %result
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %left
  %rcc.tmp.13 = load i32, ptr %right
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %left
  %rcc.tmp.18 = load i32, ptr %right
  %rcc.tmp.19 = load i32, ptr %left
  %rcc.tmp.20 = sub i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = sdiv i32 %rcc.tmp.20, 2
  %rcc.tmp.22 = add i32 %rcc.tmp.17, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %mid
  %rcc.tmp.24 = load i32, ptr %mid
  %rcc.tmp.25 = load i32, ptr %n..tmp
  %rcc.tmp.26 = load i32, ptr %mid
  %rcc.tmp.27 = sdiv i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = icmp sle i32 %rcc.tmp.24, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load i32, ptr %mid
  store i32 %rcc.tmp.30, ptr %result
  %rcc.tmp.32 = load i32, ptr %mid
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %left
  br label %if.merge.2
if.else.2:
  %rcc.tmp.36 = load i32, ptr %mid
  %rcc.tmp.37 = sub i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %right
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  %rcc.tmp.41 = load i32, ptr %result
  ret i32 %rcc.tmp.41
}
define void @performMemoryAccessPatterns.() {
entry:
  %sequential_result = alloca i32 
  %strided_result = alloca i32 
  %random_result = alloca i32 
  %blocked_result = alloca i32 
  call void @printlnInt.(i32 5001)
  %rcc.tmp.2 = call i32 @testSequentialAccess.()
  store i32 %rcc.tmp.2, ptr %sequential_result
  %rcc.tmp.4 = load i32, ptr %sequential_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @testStridedAccess.()
  store i32 %rcc.tmp.6, ptr %strided_result
  %rcc.tmp.8 = load i32, ptr %strided_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @testRandomAccess.()
  store i32 %rcc.tmp.10, ptr %random_result
  %rcc.tmp.12 = load i32, ptr %random_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @testBlockedAccess.()
  store i32 %rcc.tmp.14, ptr %blocked_result
  %rcc.tmp.16 = load i32, ptr %blocked_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 5002)
  ret void
}
define i32 @testSequentialAccess.() {
entry:
  %large_array = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 2000
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 100
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 2000
  br i1 %rcc.tmp.32, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %sum
  %rcc.tmp.40 = add i32 %rcc.tmp.39, %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %sum
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 1
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.46 = load i32, ptr %sum
  %rcc.tmp.47 = srem i32 %rcc.tmp.46, 10000
  ret i32 %rcc.tmp.47
}
define i32 @testStridedAccess.() {
entry:
  %large_array = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 2000
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 100
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 2000
  br i1 %rcc.tmp.32, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %sum
  %rcc.tmp.40 = add i32 %rcc.tmp.39, %rcc.tmp.38
  store i32 %rcc.tmp.40, ptr %sum
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 7
  store i32 %rcc.tmp.43, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.46 = load i32, ptr %sum
  %rcc.tmp.47 = srem i32 %rcc.tmp.46, 10000
  ret i32 %rcc.tmp.47
}
define i32 @testRandomAccess.() {
entry:
  %large_array = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  %index = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 2000
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 2000
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 100
  store i32 %rcc.tmp.23, ptr %rcc.tmp.21
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  store i32 1, ptr %index
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 1000
  br i1 %rcc.tmp.33, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.36 = load i32, ptr %index
  %rcc.tmp.37 = mul i32 %rcc.tmp.36, 6527
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 13904223
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 2000
  store i32 %rcc.tmp.39, ptr %index
  %rcc.tmp.41 = load i32, ptr %index
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 0
  br i1 %rcc.tmp.42, label %if.then, label %if.else
if.then:
  %rcc.tmp.44 = load i32, ptr %index
  %rcc.tmp.45 = sub i32 0, %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %index
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.49 = load i32, ptr %index
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [2000 x i32], ptr %large_array, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %sum
  %rcc.tmp.54 = add i32 %rcc.tmp.53, %rcc.tmp.52
  store i32 %rcc.tmp.54, ptr %sum
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.60 = load i32, ptr %sum
  %rcc.tmp.61 = srem i32 %rcc.tmp.60, 10000
  ret i32 %rcc.tmp.61
}
define i32 @testBlockedAccess.() {
entry:
  %matrix = alloca [1600 x i32] 
  %fill.idx = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %block_i = alloca i32 
  %block_j = alloca i32 
  %end_i = alloca i32 
  %j.2 = alloca i32 
  %end_j = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1600
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1600 x i32], ptr %matrix, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %sum
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 40
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.21 = load i32, ptr %j
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 40
  br i1 %rcc.tmp.22, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 40
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [1600 x i32], ptr %matrix, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = add i32 %rcc.tmp.31, %rcc.tmp.32
  %rcc.tmp.34 = srem i32 %rcc.tmp.33, 100
  store i32 %rcc.tmp.34, ptr %rcc.tmp.30
  %rcc.tmp.36 = load i32, ptr %j
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %block_i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.46 = load i32, ptr %block_i
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.46, 40
  br i1 %rcc.tmp.47, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %block_j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.52 = load i32, ptr %block_j
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.52, 40
  br i1 %rcc.tmp.53, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.56 = load i32, ptr %block_i
  store i32 %rcc.tmp.56, ptr %i
  %rcc.tmp.58 = load i32, ptr %block_i
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 8
  store i32 %rcc.tmp.59, ptr %end_i
  %rcc.tmp.61 = load i32, ptr %end_i
  %rcc.tmp.62 = icmp sgt i32 %rcc.tmp.61, 40
  br i1 %rcc.tmp.62, label %if.then, label %if.else
if.then:
  store i32 40, ptr %end_i
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = load i32, ptr %end_i
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.68, %rcc.tmp.69
  br i1 %rcc.tmp.70, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.73 = load i32, ptr %block_j
  store i32 %rcc.tmp.73, ptr %j.2
  %rcc.tmp.75 = load i32, ptr %block_j
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 8
  store i32 %rcc.tmp.76, ptr %end_j
  %rcc.tmp.78 = load i32, ptr %end_j
  %rcc.tmp.79 = icmp sgt i32 %rcc.tmp.78, 40
  br i1 %rcc.tmp.79, label %if.then.2, label %if.else.2
if.then.2:
  store i32 40, ptr %end_j
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.85 = load i32, ptr %j.2
  %rcc.tmp.86 = load i32, ptr %end_j
  %rcc.tmp.87 = icmp slt i32 %rcc.tmp.85, %rcc.tmp.86
  br i1 %rcc.tmp.87, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = mul i32 %rcc.tmp.90, 40
  %rcc.tmp.92 = load i32, ptr %j.2
  %rcc.tmp.93 = add i32 %rcc.tmp.91, %rcc.tmp.92
  %rcc.tmp.94 = add i32 %rcc.tmp.93, 0
  %rcc.tmp.95 = getelementptr [1600 x i32], ptr %matrix, i32 0, i32 %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %sum
  %rcc.tmp.98 = add i32 %rcc.tmp.97, %rcc.tmp.96
  store i32 %rcc.tmp.98, ptr %sum
  %rcc.tmp.100 = load i32, ptr %j.2
  %rcc.tmp.101 = add i32 %rcc.tmp.100, 1
  store i32 %rcc.tmp.101, ptr %j.2
  br label %while.cond.6
while.end.6:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 1
  store i32 %rcc.tmp.105, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.108 = load i32, ptr %block_j
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 8
  store i32 %rcc.tmp.109, ptr %block_j
  br label %while.cond.4
while.end.4:
  %rcc.tmp.112 = load i32, ptr %block_i
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 8
  store i32 %rcc.tmp.113, ptr %block_i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.116 = load i32, ptr %sum
  %rcc.tmp.117 = srem i32 %rcc.tmp.116, 10000
  ret i32 %rcc.tmp.117
}
