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
%Food = type {i32, i32}
%SegT = type {i32, i32, i32, i32, %Food}
%Node = type {[129 x i32], i32, i32, [10 x i32], i32, i32}
define void @Food.better.(%Food* %self.tmp, %Food* %other.tmp) {
entry:
  %self..tmp = alloca %Food* 
  %other..tmp = alloca %Food* 
  store %Food* %self.tmp, ptr %self..tmp
  store %Food* %other.tmp, ptr %other..tmp
  %rcc.tmp.3 = load %Food*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %Food, ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load %Food*, ptr %other..tmp
  %rcc.tmp.7 = getelementptr %Food, ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load %Food*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %Food, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = load %Food*, ptr %other..tmp
  %rcc.tmp.15 = getelementptr %Food, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp sge i32 %rcc.tmp.13, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.19 = load %Food*, ptr %self..tmp
  %rcc.tmp.20 = getelementptr %Food, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load %Food*, ptr %other..tmp
  %rcc.tmp.22 = getelementptr %Food, ptr %rcc.tmp.21, i32 0, i32 0
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %rcc.tmp.20
  %rcc.tmp.25 = load %Food*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %Food, ptr %rcc.tmp.25, i32 0, i32 1
  %rcc.tmp.27 = load %Food*, ptr %other..tmp
  %rcc.tmp.28 = getelementptr %Food, ptr %rcc.tmp.27, i32 0, i32 1
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  store i32 %rcc.tmp.29, ptr %rcc.tmp.26
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.34 = load %Food*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %Food, ptr %rcc.tmp.34, i32 0, i32 0
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load %Food*, ptr %other..tmp
  %rcc.tmp.38 = getelementptr %Food, ptr %rcc.tmp.37, i32 0, i32 0
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp sgt i32 %rcc.tmp.36, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.43 = load %Food*, ptr %self..tmp
  %rcc.tmp.44 = getelementptr %Food, ptr %rcc.tmp.43, i32 0, i32 0
  %rcc.tmp.45 = load %Food*, ptr %other..tmp
  %rcc.tmp.46 = getelementptr %Food, ptr %rcc.tmp.45, i32 0, i32 0
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %rcc.tmp.44
  %rcc.tmp.49 = load %Food*, ptr %self..tmp
  %rcc.tmp.50 = getelementptr %Food, ptr %rcc.tmp.49, i32 0, i32 1
  %rcc.tmp.51 = load %Food*, ptr %other..tmp
  %rcc.tmp.52 = getelementptr %Food, ptr %rcc.tmp.51, i32 0, i32 1
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %rcc.tmp.50
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  ret void
}
define void @SegT.lc_val.(%Food* sret(%Food) %ret.slot, %SegT* %self.tmp, [512 x %SegT]* %seg_pool.tmp) {
entry:
  %self..tmp = alloca %SegT* 
  %seg_pool..tmp = alloca [512 x %SegT]* 
  store %SegT* %self.tmp, ptr %self..tmp
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  %rcc.tmp.3 = load %SegT*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %SegT, ptr %rcc.tmp.3, i32 0, i32 2
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.7 = getelementptr [512 x %SegT], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = getelementptr %SegT, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = getelementptr %Food, ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = getelementptr %Food, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr %Food, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.14 = getelementptr %Food, ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  ret void
}
define void @SegT.rc_val.(%Food* sret(%Food) %ret.slot, %SegT* %self.tmp, [512 x %SegT]* %seg_pool.tmp) {
entry:
  %self..tmp = alloca %SegT* 
  %seg_pool..tmp = alloca [512 x %SegT]* 
  store %SegT* %self.tmp, ptr %self..tmp
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  %rcc.tmp.3 = load %SegT*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %SegT, ptr %rcc.tmp.3, i32 0, i32 3
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.7 = getelementptr [512 x %SegT], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = getelementptr %SegT, ptr %rcc.tmp.7, i32 0, i32 4
  %rcc.tmp.9 = getelementptr %Food, ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = getelementptr %Food, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = getelementptr %Food, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.14 = getelementptr %Food, ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  ret void
}
define void @Node.push.(%Node* %self.tmp, i32 %to.tmp) {
entry:
  %self..tmp = alloca %Node* 
  %to..tmp = alloca i32 
  store %Node* %self.tmp, ptr %self..tmp
  store i32 %to.tmp, ptr %to..tmp
  %rcc.tmp.3 = load %Node*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %Node, ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load %Node*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %Node, ptr %rcc.tmp.5, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [129 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %to..tmp
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = load %Node*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %Node, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.12
  ret void
}
define void @Node.clear.(%Node* %self.tmp) {
entry:
  %self..tmp = alloca %Node* 
  store %Node* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %Node*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %Node, ptr %rcc.tmp.2, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.3
  ret void
}
define i32 @new_segt.([512 x %SegT]* %seg_pool.tmp, i32* %seg_cnt.tmp, i32 %l.tmp, i32 %r.tmp, %Food* %val.tmp) {
entry:
  %seg_pool..tmp = alloca [512 x %SegT]* 
  %seg_cnt..tmp = alloca i32* 
  %l..tmp = alloca i32 
  %r..tmp = alloca i32 
  %val..local = alloca %Food 
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  store i32* %seg_cnt.tmp, ptr %seg_cnt..tmp
  store i32 %l.tmp, ptr %l..tmp
  store i32 %r.tmp, ptr %r..tmp
  %rcc.tmp.5 = getelementptr %Food, ptr %val.tmp, i32 0, i32 0
  %rcc.tmp.6 = getelementptr %Food, ptr %val..local, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.7, ptr %rcc.tmp.6
  %rcc.tmp.9 = getelementptr %Food, ptr %val.tmp, i32 0, i32 1
  %rcc.tmp.10 = getelementptr %Food, ptr %val..local, i32 0, i32 1
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.11, ptr %rcc.tmp.10
  %rcc.tmp.13 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %rcc.tmp.13
  %rcc.tmp.17 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.20 = getelementptr [512 x %SegT], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = getelementptr %SegT, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %l..tmp
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = getelementptr %SegT, ptr %rcc.tmp.20, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %r..tmp
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = getelementptr %SegT, ptr %rcc.tmp.20, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %SegT, ptr %rcc.tmp.20, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr %SegT, ptr %rcc.tmp.20, i32 0, i32 4
  %rcc.tmp.32 = getelementptr %Food, ptr %val..local, i32 0, i32 0
  %rcc.tmp.33 = getelementptr %Food, ptr %rcc.tmp.31, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = getelementptr %Food, ptr %val..local, i32 0, i32 1
  %rcc.tmp.37 = getelementptr %Food, ptr %rcc.tmp.31, i32 0, i32 1
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.36
  store i32 %rcc.tmp.38, ptr %rcc.tmp.37
  %rcc.tmp.40 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  ret i32 %rcc.tmp.41
}
define i32 @build.([512 x %SegT]* %seg_pool.tmp, i32* %seg_cnt.tmp, i32 %l.tmp, i32 %r.tmp) {
entry:
  %seg_pool..tmp = alloca [512 x %SegT]* 
  %seg_cnt..tmp = alloca i32* 
  %l..tmp = alloca i32 
  %r..tmp = alloca i32 
  %rcc.tmp.19 = alloca %Food 
  %rcc.tmp.32 = alloca %Food 
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  store i32* %seg_cnt.tmp, ptr %seg_cnt..tmp
  store i32 %l.tmp, ptr %l..tmp
  store i32 %r.tmp, ptr %r..tmp
  %rcc.tmp.5 = load i32, ptr %l..tmp
  %rcc.tmp.6 = load i32, ptr %r..tmp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %l..tmp
  %rcc.tmp.12 = load i32, ptr %r..tmp
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.15 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.16 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.17 = load i32, ptr %l..tmp
  %rcc.tmp.18 = load i32, ptr %r..tmp
  %rcc.tmp.20 = getelementptr %Food, ptr %rcc.tmp.19, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr %Food, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %l..tmp
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = call i32 @new_segt.([512 x %SegT]* %rcc.tmp.15, i32* %rcc.tmp.16, i32 %rcc.tmp.17, i32 %rcc.tmp.18, %Food* %rcc.tmp.19)
  ret i32 %rcc.tmp.25
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.28 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.29 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.30 = load i32, ptr %l..tmp
  %rcc.tmp.31 = load i32, ptr %r..tmp
  %rcc.tmp.33 = getelementptr %Food, ptr %rcc.tmp.32, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %Food, ptr %rcc.tmp.32, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = call i32 @new_segt.([512 x %SegT]* %rcc.tmp.28, i32* %rcc.tmp.29, i32 %rcc.tmp.30, i32 %rcc.tmp.31, %Food* %rcc.tmp.32)
  ret i32 %rcc.tmp.37
}
define void @update.([512 x %SegT]* %seg_pool.tmp, i32* %seg_cnt.tmp, i32 %idx.tmp, i32 %pos.tmp, i32 %delta.tmp) {
entry:
  %seg_pool..tmp = alloca [512 x %SegT]* 
  %seg_cnt..tmp = alloca i32* 
  %idx..tmp = alloca i32 
  %pos..tmp = alloca i32 
  %delta..tmp = alloca i32 
  %l = alloca i32 
  %r = alloca i32 
  %mid = alloca i32 
  %res = alloca %Food 
  %sret = alloca %Food 
  %sret.2 = alloca %Food 
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  store i32* %seg_cnt.tmp, ptr %seg_cnt..tmp
  store i32 %idx.tmp, ptr %idx..tmp
  store i32 %pos.tmp, ptr %pos..tmp
  store i32 %delta.tmp, ptr %delta..tmp
  %rcc.tmp.6 = load i32, ptr %idx..tmp
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 0
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %idx..tmp
  %rcc.tmp.12 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.13 = getelementptr [512 x %SegT], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = getelementptr %SegT, ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %l
  %rcc.tmp.17 = load i32, ptr %idx..tmp
  %rcc.tmp.18 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.19 = getelementptr [512 x %SegT], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = getelementptr %SegT, ptr %rcc.tmp.19, i32 0, i32 1
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %r
  %rcc.tmp.23 = load i32, ptr %pos..tmp
  %rcc.tmp.24 = load i32, ptr %l
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.27 = load i32, ptr %pos..tmp
  %rcc.tmp.28 = load i32, ptr %r
  %rcc.tmp.29 = icmp sgt i32 %rcc.tmp.27, %rcc.tmp.28
  br label %sc.merge
sc.merge:
  %rcc.tmp.31 = phi i1 [1, %if.merge], [%rcc.tmp.29, %or.rhs]
  br i1 %rcc.tmp.31, label %if.then.2, label %if.else.2
if.then.2:
  ret void
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.35 = load i32, ptr %l
  %rcc.tmp.36 = load i32, ptr %r
  %rcc.tmp.37 = icmp eq i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.39 = load i32, ptr %idx..tmp
  %rcc.tmp.40 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.41 = getelementptr [512 x %SegT], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = getelementptr %SegT, ptr %rcc.tmp.41, i32 0, i32 4
  %rcc.tmp.43 = getelementptr %Food, ptr %rcc.tmp.42, i32 0, i32 0
  %rcc.tmp.44 = load i32, ptr %delta..tmp
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.46 = add i32 %rcc.tmp.45, %rcc.tmp.44
  store i32 %rcc.tmp.46, ptr %rcc.tmp.43
  ret void
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.50 = load i32, ptr %l
  %rcc.tmp.51 = load i32, ptr %r
  %rcc.tmp.52 = add i32 %rcc.tmp.50, %rcc.tmp.51
  %rcc.tmp.53 = sdiv i32 %rcc.tmp.52, 2
  store i32 %rcc.tmp.53, ptr %mid
  %rcc.tmp.55 = load i32, ptr %pos..tmp
  %rcc.tmp.56 = load i32, ptr %mid
  %rcc.tmp.57 = icmp sle i32 %rcc.tmp.55, %rcc.tmp.56
  br i1 %rcc.tmp.57, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.59 = load i32, ptr %idx..tmp
  %rcc.tmp.60 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.61 = getelementptr [512 x %SegT], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = getelementptr %SegT, ptr %rcc.tmp.61, i32 0, i32 2
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 0
  br i1 %rcc.tmp.64, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.66 = load i32, ptr %idx..tmp
  %rcc.tmp.67 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.68 = getelementptr [512 x %SegT], ptr %rcc.tmp.67, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.69 = getelementptr %SegT, ptr %rcc.tmp.68, i32 0, i32 2
  %rcc.tmp.70 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.71 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.72 = load i32, ptr %l
  %rcc.tmp.73 = load i32, ptr %mid
  %rcc.tmp.74 = call i32 @build.([512 x %SegT]* %rcc.tmp.70, i32* %rcc.tmp.71, i32 %rcc.tmp.72, i32 %rcc.tmp.73)
  store i32 %rcc.tmp.74, ptr %rcc.tmp.69
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.78 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.79 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.80 = load i32, ptr %idx..tmp
  %rcc.tmp.81 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.82 = getelementptr [512 x %SegT], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.83 = getelementptr %SegT, ptr %rcc.tmp.82, i32 0, i32 2
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %pos..tmp
  %rcc.tmp.86 = load i32, ptr %delta..tmp
  call void @update.([512 x %SegT]* %rcc.tmp.78, i32* %rcc.tmp.79, i32 %rcc.tmp.84, i32 %rcc.tmp.85, i32 %rcc.tmp.86)
  br label %if.merge.4
if.else.4:
  %rcc.tmp.89 = load i32, ptr %idx..tmp
  %rcc.tmp.90 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.91 = getelementptr [512 x %SegT], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.92 = getelementptr %SegT, ptr %rcc.tmp.91, i32 0, i32 3
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.93, 0
  br i1 %rcc.tmp.94, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.96 = load i32, ptr %idx..tmp
  %rcc.tmp.97 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.98 = getelementptr [512 x %SegT], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.96
  %rcc.tmp.99 = getelementptr %SegT, ptr %rcc.tmp.98, i32 0, i32 3
  %rcc.tmp.100 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.101 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.102 = load i32, ptr %mid
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 1
  %rcc.tmp.104 = load i32, ptr %r
  %rcc.tmp.105 = call i32 @build.([512 x %SegT]* %rcc.tmp.100, i32* %rcc.tmp.101, i32 %rcc.tmp.103, i32 %rcc.tmp.104)
  store i32 %rcc.tmp.105, ptr %rcc.tmp.99
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.109 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.110 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.111 = load i32, ptr %idx..tmp
  %rcc.tmp.112 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.113 = getelementptr [512 x %SegT], ptr %rcc.tmp.112, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.114 = getelementptr %SegT, ptr %rcc.tmp.113, i32 0, i32 3
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %pos..tmp
  %rcc.tmp.117 = load i32, ptr %delta..tmp
  call void @update.([512 x %SegT]* %rcc.tmp.109, i32* %rcc.tmp.110, i32 %rcc.tmp.115, i32 %rcc.tmp.116, i32 %rcc.tmp.117)
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.120 = getelementptr %Food, ptr %res, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.120
  %rcc.tmp.122 = getelementptr %Food, ptr %res, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %idx..tmp
  %rcc.tmp.125 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.126 = getelementptr [512 x %SegT], ptr %rcc.tmp.125, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.127 = getelementptr %SegT, ptr %rcc.tmp.126, i32 0, i32 2
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  %rcc.tmp.129 = icmp ne i32 %rcc.tmp.128, 0
  br i1 %rcc.tmp.129, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.131 = load i32, ptr %idx..tmp
  %rcc.tmp.132 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.133 = getelementptr [512 x %SegT], ptr %rcc.tmp.132, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.134 = load [512 x %SegT]*, ptr %seg_pool..tmp
  call void @SegT.lc_val.(%Food* %sret, %SegT* %rcc.tmp.133, [512 x %SegT]* %rcc.tmp.134)
  call void @Food.better.(%Food* %res, %Food* %sret)
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.139 = load i32, ptr %idx..tmp
  %rcc.tmp.140 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.141 = getelementptr [512 x %SegT], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.139
  %rcc.tmp.142 = getelementptr %SegT, ptr %rcc.tmp.141, i32 0, i32 3
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.142
  %rcc.tmp.144 = icmp ne i32 %rcc.tmp.143, 0
  br i1 %rcc.tmp.144, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.146 = load i32, ptr %idx..tmp
  %rcc.tmp.147 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.148 = getelementptr [512 x %SegT], ptr %rcc.tmp.147, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.149 = load [512 x %SegT]*, ptr %seg_pool..tmp
  call void @SegT.rc_val.(%Food* %sret.2, %SegT* %rcc.tmp.148, [512 x %SegT]* %rcc.tmp.149)
  call void @Food.better.(%Food* %res, %Food* %sret.2)
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.154 = load i32, ptr %idx..tmp
  %rcc.tmp.155 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.156 = getelementptr [512 x %SegT], ptr %rcc.tmp.155, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.157 = getelementptr %SegT, ptr %rcc.tmp.156, i32 0, i32 4
  %rcc.tmp.158 = getelementptr %Food, ptr %res, i32 0, i32 0
  %rcc.tmp.159 = getelementptr %Food, ptr %rcc.tmp.157, i32 0, i32 0
  %rcc.tmp.160 = load i32, ptr %rcc.tmp.158
  store i32 %rcc.tmp.160, ptr %rcc.tmp.159
  %rcc.tmp.162 = getelementptr %Food, ptr %res, i32 0, i32 1
  %rcc.tmp.163 = getelementptr %Food, ptr %rcc.tmp.157, i32 0, i32 1
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.162
  store i32 %rcc.tmp.164, ptr %rcc.tmp.163
  ret void
}
define i32 @merge.([512 x %SegT]* %seg_pool.tmp, i32* %seg_cnt.tmp, i32 %u.tmp, i32 %v.tmp) {
entry:
  %seg_pool..tmp = alloca [512 x %SegT]* 
  %seg_cnt..tmp = alloca i32* 
  %u..tmp = alloca i32 
  %v..tmp = alloca i32 
  %res = alloca %Food 
  %sret = alloca %Food 
  %sret.2 = alloca %Food 
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  store i32* %seg_cnt.tmp, ptr %seg_cnt..tmp
  store i32 %u.tmp, ptr %u..tmp
  store i32 %v.tmp, ptr %v..tmp
  %rcc.tmp.5 = load i32, ptr %u..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32, ptr %v..tmp
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32, ptr %v..tmp
  %rcc.tmp.12 = icmp eq i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.14 = load i32, ptr %u..tmp
  ret i32 %rcc.tmp.14
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.17 = load i32, ptr %u..tmp
  %rcc.tmp.18 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.19 = getelementptr [512 x %SegT], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = getelementptr %SegT, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %u..tmp
  %rcc.tmp.23 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.24 = getelementptr [512 x %SegT], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = getelementptr %SegT, ptr %rcc.tmp.24, i32 0, i32 1
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.21, %rcc.tmp.26
  br i1 %rcc.tmp.27, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.29 = load i32, ptr %u..tmp
  %rcc.tmp.30 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.31 = getelementptr [512 x %SegT], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = getelementptr %SegT, ptr %rcc.tmp.31, i32 0, i32 4
  %rcc.tmp.33 = getelementptr %Food, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %v..tmp
  %rcc.tmp.35 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.36 = getelementptr [512 x %SegT], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = getelementptr %SegT, ptr %rcc.tmp.36, i32 0, i32 4
  %rcc.tmp.38 = getelementptr %Food, ptr %rcc.tmp.37, i32 0, i32 0
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.41 = add i32 %rcc.tmp.40, %rcc.tmp.39
  store i32 %rcc.tmp.41, ptr %rcc.tmp.33
  %rcc.tmp.43 = load i32, ptr %u..tmp
  ret i32 %rcc.tmp.43
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.46 = load i32, ptr %u..tmp
  %rcc.tmp.47 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.48 = getelementptr [512 x %SegT], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = getelementptr %SegT, ptr %rcc.tmp.48, i32 0, i32 2
  %rcc.tmp.50 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.51 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.52 = load i32, ptr %u..tmp
  %rcc.tmp.53 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.54 = getelementptr [512 x %SegT], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = getelementptr %SegT, ptr %rcc.tmp.54, i32 0, i32 2
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %v..tmp
  %rcc.tmp.58 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.59 = getelementptr [512 x %SegT], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = getelementptr %SegT, ptr %rcc.tmp.59, i32 0, i32 2
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = call i32 @merge.([512 x %SegT]* %rcc.tmp.50, i32* %rcc.tmp.51, i32 %rcc.tmp.56, i32 %rcc.tmp.61)
  store i32 %rcc.tmp.62, ptr %rcc.tmp.49
  %rcc.tmp.64 = load i32, ptr %u..tmp
  %rcc.tmp.65 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.66 = getelementptr [512 x %SegT], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.67 = getelementptr %SegT, ptr %rcc.tmp.66, i32 0, i32 3
  %rcc.tmp.68 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.69 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.70 = load i32, ptr %u..tmp
  %rcc.tmp.71 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.72 = getelementptr [512 x %SegT], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = getelementptr %SegT, ptr %rcc.tmp.72, i32 0, i32 3
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %v..tmp
  %rcc.tmp.76 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.77 = getelementptr [512 x %SegT], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = getelementptr %SegT, ptr %rcc.tmp.77, i32 0, i32 3
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = call i32 @merge.([512 x %SegT]* %rcc.tmp.68, i32* %rcc.tmp.69, i32 %rcc.tmp.74, i32 %rcc.tmp.79)
  store i32 %rcc.tmp.80, ptr %rcc.tmp.67
  %rcc.tmp.82 = getelementptr %Food, ptr %res, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr %Food, ptr %res, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = load i32, ptr %u..tmp
  %rcc.tmp.87 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.88 = getelementptr [512 x %SegT], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.86
  %rcc.tmp.89 = getelementptr %SegT, ptr %rcc.tmp.88, i32 0, i32 2
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = icmp ne i32 %rcc.tmp.90, 0
  br i1 %rcc.tmp.91, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.93 = load i32, ptr %u..tmp
  %rcc.tmp.94 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.95 = getelementptr [512 x %SegT], ptr %rcc.tmp.94, i32 0, i32 %rcc.tmp.93
  %rcc.tmp.96 = load [512 x %SegT]*, ptr %seg_pool..tmp
  call void @SegT.lc_val.(%Food* %sret, %SegT* %rcc.tmp.95, [512 x %SegT]* %rcc.tmp.96)
  call void @Food.better.(%Food* %res, %Food* %sret)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.101 = load i32, ptr %u..tmp
  %rcc.tmp.102 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.103 = getelementptr [512 x %SegT], ptr %rcc.tmp.102, i32 0, i32 %rcc.tmp.101
  %rcc.tmp.104 = getelementptr %SegT, ptr %rcc.tmp.103, i32 0, i32 3
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.106 = icmp ne i32 %rcc.tmp.105, 0
  br i1 %rcc.tmp.106, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.108 = load i32, ptr %u..tmp
  %rcc.tmp.109 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.110 = getelementptr [512 x %SegT], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.111 = load [512 x %SegT]*, ptr %seg_pool..tmp
  call void @SegT.rc_val.(%Food* %sret.2, %SegT* %rcc.tmp.110, [512 x %SegT]* %rcc.tmp.111)
  call void @Food.better.(%Food* %res, %Food* %sret.2)
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.116 = load i32, ptr %u..tmp
  %rcc.tmp.117 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.118 = getelementptr [512 x %SegT], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.119 = getelementptr %SegT, ptr %rcc.tmp.118, i32 0, i32 4
  %rcc.tmp.120 = getelementptr %Food, ptr %res, i32 0, i32 0
  %rcc.tmp.121 = getelementptr %Food, ptr %rcc.tmp.119, i32 0, i32 0
  %rcc.tmp.122 = load i32, ptr %rcc.tmp.120
  store i32 %rcc.tmp.122, ptr %rcc.tmp.121
  %rcc.tmp.124 = getelementptr %Food, ptr %res, i32 0, i32 1
  %rcc.tmp.125 = getelementptr %Food, ptr %rcc.tmp.119, i32 0, i32 1
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.124
  store i32 %rcc.tmp.126, ptr %rcc.tmp.125
  %rcc.tmp.128 = load i32, ptr %u..tmp
  ret i32 %rcc.tmp.128
}
define void @prepare.([129 x %Node]* %node_pool.tmp, i32 %v.tmp, i32 %f.tmp) {
entry:
  %node_pool..tmp = alloca [129 x %Node]* 
  %v..tmp = alloca i32 
  %f..tmp = alloca i32 
  %i = alloca i32 
  %ff = alloca i32 
  %to = alloca i32 
  store [129 x %Node]* %node_pool.tmp, ptr %node_pool..tmp
  store i32 %v.tmp, ptr %v..tmp
  store i32 %f.tmp, ptr %f..tmp
  %rcc.tmp.4 = load i32, ptr %v..tmp
  %rcc.tmp.5 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.6 = getelementptr [129 x %Node], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.4
  %rcc.tmp.7 = getelementptr %Node, ptr %rcc.tmp.6, i32 0, i32 3
  %rcc.tmp.8 = getelementptr [10 x i32], ptr %rcc.tmp.7, i32 0, i32 0
  %rcc.tmp.9 = load i32, ptr %f..tmp
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = load i32, ptr %v..tmp
  %rcc.tmp.12 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.13 = getelementptr [129 x %Node], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = getelementptr %Node, ptr %rcc.tmp.13, i32 0, i32 2
  %rcc.tmp.15 = load i32, ptr %f..tmp
  %rcc.tmp.16 = icmp eq i32 %rcc.tmp.15, 0
  br i1 %rcc.tmp.16, label %if.then, label %if.else
if.then:
  br label %if.merge
if.else:
  %rcc.tmp.19 = load i32, ptr %f..tmp
  %rcc.tmp.20 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.21 = getelementptr [129 x %Node], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = getelementptr %Node, ptr %rcc.tmp.21, i32 0, i32 2
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  br label %if.merge
if.merge:
  %rcc.tmp.26 = phi i32 [1, %if.then], [%rcc.tmp.24, %if.else]
  store i32 %rcc.tmp.26, ptr %rcc.tmp.14
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = icmp sle i32 %rcc.tmp.30, 9
  br i1 %rcc.tmp.31, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.34 = load i32, ptr %v..tmp
  %rcc.tmp.35 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.36 = getelementptr [129 x %Node], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.37 = getelementptr %Node, ptr %rcc.tmp.36, i32 0, i32 3
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = sub i32 %rcc.tmp.38, 1
  %rcc.tmp.40 = getelementptr [10 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %ff
  %rcc.tmp.43 = load i32, ptr %ff
  %rcc.tmp.44 = icmp ne i32 %rcc.tmp.43, 0
  br i1 %rcc.tmp.44, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.46 = load i32, ptr %v..tmp
  %rcc.tmp.47 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.48 = getelementptr [129 x %Node], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  %rcc.tmp.49 = getelementptr %Node, ptr %rcc.tmp.48, i32 0, i32 3
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = getelementptr [10 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.50
  %rcc.tmp.52 = load i32, ptr %ff
  %rcc.tmp.53 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.54 = getelementptr [129 x %Node], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.55 = getelementptr %Node, ptr %rcc.tmp.54, i32 0, i32 3
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = sub i32 %rcc.tmp.56, 1
  %rcc.tmp.58 = getelementptr [10 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  store i32 %rcc.tmp.59, ptr %rcc.tmp.51
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = load i32, ptr %v..tmp
  %rcc.tmp.71 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.72 = getelementptr [129 x %Node], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = getelementptr %Node, ptr %rcc.tmp.72, i32 0, i32 1
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = icmp slt i32 %rcc.tmp.69, %rcc.tmp.74
  br i1 %rcc.tmp.75, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.78 = load i32, ptr %v..tmp
  %rcc.tmp.79 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.80 = getelementptr [129 x %Node], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = getelementptr %Node, ptr %rcc.tmp.80, i32 0, i32 0
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = getelementptr [129 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  store i32 %rcc.tmp.84, ptr %to
  %rcc.tmp.86 = load i32, ptr %i
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %i
  %rcc.tmp.89 = load i32, ptr %to
  %rcc.tmp.90 = load i32, ptr %f..tmp
  %rcc.tmp.91 = icmp eq i32 %rcc.tmp.89, %rcc.tmp.90
  br i1 %rcc.tmp.91, label %if.then.3, label %if.else.3
if.then.3:
  br label %while.cond.2
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.95 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.96 = load i32, ptr %to
  %rcc.tmp.97 = load i32, ptr %v..tmp
  call void @prepare.([129 x %Node]* %rcc.tmp.95, i32 %rcc.tmp.96, i32 %rcc.tmp.97)
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @lca.([129 x %Node]* %node_pool.tmp, i32 %u.tmp, i32 %v.tmp) {
entry:
  %node_pool..tmp = alloca [129 x %Node]* 
  %u..tmp = alloca i32 
  %v..tmp = alloca i32 
  %tmp = alloca i32 
  %i = alloca i32 
  %ff = alloca i32 
  store [129 x %Node]* %node_pool.tmp, ptr %node_pool..tmp
  store i32 %u.tmp, ptr %u..tmp
  store i32 %v.tmp, ptr %v..tmp
  %rcc.tmp.4 = load i32, ptr %u..tmp
  %rcc.tmp.5 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.6 = getelementptr [129 x %Node], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.4
  %rcc.tmp.7 = getelementptr %Node, ptr %rcc.tmp.6, i32 0, i32 2
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %v..tmp
  %rcc.tmp.10 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.11 = getelementptr [129 x %Node], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = getelementptr %Node, ptr %rcc.tmp.11, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load i32, ptr %u..tmp
  store i32 %rcc.tmp.16, ptr %tmp
  %rcc.tmp.18 = load i32, ptr %v..tmp
  store i32 %rcc.tmp.18, ptr %u..tmp
  %rcc.tmp.20 = load i32, ptr %tmp
  store i32 %rcc.tmp.20, ptr %v..tmp
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  store i32 9, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = icmp sge i32 %rcc.tmp.26, 0
  br i1 %rcc.tmp.27, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.30 = load i32, ptr %u..tmp
  %rcc.tmp.31 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.32 = getelementptr [129 x %Node], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.33 = getelementptr %Node, ptr %rcc.tmp.32, i32 0, i32 3
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [10 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %ff
  %rcc.tmp.39 = load i32, ptr %ff
  %rcc.tmp.40 = icmp ne i32 %rcc.tmp.39, 0
  br i1 %rcc.tmp.40, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.42 = load i32, ptr %ff
  %rcc.tmp.43 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.44 = getelementptr [129 x %Node], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = getelementptr %Node, ptr %rcc.tmp.44, i32 0, i32 2
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %v..tmp
  %rcc.tmp.48 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.49 = getelementptr [129 x %Node], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = getelementptr %Node, ptr %rcc.tmp.49, i32 0, i32 2
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = icmp sge i32 %rcc.tmp.46, %rcc.tmp.51
  br label %sc.merge
sc.merge:
  %rcc.tmp.54 = phi i1 [0, %while.body], [%rcc.tmp.52, %and.rhs]
  br i1 %rcc.tmp.54, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.56 = load i32, ptr %ff
  store i32 %rcc.tmp.56, ptr %u..tmp
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = sub i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.64 = load i32, ptr %u..tmp
  %rcc.tmp.65 = load i32, ptr %v..tmp
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.64, %rcc.tmp.65
  br i1 %rcc.tmp.66, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.68 = load i32, ptr %u..tmp
  ret i32 %rcc.tmp.68
if.else.3:
  br label %if.merge.3
if.merge.3:
  store i32 9, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = icmp sge i32 %rcc.tmp.73, 0
  br i1 %rcc.tmp.74, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.77 = load i32, ptr %u..tmp
  %rcc.tmp.78 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.79 = getelementptr [129 x %Node], ptr %rcc.tmp.78, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.80 = getelementptr %Node, ptr %rcc.tmp.79, i32 0, i32 3
  %rcc.tmp.81 = load i32, ptr %i
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 0
  %rcc.tmp.83 = getelementptr [10 x i32], ptr %rcc.tmp.80, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %v..tmp
  %rcc.tmp.86 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.87 = getelementptr [129 x %Node], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = getelementptr %Node, ptr %rcc.tmp.87, i32 0, i32 3
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [10 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = icmp ne i32 %rcc.tmp.84, %rcc.tmp.92
  br i1 %rcc.tmp.93, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.95 = load i32, ptr %u..tmp
  %rcc.tmp.96 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.97 = getelementptr [129 x %Node], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.98 = getelementptr %Node, ptr %rcc.tmp.97, i32 0, i32 3
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [10 x i32], ptr %rcc.tmp.98, i32 0, i32 %rcc.tmp.100
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.102, ptr %u..tmp
  %rcc.tmp.104 = load i32, ptr %v..tmp
  %rcc.tmp.105 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.106 = getelementptr [129 x %Node], ptr %rcc.tmp.105, i32 0, i32 %rcc.tmp.104
  %rcc.tmp.107 = getelementptr %Node, ptr %rcc.tmp.106, i32 0, i32 3
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 0
  %rcc.tmp.110 = getelementptr [10 x i32], ptr %rcc.tmp.107, i32 0, i32 %rcc.tmp.109
  %rcc.tmp.111 = load i32, ptr %rcc.tmp.110
  store i32 %rcc.tmp.111, ptr %v..tmp
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.115 = load i32, ptr %i
  %rcc.tmp.116 = sub i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.119 = load i32, ptr %u..tmp
  %rcc.tmp.120 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.121 = getelementptr [129 x %Node], ptr %rcc.tmp.120, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.122 = getelementptr %Node, ptr %rcc.tmp.121, i32 0, i32 3
  %rcc.tmp.123 = getelementptr [10 x i32], ptr %rcc.tmp.122, i32 0, i32 0
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  ret i32 %rcc.tmp.124
}
define void @dfs.([129 x %Node]* %node_pool.tmp, [512 x %SegT]* %seg_pool.tmp, i32* %seg_cnt.tmp, i32 %v.tmp, i32 %f.tmp) {
entry:
  %node_pool..tmp = alloca [129 x %Node]* 
  %seg_pool..tmp = alloca [512 x %SegT]* 
  %seg_cnt..tmp = alloca i32* 
  %v..tmp = alloca i32 
  %f..tmp = alloca i32 
  %i = alloca i32 
  %to = alloca i32 
  store [129 x %Node]* %node_pool.tmp, ptr %node_pool..tmp
  store [512 x %SegT]* %seg_pool.tmp, ptr %seg_pool..tmp
  store i32* %seg_cnt.tmp, ptr %seg_cnt..tmp
  store i32 %v.tmp, ptr %v..tmp
  store i32 %f.tmp, ptr %f..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = load i32, ptr %v..tmp
  %rcc.tmp.10 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.11 = getelementptr [129 x %Node], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.9
  %rcc.tmp.12 = getelementptr %Node, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.8, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %v..tmp
  %rcc.tmp.18 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.19 = getelementptr [129 x %Node], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = getelementptr %Node, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = getelementptr [129 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  store i32 %rcc.tmp.23, ptr %to
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  %rcc.tmp.28 = load i32, ptr %to
  %rcc.tmp.29 = load i32, ptr %f..tmp
  %rcc.tmp.30 = icmp eq i32 %rcc.tmp.28, %rcc.tmp.29
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  br label %while.cond
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.34 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.35 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.36 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.37 = load i32, ptr %to
  %rcc.tmp.38 = load i32, ptr %v..tmp
  call void @dfs.([129 x %Node]* %rcc.tmp.34, [512 x %SegT]* %rcc.tmp.35, i32* %rcc.tmp.36, i32 %rcc.tmp.37, i32 %rcc.tmp.38)
  br label %while.cond
while.end:
  %rcc.tmp.41 = load i32, ptr %v..tmp
  %rcc.tmp.42 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.43 = getelementptr [129 x %Node], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = getelementptr %Node, ptr %rcc.tmp.43, i32 0, i32 5
  %rcc.tmp.45 = load i32, ptr %v..tmp
  %rcc.tmp.46 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.47 = getelementptr [129 x %Node], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.48 = getelementptr %Node, ptr %rcc.tmp.47, i32 0, i32 4
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.51 = getelementptr [512 x %SegT], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = getelementptr %SegT, ptr %rcc.tmp.51, i32 0, i32 4
  %rcc.tmp.53 = getelementptr %Food, ptr %rcc.tmp.52, i32 0, i32 1
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %rcc.tmp.44
  %rcc.tmp.56 = load i32, ptr %f..tmp
  %rcc.tmp.57 = icmp ne i32 %rcc.tmp.56, 0
  br i1 %rcc.tmp.57, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.59 = load i32, ptr %f..tmp
  %rcc.tmp.60 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.61 = getelementptr [129 x %Node], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = getelementptr %Node, ptr %rcc.tmp.61, i32 0, i32 4
  %rcc.tmp.63 = load [512 x %SegT]*, ptr %seg_pool..tmp
  %rcc.tmp.64 = load i32*, ptr %seg_cnt..tmp
  %rcc.tmp.65 = load i32, ptr %f..tmp
  %rcc.tmp.66 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.67 = getelementptr [129 x %Node], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = getelementptr %Node, ptr %rcc.tmp.67, i32 0, i32 4
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %v..tmp
  %rcc.tmp.71 = load [129 x %Node]*, ptr %node_pool..tmp
  %rcc.tmp.72 = getelementptr [129 x %Node], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.73 = getelementptr %Node, ptr %rcc.tmp.72, i32 0, i32 4
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  %rcc.tmp.75 = call i32 @merge.([512 x %SegT]* %rcc.tmp.63, i32* %rcc.tmp.64, i32 %rcc.tmp.69, i32 %rcc.tmp.74)
  store i32 %rcc.tmp.75, ptr %rcc.tmp.62
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret void
}
define void @main() {
entry:
  %node_pool = alloca [129 x %Node] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %seg_pool = alloca [512 x %SegT] 
  %fill.idx.3 = alloca i32 
  %seg_cnt = alloca i32 
  %n = alloca i32 
  %m = alloca i32 
  %i = alloca i32 
  %a = alloca i32 
  %b = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %z = alloca i32 
  %f = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 129
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 0
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.11 = load i32, ptr %fill.idx.2
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 129
  br i1 %rcc.tmp.12, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = getelementptr [129 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.14
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.17, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.20 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 3
  %rcc.tmp.25 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [10 x i32], ptr %rcc.tmp.24, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr %Node, ptr %rcc.tmp.7, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.49, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.54 = load i32, ptr %fill.idx.3
  %rcc.tmp.55 = icmp slt i32 %rcc.tmp.54, 512
  br i1 %rcc.tmp.55, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.57 = load i32, ptr %fill.idx.3
  %rcc.tmp.58 = getelementptr [512 x %SegT], ptr %seg_pool, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = getelementptr %SegT, ptr %rcc.tmp.58, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.59
  %rcc.tmp.61 = getelementptr %SegT, ptr %rcc.tmp.58, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.61
  %rcc.tmp.63 = getelementptr %SegT, ptr %rcc.tmp.58, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr %SegT, ptr %rcc.tmp.58, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr %SegT, ptr %rcc.tmp.58, i32 0, i32 4
  %rcc.tmp.68 = getelementptr %Food, ptr %rcc.tmp.67, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr %Food, ptr %rcc.tmp.67, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.72, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %seg_cnt
  %rcc.tmp.76 = call i32 @getInt.()
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  store i32 %rcc.tmp.77, ptr %n
  %rcc.tmp.79 = call i32 @getInt.()
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 0
  store i32 %rcc.tmp.80, ptr %m
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = load i32, ptr %n
  %rcc.tmp.86 = icmp sle i32 %rcc.tmp.84, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.89
  call void @Node.clear.(%Node* %rcc.tmp.90)
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = getelementptr %Node, ptr %rcc.tmp.93, i32 0, i32 4
  %rcc.tmp.95 = bitcast i32* %seg_cnt to i32*
  %rcc.tmp.96 = call i32 @build.([512 x %SegT]* %seg_pool, i32* %rcc.tmp.95, i32 1, i32 128)
  store i32 %rcc.tmp.96, ptr %rcc.tmp.94
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = load i32, ptr %n
  %rcc.tmp.106 = sub i32 %rcc.tmp.105, 1
  %rcc.tmp.107 = icmp slt i32 %rcc.tmp.104, %rcc.tmp.106
  br i1 %rcc.tmp.107, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.110 = call i32 @getInt.()
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  store i32 %rcc.tmp.111, ptr %a
  %rcc.tmp.113 = call i32 @getInt.()
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  store i32 %rcc.tmp.114, ptr %b
  %rcc.tmp.116 = load i32, ptr %a
  %rcc.tmp.117 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.118 = load i32, ptr %b
  call void @Node.push.(%Node* %rcc.tmp.117, i32 %rcc.tmp.118)
  %rcc.tmp.120 = load i32, ptr %b
  %rcc.tmp.121 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %a
  call void @Node.push.(%Node* %rcc.tmp.121, i32 %rcc.tmp.122)
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %i
  br label %while.cond.2
while.end.2:
  call void @prepare.([129 x %Node]* %node_pool, i32 1, i32 0)
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = load i32, ptr %m
  %rcc.tmp.133 = icmp slt i32 %rcc.tmp.131, %rcc.tmp.132
  br i1 %rcc.tmp.133, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.136 = call i32 @getInt.()
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 0
  store i32 %rcc.tmp.137, ptr %x
  %rcc.tmp.139 = call i32 @getInt.()
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 0
  store i32 %rcc.tmp.140, ptr %y
  %rcc.tmp.142 = call i32 @getInt.()
  store i32 %rcc.tmp.142, ptr %z
  %rcc.tmp.144 = load i32, ptr %x
  %rcc.tmp.145 = load i32, ptr %y
  %rcc.tmp.146 = call i32 @lca.([129 x %Node]* %node_pool, i32 %rcc.tmp.144, i32 %rcc.tmp.145)
  store i32 %rcc.tmp.146, ptr %f
  %rcc.tmp.148 = bitcast i32* %seg_cnt to i32*
  %rcc.tmp.149 = load i32, ptr %x
  %rcc.tmp.150 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.149
  %rcc.tmp.151 = getelementptr %Node, ptr %rcc.tmp.150, i32 0, i32 4
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %z
  call void @update.([512 x %SegT]* %seg_pool, i32* %rcc.tmp.148, i32 %rcc.tmp.152, i32 %rcc.tmp.153, i32 1)
  %rcc.tmp.155 = bitcast i32* %seg_cnt to i32*
  %rcc.tmp.156 = load i32, ptr %y
  %rcc.tmp.157 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.156
  %rcc.tmp.158 = getelementptr %Node, ptr %rcc.tmp.157, i32 0, i32 4
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %z
  call void @update.([512 x %SegT]* %seg_pool, i32* %rcc.tmp.155, i32 %rcc.tmp.159, i32 %rcc.tmp.160, i32 1)
  %rcc.tmp.162 = bitcast i32* %seg_cnt to i32*
  %rcc.tmp.163 = load i32, ptr %f
  %rcc.tmp.164 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.163
  %rcc.tmp.165 = getelementptr %Node, ptr %rcc.tmp.164, i32 0, i32 4
  %rcc.tmp.166 = load i32, ptr %rcc.tmp.165
  %rcc.tmp.167 = load i32, ptr %z
  %rcc.tmp.168 = sub i32 0, 1
  call void @update.([512 x %SegT]* %seg_pool, i32* %rcc.tmp.162, i32 %rcc.tmp.166, i32 %rcc.tmp.167, i32 %rcc.tmp.168)
  %rcc.tmp.170 = load i32, ptr %f
  %rcc.tmp.171 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.170
  %rcc.tmp.172 = getelementptr %Node, ptr %rcc.tmp.171, i32 0, i32 3
  %rcc.tmp.173 = getelementptr [10 x i32], ptr %rcc.tmp.172, i32 0, i32 0
  %rcc.tmp.174 = load i32, ptr %rcc.tmp.173
  %rcc.tmp.175 = icmp ne i32 %rcc.tmp.174, 0
  br i1 %rcc.tmp.175, label %if.then, label %if.else
if.then:
  %rcc.tmp.177 = bitcast i32* %seg_cnt to i32*
  %rcc.tmp.178 = load i32, ptr %f
  %rcc.tmp.179 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.178
  %rcc.tmp.180 = getelementptr %Node, ptr %rcc.tmp.179, i32 0, i32 3
  %rcc.tmp.181 = getelementptr [10 x i32], ptr %rcc.tmp.180, i32 0, i32 0
  %rcc.tmp.182 = load i32, ptr %rcc.tmp.181
  %rcc.tmp.183 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.182
  %rcc.tmp.184 = getelementptr %Node, ptr %rcc.tmp.183, i32 0, i32 4
  %rcc.tmp.185 = load i32, ptr %rcc.tmp.184
  %rcc.tmp.186 = load i32, ptr %z
  %rcc.tmp.187 = sub i32 0, 1
  call void @update.([512 x %SegT]* %seg_pool, i32* %rcc.tmp.177, i32 %rcc.tmp.185, i32 %rcc.tmp.186, i32 %rcc.tmp.187)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.191 = load i32, ptr %i
  %rcc.tmp.192 = add i32 %rcc.tmp.191, 1
  store i32 %rcc.tmp.192, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.195 = bitcast i32* %seg_cnt to i32*
  call void @dfs.([129 x %Node]* %node_pool, [512 x %SegT]* %seg_pool, i32* %rcc.tmp.195, i32 1, i32 0)
  store i32 1, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.199 = load i32, ptr %i
  %rcc.tmp.200 = load i32, ptr %n
  %rcc.tmp.201 = icmp sle i32 %rcc.tmp.199, %rcc.tmp.200
  br i1 %rcc.tmp.201, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.204 = load i32, ptr %i
  %rcc.tmp.205 = getelementptr [129 x %Node], ptr %node_pool, i32 0, i32 %rcc.tmp.204
  %rcc.tmp.206 = getelementptr %Node, ptr %rcc.tmp.205, i32 0, i32 5
  %rcc.tmp.207 = load i32, ptr %rcc.tmp.206
  call void @printlnInt.(i32 %rcc.tmp.207)
  %rcc.tmp.209 = load i32, ptr %i
  %rcc.tmp.210 = add i32 %rcc.tmp.209, 1
  store i32 %rcc.tmp.210, ptr %i
  br label %while.cond.4
while.end.4:
  call void @exit.(i32 0)
  ret void
}
