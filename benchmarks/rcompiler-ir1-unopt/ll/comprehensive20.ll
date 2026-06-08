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
%Transition = type {i32, i32, i32, i32, i32}
%FSM = type {i32, i32, [200 x %Transition], i32, [100 x i32], i32, i32, i32, [50 x i32], i32, i32}
%Task = type {i32, i32, i32, i32, i32, i32, i32}
%ProtocolParser = type {i32, [1000 x i32], i32, i32, i32, i32, i32}
%TaskScheduler = type {[100 x %Task], i32, i32, [100 x i32], [100 x i32], i32, i32, i32, i32}
%NestedFSM = type {%FSM, %FSM, i32, i32, [20 x i32], i32}
define void @init_fsm.(%FSM* sret(%FSM) %ret.slot) {
entry:
  %fsm = alloca %FSM 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %i = alloca i32 
  %rcc.tmp.1 = getelementptr %FSM, ptr %fsm, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr %FSM, ptr %fsm, i32 0, i32 1
  store i32 -1, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr %FSM, ptr %fsm, i32 0, i32 2
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 200
  br i1 %rcc.tmp.9, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = getelementptr [200 x %Transition], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Transition, ptr %rcc.tmp.12, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Transition, ptr %rcc.tmp.12, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr %Transition, ptr %rcc.tmp.12, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Transition, ptr %rcc.tmp.12, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %Transition, ptr %rcc.tmp.12, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.23, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.26 = getelementptr %FSM, ptr %fsm, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr %FSM, ptr %fsm, i32 0, i32 4
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.31 = load i32, ptr %fill.idx.2
  %rcc.tmp.32 = icmp slt i32 %rcc.tmp.31, 100
  br i1 %rcc.tmp.32, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.34 = load i32, ptr %fill.idx.2
  %rcc.tmp.35 = getelementptr [100 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.34
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.37, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.40 = getelementptr %FSM, ptr %fsm, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr %FSM, ptr %fsm, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr %FSM, ptr %fsm, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr %FSM, ptr %fsm, i32 0, i32 8
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.49 = load i32, ptr %fill.idx.3
  %rcc.tmp.50 = icmp slt i32 %rcc.tmp.49, 50
  br i1 %rcc.tmp.50, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.52 = load i32, ptr %fill.idx.3
  %rcc.tmp.53 = getelementptr [50 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.55, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.58 = getelementptr %FSM, ptr %fsm, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr %FSM, ptr %fsm, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.60
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 50
  br i1 %rcc.tmp.65, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.68 = getelementptr %FSM, ptr %fsm, i32 0, i32 8
  %rcc.tmp.69 = load i32, ptr %i
  %rcc.tmp.70 = getelementptr [50 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.69
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.76 = getelementptr %FSM, ptr %fsm, i32 0, i32 8
  %rcc.tmp.77 = add i32 0, 0
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.77
  store i32 1, ptr %rcc.tmp.78
  %rcc.tmp.80 = bitcast %FSM* %ret.slot to i8*
  %rcc.tmp.81 = bitcast %FSM* %fsm to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.80, i8* %rcc.tmp.81, i32 4632, i1 0)
  ret void
}
define i1 @add_transition.(%FSM* %fsm.tmp, i32 %from.tmp, i32 %event.tmp, i32 %to.tmp, i32 %action.tmp, i32 %condition.tmp) {
entry:
  %fsm..tmp = alloca %FSM* 
  %from..tmp = alloca i32 
  %event..tmp = alloca i32 
  %to..tmp = alloca i32 
  %action..tmp = alloca i32 
  %condition..tmp = alloca i32 
  store %FSM* %fsm.tmp, ptr %fsm..tmp
  store i32 %from.tmp, ptr %from..tmp
  store i32 %event.tmp, ptr %event..tmp
  store i32 %to.tmp, ptr %to..tmp
  store i32 %action.tmp, ptr %action..tmp
  store i32 %condition.tmp, ptr %condition..tmp
  %rcc.tmp.7 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.8 = getelementptr %FSM, ptr %rcc.tmp.7, i32 0, i32 3
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = icmp sge i32 %rcc.tmp.9, 200
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.15 = getelementptr %FSM, ptr %rcc.tmp.14, i32 0, i32 2
  %rcc.tmp.16 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.17 = getelementptr %FSM, ptr %rcc.tmp.16, i32 0, i32 3
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [200 x %Transition], ptr %rcc.tmp.15, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %Transition, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %from..tmp
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = getelementptr %Transition, ptr %rcc.tmp.20, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %event..tmp
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = getelementptr %Transition, ptr %rcc.tmp.20, i32 0, i32 2
  %rcc.tmp.28 = load i32, ptr %to..tmp
  store i32 %rcc.tmp.28, ptr %rcc.tmp.27
  %rcc.tmp.30 = getelementptr %Transition, ptr %rcc.tmp.20, i32 0, i32 3
  %rcc.tmp.31 = load i32, ptr %action..tmp
  store i32 %rcc.tmp.31, ptr %rcc.tmp.30
  %rcc.tmp.33 = getelementptr %Transition, ptr %rcc.tmp.20, i32 0, i32 4
  %rcc.tmp.34 = load i32, ptr %condition..tmp
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.37 = getelementptr %FSM, ptr %rcc.tmp.36, i32 0, i32 3
  %rcc.tmp.38 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.39 = getelementptr %FSM, ptr %rcc.tmp.38, i32 0, i32 3
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %rcc.tmp.37
  ret i1 1
}
define i1 @fsm_add_event.(%FSM* %fsm.tmp, i32 %event.tmp) {
entry:
  %fsm..tmp = alloca %FSM* 
  %event..tmp = alloca i32 
  store %FSM* %fsm.tmp, ptr %fsm..tmp
  store i32 %event.tmp, ptr %event..tmp
  %rcc.tmp.3 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.4 = getelementptr %FSM, ptr %rcc.tmp.3, i32 0, i32 7
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = icmp sge i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.10 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.11 = getelementptr %FSM, ptr %rcc.tmp.10, i32 0, i32 4
  %rcc.tmp.12 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.13 = getelementptr %FSM, ptr %rcc.tmp.12, i32 0, i32 6
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [100 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.17 = load i32, ptr %event..tmp
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.20 = getelementptr %FSM, ptr %rcc.tmp.19, i32 0, i32 6
  %rcc.tmp.21 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.22 = getelementptr %FSM, ptr %rcc.tmp.21, i32 0, i32 6
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 1
  %rcc.tmp.25 = srem i32 %rcc.tmp.24, 100
  store i32 %rcc.tmp.25, ptr %rcc.tmp.20
  %rcc.tmp.27 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.28 = getelementptr %FSM, ptr %rcc.tmp.27, i32 0, i32 7
  %rcc.tmp.29 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.30 = getelementptr %FSM, ptr %rcc.tmp.29, i32 0, i32 7
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.28
  ret i1 1
}
define i32 @fsm_get_event.(%FSM* %fsm.tmp) {
entry:
  %fsm..tmp = alloca %FSM* 
  %event = alloca i32 
  store %FSM* %fsm.tmp, ptr %fsm..tmp
  %rcc.tmp.2 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.3 = getelementptr %FSM, ptr %rcc.tmp.2, i32 0, i32 7
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = icmp sle i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 -1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.10 = getelementptr %FSM, ptr %rcc.tmp.9, i32 0, i32 4
  %rcc.tmp.11 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.12 = getelementptr %FSM, ptr %rcc.tmp.11, i32 0, i32 5
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 0
  %rcc.tmp.15 = getelementptr [100 x i32], ptr %rcc.tmp.10, i32 0, i32 %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %event
  %rcc.tmp.18 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.19 = getelementptr %FSM, ptr %rcc.tmp.18, i32 0, i32 5
  %rcc.tmp.20 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.21 = getelementptr %FSM, ptr %rcc.tmp.20, i32 0, i32 5
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 1
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 100
  store i32 %rcc.tmp.24, ptr %rcc.tmp.19
  %rcc.tmp.26 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.27 = getelementptr %FSM, ptr %rcc.tmp.26, i32 0, i32 7
  %rcc.tmp.28 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.29 = getelementptr %FSM, ptr %rcc.tmp.28, i32 0, i32 7
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  %rcc.tmp.31 = sub i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %rcc.tmp.27
  %rcc.tmp.33 = load i32, ptr %event
  ret i32 %rcc.tmp.33
}
define i1 @evaluate_condition.(i32 %condition.tmp, i32 %current_state.tmp, i32 %event.tmp, i32 %context.tmp) {
entry:
  %condition..tmp = alloca i32 
  %current_state..tmp = alloca i32 
  %event..tmp = alloca i32 
  %context..tmp = alloca i32 
  %temp1 = alloca i32 
  %temp2 = alloca i32 
  store i32 %condition.tmp, ptr %condition..tmp
  store i32 %current_state.tmp, ptr %current_state..tmp
  store i32 %event.tmp, ptr %event..tmp
  store i32 %context.tmp, ptr %context..tmp
  %rcc.tmp.5 = load i32, ptr %condition..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  ret i1 1
if.else:
  %rcc.tmp.9 = load i32, ptr %condition..tmp
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 1
  br i1 %rcc.tmp.10, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.12 = load i32, ptr %current_state..tmp
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 1
  ret i1 %rcc.tmp.13
if.else.2:
  %rcc.tmp.15 = load i32, ptr %condition..tmp
  %rcc.tmp.16 = icmp eq i32 %rcc.tmp.15, 2
  br i1 %rcc.tmp.16, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.18 = load i32, ptr %event..tmp
  %rcc.tmp.19 = icmp sge i32 %rcc.tmp.18, 1
  br i1 %rcc.tmp.19, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.21 = load i32, ptr %event..tmp
  %rcc.tmp.22 = icmp sle i32 %rcc.tmp.21, 2
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %if.then.3], [%rcc.tmp.22, %and.rhs]
  ret i1 %rcc.tmp.24
if.else.3:
  %rcc.tmp.26 = load i32, ptr %condition..tmp
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.26, 3
  br i1 %rcc.tmp.27, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.29 = load i32, ptr %context..tmp
  %rcc.tmp.30 = icmp sgt i32 %rcc.tmp.29, 0
  br i1 %rcc.tmp.30, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.32 = load i32, ptr %context..tmp
  %rcc.tmp.33 = srem i32 %rcc.tmp.32, 2
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.36 = phi i1 [0, %if.then.4], [%rcc.tmp.34, %and.rhs.2]
  ret i1 %rcc.tmp.36
if.else.4:
  %rcc.tmp.38 = load i32, ptr %condition..tmp
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, 4
  br i1 %rcc.tmp.39, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.41 = load i32, ptr %current_state..tmp
  %rcc.tmp.42 = icmp ne i32 %rcc.tmp.41, 4
  br i1 %rcc.tmp.42, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.44 = load i32, ptr %event..tmp
  %rcc.tmp.45 = icmp ne i32 %rcc.tmp.44, 3
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.47 = phi i1 [0, %if.then.5], [%rcc.tmp.45, %and.rhs.3]
  ret i1 %rcc.tmp.47
if.else.5:
  %rcc.tmp.49 = load i32, ptr %condition..tmp
  %rcc.tmp.50 = icmp eq i32 %rcc.tmp.49, 5
  br i1 %rcc.tmp.50, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.52 = load i32, ptr %current_state..tmp
  %rcc.tmp.53 = icmp eq i32 %rcc.tmp.52, 2
  br i1 %rcc.tmp.53, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.55 = load i32, ptr %event..tmp
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.55, 2
  br i1 %rcc.tmp.56, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.58 = load i32, ptr %context..tmp
  %rcc.tmp.59 = icmp sgt i32 %rcc.tmp.58, 10
  ret i1 %rcc.tmp.59
if.else.8:
  %rcc.tmp.61 = load i32, ptr %event..tmp
  %rcc.tmp.62 = icmp eq i32 %rcc.tmp.61, 3
  br i1 %rcc.tmp.62, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.64 = load i32, ptr %context..tmp
  %rcc.tmp.65 = icmp slt i32 %rcc.tmp.64, 5
  ret i1 %rcc.tmp.65
if.else.9:
  %rcc.tmp.67 = load i32, ptr %context..tmp
  %rcc.tmp.68 = srem i32 %rcc.tmp.67, 3
  %rcc.tmp.69 = icmp eq i32 %rcc.tmp.68, 0
  ret i1 %rcc.tmp.69
if.merge.9:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.73 = load i32, ptr %current_state..tmp
  %rcc.tmp.74 = icmp eq i32 %rcc.tmp.73, 3
  br i1 %rcc.tmp.74, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.76 = load i32, ptr %event..tmp
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 4
  br i1 %rcc.tmp.77, label %sc.merge.4, label %or.rhs
or.rhs:
  %rcc.tmp.79 = load i32, ptr %event..tmp
  %rcc.tmp.80 = icmp eq i32 %rcc.tmp.79, 5
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.82 = phi i1 [1, %if.then.10], [%rcc.tmp.80, %or.rhs]
  ret i1 %rcc.tmp.82
if.else.10:
  ret i1 0
if.merge.10:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  %rcc.tmp.87 = load i32, ptr %condition..tmp
  %rcc.tmp.88 = icmp eq i32 %rcc.tmp.87, 6
  br i1 %rcc.tmp.88, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.90 = load i32, ptr %current_state..tmp
  %rcc.tmp.91 = mul i32 %rcc.tmp.90, 3
  %rcc.tmp.92 = load i32, ptr %event..tmp
  %rcc.tmp.93 = add i32 %rcc.tmp.91, %rcc.tmp.92
  store i32 %rcc.tmp.93, ptr %temp1
  %rcc.tmp.95 = load i32, ptr %context..tmp
  %rcc.tmp.96 = sdiv i32 %rcc.tmp.95, 2
  store i32 %rcc.tmp.96, ptr %temp2
  %rcc.tmp.98 = load i32, ptr %temp1
  %rcc.tmp.99 = load i32, ptr %temp2
  %rcc.tmp.100 = icmp sgt i32 %rcc.tmp.98, %rcc.tmp.99
  br i1 %rcc.tmp.100, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.102 = load i32, ptr %current_state..tmp
  %rcc.tmp.103 = icmp slt i32 %rcc.tmp.102, 6
  br i1 %rcc.tmp.103, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.105 = load i32, ptr %event..tmp
  %rcc.tmp.106 = icmp ne i32 %rcc.tmp.105, 8
  ret i1 %rcc.tmp.106
if.else.13:
  %rcc.tmp.108 = load i32, ptr %event..tmp
  %rcc.tmp.109 = icmp eq i32 %rcc.tmp.108, 7
  br i1 %rcc.tmp.109, label %sc.merge.5, label %or.rhs.2
or.rhs.2:
  %rcc.tmp.111 = load i32, ptr %event..tmp
  %rcc.tmp.112 = icmp eq i32 %rcc.tmp.111, 9
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.114 = phi i1 [1, %if.else.13], [%rcc.tmp.112, %or.rhs.2]
  ret i1 %rcc.tmp.114
if.merge.13:
  br label %if.merge.12
if.else.12:
  %rcc.tmp.117 = load i32, ptr %temp1
  %rcc.tmp.118 = srem i32 %rcc.tmp.117, 4
  %rcc.tmp.119 = icmp eq i32 %rcc.tmp.118, 0
  br i1 %rcc.tmp.119, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.121 = load i32, ptr %context..tmp
  %rcc.tmp.122 = load i32, ptr %temp1
  %rcc.tmp.123 = icmp sgt i32 %rcc.tmp.121, %rcc.tmp.122
  ret i1 %rcc.tmp.123
if.else.14:
  %rcc.tmp.125 = load i32, ptr %temp1
  %rcc.tmp.126 = srem i32 %rcc.tmp.125, 4
  %rcc.tmp.127 = icmp eq i32 %rcc.tmp.126, 1
  br i1 %rcc.tmp.127, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.129 = load i32, ptr %context..tmp
  %rcc.tmp.130 = load i32, ptr %temp1
  %rcc.tmp.131 = icmp slt i32 %rcc.tmp.129, %rcc.tmp.130
  ret i1 %rcc.tmp.131
if.else.15:
  %rcc.tmp.133 = load i32, ptr %temp1
  %rcc.tmp.134 = srem i32 %rcc.tmp.133, 4
  %rcc.tmp.135 = icmp eq i32 %rcc.tmp.134, 2
  br i1 %rcc.tmp.135, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.137 = load i32, ptr %context..tmp
  %rcc.tmp.138 = load i32, ptr %temp1
  %rcc.tmp.139 = icmp eq i32 %rcc.tmp.137, %rcc.tmp.138
  ret i1 %rcc.tmp.139
if.else.16:
  %rcc.tmp.141 = load i32, ptr %context..tmp
  %rcc.tmp.142 = load i32, ptr %temp1
  %rcc.tmp.143 = icmp ne i32 %rcc.tmp.141, %rcc.tmp.142
  ret i1 %rcc.tmp.143
if.merge.16:
  br label %if.merge.15
if.merge.15:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.else.11:
  %rcc.tmp.149 = load i32, ptr %condition..tmp
  %rcc.tmp.150 = load i32, ptr %current_state..tmp
  %rcc.tmp.151 = add i32 %rcc.tmp.149, %rcc.tmp.150
  %rcc.tmp.152 = load i32, ptr %event..tmp
  %rcc.tmp.153 = add i32 %rcc.tmp.151, %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %context..tmp
  %rcc.tmp.155 = add i32 %rcc.tmp.153, %rcc.tmp.154
  %rcc.tmp.156 = srem i32 %rcc.tmp.155, 7
  %rcc.tmp.157 = icmp sgt i32 %rcc.tmp.156, 3
  ret i1 %rcc.tmp.157
if.merge.11:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret i1 undef
}
define i32 @execute_action.(i32 %action_id.tmp, %FSM* %fsm.tmp, i32* %context.tmp) {
entry:
  %action_id..tmp = alloca i32 
  %fsm..tmp = alloca %FSM* 
  %context..tmp = alloca i32* 
  %temp = alloca i32 
  %i = alloca i32 
  %result = alloca i32 
  %i.2 = alloca i32 
  store i32 %action_id.tmp, ptr %action_id..tmp
  store %FSM* %fsm.tmp, ptr %fsm..tmp
  store i32* %context.tmp, ptr %context..tmp
  %rcc.tmp.4 = load i32, ptr %action_id..tmp
  %rcc.tmp.5 = icmp eq i32 %rcc.tmp.4, 0
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  %rcc.tmp.8 = load i32, ptr %action_id..tmp
  %rcc.tmp.9 = icmp eq i32 %rcc.tmp.8, 1
  br i1 %rcc.tmp.9, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.11 = load i32*, ptr %context..tmp
  %rcc.tmp.12 = load i32*, ptr %context..tmp
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.11
  ret i32 1
if.else.2:
  %rcc.tmp.17 = load i32, ptr %action_id..tmp
  %rcc.tmp.18 = icmp eq i32 %rcc.tmp.17, 2
  br i1 %rcc.tmp.18, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.20 = load i32*, ptr %context..tmp
  %rcc.tmp.21 = load i32*, ptr %context..tmp
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = mul i32 %rcc.tmp.22, 2
  store i32 %rcc.tmp.23, ptr %rcc.tmp.20
  ret i32 2
if.else.3:
  %rcc.tmp.26 = load i32, ptr %action_id..tmp
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.26, 3
  br i1 %rcc.tmp.27, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.29 = load i32*, ptr %context..tmp
  %rcc.tmp.30 = load i32*, ptr %context..tmp
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = sub i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.29
  %rcc.tmp.34 = load i32*, ptr %context..tmp
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 0
  br i1 %rcc.tmp.36, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.38 = load i32*, ptr %context..tmp
  store i32 0, ptr %rcc.tmp.38
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  ret i32 3
if.else.4:
  %rcc.tmp.43 = load i32, ptr %action_id..tmp
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.43, 4
  br i1 %rcc.tmp.44, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.46 = load i32*, ptr %context..tmp
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  store i32 %rcc.tmp.47, ptr %temp
  %rcc.tmp.49 = load i32*, ptr %context..tmp
  %rcc.tmp.50 = load i32, ptr %temp
  %rcc.tmp.51 = mul i32 %rcc.tmp.50, 3
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 17
  %rcc.tmp.53 = srem i32 %rcc.tmp.52, 100
  store i32 %rcc.tmp.53, ptr %rcc.tmp.49
  %rcc.tmp.55 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.56 = getelementptr %FSM, ptr %rcc.tmp.55, i32 0, i32 9
  %rcc.tmp.57 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.58 = getelementptr %FSM, ptr %rcc.tmp.57, i32 0, i32 9
  %rcc.tmp.59 = load i32, ptr %rcc.tmp.58
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 1
  store i32 %rcc.tmp.60, ptr %rcc.tmp.56
  ret i32 4
if.else.6:
  %rcc.tmp.63 = load i32, ptr %action_id..tmp
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 5
  br i1 %rcc.tmp.64, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.66 = load i32*, ptr %context..tmp
  %rcc.tmp.67 = load i32, ptr %rcc.tmp.66
  %rcc.tmp.68 = icmp sgt i32 %rcc.tmp.67, 50
  br i1 %rcc.tmp.68, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.70 = load i32*, ptr %context..tmp
  %rcc.tmp.71 = load i32*, ptr %context..tmp
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  %rcc.tmp.73 = sdiv i32 %rcc.tmp.72, 2
  store i32 %rcc.tmp.73, ptr %rcc.tmp.70
  %rcc.tmp.75 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.76 = call i1 @fsm_add_event.(%FSM* %rcc.tmp.75, i32 5)
  br label %if.merge.8
if.else.8:
  %rcc.tmp.78 = load i32*, ptr %context..tmp
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = icmp sgt i32 %rcc.tmp.79, 25
  br i1 %rcc.tmp.80, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.82 = load i32*, ptr %context..tmp
  %rcc.tmp.83 = load i32*, ptr %context..tmp
  %rcc.tmp.84 = load i32, ptr %rcc.tmp.83
  %rcc.tmp.85 = mul i32 %rcc.tmp.84, 3
  store i32 %rcc.tmp.85, ptr %rcc.tmp.82
  %rcc.tmp.87 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.88 = call i1 @fsm_add_event.(%FSM* %rcc.tmp.87, i32 1)
  br label %if.merge.9
if.else.9:
  %rcc.tmp.90 = load i32*, ptr %context..tmp
  %rcc.tmp.91 = load i32*, ptr %context..tmp
  %rcc.tmp.92 = load i32, ptr %rcc.tmp.91
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 10
  store i32 %rcc.tmp.93, ptr %rcc.tmp.90
  %rcc.tmp.95 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.96 = call i1 @fsm_add_event.(%FSM* %rcc.tmp.95, i32 2)
  br label %if.merge.9
if.merge.9:
  br label %if.merge.8
if.merge.8:
  ret i32 5
if.else.7:
  %rcc.tmp.100 = load i32, ptr %action_id..tmp
  %rcc.tmp.101 = icmp eq i32 %rcc.tmp.100, 6
  br i1 %rcc.tmp.101, label %if.then.10, label %if.else.10
if.then.10:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.105 = load i32, ptr %i
  %rcc.tmp.106 = icmp slt i32 %rcc.tmp.105, 5
  br i1 %rcc.tmp.106, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = srem i32 %rcc.tmp.109, 2
  %rcc.tmp.111 = icmp eq i32 %rcc.tmp.110, 0
  br i1 %rcc.tmp.111, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.113 = load i32*, ptr %context..tmp
  %rcc.tmp.114 = load i32*, ptr %context..tmp
  %rcc.tmp.115 = load i32, ptr %rcc.tmp.114
  %rcc.tmp.116 = load i32, ptr %i
  %rcc.tmp.117 = add i32 %rcc.tmp.115, %rcc.tmp.116
  store i32 %rcc.tmp.117, ptr %rcc.tmp.113
  br label %if.merge.11
if.else.11:
  %rcc.tmp.120 = load i32*, ptr %context..tmp
  %rcc.tmp.121 = load i32*, ptr %context..tmp
  %rcc.tmp.122 = load i32, ptr %rcc.tmp.121
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = sub i32 %rcc.tmp.122, %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %rcc.tmp.120
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.127 = load i32*, ptr %context..tmp
  %rcc.tmp.128 = load i32, ptr %rcc.tmp.127
  %rcc.tmp.129 = srem i32 %rcc.tmp.128, 3
  %rcc.tmp.130 = icmp eq i32 %rcc.tmp.129, 0
  br i1 %rcc.tmp.130, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.132 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = add i32 1, %rcc.tmp.133
  %rcc.tmp.135 = call i1 @fsm_add_event.(%FSM* %rcc.tmp.132, i32 %rcc.tmp.134)
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond
while.end:
  ret i32 6
if.else.10:
  %rcc.tmp.143 = load i32, ptr %action_id..tmp
  store i32 %rcc.tmp.143, ptr %result
  store i32 0, ptr %i.2
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.147 = load i32, ptr %i.2
  %rcc.tmp.148 = load i32, ptr %action_id..tmp
  %rcc.tmp.149 = srem i32 %rcc.tmp.148, 10
  %rcc.tmp.150 = icmp slt i32 %rcc.tmp.147, %rcc.tmp.149
  br i1 %rcc.tmp.150, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.153 = load i32, ptr %result
  %rcc.tmp.154 = mul i32 %rcc.tmp.153, 2
  %rcc.tmp.155 = load i32*, ptr %context..tmp
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.155
  %rcc.tmp.157 = add i32 %rcc.tmp.154, %rcc.tmp.156
  store i32 %rcc.tmp.157, ptr %result
  %rcc.tmp.159 = load i32, ptr %result
  %rcc.tmp.160 = icmp sgt i32 %rcc.tmp.159, 1000
  br i1 %rcc.tmp.160, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.162 = load i32, ptr %result
  %rcc.tmp.163 = srem i32 %rcc.tmp.162, 1000
  store i32 %rcc.tmp.163, ptr %result
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.167 = load i32, ptr %i.2
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  store i32 %rcc.tmp.168, ptr %i.2
  br label %while.cond.2
while.end.2:
  %rcc.tmp.171 = load i32*, ptr %context..tmp
  %rcc.tmp.172 = load i32, ptr %result
  %rcc.tmp.173 = srem i32 %rcc.tmp.172, 100
  store i32 %rcc.tmp.173, ptr %rcc.tmp.171
  %rcc.tmp.175 = load i32, ptr %action_id..tmp
  ret i32 %rcc.tmp.175
if.merge.10:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  ret i32 undef
}
define i1 @fsm_step.(%FSM* %fsm.tmp, i32* %context.tmp) {
entry:
  %fsm..tmp = alloca %FSM* 
  %context..tmp = alloca i32* 
  %event = alloca i32 
  %i = alloca i32 
  %transition = alloca %Transition* 
  store %FSM* %fsm.tmp, ptr %fsm..tmp
  store i32* %context.tmp, ptr %context..tmp
  %rcc.tmp.3 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.4 = call i32 @fsm_get_event.(%FSM* %rcc.tmp.3)
  store i32 %rcc.tmp.4, ptr %event
  %rcc.tmp.6 = load i32, ptr %event
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, -1
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  ret i1 0
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.15 = getelementptr %FSM, ptr %rcc.tmp.14, i32 0, i32 3
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.16
  br i1 %rcc.tmp.17, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.20 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.21 = getelementptr %FSM, ptr %rcc.tmp.20, i32 0, i32 2
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [200 x %Transition], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.23
  store %Transition* %rcc.tmp.24, ptr %transition
  %rcc.tmp.26 = load %Transition*, ptr %transition
  %rcc.tmp.27 = getelementptr %Transition, ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.30 = getelementptr %FSM, ptr %rcc.tmp.29, i32 0, i32 0
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.28, %rcc.tmp.31
  br i1 %rcc.tmp.32, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.34 = load %Transition*, ptr %transition
  %rcc.tmp.35 = getelementptr %Transition, ptr %rcc.tmp.34, i32 0, i32 1
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %event
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.36, %rcc.tmp.37
  br label %sc.merge
sc.merge:
  %rcc.tmp.40 = phi i1 [0, %while.body], [%rcc.tmp.38, %and.rhs]
  br i1 %rcc.tmp.40, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.42 = load %Transition*, ptr %transition
  %rcc.tmp.43 = getelementptr %Transition, ptr %rcc.tmp.42, i32 0, i32 4
  %rcc.tmp.44 = load i32, ptr %rcc.tmp.43
  %rcc.tmp.45 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.46 = getelementptr %FSM, ptr %rcc.tmp.45, i32 0, i32 0
  %rcc.tmp.47 = load i32, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %event
  %rcc.tmp.49 = load i32*, ptr %context..tmp
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  %rcc.tmp.51 = call i1 @evaluate_condition.(i32 %rcc.tmp.44, i32 %rcc.tmp.47, i32 %rcc.tmp.48, i32 %rcc.tmp.50)
  br i1 %rcc.tmp.51, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.53 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.54 = getelementptr %FSM, ptr %rcc.tmp.53, i32 0, i32 1
  %rcc.tmp.55 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.56 = getelementptr %FSM, ptr %rcc.tmp.55, i32 0, i32 0
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %rcc.tmp.54
  %rcc.tmp.59 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.60 = getelementptr %FSM, ptr %rcc.tmp.59, i32 0, i32 0
  %rcc.tmp.61 = load %Transition*, ptr %transition
  %rcc.tmp.62 = getelementptr %Transition, ptr %rcc.tmp.61, i32 0, i32 2
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %rcc.tmp.60
  %rcc.tmp.65 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.66 = getelementptr %FSM, ptr %rcc.tmp.65, i32 0, i32 8
  %rcc.tmp.67 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.68 = getelementptr %FSM, ptr %rcc.tmp.67, i32 0, i32 0
  %rcc.tmp.69 = load i32, ptr %rcc.tmp.68
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [50 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.73 = getelementptr %FSM, ptr %rcc.tmp.72, i32 0, i32 8
  %rcc.tmp.74 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.75 = getelementptr %FSM, ptr %rcc.tmp.74, i32 0, i32 0
  %rcc.tmp.76 = load i32, ptr %rcc.tmp.75
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 0
  %rcc.tmp.78 = getelementptr [50 x i32], ptr %rcc.tmp.73, i32 0, i32 %rcc.tmp.77
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %rcc.tmp.71
  %rcc.tmp.82 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.83 = getelementptr %FSM, ptr %rcc.tmp.82, i32 0, i32 10
  %rcc.tmp.84 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.85 = getelementptr %FSM, ptr %rcc.tmp.84, i32 0, i32 10
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = add i32 %rcc.tmp.86, 1
  store i32 %rcc.tmp.87, ptr %rcc.tmp.83
  %rcc.tmp.89 = load %Transition*, ptr %transition
  %rcc.tmp.90 = getelementptr %Transition, ptr %rcc.tmp.89, i32 0, i32 3
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.93 = load i32*, ptr %context..tmp
  %rcc.tmp.94 = call i32 @execute_action.(i32 %rcc.tmp.91, %FSM* %rcc.tmp.92, i32* %rcc.tmp.93)
  ret i1 1
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.103 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.104 = getelementptr %FSM, ptr %rcc.tmp.103, i32 0, i32 9
  %rcc.tmp.105 = load %FSM*, ptr %fsm..tmp
  %rcc.tmp.106 = getelementptr %FSM, ptr %rcc.tmp.105, i32 0, i32 9
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %rcc.tmp.104
  ret i1 0
}
define void @init_protocol_parser.(%ProtocolParser* sret(%ProtocolParser) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %rcc.tmp.1 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 1000
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [1000 x i32], ptr %rcc.tmp.3, i32 0, i32 %rcc.tmp.9
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.15 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr %ProtocolParser, ptr %ret.slot, i32 0, i32 6
  store i32 1, ptr %rcc.tmp.23
  ret void
}
define i32 @parse_packet.(%ProtocolParser* %parser.tmp, i32 %packet_type.tmp, i32 %data.tmp, i32 %seq.tmp) {
entry:
  %parser..tmp = alloca %ProtocolParser* 
  %packet_type..tmp = alloca i32 
  %data..tmp = alloca i32 
  %seq..tmp = alloca i32 
  store %ProtocolParser* %parser.tmp, ptr %parser..tmp
  store i32 %packet_type.tmp, ptr %packet_type..tmp
  store i32 %data.tmp, ptr %data..tmp
  store i32 %seq.tmp, ptr %seq..tmp
  %rcc.tmp.5 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.6 = getelementptr %ProtocolParser, ptr %rcc.tmp.5, i32 0, i32 0
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = icmp eq i32 %rcc.tmp.7, 0
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %packet_type..tmp
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.13 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.14 = getelementptr %ProtocolParser, ptr %rcc.tmp.13, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.14
  %rcc.tmp.16 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.17 = getelementptr %ProtocolParser, ptr %rcc.tmp.16, i32 0, i32 6
  %rcc.tmp.18 = load i32, ptr %seq..tmp
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %rcc.tmp.17
  ret i32 1
if.else.2:
  %rcc.tmp.22 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.23 = getelementptr %ProtocolParser, ptr %rcc.tmp.22, i32 0, i32 4
  %rcc.tmp.24 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.25 = getelementptr %ProtocolParser, ptr %rcc.tmp.24, i32 0, i32 4
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 1
  store i32 %rcc.tmp.27, ptr %rcc.tmp.23
  %rcc.tmp.29 = sub i32 0, 1
  ret i32 %rcc.tmp.29
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.32 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.33 = getelementptr %ProtocolParser, ptr %rcc.tmp.32, i32 0, i32 0
  %rcc.tmp.34 = load i32, ptr %rcc.tmp.33
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.34, 1
  br i1 %rcc.tmp.35, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.37 = load i32, ptr %packet_type..tmp
  %rcc.tmp.38 = icmp eq i32 %rcc.tmp.37, 2
  br i1 %rcc.tmp.38, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.40 = load i32, ptr %seq..tmp
  %rcc.tmp.41 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.42 = getelementptr %ProtocolParser, ptr %rcc.tmp.41, i32 0, i32 6
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = icmp eq i32 %rcc.tmp.40, %rcc.tmp.43
  br label %sc.merge
sc.merge:
  %rcc.tmp.46 = phi i1 [0, %if.then.3], [%rcc.tmp.44, %and.rhs]
  br i1 %rcc.tmp.46, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.48 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.49 = getelementptr %ProtocolParser, ptr %rcc.tmp.48, i32 0, i32 0
  store i32 2, ptr %rcc.tmp.49
  %rcc.tmp.51 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.52 = getelementptr %ProtocolParser, ptr %rcc.tmp.51, i32 0, i32 6
  %rcc.tmp.53 = load i32, ptr %seq..tmp
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %rcc.tmp.52
  ret i32 2
if.else.4:
  %rcc.tmp.57 = load i32, ptr %packet_type..tmp
  %rcc.tmp.58 = icmp eq i32 %rcc.tmp.57, 5
  br i1 %rcc.tmp.58, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.60 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.61 = getelementptr %ProtocolParser, ptr %rcc.tmp.60, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.61
  ret i32 0
if.else.5:
  %rcc.tmp.64 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.65 = getelementptr %ProtocolParser, ptr %rcc.tmp.64, i32 0, i32 4
  %rcc.tmp.66 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.67 = getelementptr %ProtocolParser, ptr %rcc.tmp.66, i32 0, i32 4
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %rcc.tmp.65
  %rcc.tmp.71 = sub i32 0, 1
  ret i32 %rcc.tmp.71
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.75 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.76 = getelementptr %ProtocolParser, ptr %rcc.tmp.75, i32 0, i32 0
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.76
  %rcc.tmp.78 = icmp eq i32 %rcc.tmp.77, 2
  br i1 %rcc.tmp.78, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.80 = load i32, ptr %packet_type..tmp
  %rcc.tmp.81 = icmp eq i32 %rcc.tmp.80, 3
  br i1 %rcc.tmp.81, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.83 = load i32, ptr %seq..tmp
  %rcc.tmp.84 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.85 = getelementptr %ProtocolParser, ptr %rcc.tmp.84, i32 0, i32 6
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  %rcc.tmp.87 = icmp eq i32 %rcc.tmp.83, %rcc.tmp.86
  br i1 %rcc.tmp.87, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.89 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.90 = getelementptr %ProtocolParser, ptr %rcc.tmp.89, i32 0, i32 2
  %rcc.tmp.91 = load i32, ptr %rcc.tmp.90
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.91, 1000
  br i1 %rcc.tmp.92, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.94 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.95 = getelementptr %ProtocolParser, ptr %rcc.tmp.94, i32 0, i32 1
  %rcc.tmp.96 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.97 = getelementptr %ProtocolParser, ptr %rcc.tmp.96, i32 0, i32 2
  %rcc.tmp.98 = load i32, ptr %rcc.tmp.97
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [1000 x i32], ptr %rcc.tmp.95, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %data..tmp
  store i32 %rcc.tmp.101, ptr %rcc.tmp.100
  %rcc.tmp.103 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.104 = getelementptr %ProtocolParser, ptr %rcc.tmp.103, i32 0, i32 2
  %rcc.tmp.105 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.106 = getelementptr %ProtocolParser, ptr %rcc.tmp.105, i32 0, i32 2
  %rcc.tmp.107 = load i32, ptr %rcc.tmp.106
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 1
  store i32 %rcc.tmp.108, ptr %rcc.tmp.104
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.112 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.113 = getelementptr %ProtocolParser, ptr %rcc.tmp.112, i32 0, i32 6
  %rcc.tmp.114 = load i32, ptr %seq..tmp
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %rcc.tmp.113
  %rcc.tmp.117 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.118 = getelementptr %ProtocolParser, ptr %rcc.tmp.117, i32 0, i32 3
  %rcc.tmp.119 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.120 = getelementptr %ProtocolParser, ptr %rcc.tmp.119, i32 0, i32 3
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  %rcc.tmp.122 = add i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.122, ptr %rcc.tmp.118
  ret i32 3
if.else.8:
  %rcc.tmp.125 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.126 = getelementptr %ProtocolParser, ptr %rcc.tmp.125, i32 0, i32 4
  %rcc.tmp.127 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.128 = getelementptr %ProtocolParser, ptr %rcc.tmp.127, i32 0, i32 4
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.128
  %rcc.tmp.130 = add i32 %rcc.tmp.129, 1
  store i32 %rcc.tmp.130, ptr %rcc.tmp.126
  ret i32 4
if.merge.8:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.134 = load i32, ptr %packet_type..tmp
  %rcc.tmp.135 = icmp eq i32 %rcc.tmp.134, 4
  br i1 %rcc.tmp.135, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.137 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.138 = getelementptr %ProtocolParser, ptr %rcc.tmp.137, i32 0, i32 0
  store i32 3, ptr %rcc.tmp.138
  ret i32 5
if.else.10:
  %rcc.tmp.141 = load i32, ptr %packet_type..tmp
  %rcc.tmp.142 = icmp eq i32 %rcc.tmp.141, 6
  br i1 %rcc.tmp.142, label %if.then.11, label %if.else.11
if.then.11:
  ret i32 6
if.else.11:
  %rcc.tmp.145 = load i32, ptr %packet_type..tmp
  %rcc.tmp.146 = icmp eq i32 %rcc.tmp.145, 5
  br i1 %rcc.tmp.146, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.148 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.149 = getelementptr %ProtocolParser, ptr %rcc.tmp.148, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.149
  %rcc.tmp.151 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.152 = getelementptr %ProtocolParser, ptr %rcc.tmp.151, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.152
  ret i32 0
if.else.12:
  %rcc.tmp.155 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.156 = getelementptr %ProtocolParser, ptr %rcc.tmp.155, i32 0, i32 4
  %rcc.tmp.157 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.158 = getelementptr %ProtocolParser, ptr %rcc.tmp.157, i32 0, i32 4
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.158
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.160, ptr %rcc.tmp.156
  %rcc.tmp.162 = sub i32 0, 1
  ret i32 %rcc.tmp.162
if.merge.12:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  %rcc.tmp.168 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.169 = getelementptr %ProtocolParser, ptr %rcc.tmp.168, i32 0, i32 0
  %rcc.tmp.170 = load i32, ptr %rcc.tmp.169
  %rcc.tmp.171 = icmp eq i32 %rcc.tmp.170, 3
  br i1 %rcc.tmp.171, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.173 = load i32, ptr %packet_type..tmp
  %rcc.tmp.174 = icmp eq i32 %rcc.tmp.173, 2
  br i1 %rcc.tmp.174, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.176 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.177 = getelementptr %ProtocolParser, ptr %rcc.tmp.176, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.177
  %rcc.tmp.179 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.180 = getelementptr %ProtocolParser, ptr %rcc.tmp.179, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.180
  ret i32 7
if.else.14:
  %rcc.tmp.183 = load i32, ptr %packet_type..tmp
  %rcc.tmp.184 = icmp eq i32 %rcc.tmp.183, 5
  br i1 %rcc.tmp.184, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.186 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.187 = getelementptr %ProtocolParser, ptr %rcc.tmp.186, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.187
  %rcc.tmp.189 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.190 = getelementptr %ProtocolParser, ptr %rcc.tmp.189, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.190
  ret i32 0
if.else.15:
  %rcc.tmp.193 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.194 = getelementptr %ProtocolParser, ptr %rcc.tmp.193, i32 0, i32 4
  %rcc.tmp.195 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.196 = getelementptr %ProtocolParser, ptr %rcc.tmp.195, i32 0, i32 4
  %rcc.tmp.197 = load i32, ptr %rcc.tmp.196
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 1
  store i32 %rcc.tmp.198, ptr %rcc.tmp.194
  %rcc.tmp.200 = sub i32 0, 1
  ret i32 %rcc.tmp.200
if.merge.15:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.13
if.else.13:
  %rcc.tmp.204 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.205 = getelementptr %ProtocolParser, ptr %rcc.tmp.204, i32 0, i32 4
  %rcc.tmp.206 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.207 = getelementptr %ProtocolParser, ptr %rcc.tmp.206, i32 0, i32 4
  %rcc.tmp.208 = load i32, ptr %rcc.tmp.207
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %rcc.tmp.205
  %rcc.tmp.211 = load %ProtocolParser*, ptr %parser..tmp
  %rcc.tmp.212 = getelementptr %ProtocolParser, ptr %rcc.tmp.211, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.212
  %rcc.tmp.214 = sub i32 0, 1
  ret i32 %rcc.tmp.214
if.merge.13:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  ret i32 undef
}
define void @init_task_scheduler.(%TaskScheduler* sret(%TaskScheduler) %ret.slot) {
entry:
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %rcc.tmp.1 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 100
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [100 x %Task], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 5
  %rcc.tmp.20 = sub i32 0, 1
  store i32 %rcc.tmp.20, ptr %rcc.tmp.19
  %rcc.tmp.22 = getelementptr %Task, ptr %rcc.tmp.8, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.24, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.27 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.30 = sub i32 0, 1
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 3
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.35 = load i32, ptr %fill.idx.2
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 100
  br i1 %rcc.tmp.36, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.38 = load i32, ptr %fill.idx.2
  %rcc.tmp.39 = getelementptr [100 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.40 = sub i32 0, 1
  store i32 %rcc.tmp.40, ptr %rcc.tmp.39
  %rcc.tmp.42 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.42, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.45 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 4
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.48 = load i32, ptr %fill.idx.3
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 100
  br i1 %rcc.tmp.49, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.51 = load i32, ptr %fill.idx.3
  %rcc.tmp.52 = getelementptr [100 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.51
  %rcc.tmp.53 = sub i32 0, 1
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = add i32 %rcc.tmp.51, 1
  store i32 %rcc.tmp.55, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.58 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 7
  store i32 10, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr %TaskScheduler, ptr %ret.slot, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.64
  ret void
}
define i32 @add_task.(%TaskScheduler* %scheduler.tmp, i32 %priority.tmp, i32 %execution_time.tmp) {
entry:
  %scheduler..tmp = alloca %TaskScheduler* 
  %priority..tmp = alloca i32 
  %execution_time..tmp = alloca i32 
  %task_id = alloca i32 
  %i = alloca i32 
  %existing_task = alloca i32 
  %j = alloca i32 
  store %TaskScheduler* %scheduler.tmp, ptr %scheduler..tmp
  store i32 %priority.tmp, ptr %priority..tmp
  store i32 %execution_time.tmp, ptr %execution_time..tmp
  %rcc.tmp.4 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.5 = getelementptr %TaskScheduler, ptr %rcc.tmp.4, i32 0, i32 1
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = icmp sge i32 %rcc.tmp.6, 100
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = sub i32 0, 1
  ret i32 %rcc.tmp.9
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.12 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.13 = getelementptr %TaskScheduler, ptr %rcc.tmp.12, i32 0, i32 1
  %rcc.tmp.14 = load i32, ptr %rcc.tmp.13
  store i32 %rcc.tmp.14, ptr %task_id
  %rcc.tmp.16 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.17 = getelementptr %TaskScheduler, ptr %rcc.tmp.16, i32 0, i32 0
  %rcc.tmp.18 = load i32, ptr %task_id
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = getelementptr [100 x %Task], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 0
  %rcc.tmp.22 = load i32, ptr %task_id
  store i32 %rcc.tmp.22, ptr %rcc.tmp.21
  %rcc.tmp.24 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %priority..tmp
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 3
  %rcc.tmp.30 = load i32, ptr %execution_time..tmp
  store i32 %rcc.tmp.30, ptr %rcc.tmp.29
  %rcc.tmp.32 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 4
  %rcc.tmp.33 = sub i32 0, 1
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 5
  %rcc.tmp.36 = sub i32 0, 1
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = getelementptr %Task, ptr %rcc.tmp.20, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.38
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.44 = getelementptr %TaskScheduler, ptr %rcc.tmp.43, i32 0, i32 5
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = icmp slt i32 %rcc.tmp.42, %rcc.tmp.45
  br i1 %rcc.tmp.46, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.49 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.50 = getelementptr %TaskScheduler, ptr %rcc.tmp.49, i32 0, i32 3
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [100 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %rcc.tmp.53
  store i32 %rcc.tmp.54, ptr %existing_task
  %rcc.tmp.56 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.57 = getelementptr %TaskScheduler, ptr %rcc.tmp.56, i32 0, i32 0
  %rcc.tmp.58 = load i32, ptr %existing_task
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = getelementptr [100 x %Task], ptr %rcc.tmp.57, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.61 = getelementptr %Task, ptr %rcc.tmp.60, i32 0, i32 1
  %rcc.tmp.62 = load i32, ptr %rcc.tmp.61
  %rcc.tmp.63 = load i32, ptr %priority..tmp
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.62, %rcc.tmp.63
  br i1 %rcc.tmp.64, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.72 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.73 = getelementptr %TaskScheduler, ptr %rcc.tmp.72, i32 0, i32 5
  %rcc.tmp.74 = load i32, ptr %rcc.tmp.73
  store i32 %rcc.tmp.74, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.77 = load i32, ptr %j
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = icmp sgt i32 %rcc.tmp.77, %rcc.tmp.78
  br i1 %rcc.tmp.79, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.82 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.83 = getelementptr %TaskScheduler, ptr %rcc.tmp.82, i32 0, i32 3
  %rcc.tmp.84 = load i32, ptr %j
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [100 x i32], ptr %rcc.tmp.83, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.88 = getelementptr %TaskScheduler, ptr %rcc.tmp.87, i32 0, i32 3
  %rcc.tmp.89 = load i32, ptr %j
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 0
  %rcc.tmp.91 = sub i32 %rcc.tmp.90, 1
  %rcc.tmp.92 = getelementptr [100 x i32], ptr %rcc.tmp.88, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.92
  store i32 %rcc.tmp.93, ptr %rcc.tmp.86
  %rcc.tmp.95 = load i32, ptr %j
  %rcc.tmp.96 = sub i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.99 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.100 = getelementptr %TaskScheduler, ptr %rcc.tmp.99, i32 0, i32 3
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [100 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %task_id
  store i32 %rcc.tmp.104, ptr %rcc.tmp.103
  %rcc.tmp.106 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.107 = getelementptr %TaskScheduler, ptr %rcc.tmp.106, i32 0, i32 5
  %rcc.tmp.108 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.109 = getelementptr %TaskScheduler, ptr %rcc.tmp.108, i32 0, i32 5
  %rcc.tmp.110 = load i32, ptr %rcc.tmp.109
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 1
  store i32 %rcc.tmp.111, ptr %rcc.tmp.107
  %rcc.tmp.113 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.114 = getelementptr %TaskScheduler, ptr %rcc.tmp.113, i32 0, i32 1
  %rcc.tmp.115 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.116 = getelementptr %TaskScheduler, ptr %rcc.tmp.115, i32 0, i32 1
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %rcc.tmp.114
  %rcc.tmp.120 = load i32, ptr %task_id
  ret i32 %rcc.tmp.120
}
define i32 @schedule_next_task.(%TaskScheduler* %scheduler.tmp) {
entry:
  %scheduler..tmp = alloca %TaskScheduler* 
  %current = alloca i32 
  %should_preempt = alloca i1 
  %next_task = alloca i32 
  %current_priority = alloca i32 
  %next_priority = alloca i32 
  %i = alloca i32 
  %existing_task = alloca i32 
  %j = alloca i32 
  %i.2 = alloca i32 
  store %TaskScheduler* %scheduler.tmp, ptr %scheduler..tmp
  %rcc.tmp.2 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.3 = getelementptr %TaskScheduler, ptr %rcc.tmp.2, i32 0, i32 8
  %rcc.tmp.4 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.5 = getelementptr %TaskScheduler, ptr %rcc.tmp.4, i32 0, i32 8
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.7, ptr %rcc.tmp.3
  %rcc.tmp.9 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.10 = getelementptr %TaskScheduler, ptr %rcc.tmp.9, i32 0, i32 2
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = sub i32 0, 1
  %rcc.tmp.13 = icmp ne i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.16 = getelementptr %TaskScheduler, ptr %rcc.tmp.15, i32 0, i32 2
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %current
  %rcc.tmp.19 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.20 = getelementptr %TaskScheduler, ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = load i32, ptr %current
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [100 x %Task], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = getelementptr %Task, ptr %rcc.tmp.23, i32 0, i32 3
  %rcc.tmp.25 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.26 = getelementptr %TaskScheduler, ptr %rcc.tmp.25, i32 0, i32 0
  %rcc.tmp.27 = load i32, ptr %current
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [100 x %Task], ptr %rcc.tmp.26, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = getelementptr %Task, ptr %rcc.tmp.29, i32 0, i32 3
  %rcc.tmp.31 = load i32, ptr %rcc.tmp.30
  %rcc.tmp.32 = sub i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %rcc.tmp.24
  %rcc.tmp.34 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.35 = getelementptr %TaskScheduler, ptr %rcc.tmp.34, i32 0, i32 0
  %rcc.tmp.36 = load i32, ptr %current
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = getelementptr [100 x %Task], ptr %rcc.tmp.35, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.39 = getelementptr %Task, ptr %rcc.tmp.38, i32 0, i32 6
  %rcc.tmp.40 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.41 = getelementptr %TaskScheduler, ptr %rcc.tmp.40, i32 0, i32 0
  %rcc.tmp.42 = load i32, ptr %current
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [100 x %Task], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = getelementptr %Task, ptr %rcc.tmp.44, i32 0, i32 6
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %rcc.tmp.39
  %rcc.tmp.49 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.50 = getelementptr %TaskScheduler, ptr %rcc.tmp.49, i32 0, i32 0
  %rcc.tmp.51 = load i32, ptr %current
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [100 x %Task], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.52
  %rcc.tmp.54 = getelementptr %Task, ptr %rcc.tmp.53, i32 0, i32 3
  %rcc.tmp.55 = load i32, ptr %rcc.tmp.54
  %rcc.tmp.56 = icmp sle i32 %rcc.tmp.55, 0
  br i1 %rcc.tmp.56, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.58 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.59 = getelementptr %TaskScheduler, ptr %rcc.tmp.58, i32 0, i32 0
  %rcc.tmp.60 = load i32, ptr %current
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = getelementptr [100 x %Task], ptr %rcc.tmp.59, i32 0, i32 %rcc.tmp.61
  %rcc.tmp.63 = getelementptr %Task, ptr %rcc.tmp.62, i32 0, i32 2
  store i32 2, ptr %rcc.tmp.63
  %rcc.tmp.65 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.66 = getelementptr %TaskScheduler, ptr %rcc.tmp.65, i32 0, i32 2
  %rcc.tmp.67 = sub i32 0, 1
  store i32 %rcc.tmp.67, ptr %rcc.tmp.66
  br label %if.merge.2
if.else.2:
  store i1 0, ptr %should_preempt
  %rcc.tmp.71 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.72 = getelementptr %TaskScheduler, ptr %rcc.tmp.71, i32 0, i32 5
  %rcc.tmp.73 = load i32, ptr %rcc.tmp.72
  %rcc.tmp.74 = icmp sgt i32 %rcc.tmp.73, 0
  br i1 %rcc.tmp.74, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.76 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.77 = getelementptr %TaskScheduler, ptr %rcc.tmp.76, i32 0, i32 3
  %rcc.tmp.78 = getelementptr [100 x i32], ptr %rcc.tmp.77, i32 0, i32 0
  %rcc.tmp.79 = load i32, ptr %rcc.tmp.78
  store i32 %rcc.tmp.79, ptr %next_task
  %rcc.tmp.81 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.82 = getelementptr %TaskScheduler, ptr %rcc.tmp.81, i32 0, i32 0
  %rcc.tmp.83 = load i32, ptr %current
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [100 x %Task], ptr %rcc.tmp.82, i32 0, i32 %rcc.tmp.84
  %rcc.tmp.86 = getelementptr %Task, ptr %rcc.tmp.85, i32 0, i32 1
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %current_priority
  %rcc.tmp.89 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.90 = getelementptr %TaskScheduler, ptr %rcc.tmp.89, i32 0, i32 0
  %rcc.tmp.91 = load i32, ptr %next_task
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [100 x %Task], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = getelementptr %Task, ptr %rcc.tmp.93, i32 0, i32 1
  %rcc.tmp.95 = load i32, ptr %rcc.tmp.94
  store i32 %rcc.tmp.95, ptr %next_priority
  %rcc.tmp.97 = load i32, ptr %next_priority
  %rcc.tmp.98 = load i32, ptr %current_priority
  %rcc.tmp.99 = icmp sgt i32 %rcc.tmp.97, %rcc.tmp.98
  br i1 %rcc.tmp.99, label %if.then.4, label %if.else.4
if.then.4:
  store i1 1, ptr %should_preempt
  br label %if.merge.4
if.else.4:
  %rcc.tmp.103 = load i32, ptr %next_priority
  %rcc.tmp.104 = load i32, ptr %current_priority
  %rcc.tmp.105 = icmp eq i32 %rcc.tmp.103, %rcc.tmp.104
  br i1 %rcc.tmp.105, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.107 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.108 = getelementptr %TaskScheduler, ptr %rcc.tmp.107, i32 0, i32 0
  %rcc.tmp.109 = load i32, ptr %current
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = getelementptr [100 x %Task], ptr %rcc.tmp.108, i32 0, i32 %rcc.tmp.110
  %rcc.tmp.112 = getelementptr %Task, ptr %rcc.tmp.111, i32 0, i32 6
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  %rcc.tmp.114 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.115 = getelementptr %TaskScheduler, ptr %rcc.tmp.114, i32 0, i32 7
  %rcc.tmp.116 = load i32, ptr %rcc.tmp.115
  %rcc.tmp.117 = srem i32 %rcc.tmp.113, %rcc.tmp.116
  %rcc.tmp.118 = icmp eq i32 %rcc.tmp.117, 0
  br i1 %rcc.tmp.118, label %if.then.6, label %if.else.6
if.then.6:
  store i1 1, ptr %should_preempt
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  %rcc.tmp.124 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.125 = getelementptr %TaskScheduler, ptr %rcc.tmp.124, i32 0, i32 8
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = srem i32 %rcc.tmp.126, 50
  %rcc.tmp.128 = icmp eq i32 %rcc.tmp.127, 0
  br i1 %rcc.tmp.128, label %if.then.7, label %if.else.7
if.then.7:
  store i1 1, ptr %should_preempt
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.137 = load i1, ptr %should_preempt
  br i1 %rcc.tmp.137, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.139 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.140 = getelementptr %TaskScheduler, ptr %rcc.tmp.139, i32 0, i32 0
  %rcc.tmp.141 = load i32, ptr %current
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [100 x %Task], ptr %rcc.tmp.140, i32 0, i32 %rcc.tmp.142
  %rcc.tmp.144 = getelementptr %Task, ptr %rcc.tmp.143, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.144
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.150 = getelementptr %TaskScheduler, ptr %rcc.tmp.149, i32 0, i32 5
  %rcc.tmp.151 = load i32, ptr %rcc.tmp.150
  %rcc.tmp.152 = icmp slt i32 %rcc.tmp.148, %rcc.tmp.151
  br i1 %rcc.tmp.152, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.155 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.156 = getelementptr %TaskScheduler, ptr %rcc.tmp.155, i32 0, i32 3
  %rcc.tmp.157 = load i32, ptr %i
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = getelementptr [100 x i32], ptr %rcc.tmp.156, i32 0, i32 %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %rcc.tmp.159
  store i32 %rcc.tmp.160, ptr %existing_task
  %rcc.tmp.162 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.163 = getelementptr %TaskScheduler, ptr %rcc.tmp.162, i32 0, i32 0
  %rcc.tmp.164 = load i32, ptr %existing_task
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 0
  %rcc.tmp.166 = getelementptr [100 x %Task], ptr %rcc.tmp.163, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.167 = getelementptr %Task, ptr %rcc.tmp.166, i32 0, i32 1
  %rcc.tmp.168 = load i32, ptr %rcc.tmp.167
  %rcc.tmp.169 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.170 = getelementptr %TaskScheduler, ptr %rcc.tmp.169, i32 0, i32 0
  %rcc.tmp.171 = load i32, ptr %current
  %rcc.tmp.172 = add i32 %rcc.tmp.171, 0
  %rcc.tmp.173 = getelementptr [100 x %Task], ptr %rcc.tmp.170, i32 0, i32 %rcc.tmp.172
  %rcc.tmp.174 = getelementptr %Task, ptr %rcc.tmp.173, i32 0, i32 1
  %rcc.tmp.175 = load i32, ptr %rcc.tmp.174
  %rcc.tmp.176 = icmp slt i32 %rcc.tmp.168, %rcc.tmp.175
  br i1 %rcc.tmp.176, label %if.then.9, label %if.else.9
if.then.9:
  br label %while.linker
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.180 = load i32, ptr %i
  %rcc.tmp.181 = add i32 %rcc.tmp.180, 1
  store i32 %rcc.tmp.181, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.184 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.185 = getelementptr %TaskScheduler, ptr %rcc.tmp.184, i32 0, i32 5
  %rcc.tmp.186 = load i32, ptr %rcc.tmp.185
  store i32 %rcc.tmp.186, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.189 = load i32, ptr %j
  %rcc.tmp.190 = load i32, ptr %i
  %rcc.tmp.191 = icmp sgt i32 %rcc.tmp.189, %rcc.tmp.190
  br i1 %rcc.tmp.191, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.194 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.195 = getelementptr %TaskScheduler, ptr %rcc.tmp.194, i32 0, i32 3
  %rcc.tmp.196 = load i32, ptr %j
  %rcc.tmp.197 = add i32 %rcc.tmp.196, 0
  %rcc.tmp.198 = getelementptr [100 x i32], ptr %rcc.tmp.195, i32 0, i32 %rcc.tmp.197
  %rcc.tmp.199 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.200 = getelementptr %TaskScheduler, ptr %rcc.tmp.199, i32 0, i32 3
  %rcc.tmp.201 = load i32, ptr %j
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 0
  %rcc.tmp.203 = sub i32 %rcc.tmp.202, 1
  %rcc.tmp.204 = getelementptr [100 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.203
  %rcc.tmp.205 = load i32, ptr %rcc.tmp.204
  store i32 %rcc.tmp.205, ptr %rcc.tmp.198
  %rcc.tmp.207 = load i32, ptr %j
  %rcc.tmp.208 = sub i32 %rcc.tmp.207, 1
  store i32 %rcc.tmp.208, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.211 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.212 = getelementptr %TaskScheduler, ptr %rcc.tmp.211, i32 0, i32 3
  %rcc.tmp.213 = load i32, ptr %i
  %rcc.tmp.214 = add i32 %rcc.tmp.213, 0
  %rcc.tmp.215 = getelementptr [100 x i32], ptr %rcc.tmp.212, i32 0, i32 %rcc.tmp.214
  %rcc.tmp.216 = load i32, ptr %current
  store i32 %rcc.tmp.216, ptr %rcc.tmp.215
  %rcc.tmp.218 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.219 = getelementptr %TaskScheduler, ptr %rcc.tmp.218, i32 0, i32 5
  %rcc.tmp.220 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.221 = getelementptr %TaskScheduler, ptr %rcc.tmp.220, i32 0, i32 5
  %rcc.tmp.222 = load i32, ptr %rcc.tmp.221
  %rcc.tmp.223 = add i32 %rcc.tmp.222, 1
  store i32 %rcc.tmp.223, ptr %rcc.tmp.219
  %rcc.tmp.225 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.226 = getelementptr %TaskScheduler, ptr %rcc.tmp.225, i32 0, i32 2
  %rcc.tmp.227 = sub i32 0, 1
  store i32 %rcc.tmp.227, ptr %rcc.tmp.226
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.234 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.235 = getelementptr %TaskScheduler, ptr %rcc.tmp.234, i32 0, i32 2
  %rcc.tmp.236 = load i32, ptr %rcc.tmp.235
  %rcc.tmp.237 = sub i32 0, 1
  %rcc.tmp.238 = icmp eq i32 %rcc.tmp.236, %rcc.tmp.237
  br i1 %rcc.tmp.238, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.240 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.241 = getelementptr %TaskScheduler, ptr %rcc.tmp.240, i32 0, i32 5
  %rcc.tmp.242 = load i32, ptr %rcc.tmp.241
  %rcc.tmp.243 = icmp sgt i32 %rcc.tmp.242, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.245 = phi i1 [0, %if.merge], [%rcc.tmp.243, %and.rhs]
  br i1 %rcc.tmp.245, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.247 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.248 = getelementptr %TaskScheduler, ptr %rcc.tmp.247, i32 0, i32 2
  %rcc.tmp.249 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.250 = getelementptr %TaskScheduler, ptr %rcc.tmp.249, i32 0, i32 3
  %rcc.tmp.251 = getelementptr [100 x i32], ptr %rcc.tmp.250, i32 0, i32 0
  %rcc.tmp.252 = load i32, ptr %rcc.tmp.251
  store i32 %rcc.tmp.252, ptr %rcc.tmp.248
  %rcc.tmp.254 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.255 = getelementptr %TaskScheduler, ptr %rcc.tmp.254, i32 0, i32 0
  %rcc.tmp.256 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.257 = getelementptr %TaskScheduler, ptr %rcc.tmp.256, i32 0, i32 2
  %rcc.tmp.258 = load i32, ptr %rcc.tmp.257
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 0
  %rcc.tmp.260 = getelementptr [100 x %Task], ptr %rcc.tmp.255, i32 0, i32 %rcc.tmp.259
  %rcc.tmp.261 = getelementptr %Task, ptr %rcc.tmp.260, i32 0, i32 2
  store i32 1, ptr %rcc.tmp.261
  store i32 0, ptr %i.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.265 = load i32, ptr %i.2
  %rcc.tmp.266 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.267 = getelementptr %TaskScheduler, ptr %rcc.tmp.266, i32 0, i32 5
  %rcc.tmp.268 = load i32, ptr %rcc.tmp.267
  %rcc.tmp.269 = sub i32 %rcc.tmp.268, 1
  %rcc.tmp.270 = icmp slt i32 %rcc.tmp.265, %rcc.tmp.269
  br i1 %rcc.tmp.270, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.273 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.274 = getelementptr %TaskScheduler, ptr %rcc.tmp.273, i32 0, i32 3
  %rcc.tmp.275 = load i32, ptr %i.2
  %rcc.tmp.276 = add i32 %rcc.tmp.275, 0
  %rcc.tmp.277 = getelementptr [100 x i32], ptr %rcc.tmp.274, i32 0, i32 %rcc.tmp.276
  %rcc.tmp.278 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.279 = getelementptr %TaskScheduler, ptr %rcc.tmp.278, i32 0, i32 3
  %rcc.tmp.280 = load i32, ptr %i.2
  %rcc.tmp.281 = add i32 %rcc.tmp.280, 0
  %rcc.tmp.282 = add i32 %rcc.tmp.281, 1
  %rcc.tmp.283 = getelementptr [100 x i32], ptr %rcc.tmp.279, i32 0, i32 %rcc.tmp.282
  %rcc.tmp.284 = load i32, ptr %rcc.tmp.283
  store i32 %rcc.tmp.284, ptr %rcc.tmp.277
  %rcc.tmp.286 = load i32, ptr %i.2
  %rcc.tmp.287 = add i32 %rcc.tmp.286, 1
  store i32 %rcc.tmp.287, ptr %i.2
  br label %while.cond.3
while.end.3:
  %rcc.tmp.290 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.291 = getelementptr %TaskScheduler, ptr %rcc.tmp.290, i32 0, i32 5
  %rcc.tmp.292 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.293 = getelementptr %TaskScheduler, ptr %rcc.tmp.292, i32 0, i32 5
  %rcc.tmp.294 = load i32, ptr %rcc.tmp.293
  %rcc.tmp.295 = sub i32 %rcc.tmp.294, 1
  store i32 %rcc.tmp.295, ptr %rcc.tmp.291
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.299 = load %TaskScheduler*, ptr %scheduler..tmp
  %rcc.tmp.300 = getelementptr %TaskScheduler, ptr %rcc.tmp.299, i32 0, i32 2
  %rcc.tmp.301 = load i32, ptr %rcc.tmp.300
  ret i32 %rcc.tmp.301
}
define i32 @complex_nested_control_flow.(i32 %depth.tmp, i32 %value.tmp) {
entry:
  %depth..tmp = alloca i32 
  %value..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %temp = alloca i32 
  store i32 %depth.tmp, ptr %depth..tmp
  store i32 %value.tmp, ptr %value..tmp
  %rcc.tmp.3 = load i32, ptr %depth..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  %rcc.tmp.6 = load i32, ptr %value..tmp
  ret i32 %rcc.tmp.6
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.9 = load i32, ptr %value..tmp
  store i32 %rcc.tmp.9, ptr %result
  %rcc.tmp.11 = load i32, ptr %depth..tmp
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 7
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.15 = load i32, ptr %value..tmp
  %rcc.tmp.16 = icmp sgt i32 %rcc.tmp.15, 100
  br i1 %rcc.tmp.16, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.18 = load i32, ptr %value..tmp
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 3
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 0
  br i1 %rcc.tmp.20, label %if.then.4, label %if.else.4
if.then.4:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %depth..tmp
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = srem i32 %rcc.tmp.29, 2
  %rcc.tmp.31 = icmp eq i32 %rcc.tmp.30, 0
  br i1 %rcc.tmp.31, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.33 = load i32, ptr %result
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, 2
  %rcc.tmp.36 = add i32 %rcc.tmp.33, %rcc.tmp.35
  store i32 %rcc.tmp.36, ptr %result
  %rcc.tmp.38 = load i32, ptr %result
  %rcc.tmp.39 = icmp sgt i32 %rcc.tmp.38, 1000
  br i1 %rcc.tmp.39, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.41 = load i32, ptr %result
  %rcc.tmp.42 = srem i32 %rcc.tmp.41, 1000
  store i32 %rcc.tmp.42, ptr %result
  %rcc.tmp.44 = load i32, ptr %result
  %rcc.tmp.45 = icmp slt i32 %rcc.tmp.44, 100
  br i1 %rcc.tmp.45, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.47 = load i32, ptr %result
  %rcc.tmp.48 = add i32 %rcc.tmp.47, 50
  store i32 %rcc.tmp.48, ptr %result
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  %rcc.tmp.55 = load i32, ptr %result
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = sub i32 %rcc.tmp.55, %rcc.tmp.56
  store i32 %rcc.tmp.57, ptr %result
  %rcc.tmp.59 = load i32, ptr %result
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 0
  br i1 %rcc.tmp.60, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.62 = load i32, ptr %result
  %rcc.tmp.63 = sub i32 0, %rcc.tmp.62
  store i32 %rcc.tmp.63, ptr %result
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %i
  br label %while.cond
while.end:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.73 = load i32, ptr %value..tmp
  %rcc.tmp.74 = srem i32 %rcc.tmp.73, 3
  %rcc.tmp.75 = icmp eq i32 %rcc.tmp.74, 1
  br i1 %rcc.tmp.75, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.77 = load i32, ptr %depth..tmp
  store i32 %rcc.tmp.77, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.80 = load i32, ptr %j
  %rcc.tmp.81 = icmp sgt i32 %rcc.tmp.80, 0
  br i1 %rcc.tmp.81, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.84 = load i32, ptr %j
  %rcc.tmp.85 = srem i32 %rcc.tmp.84, 4
  %rcc.tmp.86 = icmp eq i32 %rcc.tmp.85, 0
  br i1 %rcc.tmp.86, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.88 = load i32, ptr %result
  %rcc.tmp.89 = mul i32 %rcc.tmp.88, 2
  store i32 %rcc.tmp.89, ptr %result
  br label %if.merge.10
if.else.10:
  %rcc.tmp.92 = load i32, ptr %j
  %rcc.tmp.93 = srem i32 %rcc.tmp.92, 4
  %rcc.tmp.94 = icmp eq i32 %rcc.tmp.93, 1
  br i1 %rcc.tmp.94, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.96 = load i32, ptr %result
  %rcc.tmp.97 = load i32, ptr %j
  %rcc.tmp.98 = add i32 %rcc.tmp.96, %rcc.tmp.97
  store i32 %rcc.tmp.98, ptr %result
  br label %if.merge.11
if.else.11:
  %rcc.tmp.101 = load i32, ptr %j
  %rcc.tmp.102 = srem i32 %rcc.tmp.101, 4
  %rcc.tmp.103 = icmp eq i32 %rcc.tmp.102, 2
  br i1 %rcc.tmp.103, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.105 = load i32, ptr %result
  %rcc.tmp.106 = load i32, ptr %j
  %rcc.tmp.107 = sub i32 %rcc.tmp.105, %rcc.tmp.106
  store i32 %rcc.tmp.107, ptr %result
  br label %if.merge.12
if.else.12:
  %rcc.tmp.110 = load i32, ptr %result
  %rcc.tmp.111 = sdiv i32 %rcc.tmp.110, 2
  store i32 %rcc.tmp.111, ptr %result
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.116 = load i32, ptr %result
  %rcc.tmp.117 = icmp sgt i32 %rcc.tmp.116, 500
  br i1 %rcc.tmp.117, label %if.then.13, label %if.else.13
if.then.13:
  br label %while.linker.2
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.121 = load i32, ptr %j
  %rcc.tmp.122 = sub i32 %rcc.tmp.121, 1
  store i32 %rcc.tmp.122, ptr %j
  br label %while.cond.2
while.end.2:
  br label %if.merge.9
if.else.9:
  %rcc.tmp.126 = load i32, ptr %depth..tmp
  %rcc.tmp.127 = sub i32 %rcc.tmp.126, 1
  %rcc.tmp.128 = load i32, ptr %result
  %rcc.tmp.129 = sdiv i32 %rcc.tmp.128, 2
  %rcc.tmp.130 = call i32 @complex_nested_control_flow.(i32 %rcc.tmp.127, i32 %rcc.tmp.129)
  store i32 %rcc.tmp.130, ptr %result
  br label %if.merge.9
if.merge.9:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.135 = load i32, ptr %value..tmp
  %rcc.tmp.136 = icmp sgt i32 %rcc.tmp.135, 50
  br i1 %rcc.tmp.136, label %if.then.14, label %if.else.14
if.then.14:
  store i32 0, ptr %k
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.140 = load i32, ptr %k
  %rcc.tmp.141 = icmp slt i32 %rcc.tmp.140, 10
  br i1 %rcc.tmp.141, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.144 = load i32, ptr %k
  %rcc.tmp.145 = srem i32 %rcc.tmp.144, 3
  %rcc.tmp.146 = icmp eq i32 %rcc.tmp.145, 0
  br i1 %rcc.tmp.146, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.148 = load i32, ptr %result
  %rcc.tmp.149 = load i32, ptr %k
  %rcc.tmp.150 = load i32, ptr %depth..tmp
  %rcc.tmp.151 = mul i32 %rcc.tmp.149, %rcc.tmp.150
  %rcc.tmp.152 = add i32 %rcc.tmp.148, %rcc.tmp.151
  store i32 %rcc.tmp.152, ptr %result
  br label %if.merge.15
if.else.15:
  %rcc.tmp.155 = load i32, ptr %k
  %rcc.tmp.156 = srem i32 %rcc.tmp.155, 3
  %rcc.tmp.157 = icmp eq i32 %rcc.tmp.156, 1
  br i1 %rcc.tmp.157, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.159 = load i32, ptr %result
  %rcc.tmp.160 = load i32, ptr %k
  %rcc.tmp.161 = load i32, ptr %depth..tmp
  %rcc.tmp.162 = mul i32 %rcc.tmp.160, %rcc.tmp.161
  %rcc.tmp.163 = sub i32 %rcc.tmp.159, %rcc.tmp.162
  store i32 %rcc.tmp.163, ptr %result
  br label %if.merge.16
if.else.16:
  %rcc.tmp.166 = load i32, ptr %result
  %rcc.tmp.167 = load i32, ptr %k
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  %rcc.tmp.169 = mul i32 %rcc.tmp.166, %rcc.tmp.168
  store i32 %rcc.tmp.169, ptr %result
  %rcc.tmp.171 = load i32, ptr %result
  %rcc.tmp.172 = icmp sgt i32 %rcc.tmp.171, 800
  br i1 %rcc.tmp.172, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.174 = load i32, ptr %result
  %rcc.tmp.175 = srem i32 %rcc.tmp.174, 800
  store i32 %rcc.tmp.175, ptr %result
  br label %if.merge.17
if.else.17:
  br label %if.merge.17
if.merge.17:
  br label %if.merge.16
if.merge.16:
  br label %if.merge.15
if.merge.15:
  %rcc.tmp.181 = load i32, ptr %k
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 1
  store i32 %rcc.tmp.182, ptr %k
  br label %while.cond.3
while.end.3:
  br label %if.merge.14
if.else.14:
  %rcc.tmp.186 = load i32, ptr %depth..tmp
  %rcc.tmp.187 = sub i32 %rcc.tmp.186, 2
  %rcc.tmp.188 = load i32, ptr %result
  %rcc.tmp.189 = load i32, ptr %depth..tmp
  %rcc.tmp.190 = add i32 %rcc.tmp.188, %rcc.tmp.189
  %rcc.tmp.191 = call i32 @complex_nested_control_flow.(i32 %rcc.tmp.187, i32 %rcc.tmp.190)
  store i32 %rcc.tmp.191, ptr %result
  br label %if.merge.14
if.merge.14:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.196 = load i32, ptr %depth..tmp
  %rcc.tmp.197 = srem i32 %rcc.tmp.196, 7
  %rcc.tmp.198 = icmp eq i32 %rcc.tmp.197, 1
  br i1 %rcc.tmp.198, label %if.then.18, label %if.else.18
if.then.18:
  %rcc.tmp.200 = load i32, ptr %result
  store i32 %rcc.tmp.200, ptr %temp
  %rcc.tmp.202 = load i32, ptr %temp
  %rcc.tmp.203 = load i32, ptr %depth..tmp
  %rcc.tmp.204 = mul i32 %rcc.tmp.203, 10
  %rcc.tmp.205 = icmp sgt i32 %rcc.tmp.202, %rcc.tmp.204
  br i1 %rcc.tmp.205, label %if.then.19, label %if.else.19
if.then.19:
  %rcc.tmp.207 = load i32, ptr %depth..tmp
  %rcc.tmp.208 = sub i32 %rcc.tmp.207, 1
  %rcc.tmp.209 = load i32, ptr %temp
  %rcc.tmp.210 = load i32, ptr %depth..tmp
  %rcc.tmp.211 = sub i32 %rcc.tmp.209, %rcc.tmp.210
  %rcc.tmp.212 = call i32 @complex_nested_control_flow.(i32 %rcc.tmp.208, i32 %rcc.tmp.211)
  store i32 %rcc.tmp.212, ptr %result
  br label %if.merge.19
if.else.19:
  %rcc.tmp.215 = load i32, ptr %depth..tmp
  %rcc.tmp.216 = sub i32 %rcc.tmp.215, 1
  %rcc.tmp.217 = load i32, ptr %temp
  %rcc.tmp.218 = load i32, ptr %depth..tmp
  %rcc.tmp.219 = add i32 %rcc.tmp.217, %rcc.tmp.218
  %rcc.tmp.220 = call i32 @complex_nested_control_flow.(i32 %rcc.tmp.216, i32 %rcc.tmp.219)
  store i32 %rcc.tmp.220, ptr %result
  br label %if.merge.19
if.merge.19:
  br label %if.merge.18
if.else.18:
  %rcc.tmp.224 = load i32, ptr %depth..tmp
  %rcc.tmp.225 = sub i32 %rcc.tmp.224, 1
  %rcc.tmp.226 = load i32, ptr %result
  %rcc.tmp.227 = mul i32 %rcc.tmp.226, 2
  %rcc.tmp.228 = load i32, ptr %depth..tmp
  %rcc.tmp.229 = add i32 %rcc.tmp.227, %rcc.tmp.228
  %rcc.tmp.230 = call i32 @complex_nested_control_flow.(i32 %rcc.tmp.225, i32 %rcc.tmp.229)
  store i32 %rcc.tmp.230, ptr %result
  br label %if.merge.18
if.merge.18:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.234 = load i32, ptr %result
  %rcc.tmp.235 = srem i32 %rcc.tmp.234, 10000
  ret i32 %rcc.tmp.235
}
define void @test_complex_control_flow.() {
entry:
  %fsm = alloca %FSM 
  %context = alloca i32 
  %i = alloca i32 
  %event = alloca i32 
  %processed = alloca i32 
  %parser = alloca %ProtocolParser 
  %packet_responses = alloca i32 
  %packet_type = alloca i32 
  %data = alloca i32 
  %seq = alloca i32 
  %response = alloca i32 
  %scheduler = alloca %TaskScheduler 
  %priority = alloca i32 
  %execution_time = alloca i32 
  %scheduling_steps = alloca i32 
  %current = alloca i32 
  %priority.2 = alloca i32 
  %execution_time.2 = alloca i32 
  %nested_results = alloca i32 
  %result = alloca i32 
  %fsm2 = alloca %FSM 
  %context2 = alloca i32 
  call void @printlnInt.(i32 20001)
  call void @init_fsm.(%FSM* %fsm)
  store i32 42, ptr %context
  %rcc.tmp.4 = call i1 @add_transition.(%FSM* %fsm, i32 0, i32 0, i32 1, i32 1, i32 0)
  %rcc.tmp.5 = call i1 @add_transition.(%FSM* %fsm, i32 1, i32 1, i32 2, i32 2, i32 1)
  %rcc.tmp.6 = call i1 @add_transition.(%FSM* %fsm, i32 2, i32 2, i32 1, i32 3, i32 5)
  %rcc.tmp.7 = call i1 @add_transition.(%FSM* %fsm, i32 2, i32 3, i32 4, i32 4, i32 4)
  %rcc.tmp.8 = call i1 @add_transition.(%FSM* %fsm, i32 4, i32 5, i32 1, i32 5, i32 6)
  %rcc.tmp.9 = call i1 @add_transition.(%FSM* %fsm, i32 1, i32 6, i32 6, i32 6, i32 2)
  %rcc.tmp.10 = call i1 @add_transition.(%FSM* %fsm, i32 6, i32 7, i32 1, i32 1, i32 3)
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 100
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 7
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 3
  %rcc.tmp.20 = srem i32 %rcc.tmp.19, 10
  store i32 %rcc.tmp.20, ptr %event
  %rcc.tmp.22 = load i32, ptr %event
  %rcc.tmp.23 = call i1 @fsm_add_event.(%FSM* %fsm, i32 %rcc.tmp.22)
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %processed
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.30 = load i32, ptr %processed
  %rcc.tmp.31 = icmp slt i32 %rcc.tmp.30, 150
  br i1 %rcc.tmp.31, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.34 = call i1 @fsm_step.(%FSM* %fsm, i32* %context)
  %rcc.tmp.35 = xor i1 %rcc.tmp.34, true
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  %rcc.tmp.37 = call i1 @fsm_add_event.(%FSM* %fsm, i32 1)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.40 = load i32, ptr %processed
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %processed
  br label %while.cond.2
while.end.2:
  %rcc.tmp.44 = getelementptr %FSM, ptr %fsm, i32 0, i32 10
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  call void @printlnInt.(i32 %rcc.tmp.45)
  %rcc.tmp.47 = getelementptr %FSM, ptr %fsm, i32 0, i32 9
  %rcc.tmp.48 = load i32, ptr %rcc.tmp.47
  call void @printlnInt.(i32 %rcc.tmp.48)
  %rcc.tmp.50 = load i32, ptr %context
  call void @printlnInt.(i32 %rcc.tmp.50)
  call void @init_protocol_parser.(%ProtocolParser* %parser)
  store i32 0, ptr %packet_responses
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = icmp slt i32 %rcc.tmp.56, 200
  br i1 %rcc.tmp.57, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = srem i32 %rcc.tmp.60, 7
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 1
  store i32 %rcc.tmp.62, ptr %packet_type
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = mul i32 %rcc.tmp.64, 13
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 7
  store i32 %rcc.tmp.66, ptr %data
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %seq
  %rcc.tmp.71 = load i32, ptr %packet_type
  %rcc.tmp.72 = load i32, ptr %data
  %rcc.tmp.73 = load i32, ptr %seq
  %rcc.tmp.74 = call i32 @parse_packet.(%ProtocolParser* %parser, i32 %rcc.tmp.71, i32 %rcc.tmp.72, i32 %rcc.tmp.73)
  store i32 %rcc.tmp.74, ptr %response
  %rcc.tmp.76 = load i32, ptr %response
  %rcc.tmp.77 = icmp sgt i32 %rcc.tmp.76, 0
  br i1 %rcc.tmp.77, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.79 = load i32, ptr %packet_responses
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %packet_responses
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.84 = getelementptr %ProtocolParser, ptr %parser, i32 0, i32 0
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.84
  %rcc.tmp.86 = icmp eq i32 %rcc.tmp.85, 2
  br i1 %rcc.tmp.86, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = srem i32 %rcc.tmp.88, 10
  %rcc.tmp.90 = icmp eq i32 %rcc.tmp.89, 0
  br label %sc.merge
sc.merge:
  %rcc.tmp.92 = phi i1 [0, %if.merge.2], [%rcc.tmp.90, %and.rhs]
  br i1 %rcc.tmp.92, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.94 = load i32, ptr %seq
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  %rcc.tmp.96 = call i32 @parse_packet.(%ProtocolParser* %parser, i32 6, i32 0, i32 %rcc.tmp.95)
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.99 = getelementptr %ProtocolParser, ptr %parser, i32 0, i32 4
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = icmp sgt i32 %rcc.tmp.100, 5
  br i1 %rcc.tmp.101, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = srem i32 %rcc.tmp.103, 15
  %rcc.tmp.105 = icmp eq i32 %rcc.tmp.104, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.107 = phi i1 [0, %if.merge.3], [%rcc.tmp.105, %and.rhs.2]
  br i1 %rcc.tmp.107, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.109 = call i32 @parse_packet.(%ProtocolParser* %parser, i32 5, i32 0, i32 0)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 1
  store i32 %rcc.tmp.113, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.116 = getelementptr %ProtocolParser, ptr %parser, i32 0, i32 3
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.116
  call void @printlnInt.(i32 %rcc.tmp.117)
  %rcc.tmp.119 = getelementptr %ProtocolParser, ptr %parser, i32 0, i32 4
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  call void @printlnInt.(i32 %rcc.tmp.120)
  %rcc.tmp.122 = load i32, ptr %packet_responses
  call void @printlnInt.(i32 %rcc.tmp.122)
  call void @init_task_scheduler.(%TaskScheduler* %scheduler)
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = icmp slt i32 %rcc.tmp.127, 50
  br i1 %rcc.tmp.128, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = srem i32 %rcc.tmp.131, 4
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %priority
  %rcc.tmp.135 = load i32, ptr %i
  %rcc.tmp.136 = mul i32 %rcc.tmp.135, 3
  %rcc.tmp.137 = add i32 %rcc.tmp.136, 5
  %rcc.tmp.138 = srem i32 %rcc.tmp.137, 20
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %execution_time
  %rcc.tmp.141 = load i32, ptr %priority
  %rcc.tmp.142 = load i32, ptr %execution_time
  %rcc.tmp.143 = call i32 @add_task.(%TaskScheduler* %scheduler, i32 %rcc.tmp.141, i32 %rcc.tmp.142)
  %rcc.tmp.144 = load i32, ptr %i
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 1
  store i32 %rcc.tmp.145, ptr %i
  br label %while.cond.4
while.end.4:
  store i32 0, ptr %scheduling_steps
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.151 = load i32, ptr %i
  %rcc.tmp.152 = icmp slt i32 %rcc.tmp.151, 1000
  br i1 %rcc.tmp.152, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.155 = call i32 @schedule_next_task.(%TaskScheduler* %scheduler)
  store i32 %rcc.tmp.155, ptr %current
  %rcc.tmp.157 = load i32, ptr %current
  %rcc.tmp.158 = sub i32 0, 1
  %rcc.tmp.159 = icmp ne i32 %rcc.tmp.157, %rcc.tmp.158
  br i1 %rcc.tmp.159, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.161 = load i32, ptr %scheduling_steps
  %rcc.tmp.162 = add i32 %rcc.tmp.161, 1
  store i32 %rcc.tmp.162, ptr %scheduling_steps
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.166 = load i32, ptr %i
  %rcc.tmp.167 = srem i32 %rcc.tmp.166, 50
  %rcc.tmp.168 = icmp eq i32 %rcc.tmp.167, 0
  br i1 %rcc.tmp.168, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.170 = getelementptr %TaskScheduler, ptr %scheduler, i32 0, i32 1
  %rcc.tmp.171 = load i32, ptr %rcc.tmp.170
  %rcc.tmp.172 = icmp slt i32 %rcc.tmp.171, 100
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.174 = phi i1 [0, %if.merge.5], [%rcc.tmp.172, %and.rhs.3]
  br i1 %rcc.tmp.174, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.176 = load i32, ptr %i
  %rcc.tmp.177 = sdiv i32 %rcc.tmp.176, 50
  %rcc.tmp.178 = srem i32 %rcc.tmp.177, 4
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 1
  store i32 %rcc.tmp.179, ptr %priority.2
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = sdiv i32 %rcc.tmp.181, 10
  %rcc.tmp.183 = srem i32 %rcc.tmp.182, 15
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 1
  store i32 %rcc.tmp.184, ptr %execution_time.2
  %rcc.tmp.186 = load i32, ptr %priority.2
  %rcc.tmp.187 = load i32, ptr %execution_time.2
  %rcc.tmp.188 = call i32 @add_task.(%TaskScheduler* %scheduler, i32 %rcc.tmp.186, i32 %rcc.tmp.187)
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.191 = load i32, ptr %i
  %rcc.tmp.192 = add i32 %rcc.tmp.191, 1
  store i32 %rcc.tmp.192, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.195 = load i32, ptr %scheduling_steps
  call void @printlnInt.(i32 %rcc.tmp.195)
  %rcc.tmp.197 = getelementptr %TaskScheduler, ptr %scheduler, i32 0, i32 1
  %rcc.tmp.198 = load i32, ptr %rcc.tmp.197
  call void @printlnInt.(i32 %rcc.tmp.198)
  store i32 0, ptr %nested_results
  store i32 1, ptr %i
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.203 = load i32, ptr %i
  %rcc.tmp.204 = icmp sle i32 %rcc.tmp.203, 20
  br i1 %rcc.tmp.204, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  %rcc.tmp.207 = load i32, ptr %i
  %rcc.tmp.208 = load i32, ptr %i
  %rcc.tmp.209 = mul i32 %rcc.tmp.208, 17
  %rcc.tmp.210 = add i32 %rcc.tmp.209, 3
  %rcc.tmp.211 = call i32 @complex_nested_control_flow.(i32 %rcc.tmp.207, i32 %rcc.tmp.210)
  store i32 %rcc.tmp.211, ptr %result
  %rcc.tmp.213 = load i32, ptr %nested_results
  %rcc.tmp.214 = load i32, ptr %result
  %rcc.tmp.215 = add i32 %rcc.tmp.213, %rcc.tmp.214
  store i32 %rcc.tmp.215, ptr %nested_results
  %rcc.tmp.217 = load i32, ptr %i
  %rcc.tmp.218 = add i32 %rcc.tmp.217, 1
  store i32 %rcc.tmp.218, ptr %i
  br label %while.cond.6
while.end.6:
  %rcc.tmp.221 = load i32, ptr %nested_results
  %rcc.tmp.222 = srem i32 %rcc.tmp.221, 100000
  call void @printlnInt.(i32 %rcc.tmp.222)
  call void @init_fsm.(%FSM* %fsm2)
  store i32 17, ptr %context2
  %rcc.tmp.226 = call i1 @add_transition.(%FSM* %fsm2, i32 0, i32 0, i32 2, i32 2, i32 0)
  %rcc.tmp.227 = call i1 @add_transition.(%FSM* %fsm2, i32 2, i32 1, i32 3, i32 4, i32 2)
  %rcc.tmp.228 = call i1 @add_transition.(%FSM* %fsm2, i32 3, i32 4, i32 4, i32 6, i32 1)
  %rcc.tmp.229 = call i1 @add_transition.(%FSM* %fsm2, i32 4, i32 9, i32 0, i32 1, i32 0)
  store i32 0, ptr %i
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.232 = load i32, ptr %i
  %rcc.tmp.233 = icmp slt i32 %rcc.tmp.232, 100
  br i1 %rcc.tmp.233, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.236 = call i1 @fsm_step.(%FSM* %fsm, i32* %context)
  %rcc.tmp.237 = xor i1 %rcc.tmp.236, true
  br i1 %rcc.tmp.237, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.239 = load i32, ptr %i
  %rcc.tmp.240 = srem i32 %rcc.tmp.239, 5
  %rcc.tmp.241 = add i32 %rcc.tmp.240, 0
  %rcc.tmp.242 = call i1 @fsm_add_event.(%FSM* %fsm, i32 %rcc.tmp.241)
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.245 = call i1 @fsm_step.(%FSM* %fsm2, i32* %context2)
  %rcc.tmp.246 = xor i1 %rcc.tmp.245, true
  br i1 %rcc.tmp.246, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.248 = load i32, ptr %i
  %rcc.tmp.249 = srem i32 %rcc.tmp.248, 3
  %rcc.tmp.250 = add i32 %rcc.tmp.249, 0
  %rcc.tmp.251 = call i1 @fsm_add_event.(%FSM* %fsm2, i32 %rcc.tmp.250)
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.254 = getelementptr %FSM, ptr %fsm, i32 0, i32 0
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.254
  %rcc.tmp.256 = icmp eq i32 %rcc.tmp.255, 2
  br i1 %rcc.tmp.256, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.258 = getelementptr %FSM, ptr %fsm2, i32 0, i32 0
  %rcc.tmp.259 = load i32, ptr %rcc.tmp.258
  %rcc.tmp.260 = icmp eq i32 %rcc.tmp.259, 3
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.262 = phi i1 [0, %if.merge.8], [%rcc.tmp.260, %and.rhs.4]
  br i1 %rcc.tmp.262, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.264 = call i1 @fsm_add_event.(%FSM* %fsm2, i32 2)
  %rcc.tmp.265 = call i1 @fsm_add_event.(%FSM* %fsm, i32 6)
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.268 = load i32, ptr %context
  %rcc.tmp.269 = icmp sgt i32 %rcc.tmp.268, 80
  br i1 %rcc.tmp.269, label %and.rhs.5, label %sc.merge.5
and.rhs.5:
  %rcc.tmp.271 = load i32, ptr %context2
  %rcc.tmp.272 = icmp slt i32 %rcc.tmp.271, 20
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.274 = phi i1 [0, %if.merge.9], [%rcc.tmp.272, %and.rhs.5]
  br i1 %rcc.tmp.274, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.276 = load i32, ptr %context2
  %rcc.tmp.277 = load i32, ptr %context
  %rcc.tmp.278 = sdiv i32 %rcc.tmp.277, 4
  %rcc.tmp.279 = add i32 %rcc.tmp.276, %rcc.tmp.278
  store i32 %rcc.tmp.279, ptr %context2
  %rcc.tmp.281 = load i32, ptr %context
  %rcc.tmp.282 = sub i32 %rcc.tmp.281, 10
  store i32 %rcc.tmp.282, ptr %context
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.286 = load i32, ptr %i
  %rcc.tmp.287 = add i32 %rcc.tmp.286, 1
  store i32 %rcc.tmp.287, ptr %i
  br label %while.cond.7
while.end.7:
  %rcc.tmp.290 = getelementptr %FSM, ptr %fsm2, i32 0, i32 10
  %rcc.tmp.291 = load i32, ptr %rcc.tmp.290
  call void @printlnInt.(i32 %rcc.tmp.291)
  %rcc.tmp.293 = load i32, ptr %context2
  call void @printlnInt.(i32 %rcc.tmp.293)
  call void @printlnInt.(i32 20999)
  ret void
}
define void @main() {
entry:
  call void @test_complex_control_flow.()
  call void @exit.(i32 0)
  ret void
}
