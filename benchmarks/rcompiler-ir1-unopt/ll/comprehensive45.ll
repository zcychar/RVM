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
define void @generate_input.([512 x i32]* %data.tmp) {
entry:
  %data..tmp = alloca [512 x i32]* 
  %i = alloca i32 
  store [512 x i32]* %data.tmp, ptr %data..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 512
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 20
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 10
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %i
  %rcc.tmp.13 = add i32 %rcc.tmp.12, 0
  %rcc.tmp.14 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.15 = getelementptr [512 x i32], ptr %rcc.tmp.14, i32 0, i32 %rcc.tmp.13
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = srem i32 %rcc.tmp.16, 10
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 65
  store i32 %rcc.tmp.18, ptr %rcc.tmp.15
  br label %if.merge
if.else:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.24 = getelementptr [512 x i32], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = mul i32 %rcc.tmp.25, 17
  %rcc.tmp.27 = srem i32 %rcc.tmp.26, 15
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 97
  store i32 %rcc.tmp.28, ptr %rcc.tmp.24
  br label %if.merge
if.merge:
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  store i32 100, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 120
  br i1 %rcc.tmp.38, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.44 = getelementptr [512 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = sub i32 %rcc.tmp.46, 20
  %rcc.tmp.48 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.49 = getelementptr [512 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %rcc.tmp.49
  store i32 %rcc.tmp.50, ptr %rcc.tmp.44
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  store i32 %rcc.tmp.53, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 300, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.58 = load i32, ptr %i
  %rcc.tmp.59 = icmp slt i32 %rcc.tmp.58, 330
  br i1 %rcc.tmp.59, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.62 = load i32, ptr %i
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.65 = getelementptr [512 x i32], ptr %rcc.tmp.64, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.66 = load i32, ptr %i
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = sub i32 %rcc.tmp.67, 30
  %rcc.tmp.69 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.70 = getelementptr [512 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %rcc.tmp.65
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond.3
while.end.3:
  ret void
}
define i32 @find_longest_match.([512 x i32]* %data.tmp, i32 %current_pos.tmp, i32 %search_buffer_start.tmp) {
entry:
  %data..tmp = alloca [512 x i32]* 
  %current_pos..tmp = alloca i32 
  %search_buffer_start..tmp = alloca i32 
  %best_match_len = alloca i32 
  %best_match_offset = alloca i32 
  %max_lookahead = alloca i32 
  %i = alloca i32 
  %current_match_len = alloca i32 
  store [512 x i32]* %data.tmp, ptr %data..tmp
  store i32 %current_pos.tmp, ptr %current_pos..tmp
  store i32 %search_buffer_start.tmp, ptr %search_buffer_start..tmp
  store i32 0, ptr %best_match_len
  store i32 0, ptr %best_match_offset
  store i32 18, ptr %max_lookahead
  %rcc.tmp.7 = load i32, ptr %current_pos..tmp
  %rcc.tmp.8 = sub i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.8, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load i32, ptr %search_buffer_start..tmp
  %rcc.tmp.13 = icmp sge i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %current_match_len
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.18 = load i32, ptr %current_pos..tmp
  %rcc.tmp.19 = load i32, ptr %current_match_len
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.20, 512
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %current_match_len
  %rcc.tmp.24 = load i32, ptr %max_lookahead
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.23, %rcc.tmp.24
  br label %sc.merge
sc.merge:
  %rcc.tmp.27 = phi i1 [0, %while.cond.2], [%rcc.tmp.25, %and.rhs]
  br i1 %rcc.tmp.27, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %current_match_len
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.34 = getelementptr [512 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %current_pos..tmp
  %rcc.tmp.37 = load i32, ptr %current_match_len
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [512 x i32]*, ptr %data..tmp
  %rcc.tmp.41 = getelementptr [512 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i32, ptr %rcc.tmp.41
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.35, %rcc.tmp.42
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.45 = phi i1 [0, %sc.merge], [%rcc.tmp.43, %and.rhs.2]
  br i1 %rcc.tmp.45, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.48 = load i32, ptr %current_match_len
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %current_match_len
  br label %while.cond.2
while.end.2:
  %rcc.tmp.52 = load i32, ptr %current_match_len
  %rcc.tmp.53 = load i32, ptr %best_match_len
  %rcc.tmp.54 = icmp sgt i32 %rcc.tmp.52, %rcc.tmp.53
  br i1 %rcc.tmp.54, label %if.then, label %if.else
if.then:
  %rcc.tmp.56 = load i32, ptr %current_match_len
  store i32 %rcc.tmp.56, ptr %best_match_len
  %rcc.tmp.58 = load i32, ptr %current_pos..tmp
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = sub i32 %rcc.tmp.58, %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %best_match_offset
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = sub i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.68 = load i32, ptr %best_match_len
  %rcc.tmp.69 = icmp sge i32 %rcc.tmp.68, 3
  br i1 %rcc.tmp.69, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.71 = load i32, ptr %best_match_offset
  %rcc.tmp.72 = mul i32 %rcc.tmp.71, 1000
  %rcc.tmp.73 = load i32, ptr %best_match_len
  %rcc.tmp.74 = add i32 %rcc.tmp.72, %rcc.tmp.73
  ret i32 %rcc.tmp.74
if.else.2:
  br label %if.merge.2
if.merge.2:
  ret i32 0
}
define void @main() {
entry:
  %input_data = alloca [512 x i32] 
  %fill.idx = alloca i32 
  %compressed_data = alloca [512 x i32] 
  %fill.idx.2 = alloca i32 
  %compressed_len = alloca i32 
  %current_pos = alloca i32 
  %window_size = alloca i32 
  %search_buffer_start = alloca i32 
  %match_result = alloca i32 
  %offset = alloca i32 
  %len = alloca i32 
  %literal_value = alloca i32 
  %checksum = alloca i32 
  %i = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 512
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [512 x i32], ptr %input_data, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 512
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %compressed_len
  call void @generate_input.([512 x i32]* %input_data)
  store i32 0, ptr %current_pos
  store i32 128, ptr %window_size
  br label %while.cond
while.cond:
  %rcc.tmp.28 = load i32, ptr %current_pos
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 512
  br i1 %rcc.tmp.29, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.32 = load i32, ptr %current_pos
  %rcc.tmp.33 = load i32, ptr %window_size
  %rcc.tmp.34 = icmp sgt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then, label %if.else
if.then:
  %rcc.tmp.36 = load i32, ptr %current_pos
  %rcc.tmp.37 = load i32, ptr %window_size
  %rcc.tmp.38 = sub i32 %rcc.tmp.36, %rcc.tmp.37
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.41 = phi i32 [%rcc.tmp.38, %if.then], [0, %if.else]
  store i32 %rcc.tmp.41, ptr %search_buffer_start
  %rcc.tmp.43 = load i32, ptr %current_pos
  %rcc.tmp.44 = load i32, ptr %search_buffer_start
  %rcc.tmp.45 = call i32 @find_longest_match.([512 x i32]* %input_data, i32 %rcc.tmp.43, i32 %rcc.tmp.44)
  store i32 %rcc.tmp.45, ptr %match_result
  %rcc.tmp.47 = load i32, ptr %match_result
  %rcc.tmp.48 = icmp sgt i32 %rcc.tmp.47, 0
  br i1 %rcc.tmp.48, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.50 = load i32, ptr %match_result
  %rcc.tmp.51 = sdiv i32 %rcc.tmp.50, 1000
  store i32 %rcc.tmp.51, ptr %offset
  %rcc.tmp.53 = load i32, ptr %match_result
  %rcc.tmp.54 = srem i32 %rcc.tmp.53, 1000
  store i32 %rcc.tmp.54, ptr %len
  %rcc.tmp.56 = load i32, ptr %compressed_len
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.57
  store i32 1, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %compressed_len
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %compressed_len
  %rcc.tmp.63 = load i32, ptr %compressed_len
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %offset
  store i32 %rcc.tmp.66, ptr %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %compressed_len
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %compressed_len
  %rcc.tmp.71 = load i32, ptr %compressed_len
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %len
  store i32 %rcc.tmp.74, ptr %rcc.tmp.73
  %rcc.tmp.76 = load i32, ptr %compressed_len
  %rcc.tmp.77 = add i32 %rcc.tmp.76, 1
  store i32 %rcc.tmp.77, ptr %compressed_len
  %rcc.tmp.79 = load i32, ptr %current_pos
  %rcc.tmp.80 = load i32, ptr %len
  %rcc.tmp.81 = add i32 %rcc.tmp.79, %rcc.tmp.80
  store i32 %rcc.tmp.81, ptr %current_pos
  br label %if.merge.2
if.else.2:
  %rcc.tmp.84 = load i32, ptr %current_pos
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = getelementptr [512 x i32], ptr %input_data, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %literal_value
  %rcc.tmp.89 = load i32, ptr %compressed_len
  %rcc.tmp.90 = icmp slt i32 %rcc.tmp.89, 510
  br i1 %rcc.tmp.90, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.92 = load i32, ptr %compressed_len
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.93
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %compressed_len
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %compressed_len
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.101 = load i32, ptr %compressed_len
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load i32, ptr %literal_value
  store i32 %rcc.tmp.104, ptr %rcc.tmp.103
  %rcc.tmp.106 = load i32, ptr %compressed_len
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %compressed_len
  %rcc.tmp.109 = load i32, ptr %current_pos
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %current_pos
  br label %if.merge.2
if.merge.2:
  br label %while.cond
while.end:
  store i32 0, ptr %checksum
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = load i32, ptr %compressed_len
  %rcc.tmp.119 = icmp slt i32 %rcc.tmp.117, %rcc.tmp.118
  br i1 %rcc.tmp.119, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.122 = load i32, ptr %checksum
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = add i32 %rcc.tmp.123, 0
  %rcc.tmp.125 = getelementptr [512 x i32], ptr %compressed_data, i32 0, i32 %rcc.tmp.124
  %rcc.tmp.126 = load i32, ptr %rcc.tmp.125
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 1
  %rcc.tmp.129 = mul i32 %rcc.tmp.126, %rcc.tmp.128
  %rcc.tmp.130 = add i32 %rcc.tmp.122, %rcc.tmp.129
  store i32 %rcc.tmp.130, ptr %checksum
  %rcc.tmp.132 = load i32, ptr %i
  %rcc.tmp.133 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.133, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.136 = load i32, ptr %checksum
  call void @printlnInt.(i32 %rcc.tmp.136)
  %rcc.tmp.138 = load i32, ptr %compressed_len
  call void @printlnInt.(i32 %rcc.tmp.138)
  call void @exit.(i32 0)
  ret void
}
