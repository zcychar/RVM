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
define void @setup_fsm.([8 x [3 x i32]]* %transition_table.tmp, [8 x [3 x i32]]* %output_table.tmp) {
entry:
  %transition_table..tmp = alloca [8 x [3 x i32]]* 
  %output_table..tmp = alloca [8 x [3 x i32]]* 
  store [8 x [3 x i32]]* %transition_table.tmp, ptr %transition_table..tmp
  store [8 x [3 x i32]]* %output_table.tmp, ptr %output_table..tmp
  %rcc.tmp.3 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.4 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = getelementptr [3 x i32], ptr %rcc.tmp.4, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.5
  %rcc.tmp.7 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.8 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.7, i32 0, i32 0
  %rcc.tmp.9 = getelementptr [3 x i32], ptr %rcc.tmp.8, i32 0, i32 1
  store i32 2, ptr %rcc.tmp.9
  %rcc.tmp.11 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.12 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = getelementptr [3 x i32], ptr %rcc.tmp.12, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.16 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.15, i32 0, i32 0
  %rcc.tmp.17 = getelementptr [3 x i32], ptr %rcc.tmp.16, i32 0, i32 0
  store i32 1, ptr %rcc.tmp.17
  %rcc.tmp.19 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.20 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.19, i32 0, i32 0
  %rcc.tmp.21 = getelementptr [3 x i32], ptr %rcc.tmp.20, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.24 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.23, i32 0, i32 0
  %rcc.tmp.25 = getelementptr [3 x i32], ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = sub i32 0, 1
  store i32 %rcc.tmp.26, ptr %rcc.tmp.25
  %rcc.tmp.28 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.29 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.28, i32 0, i32 1
  %rcc.tmp.30 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 0
  store i32 3, ptr %rcc.tmp.30
  %rcc.tmp.32 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.33 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.32, i32 0, i32 1
  %rcc.tmp.34 = getelementptr [3 x i32], ptr %rcc.tmp.33, i32 0, i32 1
  store i32 4, ptr %rcc.tmp.34
  %rcc.tmp.36 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.37 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.36, i32 0, i32 1
  %rcc.tmp.38 = getelementptr [3 x i32], ptr %rcc.tmp.37, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.38
  %rcc.tmp.40 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.41 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.40, i32 0, i32 1
  %rcc.tmp.42 = getelementptr [3 x i32], ptr %rcc.tmp.41, i32 0, i32 0
  store i32 2, ptr %rcc.tmp.42
  %rcc.tmp.44 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.45 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.44, i32 0, i32 1
  %rcc.tmp.46 = getelementptr [3 x i32], ptr %rcc.tmp.45, i32 0, i32 1
  store i32 3, ptr %rcc.tmp.46
  %rcc.tmp.48 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.49 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.48, i32 0, i32 1
  %rcc.tmp.50 = getelementptr [3 x i32], ptr %rcc.tmp.49, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.53 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.52, i32 0, i32 2
  %rcc.tmp.54 = getelementptr [3 x i32], ptr %rcc.tmp.53, i32 0, i32 0
  store i32 5, ptr %rcc.tmp.54
  %rcc.tmp.56 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.57 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.56, i32 0, i32 2
  %rcc.tmp.58 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 1
  store i32 6, ptr %rcc.tmp.58
  %rcc.tmp.60 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.61 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.60, i32 0, i32 2
  %rcc.tmp.62 = getelementptr [3 x i32], ptr %rcc.tmp.61, i32 0, i32 2
  store i32 1, ptr %rcc.tmp.62
  %rcc.tmp.64 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.65 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.64, i32 0, i32 2
  %rcc.tmp.66 = getelementptr [3 x i32], ptr %rcc.tmp.65, i32 0, i32 0
  store i32 5, ptr %rcc.tmp.66
  %rcc.tmp.68 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.69 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.68, i32 0, i32 2
  %rcc.tmp.70 = getelementptr [3 x i32], ptr %rcc.tmp.69, i32 0, i32 1
  store i32 8, ptr %rcc.tmp.70
  %rcc.tmp.72 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.73 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.72, i32 0, i32 2
  %rcc.tmp.74 = getelementptr [3 x i32], ptr %rcc.tmp.73, i32 0, i32 2
  store i32 13, ptr %rcc.tmp.74
  %rcc.tmp.76 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.77 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.76, i32 0, i32 3
  %rcc.tmp.78 = getelementptr [3 x i32], ptr %rcc.tmp.77, i32 0, i32 0
  store i32 7, ptr %rcc.tmp.78
  %rcc.tmp.80 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.81 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.80, i32 0, i32 3
  %rcc.tmp.82 = getelementptr [3 x i32], ptr %rcc.tmp.81, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.85 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.84, i32 0, i32 3
  %rcc.tmp.86 = getelementptr [3 x i32], ptr %rcc.tmp.85, i32 0, i32 2
  store i32 1, ptr %rcc.tmp.86
  %rcc.tmp.88 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.89 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.88, i32 0, i32 3
  %rcc.tmp.90 = getelementptr [3 x i32], ptr %rcc.tmp.89, i32 0, i32 0
  store i32 21, ptr %rcc.tmp.90
  %rcc.tmp.92 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.93 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.92, i32 0, i32 3
  %rcc.tmp.94 = getelementptr [3 x i32], ptr %rcc.tmp.93, i32 0, i32 1
  store i32 34, ptr %rcc.tmp.94
  %rcc.tmp.96 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.97 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.96, i32 0, i32 3
  %rcc.tmp.98 = getelementptr [3 x i32], ptr %rcc.tmp.97, i32 0, i32 2
  store i32 55, ptr %rcc.tmp.98
  %rcc.tmp.100 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.101 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.100, i32 0, i32 4
  %rcc.tmp.102 = getelementptr [3 x i32], ptr %rcc.tmp.101, i32 0, i32 0
  store i32 2, ptr %rcc.tmp.102
  %rcc.tmp.104 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.105 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.104, i32 0, i32 4
  %rcc.tmp.106 = getelementptr [3 x i32], ptr %rcc.tmp.105, i32 0, i32 1
  store i32 5, ptr %rcc.tmp.106
  %rcc.tmp.108 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.109 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.108, i32 0, i32 4
  %rcc.tmp.110 = getelementptr [3 x i32], ptr %rcc.tmp.109, i32 0, i32 2
  store i32 4, ptr %rcc.tmp.110
  %rcc.tmp.112 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.113 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.112, i32 0, i32 4
  %rcc.tmp.114 = getelementptr [3 x i32], ptr %rcc.tmp.113, i32 0, i32 0
  %rcc.tmp.115 = sub i32 0, 1
  store i32 %rcc.tmp.115, ptr %rcc.tmp.114
  %rcc.tmp.117 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.118 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.117, i32 0, i32 4
  %rcc.tmp.119 = getelementptr [3 x i32], ptr %rcc.tmp.118, i32 0, i32 1
  %rcc.tmp.120 = sub i32 0, 2
  store i32 %rcc.tmp.120, ptr %rcc.tmp.119
  %rcc.tmp.122 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.123 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.122, i32 0, i32 4
  %rcc.tmp.124 = getelementptr [3 x i32], ptr %rcc.tmp.123, i32 0, i32 2
  %rcc.tmp.125 = sub i32 0, 3
  store i32 %rcc.tmp.125, ptr %rcc.tmp.124
  %rcc.tmp.127 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.128 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.127, i32 0, i32 5
  %rcc.tmp.129 = getelementptr [3 x i32], ptr %rcc.tmp.128, i32 0, i32 0
  store i32 6, ptr %rcc.tmp.129
  %rcc.tmp.131 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.132 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.131, i32 0, i32 5
  %rcc.tmp.133 = getelementptr [3 x i32], ptr %rcc.tmp.132, i32 0, i32 1
  store i32 7, ptr %rcc.tmp.133
  %rcc.tmp.135 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.136 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.135, i32 0, i32 5
  %rcc.tmp.137 = getelementptr [3 x i32], ptr %rcc.tmp.136, i32 0, i32 2
  store i32 3, ptr %rcc.tmp.137
  %rcc.tmp.139 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.140 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.139, i32 0, i32 5
  %rcc.tmp.141 = getelementptr [3 x i32], ptr %rcc.tmp.140, i32 0, i32 0
  store i32 10, ptr %rcc.tmp.141
  %rcc.tmp.143 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.144 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.143, i32 0, i32 5
  %rcc.tmp.145 = getelementptr [3 x i32], ptr %rcc.tmp.144, i32 0, i32 1
  store i32 20, ptr %rcc.tmp.145
  %rcc.tmp.147 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.148 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.147, i32 0, i32 5
  %rcc.tmp.149 = getelementptr [3 x i32], ptr %rcc.tmp.148, i32 0, i32 2
  store i32 30, ptr %rcc.tmp.149
  %rcc.tmp.151 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.152 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.151, i32 0, i32 6
  %rcc.tmp.153 = getelementptr [3 x i32], ptr %rcc.tmp.152, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.153
  %rcc.tmp.155 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.156 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.155, i32 0, i32 6
  %rcc.tmp.157 = getelementptr [3 x i32], ptr %rcc.tmp.156, i32 0, i32 1
  store i32 1, ptr %rcc.tmp.157
  %rcc.tmp.159 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.160 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.159, i32 0, i32 6
  %rcc.tmp.161 = getelementptr [3 x i32], ptr %rcc.tmp.160, i32 0, i32 2
  store i32 2, ptr %rcc.tmp.161
  %rcc.tmp.163 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.164 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.163, i32 0, i32 6
  %rcc.tmp.165 = getelementptr [3 x i32], ptr %rcc.tmp.164, i32 0, i32 0
  store i32 40, ptr %rcc.tmp.165
  %rcc.tmp.167 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.168 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.167, i32 0, i32 6
  %rcc.tmp.169 = getelementptr [3 x i32], ptr %rcc.tmp.168, i32 0, i32 1
  store i32 50, ptr %rcc.tmp.169
  %rcc.tmp.171 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.172 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.171, i32 0, i32 6
  %rcc.tmp.173 = getelementptr [3 x i32], ptr %rcc.tmp.172, i32 0, i32 2
  store i32 60, ptr %rcc.tmp.173
  %rcc.tmp.175 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.176 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.175, i32 0, i32 7
  %rcc.tmp.177 = getelementptr [3 x i32], ptr %rcc.tmp.176, i32 0, i32 0
  store i32 4, ptr %rcc.tmp.177
  %rcc.tmp.179 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.180 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.179, i32 0, i32 7
  %rcc.tmp.181 = getelementptr [3 x i32], ptr %rcc.tmp.180, i32 0, i32 1
  store i32 3, ptr %rcc.tmp.181
  %rcc.tmp.183 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.184 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.183, i32 0, i32 7
  %rcc.tmp.185 = getelementptr [3 x i32], ptr %rcc.tmp.184, i32 0, i32 2
  store i32 5, ptr %rcc.tmp.185
  %rcc.tmp.187 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.188 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.187, i32 0, i32 7
  %rcc.tmp.189 = getelementptr [3 x i32], ptr %rcc.tmp.188, i32 0, i32 0
  store i32 70, ptr %rcc.tmp.189
  %rcc.tmp.191 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.192 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.191, i32 0, i32 7
  %rcc.tmp.193 = getelementptr [3 x i32], ptr %rcc.tmp.192, i32 0, i32 1
  store i32 80, ptr %rcc.tmp.193
  %rcc.tmp.195 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.196 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.195, i32 0, i32 7
  %rcc.tmp.197 = getelementptr [3 x i32], ptr %rcc.tmp.196, i32 0, i32 2
  store i32 90, ptr %rcc.tmp.197
  ret void
}
define i32 @run_fsm.([8 x [3 x i32]]* %transition_table.tmp, [8 x [3 x i32]]* %output_table.tmp, [100 x i32]* %inputs.tmp, i32 %len.tmp) {
entry:
  %transition_table..tmp = alloca [8 x [3 x i32]]* 
  %output_table..tmp = alloca [8 x [3 x i32]]* 
  %inputs..local = alloca [100 x i32] 
  %len..tmp = alloca i32 
  %current_state = alloca i32 
  %accumulated_output = alloca i32 
  %i = alloca i32 
  %input = alloca i32 
  %output = alloca i32 
  %next_state = alloca i32 
  %j = alloca i32 
  %temp_calc = alloca i32 
  store [8 x [3 x i32]]* %transition_table.tmp, ptr %transition_table..tmp
  store [8 x [3 x i32]]* %output_table.tmp, ptr %output_table..tmp
  %rcc.tmp.3 = bitcast [100 x i32]* %inputs..local to i8*
  %rcc.tmp.4 = bitcast [100 x i32]* %inputs.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.3, i8* %rcc.tmp.4, i32 400, i1 0)
  store i32 %len.tmp, ptr %len..tmp
  store i32 0, ptr %current_state
  store i32 0, ptr %accumulated_output
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = load i32, ptr %len..tmp
  %rcc.tmp.13 = icmp slt i32 %rcc.tmp.11, %rcc.tmp.12
  br i1 %rcc.tmp.13, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = getelementptr [100 x i32], ptr %inputs..local, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %input
  %rcc.tmp.21 = load i32, ptr %input
  %rcc.tmp.22 = icmp sge i32 %rcc.tmp.21, 0
  br i1 %rcc.tmp.22, label %if.then, label %if.else
