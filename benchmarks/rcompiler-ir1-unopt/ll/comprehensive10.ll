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
%Edge = type {i32, i32, i32, i32, i32}
%Graph = type {i32, [2000 x %Edge], i32, [100 x [100 x i32]], [100 x i32], [100 x i32], [100 x i1], [100 x [100 x i32]], [100 x i32], [100 x i32], [100 x i1], [100 x i32], i32, i32, i32, [100 x i32], [100 x i32], i32}
%GraphGenerator = type {i32}
define void @Edge.new.(%Edge* sret(%Edge) %ret.slot, i32 %from.tmp, i32 %to.tmp, i32 %weight.tmp, i32 %capacity.tmp) {
entry:
  %from..tmp = alloca i32 
  %to..tmp = alloca i32 
  %weight..tmp = alloca i32 
  %capacity..tmp = alloca i32 
  store i32 %from.tmp, ptr %from..tmp
  store i32 %to.tmp, ptr %to..tmp
  store i32 %weight.tmp, ptr %weight..tmp
  store i32 %capacity.tmp, ptr %capacity..tmp
  %rcc.tmp.5 = getelementptr %Edge, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %from..tmp
  store i32 %rcc.tmp.6, ptr %rcc.tmp.5
  %rcc.tmp.8 = getelementptr %Edge, ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.9 = load i32, ptr %to..tmp
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = getelementptr %Edge, ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.12 = load i32, ptr %weight..tmp
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  %rcc.tmp.14 = getelementptr %Edge, ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.15 = load i32, ptr %capacity..tmp
  store i32 %rcc.tmp.15, ptr %rcc.tmp.14
  %rcc.tmp.17 = getelementptr %Edge, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.17
  ret void
}
define void @Graph.add_edge.(%Graph* %self.tmp, i32 %from.tmp, i32 %to.tmp, i32 %weight.tmp, i32 %capacity.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %from..tmp = alloca i32 
  %to..tmp = alloca i32 
  %weight..tmp = alloca i32 
  %capacity..tmp = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %from.tmp, ptr %from..tmp
  store i32 %to.tmp, ptr %to..tmp
  store i32 %weight.tmp, ptr %weight..tmp
  store i32 %capacity.tmp, ptr %capacity..tmp
  %rcc.tmp.6 = load %Graph*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %Graph, ptr %rcc.tmp.6, i32 0, i32 2
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp sge i32 %rcc.tmp.8, 2000
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.13 = load %Graph*, ptr %self..tmp
  %rcc.tmp.14 = getelementptr %Graph, ptr %rcc.tmp.13, i32 0, i32 1
  %rcc.tmp.15 = load %Graph*, ptr %self..tmp
  %rcc.tmp.16 = getelementptr %Graph, ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [2000 x %Edge], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %from..tmp
  %rcc.tmp.21 = load i32, ptr %to..tmp
  %rcc.tmp.22 = load i32, ptr %weight..tmp
  %rcc.tmp.23 = load i32, ptr %capacity..tmp
  call void @Edge.new.(%Edge* %rcc.tmp.19, i32 %rcc.tmp.20, i32 %rcc.tmp.21, i32 %rcc.tmp.22, i32 %rcc.tmp.23)
  %rcc.tmp.25 = load %Graph*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %Graph, ptr %rcc.tmp.25, i32 0, i32 4
  %rcc.tmp.27 = load i32, ptr %from..tmp
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [100 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.30, 100
  br i1 %rcc.tmp.31, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.33 = load %Graph*, ptr %self..tmp
  %rcc.tmp.34 = getelementptr %Graph, ptr %rcc.tmp.33, i32 0, i32 3
  %rcc.tmp.35 = load i32, ptr %from..tmp
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load %Graph*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %Graph, ptr %rcc.tmp.38, i32 0, i32 4
  %rcc.tmp.40 = load i32, ptr %from..tmp
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [100 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %to..tmp
  store i32 %rcc.tmp.46, ptr %rcc.tmp.45
  %rcc.tmp.48 = load %Graph*, ptr %self..tmp
  %rcc.tmp.49 = getelementptr %Graph, ptr %rcc.tmp.48, i32 0, i32 4
  %rcc.tmp.50 = load i32, ptr %from..tmp
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 0
  %rcc.tmp.52 = getelementptr [100 x i32], ptr %rcc.tmp.49, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.52
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.52
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.58 = load %Graph*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %Graph, ptr %rcc.tmp.58, i32 0, i32 7
  %rcc.tmp.60 = load i32, ptr %from..tmp
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %to..tmp
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %weight..tmp
  store i32 %rcc.tmp.66, ptr %rcc.tmp.65
  %rcc.tmp.68 = load %Graph*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %Graph, ptr %rcc.tmp.68, i32 0, i32 2
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  store i32 %rcc.tmp.71, ptr %rcc.tmp.69
  ret void
}
define void @Graph.dijkstra.(%Graph* %self.tmp, i32 %source.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %source..tmp = alloca i32 
  %i = alloca i32 
  %processed = alloca i32 
  %min_dist = alloca i32 
  %u = alloca i32 
  %v = alloca i32 
  %edge_idx = alloca i32 
  %edge = alloca %Edge 
  %new_dist = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %source.tmp, ptr %source..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load %Graph*, ptr %self..tmp
  %rcc.tmp.7 = getelementptr %Graph, ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.12 = load %Graph*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %Graph, ptr %rcc.tmp.12, i32 0, i32 5
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  store i32 2147483647, ptr %rcc.tmp.16
  %rcc.tmp.18 = load %Graph*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %Graph, ptr %rcc.tmp.18, i32 0, i32 6
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [100 x i1], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  store i1 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = load %Graph*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %Graph, ptr %rcc.tmp.28, i32 0, i32 5
  %rcc.tmp.30 = load i32, ptr %source..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [100 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.32
  store i32 0, ptr %processed
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.36 = load i32, ptr %processed
  %rcc.tmp.37 = load %Graph*, ptr %self..tmp
  %rcc.tmp.38 = getelementptr %Graph, ptr %rcc.tmp.37, i32 0, i32 0
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  %rcc.tmp.40 = icmp slt i32 %rcc.tmp.36, %rcc.tmp.39
  br i1 %rcc.tmp.40, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 2147483647, ptr %min_dist
  %rcc.tmp.44 = sub i32 0, 1
  store i32 %rcc.tmp.44, ptr %u
  store i32 0, ptr %v
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.48 = load i32, ptr %v
  %rcc.tmp.49 = load %Graph*, ptr %self..tmp
  %rcc.tmp.50 = getelementptr %Graph, ptr %rcc.tmp.49, i32 0, i32 0
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.51
  br i1 %rcc.tmp.52, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.55 = load %Graph*, ptr %self..tmp
  %rcc.tmp.56 = getelementptr %Graph, ptr %rcc.tmp.55, i32 0, i32 6
  %rcc.tmp.57 = load i32, ptr %v
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [100 x i1], ptr %rcc.tmp.56, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i1, ptr %rcc.tmp.59
  %rcc.tmp.61 = xor i1 %rcc.tmp.60, true
  br i1 %rcc.tmp.61, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.63 = load %Graph*, ptr %self..tmp
  %rcc.tmp.64 = getelementptr %Graph, ptr %rcc.tmp.63, i32 0, i32 5
  %rcc.tmp.65 = load i32, ptr %v
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 0
  %rcc.tmp.67 = getelementptr [100 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.66
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %min_dist
  %rcc.tmp.70 = icmp slt i32 %rcc.tmp.68, %rcc.tmp.69
  br label %sc.merge
sc.merge:
  %rcc.tmp.72 = phi i1 [0, %while.body.3], [%rcc.tmp.70, %and.rhs]
  br i1 %rcc.tmp.72, label %if.then, label %if.else
if.then:
  %rcc.tmp.74 = load %Graph*, ptr %self..tmp
  %rcc.tmp.75 = getelementptr %Graph, ptr %rcc.tmp.74, i32 0, i32 5
  %rcc.tmp.76 = load i32, ptr %v
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [100 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  store i32 %rcc.tmp.79, ptr %min_dist
  %rcc.tmp.81 = load i32, ptr %v
  store i32 %rcc.tmp.81, ptr %u
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.85 = load i32, ptr %v
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %v
  br label %while.cond.3
while.end.3:
  %rcc.tmp.89 = load i32, ptr %u
  %rcc.tmp.90 = sub i32 0, 1
  %rcc.tmp.91 = icmp eq i32 %rcc.tmp.89, %rcc.tmp.90
  br i1 %rcc.tmp.91, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.95 = load %Graph*, ptr %self..tmp
  %rcc.tmp.96 = getelementptr %Graph, ptr %rcc.tmp.95, i32 0, i32 6
  %rcc.tmp.97 = load i32, ptr %u
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [100 x i1], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.98
  store i1 1, ptr %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %processed
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %processed
  store i32 0, ptr %edge_idx
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.106 = load i32, ptr %edge_idx
  %rcc.tmp.107 = load %Graph*, ptr %self..tmp
  %rcc.tmp.108 = getelementptr %Graph, ptr %rcc.tmp.107, i32 0, i32 2
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = icmp slt i32 %rcc.tmp.106, %rcc.tmp.109
  br i1 %rcc.tmp.110, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.113 = load %Graph*, ptr %self..tmp
  %rcc.tmp.114 = getelementptr %Graph, ptr %rcc.tmp.113, i32 0, i32 1
  %rcc.tmp.115 = load i32, ptr %edge_idx
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 0
  %rcc.tmp.117 = getelementptr [2000 x %Edge], ptr %rcc.tmp.114, i32 0, i32 %rcc.tmp.116
  %rcc.tmp.118 = getelementptr %Edge, ptr %rcc.tmp.117, i32 0, i32 0
  %rcc.tmp.119 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.118
  store i32 %rcc.tmp.120, ptr %rcc.tmp.119
  %rcc.tmp.122 = getelementptr %Edge, ptr %rcc.tmp.117, i32 0, i32 1
  %rcc.tmp.123 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.122
  store i32 %rcc.tmp.124, ptr %rcc.tmp.123
  %rcc.tmp.126 = getelementptr %Edge, ptr %rcc.tmp.117, i32 0, i32 2
  %rcc.tmp.127 = getelementptr %Edge, ptr %edge, i32 0, i32 2
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.126
  store i32 %rcc.tmp.128, ptr %rcc.tmp.127
  %rcc.tmp.130 = getelementptr %Edge, ptr %rcc.tmp.117, i32 0, i32 3
  %rcc.tmp.131 = getelementptr %Edge, ptr %edge, i32 0, i32 3
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.130
  store i32 %rcc.tmp.132, ptr %rcc.tmp.131
  %rcc.tmp.134 = getelementptr %Edge, ptr %rcc.tmp.117, i32 0, i32 4
  %rcc.tmp.135 = getelementptr %Edge, ptr %edge, i32 0, i32 4
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.134
  store i32 %rcc.tmp.136, ptr %rcc.tmp.135
  %rcc.tmp.138 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.139 = load i32, ptr %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %u
  %rcc.tmp.141 = icmp eq i32 %rcc.tmp.139, %rcc.tmp.140
  br i1 %rcc.tmp.141, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.143 = load %Graph*, ptr %self..tmp
  %rcc.tmp.144 = getelementptr %Graph, ptr %rcc.tmp.143, i32 0, i32 5
  %rcc.tmp.145 = load i32, ptr %u
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [100 x i32], ptr %rcc.tmp.144, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %rcc.tmp.147
  %rcc.tmp.149 = getelementptr %Edge, ptr %edge, i32 0, i32 2
  %rcc.tmp.150 = load i32, ptr %rcc.tmp.149
  %rcc.tmp.151 = add i32 %rcc.tmp.148, %rcc.tmp.150
  store i32 %rcc.tmp.151, ptr %new_dist
  %rcc.tmp.153 = load i32, ptr %new_dist
  %rcc.tmp.154 = load %Graph*, ptr %self..tmp
  %rcc.tmp.155 = getelementptr %Graph, ptr %rcc.tmp.154, i32 0, i32 5
  %rcc.tmp.156 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [100 x i32], ptr %rcc.tmp.155, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %rcc.tmp.159
  %rcc.tmp.161 = icmp slt i32 %rcc.tmp.153, %rcc.tmp.160
  br i1 %rcc.tmp.161, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.163 = load %Graph*, ptr %self..tmp
  %rcc.tmp.164 = getelementptr %Graph, ptr %rcc.tmp.163, i32 0, i32 5
  %rcc.tmp.165 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.166 = load i32, ptr %rcc.tmp.165
  %rcc.tmp.167 = add i32 %rcc.tmp.166, 0
  %rcc.tmp.168 = getelementptr [100 x i32], ptr %rcc.tmp.164, i32 0, i32 %rcc.tmp.167
  %rcc.tmp.169 = load i32, ptr %new_dist
  store i32 %rcc.tmp.169, ptr %rcc.tmp.168
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.175 = load i32, ptr %edge_idx
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 1
  store i32 %rcc.tmp.176, ptr %edge_idx
  br label %while.cond.4
while.end.4:
  br label %while.cond.2
while.end.2:
  ret void
}
define void @Graph.floyd_warshall.(%Graph* %self.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %k = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %via_k = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 0, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %k
  %rcc.tmp.5 = load %Graph*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %Graph, ptr %rcc.tmp.5, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load %Graph*, ptr %self..tmp
  %rcc.tmp.16 = getelementptr %Graph, ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.24 = load i32, ptr %j
  %rcc.tmp.25 = load %Graph*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %Graph, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.28
  br i1 %rcc.tmp.29, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.32 = load %Graph*, ptr %self..tmp
  %rcc.tmp.33 = getelementptr %Graph, ptr %rcc.tmp.32, i32 0, i32 7
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %k
  %rcc.tmp.37 = getelementptr [100 x i32], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = icmp ne i32 %rcc.tmp.38, 2147483647
  br i1 %rcc.tmp.39, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.41 = load %Graph*, ptr %self..tmp
  %rcc.tmp.42 = getelementptr %Graph, ptr %rcc.tmp.41, i32 0, i32 7
  %rcc.tmp.43 = load i32, ptr %k
  %rcc.tmp.44 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %j
  %rcc.tmp.46 = getelementptr [100 x i32], ptr %rcc.tmp.44, i32 0, i32 %rcc.tmp.45
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = icmp ne i32 %rcc.tmp.47, 2147483647
  br label %sc.merge
sc.merge:
  %rcc.tmp.50 = phi i1 [0, %while.body.3], [%rcc.tmp.48, %and.rhs]
  br i1 %rcc.tmp.50, label %if.then, label %if.else
if.then:
  %rcc.tmp.52 = load %Graph*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %Graph, ptr %rcc.tmp.52, i32 0, i32 7
  %rcc.tmp.54 = load i32, ptr %i
  %rcc.tmp.55 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %k
  %rcc.tmp.57 = getelementptr [100 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = load %Graph*, ptr %self..tmp
  %rcc.tmp.60 = getelementptr %Graph, ptr %rcc.tmp.59, i32 0, i32 7
  %rcc.tmp.61 = load i32, ptr %k
  %rcc.tmp.62 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = getelementptr [100 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.64
  %rcc.tmp.66 = add i32 %rcc.tmp.58, %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %via_k
  %rcc.tmp.68 = load i32, ptr %via_k
  %rcc.tmp.69 = load %Graph*, ptr %self..tmp
  %rcc.tmp.70 = getelementptr %Graph, ptr %rcc.tmp.69, i32 0, i32 7
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %j
  %rcc.tmp.74 = getelementptr [100 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.68, %rcc.tmp.75
  br i1 %rcc.tmp.76, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.78 = load %Graph*, ptr %self..tmp
  %rcc.tmp.79 = getelementptr %Graph, ptr %rcc.tmp.78, i32 0, i32 7
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %j
  %rcc.tmp.83 = getelementptr [100 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.82
  %rcc.tmp.84 = load i32, ptr %via_k
  store i32 %rcc.tmp.84, ptr %rcc.tmp.83
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.91, ptr %j
  br label %while.cond.3
while.end.3:
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.98 = load i32, ptr %k
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %k
  br label %while.cond
while.end:
  ret void
}
define void @Graph.tarjan_scc.(%Graph* %self.tmp, i32 %u.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %u..tmp = alloca i32 
  %i = alloca i32 
  %v = alloca i32 
  %w = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %u.tmp, ptr %u..tmp
  %rcc.tmp.3 = load %Graph*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %Graph, ptr %rcc.tmp.3, i32 0, i32 9
  %rcc.tmp.5 = load i32, ptr %u..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [100 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load %Graph*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %Graph, ptr %rcc.tmp.8, i32 0, i32 13
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %rcc.tmp.7
  %rcc.tmp.12 = load %Graph*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %Graph, ptr %rcc.tmp.12, i32 0, i32 8
  %rcc.tmp.14 = load i32, ptr %u..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load %Graph*, ptr %self..tmp
  %rcc.tmp.18 = getelementptr %Graph, ptr %rcc.tmp.17, i32 0, i32 13
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.16
  %rcc.tmp.21 = load %Graph*, ptr %self..tmp
  %rcc.tmp.22 = getelementptr %Graph, ptr %rcc.tmp.21, i32 0, i32 13
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  store i32 %rcc.tmp.24, ptr %rcc.tmp.22
  %rcc.tmp.26 = load %Graph*, ptr %self..tmp
  %rcc.tmp.27 = getelementptr %Graph, ptr %rcc.tmp.26, i32 0, i32 11
  %rcc.tmp.28 = load %Graph*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %Graph, ptr %rcc.tmp.28, i32 0, i32 12
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [100 x i32], ptr %rcc.tmp.27, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %u..tmp
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = load %Graph*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %Graph, ptr %rcc.tmp.35, i32 0, i32 12
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %rcc.tmp.36
  %rcc.tmp.40 = load %Graph*, ptr %self..tmp
  %rcc.tmp.41 = getelementptr %Graph, ptr %rcc.tmp.40, i32 0, i32 10
  %rcc.tmp.42 = load i32, ptr %u..tmp
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [100 x i1], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  store i1 1, ptr %rcc.tmp.44
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = load %Graph*, ptr %self..tmp
  %rcc.tmp.50 = getelementptr %Graph, ptr %rcc.tmp.49, i32 0, i32 4
  %rcc.tmp.51 = load i32, ptr %u..tmp
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = icmp slt i32 %rcc.tmp.48, %rcc.tmp.54
  br i1 %rcc.tmp.55, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.58 = load %Graph*, ptr %self..tmp
  %rcc.tmp.59 = getelementptr %Graph, ptr %rcc.tmp.58, i32 0, i32 3
  %rcc.tmp.60 = load i32, ptr %u..tmp
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [100 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %v
  %rcc.tmp.68 = load %Graph*, ptr %self..tmp
  %rcc.tmp.69 = getelementptr %Graph, ptr %rcc.tmp.68, i32 0, i32 9
  %rcc.tmp.70 = load i32, ptr %v
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [100 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = sub i32 0, 1
  %rcc.tmp.75 = icmp eq i32 %rcc.tmp.73, %rcc.tmp.74
  br i1 %rcc.tmp.75, label %if.then, label %if.else
if.then:
  %rcc.tmp.77 = load %Graph*, ptr %self..tmp
  %rcc.tmp.78 = load i32, ptr %v
  call void @Graph.tarjan_scc.(%Graph* %rcc.tmp.77, i32 %rcc.tmp.78)
  %rcc.tmp.80 = load %Graph*, ptr %self..tmp
  %rcc.tmp.81 = getelementptr %Graph, ptr %rcc.tmp.80, i32 0, i32 8
  %rcc.tmp.82 = load i32, ptr %v
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 0
  %rcc.tmp.84 = getelementptr [100 x i32], ptr %rcc.tmp.81, i32 0, i32 %rcc.tmp.83
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = load %Graph*, ptr %self..tmp
  %rcc.tmp.87 = getelementptr %Graph, ptr %rcc.tmp.86, i32 0, i32 8
  %rcc.tmp.88 = load i32, ptr %u..tmp
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [100 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.85, %rcc.tmp.91
  br i1 %rcc.tmp.92, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.94 = load %Graph*, ptr %self..tmp
  %rcc.tmp.95 = getelementptr %Graph, ptr %rcc.tmp.94, i32 0, i32 8
  %rcc.tmp.96 = load i32, ptr %u..tmp
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 0
  %rcc.tmp.98 = getelementptr [100 x i32], ptr %rcc.tmp.95, i32 0, i32 %rcc.tmp.97
  %rcc.tmp.99 = load %Graph*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %Graph, ptr %rcc.tmp.99, i32 0, i32 8
  %rcc.tmp.101 = load i32, ptr %v
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [100 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.103
  store i32 %rcc.tmp.104, ptr %rcc.tmp.98
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.109 = load %Graph*, ptr %self..tmp
  %rcc.tmp.110 = getelementptr %Graph, ptr %rcc.tmp.109, i32 0, i32 10
  %rcc.tmp.111 = load i32, ptr %v
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [100 x i1], ptr %rcc.tmp.110, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i1, ptr %rcc.tmp.113
  br i1 %rcc.tmp.114, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.116 = load %Graph*, ptr %self..tmp
  %rcc.tmp.117 = getelementptr %Graph, ptr %rcc.tmp.116, i32 0, i32 9
  %rcc.tmp.118 = load i32, ptr %v
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [100 x i32], ptr %rcc.tmp.117, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  %rcc.tmp.122 = load %Graph*, ptr %self..tmp
  %rcc.tmp.123 = getelementptr %Graph, ptr %rcc.tmp.122, i32 0, i32 8
  %rcc.tmp.124 = load i32, ptr %u..tmp
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 0
  %rcc.tmp.126 = getelementptr [100 x i32], ptr %rcc.tmp.123, i32 0, i32 %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = icmp slt i32 %rcc.tmp.121, %rcc.tmp.127
  br i1 %rcc.tmp.128, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.130 = load %Graph*, ptr %self..tmp
  %rcc.tmp.131 = getelementptr %Graph, ptr %rcc.tmp.130, i32 0, i32 8
  %rcc.tmp.132 = load i32, ptr %u..tmp
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 0
  %rcc.tmp.134 = getelementptr [100 x i32], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.133
  %rcc.tmp.135 = load %Graph*, ptr %self..tmp
  %rcc.tmp.136 = getelementptr %Graph, ptr %rcc.tmp.135, i32 0, i32 9
  %rcc.tmp.137 = load i32, ptr %v
  %rcc.tmp.138 = add i32 %rcc.tmp.137, 0
  %rcc.tmp.139 = getelementptr [100 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.138
  %rcc.tmp.140 = load i32, ptr %rcc.tmp.139
  store i32 %rcc.tmp.140, ptr %rcc.tmp.134
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 1
  store i32 %rcc.tmp.148, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.151 = load %Graph*, ptr %self..tmp
  %rcc.tmp.152 = getelementptr %Graph, ptr %rcc.tmp.151, i32 0, i32 8
  %rcc.tmp.153 = load i32, ptr %u..tmp
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = getelementptr [100 x i32], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.155
  %rcc.tmp.157 = load %Graph*, ptr %self..tmp
  %rcc.tmp.158 = getelementptr %Graph, ptr %rcc.tmp.157, i32 0, i32 9
  %rcc.tmp.159 = load i32, ptr %u..tmp
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 0
  %rcc.tmp.161 = getelementptr [100 x i32], ptr %rcc.tmp.158, i32 0, i32 %rcc.tmp.160
  %rcc.tmp.162 = load i32, ptr %rcc.tmp.161
  %rcc.tmp.163 = icmp eq i32 %rcc.tmp.156, %rcc.tmp.162
  br i1 %rcc.tmp.163, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.165 = load %Graph*, ptr %self..tmp
  %rcc.tmp.166 = getelementptr %Graph, ptr %rcc.tmp.165, i32 0, i32 14
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.166
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  store i32 %rcc.tmp.168, ptr %rcc.tmp.166
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.171 = load %Graph*, ptr %self..tmp
  %rcc.tmp.172 = getelementptr %Graph, ptr %rcc.tmp.171, i32 0, i32 12
  %rcc.tmp.173 = load i32, ptr %rcc.tmp.172
  %rcc.tmp.174 = icmp sgt i32 %rcc.tmp.173, 0
  br i1 %rcc.tmp.174, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.177 = load %Graph*, ptr %self..tmp
  %rcc.tmp.178 = getelementptr %Graph, ptr %rcc.tmp.177, i32 0, i32 12
  %rcc.tmp.179 = load i32, ptr %rcc.tmp.178
  %rcc.tmp.180 = sub i32 %rcc.tmp.179, 1
  store i32 %rcc.tmp.180, ptr %rcc.tmp.178
  %rcc.tmp.182 = load %Graph*, ptr %self..tmp
  %rcc.tmp.183 = getelementptr %Graph, ptr %rcc.tmp.182, i32 0, i32 11
  %rcc.tmp.184 = load %Graph*, ptr %self..tmp
  %rcc.tmp.185 = getelementptr %Graph, ptr %rcc.tmp.184, i32 0, i32 12
  %rcc.tmp.186 = load i32, ptr %rcc.tmp.185
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 0
  %rcc.tmp.188 = getelementptr [100 x i32], ptr %rcc.tmp.183, i32 0, i32 %rcc.tmp.187
  %rcc.tmp.189 = load i32, ptr %rcc.tmp.188
  store i32 %rcc.tmp.189, ptr %w
  %rcc.tmp.191 = load %Graph*, ptr %self..tmp
  %rcc.tmp.192 = getelementptr %Graph, ptr %rcc.tmp.191, i32 0, i32 10
  %rcc.tmp.193 = load i32, ptr %w
  %rcc.tmp.194 = add i32 %rcc.tmp.193, 0
  %rcc.tmp.195 = getelementptr [100 x i1], ptr %rcc.tmp.192, i32 0, i32 %rcc.tmp.194
  store i1 0, ptr %rcc.tmp.195
  %rcc.tmp.197 = load i32, ptr %w
  %rcc.tmp.198 = load i32, ptr %u..tmp
  %rcc.tmp.199 = icmp eq i32 %rcc.tmp.197, %rcc.tmp.198
  br i1 %rcc.tmp.199, label %if.then.6, label %if.else.6
if.then.6:
  br label %while.linker.2
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %while.cond.2
while.end.2:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  ret void
}
define void @Graph.find_all_scc.(%Graph* %self.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %i = alloca i32 
  %v = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %Graph*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %Graph, ptr %rcc.tmp.5, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %Graph*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %Graph, ptr %rcc.tmp.11, i32 0, i32 9
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = sub i32 0, 1
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = load %Graph*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %Graph, ptr %rcc.tmp.18, i32 0, i32 8
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = sub i32 0, 1
  store i32 %rcc.tmp.23, ptr %rcc.tmp.22
  %rcc.tmp.25 = load %Graph*, ptr %self..tmp
  %rcc.tmp.26 = getelementptr %Graph, ptr %rcc.tmp.25, i32 0, i32 10
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [100 x i1], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  store i1 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load %Graph*, ptr %self..tmp
  %rcc.tmp.36 = getelementptr %Graph, ptr %rcc.tmp.35, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.36
  %rcc.tmp.38 = load %Graph*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %Graph, ptr %rcc.tmp.38, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = load %Graph*, ptr %self..tmp
  %rcc.tmp.42 = getelementptr %Graph, ptr %rcc.tmp.41, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.42
  store i32 0, ptr %v
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.46 = load i32, ptr %v
  %rcc.tmp.47 = load %Graph*, ptr %self..tmp
  %rcc.tmp.48 = getelementptr %Graph, ptr %rcc.tmp.47, i32 0, i32 0
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.46, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.53 = load %Graph*, ptr %self..tmp
  %rcc.tmp.54 = getelementptr %Graph, ptr %rcc.tmp.53, i32 0, i32 9
  %rcc.tmp.55 = load i32, ptr %v
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [100 x i32], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = load i32, ptr %rcc.tmp.57
  %rcc.tmp.59 = sub i32 0, 1
  %rcc.tmp.60 = icmp eq i32 %rcc.tmp.58, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %if.then, label %if.else
if.then:
  %rcc.tmp.62 = load %Graph*, ptr %self..tmp
  %rcc.tmp.63 = load i32, ptr %v
  call void @Graph.tarjan_scc.(%Graph* %rcc.tmp.62, i32 %rcc.tmp.63)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.67 = load i32, ptr %v
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %v
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @Graph.find_parent.(%Graph* %self.tmp, i32 %x.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %x..tmp = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %x.tmp, ptr %x..tmp
  %rcc.tmp.3 = load %Graph*, ptr %self..tmp
  %rcc.tmp.4 = getelementptr %Graph, ptr %rcc.tmp.3, i32 0, i32 15
  %rcc.tmp.5 = load i32, ptr %x..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [100 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %x..tmp
  %rcc.tmp.10 = icmp ne i32 %rcc.tmp.8, %rcc.tmp.9
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load %Graph*, ptr %self..tmp
  %rcc.tmp.13 = getelementptr %Graph, ptr %rcc.tmp.12, i32 0, i32 15
  %rcc.tmp.14 = load i32, ptr %x..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load %Graph*, ptr %self..tmp
  %rcc.tmp.18 = load %Graph*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %Graph, ptr %rcc.tmp.18, i32 0, i32 15
  %rcc.tmp.20 = load i32, ptr %x..tmp
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = call i32 @Graph.find_parent.(%Graph* %rcc.tmp.17, i32 %rcc.tmp.23)
  store i32 %rcc.tmp.24, ptr %rcc.tmp.16
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.28 = load %Graph*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %Graph, ptr %rcc.tmp.28, i32 0, i32 15
  %rcc.tmp.30 = load i32, ptr %x..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [100 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  ret i32 %rcc.tmp.33
}
define void @Graph.union_sets.(%Graph* %self.tmp, i32 %x.tmp, i32 %y.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %x..tmp = alloca i32 
  %y..tmp = alloca i32 
  %root_x = alloca i32 
  %root_y = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %x.tmp, ptr %x..tmp
  store i32 %y.tmp, ptr %y..tmp
  %rcc.tmp.4 = load %Graph*, ptr %self..tmp
  %rcc.tmp.5 = load i32, ptr %x..tmp
  %rcc.tmp.6 = call i32 @Graph.find_parent.(%Graph* %rcc.tmp.4, i32 %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %root_x
  %rcc.tmp.8 = load %Graph*, ptr %self..tmp
  %rcc.tmp.9 = load i32, ptr %y..tmp
  %rcc.tmp.10 = call i32 @Graph.find_parent.(%Graph* %rcc.tmp.8, i32 %rcc.tmp.9)
  store i32 %rcc.tmp.10, ptr %root_y
  %rcc.tmp.12 = load i32, ptr %root_x
  %rcc.tmp.13 = load i32, ptr %root_y
  %rcc.tmp.14 = icmp ne i32 %rcc.tmp.12, %rcc.tmp.13
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = load %Graph*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %Graph, ptr %rcc.tmp.16, i32 0, i32 16
  %rcc.tmp.18 = load i32, ptr %root_x
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [100 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  %rcc.tmp.22 = load %Graph*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %Graph, ptr %rcc.tmp.22, i32 0, i32 16
  %rcc.tmp.24 = load i32, ptr %root_y
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 0
  %rcc.tmp.26 = getelementptr [100 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.30 = load %Graph*, ptr %self..tmp
  %rcc.tmp.31 = getelementptr %Graph, ptr %rcc.tmp.30, i32 0, i32 15
  %rcc.tmp.32 = load i32, ptr %root_x
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [100 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %root_y
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  br label %if.merge.2
if.else.2:
  %rcc.tmp.38 = load %Graph*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %Graph, ptr %rcc.tmp.38, i32 0, i32 16
  %rcc.tmp.40 = load i32, ptr %root_x
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [100 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = load %Graph*, ptr %self..tmp
  %rcc.tmp.45 = getelementptr %Graph, ptr %rcc.tmp.44, i32 0, i32 16
  %rcc.tmp.46 = load i32, ptr %root_y
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = getelementptr [100 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.48
  %rcc.tmp.50 = icmp sgt i32 %rcc.tmp.43, %rcc.tmp.49
  br i1 %rcc.tmp.50, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.52 = load %Graph*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %Graph, ptr %rcc.tmp.52, i32 0, i32 15
  %rcc.tmp.54 = load i32, ptr %root_y
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [100 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = load i32, ptr %root_x
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  br label %if.merge.3
if.else.3:
  %rcc.tmp.60 = load %Graph*, ptr %self..tmp
  %rcc.tmp.61 = getelementptr %Graph, ptr %rcc.tmp.60, i32 0, i32 15
  %rcc.tmp.62 = load i32, ptr %root_y
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [100 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %root_x
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load %Graph*, ptr %self..tmp
  %rcc.tmp.68 = getelementptr %Graph, ptr %rcc.tmp.67, i32 0, i32 16
  %rcc.tmp.69 = load i32, ptr %root_x
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [100 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %rcc.tmp.71
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define void @Graph.kruskal_mst.(%Graph* %self.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %i = alloca i32 
  %sorted = alloca i1 
  %j = alloca i32 
  %temp = alloca %Edge 
  %edges_added = alloca i32 
  %edge_idx = alloca i32 
  %edge = alloca %Edge 
  %root_from = alloca i32 
  %root_to = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = load %Graph*, ptr %self..tmp
  %rcc.tmp.6 = getelementptr %Graph, ptr %rcc.tmp.5, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.4, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load %Graph*, ptr %self..tmp
  %rcc.tmp.12 = getelementptr %Graph, ptr %rcc.tmp.11, i32 0, i32 15
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = load %Graph*, ptr %self..tmp
  %rcc.tmp.19 = getelementptr %Graph, ptr %rcc.tmp.18, i32 0, i32 16
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 0
  %rcc.tmp.22 = getelementptr [100 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.21
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  store i1 0, ptr %sorted
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.30 = load i1, ptr %sorted
  %rcc.tmp.31 = xor i1 %rcc.tmp.30, true
  br i1 %rcc.tmp.31, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i1 1, ptr %sorted
  store i32 0, ptr %j
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = load %Graph*, ptr %self..tmp
  %rcc.tmp.39 = getelementptr %Graph, ptr %rcc.tmp.38, i32 0, i32 2
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = sub i32 %rcc.tmp.40, 1
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.37, %rcc.tmp.41
  br i1 %rcc.tmp.42, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.45 = load %Graph*, ptr %self..tmp
  %rcc.tmp.46 = getelementptr %Graph, ptr %rcc.tmp.45, i32 0, i32 1
  %rcc.tmp.47 = load i32, ptr %j
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 0
  %rcc.tmp.49 = getelementptr [2000 x %Edge], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.48
  %rcc.tmp.50 = getelementptr %Edge, ptr %rcc.tmp.49, i32 0, i32 2
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.50
  %rcc.tmp.52 = load %Graph*, ptr %self..tmp
  %rcc.tmp.53 = getelementptr %Graph, ptr %rcc.tmp.52, i32 0, i32 1
  %rcc.tmp.54 = load i32, ptr %j
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 1
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 0
  %rcc.tmp.57 = getelementptr [2000 x %Edge], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.56
  %rcc.tmp.58 = getelementptr %Edge, ptr %rcc.tmp.57, i32 0, i32 2
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = icmp sgt i32 %rcc.tmp.51, %rcc.tmp.59
  br i1 %rcc.tmp.60, label %if.then, label %if.else
if.then:
  %rcc.tmp.62 = load %Graph*, ptr %self..tmp
  %rcc.tmp.63 = getelementptr %Graph, ptr %rcc.tmp.62, i32 0, i32 1
  %rcc.tmp.64 = load i32, ptr %j
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 0
  %rcc.tmp.66 = getelementptr [2000 x %Edge], ptr %rcc.tmp.63, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.67 = getelementptr %Edge, ptr %rcc.tmp.66, i32 0, i32 0
  %rcc.tmp.68 = getelementptr %Edge, ptr %temp, i32 0, i32 0
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.69, ptr %rcc.tmp.68
  %rcc.tmp.71 = getelementptr %Edge, ptr %rcc.tmp.66, i32 0, i32 1
  %rcc.tmp.72 = getelementptr %Edge, ptr %temp, i32 0, i32 1
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.73, ptr %rcc.tmp.72
  %rcc.tmp.75 = getelementptr %Edge, ptr %rcc.tmp.66, i32 0, i32 2
  %rcc.tmp.76 = getelementptr %Edge, ptr %temp, i32 0, i32 2
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.75
  store i32 %rcc.tmp.77, ptr %rcc.tmp.76
  %rcc.tmp.79 = getelementptr %Edge, ptr %rcc.tmp.66, i32 0, i32 3
  %rcc.tmp.80 = getelementptr %Edge, ptr %temp, i32 0, i32 3
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.79
  store i32 %rcc.tmp.81, ptr %rcc.tmp.80
  %rcc.tmp.83 = getelementptr %Edge, ptr %rcc.tmp.66, i32 0, i32 4
  %rcc.tmp.84 = getelementptr %Edge, ptr %temp, i32 0, i32 4
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.83
  store i32 %rcc.tmp.85, ptr %rcc.tmp.84
  %rcc.tmp.87 = load %Graph*, ptr %self..tmp
  %rcc.tmp.88 = getelementptr %Graph, ptr %rcc.tmp.87, i32 0, i32 1
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = getelementptr [2000 x %Edge], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.90
  %rcc.tmp.92 = load %Graph*, ptr %self..tmp
  %rcc.tmp.93 = getelementptr %Graph, ptr %rcc.tmp.92, i32 0, i32 1
  %rcc.tmp.94 = load i32, ptr %j
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 0
  %rcc.tmp.97 = getelementptr [2000 x %Edge], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.96
  %rcc.tmp.98 = getelementptr %Edge, ptr %rcc.tmp.97, i32 0, i32 0
  %rcc.tmp.99 = getelementptr %Edge, ptr %rcc.tmp.91, i32 0, i32 0
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.98
  store i32 %rcc.tmp.100, ptr %rcc.tmp.99
  %rcc.tmp.102 = getelementptr %Edge, ptr %rcc.tmp.97, i32 0, i32 1
  %rcc.tmp.103 = getelementptr %Edge, ptr %rcc.tmp.91, i32 0, i32 1
  %rcc.tmp.104 = load i32, ptr %rcc.tmp.102
  store i32 %rcc.tmp.104, ptr %rcc.tmp.103
  %rcc.tmp.106 = getelementptr %Edge, ptr %rcc.tmp.97, i32 0, i32 2
  %rcc.tmp.107 = getelementptr %Edge, ptr %rcc.tmp.91, i32 0, i32 2
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.106
  store i32 %rcc.tmp.108, ptr %rcc.tmp.107
  %rcc.tmp.110 = getelementptr %Edge, ptr %rcc.tmp.97, i32 0, i32 3
  %rcc.tmp.111 = getelementptr %Edge, ptr %rcc.tmp.91, i32 0, i32 3
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.110
  store i32 %rcc.tmp.112, ptr %rcc.tmp.111
  %rcc.tmp.114 = getelementptr %Edge, ptr %rcc.tmp.97, i32 0, i32 4
  %rcc.tmp.115 = getelementptr %Edge, ptr %rcc.tmp.91, i32 0, i32 4
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.114
  store i32 %rcc.tmp.116, ptr %rcc.tmp.115
  %rcc.tmp.118 = load %Graph*, ptr %self..tmp
  %rcc.tmp.119 = getelementptr %Graph, ptr %rcc.tmp.118, i32 0, i32 1
  %rcc.tmp.120 = load i32, ptr %j
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 1
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 0
  %rcc.tmp.123 = getelementptr [2000 x %Edge], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.122
  %rcc.tmp.124 = getelementptr %Edge, ptr %temp, i32 0, i32 0
  %rcc.tmp.125 = getelementptr %Edge, ptr %rcc.tmp.123, i32 0, i32 0
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.124
  store i32 %rcc.tmp.126, ptr %rcc.tmp.125
  %rcc.tmp.128 = getelementptr %Edge, ptr %temp, i32 0, i32 1
  %rcc.tmp.129 = getelementptr %Edge, ptr %rcc.tmp.123, i32 0, i32 1
  %rcc.tmp.130 = load i32, ptr %rcc.tmp.128
  store i32 %rcc.tmp.130, ptr %rcc.tmp.129
  %rcc.tmp.132 = getelementptr %Edge, ptr %temp, i32 0, i32 2
  %rcc.tmp.133 = getelementptr %Edge, ptr %rcc.tmp.123, i32 0, i32 2
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.132
  store i32 %rcc.tmp.134, ptr %rcc.tmp.133
  %rcc.tmp.136 = getelementptr %Edge, ptr %temp, i32 0, i32 3
  %rcc.tmp.137 = getelementptr %Edge, ptr %rcc.tmp.123, i32 0, i32 3
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.136
  store i32 %rcc.tmp.138, ptr %rcc.tmp.137
  %rcc.tmp.140 = getelementptr %Edge, ptr %temp, i32 0, i32 4
  %rcc.tmp.141 = getelementptr %Edge, ptr %rcc.tmp.123, i32 0, i32 4
  %rcc.tmp.142 = load i32, ptr %rcc.tmp.140
  store i32 %rcc.tmp.142, ptr %rcc.tmp.141
  store i1 0, ptr %sorted
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.147 = load i32, ptr %j
  %rcc.tmp.148 = add i32 %rcc.tmp.147, 1
  store i32 %rcc.tmp.148, ptr %j
  br label %while.cond.3
while.end.3:
  br label %while.cond.2
while.end.2:
  %rcc.tmp.152 = load %Graph*, ptr %self..tmp
  %rcc.tmp.153 = getelementptr %Graph, ptr %rcc.tmp.152, i32 0, i32 17
  store i32 0, ptr %rcc.tmp.153
  store i32 0, ptr %edges_added
  store i32 0, ptr %edge_idx
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.158 = load i32, ptr %edge_idx
  %rcc.tmp.159 = load %Graph*, ptr %self..tmp
  %rcc.tmp.160 = getelementptr %Graph, ptr %rcc.tmp.159, i32 0, i32 2
  %rcc.tmp.161 = load i32, ptr %rcc.tmp.160
  %rcc.tmp.162 = icmp slt i32 %rcc.tmp.158, %rcc.tmp.161
  br i1 %rcc.tmp.162, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.164 = load i32, ptr %edges_added
  %rcc.tmp.165 = load %Graph*, ptr %self..tmp
  %rcc.tmp.166 = getelementptr %Graph, ptr %rcc.tmp.165, i32 0, i32 0
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.166
  %rcc.tmp.168 = sub i32 %rcc.tmp.167, 1
  %rcc.tmp.169 = icmp slt i32 %rcc.tmp.164, %rcc.tmp.168
  br label %sc.merge
sc.merge:
  %rcc.tmp.171 = phi i1 [0, %while.cond.4], [%rcc.tmp.169, %and.rhs]
  br i1 %rcc.tmp.171, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.174 = load %Graph*, ptr %self..tmp
  %rcc.tmp.175 = getelementptr %Graph, ptr %rcc.tmp.174, i32 0, i32 1
  %rcc.tmp.176 = load i32, ptr %edge_idx
  %rcc.tmp.177 = add i32 %rcc.tmp.176, 0
  %rcc.tmp.178 = getelementptr [2000 x %Edge], ptr %rcc.tmp.175, i32 0, i32 %rcc.tmp.177
  %rcc.tmp.179 = getelementptr %Edge, ptr %rcc.tmp.178, i32 0, i32 0
  %rcc.tmp.180 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.179
  store i32 %rcc.tmp.181, ptr %rcc.tmp.180
  %rcc.tmp.183 = getelementptr %Edge, ptr %rcc.tmp.178, i32 0, i32 1
  %rcc.tmp.184 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.185 = load i32, ptr %rcc.tmp.183
  store i32 %rcc.tmp.185, ptr %rcc.tmp.184
  %rcc.tmp.187 = getelementptr %Edge, ptr %rcc.tmp.178, i32 0, i32 2
  %rcc.tmp.188 = getelementptr %Edge, ptr %edge, i32 0, i32 2
  %rcc.tmp.189 = load i32, ptr %rcc.tmp.187
  store i32 %rcc.tmp.189, ptr %rcc.tmp.188
  %rcc.tmp.191 = getelementptr %Edge, ptr %rcc.tmp.178, i32 0, i32 3
  %rcc.tmp.192 = getelementptr %Edge, ptr %edge, i32 0, i32 3
  %rcc.tmp.193 = load i32, ptr %rcc.tmp.191
  store i32 %rcc.tmp.193, ptr %rcc.tmp.192
  %rcc.tmp.195 = getelementptr %Edge, ptr %rcc.tmp.178, i32 0, i32 4
  %rcc.tmp.196 = getelementptr %Edge, ptr %edge, i32 0, i32 4
  %rcc.tmp.197 = load i32, ptr %rcc.tmp.195
  store i32 %rcc.tmp.197, ptr %rcc.tmp.196
  %rcc.tmp.199 = load %Graph*, ptr %self..tmp
  %rcc.tmp.200 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.201 = load i32, ptr %rcc.tmp.200
  %rcc.tmp.202 = call i32 @Graph.find_parent.(%Graph* %rcc.tmp.199, i32 %rcc.tmp.201)
  store i32 %rcc.tmp.202, ptr %root_from
  %rcc.tmp.204 = load %Graph*, ptr %self..tmp
  %rcc.tmp.205 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.206 = load i32, ptr %rcc.tmp.205
  %rcc.tmp.207 = call i32 @Graph.find_parent.(%Graph* %rcc.tmp.204, i32 %rcc.tmp.206)
  store i32 %rcc.tmp.207, ptr %root_to
  %rcc.tmp.209 = load i32, ptr %root_from
  %rcc.tmp.210 = load i32, ptr %root_to
  %rcc.tmp.211 = icmp ne i32 %rcc.tmp.209, %rcc.tmp.210
  br i1 %rcc.tmp.211, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.213 = load %Graph*, ptr %self..tmp
  %rcc.tmp.214 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.215 = load i32, ptr %rcc.tmp.214
  %rcc.tmp.216 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.217 = load i32, ptr %rcc.tmp.216
  call void @Graph.union_sets.(%Graph* %rcc.tmp.213, i32 %rcc.tmp.215, i32 %rcc.tmp.217)
  %rcc.tmp.219 = load %Graph*, ptr %self..tmp
  %rcc.tmp.220 = getelementptr %Graph, ptr %rcc.tmp.219, i32 0, i32 17
  %rcc.tmp.221 = getelementptr %Edge, ptr %edge, i32 0, i32 2
  %rcc.tmp.222 = load i32, ptr %rcc.tmp.221
  %rcc.tmp.223 = load i32, ptr %rcc.tmp.220
  %rcc.tmp.224 = add i32 %rcc.tmp.223, %rcc.tmp.222
  store i32 %rcc.tmp.224, ptr %rcc.tmp.220
  %rcc.tmp.226 = load i32, ptr %edges_added
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 1
  store i32 %rcc.tmp.227, ptr %edges_added
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.231 = load i32, ptr %edge_idx
  %rcc.tmp.232 = add i32 %rcc.tmp.231, 1
  store i32 %rcc.tmp.232, ptr %edge_idx
  br label %while.cond.4
while.end.4:
  ret void
}
define i32 @Graph.dfs_flow.(%Graph* %self.tmp, i32 %source.tmp, i32 %sink.tmp, i32 %current.tmp, i32 %min_flow.tmp, [100 x i1]* %visited.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %source..tmp = alloca i32 
  %sink..tmp = alloca i32 
  %current..tmp = alloca i32 
  %min_flow..tmp = alloca i32 
  %visited..tmp = alloca [100 x i1]* 
  %edge_idx = alloca i32 
  %edge = alloca %Edge 
  %residual_capacity = alloca i32 
  %bottleneck = alloca i32 
  %flow_sent = alloca i32 
  %rev_idx = alloca i32 
  %rev_edge = alloca %Edge 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %source.tmp, ptr %source..tmp
  store i32 %sink.tmp, ptr %sink..tmp
  store i32 %current.tmp, ptr %current..tmp
  store i32 %min_flow.tmp, ptr %min_flow..tmp
  store [100 x i1]* %visited.tmp, ptr %visited..tmp
  %rcc.tmp.7 = load i32, ptr %current..tmp
  %rcc.tmp.8 = load i32, ptr %sink..tmp
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.7, %rcc.tmp.8
  br i1 %rcc.tmp.9, label %if.then, label %if.else
if.then:
  %rcc.tmp.11 = load i32, ptr %min_flow..tmp
  ret i32 %rcc.tmp.11
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %current..tmp
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [100 x i1]*, ptr %visited..tmp
  %rcc.tmp.17 = getelementptr [100 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  store i1 1, ptr %rcc.tmp.17
  store i32 0, ptr %edge_idx
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %edge_idx
  %rcc.tmp.22 = load %Graph*, ptr %self..tmp
  %rcc.tmp.23 = getelementptr %Graph, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.21, %rcc.tmp.24
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load %Graph*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %Graph, ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = load i32, ptr %edge_idx
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [2000 x %Edge], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %Edge, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.33
  store i32 %rcc.tmp.35, ptr %rcc.tmp.34
  %rcc.tmp.37 = getelementptr %Edge, ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.38 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.37
  store i32 %rcc.tmp.39, ptr %rcc.tmp.38
  %rcc.tmp.41 = getelementptr %Edge, ptr %rcc.tmp.32, i32 0, i32 2
  %rcc.tmp.42 = getelementptr %Edge, ptr %edge, i32 0, i32 2
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.43, ptr %rcc.tmp.42
  %rcc.tmp.45 = getelementptr %Edge, ptr %rcc.tmp.32, i32 0, i32 3
  %rcc.tmp.46 = getelementptr %Edge, ptr %edge, i32 0, i32 3
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.47, ptr %rcc.tmp.46
  %rcc.tmp.49 = getelementptr %Edge, ptr %rcc.tmp.32, i32 0, i32 4
  %rcc.tmp.50 = getelementptr %Edge, ptr %edge, i32 0, i32 4
  %rcc.tmp.51 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.51, ptr %rcc.tmp.50
  %rcc.tmp.53 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %current..tmp
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.54, %rcc.tmp.55
  br i1 %rcc.tmp.56, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.58 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [100 x i1]*, ptr %visited..tmp
  %rcc.tmp.62 = getelementptr [100 x i1], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i1, ptr %rcc.tmp.62
  %rcc.tmp.64 = xor i1 %rcc.tmp.63, true
  br label %sc.merge
sc.merge:
  %rcc.tmp.66 = phi i1 [0, %while.body], [%rcc.tmp.64, %and.rhs]
  br i1 %rcc.tmp.66, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.68 = getelementptr %Edge, ptr %edge, i32 0, i32 3
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr %Edge, ptr %edge, i32 0, i32 4
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  %rcc.tmp.72 = sub i32 %rcc.tmp.69, %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %residual_capacity
  %rcc.tmp.74 = load i32, ptr %residual_capacity
  %rcc.tmp.75 = icmp sgt i32 %rcc.tmp.74, 0
  br i1 %rcc.tmp.75, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.77 = load i32, ptr %min_flow..tmp
  %rcc.tmp.78 = load i32, ptr %residual_capacity
  %rcc.tmp.79 = icmp slt i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.81 = load i32, ptr %min_flow..tmp
  br label %if.merge.4
if.else.4:
  %rcc.tmp.83 = load i32, ptr %residual_capacity
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.85 = phi i32 [%rcc.tmp.81, %if.then.4], [%rcc.tmp.83, %if.else.4]
  store i32 %rcc.tmp.85, ptr %bottleneck
  %rcc.tmp.87 = load %Graph*, ptr %self..tmp
  %rcc.tmp.88 = load i32, ptr %source..tmp
  %rcc.tmp.89 = load i32, ptr %sink..tmp
  %rcc.tmp.90 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = load i32, ptr %bottleneck
  %rcc.tmp.93 = load [100 x i1]*, ptr %visited..tmp
  %rcc.tmp.94 = call i32 @Graph.dfs_flow.(%Graph* %rcc.tmp.87, i32 %rcc.tmp.88, i32 %rcc.tmp.89, i32 %rcc.tmp.91, i32 %rcc.tmp.92, [100 x i1]* %rcc.tmp.93)
  store i32 %rcc.tmp.94, ptr %flow_sent
  %rcc.tmp.96 = load i32, ptr %flow_sent
  %rcc.tmp.97 = icmp sgt i32 %rcc.tmp.96, 0
  br i1 %rcc.tmp.97, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.99 = load %Graph*, ptr %self..tmp
  %rcc.tmp.100 = getelementptr %Graph, ptr %rcc.tmp.99, i32 0, i32 1
  %rcc.tmp.101 = load i32, ptr %edge_idx
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [2000 x %Edge], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = getelementptr %Edge, ptr %rcc.tmp.103, i32 0, i32 4
  %rcc.tmp.105 = load i32, ptr %flow_sent
  %rcc.tmp.106 = load i32, ptr %rcc.tmp.104
  %rcc.tmp.107 = add i32 %rcc.tmp.106, %rcc.tmp.105
  store i32 %rcc.tmp.107, ptr %rcc.tmp.104
  store i32 0, ptr %rev_idx
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.111 = load i32, ptr %rev_idx
  %rcc.tmp.112 = load %Graph*, ptr %self..tmp
  %rcc.tmp.113 = getelementptr %Graph, ptr %rcc.tmp.112, i32 0, i32 2
  %rcc.tmp.114 = load i32, ptr %rcc.tmp.113
  %rcc.tmp.115 = icmp slt i32 %rcc.tmp.111, %rcc.tmp.114
  br i1 %rcc.tmp.115, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.118 = load %Graph*, ptr %self..tmp
  %rcc.tmp.119 = getelementptr %Graph, ptr %rcc.tmp.118, i32 0, i32 1
  %rcc.tmp.120 = load i32, ptr %rev_idx
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [2000 x %Edge], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.123 = getelementptr %Edge, ptr %rcc.tmp.122, i32 0, i32 0
  %rcc.tmp.124 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 0
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.125, ptr %rcc.tmp.124
  %rcc.tmp.127 = getelementptr %Edge, ptr %rcc.tmp.122, i32 0, i32 1
  %rcc.tmp.128 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 1
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.129, ptr %rcc.tmp.128
  %rcc.tmp.131 = getelementptr %Edge, ptr %rcc.tmp.122, i32 0, i32 2
  %rcc.tmp.132 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 2
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.133, ptr %rcc.tmp.132
  %rcc.tmp.135 = getelementptr %Edge, ptr %rcc.tmp.122, i32 0, i32 3
  %rcc.tmp.136 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 3
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.135
  store i32 %rcc.tmp.137, ptr %rcc.tmp.136
  %rcc.tmp.139 = getelementptr %Edge, ptr %rcc.tmp.122, i32 0, i32 4
  %rcc.tmp.140 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 4
  %rcc.tmp.141 = load i32, ptr %rcc.tmp.139
  store i32 %rcc.tmp.141, ptr %rcc.tmp.140
  %rcc.tmp.143 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 0
  %rcc.tmp.144 = load i32, ptr %rcc.tmp.143
  %rcc.tmp.145 = getelementptr %Edge, ptr %edge, i32 0, i32 1
  %rcc.tmp.146 = load i32, ptr %rcc.tmp.145
  %rcc.tmp.147 = icmp eq i32 %rcc.tmp.144, %rcc.tmp.146
  br i1 %rcc.tmp.147, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.149 = getelementptr %Edge, ptr %rev_edge, i32 0, i32 1
  %rcc.tmp.150 = load i32, ptr %rcc.tmp.149
  %rcc.tmp.151 = getelementptr %Edge, ptr %edge, i32 0, i32 0
  %rcc.tmp.152 = load i32, ptr %rcc.tmp.151
  %rcc.tmp.153 = icmp eq i32 %rcc.tmp.150, %rcc.tmp.152
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.155 = phi i1 [0, %while.body.2], [%rcc.tmp.153, %and.rhs.2]
  br i1 %rcc.tmp.155, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.157 = load %Graph*, ptr %self..tmp
  %rcc.tmp.158 = getelementptr %Graph, ptr %rcc.tmp.157, i32 0, i32 1
  %rcc.tmp.159 = load i32, ptr %rev_idx
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 0
  %rcc.tmp.161 = getelementptr [2000 x %Edge], ptr %rcc.tmp.158, i32 0, i32 %rcc.tmp.160
  %rcc.tmp.162 = getelementptr %Edge, ptr %rcc.tmp.161, i32 0, i32 4
  %rcc.tmp.163 = load i32, ptr %flow_sent
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.162
  %rcc.tmp.165 = sub i32 %rcc.tmp.164, %rcc.tmp.163
  store i32 %rcc.tmp.165, ptr %rcc.tmp.162
  br label %while.linker.2
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.169 = load i32, ptr %rev_idx
  %rcc.tmp.170 = add i32 %rcc.tmp.169, 1
  store i32 %rcc.tmp.170, ptr %rev_idx
  br label %while.cond.2
while.end.2:
  %rcc.tmp.173 = load i32, ptr %flow_sent
  ret i32 %rcc.tmp.173
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.180 = load i32, ptr %edge_idx
  %rcc.tmp.181 = add i32 %rcc.tmp.180, 1
  store i32 %rcc.tmp.181, ptr %edge_idx
  br label %while.cond
while.end:
  ret i32 0
}
define i32 @Graph.max_flow.(%Graph* %self.tmp, i32 %source.tmp, i32 %sink.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %source..tmp = alloca i32 
  %sink..tmp = alloca i32 
  %total_flow = alloca i32 
  %i = alloca i32 
  %iterations = alloca i32 
  %visited = alloca [100 x i1] 
  %fill.idx = alloca i32 
  %flow_sent = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %source.tmp, ptr %source..tmp
  store i32 %sink.tmp, ptr %sink..tmp
  store i32 0, ptr %total_flow
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = load %Graph*, ptr %self..tmp
  %rcc.tmp.9 = getelementptr %Graph, ptr %rcc.tmp.8, i32 0, i32 2
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.7, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load %Graph*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %Graph, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [2000 x %Edge], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Edge, ptr %rcc.tmp.18, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %iterations
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.27 = load i32, ptr %iterations
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 1000
  br i1 %rcc.tmp.28, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.33 = load i32, ptr %fill.idx
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.33, 100
  br i1 %rcc.tmp.34, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.36 = load i32, ptr %fill.idx
  %rcc.tmp.37 = getelementptr [100 x i1], ptr %visited, i32 0, i32 %rcc.tmp.36
  store i1 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.39, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.42 = load %Graph*, ptr %self..tmp
  %rcc.tmp.43 = load i32, ptr %source..tmp
  %rcc.tmp.44 = load i32, ptr %sink..tmp
  %rcc.tmp.45 = load i32, ptr %source..tmp
  %rcc.tmp.46 = call i32 @Graph.dfs_flow.(%Graph* %rcc.tmp.42, i32 %rcc.tmp.43, i32 %rcc.tmp.44, i32 %rcc.tmp.45, i32 500, [100 x i1]* %visited)
  store i32 %rcc.tmp.46, ptr %flow_sent
  %rcc.tmp.48 = load i32, ptr %flow_sent
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 0
  br i1 %rcc.tmp.49, label %if.then, label %if.else
if.then:
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.53 = load i32, ptr %flow_sent
  %rcc.tmp.54 = load i32, ptr %total_flow
  %rcc.tmp.55 = add i32 %rcc.tmp.54, %rcc.tmp.53
  store i32 %rcc.tmp.55, ptr %total_flow
  %rcc.tmp.57 = load i32, ptr %iterations
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %iterations
  br label %while.cond.2
while.end.2:
  %rcc.tmp.61 = load i32, ptr %total_flow
  ret i32 %rcc.tmp.61
}
define void @Graph.analyze_graph.(%Graph* %self.tmp, i32 %source.tmp, i32 %sink.tmp) {
entry:
  %self..tmp = alloca %Graph* 
  %source..tmp = alloca i32 
  %sink..tmp = alloca i32 
  %max_flow_value = alloca i32 
  store %Graph* %self.tmp, ptr %self..tmp
  store i32 %source.tmp, ptr %source..tmp
  store i32 %sink.tmp, ptr %sink..tmp
  %rcc.tmp.4 = load %Graph*, ptr %self..tmp
  %rcc.tmp.5 = load i32, ptr %source..tmp
  call void @Graph.dijkstra.(%Graph* %rcc.tmp.4, i32 %rcc.tmp.5)
  %rcc.tmp.7 = load %Graph*, ptr %self..tmp
  %rcc.tmp.8 = getelementptr %Graph, ptr %rcc.tmp.7, i32 0, i32 5
  %rcc.tmp.9 = load i32, ptr %sink..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = getelementptr [100 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  call void @printlnInt.(i32 %rcc.tmp.12)
  %rcc.tmp.14 = load %Graph*, ptr %self..tmp
  call void @Graph.floyd_warshall.(%Graph* %rcc.tmp.14)
  %rcc.tmp.16 = load %Graph*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %Graph, ptr %rcc.tmp.16, i32 0, i32 7
  %rcc.tmp.18 = load i32, ptr %source..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %sink..tmp
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [100 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  call void @printlnInt.(i32 %rcc.tmp.24)
  %rcc.tmp.26 = load %Graph*, ptr %self..tmp
  call void @Graph.find_all_scc.(%Graph* %rcc.tmp.26)
  %rcc.tmp.28 = load %Graph*, ptr %self..tmp
  %rcc.tmp.29 = getelementptr %Graph, ptr %rcc.tmp.28, i32 0, i32 14
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  call void @printlnInt.(i32 %rcc.tmp.30)
  %rcc.tmp.32 = load %Graph*, ptr %self..tmp
  call void @Graph.kruskal_mst.(%Graph* %rcc.tmp.32)
  %rcc.tmp.34 = load %Graph*, ptr %self..tmp
  %rcc.tmp.35 = getelementptr %Graph, ptr %rcc.tmp.34, i32 0, i32 17
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  call void @printlnInt.(i32 %rcc.tmp.36)
  %rcc.tmp.38 = load %Graph*, ptr %self..tmp
  %rcc.tmp.39 = load i32, ptr %source..tmp
  %rcc.tmp.40 = load i32, ptr %sink..tmp
  %rcc.tmp.41 = call i32 @Graph.max_flow.(%Graph* %rcc.tmp.38, i32 %rcc.tmp.39, i32 %rcc.tmp.40)
  store i32 %rcc.tmp.41, ptr %max_flow_value
  %rcc.tmp.43 = load i32, ptr %max_flow_value
  call void @printlnInt.(i32 %rcc.tmp.43)
  ret void
}
define void @Graph.new.(%Graph* sret(%Graph) %ret.slot, i32 %vertices.tmp) {
entry:
  %vertices..tmp = alloca i32 
  %graph = alloca %Graph 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %fill.idx.7 = alloca i32 
  %fill.idx.8 = alloca i32 
  %fill.idx.9 = alloca i32 
  %fill.idx.10 = alloca i32 
  %fill.idx.11 = alloca i32 
  %fill.idx.12 = alloca i32 
  %fill.idx.13 = alloca i32 
  %fill.idx.14 = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  store i32 %vertices.tmp, ptr %vertices..tmp
  %rcc.tmp.2 = getelementptr %Graph, ptr %graph, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %vertices..tmp
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  %rcc.tmp.5 = getelementptr %Graph, ptr %graph, i32 0, i32 1
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 2000
  br i1 %rcc.tmp.9, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = getelementptr [2000 x %Edge], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.11
  call void @Edge.new.(%Edge* %rcc.tmp.12, i32 0, i32 0, i32 0, i32 0)
  %rcc.tmp.14 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.14, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.17 = getelementptr %Graph, ptr %graph, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Graph, ptr %graph, i32 0, i32 3
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.22 = load i32, ptr %fill.idx.2
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.22, 100
  br i1 %rcc.tmp.23, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.25 = load i32, ptr %fill.idx.2
  %rcc.tmp.26 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.25
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.29 = load i32, ptr %fill.idx.3
  %rcc.tmp.30 = icmp slt i32 %rcc.tmp.29, 100
  br i1 %rcc.tmp.30, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.32 = load i32, ptr %fill.idx.3
  %rcc.tmp.33 = getelementptr [100 x i32], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.32
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.35, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.38 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.38, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.41 = getelementptr %Graph, ptr %graph, i32 0, i32 4
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.44 = load i32, ptr %fill.idx.4
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.44, 100
  br i1 %rcc.tmp.45, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.47 = load i32, ptr %fill.idx.4
  %rcc.tmp.48 = getelementptr [100 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.47
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = add i32 %rcc.tmp.47, 1
  store i32 %rcc.tmp.50, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.53 = getelementptr %Graph, ptr %graph, i32 0, i32 5
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.56 = load i32, ptr %fill.idx.5
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.56, 100
  br i1 %rcc.tmp.57, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.59 = load i32, ptr %fill.idx.5
  %rcc.tmp.60 = getelementptr [100 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.59
  store i32 2147483647, ptr %rcc.tmp.60
  %rcc.tmp.62 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.62, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.65 = getelementptr %Graph, ptr %graph, i32 0, i32 6
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.68 = load i32, ptr %fill.idx.6
  %rcc.tmp.69 = icmp slt i32 %rcc.tmp.68, 100
  br i1 %rcc.tmp.69, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.71 = load i32, ptr %fill.idx.6
  %rcc.tmp.72 = getelementptr [100 x i1], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.71
  store i1 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.74, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.77 = getelementptr %Graph, ptr %graph, i32 0, i32 7
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.80 = load i32, ptr %fill.idx.7
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.80, 100
  br i1 %rcc.tmp.81, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.83 = load i32, ptr %fill.idx.7
  %rcc.tmp.84 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.83
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.87 = load i32, ptr %fill.idx.8
  %rcc.tmp.88 = icmp slt i32 %rcc.tmp.87, 100
  br i1 %rcc.tmp.88, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.90 = load i32, ptr %fill.idx.8
  %rcc.tmp.91 = getelementptr [100 x i32], ptr %rcc.tmp.84, i32 0, i32 %rcc.tmp.90
  store i32 2147483647, ptr %rcc.tmp.91
  %rcc.tmp.93 = add i32 %rcc.tmp.90, 1
  store i32 %rcc.tmp.93, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  %rcc.tmp.96 = add i32 %rcc.tmp.83, 1
  store i32 %rcc.tmp.96, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  %rcc.tmp.99 = getelementptr %Graph, ptr %graph, i32 0, i32 8
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.102 = load i32, ptr %fill.idx.9
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.102, 100
  br i1 %rcc.tmp.103, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.105 = load i32, ptr %fill.idx.9
  %rcc.tmp.106 = getelementptr [100 x i32], ptr %rcc.tmp.99, i32 0, i32 %rcc.tmp.105
  store i32 0, ptr %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.105, 1
  store i32 %rcc.tmp.108, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  %rcc.tmp.111 = getelementptr %Graph, ptr %graph, i32 0, i32 9
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.114 = load i32, ptr %fill.idx.10
  %rcc.tmp.115 = icmp slt i32 %rcc.tmp.114, 100
  br i1 %rcc.tmp.115, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.117 = load i32, ptr %fill.idx.10
  %rcc.tmp.118 = getelementptr [100 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.117
  store i32 0, ptr %rcc.tmp.118
  %rcc.tmp.120 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.120, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  %rcc.tmp.123 = getelementptr %Graph, ptr %graph, i32 0, i32 10
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.126 = load i32, ptr %fill.idx.11
  %rcc.tmp.127 = icmp slt i32 %rcc.tmp.126, 100
  br i1 %rcc.tmp.127, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.129 = load i32, ptr %fill.idx.11
  %rcc.tmp.130 = getelementptr [100 x i1], ptr %rcc.tmp.123, i32 0, i32 %rcc.tmp.129
  store i1 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.132, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  %rcc.tmp.135 = getelementptr %Graph, ptr %graph, i32 0, i32 11
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.138 = load i32, ptr %fill.idx.12
  %rcc.tmp.139 = icmp slt i32 %rcc.tmp.138, 100
  br i1 %rcc.tmp.139, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.141 = load i32, ptr %fill.idx.12
  %rcc.tmp.142 = getelementptr [100 x i32], ptr %rcc.tmp.135, i32 0, i32 %rcc.tmp.141
  store i32 0, ptr %rcc.tmp.142
  %rcc.tmp.144 = add i32 %rcc.tmp.141, 1
  store i32 %rcc.tmp.144, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  %rcc.tmp.147 = getelementptr %Graph, ptr %graph, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.147
  %rcc.tmp.149 = getelementptr %Graph, ptr %graph, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.149
  %rcc.tmp.151 = getelementptr %Graph, ptr %graph, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.151
  %rcc.tmp.153 = getelementptr %Graph, ptr %graph, i32 0, i32 15
  store i32 0, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.cond.13:
  %rcc.tmp.156 = load i32, ptr %fill.idx.13
  %rcc.tmp.157 = icmp slt i32 %rcc.tmp.156, 100
  br i1 %rcc.tmp.157, label %array.fill.body.13, label %array.fill.end.13
array.fill.body.13:
  %rcc.tmp.159 = load i32, ptr %fill.idx.13
  %rcc.tmp.160 = getelementptr [100 x i32], ptr %rcc.tmp.153, i32 0, i32 %rcc.tmp.159
  store i32 0, ptr %rcc.tmp.160
  %rcc.tmp.162 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.162, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.end.13:
  %rcc.tmp.165 = getelementptr %Graph, ptr %graph, i32 0, i32 16
  store i32 0, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.cond.14:
  %rcc.tmp.168 = load i32, ptr %fill.idx.14
  %rcc.tmp.169 = icmp slt i32 %rcc.tmp.168, 100
  br i1 %rcc.tmp.169, label %array.fill.body.14, label %array.fill.end.14
array.fill.body.14:
  %rcc.tmp.171 = load i32, ptr %fill.idx.14
  %rcc.tmp.172 = getelementptr [100 x i32], ptr %rcc.tmp.165, i32 0, i32 %rcc.tmp.171
  store i32 0, ptr %rcc.tmp.172
  %rcc.tmp.174 = add i32 %rcc.tmp.171, 1
  store i32 %rcc.tmp.174, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.end.14:
  %rcc.tmp.177 = getelementptr %Graph, ptr %graph, i32 0, i32 17
  store i32 0, ptr %rcc.tmp.177
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = load i32, ptr %vertices..tmp
  %rcc.tmp.183 = icmp slt i32 %rcc.tmp.181, %rcc.tmp.182
  br i1 %rcc.tmp.183, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.188 = load i32, ptr %j
  %rcc.tmp.189 = load i32, ptr %vertices..tmp
  %rcc.tmp.190 = icmp slt i32 %rcc.tmp.188, %rcc.tmp.189
  br i1 %rcc.tmp.190, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.193 = load i32, ptr %i
  %rcc.tmp.194 = load i32, ptr %j
  %rcc.tmp.195 = icmp eq i32 %rcc.tmp.193, %rcc.tmp.194
  br i1 %rcc.tmp.195, label %if.then, label %if.else
if.then:
  %rcc.tmp.197 = getelementptr %Graph, ptr %graph, i32 0, i32 7
  %rcc.tmp.198 = load i32, ptr %i
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 0
  %rcc.tmp.200 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.197, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %j
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 0
  %rcc.tmp.203 = getelementptr [100 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.202
  store i32 0, ptr %rcc.tmp.203
  br label %if.merge
if.else:
  %rcc.tmp.206 = getelementptr %Graph, ptr %graph, i32 0, i32 7
  %rcc.tmp.207 = load i32, ptr %i
  %rcc.tmp.208 = add i32 %rcc.tmp.207, 0
  %rcc.tmp.209 = getelementptr [100 x [100 x i32]], ptr %rcc.tmp.206, i32 0, i32 %rcc.tmp.208
  %rcc.tmp.210 = load i32, ptr %j
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 0
  %rcc.tmp.212 = getelementptr [100 x i32], ptr %rcc.tmp.209, i32 0, i32 %rcc.tmp.211
  store i32 2147483647, ptr %rcc.tmp.212
  br label %if.merge
if.merge:
  %rcc.tmp.215 = load i32, ptr %j
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 1
  store i32 %rcc.tmp.216, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.219 = load i32, ptr %i
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 1
  store i32 %rcc.tmp.220, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.223 = bitcast %Graph* %ret.slot to i8*
  %rcc.tmp.224 = bitcast %Graph* %graph to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.223, i8* %rcc.tmp.224, i32 123024, i1 0)
  ret void
}
define i32 @GraphGenerator.next_random.(%GraphGenerator* %self.tmp) {
entry:
  %self..tmp = alloca %GraphGenerator* 
  store %GraphGenerator* %self.tmp, ptr %self..tmp
  %rcc.tmp.2 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.3 = getelementptr %GraphGenerator, ptr %rcc.tmp.2, i32 0, i32 0
  %rcc.tmp.4 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.5 = getelementptr %GraphGenerator, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = call i32 @pm_rand_update.(i32 %rcc.tmp.6)
  store i32 %rcc.tmp.7, ptr %rcc.tmp.3
  %rcc.tmp.9 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.10 = getelementptr %GraphGenerator, ptr %rcc.tmp.9, i32 0, i32 0
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %if.then, label %if.else
if.then:
  %rcc.tmp.14 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.15 = getelementptr %GraphGenerator, ptr %rcc.tmp.14, i32 0, i32 0
  %rcc.tmp.16 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.17 = getelementptr %GraphGenerator, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 0, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.15
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.23 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.24 = getelementptr %GraphGenerator, ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  ret i32 %rcc.tmp.25
}
define void @GraphGenerator.generate_complex_graph.(%GraphGenerator* %self.tmp, %Graph* %graph.tmp, i32 %density.tmp) {
entry:
  %self..tmp = alloca %GraphGenerator* 
  %graph..tmp = alloca %Graph* 
  %density..tmp = alloca i32 
  %vertices = alloca i32 
  %target_edges = alloca i32 
  %edges_added = alloca i32 
  %from = alloca i32 
  %to = alloca i32 
  %weight = alloca i32 
  %capacity = alloca i32 
  %i = alloca i32 
  %weight.2 = alloca i32 
  %capacity.2 = alloca i32 
  store %GraphGenerator* %self.tmp, ptr %self..tmp
  store %Graph* %graph.tmp, ptr %graph..tmp
  store i32 %density.tmp, ptr %density..tmp
  %rcc.tmp.4 = load %Graph*, ptr %graph..tmp
  %rcc.tmp.5 = getelementptr %Graph, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.6, ptr %vertices
  %rcc.tmp.8 = load i32, ptr %vertices
  %rcc.tmp.9 = load i32, ptr %vertices
  %rcc.tmp.10 = mul i32 %rcc.tmp.8, %rcc.tmp.9
  %rcc.tmp.11 = load i32, ptr %density..tmp
  %rcc.tmp.12 = mul i32 %rcc.tmp.10, %rcc.tmp.11
  %rcc.tmp.13 = sdiv i32 %rcc.tmp.12, 100
  store i32 %rcc.tmp.13, ptr %target_edges
  store i32 0, ptr %edges_added
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %edges_added
  %rcc.tmp.18 = load i32, ptr %target_edges
  %rcc.tmp.19 = icmp slt i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.21 = load i32, ptr %edges_added
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 1800
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %while.cond], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.27 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.28 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %rcc.tmp.27)
  %rcc.tmp.29 = load i32, ptr %vertices
  %rcc.tmp.30 = srem i32 %rcc.tmp.28, %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %from
  %rcc.tmp.32 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.33 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %rcc.tmp.32)
  %rcc.tmp.34 = load i32, ptr %vertices
  %rcc.tmp.35 = srem i32 %rcc.tmp.33, %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %to
  %rcc.tmp.37 = load i32, ptr %from
  %rcc.tmp.38 = load i32, ptr %to
  %rcc.tmp.39 = icmp ne i32 %rcc.tmp.37, %rcc.tmp.38
  br i1 %rcc.tmp.39, label %if.then, label %if.else
if.then:
  %rcc.tmp.41 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.42 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %rcc.tmp.41)
  %rcc.tmp.43 = srem i32 %rcc.tmp.42, 100
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %weight
  %rcc.tmp.46 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.47 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %rcc.tmp.46)
  %rcc.tmp.48 = srem i32 %rcc.tmp.47, 50
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %capacity
  %rcc.tmp.51 = load %Graph*, ptr %graph..tmp
  %rcc.tmp.52 = load i32, ptr %from
  %rcc.tmp.53 = load i32, ptr %to
  %rcc.tmp.54 = load i32, ptr %weight
  %rcc.tmp.55 = load i32, ptr %capacity
  call void @Graph.add_edge.(%Graph* %rcc.tmp.51, i32 %rcc.tmp.52, i32 %rcc.tmp.53, i32 %rcc.tmp.54, i32 %rcc.tmp.55)
  %rcc.tmp.57 = load i32, ptr %edges_added
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 1
  store i32 %rcc.tmp.58, ptr %edges_added
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = load i32, ptr %vertices
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 1
  %rcc.tmp.68 = icmp slt i32 %rcc.tmp.65, %rcc.tmp.67
  br i1 %rcc.tmp.68, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.71 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.72 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %rcc.tmp.71)
  %rcc.tmp.73 = srem i32 %rcc.tmp.72, 20
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %weight.2
  %rcc.tmp.76 = load %GraphGenerator*, ptr %self..tmp
  %rcc.tmp.77 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %rcc.tmp.76)
  %rcc.tmp.78 = srem i32 %rcc.tmp.77, 30
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.79, ptr %capacity.2
  %rcc.tmp.81 = load %Graph*, ptr %graph..tmp
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 1
  %rcc.tmp.85 = load i32, ptr %weight.2
  %rcc.tmp.86 = load i32, ptr %capacity.2
  call void @Graph.add_edge.(%Graph* %rcc.tmp.81, i32 %rcc.tmp.82, i32 %rcc.tmp.84, i32 %rcc.tmp.85, i32 %rcc.tmp.86)
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define void @GraphGenerator.new.(%GraphGenerator* sret(%GraphGenerator) %ret.slot, i32 %seed.tmp) {
entry:
  %seed..tmp = alloca i32 
  store i32 %seed.tmp, ptr %seed..tmp
  %rcc.tmp.2 = getelementptr %GraphGenerator, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.3 = load i32, ptr %seed..tmp
  store i32 %rcc.tmp.3, ptr %rcc.tmp.2
  ret void
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
  %vertices = alloca i32 
  %density = alloca i32 
  %source = alloca i32 
  %sink = alloca i32 
  %seed = alloca i32 
  %graph = alloca %Graph 
  %generator = alloca %GraphGenerator 
  %query_count = alloca i32 
  %start = alloca i32 
  %end = alloca i32 
  %component_analysis = alloca i32 
  %round = alloca i32 
  %total_mst_weight = alloca i32 
  %mst_round = alloca i32 
  %mod_count = alloca i32 
  %new_weight = alloca i32 
  %final_metric = alloca i32 
  %rcc.tmp.1 = call i32 @getInt.()
  store i32 %rcc.tmp.1, ptr %vertices
  %rcc.tmp.3 = call i32 @getInt.()
  store i32 %rcc.tmp.3, ptr %density
  %rcc.tmp.5 = call i32 @getInt.()
  store i32 %rcc.tmp.5, ptr %source
  %rcc.tmp.7 = call i32 @getInt.()
  store i32 %rcc.tmp.7, ptr %sink
  %rcc.tmp.9 = call i32 @getInt.()
  store i32 %rcc.tmp.9, ptr %seed
  %rcc.tmp.11 = load i32, ptr %vertices
  call void @Graph.new.(%Graph* %graph, i32 %rcc.tmp.11)
  %rcc.tmp.13 = load i32, ptr %seed
  call void @GraphGenerator.new.(%GraphGenerator* %generator, i32 %rcc.tmp.13)
  %rcc.tmp.15 = load i32, ptr %density
  call void @GraphGenerator.generate_complex_graph.(%GraphGenerator* %generator, %Graph* %graph, i32 %rcc.tmp.15)
  %rcc.tmp.17 = load i32, ptr %source
  %rcc.tmp.18 = load i32, ptr %sink
  call void @Graph.analyze_graph.(%Graph* %graph, i32 %rcc.tmp.17, i32 %rcc.tmp.18)
  store i32 0, ptr %query_count
  br label %while.cond
while.cond:
  %rcc.tmp.22 = load i32, ptr %query_count
  %rcc.tmp.23 = icmp slt i32 %rcc.tmp.22, 10
  br i1 %rcc.tmp.23, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.26 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %generator)
  %rcc.tmp.27 = load i32, ptr %vertices
  %rcc.tmp.28 = srem i32 %rcc.tmp.26, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %start
  %rcc.tmp.30 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %generator)
  %rcc.tmp.31 = load i32, ptr %vertices
  %rcc.tmp.32 = srem i32 %rcc.tmp.30, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %end
  %rcc.tmp.34 = load i32, ptr %start
  %rcc.tmp.35 = load i32, ptr %end
  %rcc.tmp.36 = icmp ne i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then, label %if.else
if.then:
  %rcc.tmp.38 = load i32, ptr %start
  call void @Graph.dijkstra.(%Graph* %graph, i32 %rcc.tmp.38)
  %rcc.tmp.40 = getelementptr %Graph, ptr %graph, i32 0, i32 5
  %rcc.tmp.41 = load i32, ptr %end
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [100 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  call void @printlnInt.(i32 %rcc.tmp.44)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %query_count
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %query_count
  br label %while.cond
while.end:
  store i32 0, ptr %component_analysis
  store i32 0, ptr %round
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.55 = load i32, ptr %round
  %rcc.tmp.56 = icmp slt i32 %rcc.tmp.55, 5
  br i1 %rcc.tmp.56, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  call void @Graph.find_all_scc.(%Graph* %graph)
  %rcc.tmp.60 = getelementptr %Graph, ptr %graph, i32 0, i32 14
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.60
  %rcc.tmp.62 = load i32, ptr %component_analysis
  %rcc.tmp.63 = add i32 %rcc.tmp.62, %rcc.tmp.61
  store i32 %rcc.tmp.63, ptr %component_analysis
  %rcc.tmp.65 = load i32, ptr %round
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %round
  br label %while.cond.2
while.end.2:
  %rcc.tmp.69 = load i32, ptr %component_analysis
  call void @printlnInt.(i32 %rcc.tmp.69)
  store i32 0, ptr %total_mst_weight
  store i32 0, ptr %mst_round
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.74 = load i32, ptr %mst_round
  %rcc.tmp.75 = icmp slt i32 %rcc.tmp.74, 3
  br i1 %rcc.tmp.75, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  call void @Graph.kruskal_mst.(%Graph* %graph)
  %rcc.tmp.79 = getelementptr %Graph, ptr %graph, i32 0, i32 17
  %rcc.tmp.80 = load i32, ptr %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %total_mst_weight
  %rcc.tmp.82 = add i32 %rcc.tmp.81, %rcc.tmp.80
  store i32 %rcc.tmp.82, ptr %total_mst_weight
  store i32 0, ptr %mod_count
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.86 = load i32, ptr %mod_count
  %rcc.tmp.87 = icmp slt i32 %rcc.tmp.86, 10
  br i1 %rcc.tmp.87, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.89 = load i32, ptr %mod_count
  %rcc.tmp.90 = getelementptr %Graph, ptr %graph, i32 0, i32 2
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.89, %rcc.tmp.91
  br label %sc.merge
sc.merge:
  %rcc.tmp.94 = phi i1 [0, %while.cond.4], [%rcc.tmp.92, %and.rhs]
  br i1 %rcc.tmp.94, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.97 = call i32 @GraphGenerator.next_random.(%GraphGenerator* %generator)
  %rcc.tmp.98 = srem i32 %rcc.tmp.97, 50
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  store i32 %rcc.tmp.99, ptr %new_weight
  %rcc.tmp.101 = getelementptr %Graph, ptr %graph, i32 0, i32 1
  %rcc.tmp.102 = load i32, ptr %mod_count
  %rcc.tmp.103 = add i32 %rcc.tmp.102, 0
  %rcc.tmp.104 = getelementptr [2000 x %Edge], ptr %rcc.tmp.101, i32 0, i32 %rcc.tmp.103
  %rcc.tmp.105 = getelementptr %Edge, ptr %rcc.tmp.104, i32 0, i32 2
  %rcc.tmp.106 = load i32, ptr %new_weight
  store i32 %rcc.tmp.106, ptr %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %mod_count
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %mod_count
  br label %while.cond.4
while.end.4:
  %rcc.tmp.112 = load i32, ptr %mst_round
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 1
  store i32 %rcc.tmp.113, ptr %mst_round
  br label %while.cond.3
while.end.3:
  %rcc.tmp.116 = load i32, ptr %total_mst_weight
  call void @printlnInt.(i32 %rcc.tmp.116)
  %rcc.tmp.118 = load i32, ptr %component_analysis
  %rcc.tmp.119 = load i32, ptr %total_mst_weight
  %rcc.tmp.120 = mul i32 %rcc.tmp.118, %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %vertices
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  %rcc.tmp.123 = sdiv i32 %rcc.tmp.120, %rcc.tmp.122
  store i32 %rcc.tmp.123, ptr %final_metric
  %rcc.tmp.125 = load i32, ptr %final_metric
  call void @printlnInt.(i32 %rcc.tmp.125)
  call void @exit.(i32 0)
  ret void
}
