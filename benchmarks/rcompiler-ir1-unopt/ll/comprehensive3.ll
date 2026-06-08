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
  call void @printlnInt.(i32 3000)
  call void @performMathematicalSeries.()
  call void @performNumberTheoryAlgorithms.()
  call void @performLinearAlgebraOperations.()
  call void @performCombinatorialAlgorithms.()
  call void @performCryptographicOperations.()
  call void @printlnInt.(i32 3999)
  call void @exit.(i32 0)
  ret void
}
define void @performMathematicalSeries.() {
entry:
  %pi_approx = alloca i32 
  %fibonacci_sum = alloca i32 
  %factorial_series = alloca i32 
  %harmonic_approx = alloca i32 
  %geometric_result = alloca i32 
  call void @printlnInt.(i32 3001)
  %rcc.tmp.2 = call i32 @calculatePiApproximation.(i32 1000)
  store i32 %rcc.tmp.2, ptr %pi_approx
  %rcc.tmp.4 = load i32, ptr %pi_approx
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @calculateFibonacciSum.(i32 50)
  store i32 %rcc.tmp.6, ptr %fibonacci_sum
  %rcc.tmp.8 = load i32, ptr %fibonacci_sum
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @calculateFactorialSeries.(i32 20)
  store i32 %rcc.tmp.10, ptr %factorial_series
  %rcc.tmp.12 = load i32, ptr %factorial_series
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @calculateHarmonicSeries.(i32 10000)
  store i32 %rcc.tmp.14, ptr %harmonic_approx
  %rcc.tmp.16 = load i32, ptr %harmonic_approx
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @calculateGeometricSeries.(i32 100, i32 3)
  store i32 %rcc.tmp.18, ptr %geometric_result
  %rcc.tmp.20 = load i32, ptr %geometric_result
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 3002)
  ret void
}
define i32 @calculatePiApproximation.(i32 %terms.tmp) {
entry:
  %terms..tmp = alloca i32 
  %sum = alloca i32 
  %denominator = alloca i32 
  %sign = alloca i32 
  %i = alloca i32 
  %term = alloca i32 
  store i32 %terms.tmp, ptr %terms..tmp
  store i32 0, ptr %sum
  store i32 1, ptr %denominator
  store i32 1, ptr %sign
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %terms..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %sign
  %rcc.tmp.13 = mul i32 %rcc.tmp.12, 10000
  %rcc.tmp.14 = load i32, ptr %denominator
  %rcc.tmp.15 = sdiv i32 %rcc.tmp.13, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %term
  %rcc.tmp.17 = load i32, ptr %term
  %rcc.tmp.18 = load i32, ptr %sum
  %rcc.tmp.19 = add i32 %rcc.tmp.18, %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %sum
  %rcc.tmp.21 = load i32, ptr %sign
  %rcc.tmp.22 = sub i32 0, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %sign
  %rcc.tmp.24 = load i32, ptr %denominator
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 2
  store i32 %rcc.tmp.25, ptr %denominator
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.31 = load i32, ptr %sum
  %rcc.tmp.32 = mul i32 %rcc.tmp.31, 4
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 100000
  ret i32 %rcc.tmp.33
}
define i32 @calculateFibonacciSum.(i32 %count.tmp) {
entry:
  %count..tmp = alloca i32 
  %sum = alloca i32 
  %prev = alloca i32 
  %curr = alloca i32 
  %i = alloca i32 
  %temp = alloca i32 
  store i32 %count.tmp, ptr %count..tmp
  store i32 0, ptr %sum
  store i32 0, ptr %prev
  store i32 1, ptr %curr
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %count..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %curr
  %rcc.tmp.13 = load i32, ptr %sum
  %rcc.tmp.14 = add i32 %rcc.tmp.13, %rcc.tmp.12
  store i32 %rcc.tmp.14, ptr %sum
  %rcc.tmp.16 = load i32, ptr %sum
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 1000000
  store i32 %rcc.tmp.17, ptr %sum
  %rcc.tmp.19 = load i32, ptr %curr
  store i32 %rcc.tmp.19, ptr %temp
  %rcc.tmp.21 = load i32, ptr %prev
  %rcc.tmp.22 = load i32, ptr %curr
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 1000000
  store i32 %rcc.tmp.24, ptr %curr
  %rcc.tmp.26 = load i32, ptr %temp
  store i32 %rcc.tmp.26, ptr %prev
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.32 = load i32, ptr %sum
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 10000
  ret i32 %rcc.tmp.33
}
define i32 @calculateFactorialSeries.(i32 %max_n.tmp) {
entry:
  %max_n..tmp = alloca i32 
  %series_sum = alloca i32 
  %factorial = alloca i32 
  %n = alloca i32 
  store i32 %max_n.tmp, ptr %max_n..tmp
  store i32 0, ptr %series_sum
  store i32 1, ptr %factorial
  store i32 1, ptr %n
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %n
  %rcc.tmp.7 = load i32, ptr %max_n..tmp
  %rcc.tmp.8 = icmp sle i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %factorial
  %rcc.tmp.12 = load i32, ptr %n
  %rcc.tmp.13 = mul i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 1000000
  store i32 %rcc.tmp.14, ptr %factorial
  %rcc.tmp.16 = load i32, ptr %series_sum
  %rcc.tmp.17 = load i32, ptr %factorial
  %rcc.tmp.18 = add i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 1000000
  store i32 %rcc.tmp.19, ptr %series_sum
  %rcc.tmp.21 = load i32, ptr %n
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %n
  br label %while.cond
while.end:
  %rcc.tmp.25 = load i32, ptr %series_sum
  %rcc.tmp.26 = srem i32 %rcc.tmp.25, 10000
  ret i32 %rcc.tmp.26
}
define i32 @calculateHarmonicSeries.(i32 %terms.tmp) {
entry:
  %terms..tmp = alloca i32 
  %sum = alloca i32 
  %i = alloca i32 
  store i32 %terms.tmp, ptr %terms..tmp
  store i32 0, ptr %sum
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %terms..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = sdiv i32 10000, %rcc.tmp.10
  %rcc.tmp.12 = load i32, ptr %sum
  %rcc.tmp.13 = add i32 %rcc.tmp.12, %rcc.tmp.11
  store i32 %rcc.tmp.13, ptr %sum
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.19 = load i32, ptr %sum
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 10000
  ret i32 %rcc.tmp.20
}
define i32 @calculateGeometricSeries.(i32 %terms.tmp, i32 %ratio.tmp) {
entry:
  %terms..tmp = alloca i32 
  %ratio..tmp = alloca i32 
  %sum = alloca i32 
  %power = alloca i32 
  %i = alloca i32 
  store i32 %terms.tmp, ptr %terms..tmp
  store i32 %ratio.tmp, ptr %ratio..tmp
  store i32 0, ptr %sum
  store i32 1, ptr %power
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %terms..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %sum
  %rcc.tmp.13 = load i32, ptr %power
  %rcc.tmp.14 = add i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = srem i32 %rcc.tmp.14, 1000000
  store i32 %rcc.tmp.15, ptr %sum
  %rcc.tmp.17 = load i32, ptr %power
  %rcc.tmp.18 = load i32, ptr %ratio..tmp
  %rcc.tmp.19 = mul i32 %rcc.tmp.17, %rcc.tmp.18
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 1000000
  store i32 %rcc.tmp.20, ptr %power
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.26 = load i32, ptr %sum
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 10000
  ret i32 %rcc.tmp.27
}
define void @performNumberTheoryAlgorithms.() {
entry:
  %prime_count = alloca i32 
  %gcd_results = alloca i32 
  %modexp_results = alloca i32 
  %totient_sum = alloca i32 
  %perfect_count = alloca i32 
  call void @printlnInt.(i32 3003)
  %rcc.tmp.2 = call i32 @sieveOfEratosthenes.(i32 2000)
  store i32 %rcc.tmp.2, ptr %prime_count
  %rcc.tmp.4 = load i32, ptr %prime_count
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @performGCDOperations.(i32 100)
  store i32 %rcc.tmp.6, ptr %gcd_results
  %rcc.tmp.8 = load i32, ptr %gcd_results
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @performModularExponentiation.()
  store i32 %rcc.tmp.10, ptr %modexp_results
  %rcc.tmp.12 = load i32, ptr %modexp_results
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @calculateTotientSum.(i32 100)
  store i32 %rcc.tmp.14, ptr %totient_sum
  %rcc.tmp.16 = load i32, ptr %totient_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  %rcc.tmp.18 = call i32 @findPerfectNumbers.(i32 1000)
  store i32 %rcc.tmp.18, ptr %perfect_count
  %rcc.tmp.20 = load i32, ptr %perfect_count
  call void @printlnInt.(i32 %rcc.tmp.20)
  call void @printlnInt.(i32 3004)
  ret void
}
define i32 @sieveOfEratosthenes.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %is_prime = alloca [2000 x i32] 
  %fill.idx = alloca i32 
  %prime_count = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 2000
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [2000 x i32], ptr %is_prime, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %prime_count
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %limit..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = getelementptr [2000 x i32], ptr %is_prime, i32 0, i32 %rcc.tmp.21
  store i32 1, ptr %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  store i32 2, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = mul i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %limit..tmp
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = getelementptr [2000 x i32], ptr %is_prime, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.39, 1
  br i1 %rcc.tmp.40, label %if.then, label %if.else
if.then:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = mul i32 %rcc.tmp.42, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = load i32, ptr %limit..tmp
  %rcc.tmp.49 = icmp ult i32 %rcc.tmp.47, %rcc.tmp.48
  br i1 %rcc.tmp.49, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.52 = load i32, ptr %j
  %rcc.tmp.53 = getelementptr [2000 x i32], ptr %is_prime, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = add i32 %rcc.tmp.56, %rcc.tmp.55
  store i32 %rcc.tmp.57, ptr %j
  br label %while.cond.3