if.then:
  %rcc.tmp.24 = load i32, ptr %input
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 3
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %current_state
  %rcc.tmp.28 = load [8 x [3 x i32]]*, ptr %output_table..tmp
  %rcc.tmp.29 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %input
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.32
  store i32 %rcc.tmp.33, ptr %output
  %rcc.tmp.35 = load i32, ptr %current_state
  %rcc.tmp.36 = load [8 x [3 x i32]]*, ptr %transition_table..tmp
  %rcc.tmp.37 = getelementptr [8 x [3 x i32]], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %input
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = getelementptr [3 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  store i32 %rcc.tmp.41, ptr %next_state
  %rcc.tmp.43 = load i32, ptr %output
  %rcc.tmp.44 = icmp sgt i32 %rcc.tmp.43, 0
  br i1 %rcc.tmp.44, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.46 = load i32, ptr %current_state
  %rcc.tmp.47 = urem i32 %rcc.tmp.46, 2
  %rcc.tmp.48 = icmp eq i32 %rcc.tmp.47, 0
  br i1 %rcc.tmp.48, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.50 = load i32, ptr %accumulated_output
  %rcc.tmp.51 = load i32, ptr %output
  %rcc.tmp.52 = mul i32 %rcc.tmp.51, 2
  %rcc.tmp.53 = add i32 %rcc.tmp.50, %rcc.tmp.52
  store i32 %rcc.tmp.53, ptr %accumulated_output
  br label %if.merge.4
if.else.4:
  %rcc.tmp.56 = load i32, ptr %accumulated_output
  %rcc.tmp.57 = load i32, ptr %output
  %rcc.tmp.58 = add i32 %rcc.tmp.56, %rcc.tmp.57
  store i32 %rcc.tmp.58, ptr %accumulated_output
  br label %if.merge.4
if.merge.4:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.62 = load i32, ptr %accumulated_output
  %rcc.tmp.63 = icmp sgt i32 %rcc.tmp.62, 100
  br i1 %rcc.tmp.63, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.65 = load i32, ptr %accumulated_output
  %rcc.tmp.66 = load i32, ptr %output
  %rcc.tmp.67 = add i32 %rcc.tmp.65, %rcc.tmp.66
  store i32 %rcc.tmp.67, ptr %accumulated_output
  br label %if.merge.5
if.else.5:
  %rcc.tmp.70 = load i32, ptr %accumulated_output
  %rcc.tmp.71 = load i32, ptr %output
  %rcc.tmp.72 = sub i32 %rcc.tmp.70, %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %accumulated_output
  br label %if.merge.5
if.merge.5:
  br label %if.merge.3
if.merge.3:
  store i32 0, ptr %j
  store i32 0, ptr %temp_calc
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.79 = load i32, ptr %j
  %rcc.tmp.80 = load i32, ptr %output
  %rcc.tmp.81 = srem i32 %rcc.tmp.80, 10
  %rcc.tmp.82 = icmp slt i32 %rcc.tmp.79, %rcc.tmp.81
  br i1 %rcc.tmp.82, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.85 = load i32, ptr %j
  %rcc.tmp.86 = srem i32 %rcc.tmp.85, 2
  %rcc.tmp.87 = icmp eq i32 %rcc.tmp.86, 0
  br i1 %rcc.tmp.87, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.89 = load i32, ptr %temp_calc
  %rcc.tmp.90 = load i32, ptr %j
  %rcc.tmp.91 = add i32 %rcc.tmp.89, %rcc.tmp.90
  store i32 %rcc.tmp.91, ptr %temp_calc
  br label %if.merge.6
if.else.6:
  %rcc.tmp.94 = load i32, ptr %temp_calc
  %rcc.tmp.95 = load i32, ptr %j
  %rcc.tmp.96 = sub i32 %rcc.tmp.94, %rcc.tmp.95
  store i32 %rcc.tmp.96, ptr %temp_calc
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.99 = load i32, ptr %j
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.103 = load i32, ptr %accumulated_output
  %rcc.tmp.104 = load i32, ptr %temp_calc
  %rcc.tmp.105 = add i32 %rcc.tmp.103, %rcc.tmp.104
  store i32 %rcc.tmp.105, ptr %accumulated_output
  %rcc.tmp.107 = load i32, ptr %next_state
  store i32 %rcc.tmp.107, ptr %current_state
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 1
  store i32 %rcc.tmp.114, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.117 = load i32, ptr %accumulated_output
  ret i32 %rcc.tmp.117
}
define void @generate_inputs.([100 x i32]* sret([100 x i32]) %ret.slot, i32 %seed.tmp, i32 %len.tmp) {
entry:
  %seed..tmp = alloca i32 
  %len..tmp = alloca i32 
  %inputs = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %current_val = alloca i32 
  %i = alloca i32 
  store i32 %seed.tmp, ptr %seed..tmp
  store i32 %len.tmp, ptr %len..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 100
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [100 x i32], ptr %inputs, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.14 = load i32, ptr %seed..tmp
  store i32 %rcc.tmp.14, ptr %current_val
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = load i32, ptr %len..tmp
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.18, %rcc.tmp.19
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %current_val
  %rcc.tmp.24 = call i32 @pm_rand_update.(i32 %rcc.tmp.23)
  %rcc.tmp.25 = sdiv i32 %rcc.tmp.24, 65536
  store i32 %rcc.tmp.25, ptr %current_val
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = getelementptr [100 x i32], ptr %inputs, i32 0, i32 %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %current_val
  %rcc.tmp.31 = srem i32 %rcc.tmp.30, 3
  store i32 %rcc.tmp.31, ptr %rcc.tmp.29
  %rcc.tmp.33 = load i32, ptr %i
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 1
  store i32 %rcc.tmp.34, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.37 = bitcast [100 x i32]* %ret.slot to i8*
  %rcc.tmp.38 = bitcast [100 x i32]* %inputs to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.37, i8* %rcc.tmp.38, i32 400, i1 0)
  ret void
}
define void @main() {
entry:
  %transition_table = alloca [8 x [3 x i32]] 
  %output_table = alloca [8 x [3 x i32]] 
  %inputs1 = alloca [100 x i32] 
  %result1 = alloca i32 
  %inputs2 = alloca [100 x i32] 
  %result2 = alloca i32 
  %custom_inputs = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %result3 = alloca i32 
  %counter = alloca i32 
  %outer_loop = alloca i32 
  %inner_loop = alloca i32 
  %a = alloca i32 
  %b = alloca i32 
  %c = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  %z = alloca i32 
  %i.2 = alloca i32 
  %sel = alloca i32 
  %shadow = alloca i32 
  %shadow.2 = alloca i32 
  %shadow.3 = alloca i32 
  %k = alloca i32 
  %loop_var = alloca i32 
  %m = alloca i32 
  %another_loop_var = alloca i32 
  %another_loop_var.2 = alloca i32 
  %final_val = alloca i32 
  %p = alloca i32 
  %temp = alloca i32 
  %temp.2 = alloca i32 
  %rcc.tmp.1 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 0
  %rcc.tmp.2 = getelementptr [3 x i32], ptr %rcc.tmp.1, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [3 x i32], ptr %rcc.tmp.1, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [3 x i32], ptr %rcc.tmp.1, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 1
  %rcc.tmp.9 = getelementptr [3 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [3 x i32], ptr %rcc.tmp.8, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [3 x i32], ptr %rcc.tmp.8, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 2
  %rcc.tmp.16 = getelementptr [3 x i32], ptr %rcc.tmp.15, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [3 x i32], ptr %rcc.tmp.15, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [3 x i32], ptr %rcc.tmp.15, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 3
  %rcc.tmp.23 = getelementptr [3 x i32], ptr %rcc.tmp.22, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [3 x i32], ptr %rcc.tmp.22, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [3 x i32], ptr %rcc.tmp.22, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 4
  %rcc.tmp.30 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [3 x i32], ptr %rcc.tmp.29, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 5
  %rcc.tmp.37 = getelementptr [3 x i32], ptr %rcc.tmp.36, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [3 x i32], ptr %rcc.tmp.36, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [3 x i32], ptr %rcc.tmp.36, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 6
  %rcc.tmp.44 = getelementptr [3 x i32], ptr %rcc.tmp.43, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [3 x i32], ptr %rcc.tmp.43, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [3 x i32], ptr %rcc.tmp.43, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [8 x [3 x i32]], ptr %transition_table, i32 0, i32 7
  %rcc.tmp.51 = getelementptr [3 x i32], ptr %rcc.tmp.50, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [3 x i32], ptr %rcc.tmp.50, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [3 x i32], ptr %rcc.tmp.50, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 0
  %rcc.tmp.58 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [3 x i32], ptr %rcc.tmp.57, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 1
  %rcc.tmp.65 = getelementptr [3 x i32], ptr %rcc.tmp.64, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [3 x i32], ptr %rcc.tmp.64, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [3 x i32], ptr %rcc.tmp.64, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 2
  %rcc.tmp.72 = getelementptr [3 x i32], ptr %rcc.tmp.71, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [3 x i32], ptr %rcc.tmp.71, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [3 x i32], ptr %rcc.tmp.71, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 3
  %rcc.tmp.79 = getelementptr [3 x i32], ptr %rcc.tmp.78, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [3 x i32], ptr %rcc.tmp.78, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [3 x i32], ptr %rcc.tmp.78, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 4
  %rcc.tmp.86 = getelementptr [3 x i32], ptr %rcc.tmp.85, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [3 x i32], ptr %rcc.tmp.85, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [3 x i32], ptr %rcc.tmp.85, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.90
  %rcc.tmp.92 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 5
  %rcc.tmp.93 = getelementptr [3 x i32], ptr %rcc.tmp.92, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [3 x i32], ptr %rcc.tmp.92, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = getelementptr [3 x i32], ptr %rcc.tmp.92, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 6
  %rcc.tmp.100 = getelementptr [3 x i32], ptr %rcc.tmp.99, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.100
  %rcc.tmp.102 = getelementptr [3 x i32], ptr %rcc.tmp.99, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.102
  %rcc.tmp.104 = getelementptr [3 x i32], ptr %rcc.tmp.99, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.104
  %rcc.tmp.106 = getelementptr [8 x [3 x i32]], ptr %output_table, i32 0, i32 7
  %rcc.tmp.107 = getelementptr [3 x i32], ptr %rcc.tmp.106, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [3 x i32], ptr %rcc.tmp.106, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [3 x i32], ptr %rcc.tmp.106, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.111
  %rcc.tmp.113 = bitcast [8 x [3 x i32]]* %transition_table to [8 x [3 x i32]]*
  call void @setup_fsm.([8 x [3 x i32]]* %rcc.tmp.113, [8 x [3 x i32]]* %output_table)
  call void @generate_inputs.([100 x i32]* %inputs1, i32 42, i32 100)
  %rcc.tmp.116 = bitcast [8 x [3 x i32]]* %transition_table to [8 x [3 x i32]]*
  %rcc.tmp.117 = call i32 @run_fsm.([8 x [3 x i32]]* %rcc.tmp.116, [8 x [3 x i32]]* %output_table, [100 x i32]* %inputs1, i32 100)
  store i32 %rcc.tmp.117, ptr %result1
  %rcc.tmp.119 = load i32, ptr %result1
  call void @printlnInt.(i32 %rcc.tmp.119)
  call void @generate_inputs.([100 x i32]* %inputs2, i32 1337, i32 80)
  %rcc.tmp.122 = bitcast [8 x [3 x i32]]* %transition_table to [8 x [3 x i32]]*
  %rcc.tmp.123 = call i32 @run_fsm.([8 x [3 x i32]]* %rcc.tmp.122, [8 x [3 x i32]]* %output_table, [100 x i32]* %inputs2, i32 80)
  store i32 %rcc.tmp.123, ptr %result2
  %rcc.tmp.125 = load i32, ptr %result2
  call void @printlnInt.(i32 %rcc.tmp.125)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.129 = load i32, ptr %fill.idx
  %rcc.tmp.130 = icmp slt i32 %rcc.tmp.129, 100
  br i1 %rcc.tmp.130, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.132 = load i32, ptr %fill.idx
  %rcc.tmp.133 = getelementptr [100 x i32], ptr %custom_inputs, i32 0, i32 %rcc.tmp.132
  store i32 0, ptr %rcc.tmp.133
  %rcc.tmp.135 = add i32 %rcc.tmp.132, 1
  store i32 %rcc.tmp.135, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.140 = load i32, ptr %i
  %rcc.tmp.141 = icmp slt i32 %rcc.tmp.140, 50
  br i1 %rcc.tmp.141, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.144 = load i32, ptr %i
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 0
  %rcc.tmp.146 = getelementptr [100 x i32], ptr %custom_inputs, i32 0, i32 %rcc.tmp.145
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = mul i32 %rcc.tmp.147, %rcc.tmp.148
  %rcc.tmp.150 = srem i32 %rcc.tmp.149, 3
  store i32 %rcc.tmp.150, ptr %rcc.tmp.146
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.153, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.156 = bitcast [8 x [3 x i32]]* %transition_table to [8 x [3 x i32]]*
  %rcc.tmp.157 = call i32 @run_fsm.([8 x [3 x i32]]* %rcc.tmp.156, [8 x [3 x i32]]* %output_table, [100 x i32]* %custom_inputs, i32 50)
  store i32 %rcc.tmp.157, ptr %result3
  %rcc.tmp.159 = load i32, ptr %result3
  call void @printlnInt.(i32 %rcc.tmp.159)
  store i32 0, ptr %counter
  store i32 0, ptr %outer_loop
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.164 = load i32, ptr %outer_loop
  %rcc.tmp.165 = icmp slt i32 %rcc.tmp.164, 10
  br i1 %rcc.tmp.165, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  store i32 0, ptr %inner_loop
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.170 = load i32, ptr %inner_loop
  %rcc.tmp.171 = icmp slt i32 %rcc.tmp.170, 10
  br i1 %rcc.tmp.171, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.174 = load i32, ptr %outer_loop
  %rcc.tmp.175 = srem i32 %rcc.tmp.174, 2
  %rcc.tmp.176 = icmp eq i32 %rcc.tmp.175, 0
  br i1 %rcc.tmp.176, label %if.then, label %if.else
if.then:
  %rcc.tmp.178 = load i32, ptr %inner_loop
  %rcc.tmp.179 = srem i32 %rcc.tmp.178, 3
  %rcc.tmp.180 = icmp eq i32 %rcc.tmp.179, 0
  br i1 %rcc.tmp.180, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.182 = load i32, ptr %counter
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 1
  store i32 %rcc.tmp.183, ptr %counter
  br label %if.merge.2
if.else.2:
  %rcc.tmp.186 = load i32, ptr %counter
  %rcc.tmp.187 = sub i32 %rcc.tmp.186, 1
  store i32 %rcc.tmp.187, ptr %counter
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  %rcc.tmp.191 = load i32, ptr %inner_loop
  %rcc.tmp.192 = srem i32 %rcc.tmp.191, 2
  %rcc.tmp.193 = icmp eq i32 %rcc.tmp.192, 0
  br i1 %rcc.tmp.193, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.195 = load i32, ptr %counter
  %rcc.tmp.196 = add i32 %rcc.tmp.195, 2
  store i32 %rcc.tmp.196, ptr %counter
  br label %if.merge.3
if.else.3:
  %rcc.tmp.199 = load i32, ptr %counter
  %rcc.tmp.200 = sub i32 %rcc.tmp.199, 2
  store i32 %rcc.tmp.200, ptr %counter
  br label %if.merge.3
if.merge.3:
  br label %if.merge
if.merge:
  %rcc.tmp.204 = load i32, ptr %inner_loop
  %rcc.tmp.205 = add i32 %rcc.tmp.204, 1
  store i32 %rcc.tmp.205, ptr %inner_loop
  br label %while.cond.3
while.end.3:
  %rcc.tmp.208 = load i32, ptr %outer_loop
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 1
  store i32 %rcc.tmp.209, ptr %outer_loop
  br label %while.cond.2
while.end.2:
  %rcc.tmp.212 = load i32, ptr %counter
  call void @printlnInt.(i32 %rcc.tmp.212)
  store i32 10, ptr %a
  store i32 20, ptr %b
  store i32 30, ptr %c
  %rcc.tmp.217 = load i32, ptr %a
  %rcc.tmp.218 = load i32, ptr %b
  %rcc.tmp.219 = icmp sgt i32 %rcc.tmp.217, %rcc.tmp.218
  br i1 %rcc.tmp.219, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.221 = load i32, ptr %b
  %rcc.tmp.222 = load i32, ptr %c
  %rcc.tmp.223 = icmp sgt i32 %rcc.tmp.221, %rcc.tmp.222
  br i1 %rcc.tmp.223, label %if.then.5, label %if.else.5
if.then.5:
  call void @printlnInt.(i32 1)
  br label %if.merge.5
if.else.5:
  call void @printlnInt.(i32 2)
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.230 = load i32, ptr %b
  %rcc.tmp.231 = load i32, ptr %c
  %rcc.tmp.232 = icmp slt i32 %rcc.tmp.230, %rcc.tmp.231
  br i1 %rcc.tmp.232, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.234 = load i32, ptr %a
  %rcc.tmp.235 = load i32, ptr %c
  %rcc.tmp.236 = icmp slt i32 %rcc.tmp.234, %rcc.tmp.235
  br i1 %rcc.tmp.236, label %if.then.7, label %if.else.7
if.then.7:
  call void @printlnInt.(i32 3)
  br label %if.merge.7
if.else.7:
  call void @printlnInt.(i32 4)
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  call void @printlnInt.(i32 5)
  br label %if.merge.6
if.merge.6:
  br label %if.merge.4
if.merge.4:
  store i32 0, ptr %x
  store i32 0, ptr %y
  store i32 0, ptr %z
  store i32 0, ptr %i.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.251 = load i32, ptr %i.2
  %rcc.tmp.252 = icmp slt i32 %rcc.tmp.251, 100
  br i1 %rcc.tmp.252, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.255 = load i32, ptr %i.2
  %rcc.tmp.256 = srem i32 %rcc.tmp.255, 6
  store i32 %rcc.tmp.256, ptr %sel
  %rcc.tmp.258 = load i32, ptr %sel
  %rcc.tmp.259 = icmp eq i32 %rcc.tmp.258, 0
  br i1 %rcc.tmp.259, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.261 = load i32, ptr %x
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 1
  store i32 %rcc.tmp.262, ptr %x
  br label %if.merge.8
if.else.8:
  %rcc.tmp.265 = load i32, ptr %sel
  %rcc.tmp.266 = icmp eq i32 %rcc.tmp.265, 1
  br i1 %rcc.tmp.266, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.268 = load i32, ptr %x
  %rcc.tmp.269 = sub i32 %rcc.tmp.268, 1
  store i32 %rcc.tmp.269, ptr %x
  br label %if.merge.9
if.else.9:
  %rcc.tmp.272 = load i32, ptr %sel
  %rcc.tmp.273 = icmp eq i32 %rcc.tmp.272, 2
  br i1 %rcc.tmp.273, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.275 = load i32, ptr %y
  %rcc.tmp.276 = load i32, ptr %x
  %rcc.tmp.277 = add i32 %rcc.tmp.275, %rcc.tmp.276
  store i32 %rcc.tmp.277, ptr %y
  br label %if.merge.10
if.else.10:
  %rcc.tmp.280 = load i32, ptr %sel
  %rcc.tmp.281 = icmp eq i32 %rcc.tmp.280, 3
  br i1 %rcc.tmp.281, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.283 = load i32, ptr %y
  %rcc.tmp.284 = load i32, ptr %x
  %rcc.tmp.285 = sub i32 %rcc.tmp.283, %rcc.tmp.284
  store i32 %rcc.tmp.285, ptr %y
  br label %if.merge.11
if.else.11:
  %rcc.tmp.288 = load i32, ptr %sel
  %rcc.tmp.289 = icmp eq i32 %rcc.tmp.288, 4
  br i1 %rcc.tmp.289, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.291 = load i32, ptr %z
  %rcc.tmp.292 = load i32, ptr %y
  %rcc.tmp.293 = add i32 %rcc.tmp.291, %rcc.tmp.292
  store i32 %rcc.tmp.293, ptr %z
  br label %if.merge.12
if.else.12:
  %rcc.tmp.296 = load i32, ptr %z
  %rcc.tmp.297 = load i32, ptr %y
  %rcc.tmp.298 = sub i32 %rcc.tmp.296, %rcc.tmp.297
  store i32 %rcc.tmp.298, ptr %z
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.305 = load i32, ptr %i.2
  %rcc.tmp.306 = add i32 %rcc.tmp.305, 1
  store i32 %rcc.tmp.306, ptr %i.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.309 = load i32, ptr %x
  call void @printlnInt.(i32 %rcc.tmp.309)
  %rcc.tmp.311 = load i32, ptr %y
  call void @printlnInt.(i32 %rcc.tmp.311)
  %rcc.tmp.313 = load i32, ptr %z
  call void @printlnInt.(i32 %rcc.tmp.313)
  store i32 100, ptr %shadow
  %rcc.tmp.316 = load i32, ptr %shadow
  %rcc.tmp.317 = icmp sgt i32 %rcc.tmp.316, 50
  br i1 %rcc.tmp.317, label %if.then.13, label %if.else.13
if.then.13:
  store i32 200, ptr %shadow.2
  %rcc.tmp.320 = load i32, ptr %shadow.2
  %rcc.tmp.321 = icmp sgt i32 %rcc.tmp.320, 150
  br i1 %rcc.tmp.321, label %if.then.14, label %if.else.14
if.then.14:
  store i32 300, ptr %shadow.3
  %rcc.tmp.324 = load i32, ptr %shadow.3
  %rcc.tmp.325 = add i32 %rcc.tmp.324, 1
  store i32 %rcc.tmp.325, ptr %shadow.3
  %rcc.tmp.327 = load i32, ptr %shadow.3
  call void @printlnInt.(i32 %rcc.tmp.327)
  br label %if.merge.14
if.else.14:
  br label %if.merge.14
if.merge.14:
  %rcc.tmp.331 = load i32, ptr %shadow.2
  %rcc.tmp.332 = add i32 %rcc.tmp.331, 1
  store i32 %rcc.tmp.332, ptr %shadow.2
  %rcc.tmp.334 = load i32, ptr %shadow.2
  call void @printlnInt.(i32 %rcc.tmp.334)
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.338 = load i32, ptr %shadow
  %rcc.tmp.339 = add i32 %rcc.tmp.338, 1
  store i32 %rcc.tmp.339, ptr %shadow
  %rcc.tmp.341 = load i32, ptr %shadow
  call void @printlnInt.(i32 %rcc.tmp.341)
  store i32 0, ptr %k
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.345 = load i32, ptr %k
  %rcc.tmp.346 = icmp slt i32 %rcc.tmp.345, 1
  br i1 %rcc.tmp.346, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  store i32 123, ptr %loop_var
  %rcc.tmp.350 = load i32, ptr %loop_var
  %rcc.tmp.351 = add i32 %rcc.tmp.350, 1
  store i32 %rcc.tmp.351, ptr %loop_var
  %rcc.tmp.353 = load i32, ptr %k
  %rcc.tmp.354 = add i32 %rcc.tmp.353, 1
  store i32 %rcc.tmp.354, ptr %k
  br label %while.cond.5
while.end.5:
  store i32 0, ptr %m
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.359 = load i32, ptr %m
  %rcc.tmp.360 = icmp slt i32 %rcc.tmp.359, 2
  br i1 %rcc.tmp.360, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  store i32 456, ptr %another_loop_var
  %rcc.tmp.364 = load i32, ptr %m
  %rcc.tmp.365 = icmp eq i32 %rcc.tmp.364, 0
  br i1 %rcc.tmp.365, label %if.then.15, label %if.else.15
if.then.15:
  store i32 789, ptr %another_loop_var.2
  %rcc.tmp.368 = load i32, ptr %another_loop_var.2
  %rcc.tmp.369 = add i32 %rcc.tmp.368, 1
  store i32 %rcc.tmp.369, ptr %another_loop_var.2
  %rcc.tmp.371 = load i32, ptr %another_loop_var.2
  call void @printlnInt.(i32 %rcc.tmp.371)
  br label %if.merge.15
if.else.15:
  br label %if.merge.15
if.merge.15:
  %rcc.tmp.375 = load i32, ptr %another_loop_var
  call void @printlnInt.(i32 %rcc.tmp.375)
  %rcc.tmp.377 = load i32, ptr %m
  %rcc.tmp.378 = add i32 %rcc.tmp.377, 1
  store i32 %rcc.tmp.378, ptr %m
  br label %while.cond.6
while.end.6:
  store i32 0, ptr %final_val
  store i32 0, ptr %p
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.384 = load i32, ptr %p
  %rcc.tmp.385 = icmp slt i32 %rcc.tmp.384, 10
  br i1 %rcc.tmp.385, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.388 = load i32, ptr %p
  %rcc.tmp.389 = load i32, ptr %p
  %rcc.tmp.390 = mul i32 %rcc.tmp.388, %rcc.tmp.389
  store i32 %rcc.tmp.390, ptr %temp
  %rcc.tmp.392 = load i32, ptr %p
  %rcc.tmp.393 = srem i32 %rcc.tmp.392, 2
  %rcc.tmp.394 = icmp eq i32 %rcc.tmp.393, 0
  br i1 %rcc.tmp.394, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.396 = load i32, ptr %p
  %rcc.tmp.397 = mul i32 %rcc.tmp.396, 2
  store i32 %rcc.tmp.397, ptr %temp.2
  %rcc.tmp.399 = load i32, ptr %final_val
  %rcc.tmp.400 = load i32, ptr %temp.2
  %rcc.tmp.401 = add i32 %rcc.tmp.399, %rcc.tmp.400
  store i32 %rcc.tmp.401, ptr %final_val
  br label %if.merge.16
if.else.16:
  br label %if.merge.16
if.merge.16:
  %rcc.tmp.405 = load i32, ptr %final_val
  %rcc.tmp.406 = load i32, ptr %temp
  %rcc.tmp.407 = add i32 %rcc.tmp.405, %rcc.tmp.406
  store i32 %rcc.tmp.407, ptr %final_val
  %rcc.tmp.409 = load i32, ptr %p
  %rcc.tmp.410 = add i32 %rcc.tmp.409, 1
  store i32 %rcc.tmp.410, ptr %p
  br label %while.cond.7
while.end.7:
  %rcc.tmp.413 = load i32, ptr %final_val
  call void @printlnInt.(i32 %rcc.tmp.413)
  call void @exit.(i32 0)
  ret void
}
