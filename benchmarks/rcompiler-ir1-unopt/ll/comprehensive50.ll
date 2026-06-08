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
  %state = alloca i32 
  %sequence_number = alloca i32 
  %last_ack = alloca i32 
  %retransmission_count = alloca i32 
  %input_stream = alloca [60 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %event = alloca i32 
  %payload = alloca i32 
  store i32 0, ptr %state
  store i32 0, ptr %sequence_number
  %rcc.tmp.3 = sub i32 0, 1
  store i32 %rcc.tmp.3, ptr %last_ack
  store i32 0, ptr %retransmission_count
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = icmp slt i32 %rcc.tmp.8, 60
  br i1 %rcc.tmp.9, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.11 = load i32, ptr %fill.idx
  %rcc.tmp.12 = getelementptr [60 x i32], ptr %input_stream, i32 0, i32 %rcc.tmp.11
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.14, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 60
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [60 x i32], ptr %input_stream, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 8
  store i32 %rcc.tmp.27, ptr %rcc.tmp.25
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 1
  store i32 %rcc.tmp.30, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 60
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 0
  %rcc.tmp.41 = getelementptr [60 x i32], ptr %input_stream, i32 0, i32 %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  store i32 %rcc.tmp.42, ptr %event
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = mul i32 %rcc.tmp.44, 10
  store i32 %rcc.tmp.45, ptr %payload
  %rcc.tmp.47 = load i32, ptr %state
  %rcc.tmp.48 = load i32, ptr %event
  %rcc.tmp.49 = load i32, ptr %payload
  %rcc.tmp.50 = load i32, ptr %sequence_number
  %rcc.tmp.51 = load i32, ptr %last_ack
  %rcc.tmp.52 = load i32, ptr %retransmission_count
  %rcc.tmp.53 = call i32 @process_event.(i32 %rcc.tmp.47, i32 %rcc.tmp.48, i32 %rcc.tmp.49, i32 %rcc.tmp.50, i32 %rcc.tmp.51, i32 %rcc.tmp.52)
  store i32 %rcc.tmp.53, ptr %state
  %rcc.tmp.55 = load i32, ptr %state
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.55, 1
  br i1 %rcc.tmp.56, label %if.then, label %if.else
if.then:
  store i32 0, ptr %sequence_number
  %rcc.tmp.59 = sub i32 0, 1
  store i32 %rcc.tmp.59, ptr %last_ack
  br label %if.merge
if.else:
  %rcc.tmp.62 = load i32, ptr %state
  %rcc.tmp.63 = icmp eq i32 %rcc.tmp.62, 2
  br i1 %rcc.tmp.63, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.65 = load i32, ptr %event
  %rcc.tmp.66 = icmp eq i32 %rcc.tmp.65, 2
  br i1 %rcc.tmp.66, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.68 = load i32, ptr %sequence_number
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %sequence_number
  br label %if.merge.3
if.else.3:
  %rcc.tmp.72 = load i32, ptr %event
  %rcc.tmp.73 = icmp eq i32 %rcc.tmp.72, 3
  br i1 %rcc.tmp.73, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.75 = load i32, ptr %payload
  store i32 %rcc.tmp.75, ptr %last_ack
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.81 = load i32, ptr %state
  %rcc.tmp.82 = icmp eq i32 %rcc.tmp.81, 4
  br i1 %rcc.tmp.82, label %if.then.5, label %if.else.5
if.then.5:
  store i32 0, ptr %state
  store i32 0, ptr %retransmission_count
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.90 = load i32, ptr %last_ack
  %rcc.tmp.91 = load i32, ptr %sequence_number
  %rcc.tmp.92 = sub i32 %rcc.tmp.91, 5
  %rcc.tmp.93 = icmp slt i32 %rcc.tmp.90, %rcc.tmp.92
  br i1 %rcc.tmp.93, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.95 = load i32, ptr %retransmission_count
  %rcc.tmp.96 = add i32 %rcc.tmp.95, 1
  store i32 %rcc.tmp.96, ptr %retransmission_count
  %rcc.tmp.98 = load i32, ptr %retransmission_count
  %rcc.tmp.99 = icmp sgt i32 %rcc.tmp.98, 3
  br i1 %rcc.tmp.99, label %if.then.7, label %if.else.7
if.then.7:
  store i32 4, ptr %state
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.106 = load i32, ptr %state
  call void @printInt.(i32 %rcc.tmp.106)
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %i
  br label %while.cond.2
while.end.2:
  call void @exit.(i32 0)
  ret void
}
define i32 @process_event.(i32 %current_state.tmp, i32 %event.tmp, i32 %payload.tmp, i32 %seq.tmp, i32 %ack.tmp, i32 %ret_count.tmp) {
entry:
  %current_state..tmp = alloca i32 
  %event..tmp = alloca i32 
  %payload..tmp = alloca i32 
  %seq..tmp = alloca i32 
  %ack..tmp = alloca i32 
  %ret_count..tmp = alloca i32 
  %new_state = alloca i32 
  store i32 %current_state.tmp, ptr %current_state..tmp
  store i32 %event.tmp, ptr %event..tmp
  store i32 %payload.tmp, ptr %payload..tmp
  store i32 %seq.tmp, ptr %seq..tmp
  store i32 %ack.tmp, ptr %ack..tmp
  store i32 %ret_count.tmp, ptr %ret_count..tmp
  %rcc.tmp.7 = load i32, ptr %current_state..tmp
  store i32 %rcc.tmp.7, ptr %new_state
  %rcc.tmp.9 = load i32, ptr %current_state..tmp
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 0
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %event..tmp
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %if.then.2, label %if.else.2
if.then.2:
  store i32 1, ptr %new_state
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.19 = load i32, ptr %current_state..tmp
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 1
  br i1 %rcc.tmp.20, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.22 = load i32, ptr %event..tmp
  %rcc.tmp.23 = icmp eq i32 %rcc.tmp.22, 1
  br i1 %rcc.tmp.23, label %if.then.4, label %if.else.4
if.then.4:
  store i32 2, ptr %new_state
  br label %if.merge.4
if.else.4:
  %rcc.tmp.27 = load i32, ptr %event..tmp
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 6
  br i1 %rcc.tmp.28, label %if.then.5, label %if.else.5
if.then.5:
  store i32 0, ptr %new_state
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.35 = load i32, ptr %current_state..tmp
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 2
  br i1 %rcc.tmp.36, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.38 = load i32, ptr %event..tmp
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.38, 2
  br i1 %rcc.tmp.39, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.41 = load i32, ptr %payload..tmp
  %rcc.tmp.42 = call i1 @validate_checksum.(i32 %rcc.tmp.41)
  br i1 %rcc.tmp.42, label %if.then.8, label %if.else.8
if.then.8:
  br label %if.merge.8
if.else.8:
  store i32 4, ptr %new_state
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.48 = load i32, ptr %event..tmp
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 3
  br i1 %rcc.tmp.49, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.51 = load i32, ptr %payload..tmp
  %rcc.tmp.52 = load i32, ptr %ack..tmp
  %rcc.tmp.53 = icmp sgt i32 %rcc.tmp.51, %rcc.tmp.52
  br i1 %rcc.tmp.53, label %if.then.10, label %if.else.10
if.then.10:
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.else.9:
  %rcc.tmp.58 = load i32, ptr %event..tmp
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 4
  br i1 %rcc.tmp.59, label %if.then.11, label %if.else.11
if.then.11:
  store i32 3, ptr %new_state
  br label %if.merge.11
if.else.11:
  %rcc.tmp.63 = load i32, ptr %event..tmp
  %rcc.tmp.64 = icmp eq i32 %rcc.tmp.63, 7
  br i1 %rcc.tmp.64, label %if.then.12, label %if.else.12
if.then.12:
  store i32 4, ptr %new_state
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  %rcc.tmp.73 = load i32, ptr %current_state..tmp
  %rcc.tmp.74 = icmp eq i32 %rcc.tmp.73, 3
  br i1 %rcc.tmp.74, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.76 = load i32, ptr %event..tmp
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 5
  br i1 %rcc.tmp.77, label %if.then.14, label %if.else.14
if.then.14:
  store i32 0, ptr %new_state
  br label %if.merge.14
if.else.14:
  %rcc.tmp.81 = load i32, ptr %event..tmp
  %rcc.tmp.82 = icmp eq i32 %rcc.tmp.81, 6
  br i1 %rcc.tmp.82, label %if.then.15, label %if.else.15
if.then.15:
  store i32 0, ptr %new_state
  br label %if.merge.15
if.else.15:
  br label %if.merge.15
if.merge.15:
  br label %if.merge.14
if.merge.14:
  br label %if.merge.13
if.else.13:
  %rcc.tmp.89 = load i32, ptr %current_state..tmp
  %rcc.tmp.90 = icmp eq i32 %rcc.tmp.89, 4
  br i1 %rcc.tmp.90, label %if.then.16, label %if.else.16
if.then.16:
  br label %if.merge.16
if.else.16:
  br label %if.merge.16
if.merge.16:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.98 = load i32, ptr %new_state
  %rcc.tmp.99 = load i32, ptr %event..tmp
  %rcc.tmp.100 = load i32, ptr %payload..tmp
  %rcc.tmp.101 = call i32 @complex_state_logic.(i32 %rcc.tmp.98, i32 %rcc.tmp.99, i32 %rcc.tmp.100)
  ret i32 %rcc.tmp.101
}
define i1 @validate_checksum.(i32 %payload.tmp) {
entry:
  %payload..tmp = alloca i32 
  %checksum = alloca i32 
  %i = alloca i32 
  store i32 %payload.tmp, ptr %payload..tmp
  store i32 0, ptr %checksum
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.5 = load i32, ptr %i
  %rcc.tmp.6 = load i32, ptr %payload..tmp
  %rcc.tmp.7 = icmp sle i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %payload..tmp
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = srem i32 %rcc.tmp.10, %rcc.tmp.11
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load i32, ptr %checksum
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.15, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %checksum
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.25 = load i32, ptr %checksum
  %rcc.tmp.26 = srem i32 %rcc.tmp.25, 2
  %rcc.tmp.27 = icmp eq i32 %rcc.tmp.26, 0
  ret i1 %rcc.tmp.27
}
define i32 @complex_state_logic.(i32 %state.tmp, i32 %event.tmp, i32 %payload.tmp) {
entry:
  %state..tmp = alloca i32 
  %event..tmp = alloca i32 
  %payload..tmp = alloca i32 
  %final_state = alloca i32 
  %i = alloca i32 
  %temp_val = alloca i32 
  store i32 %state.tmp, ptr %state..tmp
  store i32 %event.tmp, ptr %event..tmp
  store i32 %payload.tmp, ptr %payload..tmp
  %rcc.tmp.4 = load i32, ptr %state..tmp
  store i32 %rcc.tmp.4, ptr %final_state
  %rcc.tmp.6 = load i32, ptr %event..tmp
  %rcc.tmp.7 = icmp eq i32 %rcc.tmp.6, 6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %state..tmp
  %rcc.tmp.10 = icmp eq i32 %rcc.tmp.9, 2
  br i1 %rcc.tmp.10, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.12 = load i32, ptr %state..tmp
  %rcc.tmp.13 = load i32, ptr %payload..tmp
  %rcc.tmp.14 = call i32 @perform_recovery.(i32 %rcc.tmp.12, i32 %rcc.tmp.13)
  store i32 %rcc.tmp.14, ptr %final_state
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  store i32 0, ptr %i
  %rcc.tmp.21 = load i32, ptr %payload..tmp
  store i32 %rcc.tmp.21, ptr %temp_val
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 5
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load i32, ptr %temp_val
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 2
  %rcc.tmp.31 = sdiv i32 %rcc.tmp.28, %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = mul i32 %rcc.tmp.32, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.31, %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %temp_val
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 1
  store i32 %rcc.tmp.38, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.41 = load i32, ptr %temp_val
  %rcc.tmp.42 = srem i32 %rcc.tmp.41, 10
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.42, 0
  br i1 %rcc.tmp.43, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.45 = load i32, ptr %final_state
  %rcc.tmp.46 = icmp ne i32 %rcc.tmp.45, 4
  br i1 %rcc.tmp.46, label %if.then.4, label %if.else.4
if.then.4:
  store i32 4, ptr %final_state
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.53 = load i32, ptr %final_state
  ret i32 %rcc.tmp.53
}
define i32 @perform_recovery.(i32 %state.tmp, i32 %payload.tmp) {
entry:
  %state..tmp = alloca i32 
  %payload..tmp = alloca i32 
  %recovery_score = alloca i32 
  %i = alloca i32 
  store i32 %state.tmp, ptr %state..tmp
  store i32 %payload.tmp, ptr %payload..tmp
  store i32 0, ptr %recovery_score
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 10
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %recovery_score
  %rcc.tmp.11 = load i32, ptr %payload..tmp
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 1
  %rcc.tmp.14 = srem i32 %rcc.tmp.11, %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.10, %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %recovery_score
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %recovery_score
  %rcc.tmp.22 = icmp sgt i32 %rcc.tmp.21, 20
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  %rcc.tmp.24 = load i32, ptr %state..tmp
  ret i32 %rcc.tmp.24
if.else:
  ret i32 4
if.merge:
  ret i32 undef
}
define i32 @another_layer_of_protocol.(i32 %event.tmp, i32 %data.tmp) {
entry:
  %event..tmp = alloca i32 
  %data..tmp = alloca i32 
  %result = alloca i32 
  %i = alloca i32 
  store i32 %event.tmp, ptr %event..tmp
  store i32 %data.tmp, ptr %data..tmp
  %rcc.tmp.3 = load i32, ptr %data..tmp
  store i32 %rcc.tmp.3, ptr %result
  %rcc.tmp.5 = load i32, ptr %event..tmp
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 2
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 5
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %result
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  store i32 %rcc.tmp.16, ptr %result
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  br label %while.cond
while.end:
  br label %if.merge
if.else:
  %rcc.tmp.23 = load i32, ptr %event..tmp
  %rcc.tmp.24 = icmp eq i32 %rcc.tmp.23, 3
  br i1 %rcc.tmp.24, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.26 = load i32, ptr %result
  %rcc.tmp.27 = sub i32 %rcc.tmp.26, 10
  store i32 %rcc.tmp.27, ptr %result
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.32 = load i32, ptr %result
  ret i32 %rcc.tmp.32
}
define i32 @yet_another_protocol_function.(i32 %val1.tmp, i32 %val2.tmp) {
entry:
  %val1..tmp = alloca i32 
  %val2..tmp = alloca i32 
  %intermediate = alloca i32 
  %k = alloca i32 
  store i32 %val1.tmp, ptr %val1..tmp
  store i32 %val2.tmp, ptr %val2..tmp
  %rcc.tmp.3 = load i32, ptr %val1..tmp
  %rcc.tmp.4 = load i32, ptr %val2..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.3, %rcc.tmp.4
  store i32 %rcc.tmp.5, ptr %intermediate
  store i32 0, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %k
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 3
  br i1 %rcc.tmp.10, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.13 = load i32, ptr %k
  %rcc.tmp.14 = load i32, ptr %intermediate
  %rcc.tmp.15 = call i32 @another_layer_of_protocol.(i32 %rcc.tmp.13, i32 %rcc.tmp.14)
  store i32 %rcc.tmp.15, ptr %intermediate
  %rcc.tmp.17 = load i32, ptr %k
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %k
  br label %while.cond
while.end:
  %rcc.tmp.21 = load i32, ptr %intermediate
  ret i32 %rcc.tmp.21
}
define i32 @process_complex_packet.(i32 %a.tmp, i32 %b.tmp, i32 %c.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  %c..tmp = alloca i32 
  %res1 = alloca i32 
  %res2 = alloca i32 
  %res3 = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  store i32 %c.tmp, ptr %c..tmp
  %rcc.tmp.4 = load i32, ptr %a..tmp
  %rcc.tmp.5 = load i32, ptr %b..tmp
  %rcc.tmp.6 = call i32 @yet_another_protocol_function.(i32 %rcc.tmp.4, i32 %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %res1
  %rcc.tmp.8 = load i32, ptr %b..tmp
  %rcc.tmp.9 = load i32, ptr %c..tmp
  %rcc.tmp.10 = call i32 @yet_another_protocol_function.(i32 %rcc.tmp.8, i32 %rcc.tmp.9)
  store i32 %rcc.tmp.10, ptr %res2
  %rcc.tmp.12 = load i32, ptr %a..tmp
  %rcc.tmp.13 = load i32, ptr %c..tmp
  %rcc.tmp.14 = call i32 @yet_another_protocol_function.(i32 %rcc.tmp.12, i32 %rcc.tmp.13)
  store i32 %rcc.tmp.14, ptr %res3
  %rcc.tmp.16 = load i32, ptr %res1
  %rcc.tmp.17 = load i32, ptr %res2
  %rcc.tmp.18 = sub i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %res3
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  ret i32 %rcc.tmp.20
}