while.end.3:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 2, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = load i32, ptr %limit..tmp
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.68, %rcc.tmp.69
  br i1 %rcc.tmp.70, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = getelementptr [2000 x i32], ptr %is_prime, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp eq i32 %rcc.tmp.75, 1
  br i1 %rcc.tmp.76, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.78 = load i32, ptr %prime_count
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %prime_count
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.84, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.87 = load i32, ptr %prime_count
  ret i32 %rcc.tmp.87
}
define i32 @performGCDOperations.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %gcd_sum = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %gcd_sum
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %limit..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %j
  %rcc.tmp.13 = load i32, ptr %limit..tmp
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 13
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 7
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = mul i32 %rcc.tmp.20, 17
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 11
  %rcc.tmp.23 = call i32 @euclideanGCD.(i32 %rcc.tmp.19, i32 %rcc.tmp.22)
  %rcc.tmp.24 = load i32, ptr %gcd_sum
  %rcc.tmp.25 = add i32 %rcc.tmp.24, %rcc.tmp.23
  store i32 %rcc.tmp.25, ptr %gcd_sum
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = mul i32 %rcc.tmp.27, 19
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 3
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = mul i32 %rcc.tmp.30, 23
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 5
  %rcc.tmp.33 = call i32 @binaryGCD.(i32 %rcc.tmp.29, i32 %rcc.tmp.32)
  %rcc.tmp.34 = load i32, ptr %gcd_sum
  %rcc.tmp.35 = add i32 %rcc.tmp.34, %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %gcd_sum
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 10
  store i32 %rcc.tmp.38, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 10
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %gcd_sum
  %rcc.tmp.46 = srem i32 %rcc.tmp.45, 10000
  ret i32 %rcc.tmp.46
}
define i32 @euclideanGCD.(i32 %a.tmp, i32 %b.tmp) {
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
define i32 @binaryGCD.(i32 %a.tmp, i32 %b.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %shift = alloca i32 
  %temp = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load i32, ptr %a..tmp
  store i32 %rcc.tmp.3, ptr %x
  %rcc.tmp.5 = load i32, ptr %b..tmp
  store i32 %rcc.tmp.5, ptr %y
  store i32 0, ptr %shift
  %rcc.tmp.8 = load i32, ptr %x
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %y
  ret i32 %rcc.tmp.11
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %y
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %x
  ret i32 %rcc.tmp.17
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %x
  %rcc.tmp.22 = load i32, ptr %y
  %rcc.tmp.23 = or i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = and i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load i32, ptr %shift
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %shift
  %rcc.tmp.31 = load i32, ptr %x
  %rcc.tmp.32 = ashr i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %x
  %rcc.tmp.34 = load i32, ptr %y
  %rcc.tmp.35 = ashr i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %y
  br label %while.cond
while.end:
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.39 = load i32, ptr %x
  %rcc.tmp.40 = and i32 %rcc.tmp.39, 1
  %rcc.tmp.41 = icmp eq i32 %rcc.tmp.40, 0
  br i1 %rcc.tmp.41, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.44 = load i32, ptr %x
  %rcc.tmp.45 = ashr i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %x
  br label %while.cond.2
while.end.2:
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.49 = load i32, ptr %y
  %rcc.tmp.50 = icmp ne i32 %rcc.tmp.49, 0
  br i1 %rcc.tmp.50, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.54 = load i32, ptr %y
  %rcc.tmp.55 = and i32 %rcc.tmp.54, 1
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.55, 0
  br i1 %rcc.tmp.56, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.59 = load i32, ptr %y
  %rcc.tmp.60 = ashr i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %y
  br label %while.cond.4
while.end.4:
  %rcc.tmp.63 = load i32, ptr %x
  %rcc.tmp.64 = load i32, ptr %y
  %rcc.tmp.65 = icmp sgt i32 %rcc.tmp.63, %rcc.tmp.64
  br i1 %rcc.tmp.65, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.67 = load i32, ptr %x
  store i32 %rcc.tmp.67, ptr %temp
  %rcc.tmp.69 = load i32, ptr %y
  store i32 %rcc.tmp.69, ptr %x
  %rcc.tmp.71 = load i32, ptr %temp
  store i32 %rcc.tmp.71, ptr %y
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.75 = load i32, ptr %y
  %rcc.tmp.76 = load i32, ptr %x
  %rcc.tmp.77 = sub i32 %rcc.tmp.75, %rcc.tmp.76
  store i32 %rcc.tmp.77, ptr %y
  br label %while.cond.3
while.end.3:
  %rcc.tmp.80 = load i32, ptr %x
  %rcc.tmp.81 = load i32, ptr %shift
  %rcc.tmp.82 = shl i32 %rcc.tmp.80, %rcc.tmp.81
  ret i32 %rcc.tmp.82
}
define i32 @performModularExponentiation.() {
entry:
  %result_sum = alloca i32 
  %base = alloca i32 
  %exponent = alloca i32 
  %modulus = alloca i32 
  %mod_result = alloca i32 
  store i32 0, ptr %result_sum
  store i32 2, ptr %base
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %base
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 10
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %exponent
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.10 = load i32, ptr %exponent
  %rcc.tmp.11 = icmp sle i32 %rcc.tmp.10, 20
  br i1 %rcc.tmp.11, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 97, ptr %modulus
  %rcc.tmp.15 = load i32, ptr %base
  %rcc.tmp.16 = load i32, ptr %exponent
  %rcc.tmp.17 = load i32, ptr %modulus
  %rcc.tmp.18 = call i32 @modularPower.(i32 %rcc.tmp.15, i32 %rcc.tmp.16, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %mod_result
  %rcc.tmp.20 = load i32, ptr %result_sum
  %rcc.tmp.21 = load i32, ptr %mod_result
  %rcc.tmp.22 = add i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = srem i32 %rcc.tmp.22, 10000
  store i32 %rcc.tmp.23, ptr %result_sum
  %rcc.tmp.25 = load i32, ptr %exponent
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %exponent
  br label %while.cond.2
while.end.2:
  %rcc.tmp.29 = load i32, ptr %base
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %base
  br label %while.cond
while.end:
  %rcc.tmp.33 = load i32, ptr %result_sum
  ret i32 %rcc.tmp.33
}
define i32 @modularPower.(i32 %base.tmp, i32 %exponent.tmp, i32 %modulus.tmp) {
entry:
  %base..tmp = alloca i32 
  %exponent..tmp = alloca i32 
  %modulus..tmp = alloca i32 
  %result = alloca i32 
  %current_base = alloca i32 
  %current_exp = alloca i32 
  store i32 %base.tmp, ptr %base..tmp
  store i32 %exponent.tmp, ptr %exponent..tmp
  store i32 %modulus.tmp, ptr %modulus..tmp
  store i32 1, ptr %result
  %rcc.tmp.5 = load i32, ptr %base..tmp
  %rcc.tmp.6 = load i32, ptr %modulus..tmp
  %rcc.tmp.7 = srem i32 %rcc.tmp.5, %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %current_base
  %rcc.tmp.9 = load i32, ptr %exponent..tmp
  store i32 %rcc.tmp.9, ptr %current_exp
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %current_exp
  %rcc.tmp.13 = icmp sgt i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %current_exp
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 2
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 1
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %result
  %rcc.tmp.21 = load i32, ptr %current_base
  %rcc.tmp.22 = mul i32 %rcc.tmp.20, %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %modulus..tmp
  %rcc.tmp.24 = srem i32 %rcc.tmp.22, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %result
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.28 = load i32, ptr %current_exp
  %rcc.tmp.29 = ashr i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %current_exp
  %rcc.tmp.31 = load i32, ptr %current_base
  %rcc.tmp.32 = load i32, ptr %current_base
  %rcc.tmp.33 = mul i32 %rcc.tmp.31, %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %modulus..tmp
  %rcc.tmp.35 = srem i32 %rcc.tmp.33, %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %current_base
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %result
  ret i32 %rcc.tmp.38
}
define i32 @calculateTotientSum.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %totient_sum = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 0, ptr %totient_sum
  store i32 1, ptr %i
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
  %rcc.tmp.11 = call i32 @eulerTotient.(i32 %rcc.tmp.10)
  %rcc.tmp.12 = load i32, ptr %totient_sum
  %rcc.tmp.13 = add i32 %rcc.tmp.12, %rcc.tmp.11
  store i32 %rcc.tmp.13, ptr %totient_sum
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.19 = load i32, ptr %totient_sum
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 10000
  ret i32 %rcc.tmp.20
}
define i32 @eulerTotient.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %result = alloca i32 
  %num = alloca i32 
  %p = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.2, ptr %result
  %rcc.tmp.4 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.4, ptr %num
  store i32 2, ptr %p
  %rcc.tmp.7 = load i32, ptr %num
  %rcc.tmp.8 = srem i32 %rcc.tmp.7, 2
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.8, 0
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  br label %while.cond
while.cond:
  %rcc.tmp.12 = load i32, ptr %num
  %rcc.tmp.13 = srem i32 %rcc.tmp.12, 2
  %rcc.tmp.14 = icmp eq i32 %rcc.tmp.13, 0
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %num
  %rcc.tmp.18 = sdiv i32 %rcc.tmp.17, 2
  store i32 %rcc.tmp.18, ptr %num
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %result
  %rcc.tmp.22 = sdiv i32 %rcc.tmp.21, 2
  %rcc.tmp.23 = load i32, ptr %result
  %rcc.tmp.24 = sub i32 %rcc.tmp.23, %rcc.tmp.22
  store i32 %rcc.tmp.24, ptr %result
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  store i32 3, ptr %p
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.30 = load i32, ptr %p
  %rcc.tmp.31 = load i32, ptr %p
  %rcc.tmp.32 = mul i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %num
  %rcc.tmp.34 = icmp sle i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.37 = load i32, ptr %num
  %rcc.tmp.38 = load i32, ptr %p
  %rcc.tmp.39 = srem i32 %rcc.tmp.37, %rcc.tmp.38
  %rcc.tmp.40 = icmp eq i32 %rcc.tmp.39, 0
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.43 = load i32, ptr %num
  %rcc.tmp.44 = load i32, ptr %p
  %rcc.tmp.45 = srem i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = icmp eq i32 %rcc.tmp.45, 0
  br i1 %rcc.tmp.46, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.49 = load i32, ptr %p
  %rcc.tmp.50 = load i32, ptr %num
  %rcc.tmp.51 = sdiv i32 %rcc.tmp.50, %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %num
  br label %while.cond.3
while.end.3:
  %rcc.tmp.54 = load i32, ptr %result
  %rcc.tmp.55 = load i32, ptr %p
  %rcc.tmp.56 = sdiv i32 %rcc.tmp.54, %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %result
  %rcc.tmp.58 = sub i32 %rcc.tmp.57, %rcc.tmp.56
  store i32 %rcc.tmp.58, ptr %result
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.62 = load i32, ptr %p
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 2
  store i32 %rcc.tmp.63, ptr %p
  br label %while.cond.2
while.end.2:
  %rcc.tmp.66 = load i32, ptr %num
  %rcc.tmp.67 = icmp sgt i32 %rcc.tmp.66, 1
  br i1 %rcc.tmp.67, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.69 = load i32, ptr %result
  %rcc.tmp.70 = load i32, ptr %num
  %rcc.tmp.71 = sdiv i32 %rcc.tmp.69, %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %result
  %rcc.tmp.73 = sub i32 %rcc.tmp.72, %rcc.tmp.71
  store i32 %rcc.tmp.73, ptr %result
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.77 = load i32, ptr %result
  ret i32 %rcc.tmp.77
}
define i32 @findPerfectNumbers.(i32 %limit.tmp) {
entry:
  %limit..tmp = alloca i32 
  %perfect_count = alloca i32 
  %num = alloca i32 
  store i32 %limit.tmp, ptr %limit..tmp
  store i32 0, ptr %perfect_count
  store i32 6, ptr %num
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
  %rcc.tmp.11 = call i32 @isPerfectNumber.(i32 %rcc.tmp.10)
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 1
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load i32, ptr %perfect_count
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %perfect_count
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.19 = load i32, ptr %num
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %num
  br label %while.cond
while.end:
  %rcc.tmp.23 = load i32, ptr %perfect_count
  ret i32 %rcc.tmp.23
}
define i32 @isPerfectNumber.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %divisor_sum = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 1, ptr %divisor_sum
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = mul i32 %rcc.tmp.5, %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %n..tmp
  %rcc.tmp.9 = icmp sle i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %n..tmp
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = srem i32 %rcc.tmp.12, %rcc.tmp.13
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then, label %if.else
if.then:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = load i32, ptr %divisor_sum
  %rcc.tmp.19 = add i32 %rcc.tmp.18, %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %divisor_sum
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %n..tmp
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = sdiv i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = icmp ne i32 %rcc.tmp.21, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %n..tmp
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = sdiv i32 %rcc.tmp.27, %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %divisor_sum
  %rcc.tmp.31 = add i32 %rcc.tmp.30, %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %divisor_sum
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.41 = load i32, ptr %divisor_sum
  %rcc.tmp.42 = load i32, ptr %n..tmp
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = zext i1 %rcc.tmp.43 to i32
  ret i32 %rcc.tmp.44
}
define void @performLinearAlgebraOperations.() {
entry:
  %matrix_result = alloca i32 
  %vector_result = alloca i32 
  %equation_result = alloca i32 
  call void @printlnInt.(i32 3005)
  %rcc.tmp.2 = call i32 @performMatrixCalculations.()
  store i32 %rcc.tmp.2, ptr %matrix_result
  %rcc.tmp.4 = load i32, ptr %matrix_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @performVectorCalculations.()
  store i32 %rcc.tmp.6, ptr %vector_result
  %rcc.tmp.8 = load i32, ptr %vector_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @solveLinearSystem.()
  store i32 %rcc.tmp.10, ptr %equation_result
  %rcc.tmp.12 = load i32, ptr %equation_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  call void @printlnInt.(i32 3006)
  ret void
}
define i32 @performMatrixCalculations.() {
entry:
  %size = alloca i32 
  %matrix_a = alloca [625 x i32] 
  %fill.idx = alloca i32 
  %matrix_b = alloca [625 x i32] 
  %fill.idx.2 = alloca i32 
  %result_matrix = alloca [625 x i32] 
  %fill.idx.3 = alloca i32 
  %trace = alloca i32 
  %small_matrix = alloca [16 x i32] 
  %determinant = alloca i32 
  store i32 25, ptr %size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 625
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [625 x i32], ptr %matrix_a, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 625
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [625 x i32], ptr %matrix_b, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 625
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [625 x i32], ptr %result_matrix, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.35 = load i32, ptr %size
  call void @initializeMatrixA.([625 x i32]* %matrix_a, i32 %rcc.tmp.35)
  %rcc.tmp.37 = load i32, ptr %size
  call void @initializeMatrixB.([625 x i32]* %matrix_b, i32 %rcc.tmp.37)
  %rcc.tmp.39 = load i32, ptr %size
  call void @multiplyMatrices.([625 x i32]* %matrix_a, [625 x i32]* %matrix_b, [625 x i32]* %result_matrix, i32 %rcc.tmp.39)
  %rcc.tmp.41 = load i32, ptr %size
  %rcc.tmp.42 = call i32 @calculateMatrixTrace.([625 x i32]* %result_matrix, i32 %rcc.tmp.41)
  store i32 %rcc.tmp.42, ptr %trace
  %rcc.tmp.44 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.66
  %rcc.tmp.68 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [16 x i32], ptr %small_matrix, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %size
  call void @extractSubmatrix.([625 x i32]* %result_matrix, [16 x i32]* %small_matrix, i32 %rcc.tmp.76, i32 4)
  %rcc.tmp.78 = call i32 @calculateDeterminant4x4.([16 x i32]* %small_matrix)
  store i32 %rcc.tmp.78, ptr %determinant
  %rcc.tmp.80 = load i32, ptr %trace
  %rcc.tmp.81 = load i32, ptr %determinant
  %rcc.tmp.82 = add i32 %rcc.tmp.80, %rcc.tmp.81
  %rcc.tmp.83 = srem i32 %rcc.tmp.82, 10000
  ret i32 %rcc.tmp.83
}
define void @initializeMatrixA.([625 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [625 x i32]* %matrix.tmp, ptr %matrix..tmp
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
  %rcc.tmp.22 = load [625 x i32]*, ptr %matrix..tmp
  %rcc.tmp.23 = getelementptr [625 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = add i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 10
  store i32 %rcc.tmp.28, ptr %rcc.tmp.23
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @initializeMatrixB.([625 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [625 x i32]* %matrix.tmp, ptr %matrix..tmp
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
  %rcc.tmp.22 = load [625 x i32]*, ptr %matrix..tmp
  %rcc.tmp.23 = getelementptr [625 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = mul i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  %rcc.tmp.28 = srem i32 %rcc.tmp.27, 10
  store i32 %rcc.tmp.28, ptr %rcc.tmp.23
  %rcc.tmp.30 = load i32, ptr %j
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @multiplyMatrices.([625 x i32]* %a.tmp, [625 x i32]* %b.tmp, [625 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %a..tmp = alloca [625 x i32]* 
  %b..tmp = alloca [625 x i32]* 
  %result..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %block_size = alloca i32 
  %i_block = alloca i32 
  %j_block = alloca i32 
  %k_block = alloca i32 
  %i_end = alloca i32 
  %j.2 = alloca i32 
  %j_end = alloca i32 
  %k = alloca i32 
  %k_end = alloca i32 
  store [625 x i32]* %a.tmp, ptr %a..tmp
  store [625 x i32]* %b.tmp, ptr %b..tmp
  store [625 x i32]* %result.tmp, ptr %result..tmp
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
  %rcc.tmp.24 = load [625 x i32]*, ptr %result..tmp
  %rcc.tmp.25 = getelementptr [625 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %j
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  store i32 5, ptr %block_size
  store i32 0, ptr %i_block
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.38 = load i32, ptr %i_block
  %rcc.tmp.39 = load i32, ptr %size..tmp
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.38, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %j_block
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.45 = load i32, ptr %j_block
  %rcc.tmp.46 = load i32, ptr %size..tmp
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.45, %rcc.tmp.46
  br i1 %rcc.tmp.47, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %k_block
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.52 = load i32, ptr %k_block
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = icmp slt i32 %rcc.tmp.52, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.57 = load i32, ptr %i_block
  store i32 %rcc.tmp.57, ptr %i
  %rcc.tmp.59 = load i32, ptr %i_block
  %rcc.tmp.60 = load i32, ptr %block_size
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %i_end
  %rcc.tmp.63 = load i32, ptr %i_end
  %rcc.tmp.64 = load i32, ptr %size..tmp
  %rcc.tmp.65 = icmp ugt i32 %rcc.tmp.63, %rcc.tmp.64
  br i1 %rcc.tmp.65, label %if.then, label %if.else
if.then:
  %rcc.tmp.67 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.67, ptr %i_end
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = load i32, ptr %i_end
  %rcc.tmp.74 = icmp slt i32 %rcc.tmp.72, %rcc.tmp.73
  br i1 %rcc.tmp.74, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.77 = load i32, ptr %j_block
  store i32 %rcc.tmp.77, ptr %j.2
  %rcc.tmp.79 = load i32, ptr %j_block
  %rcc.tmp.80 = load i32, ptr %block_size
  %rcc.tmp.81 = add i32 %rcc.tmp.79, %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %j_end
  %rcc.tmp.83 = load i32, ptr %j_end
  %rcc.tmp.84 = load i32, ptr %size..tmp
  %rcc.tmp.85 = icmp ugt i32 %rcc.tmp.83, %rcc.tmp.84
  br i1 %rcc.tmp.85, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.87 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.87, ptr %j_end
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.92 = load i32, ptr %j.2
  %rcc.tmp.93 = load i32, ptr %j_end
  %rcc.tmp.94 = icmp ult i32 %rcc.tmp.92, %rcc.tmp.93
  br i1 %rcc.tmp.94, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.97 = load i32, ptr %k_block
  store i32 %rcc.tmp.97, ptr %k
  %rcc.tmp.99 = load i32, ptr %k_block
  %rcc.tmp.100 = load i32, ptr %block_size
  %rcc.tmp.101 = add i32 %rcc.tmp.99, %rcc.tmp.100
  store i32 %rcc.tmp.101, ptr %k_end
  %rcc.tmp.103 = load i32, ptr %k_end
  %rcc.tmp.104 = load i32, ptr %size..tmp
  %rcc.tmp.105 = icmp ugt i32 %rcc.tmp.103, %rcc.tmp.104
  br i1 %rcc.tmp.105, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.107 = load i32, ptr %size..tmp
  store i32 %rcc.tmp.107, ptr %k_end
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.112 = load i32, ptr %k
  %rcc.tmp.113 = load i32, ptr %k_end
  %rcc.tmp.114 = icmp ult i32 %rcc.tmp.112, %rcc.tmp.113
  br i1 %rcc.tmp.114, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = load i32, ptr %size..tmp
  %rcc.tmp.119 = mul i32 %rcc.tmp.117, %rcc.tmp.118
  %rcc.tmp.120 = load i32, ptr %j.2
  %rcc.tmp.121 = add i32 %rcc.tmp.119, %rcc.tmp.120
  %rcc.tmp.122 = load [625 x i32]*, ptr %result..tmp
  %rcc.tmp.123 = getelementptr [625 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = load i32, ptr %size..tmp
  %rcc.tmp.126 = mul i32 %rcc.tmp.124, %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %k
  %rcc.tmp.128 = add i32 %rcc.tmp.126, %rcc.tmp.127
  %rcc.tmp.129 = load [625 x i32]*, ptr %a..tmp
  %rcc.tmp.130 = getelementptr [625 x i32], ptr %rcc.tmp.129, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.131 = load i32, ptr %rcc.tmp.130
  %rcc.tmp.132 = load i32, ptr %k
  %rcc.tmp.133 = load i32, ptr %size..tmp
  %rcc.tmp.134 = mul i32 %rcc.tmp.132, %rcc.tmp.133
  %rcc.tmp.135 = load i32, ptr %j.2
  %rcc.tmp.136 = add i32 %rcc.tmp.134, %rcc.tmp.135
  %rcc.tmp.137 = load [625 x i32]*, ptr %b..tmp
  %rcc.tmp.138 = getelementptr [625 x i32], ptr %rcc.tmp.137, i32 0, i32 %rcc.tmp.136
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  %rcc.tmp.140 = mul i32 %rcc.tmp.131, %rcc.tmp.139
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.123
  %rcc.tmp.142 = add i32 %rcc.tmp.141, %rcc.tmp.140
  store i32 %rcc.tmp.142, ptr %rcc.tmp.123
  %rcc.tmp.144 = load i32, ptr %k
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 1
  store i32 %rcc.tmp.145, ptr %k
  br label %while.cond.8
while.end.8:
  %rcc.tmp.148 = load i32, ptr %j.2
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 1
  store i32 %rcc.tmp.149, ptr %j.2
  br label %while.cond.7
while.end.7:
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.153, ptr %i
  br label %while.cond.6
while.end.6:
  %rcc.tmp.156 = load i32, ptr %block_size
  %rcc.tmp.157 = load i32, ptr %k_block
  %rcc.tmp.158 = add i32 %rcc.tmp.157, %rcc.tmp.156
  store i32 %rcc.tmp.158, ptr %k_block
  br label %while.cond.5
while.end.5:
  %rcc.tmp.161 = load i32, ptr %block_size
  %rcc.tmp.162 = load i32, ptr %j_block
  %rcc.tmp.163 = add i32 %rcc.tmp.162, %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %j_block
  br label %while.cond.4
while.end.4:
  %rcc.tmp.166 = load i32, ptr %block_size
  %rcc.tmp.167 = load i32, ptr %i_block
  %rcc.tmp.168 = add i32 %rcc.tmp.167, %rcc.tmp.166
  store i32 %rcc.tmp.168, ptr %i_block
  br label %while.cond.3
while.end.3:
  ret void
}
define i32 @calculateMatrixTrace.([625 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [625 x i32]* 
  %size..tmp = alloca i32 
  %trace = alloca i32 
  %i = alloca i32 
  store [625 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %trace
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
  %rcc.tmp.12 = load i32, ptr %size..tmp
  %rcc.tmp.13 = mul i32 %rcc.tmp.11, %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.13, %rcc.tmp.14
  %rcc.tmp.16 = load [625 x i32]*, ptr %matrix..tmp
  %rcc.tmp.17 = getelementptr [625 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %trace
  %rcc.tmp.20 = add i32 %rcc.tmp.19, %rcc.tmp.18
  store i32 %rcc.tmp.20, ptr %trace
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  store i32 %rcc.tmp.23, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.26 = load i32, ptr %trace
  ret i32 %rcc.tmp.26
}
define void @extractSubmatrix.([625 x i32]* %source.tmp, [16 x i32]* %dest.tmp, i32 %source_size.tmp, i32 %dest_size.tmp) {
entry:
  %source..tmp = alloca [625 x i32]* 
  %dest..tmp = alloca [16 x i32]* 
  %source_size..tmp = alloca i32 
  %dest_size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [625 x i32]* %source.tmp, ptr %source..tmp
  store [16 x i32]* %dest.tmp, ptr %dest..tmp
  store i32 %source_size.tmp, ptr %source_size..tmp
  store i32 %dest_size.tmp, ptr %dest_size..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load i32, ptr %dest_size..tmp
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %j
  %rcc.tmp.15 = load i32, ptr %dest_size..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load i32, ptr %dest_size..tmp
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %j
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = load [16 x i32]*, ptr %dest..tmp
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = load i32, ptr %source_size..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %j
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  %rcc.tmp.31 = load [625 x i32]*, ptr %source..tmp
  %rcc.tmp.32 = getelementptr [625 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %rcc.tmp.25
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @calculateDeterminant4x4.([16 x i32]* %matrix.tmp) {
entry:
  %matrix..local = alloca [16 x i32] 
  %determinant = alloca i32 
  %col = alloca i32 
  %minor = alloca [9 x i32] 
  %minor_i = alloca i32 
  %i = alloca i32 
  %minor_j = alloca i32 
  %j = alloca i32 
  %minor_det = alloca i32 
  %rcc.tmp.1 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [16 x i32], ptr %matrix.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  store i32 0, ptr %determinant
  store i32 0, ptr %col
  br label %while.cond
while.cond:
  %rcc.tmp.68 = load i32, ptr %col
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.68, 4
  br i1 %rcc.tmp.69, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.72 = getelementptr [9 x i32], ptr %minor, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [9 x i32], ptr %minor, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [9 x i32], ptr %minor, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [9 x i32], ptr %minor, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.78
  %rcc.tmp.80 = getelementptr [9 x i32], ptr %minor, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.80
  %rcc.tmp.82 = getelementptr [9 x i32], ptr %minor, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [9 x i32], ptr %minor, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [9 x i32], ptr %minor, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [9 x i32], ptr %minor, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.88
  store i32 0, ptr %minor_i
  store i32 1, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.93 = load i32, ptr %i
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.93, 4
  br i1 %rcc.tmp.94, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %minor_j
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.100 = load i32, ptr %j
  %rcc.tmp.101 = icmp slt i32 %rcc.tmp.100, 4
  br i1 %rcc.tmp.101, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.104 = load i32, ptr %j
  %rcc.tmp.105 = load i32, ptr %col
  %rcc.tmp.106 = icmp ne i32 %rcc.tmp.104, %rcc.tmp.105
  br i1 %rcc.tmp.106, label %if.then, label %if.else
if.then:
  %rcc.tmp.108 = load i32, ptr %minor_i
  %rcc.tmp.109 = mul i32 %rcc.tmp.108, 3
  %rcc.tmp.110 = load i32, ptr %minor_j
  %rcc.tmp.111 = add i32 %rcc.tmp.109, %rcc.tmp.110
  %rcc.tmp.112 = getelementptr [9 x i32], ptr %minor, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = mul i32 %rcc.tmp.113, 4
  %rcc.tmp.115 = load i32, ptr %j
  %rcc.tmp.116 = add i32 %rcc.tmp.114, %rcc.tmp.115
  %rcc.tmp.117 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.118 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %rcc.tmp.112
  %rcc.tmp.120 = load i32, ptr %minor_j
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  store i32 %rcc.tmp.121, ptr %minor_j
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.125 = load i32, ptr %j
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 1
  store i32 %rcc.tmp.126, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.129 = load i32, ptr %minor_i
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %minor_i
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.136 = call i32 @calculateDeterminant3x3.([9 x i32]* %minor)
  store i32 %rcc.tmp.136, ptr %minor_det
  %rcc.tmp.138 = load i32, ptr %col
  %rcc.tmp.139 = srem i32 %rcc.tmp.138, 2
  %rcc.tmp.140 = icmp eq i32 %rcc.tmp.139, 0
  br i1 %rcc.tmp.140, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.142 = load i32, ptr %col
  %rcc.tmp.143 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %minor_det
  %rcc.tmp.146 = mul i32 %rcc.tmp.144, %rcc.tmp.145
  %rcc.tmp.147 = load i32, ptr %determinant
  %rcc.tmp.148 = add i32 %rcc.tmp.147, %rcc.tmp.146
  store i32 %rcc.tmp.148, ptr %determinant
  br label %if.merge.2
if.else.2:
  %rcc.tmp.151 = load i32, ptr %col
  %rcc.tmp.152 = getelementptr [16 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %minor_det
  %rcc.tmp.155 = mul i32 %rcc.tmp.153, %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %determinant
  %rcc.tmp.157 = sub i32 %rcc.tmp.156, %rcc.tmp.155
  store i32 %rcc.tmp.157, ptr %determinant
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.160 = load i32, ptr %col
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %col
  br label %while.cond
while.end:
  %rcc.tmp.164 = load i32, ptr %determinant
  ret i32 %rcc.tmp.164
}
define i32 @calculateDeterminant3x3.([9 x i32]* %matrix.tmp) {
entry:
  %matrix..local = alloca [9 x i32] 
  %a = alloca i32 
  %b = alloca i32 
  %c = alloca i32 
  %rcc.tmp.1 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [9 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = mul i32 %rcc.tmp.40, %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = mul i32 %rcc.tmp.45, %rcc.tmp.47
  %rcc.tmp.49 = sub i32 %rcc.tmp.43, %rcc.tmp.48
  %rcc.tmp.50 = mul i32 %rcc.tmp.38, %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %a
  %rcc.tmp.52 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  %rcc.tmp.58 = mul i32 %rcc.tmp.55, %rcc.tmp.57
  %rcc.tmp.59 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = mul i32 %rcc.tmp.60, %rcc.tmp.62
  %rcc.tmp.64 = sub i32 %rcc.tmp.58, %rcc.tmp.63
  %rcc.tmp.65 = mul i32 %rcc.tmp.53, %rcc.tmp.64
  store i32 %rcc.tmp.65, ptr %b
  %rcc.tmp.67 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = mul i32 %rcc.tmp.70, %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [9 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = mul i32 %rcc.tmp.75, %rcc.tmp.77
  %rcc.tmp.79 = sub i32 %rcc.tmp.73, %rcc.tmp.78
  %rcc.tmp.80 = mul i32 %rcc.tmp.68, %rcc.tmp.79
  store i32 %rcc.tmp.80, ptr %c
  %rcc.tmp.82 = load i32, ptr %a
  %rcc.tmp.83 = load i32, ptr %b
  %rcc.tmp.84 = sub i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %c
  %rcc.tmp.86 = add i32 %rcc.tmp.84, %rcc.tmp.85
  ret i32 %rcc.tmp.86
}
define i32 @performVectorCalculations.() {
entry:
  %size = alloca i32 
  %vector_a = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %vector_b = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %result_vector = alloca [100 x i32] 
  %fill.idx.3 = alloca i32 
  %dot_product = alloca i32 
  %magnitude_a = alloca i32 
  %magnitude_b = alloca i32 
  store i32 100, ptr %size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %vector_a, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.15 = load i32, ptr %fill.idx.2
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.15, 100
  br i1 %rcc.tmp.16, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.18 = load i32, ptr %fill.idx.2
  %rcc.tmp.19 = getelementptr [100 x i32], ptr %vector_b, i32 0, i32 %rcc.tmp.18
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.21, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.26 = load i32, ptr %fill.idx.3
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 100
  br i1 %rcc.tmp.27, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = getelementptr [100 x i32], ptr %result_vector, i32 0, i32 %rcc.tmp.29
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.32, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.35 = load i32, ptr %size
  call void @initializeVectors.([100 x i32]* %vector_a, [100 x i32]* %vector_b, i32 %rcc.tmp.35)
  %rcc.tmp.37 = load i32, ptr %size
  %rcc.tmp.38 = call i32 @vectorDotProduct.([100 x i32]* %vector_a, [100 x i32]* %vector_b, i32 %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %dot_product
  %rcc.tmp.40 = load i32, ptr %size
  call void @vectorAddition.([100 x i32]* %vector_a, [100 x i32]* %vector_b, [100 x i32]* %result_vector, i32 %rcc.tmp.40)
  %rcc.tmp.42 = load i32, ptr %size
  %rcc.tmp.43 = call i32 @vectorMagnitude.([100 x i32]* %vector_a, i32 %rcc.tmp.42)
  store i32 %rcc.tmp.43, ptr %magnitude_a
  %rcc.tmp.45 = load i32, ptr %size
  %rcc.tmp.46 = call i32 @vectorMagnitude.([100 x i32]* %vector_b, i32 %rcc.tmp.45)
  store i32 %rcc.tmp.46, ptr %magnitude_b
  %rcc.tmp.48 = load i32, ptr %size
  call void @vectorScalarMultiply.([100 x i32]* %result_vector, i32 3, i32 %rcc.tmp.48)
  %rcc.tmp.50 = load i32, ptr %dot_product
  %rcc.tmp.51 = load i32, ptr %magnitude_a
  %rcc.tmp.52 = add i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %magnitude_b
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = srem i32 %rcc.tmp.54, 10000
  ret i32 %rcc.tmp.55
}
define void @initializeVectors.([100 x i32]* %vec_a.tmp, [100 x i32]* %vec_b.tmp, i32 %size.tmp) {
entry:
  %vec_a..tmp = alloca [100 x i32]* 
  %vec_b..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %vec_a.tmp, ptr %vec_a..tmp
  store [100 x i32]* %vec_b.tmp, ptr %vec_b..tmp
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
  %rcc.tmp.12 = load [100 x i32]*, ptr %vec_a..tmp
  %rcc.tmp.13 = getelementptr [100 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  %rcc.tmp.16 = srem i32 %rcc.tmp.15, 20
  store i32 %rcc.tmp.16, ptr %rcc.tmp.13
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load [100 x i32]*, ptr %vec_b..tmp
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 2
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 3
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 15
  store i32 %rcc.tmp.24, ptr %rcc.tmp.20
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @vectorDotProduct.([100 x i32]* %vec_a.tmp, [100 x i32]* %vec_b.tmp, i32 %size.tmp) {
entry:
  %vec_a..tmp = alloca [100 x i32]* 
  %vec_b..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %dot_product = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %vec_a.tmp, ptr %vec_a..tmp
  store [100 x i32]* %vec_b.tmp, ptr %vec_b..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %dot_product
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
  %rcc.tmp.13 = load [100 x i32]*, ptr %vec_a..tmp
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load [100 x i32]*, ptr %vec_b..tmp
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = mul i32 %rcc.tmp.15, %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %dot_product
  %rcc.tmp.22 = add i32 %rcc.tmp.21, %rcc.tmp.20
  store i32 %rcc.tmp.22, ptr %dot_product
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = load i32, ptr %dot_product
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 10000
  ret i32 %rcc.tmp.29
}
define void @vectorAddition.([100 x i32]* %vec_a.tmp, [100 x i32]* %vec_b.tmp, [100 x i32]* %result.tmp, i32 %size.tmp) {
entry:
  %vec_a..tmp = alloca [100 x i32]* 
  %vec_b..tmp = alloca [100 x i32]* 
  %result..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %vec_a.tmp, ptr %vec_a..tmp
  store [100 x i32]* %vec_b.tmp, ptr %vec_b..tmp
  store [100 x i32]* %result.tmp, ptr %result..tmp
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
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = load [100 x i32]*, ptr %result..tmp
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = load [100 x i32]*, ptr %vec_a..tmp
  %rcc.tmp.17 = getelementptr [100 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = load [100 x i32]*, ptr %vec_b..tmp
  %rcc.tmp.21 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.18, %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.14
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @vectorMagnitude.([100 x i32]* %vec.tmp, i32 %size.tmp) {
entry:
  %vec..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %sum_of_squares = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %vec..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %vec.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %sum_of_squares
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %vec..local, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = getelementptr [100 x i32], ptr %vec..local, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = mul i32 %rcc.tmp.15, %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %sum_of_squares
  %rcc.tmp.21 = add i32 %rcc.tmp.20, %rcc.tmp.19
  store i32 %rcc.tmp.21, ptr %sum_of_squares
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.27 = load i32, ptr %sum_of_squares
  %rcc.tmp.28 = call i32 @integerSquareRoot.(i32 %rcc.tmp.27)
  ret i32 %rcc.tmp.28
}
define i32 @integerSquareRoot.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %x = alloca i32 
  %prev_x = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp eq i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.7, ptr %x
  store i32 0, ptr %prev_x
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %x
  %rcc.tmp.12 = load i32, ptr %prev_x
  %rcc.tmp.13 = icmp ne i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %x
  store i32 %rcc.tmp.16, ptr %prev_x
  %rcc.tmp.18 = load i32, ptr %x
  %rcc.tmp.19 = load i32, ptr %n..tmp
  %rcc.tmp.20 = load i32, ptr %x
  %rcc.tmp.21 = sdiv i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.18, %rcc.tmp.21
  %rcc.tmp.23 = sdiv i32 %rcc.tmp.22, 2
  store i32 %rcc.tmp.23, ptr %x
  br label %while.cond
while.end:
  %rcc.tmp.26 = load i32, ptr %x
  ret i32 %rcc.tmp.26
}
define void @vectorScalarMultiply.([100 x i32]* %vec.tmp, i32 %scalar.tmp, i32 %size.tmp) {
entry:
  %vec..tmp = alloca [100 x i32]* 
  %scalar..tmp = alloca i32 
  %size..tmp = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %vec.tmp, ptr %vec..tmp
  store i32 %scalar.tmp, ptr %scalar..tmp
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
  %rcc.tmp.12 = load [100 x i32]*, ptr %vec..tmp
  %rcc.tmp.13 = getelementptr [100 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i32, ptr %scalar..tmp
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.16 = mul i32 %rcc.tmp.15, %rcc.tmp.14
  store i32 %rcc.tmp.16, ptr %rcc.tmp.13
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @solveLinearSystem.() {
entry:
  %size = alloca i32 
  %augmented_matrix = alloca [30 x i32] 
  %fill.idx = alloca i32 
  %solution_sum = alloca i32 
  store i32 5, ptr %size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 30
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [30 x i32], ptr %augmented_matrix, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = load i32, ptr %size
  call void @initializeLinearSystem.([30 x i32]* %augmented_matrix, i32 %rcc.tmp.13)
  %rcc.tmp.15 = load i32, ptr %size
  call void @gaussianElimination.([30 x i32]* %augmented_matrix, i32 %rcc.tmp.15)
  %rcc.tmp.17 = load i32, ptr %size
  %rcc.tmp.18 = call i32 @backSubstitution.([30 x i32]* %augmented_matrix, i32 %rcc.tmp.17)
  store i32 %rcc.tmp.18, ptr %solution_sum
  %rcc.tmp.20 = load i32, ptr %solution_sum
  %rcc.tmp.21 = srem i32 %rcc.tmp.20, 10000
  ret i32 %rcc.tmp.21
}
define void @initializeLinearSystem.([30 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [30 x i32]* 
  %size..tmp = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store [30 x i32]* %matrix.tmp, ptr %matrix..tmp
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
  %rcc.tmp.18 = load i32, ptr %j
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %size..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = mul i32 %rcc.tmp.21, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %j
  %rcc.tmp.26 = add i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.28 = getelementptr [30 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 10, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %rcc.tmp.28
  br label %if.merge
if.else:
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = load i32, ptr %size..tmp
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  %rcc.tmp.36 = mul i32 %rcc.tmp.33, %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.40 = getelementptr [30 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = load i32, ptr %j
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  %rcc.tmp.45 = srem i32 %rcc.tmp.44, 5
  store i32 %rcc.tmp.45, ptr %rcc.tmp.40
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = load i32, ptr %size..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  %rcc.tmp.55 = mul i32 %rcc.tmp.52, %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %size..tmp
  %rcc.tmp.57 = add i32 %rcc.tmp.55, %rcc.tmp.56
  %rcc.tmp.58 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.59 = getelementptr [30 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  %rcc.tmp.62 = mul i32 %rcc.tmp.61, 10
  store i32 %rcc.tmp.62, ptr %rcc.tmp.59
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @gaussianElimination.([30 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [30 x i32]* 
  %size..tmp = alloca i32 
  %k = alloca i32 
  %max_row = alloca i32 
  %i = alloca i32 
  %factor = alloca i32 
  %j = alloca i32 
  store [30 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %k
  %rcc.tmp.6 = load i32, ptr %size..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %k
  store i32 %rcc.tmp.10, ptr %max_row
  %rcc.tmp.12 = load i32, ptr %k
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = load i32, ptr %size..tmp
  %rcc.tmp.18 = icmp ult i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = load i32, ptr %size..tmp
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = mul i32 %rcc.tmp.21, %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %k
  %rcc.tmp.26 = add i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.28 = getelementptr [30 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = call i32 @abs.(i32 %rcc.tmp.29)
  %rcc.tmp.31 = load i32, ptr %max_row
  %rcc.tmp.32 = load i32, ptr %size..tmp
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  %rcc.tmp.34 = mul i32 %rcc.tmp.31, %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %k
  %rcc.tmp.36 = add i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.38 = getelementptr [30 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = call i32 @abs.(i32 %rcc.tmp.39)
  %rcc.tmp.41 = icmp sgt i32 %rcc.tmp.30, %rcc.tmp.40
  br i1 %rcc.tmp.41, label %if.then, label %if.else
if.then:
  %rcc.tmp.43 = load i32, ptr %i
  store i32 %rcc.tmp.43, ptr %max_row
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.47 = load i32, ptr %i
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.48, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.51 = load i32, ptr %max_row
  %rcc.tmp.52 = load i32, ptr %k
  %rcc.tmp.53 = icmp ne i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.55 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.56 = load i32, ptr %k
  %rcc.tmp.57 = load i32, ptr %max_row
  %rcc.tmp.58 = load i32, ptr %size..tmp
  call void @swapRows.([30 x i32]* %rcc.tmp.55, i32 %rcc.tmp.56, i32 %rcc.tmp.57, i32 %rcc.tmp.58)
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.62 = load i32, ptr %k
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 1
  store i32 %rcc.tmp.63, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = load i32, ptr %size..tmp
  %rcc.tmp.68 = icmp ult i32 %rcc.tmp.66, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.71 = load i32, ptr %k
  %rcc.tmp.72 = load i32, ptr %size..tmp
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  %rcc.tmp.74 = mul i32 %rcc.tmp.71, %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %k
  %rcc.tmp.76 = add i32 %rcc.tmp.74, %rcc.tmp.75
  %rcc.tmp.77 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.78 = getelementptr [30 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = icmp ne i32 %rcc.tmp.79, 0
  br i1 %rcc.tmp.80, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = load i32, ptr %size..tmp
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = mul i32 %rcc.tmp.82, %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %k
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  %rcc.tmp.88 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.89 = getelementptr [30 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.87
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %k
  %rcc.tmp.92 = load i32, ptr %size..tmp
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 1
  %rcc.tmp.94 = mul i32 %rcc.tmp.91, %rcc.tmp.93
  %rcc.tmp.95 = load i32, ptr %k
  %rcc.tmp.96 = add i32 %rcc.tmp.94, %rcc.tmp.95
  %rcc.tmp.97 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.98 = getelementptr [30 x i32], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.96
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.98
  %rcc.tmp.100 = sdiv i32 %rcc.tmp.90, %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %factor
  %rcc.tmp.102 = load i32, ptr %k
  store i32 %rcc.tmp.102, ptr %j
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.105 = load i32, ptr %j
  %rcc.tmp.106 = load i32, ptr %size..tmp
  %rcc.tmp.107 = icmp ule i32 %rcc.tmp.105, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = load i32, ptr %size..tmp
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  %rcc.tmp.113 = mul i32 %rcc.tmp.110, %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %j
  %rcc.tmp.115 = add i32 %rcc.tmp.113, %rcc.tmp.114
  %rcc.tmp.116 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.117 = getelementptr [30 x i32], ptr %rcc.tmp.116, i32 0, i32 %rcc.tmp.115
  %rcc.tmp.118 = load i32, ptr %factor
  %rcc.tmp.119 = load i32, ptr %k
  %rcc.tmp.120 = load i32, ptr %size..tmp
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  %rcc.tmp.122 = mul i32 %rcc.tmp.119, %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %j
  %rcc.tmp.124 = add i32 %rcc.tmp.122, %rcc.tmp.123
  %rcc.tmp.125 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.126 = getelementptr [30 x i32], ptr %rcc.tmp.125, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = mul i32 %rcc.tmp.118, %rcc.tmp.127
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.117
  %rcc.tmp.130 = sub i32 %rcc.tmp.129, %rcc.tmp.128
  store i32 %rcc.tmp.130, ptr %rcc.tmp.117
  %rcc.tmp.132 = load i32, ptr %j
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %j
  br label %while.cond.4
while.end.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.142 = load i32, ptr %k
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 1
  store i32 %rcc.tmp.143, ptr %k
  br label %while.cond
while.end:
  ret void
}
define void @swapRows.([30 x i32]* %matrix.tmp, i32 %row1.tmp, i32 %row2.tmp, i32 %size.tmp) {
entry:
  %matrix..tmp = alloca [30 x i32]* 
  %row1..tmp = alloca i32 
  %row2..tmp = alloca i32 
  %size..tmp = alloca i32 
  %j = alloca i32 
  %temp = alloca i32 
  store [30 x i32]* %matrix.tmp, ptr %matrix..tmp
  store i32 %row1.tmp, ptr %row1..tmp
  store i32 %row2.tmp, ptr %row2..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %j
  %rcc.tmp.8 = load i32, ptr %size..tmp
  %rcc.tmp.9 = icmp sle i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load i32, ptr %row1..tmp
  %rcc.tmp.13 = load i32, ptr %size..tmp
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  %rcc.tmp.15 = mul i32 %rcc.tmp.12, %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %j
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.19 = getelementptr [30 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %temp
  %rcc.tmp.22 = load i32, ptr %row1..tmp
  %rcc.tmp.23 = load i32, ptr %size..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = mul i32 %rcc.tmp.22, %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %j
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.29 = getelementptr [30 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %row2..tmp
  %rcc.tmp.31 = load i32, ptr %size..tmp
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  %rcc.tmp.33 = mul i32 %rcc.tmp.30, %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %j
  %rcc.tmp.35 = add i32 %rcc.tmp.33, %rcc.tmp.34
  %rcc.tmp.36 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.37 = getelementptr [30 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %rcc.tmp.29
  %rcc.tmp.40 = load i32, ptr %row2..tmp
  %rcc.tmp.41 = load i32, ptr %size..tmp
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  %rcc.tmp.43 = mul i32 %rcc.tmp.40, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = load [30 x i32]*, ptr %matrix..tmp
  %rcc.tmp.47 = getelementptr [30 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = load i32, ptr %temp
  store i32 %rcc.tmp.48, ptr %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %j
  br label %while.cond
while.end:
  ret void
}
define i32 @backSubstitution.([30 x i32]* %matrix.tmp, i32 %size.tmp) {
entry:
  %matrix..local = alloca [30 x i32] 
  %size..tmp = alloca i32 
  %solution_sum = alloca i32 
  %solutions = alloca [5 x i32] 
  %i = alloca i32 
  %i.2 = alloca i32 
  %j = alloca i32 
  %rcc.tmp.1 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %rcc.tmp.1
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 1
  %rcc.tmp.6 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 2
  %rcc.tmp.10 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 3
  %rcc.tmp.14 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 4
  %rcc.tmp.18 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 4
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  %rcc.tmp.21 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 5
  %rcc.tmp.22 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 5
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 6
  %rcc.tmp.26 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 6
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.25
  store i32 %rcc.tmp.27, ptr %rcc.tmp.26
  %rcc.tmp.29 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 7
  %rcc.tmp.30 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 8
  %rcc.tmp.34 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 8
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 9
  %rcc.tmp.38 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 9
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 10
  %rcc.tmp.42 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 10
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 11
  %rcc.tmp.46 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 11
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 12
  %rcc.tmp.50 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 12
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 13
  %rcc.tmp.54 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 13
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %rcc.tmp.54
  %rcc.tmp.57 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 14
  %rcc.tmp.58 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 14
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.57
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 15
  %rcc.tmp.62 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 15
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %rcc.tmp.62
  %rcc.tmp.65 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 16
  %rcc.tmp.66 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 16
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  %rcc.tmp.69 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 17
  %rcc.tmp.70 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 17
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.69
  store i32 %rcc.tmp.71, ptr %rcc.tmp.70
  %rcc.tmp.73 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 18
  %rcc.tmp.74 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 18
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.75, ptr %rcc.tmp.74
  %rcc.tmp.77 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 19
  %rcc.tmp.78 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 19
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.79, ptr %rcc.tmp.78
  %rcc.tmp.81 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 20
  %rcc.tmp.82 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 20
  %rcc.tmp.83 = load i32, ptr %rcc.tmp.81
  store i32 %rcc.tmp.83, ptr %rcc.tmp.82
  %rcc.tmp.85 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 21
  %rcc.tmp.86 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 21
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.87, ptr %rcc.tmp.86
  %rcc.tmp.89 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 22
  %rcc.tmp.90 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 22
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.89
  store i32 %rcc.tmp.91, ptr %rcc.tmp.90
  %rcc.tmp.93 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 23
  %rcc.tmp.94 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 23
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.95, ptr %rcc.tmp.94
  %rcc.tmp.97 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 24
  %rcc.tmp.98 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 24
  %rcc.tmp.99 = load i32, ptr %rcc.tmp.97
  store i32 %rcc.tmp.99, ptr %rcc.tmp.98
  %rcc.tmp.101 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 25
  %rcc.tmp.102 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 25
  %rcc.tmp.103 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.103, ptr %rcc.tmp.102
  %rcc.tmp.105 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 26
  %rcc.tmp.106 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 26
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.106
  %rcc.tmp.109 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 27
  %rcc.tmp.110 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 27
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.109
  store i32 %rcc.tmp.111, ptr %rcc.tmp.110
  %rcc.tmp.113 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 28
  %rcc.tmp.114 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 28
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.113
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = getelementptr [30 x i32], ptr %matrix.tmp, i32 0, i32 29
  %rcc.tmp.118 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 29
  %rcc.tmp.119 = load i32, ptr %rcc.tmp.117
  store i32 %rcc.tmp.119, ptr %rcc.tmp.118
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %solution_sum
  %rcc.tmp.123 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.123
  %rcc.tmp.125 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.125
  %rcc.tmp.127 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.127
  %rcc.tmp.129 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.129
  %rcc.tmp.131 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %size..tmp
  %rcc.tmp.134 = sub i32 %rcc.tmp.133, 1
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  store i32 %rcc.tmp.135, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = icmp sge i32 %rcc.tmp.138, 0
  br i1 %rcc.tmp.139, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = sub i32 %rcc.tmp.142, 1
  store i32 %rcc.tmp.143, ptr %i
  %rcc.tmp.145 = load i32, ptr %i
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  store i32 %rcc.tmp.147, ptr %i.2
  %rcc.tmp.149 = load i32, ptr %i.2
  %rcc.tmp.150 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 %rcc.tmp.149
  %rcc.tmp.151 = load i32, ptr %i.2
  %rcc.tmp.152 = load i32, ptr %size..tmp
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  %rcc.tmp.154 = mul i32 %rcc.tmp.151, %rcc.tmp.153
  %rcc.tmp.155 = load i32, ptr %size..tmp
  %rcc.tmp.156 = add i32 %rcc.tmp.154, %rcc.tmp.155
  %rcc.tmp.157 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.156
  %rcc.tmp.158 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.158, ptr %rcc.tmp.150
  %rcc.tmp.160 = load i32, ptr %i.2
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.164 = load i32, ptr %j
  %rcc.tmp.165 = load i32, ptr %size..tmp
  %rcc.tmp.166 = icmp ult i32 %rcc.tmp.164, %rcc.tmp.165
  br i1 %rcc.tmp.166, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.169 = load i32, ptr %i.2
  %rcc.tmp.170 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 %rcc.tmp.169
  %rcc.tmp.171 = load i32, ptr %i.2
  %rcc.tmp.172 = load i32, ptr %size..tmp
  %rcc.tmp.173 = add i32 %rcc.tmp.172, 1
  %rcc.tmp.174 = mul i32 %rcc.tmp.171, %rcc.tmp.173
  %rcc.tmp.175 = load i32, ptr %j
  %rcc.tmp.176 = add i32 %rcc.tmp.174, %rcc.tmp.175
  %rcc.tmp.177 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.176
  %rcc.tmp.178 = load i32, ptr %rcc.tmp.177
  %rcc.tmp.179 = load i32, ptr %j
  %rcc.tmp.180 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 %rcc.tmp.179
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  %rcc.tmp.182 = mul i32 %rcc.tmp.178, %rcc.tmp.181
  %rcc.tmp.183 = load i32, ptr %rcc.tmp.170
  %rcc.tmp.184 = sub i32 %rcc.tmp.183, %rcc.tmp.182
  store i32 %rcc.tmp.184, ptr %rcc.tmp.170
  %rcc.tmp.186 = load i32, ptr %j
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 1
  store i32 %rcc.tmp.187, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.190 = load i32, ptr %i.2
  %rcc.tmp.191 = load i32, ptr %size..tmp
  %rcc.tmp.192 = add i32 %rcc.tmp.191, 1
  %rcc.tmp.193 = mul i32 %rcc.tmp.190, %rcc.tmp.192
  %rcc.tmp.194 = load i32, ptr %i.2
  %rcc.tmp.195 = add i32 %rcc.tmp.193, %rcc.tmp.194
  %rcc.tmp.196 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.195
  %rcc.tmp.197 = load i32, ptr %rcc.tmp.196
  %rcc.tmp.198 = icmp ne i32 %rcc.tmp.197, 0
  br i1 %rcc.tmp.198, label %if.then, label %if.else
if.then:
  %rcc.tmp.200 = load i32, ptr %i.2
  %rcc.tmp.201 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 %rcc.tmp.200
  %rcc.tmp.202 = load i32, ptr %i.2
  %rcc.tmp.203 = load i32, ptr %size..tmp
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  %rcc.tmp.205 = mul i32 %rcc.tmp.202, %rcc.tmp.204
  %rcc.tmp.206 = load i32, ptr %i.2
  %rcc.tmp.207 = add i32 %rcc.tmp.205, %rcc.tmp.206
  %rcc.tmp.208 = getelementptr [30 x i32], ptr %matrix..local, i32 0, i32 %rcc.tmp.207
  %rcc.tmp.209 = load i32, ptr %rcc.tmp.208
  %rcc.tmp.210 = load i32, ptr %rcc.tmp.201
  %rcc.tmp.211 = sdiv i32 %rcc.tmp.210, %rcc.tmp.209
  store i32 %rcc.tmp.211, ptr %rcc.tmp.201
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.215 = load i32, ptr %i.2
  %rcc.tmp.216 = getelementptr [5 x i32], ptr %solutions, i32 0, i32 %rcc.tmp.215
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  %rcc.tmp.218 = load i32, ptr %solution_sum
  %rcc.tmp.219 = add i32 %rcc.tmp.218, %rcc.tmp.217
  store i32 %rcc.tmp.219, ptr %solution_sum
  br label %while.cond
while.end:
  %rcc.tmp.222 = load i32, ptr %solution_sum
  ret i32 %rcc.tmp.222
}
define i32 @abs.(i32 %x.tmp) {
entry:
  %x..tmp = alloca i32 
  store i32 %x.tmp, ptr %x..tmp
  %rcc.tmp.2 = load i32, ptr %x..tmp
  %rcc.tmp.3 = icmp slt i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  %rcc.tmp.5 = load i32, ptr %x..tmp
  %rcc.tmp.6 = sub i32 0, %rcc.tmp.5
  ret i32 %rcc.tmp.6
if.else:
  %rcc.tmp.8 = load i32, ptr %x..tmp
  ret i32 %rcc.tmp.8
if.merge:
  ret i32 undef
}
define void @performCombinatorialAlgorithms.() {
entry:
  %pascal_sum = alloca i32 
  %permutation_sum = alloca i32 
  %combination_sum = alloca i32 
  %catalan_sum = alloca i32 
  call void @printlnInt.(i32 3007)
  %rcc.tmp.2 = call i32 @calculatePascalTriangle.(i32 20)
  store i32 %rcc.tmp.2, ptr %pascal_sum
  %rcc.tmp.4 = load i32, ptr %pascal_sum
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @calculatePermutations.(i32 15)
  store i32 %rcc.tmp.6, ptr %permutation_sum
  %rcc.tmp.8 = load i32, ptr %permutation_sum
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @calculateCombinations.(i32 20)
  store i32 %rcc.tmp.10, ptr %combination_sum
  %rcc.tmp.12 = load i32, ptr %combination_sum
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @calculateCatalanNumbers.(i32 15)
  store i32 %rcc.tmp.14, ptr %catalan_sum
  %rcc.tmp.16 = load i32, ptr %catalan_sum
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 3008)
  ret void
}
define i32 @calculatePascalTriangle.(i32 %rows.tmp) {
entry:
  %rows..tmp = alloca i32 
  %triangle = alloca [410 x i32] 
  %fill.idx = alloca i32 
  %total_sum = alloca i32 
  %row = alloca i32 
  %col = alloca i32 
  store i32 %rows.tmp, ptr %rows..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 410
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %total_sum
  %rcc.tmp.14 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %total_sum
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %total_sum
  store i32 1, ptr %row
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %row
  %rcc.tmp.22 = load i32, ptr %rows..tmp
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.22
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = load i32, ptr %row
  %rcc.tmp.27 = load i32, ptr %rows..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.28
  store i32 1, ptr %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %total_sum
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %total_sum
  store i32 1, ptr %col
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.36 = load i32, ptr %col
  %rcc.tmp.37 = load i32, ptr %row
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.37
  br i1 %rcc.tmp.38, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.41 = load i32, ptr %row
  %rcc.tmp.42 = load i32, ptr %rows..tmp
  %rcc.tmp.43 = mul i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %col
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %row
  %rcc.tmp.48 = sub i32 %rcc.tmp.47, 1
  %rcc.tmp.49 = load i32, ptr %rows..tmp
  %rcc.tmp.50 = mul i32 %rcc.tmp.48, %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %col
  %rcc.tmp.52 = add i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = sub i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %row
  %rcc.tmp.57 = sub i32 %rcc.tmp.56, 1
  %rcc.tmp.58 = load i32, ptr %rows..tmp
  %rcc.tmp.59 = mul i32 %rcc.tmp.57, %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %col
  %rcc.tmp.61 = add i32 %rcc.tmp.59, %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.55, %rcc.tmp.63
  store i32 %rcc.tmp.64, ptr %rcc.tmp.46
  %rcc.tmp.66 = load i32, ptr %row
  %rcc.tmp.67 = load i32, ptr %rows..tmp
  %rcc.tmp.68 = mul i32 %rcc.tmp.66, %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %col
  %rcc.tmp.70 = add i32 %rcc.tmp.68, %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %total_sum
  %rcc.tmp.74 = add i32 %rcc.tmp.73, %rcc.tmp.72
  store i32 %rcc.tmp.74, ptr %total_sum
  %rcc.tmp.76 = load i32, ptr %col
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %col
  br label %while.cond.2
while.end.2:
  %rcc.tmp.80 = load i32, ptr %row
  %rcc.tmp.81 = load i32, ptr %rows..tmp
  %rcc.tmp.82 = mul i32 %rcc.tmp.80, %rcc.tmp.81
  %rcc.tmp.83 = load i32, ptr %row
  %rcc.tmp.84 = add i32 %rcc.tmp.82, %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [410 x i32], ptr %triangle, i32 0, i32 %rcc.tmp.84
  store i32 1, ptr %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %total_sum
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %total_sum
  %rcc.tmp.90 = load i32, ptr %row
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %row
  br label %while.cond
while.end:
  %rcc.tmp.94 = load i32, ptr %total_sum
  %rcc.tmp.95 = srem i32 %rcc.tmp.94, 10000
  ret i32 %rcc.tmp.95
}
define i32 @calculatePermutations.(i32 %max_n.tmp) {
entry:
  %max_n..tmp = alloca i32 
  %permutation_sum = alloca i32 
  %n = alloca i32 
  %r = alloca i32 
  %perm = alloca i32 
  store i32 %max_n.tmp, ptr %max_n..tmp
  store i32 0, ptr %permutation_sum
  store i32 1, ptr %n
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %n
  %rcc.tmp.6 = load i32, ptr %max_n..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 1, ptr %r
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %r
  %rcc.tmp.13 = load i32, ptr %n
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %n
  %rcc.tmp.18 = load i32, ptr %r
  %rcc.tmp.19 = call i32 @permutation.(i32 %rcc.tmp.17, i32 %rcc.tmp.18)
  store i32 %rcc.tmp.19, ptr %perm
  %rcc.tmp.21 = load i32, ptr %permutation_sum
  %rcc.tmp.22 = load i32, ptr %perm
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 1000000
  store i32 %rcc.tmp.24, ptr %permutation_sum
  %rcc.tmp.26 = load i32, ptr %r
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %r
  br label %while.cond.2
while.end.2:
  %rcc.tmp.30 = load i32, ptr %n
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %n
  br label %while.cond
while.end:
  %rcc.tmp.34 = load i32, ptr %permutation_sum
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 10000
  ret i32 %rcc.tmp.35
}
define i32 @permutation.(i32 %n.tmp, i32 %r.tmp) {
entry:
  %n..tmp = alloca i32 
  %r..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %r.tmp, ptr %r..tmp
  store i32 1, ptr %result
  %rcc.tmp.4 = load i32, ptr %n..tmp
  %rcc.tmp.5 = load i32, ptr %r..tmp
  %rcc.tmp.6 = sub i32 %rcc.tmp.4, %rcc.tmp.5
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.7, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %n..tmp
  %rcc.tmp.12 = icmp sle i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %result
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = mul i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 1000000
  store i32 %rcc.tmp.18, ptr %result
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.24 = load i32, ptr %result
  ret i32 %rcc.tmp.24
}
define i32 @calculateCombinations.(i32 %max_n.tmp) {
entry:
  %max_n..tmp = alloca i32 
  %combination_sum = alloca i32 
  %n = alloca i32 
  %r = alloca i32 
  %comb = alloca i32 
  store i32 %max_n.tmp, ptr %max_n..tmp
  store i32 0, ptr %combination_sum
  store i32 1, ptr %n
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %n
  %rcc.tmp.6 = load i32, ptr %max_n..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %r
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.12 = load i32, ptr %r
  %rcc.tmp.13 = load i32, ptr %n
  %rcc.tmp.14 = icmp sle i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.17 = load i32, ptr %n
  %rcc.tmp.18 = load i32, ptr %r
  %rcc.tmp.19 = call i32 @combination.(i32 %rcc.tmp.17, i32 %rcc.tmp.18)
  store i32 %rcc.tmp.19, ptr %comb
  %rcc.tmp.21 = load i32, ptr %combination_sum
  %rcc.tmp.22 = load i32, ptr %comb
  %rcc.tmp.23 = add i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 1000000
  store i32 %rcc.tmp.24, ptr %combination_sum
  %rcc.tmp.26 = load i32, ptr %r
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %r
  br label %while.cond.2
while.end.2:
  %rcc.tmp.30 = load i32, ptr %n
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %n
  br label %while.cond
while.end:
  %rcc.tmp.34 = load i32, ptr %combination_sum
  %rcc.tmp.35 = srem i32 %rcc.tmp.34, 10000
  ret i32 %rcc.tmp.35
}
define i32 @combination.(i32 %n.tmp, i32 %r.tmp) {
entry:
  %n..tmp = alloca i32 
  %r..tmp = alloca i32 
  %actual_r = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %r.tmp, ptr %r..tmp
  %rcc.tmp.3 = load i32, ptr %r..tmp
  %rcc.tmp.4 = load i32, ptr %n..tmp
  %rcc.tmp.5 = load i32, ptr %r..tmp
  %rcc.tmp.6 = sub i32 %rcc.tmp.4, %rcc.tmp.5
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.3, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %n..tmp
  %rcc.tmp.10 = load i32, ptr %r..tmp
  %rcc.tmp.11 = sub i32 %rcc.tmp.9, %rcc.tmp.10
  br label %if.merge
if.else:
  %rcc.tmp.13 = load i32, ptr %r..tmp
  br label %if.merge
if.merge:
  %rcc.tmp.15 = phi i32 [%rcc.tmp.11, %if.then], [%rcc.tmp.13, %if.else]
  store i32 %rcc.tmp.15, ptr %actual_r
  store i32 1, ptr %result
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = load i32, ptr %actual_r
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.20, %rcc.tmp.21
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %result
  %rcc.tmp.26 = load i32, ptr %n..tmp
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = sub i32 %rcc.tmp.26, %rcc.tmp.27
  %rcc.tmp.29 = mul i32 %rcc.tmp.25, %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  %rcc.tmp.32 = sdiv i32 %rcc.tmp.29, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %result
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %result
  %rcc.tmp.39 = srem i32 %rcc.tmp.38, 1000000
  ret i32 %rcc.tmp.39
}
define i32 @calculateCatalanNumbers.(i32 %count.tmp) {
entry:
  %count..tmp = alloca i32 
  %catalan = alloca [15 x i32] 
  %catalan_sum = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %count.tmp, ptr %count..tmp
  %rcc.tmp.2 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.30
  store i32 0, ptr %catalan_sum
  %rcc.tmp.33 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 1
  store i32 1, ptr %rcc.tmp.35
  store i32 2, ptr %catalan_sum
  store i32 2, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = load i32, ptr %count..tmp
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.40, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 %rcc.tmp.45
  store i32 0, ptr %rcc.tmp.46
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.50 = load i32, ptr %j
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.50, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %j
  %rcc.tmp.61 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = sub i32 %rcc.tmp.63, 1
  %rcc.tmp.65 = load i32, ptr %j
  %rcc.tmp.66 = sub i32 %rcc.tmp.64, %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = mul i32 %rcc.tmp.62, %rcc.tmp.68
  %rcc.tmp.70 = add i32 %rcc.tmp.59, %rcc.tmp.69
  %rcc.tmp.71 = srem i32 %rcc.tmp.70, 1000000
  store i32 %rcc.tmp.71, ptr %rcc.tmp.56
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.77 = load i32, ptr %catalan_sum
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = getelementptr [15 x i32], ptr %catalan, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.77, %rcc.tmp.80
  %rcc.tmp.82 = srem i32 %rcc.tmp.81, 1000000
  store i32 %rcc.tmp.82, ptr %catalan_sum
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.88 = load i32, ptr %catalan_sum
  %rcc.tmp.89 = srem i32 %rcc.tmp.88, 10000
  ret i32 %rcc.tmp.89
}
define void @performCryptographicOperations.() {
entry:
  %rsa_result = alloca i32 
  %inverse_result = alloca i32 
  %primality_result = alloca i32 
  %hash_result = alloca i32 
  call void @printlnInt.(i32 3009)
  %rcc.tmp.2 = call i32 @performRSAOperations.()
  store i32 %rcc.tmp.2, ptr %rsa_result
  %rcc.tmp.4 = load i32, ptr %rsa_result
  call void @printlnInt.(i32 %rcc.tmp.4)
  %rcc.tmp.6 = call i32 @performModularInverse.()
  store i32 %rcc.tmp.6, ptr %inverse_result
  %rcc.tmp.8 = load i32, ptr %inverse_result
  call void @printlnInt.(i32 %rcc.tmp.8)
  %rcc.tmp.10 = call i32 @performPrimalityTesting.()
  store i32 %rcc.tmp.10, ptr %primality_result
  %rcc.tmp.12 = load i32, ptr %primality_result
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = call i32 @performHashOperations.()
  store i32 %rcc.tmp.14, ptr %hash_result
  %rcc.tmp.16 = load i32, ptr %hash_result
  call void @printlnInt.(i32 %rcc.tmp.16)
  call void @printlnInt.(i32 3010)
  ret void
}
define i32 @performRSAOperations.() {
entry:
  %result_sum = alloca i32 
  %p = alloca i32 
  %q = alloca i32 
  %n = alloca i32 
  %phi_n = alloca i32 
  %e = alloca i32 
  %d = alloca i32 
  %message = alloca i32 
  %ciphertext = alloca i32 
  %plaintext = alloca i32 
  store i32 0, ptr %result_sum
  store i32 61, ptr %p
  store i32 53, ptr %q
  %rcc.tmp.4 = load i32, ptr %p
  %rcc.tmp.5 = load i32, ptr %q
  %rcc.tmp.6 = mul i32 %rcc.tmp.4, %rcc.tmp.5
  store i32 %rcc.tmp.6, ptr %n
  %rcc.tmp.8 = load i32, ptr %p
  %rcc.tmp.9 = sub i32 %rcc.tmp.8, 1
  %rcc.tmp.10 = load i32, ptr %q
  %rcc.tmp.11 = sub i32 %rcc.tmp.10, 1
  %rcc.tmp.12 = mul i32 %rcc.tmp.9, %rcc.tmp.11
  store i32 %rcc.tmp.12, ptr %phi_n
  store i32 17, ptr %e
  %rcc.tmp.15 = load i32, ptr %e
  %rcc.tmp.16 = load i32, ptr %phi_n
  %rcc.tmp.17 = call i32 @modularInverse.(i32 %rcc.tmp.15, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %d
  store i32 2, ptr %message
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %message
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 100
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %message
  %rcc.tmp.26 = load i32, ptr %e
  %rcc.tmp.27 = load i32, ptr %n
  %rcc.tmp.28 = call i32 @modularPower.(i32 %rcc.tmp.25, i32 %rcc.tmp.26, i32 %rcc.tmp.27)
  store i32 %rcc.tmp.28, ptr %ciphertext
  %rcc.tmp.30 = load i32, ptr %ciphertext
  %rcc.tmp.31 = load i32, ptr %d
  %rcc.tmp.32 = load i32, ptr %n
  %rcc.tmp.33 = call i32 @modularPower.(i32 %rcc.tmp.30, i32 %rcc.tmp.31, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %plaintext
  %rcc.tmp.35 = load i32, ptr %plaintext
  %rcc.tmp.36 = load i32, ptr %message
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %message
  %rcc.tmp.40 = load i32, ptr %result_sum
  %rcc.tmp.41 = add i32 %rcc.tmp.40, %rcc.tmp.39
  store i32 %rcc.tmp.41, ptr %result_sum
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.45 = load i32, ptr %message
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 7
  store i32 %rcc.tmp.46, ptr %message
  br label %while.cond
while.end:
  %rcc.tmp.49 = load i32, ptr %result_sum
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 10000
  ret i32 %rcc.tmp.50
}
define i32 @modularInverse.(i32 %a.tmp, i32 %m.tmp) {
entry:
  %a..tmp = alloca i32 
  %m..tmp = alloca i32 
  %old_r = alloca i32 
  %r = alloca i32 
  %old_s = alloca i32 
  %s = alloca i32 
  %quotient = alloca i32 
  %temp_r = alloca i32 
  %temp_s = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %m.tmp, ptr %m..tmp
  %rcc.tmp.3 = load i32, ptr %a..tmp
  store i32 %rcc.tmp.3, ptr %old_r
  %rcc.tmp.5 = load i32, ptr %m..tmp
  store i32 %rcc.tmp.5, ptr %r
  store i32 1, ptr %old_s
  store i32 0, ptr %s
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %r
  %rcc.tmp.11 = icmp ne i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %old_r
  %rcc.tmp.15 = load i32, ptr %r
  %rcc.tmp.16 = sdiv i32 %rcc.tmp.14, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %quotient
  %rcc.tmp.18 = load i32, ptr %r
  store i32 %rcc.tmp.18, ptr %temp_r
  %rcc.tmp.20 = load i32, ptr %old_r
  %rcc.tmp.21 = load i32, ptr %quotient
  %rcc.tmp.22 = load i32, ptr %r
  %rcc.tmp.23 = mul i32 %rcc.tmp.21, %rcc.tmp.22
  %rcc.tmp.24 = sub i32 %rcc.tmp.20, %rcc.tmp.23
  store i32 %rcc.tmp.24, ptr %r
  %rcc.tmp.26 = load i32, ptr %temp_r
  store i32 %rcc.tmp.26, ptr %old_r
  %rcc.tmp.28 = load i32, ptr %s
  store i32 %rcc.tmp.28, ptr %temp_s
  %rcc.tmp.30 = load i32, ptr %old_s
  %rcc.tmp.31 = load i32, ptr %quotient
  %rcc.tmp.32 = load i32, ptr %s
  %rcc.tmp.33 = mul i32 %rcc.tmp.31, %rcc.tmp.32
  %rcc.tmp.34 = sub i32 %rcc.tmp.30, %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %s
  %rcc.tmp.36 = load i32, ptr %temp_s
  store i32 %rcc.tmp.36, ptr %old_s
  br label %while.cond
while.end:
  %rcc.tmp.39 = load i32, ptr %old_s
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.39, 0
  br i1 %rcc.tmp.40, label %if.then, label %if.else
if.then:
  %rcc.tmp.42 = load i32, ptr %m..tmp
  %rcc.tmp.43 = load i32, ptr %old_s
  %rcc.tmp.44 = add i32 %rcc.tmp.43, %rcc.tmp.42
  store i32 %rcc.tmp.44, ptr %old_s
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %old_s
  ret i32 %rcc.tmp.48
}
define i32 @performModularInverse.() {
entry:
  %inverse_sum = alloca i32 
  %modulus = alloca i32 
  %a = alloca i32 
  %inverse = alloca i32 
  store i32 0, ptr %inverse_sum
  store i32 97, ptr %modulus
  store i32 2, ptr %a
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %a
  %rcc.tmp.6 = load i32, ptr %modulus
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %a
  %rcc.tmp.11 = load i32, ptr %modulus
  %rcc.tmp.12 = call i32 @euclideanGCD.(i32 %rcc.tmp.10, i32 %rcc.tmp.11)
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 1
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load i32, ptr %a
  %rcc.tmp.16 = load i32, ptr %modulus
  %rcc.tmp.17 = call i32 @modularInverse.(i32 %rcc.tmp.15, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %inverse
  %rcc.tmp.19 = load i32, ptr %inverse_sum
  %rcc.tmp.20 = load i32, ptr %inverse
  %rcc.tmp.21 = add i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 10000
  store i32 %rcc.tmp.22, ptr %inverse_sum
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.26 = load i32, ptr %a
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %a
  br label %while.cond
while.end:
  %rcc.tmp.30 = load i32, ptr %inverse_sum
  ret i32 %rcc.tmp.30
}
define i32 @performPrimalityTesting.() {
entry:
  %probable_primes = alloca i32 
  %num = alloca i32 
  store i32 0, ptr %probable_primes
  store i32 3, ptr %num
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %num
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 500
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %num
  %rcc.tmp.9 = call i32 @fermatPrimalityTest.(i32 %rcc.tmp.8, i32 5)
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 1
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %probable_primes
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.13, ptr %probable_primes
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.17 = load i32, ptr %num
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 2
  store i32 %rcc.tmp.18, ptr %num
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %probable_primes
  ret i32 %rcc.tmp.21
}
define i32 @fermatPrimalityTest.(i32 %n.tmp, i32 %iterations.tmp) {
entry:
  %n..tmp = alloca i32 
  %iterations..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  %a = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  store i32 %iterations.tmp, ptr %iterations..tmp
  %rcc.tmp.3 = load i32, ptr %n..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 1
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load i32, ptr %n..tmp
  %rcc.tmp.9 = icmp sle i32 %rcc.tmp.8, 3
  br i1 %rcc.tmp.9, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.13 = load i32, ptr %n..tmp
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 2
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 0
  br i1 %rcc.tmp.15, label %if.then.3, label %if.else.3
if.then.3:
  ret i32 0
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.19 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.19, ptr %seed
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = load i32, ptr %iterations..tmp
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load i32, ptr %seed
  %rcc.tmp.29 = call i32 @updateSeed.(i32 %rcc.tmp.28)
  store i32 %rcc.tmp.29, ptr %seed
  %rcc.tmp.31 = load i32, ptr %seed
  %rcc.tmp.32 = load i32, ptr %n..tmp
  %rcc.tmp.33 = sub i32 %rcc.tmp.32, 3
  %rcc.tmp.34 = srem i32 %rcc.tmp.31, %rcc.tmp.33
  %rcc.tmp.35 = add i32 2, %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %a
  %rcc.tmp.37 = load i32, ptr %a
  %rcc.tmp.38 = load i32, ptr %n..tmp
  %rcc.tmp.39 = sub i32 %rcc.tmp.38, 1
  %rcc.tmp.40 = load i32, ptr %n..tmp
  %rcc.tmp.41 = call i32 @modularPower.(i32 %rcc.tmp.37, i32 %rcc.tmp.39, i32 %rcc.tmp.40)
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.41, 1
  br i1 %rcc.tmp.42, label %if.then.4, label %if.else.4
if.then.4:
  ret i32 0
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond
while.end:
  ret i32 1
}
define i32 @performHashOperations.() {
entry:
  %input_size = alloca i32 
  %input_data = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %hash_sum = alloca i32 
  %djb2_hash = alloca i32 
  %sdbm_hash = alloca i32 
  %fnv_hash = alloca i32 
  %distribution_score = alloca i32 
  store i32 100, ptr %input_size
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x i32], ptr %input_data, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %hash_sum
  %rcc.tmp.14 = load i32, ptr %input_size
  call void @initializeHashInput.([100 x i32]* %input_data, i32 %rcc.tmp.14)
  %rcc.tmp.16 = load i32, ptr %input_size
  %rcc.tmp.17 = call i32 @djb2Hash.([100 x i32]* %input_data, i32 %rcc.tmp.16)
  store i32 %rcc.tmp.17, ptr %djb2_hash
  %rcc.tmp.19 = load i32, ptr %input_size
  %rcc.tmp.20 = call i32 @sdbmHash.([100 x i32]* %input_data, i32 %rcc.tmp.19)
  store i32 %rcc.tmp.20, ptr %sdbm_hash
  %rcc.tmp.22 = load i32, ptr %input_size
  %rcc.tmp.23 = call i32 @fnvHash.([100 x i32]* %input_data, i32 %rcc.tmp.22)
  store i32 %rcc.tmp.23, ptr %fnv_hash
  %rcc.tmp.25 = load i32, ptr %djb2_hash
  %rcc.tmp.26 = load i32, ptr %sdbm_hash
  %rcc.tmp.27 = add i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %fnv_hash
  %rcc.tmp.29 = add i32 %rcc.tmp.27, %rcc.tmp.28
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 10000
  store i32 %rcc.tmp.30, ptr %hash_sum
  %rcc.tmp.32 = load i32, ptr %input_size
  %rcc.tmp.33 = call i32 @testHashDistribution.([100 x i32]* %input_data, i32 %rcc.tmp.32)
  store i32 %rcc.tmp.33, ptr %distribution_score
  %rcc.tmp.35 = load i32, ptr %hash_sum
  %rcc.tmp.36 = load i32, ptr %distribution_score
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  %rcc.tmp.38 = srem i32 %rcc.tmp.37, 10000
  store i32 %rcc.tmp.38, ptr %hash_sum
  %rcc.tmp.40 = load i32, ptr %hash_sum
  ret i32 %rcc.tmp.40
}
define i32 @updateSeed.(i32 %seed.tmp) {
entry:
  %seed..tmp = alloca i32 
  store i32 %seed.tmp, ptr %seed..tmp
  %rcc.tmp.2 = load i32, ptr %seed..tmp
  %rcc.tmp.3 = mul i32 %rcc.tmp.2, 1103
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 4721
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 1048583
  store i32 %rcc.tmp.5, ptr %seed..tmp
  %rcc.tmp.7 = load i32, ptr %seed..tmp
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 0
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %seed..tmp
  %rcc.tmp.11 = sub i32 0, %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %seed..tmp
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.15 = load i32, ptr %seed..tmp
  ret i32 %rcc.tmp.15
}
define void @initializeHashInput.([100 x i32]* %data.tmp, i32 %size.tmp) {
entry:
  %data..tmp = alloca [100 x i32]* 
  %size..tmp = alloca i32 
  %seed = alloca i32 
  %i = alloca i32 
  store [100 x i32]* %data.tmp, ptr %data..tmp
  store i32 %size.tmp, ptr %size..tmp
  store i32 42, ptr %seed
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
  %rcc.tmp.11 = load i32, ptr %seed
  %rcc.tmp.12 = call i32 @updateSeed.(i32 %rcc.tmp.11)
  store i32 %rcc.tmp.12, ptr %seed
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load [100 x i32]*, ptr %data..tmp
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.17 = load i32, ptr %seed
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 256
  store i32 %rcc.tmp.18, ptr %rcc.tmp.16
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @djb2Hash.([100 x i32]* %data.tmp, i32 %size.tmp) {
entry:
  %data..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %hash = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %data..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %data.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 5381, ptr %hash
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %hash
  %rcc.tmp.14 = shl i32 %rcc.tmp.13, 5
  %rcc.tmp.15 = srem i32 %rcc.tmp.14, 65536
  %rcc.tmp.16 = load i32, ptr %hash
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 65536
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %data..local, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.18, %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %hash
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = load i32, ptr %hash
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 65536
  ret i32 %rcc.tmp.29
}
define i32 @sdbmHash.([100 x i32]* %data.tmp, i32 %size.tmp) {
entry:
  %data..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %hash = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %data..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %data.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %hash
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %size..tmp
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %data..local, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %hash
  %rcc.tmp.17 = shl i32 %rcc.tmp.16, 6
  %rcc.tmp.18 = srem i32 %rcc.tmp.17, 65536
  %rcc.tmp.19 = add i32 %rcc.tmp.15, %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %hash
  %rcc.tmp.21 = shl i32 %rcc.tmp.20, 16
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 65536
  %rcc.tmp.23 = add i32 %rcc.tmp.19, %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %hash
  %rcc.tmp.25 = sub i32 %rcc.tmp.23, %rcc.tmp.24
  store i32 %rcc.tmp.25, ptr %hash
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.31 = load i32, ptr %hash
  %rcc.tmp.32 = srem i32 %rcc.tmp.31, 65536
  ret i32 %rcc.tmp.32
}
define i32 @fnvHash.([100 x i32]* %data.tmp, i32 %size.tmp) {
entry:
  %data..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %fnv_prime = alloca i32 
  %hash = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %data..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %data.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 16777619, ptr %fnv_prime
  store i32 2166136261, ptr %hash
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
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %data..local, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load i32, ptr %hash
  %rcc.tmp.19 = xor i32 %rcc.tmp.18, %rcc.tmp.17
  store i32 %rcc.tmp.19, ptr %hash
  %rcc.tmp.21 = load i32, ptr %hash
  %rcc.tmp.22 = urem i32 %rcc.tmp.21, 65536
  %rcc.tmp.23 = load i32, ptr %fnv_prime
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 65536
  %rcc.tmp.25 = mul i32 %rcc.tmp.22, %rcc.tmp.24
  %rcc.tmp.26 = urem i32 %rcc.tmp.25, 65536
  store i32 %rcc.tmp.26, ptr %hash
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.32 = load i32, ptr %hash
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = srem i32 %rcc.tmp.33, 65536
  ret i32 %rcc.tmp.34
}
define i32 @testHashDistribution.([100 x i32]* %base_data.tmp, i32 %size.tmp) {
entry:
  %base_data..local = alloca [100 x i32] 
  %size..tmp = alloca i32 
  %distribution_score = alloca i32 
  %modified_data = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %modification = alloca i32 
  %i = alloca i32 
  %hash = alloca i32 
  %rcc.tmp.1 = bitcast [100 x i32]* %base_data..local to i8*
  %rcc.tmp.2 = bitcast [100 x i32]* %base_data.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 400, i1 0)
  store i32 %size.tmp, ptr %size..tmp
  store i32 0, ptr %distribution_score
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 100
  br i1 %rcc.tmp.9, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = getelementptr [100 x i32], ptr %modified_data, i32 0, i32 %rcc.tmp.11
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.14, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 1, ptr %modification
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %modification
  %rcc.tmp.20 = icmp sle i32 %rcc.tmp.19, 10
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = load i32, ptr %size..tmp
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.25, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = getelementptr [100 x i32], ptr %modified_data, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = getelementptr [100 x i32], ptr %base_data..local, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.34, ptr %rcc.tmp.31
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.40 = load i32, ptr %modification
  %rcc.tmp.41 = mul i32 %rcc.tmp.40, 7
  %rcc.tmp.42 = load i32, ptr %size..tmp
  %rcc.tmp.43 = srem i32 %rcc.tmp.41, %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [100 x i32], ptr %modified_data, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %modification
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.47 = add i32 %rcc.tmp.46, %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.44
  %rcc.tmp.49 = load i32, ptr %size..tmp
  %rcc.tmp.50 = call i32 @djb2Hash.([100 x i32]* %modified_data, i32 %rcc.tmp.49)
  store i32 %rcc.tmp.50, ptr %hash
  %rcc.tmp.52 = load i32, ptr %distribution_score
  %rcc.tmp.53 = load i32, ptr %hash
  %rcc.tmp.54 = add i32 %rcc.tmp.52, %rcc.tmp.53
  %rcc.tmp.55 = srem i32 %rcc.tmp.54, 10000
  store i32 %rcc.tmp.55, ptr %distribution_score
  %rcc.tmp.57 = load i32, ptr %modification
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %modification
  br label %while.cond
while.end:
  %rcc.tmp.61 = load i32, ptr %distribution_score
  ret i32 %rcc.tmp.61
}
