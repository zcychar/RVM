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
%Chromosome = type {[16 x i32], i32}
define i32 @pseudo_rand.(i32* %seed.tmp) {
entry:
  %seed..tmp = alloca i32* 
  store i32* %seed.tmp, ptr %seed..tmp
  %rcc.tmp.2 = load i32*, ptr %seed..tmp
  %rcc.tmp.3 = load i32*, ptr %seed..tmp
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = mul i32 %rcc.tmp.4, 127
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 16777337
  %rcc.tmp.7 = and i32 %rcc.tmp.6, 16777215
  store i32 %rcc.tmp.7, ptr %rcc.tmp.2
  %rcc.tmp.9 = load i32*, ptr %seed..tmp
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  ret i32 %rcc.tmp.10
}
define void @init_population.([64 x %Chromosome]* %pop.tmp, i32* %seed.tmp) {
entry:
  %pop..tmp = alloca [64 x %Chromosome]* 
  %seed..tmp = alloca i32* 
  %i = alloca i32 
  %j = alloca i32 
  store [64 x %Chromosome]* %pop.tmp, ptr %pop..tmp
  store i32* %seed.tmp, ptr %seed..tmp
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
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 16
  br i1 %rcc.tmp.12, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [64 x %Chromosome]*, ptr %pop..tmp
  %rcc.tmp.18 = getelementptr [64 x %Chromosome], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = getelementptr %Chromosome, ptr %rcc.tmp.18, i32 0, i32 0
  %rcc.tmp.20 = load i32, ptr %j
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32*, ptr %seed..tmp
  %rcc.tmp.24 = call i32 @pseudo_rand.(i32* %rcc.tmp.23)
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 200
  %rcc.tmp.26 = sub i32 %rcc.tmp.25, 100
  store i32 %rcc.tmp.26, ptr %rcc.tmp.22
  %rcc.tmp.28 = load i32, ptr %j
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @calculate_fitness.(%Chromosome* %chrom.tmp) {
entry:
  %chrom..tmp = alloca %Chromosome* 
  %target_sum = alloca i32 
  %sum = alloca i32 
  %penalty = alloca i32 
  %i = alloca i32 
  %diff = alloca i32 
  store %Chromosome* %chrom.tmp, ptr %chrom..tmp
  store i32 500, ptr %target_sum
  store i32 0, ptr %sum
  store i32 0, ptr %penalty
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 16
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %sum
  %rcc.tmp.12 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.13 = getelementptr %Chromosome, ptr %rcc.tmp.12, i32 0, i32 0
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [16 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.11, %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %sum
  %rcc.tmp.20 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.21 = getelementptr %Chromosome, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [16 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = icmp sgt i32 %rcc.tmp.25, 90
  br i1 %rcc.tmp.26, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.28 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.29 = getelementptr %Chromosome, ptr %rcc.tmp.28, i32 0, i32 0
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [16 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  %rcc.tmp.34 = sub i32 0, 90
  %rcc.tmp.35 = icmp slt i32 %rcc.tmp.33, %rcc.tmp.34
  br label %sc.merge
sc.merge:
  %rcc.tmp.37 = phi i1 [1, %while.body], [%rcc.tmp.35, %or.rhs]
  br i1 %rcc.tmp.37, label %if.then, label %if.else
if.then:
  %rcc.tmp.39 = load i32, ptr %penalty
  %rcc.tmp.40 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.41 = getelementptr %Chromosome, ptr %rcc.tmp.40, i32 0, i32 0
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [16 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.47 = getelementptr %Chromosome, ptr %rcc.tmp.46, i32 0, i32 0
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = mul i32 %rcc.tmp.45, %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.39, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %penalty
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.61 = load i32, ptr %target_sum
  %rcc.tmp.62 = load i32, ptr %sum
  %rcc.tmp.63 = sub i32 %rcc.tmp.61, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %diff
  %rcc.tmp.65 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.66 = getelementptr %Chromosome, ptr %rcc.tmp.65, i32 0, i32 1
  %rcc.tmp.67 = load i32, ptr %diff
  %rcc.tmp.68 = load i32, ptr %diff
  %rcc.tmp.69 = mul i32 %rcc.tmp.67, %rcc.tmp.68
  %rcc.tmp.70 = sub i32 0, %rcc.tmp.69
  %rcc.tmp.71 = load i32, ptr %penalty
  %rcc.tmp.72 = sub i32 %rcc.tmp.70, %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %rcc.tmp.66
  ret void
}
define void @evaluate_population.([64 x %Chromosome]* %pop.tmp) {
entry:
  %pop..tmp = alloca [64 x %Chromosome]* 
  %i = alloca i32 
  store [64 x %Chromosome]* %pop.tmp, ptr %pop..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 64
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 0
  %rcc.tmp.10 = load [64 x %Chromosome]*, ptr %pop..tmp
  %rcc.tmp.11 = getelementptr [64 x %Chromosome], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  call void @calculate_fitness.(%Chromosome* %rcc.tmp.11)
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %i
  br label %while.cond
while.end:
  ret void
}
define i32 @selection.([64 x %Chromosome]* %pop.tmp, i32* %seed.tmp) {
entry:
  %pop..tmp = alloca [64 x %Chromosome]* 
  %seed..tmp = alloca i32* 
  %tournament_size = alloca i32 
  %best_index = alloca i32 
  %best_fitness = alloca i32 
  %i = alloca i32 
  %idx = alloca i32 
  store [64 x %Chromosome]* %pop.tmp, ptr %pop..tmp
  store i32* %seed.tmp, ptr %seed..tmp
  store i32 5, ptr %tournament_size
  %rcc.tmp.4 = sub i32 0, 1
  store i32 %rcc.tmp.4, ptr %best_index
  %rcc.tmp.6 = sub i32 0, 99999999
  store i32 %rcc.tmp.6, ptr %best_fitness
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %tournament_size
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32*, ptr %seed..tmp
  %rcc.tmp.16 = call i32 @pseudo_rand.(i32* %rcc.tmp.15)
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = urem i32 %rcc.tmp.17, 64
  store i32 %rcc.tmp.18, ptr %idx
  %rcc.tmp.20 = load i32, ptr %idx
  %rcc.tmp.21 = load [64 x %Chromosome]*, ptr %pop..tmp
  %rcc.tmp.22 = getelementptr [64 x %Chromosome], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = getelementptr %Chromosome, ptr %rcc.tmp.22, i32 0, i32 1
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %best_fitness
  %rcc.tmp.26 = icmp sgt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %idx
  %rcc.tmp.29 = load [64 x %Chromosome]*, ptr %pop..tmp
  %rcc.tmp.30 = getelementptr [64 x %Chromosome], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.31 = getelementptr %Chromosome, ptr %rcc.tmp.30, i32 0, i32 1
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %best_fitness
  %rcc.tmp.34 = load i32, ptr %idx
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  store i32 %rcc.tmp.35, ptr %best_index
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.43 = load i32, ptr %best_index
  ret i32 %rcc.tmp.43
}
define void @crossover.(%Chromosome* %parent1.tmp, %Chromosome* %parent2.tmp, %Chromosome* %child.tmp, i32* %seed.tmp) {
entry:
  %parent1..tmp = alloca %Chromosome* 
  %parent2..tmp = alloca %Chromosome* 
  %child..tmp = alloca %Chromosome* 
  %seed..tmp = alloca i32* 
  %crossover_point = alloca i32 
  %i = alloca i32 
  store %Chromosome* %parent1.tmp, ptr %parent1..tmp
  store %Chromosome* %parent2.tmp, ptr %parent2..tmp
  store %Chromosome* %child.tmp, ptr %child..tmp
  store i32* %seed.tmp, ptr %seed..tmp
  %rcc.tmp.5 = load i32*, ptr %seed..tmp
  %rcc.tmp.6 = call i32 @pseudo_rand.(i32* %rcc.tmp.5)
  %rcc.tmp.7 = srem i32 %rcc.tmp.6, 16
  store i32 %rcc.tmp.7, ptr %crossover_point
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 16
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = load i32, ptr %crossover_point
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.15, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load %Chromosome*, ptr %child..tmp
  %rcc.tmp.21 = getelementptr %Chromosome, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [16 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load %Chromosome*, ptr %parent1..tmp
  %rcc.tmp.26 = getelementptr %Chromosome, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %rcc.tmp.24
  br label %if.merge
if.else:
  %rcc.tmp.33 = load %Chromosome*, ptr %child..tmp
  %rcc.tmp.34 = getelementptr %Chromosome, ptr %rcc.tmp.33, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load %Chromosome*, ptr %parent2..tmp
  %rcc.tmp.39 = getelementptr %Chromosome, ptr %rcc.tmp.38, i32 0, i32 0
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [16 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  store i32 %rcc.tmp.43, ptr %rcc.tmp.37
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @mutate.(%Chromosome* %chrom.tmp, i32* %seed.tmp) {
entry:
  %chrom..tmp = alloca %Chromosome* 
  %seed..tmp = alloca i32* 
  %mutation_rate = alloca i32 
  %i = alloca i32 
  store %Chromosome* %chrom.tmp, ptr %chrom..tmp
  store i32* %seed.tmp, ptr %seed..tmp
  store i32 10, ptr %mutation_rate
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 16
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32*, ptr %seed..tmp
  %rcc.tmp.11 = call i32 @pseudo_rand.(i32* %rcc.tmp.10)
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 100
  %rcc.tmp.13 = load i32, ptr %mutation_rate
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.17 = getelementptr %Chromosome, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [16 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load %Chromosome*, ptr %chrom..tmp
  %rcc.tmp.22 = getelementptr %Chromosome, ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32*, ptr %seed..tmp
  %rcc.tmp.28 = call i32 @pseudo_rand.(i32* %rcc.tmp.27)
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 20
  %rcc.tmp.30 = sub i32 %rcc.tmp.29, 10
  %rcc.tmp.31 = add i32 %rcc.tmp.26, %rcc.tmp.30
  store i32 %rcc.tmp.31, ptr %rcc.tmp.20
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @main() {
entry:
  %population = alloca [64 x %Chromosome] 
  %fill.idx = alloca i32 
  %rng_seed = alloca i32 
  %generation = alloca i32 
  %new_population = alloca [64 x %Chromosome] 
  %fill.idx.2 = alloca i32 
  %i = alloca i32 
  %p1_idx = alloca i32 
  %p2_idx = alloca i32 
  %i.2 = alloca i32 
  %best_fitness = alloca i32 
  %i.3 = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 64
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [64 x %Chromosome], ptr %population, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = getelementptr %Chromosome, ptr %rcc.tmp.7, i32 0, i32 0
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr %Chromosome, ptr %rcc.tmp.7, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.43, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 12345, ptr %rng_seed
  call void @init_population.([64 x %Chromosome]* %population, i32* %rng_seed)
  store i32 0, ptr %generation
  br label %while.cond
while.cond:
  %rcc.tmp.50 = load i32, ptr %generation
  %rcc.tmp.51 = icmp slt i32 %rcc.tmp.50, 50
  br i1 %rcc.tmp.51, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  call void @evaluate_population.([64 x %Chromosome]* %population)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.57 = load i32, ptr %fill.idx.2
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 64
  br i1 %rcc.tmp.58, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.60 = load i32, ptr %fill.idx.2
  %rcc.tmp.61 = getelementptr [64 x %Chromosome], ptr %new_population, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.62 = getelementptr %Chromosome, ptr %rcc.tmp.61, i32 0, i32 0
  %rcc.tmp.63 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.73
  %rcc.tmp.75 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [16 x i32], ptr %rcc.tmp.62, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr %Chromosome, ptr %rcc.tmp.61, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.97, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.102 = load i32, ptr %i
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.102, 64
  br i1 %rcc.tmp.103, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.106 = call i32 @selection.([64 x %Chromosome]* %population, i32* %rng_seed)
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  store i32 %rcc.tmp.107, ptr %p1_idx
  %rcc.tmp.109 = call i32 @selection.([64 x %Chromosome]* %population, i32* %rng_seed)
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  store i32 %rcc.tmp.110, ptr %p2_idx
  %rcc.tmp.112 = load i32, ptr %p1_idx
  %rcc.tmp.113 = getelementptr [64 x %Chromosome], ptr %population, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %p2_idx
  %rcc.tmp.115 = getelementptr [64 x %Chromosome], ptr %population, i32 0, i32 %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.116, 0
  %rcc.tmp.118 = getelementptr [64 x %Chromosome], ptr %new_population, i32 0, i32 %rcc.tmp.117
  call void @crossover.(%Chromosome* %rcc.tmp.113, %Chromosome* %rcc.tmp.115, %Chromosome* %rcc.tmp.118, i32* %rng_seed)
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [64 x %Chromosome], ptr %new_population, i32 0, i32 %rcc.tmp.121
  call void @mutate.(%Chromosome* %rcc.tmp.122, i32* %rng_seed)
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.130 = load i32, ptr %i.2
  %rcc.tmp.131 = icmp slt i32 %rcc.tmp.130, 64
  br i1 %rcc.tmp.131, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.134 = load i32, ptr %i.2
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [64 x %Chromosome], ptr %population, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %i.2
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [64 x %Chromosome], ptr %new_population, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = getelementptr %Chromosome, ptr %rcc.tmp.139, i32 0, i32 0
  %rcc.tmp.141 = getelementptr %Chromosome, ptr %rcc.tmp.136, i32 0, i32 0
  %rcc.tmp.142 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 0
  %rcc.tmp.143 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 0
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.142
  store i32 %rcc.tmp.144, ptr %rcc.tmp.143
  %rcc.tmp.146 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 1
  %rcc.tmp.147 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 1
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.146
  store i32 %rcc.tmp.148, ptr %rcc.tmp.147
  %rcc.tmp.150 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 2
  %rcc.tmp.151 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 2
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.150
  store i32 %rcc.tmp.152, ptr %rcc.tmp.151
  %rcc.tmp.154 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 3
  %rcc.tmp.155 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 3
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.154
  store i32 %rcc.tmp.156, ptr %rcc.tmp.155
  %rcc.tmp.158 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 4
  %rcc.tmp.159 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 4
  %rcc.tmp.160 = load i32, ptr %rcc.tmp.158
  store i32 %rcc.tmp.160, ptr %rcc.tmp.159
  %rcc.tmp.162 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 5
  %rcc.tmp.163 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 5
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.162
  store i32 %rcc.tmp.164, ptr %rcc.tmp.163
  %rcc.tmp.166 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 6
  %rcc.tmp.167 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 6
  %rcc.tmp.168 = load i32, ptr %rcc.tmp.166
  store i32 %rcc.tmp.168, ptr %rcc.tmp.167
  %rcc.tmp.170 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 7
  %rcc.tmp.171 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 7
  %rcc.tmp.172 = load i32, ptr %rcc.tmp.170
  store i32 %rcc.tmp.172, ptr %rcc.tmp.171
  %rcc.tmp.174 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 8
  %rcc.tmp.175 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 8
  %rcc.tmp.176 = load i32, ptr %rcc.tmp.174
  store i32 %rcc.tmp.176, ptr %rcc.tmp.175
  %rcc.tmp.178 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 9
  %rcc.tmp.179 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 9
  %rcc.tmp.180 = load i32, ptr %rcc.tmp.178
  store i32 %rcc.tmp.180, ptr %rcc.tmp.179
  %rcc.tmp.182 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 10
  %rcc.tmp.183 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 10
  %rcc.tmp.184 = load i32, ptr %rcc.tmp.182
  store i32 %rcc.tmp.184, ptr %rcc.tmp.183
  %rcc.tmp.186 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 11
  %rcc.tmp.187 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 11
  %rcc.tmp.188 = load i32, ptr %rcc.tmp.186
  store i32 %rcc.tmp.188, ptr %rcc.tmp.187
  %rcc.tmp.190 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 12
  %rcc.tmp.191 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 12
  %rcc.tmp.192 = load i32, ptr %rcc.tmp.190
  store i32 %rcc.tmp.192, ptr %rcc.tmp.191
  %rcc.tmp.194 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 13
  %rcc.tmp.195 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 13
  %rcc.tmp.196 = load i32, ptr %rcc.tmp.194
  store i32 %rcc.tmp.196, ptr %rcc.tmp.195
  %rcc.tmp.198 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 14
  %rcc.tmp.199 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 14
  %rcc.tmp.200 = load i32, ptr %rcc.tmp.198
  store i32 %rcc.tmp.200, ptr %rcc.tmp.199
  %rcc.tmp.202 = getelementptr [16 x i32], ptr %rcc.tmp.140, i32 0, i32 15
  %rcc.tmp.203 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 15
  %rcc.tmp.204 = load i32, ptr %rcc.tmp.202
  store i32 %rcc.tmp.204, ptr %rcc.tmp.203
  %rcc.tmp.206 = getelementptr %Chromosome, ptr %rcc.tmp.139, i32 0, i32 1
  %rcc.tmp.207 = getelementptr %Chromosome, ptr %rcc.tmp.136, i32 0, i32 1
  %rcc.tmp.208 = load i32, ptr %rcc.tmp.206
  store i32 %rcc.tmp.208, ptr %rcc.tmp.207
  %rcc.tmp.210 = load i32, ptr %i.2
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 1
  store i32 %rcc.tmp.211, ptr %i.2
  br label %while.cond.3
while.end.3:
  %rcc.tmp.214 = load i32, ptr %generation
  %rcc.tmp.215 = add i32 %rcc.tmp.214, 1
  store i32 %rcc.tmp.215, ptr %generation
  br label %while.cond
while.end:
  call void @evaluate_population.([64 x %Chromosome]* %population)
  %rcc.tmp.219 = sub i32 0, 99999999
  store i32 %rcc.tmp.219, ptr %best_fitness
  store i32 0, ptr %i.3
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.223 = load i32, ptr %i.3
  %rcc.tmp.224 = icmp slt i32 %rcc.tmp.223, 64
  br i1 %rcc.tmp.224, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.227 = load i32, ptr %i.3
  %rcc.tmp.228 = add i32 %rcc.tmp.227, 0
  %rcc.tmp.229 = getelementptr [64 x %Chromosome], ptr %population, i32 0, i32 %rcc.tmp.228
  %rcc.tmp.230 = getelementptr %Chromosome, ptr %rcc.tmp.229, i32 0, i32 1
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.230
  %rcc.tmp.232 = load i32, ptr %best_fitness
  %rcc.tmp.233 = icmp sgt i32 %rcc.tmp.231, %rcc.tmp.232
  br i1 %rcc.tmp.233, label %if.then, label %if.else
if.then:
  %rcc.tmp.235 = load i32, ptr %i.3
  %rcc.tmp.236 = add i32 %rcc.tmp.235, 0
  %rcc.tmp.237 = getelementptr [64 x %Chromosome], ptr %population, i32 0, i32 %rcc.tmp.236
  %rcc.tmp.238 = getelementptr %Chromosome, ptr %rcc.tmp.237, i32 0, i32 1
  %rcc.tmp.239 = load i32, ptr %rcc.tmp.238
  store i32 %rcc.tmp.239, ptr %best_fitness
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.243 = load i32, ptr %i.3
  %rcc.tmp.244 = add i32 %rcc.tmp.243, 1
  store i32 %rcc.tmp.244, ptr %i.3
  br label %while.cond.4
while.end.4:
  %rcc.tmp.247 = load i32, ptr %best_fitness
  call void @printlnInt.(i32 %rcc.tmp.247)
  call void @exit.(i32 0)
  ret void
}
