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
define void @push_stack.([256 x i32]* %stack.tmp, i32* %sp.tmp, i32 %val.tmp) {
entry:
  %stack..tmp = alloca [256 x i32]* 
  %sp..tmp = alloca i32* 
  %val..tmp = alloca i32 
  store [256 x i32]* %stack.tmp, ptr %stack..tmp
  store i32* %sp.tmp, ptr %sp..tmp
  store i32 %val.tmp, ptr %val..tmp
  %rcc.tmp.4 = load i32*, ptr %sp..tmp
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = sub i32 256, 1
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.5, %rcc.tmp.6
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32*, ptr %sp..tmp
  %rcc.tmp.10 = load i32*, ptr %sp..tmp
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %rcc.tmp.9
  %rcc.tmp.14 = load i32*, ptr %sp..tmp
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.18 = getelementptr [256 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %val..tmp
  store i32 %rcc.tmp.19, ptr %rcc.tmp.18
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  ret void
}
define i32 @pop_stack.([256 x i32]* %stack.tmp, i32* %sp.tmp) {
entry:
  %stack..tmp = alloca [256 x i32]* 
  %sp..tmp = alloca i32* 
  %val = alloca i32 
  store [256 x i32]* %stack.tmp, ptr %stack..tmp
  store i32* %sp.tmp, ptr %sp..tmp
  %rcc.tmp.3 = load i32*, ptr %sp..tmp
  %rcc.tmp.4 = load i32, ptr %rcc.tmp.3
  %rcc.tmp.5 = sub i32 0, 1
  %rcc.tmp.6 = icmp sgt i32 %rcc.tmp.4, %rcc.tmp.5
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = load i32*, ptr %sp..tmp
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.12 = getelementptr [256 x i32], ptr %rcc.tmp.11, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  store i32 %rcc.tmp.13, ptr %val
  %rcc.tmp.15 = load i32*, ptr %sp..tmp
  %rcc.tmp.16 = load i32*, ptr %sp..tmp
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = sub i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %rcc.tmp.15
  %rcc.tmp.20 = load i32, ptr %val
  ret i32 %rcc.tmp.20
if.else:
  br label %if.merge
if.merge:
  ret i32 0
}
define void @load_program.([1024 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %i = alloca i32 
  %loop_start = alloca i32 
  %j = alloca i32 
  %k = alloca i32 
  %factorial_addr = alloca i32 
  %fib_addr = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32 0, ptr %i
  %rcc.tmp.3 = load i32, ptr %i
  %rcc.tmp.4 = add i32 %rcc.tmp.3, 0
  %rcc.tmp.5 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.6 = getelementptr [1024 x i32], ptr %rcc.tmp.5, i32 0, i32 %rcc.tmp.4
  store i32 1, ptr %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %i
  %rcc.tmp.9 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.9, ptr %i
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 0
  %rcc.tmp.13 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.14 = getelementptr [1024 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.12
  store i32 10, ptr %rcc.tmp.14
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 1
  store i32 %rcc.tmp.17, ptr %i
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.22 = getelementptr [1024 x i32], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  store i32 13, ptr %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 0
  %rcc.tmp.29 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.30 = getelementptr [1024 x i32], ptr %rcc.tmp.29, i32 0, i32 %rcc.tmp.28
  store i32 256, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.38 = getelementptr [1024 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  store i32 1, ptr %rcc.tmp.38
  %rcc.tmp.40 = load i32, ptr %i
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %i
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.46 = getelementptr [1024 x i32], ptr %rcc.tmp.45, i32 0, i32 %rcc.tmp.44
  store i32 1, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.54 = getelementptr [1024 x i32], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.52
  store i32 13, ptr %rcc.tmp.54
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 1
  store i32 %rcc.tmp.57, ptr %i
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.62 = getelementptr [1024 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  store i32 257, ptr %rcc.tmp.62
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  store i32 %rcc.tmp.65, ptr %i
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.70 = getelementptr [1024 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  store i32 1, ptr %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %i
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 1
  store i32 %rcc.tmp.73, ptr %i
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.78 = getelementptr [1024 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.76
  store i32 1, ptr %rcc.tmp.78
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %i
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.86 = getelementptr [1024 x i32], ptr %rcc.tmp.85, i32 0, i32 %rcc.tmp.84
  store i32 13, ptr %rcc.tmp.86
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 1
  store i32 %rcc.tmp.89, ptr %i
  %rcc.tmp.91 = load i32, ptr %i
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.94 = getelementptr [1024 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.92
  store i32 258, ptr %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %i
  %rcc.tmp.99 = load i32, ptr %i
  store i32 %rcc.tmp.99, ptr %loop_start
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.104 = getelementptr [1024 x i32], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  store i32 14, ptr %rcc.tmp.104
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 1
  store i32 %rcc.tmp.107, ptr %i
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 0
  %rcc.tmp.111 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.112 = getelementptr [1024 x i32], ptr %rcc.tmp.111, i32 0, i32 %rcc.tmp.110
  store i32 256, ptr %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %i
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 0
  %rcc.tmp.119 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.120 = getelementptr [1024 x i32], ptr %rcc.tmp.119, i32 0, i32 %rcc.tmp.118
  store i32 1, ptr %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 1
  store i32 %rcc.tmp.123, ptr %i
  %rcc.tmp.125 = load i32, ptr %i
  %rcc.tmp.126 = add i32 %rcc.tmp.125, 0
  %rcc.tmp.127 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.128 = getelementptr [1024 x i32], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.126
  store i32 1, ptr %rcc.tmp.128
  %rcc.tmp.130 = load i32, ptr %i
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 1
  store i32 %rcc.tmp.131, ptr %i
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.136 = getelementptr [1024 x i32], ptr %rcc.tmp.135, i32 0, i32 %rcc.tmp.134
  store i32 4, ptr %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.144 = getelementptr [1024 x i32], ptr %rcc.tmp.143, i32 0, i32 %rcc.tmp.142
  store i32 15, ptr %rcc.tmp.144
  %rcc.tmp.146 = load i32, ptr %i
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %i
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.152 = getelementptr [1024 x i32], ptr %rcc.tmp.151, i32 0, i32 %rcc.tmp.150
  store i32 13, ptr %rcc.tmp.152
  %rcc.tmp.154 = load i32, ptr %i
  %rcc.tmp.155 = add i32 %rcc.tmp.154, 1
  store i32 %rcc.tmp.155, ptr %i
  %rcc.tmp.157 = load i32, ptr %i
  %rcc.tmp.158 = add i32 %rcc.tmp.157, 0
  %rcc.tmp.159 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.160 = getelementptr [1024 x i32], ptr %rcc.tmp.159, i32 0, i32 %rcc.tmp.158
  store i32 256, ptr %rcc.tmp.160
  %rcc.tmp.162 = load i32, ptr %i
  %rcc.tmp.163 = add i32 %rcc.tmp.162, 1
  store i32 %rcc.tmp.163, ptr %i
  %rcc.tmp.165 = load i32, ptr %i
  %rcc.tmp.166 = add i32 %rcc.tmp.165, 0
  %rcc.tmp.167 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.168 = getelementptr [1024 x i32], ptr %rcc.tmp.167, i32 0, i32 %rcc.tmp.166
  store i32 9, ptr %rcc.tmp.168
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 1
  store i32 %rcc.tmp.171, ptr %i
  %rcc.tmp.173 = load i32, ptr %i
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 0
  %rcc.tmp.175 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.176 = getelementptr [1024 x i32], ptr %rcc.tmp.175, i32 0, i32 %rcc.tmp.174
  store i32 50, ptr %rcc.tmp.176
  %rcc.tmp.178 = load i32, ptr %i
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 1
  store i32 %rcc.tmp.179, ptr %i
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 0
  %rcc.tmp.183 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.184 = getelementptr [1024 x i32], ptr %rcc.tmp.183, i32 0, i32 %rcc.tmp.182
  store i32 14, ptr %rcc.tmp.184
  %rcc.tmp.186 = load i32, ptr %i
  %rcc.tmp.187 = add i32 %rcc.tmp.186, 1
  store i32 %rcc.tmp.187, ptr %i
  %rcc.tmp.189 = load i32, ptr %i
  %rcc.tmp.190 = add i32 %rcc.tmp.189, 0
  %rcc.tmp.191 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.192 = getelementptr [1024 x i32], ptr %rcc.tmp.191, i32 0, i32 %rcc.tmp.190
  store i32 257, ptr %rcc.tmp.192
  %rcc.tmp.194 = load i32, ptr %i
  %rcc.tmp.195 = add i32 %rcc.tmp.194, 1
  store i32 %rcc.tmp.195, ptr %i
  %rcc.tmp.197 = load i32, ptr %i
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 0
  %rcc.tmp.199 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.200 = getelementptr [1024 x i32], ptr %rcc.tmp.199, i32 0, i32 %rcc.tmp.198
  store i32 14, ptr %rcc.tmp.200
  %rcc.tmp.202 = load i32, ptr %i
  %rcc.tmp.203 = add i32 %rcc.tmp.202, 1
  store i32 %rcc.tmp.203, ptr %i
  %rcc.tmp.205 = load i32, ptr %i
  %rcc.tmp.206 = add i32 %rcc.tmp.205, 0
  %rcc.tmp.207 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.208 = getelementptr [1024 x i32], ptr %rcc.tmp.207, i32 0, i32 %rcc.tmp.206
  store i32 258, ptr %rcc.tmp.208
  %rcc.tmp.210 = load i32, ptr %i
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 1
  store i32 %rcc.tmp.211, ptr %i
  %rcc.tmp.213 = load i32, ptr %i
  %rcc.tmp.214 = add i32 %rcc.tmp.213, 0
  %rcc.tmp.215 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.216 = getelementptr [1024 x i32], ptr %rcc.tmp.215, i32 0, i32 %rcc.tmp.214
  store i32 3, ptr %rcc.tmp.216
  %rcc.tmp.218 = load i32, ptr %i
  %rcc.tmp.219 = add i32 %rcc.tmp.218, 1
  store i32 %rcc.tmp.219, ptr %i
  %rcc.tmp.221 = load i32, ptr %i
  %rcc.tmp.222 = add i32 %rcc.tmp.221, 0
  %rcc.tmp.223 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.224 = getelementptr [1024 x i32], ptr %rcc.tmp.223, i32 0, i32 %rcc.tmp.222
  store i32 15, ptr %rcc.tmp.224
  %rcc.tmp.226 = load i32, ptr %i
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 1
  store i32 %rcc.tmp.227, ptr %i
  %rcc.tmp.229 = load i32, ptr %i
  %rcc.tmp.230 = add i32 %rcc.tmp.229, 0
  %rcc.tmp.231 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.232 = getelementptr [1024 x i32], ptr %rcc.tmp.231, i32 0, i32 %rcc.tmp.230
  store i32 13, ptr %rcc.tmp.232
  %rcc.tmp.234 = load i32, ptr %i
  %rcc.tmp.235 = add i32 %rcc.tmp.234, 1
  store i32 %rcc.tmp.235, ptr %i
  %rcc.tmp.237 = load i32, ptr %i
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.240 = getelementptr [1024 x i32], ptr %rcc.tmp.239, i32 0, i32 %rcc.tmp.238
  store i32 257, ptr %rcc.tmp.240
  %rcc.tmp.242 = load i32, ptr %i
  %rcc.tmp.243 = add i32 %rcc.tmp.242, 1
  store i32 %rcc.tmp.243, ptr %i
  %rcc.tmp.245 = load i32, ptr %i
  %rcc.tmp.246 = add i32 %rcc.tmp.245, 0
  %rcc.tmp.247 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.248 = getelementptr [1024 x i32], ptr %rcc.tmp.247, i32 0, i32 %rcc.tmp.246
  store i32 2, ptr %rcc.tmp.248
  %rcc.tmp.250 = load i32, ptr %i
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 1
  store i32 %rcc.tmp.251, ptr %i
  %rcc.tmp.253 = load i32, ptr %i
  %rcc.tmp.254 = add i32 %rcc.tmp.253, 0
  %rcc.tmp.255 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.256 = getelementptr [1024 x i32], ptr %rcc.tmp.255, i32 0, i32 %rcc.tmp.254
  store i32 14, ptr %rcc.tmp.256
  %rcc.tmp.258 = load i32, ptr %i
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 1
  store i32 %rcc.tmp.259, ptr %i
  %rcc.tmp.261 = load i32, ptr %i
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 0
  %rcc.tmp.263 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.264 = getelementptr [1024 x i32], ptr %rcc.tmp.263, i32 0, i32 %rcc.tmp.262
  store i32 257, ptr %rcc.tmp.264
  %rcc.tmp.266 = load i32, ptr %i
  %rcc.tmp.267 = add i32 %rcc.tmp.266, 1
  store i32 %rcc.tmp.267, ptr %i
  %rcc.tmp.269 = load i32, ptr %i
  %rcc.tmp.270 = add i32 %rcc.tmp.269, 0
  %rcc.tmp.271 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.272 = getelementptr [1024 x i32], ptr %rcc.tmp.271, i32 0, i32 %rcc.tmp.270
  store i32 13, ptr %rcc.tmp.272
  %rcc.tmp.274 = load i32, ptr %i
  %rcc.tmp.275 = add i32 %rcc.tmp.274, 1
  store i32 %rcc.tmp.275, ptr %i
  %rcc.tmp.277 = load i32, ptr %i
  %rcc.tmp.278 = add i32 %rcc.tmp.277, 0
  %rcc.tmp.279 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.280 = getelementptr [1024 x i32], ptr %rcc.tmp.279, i32 0, i32 %rcc.tmp.278
  store i32 258, ptr %rcc.tmp.280
  %rcc.tmp.282 = load i32, ptr %i
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 1
  store i32 %rcc.tmp.283, ptr %i
  %rcc.tmp.285 = load i32, ptr %i
  %rcc.tmp.286 = add i32 %rcc.tmp.285, 0
  %rcc.tmp.287 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.288 = getelementptr [1024 x i32], ptr %rcc.tmp.287, i32 0, i32 %rcc.tmp.286
  store i32 8, ptr %rcc.tmp.288
  %rcc.tmp.290 = load i32, ptr %i
  %rcc.tmp.291 = add i32 %rcc.tmp.290, 1
  store i32 %rcc.tmp.291, ptr %i
  %rcc.tmp.293 = load i32, ptr %i
  %rcc.tmp.294 = add i32 %rcc.tmp.293, 0
  %rcc.tmp.295 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.296 = getelementptr [1024 x i32], ptr %rcc.tmp.295, i32 0, i32 %rcc.tmp.294
  %rcc.tmp.297 = load i32, ptr %loop_start
  store i32 %rcc.tmp.297, ptr %rcc.tmp.296
  %rcc.tmp.299 = load i32, ptr %i
  %rcc.tmp.300 = add i32 %rcc.tmp.299, 1
  store i32 %rcc.tmp.300, ptr %i
  %rcc.tmp.302 = load i32, ptr %i
  %rcc.tmp.303 = add i32 %rcc.tmp.302, 0
  %rcc.tmp.304 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.305 = getelementptr [1024 x i32], ptr %rcc.tmp.304, i32 0, i32 %rcc.tmp.303
  store i32 14, ptr %rcc.tmp.305
  %rcc.tmp.307 = load i32, ptr %i
  %rcc.tmp.308 = add i32 %rcc.tmp.307, 1
  store i32 %rcc.tmp.308, ptr %i
  %rcc.tmp.310 = load i32, ptr %i
  %rcc.tmp.311 = add i32 %rcc.tmp.310, 0
  %rcc.tmp.312 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.313 = getelementptr [1024 x i32], ptr %rcc.tmp.312, i32 0, i32 %rcc.tmp.311
  store i32 258, ptr %rcc.tmp.313
  %rcc.tmp.315 = load i32, ptr %i
  %rcc.tmp.316 = add i32 %rcc.tmp.315, 1
  store i32 %rcc.tmp.316, ptr %i
  %rcc.tmp.318 = load i32, ptr %i
  %rcc.tmp.319 = add i32 %rcc.tmp.318, 0
  %rcc.tmp.320 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.321 = getelementptr [1024 x i32], ptr %rcc.tmp.320, i32 0, i32 %rcc.tmp.319
  store i32 7, ptr %rcc.tmp.321
  %rcc.tmp.323 = load i32, ptr %i
  %rcc.tmp.324 = add i32 %rcc.tmp.323, 1
  store i32 %rcc.tmp.324, ptr %i
  %rcc.tmp.326 = load i32, ptr %i
  %rcc.tmp.327 = add i32 %rcc.tmp.326, 0
  %rcc.tmp.328 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.329 = getelementptr [1024 x i32], ptr %rcc.tmp.328, i32 0, i32 %rcc.tmp.327
  store i32 0, ptr %rcc.tmp.329
  %rcc.tmp.331 = load i32, ptr %i
  %rcc.tmp.332 = add i32 %rcc.tmp.331, 1
  store i32 %rcc.tmp.332, ptr %i
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.336 = load i32, ptr %j
  %rcc.tmp.337 = icmp slt i32 %rcc.tmp.336, 20
  br i1 %rcc.tmp.337, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.340 = load i32, ptr %j
  %rcc.tmp.341 = mul i32 %rcc.tmp.340, 10
  %rcc.tmp.342 = add i32 100, %rcc.tmp.341
  store i32 %rcc.tmp.342, ptr %k
  %rcc.tmp.344 = load i32, ptr %k
  %rcc.tmp.345 = add i32 %rcc.tmp.344, 0
  %rcc.tmp.346 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.347 = getelementptr [1024 x i32], ptr %rcc.tmp.346, i32 0, i32 %rcc.tmp.345
  store i32 1, ptr %rcc.tmp.347
  %rcc.tmp.349 = load i32, ptr %k
  %rcc.tmp.350 = add i32 %rcc.tmp.349, 0
  %rcc.tmp.351 = add i32 %rcc.tmp.350, 1
  %rcc.tmp.352 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.353 = getelementptr [1024 x i32], ptr %rcc.tmp.352, i32 0, i32 %rcc.tmp.351
  %rcc.tmp.354 = load i32, ptr %j
  store i32 %rcc.tmp.354, ptr %rcc.tmp.353
  %rcc.tmp.356 = load i32, ptr %k
  %rcc.tmp.357 = add i32 %rcc.tmp.356, 0
  %rcc.tmp.358 = add i32 %rcc.tmp.357, 2
  %rcc.tmp.359 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.360 = getelementptr [1024 x i32], ptr %rcc.tmp.359, i32 0, i32 %rcc.tmp.358
  store i32 1, ptr %rcc.tmp.360
  %rcc.tmp.362 = load i32, ptr %k
  %rcc.tmp.363 = add i32 %rcc.tmp.362, 0
  %rcc.tmp.364 = add i32 %rcc.tmp.363, 3
  %rcc.tmp.365 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.366 = getelementptr [1024 x i32], ptr %rcc.tmp.365, i32 0, i32 %rcc.tmp.364
  %rcc.tmp.367 = load i32, ptr %j
  %rcc.tmp.368 = add i32 %rcc.tmp.367, 1
  store i32 %rcc.tmp.368, ptr %rcc.tmp.366
  %rcc.tmp.370 = load i32, ptr %k
  %rcc.tmp.371 = add i32 %rcc.tmp.370, 0
  %rcc.tmp.372 = add i32 %rcc.tmp.371, 4
  %rcc.tmp.373 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.374 = getelementptr [1024 x i32], ptr %rcc.tmp.373, i32 0, i32 %rcc.tmp.372
  store i32 5, ptr %rcc.tmp.374
  %rcc.tmp.376 = load i32, ptr %k
  %rcc.tmp.377 = add i32 %rcc.tmp.376, 0
  %rcc.tmp.378 = add i32 %rcc.tmp.377, 5
  %rcc.tmp.379 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.380 = getelementptr [1024 x i32], ptr %rcc.tmp.379, i32 0, i32 %rcc.tmp.378
  store i32 7, ptr %rcc.tmp.380
  %rcc.tmp.382 = load i32, ptr %k
  %rcc.tmp.383 = add i32 %rcc.tmp.382, 0
  %rcc.tmp.384 = add i32 %rcc.tmp.383, 6
  %rcc.tmp.385 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.386 = getelementptr [1024 x i32], ptr %rcc.tmp.385, i32 0, i32 %rcc.tmp.384
  store i32 2, ptr %rcc.tmp.386
  %rcc.tmp.388 = load i32, ptr %j
  %rcc.tmp.389 = add i32 %rcc.tmp.388, 1
  store i32 %rcc.tmp.389, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.392 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.393 = getelementptr [1024 x i32], ptr %rcc.tmp.392, i32 0, i32 99
  store i32 8, ptr %rcc.tmp.393
  %rcc.tmp.395 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.396 = getelementptr [1024 x i32], ptr %rcc.tmp.395, i32 0, i32 100
  store i32 100, ptr %rcc.tmp.396
  store i32 400, ptr %factorial_addr
  %rcc.tmp.399 = load i32, ptr %factorial_addr
  %rcc.tmp.400 = add i32 %rcc.tmp.399, 0
  %rcc.tmp.401 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.402 = getelementptr [1024 x i32], ptr %rcc.tmp.401, i32 0, i32 %rcc.tmp.400
  store i32 13, ptr %rcc.tmp.402
  %rcc.tmp.404 = load i32, ptr %factorial_addr
  %rcc.tmp.405 = add i32 %rcc.tmp.404, 1
  store i32 %rcc.tmp.405, ptr %factorial_addr
  %rcc.tmp.407 = load i32, ptr %factorial_addr
  %rcc.tmp.408 = add i32 %rcc.tmp.407, 0
  %rcc.tmp.409 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.410 = getelementptr [1024 x i32], ptr %rcc.tmp.409, i32 0, i32 %rcc.tmp.408
  store i32 500, ptr %rcc.tmp.410
  %rcc.tmp.412 = load i32, ptr %factorial_addr
  %rcc.tmp.413 = add i32 %rcc.tmp.412, 1
  store i32 %rcc.tmp.413, ptr %factorial_addr
  %rcc.tmp.415 = load i32, ptr %factorial_addr
  %rcc.tmp.416 = add i32 %rcc.tmp.415, 0
  %rcc.tmp.417 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.418 = getelementptr [1024 x i32], ptr %rcc.tmp.417, i32 0, i32 %rcc.tmp.416
  store i32 14, ptr %rcc.tmp.418
  %rcc.tmp.420 = load i32, ptr %factorial_addr
  %rcc.tmp.421 = add i32 %rcc.tmp.420, 1
  store i32 %rcc.tmp.421, ptr %factorial_addr
  %rcc.tmp.423 = load i32, ptr %factorial_addr
  %rcc.tmp.424 = add i32 %rcc.tmp.423, 0
  %rcc.tmp.425 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.426 = getelementptr [1024 x i32], ptr %rcc.tmp.425, i32 0, i32 %rcc.tmp.424
  store i32 500, ptr %rcc.tmp.426
  %rcc.tmp.428 = load i32, ptr %factorial_addr
  %rcc.tmp.429 = add i32 %rcc.tmp.428, 1
  store i32 %rcc.tmp.429, ptr %factorial_addr
  %rcc.tmp.431 = load i32, ptr %factorial_addr
  %rcc.tmp.432 = add i32 %rcc.tmp.431, 0
  %rcc.tmp.433 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.434 = getelementptr [1024 x i32], ptr %rcc.tmp.433, i32 0, i32 %rcc.tmp.432
  store i32 1, ptr %rcc.tmp.434
  %rcc.tmp.436 = load i32, ptr %factorial_addr
  %rcc.tmp.437 = add i32 %rcc.tmp.436, 1
  store i32 %rcc.tmp.437, ptr %factorial_addr
  %rcc.tmp.439 = load i32, ptr %factorial_addr
  %rcc.tmp.440 = add i32 %rcc.tmp.439, 0
  %rcc.tmp.441 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.442 = getelementptr [1024 x i32], ptr %rcc.tmp.441, i32 0, i32 %rcc.tmp.440
  store i32 1, ptr %rcc.tmp.442
  %rcc.tmp.444 = load i32, ptr %factorial_addr
  %rcc.tmp.445 = add i32 %rcc.tmp.444, 1
  store i32 %rcc.tmp.445, ptr %factorial_addr
  %rcc.tmp.447 = load i32, ptr %factorial_addr
  %rcc.tmp.448 = add i32 %rcc.tmp.447, 0
  %rcc.tmp.449 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.450 = getelementptr [1024 x i32], ptr %rcc.tmp.449, i32 0, i32 %rcc.tmp.448
  store i32 12, ptr %rcc.tmp.450
  %rcc.tmp.452 = load i32, ptr %factorial_addr
  %rcc.tmp.453 = add i32 %rcc.tmp.452, 1
  store i32 %rcc.tmp.453, ptr %factorial_addr
  %rcc.tmp.455 = load i32, ptr %factorial_addr
  %rcc.tmp.456 = add i32 %rcc.tmp.455, 0
  %rcc.tmp.457 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.458 = getelementptr [1024 x i32], ptr %rcc.tmp.457, i32 0, i32 %rcc.tmp.456
  store i32 9, ptr %rcc.tmp.458
  %rcc.tmp.460 = load i32, ptr %factorial_addr
  %rcc.tmp.461 = add i32 %rcc.tmp.460, 1
  store i32 %rcc.tmp.461, ptr %factorial_addr
  %rcc.tmp.463 = load i32, ptr %factorial_addr
  %rcc.tmp.464 = add i32 %rcc.tmp.463, 0
  %rcc.tmp.465 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.466 = getelementptr [1024 x i32], ptr %rcc.tmp.465, i32 0, i32 %rcc.tmp.464
  %rcc.tmp.467 = load i32, ptr %factorial_addr
  %rcc.tmp.468 = add i32 %rcc.tmp.467, 12
  store i32 %rcc.tmp.468, ptr %rcc.tmp.466
  %rcc.tmp.470 = load i32, ptr %factorial_addr
  %rcc.tmp.471 = add i32 %rcc.tmp.470, 1
  store i32 %rcc.tmp.471, ptr %factorial_addr
  %rcc.tmp.473 = load i32, ptr %factorial_addr
  %rcc.tmp.474 = add i32 %rcc.tmp.473, 0
  %rcc.tmp.475 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.476 = getelementptr [1024 x i32], ptr %rcc.tmp.475, i32 0, i32 %rcc.tmp.474
  store i32 1, ptr %rcc.tmp.476
  %rcc.tmp.478 = load i32, ptr %factorial_addr
  %rcc.tmp.479 = add i32 %rcc.tmp.478, 1
  store i32 %rcc.tmp.479, ptr %factorial_addr
  %rcc.tmp.481 = load i32, ptr %factorial_addr
  %rcc.tmp.482 = add i32 %rcc.tmp.481, 0
  %rcc.tmp.483 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.484 = getelementptr [1024 x i32], ptr %rcc.tmp.483, i32 0, i32 %rcc.tmp.482
  store i32 1, ptr %rcc.tmp.484
  %rcc.tmp.486 = load i32, ptr %factorial_addr
  %rcc.tmp.487 = add i32 %rcc.tmp.486, 1
  store i32 %rcc.tmp.487, ptr %factorial_addr
  %rcc.tmp.489 = load i32, ptr %factorial_addr
  %rcc.tmp.490 = add i32 %rcc.tmp.489, 0
  %rcc.tmp.491 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.492 = getelementptr [1024 x i32], ptr %rcc.tmp.491, i32 0, i32 %rcc.tmp.490
  store i32 8, ptr %rcc.tmp.492
  %rcc.tmp.494 = load i32, ptr %factorial_addr
  %rcc.tmp.495 = add i32 %rcc.tmp.494, 1
  store i32 %rcc.tmp.495, ptr %factorial_addr
  %rcc.tmp.497 = load i32, ptr %factorial_addr
  %rcc.tmp.498 = add i32 %rcc.tmp.497, 0
  %rcc.tmp.499 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.500 = getelementptr [1024 x i32], ptr %rcc.tmp.499, i32 0, i32 %rcc.tmp.498
  store i32 500, ptr %rcc.tmp.500
  %rcc.tmp.502 = load i32, ptr %factorial_addr
  %rcc.tmp.503 = add i32 %rcc.tmp.502, 0
  %rcc.tmp.504 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.505 = getelementptr [1024 x i32], ptr %rcc.tmp.504, i32 0, i32 %rcc.tmp.503
  store i32 14, ptr %rcc.tmp.505
  %rcc.tmp.507 = load i32, ptr %factorial_addr
  %rcc.tmp.508 = add i32 %rcc.tmp.507, 1
  store i32 %rcc.tmp.508, ptr %factorial_addr
  %rcc.tmp.510 = load i32, ptr %factorial_addr
  %rcc.tmp.511 = add i32 %rcc.tmp.510, 0
  %rcc.tmp.512 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.513 = getelementptr [1024 x i32], ptr %rcc.tmp.512, i32 0, i32 %rcc.tmp.511
  store i32 500, ptr %rcc.tmp.513
  %rcc.tmp.515 = load i32, ptr %factorial_addr
  %rcc.tmp.516 = add i32 %rcc.tmp.515, 1
  store i32 %rcc.tmp.516, ptr %factorial_addr
  %rcc.tmp.518 = load i32, ptr %factorial_addr
  %rcc.tmp.519 = add i32 %rcc.tmp.518, 0
  %rcc.tmp.520 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.521 = getelementptr [1024 x i32], ptr %rcc.tmp.520, i32 0, i32 %rcc.tmp.519
  store i32 1, ptr %rcc.tmp.521
  %rcc.tmp.523 = load i32, ptr %factorial_addr
  %rcc.tmp.524 = add i32 %rcc.tmp.523, 1
  store i32 %rcc.tmp.524, ptr %factorial_addr
  %rcc.tmp.526 = load i32, ptr %factorial_addr
  %rcc.tmp.527 = add i32 %rcc.tmp.526, 0
  %rcc.tmp.528 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.529 = getelementptr [1024 x i32], ptr %rcc.tmp.528, i32 0, i32 %rcc.tmp.527
  store i32 1, ptr %rcc.tmp.529
  %rcc.tmp.531 = load i32, ptr %factorial_addr
  %rcc.tmp.532 = add i32 %rcc.tmp.531, 1
  store i32 %rcc.tmp.532, ptr %factorial_addr
  %rcc.tmp.534 = load i32, ptr %factorial_addr
  %rcc.tmp.535 = add i32 %rcc.tmp.534, 0
  %rcc.tmp.536 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.537 = getelementptr [1024 x i32], ptr %rcc.tmp.536, i32 0, i32 %rcc.tmp.535
  store i32 4, ptr %rcc.tmp.537
  %rcc.tmp.539 = load i32, ptr %factorial_addr
  %rcc.tmp.540 = add i32 %rcc.tmp.539, 1
  store i32 %rcc.tmp.540, ptr %factorial_addr
  %rcc.tmp.542 = load i32, ptr %factorial_addr
  %rcc.tmp.543 = add i32 %rcc.tmp.542, 0
  %rcc.tmp.544 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.545 = getelementptr [1024 x i32], ptr %rcc.tmp.544, i32 0, i32 %rcc.tmp.543
  store i32 8, ptr %rcc.tmp.545
  %rcc.tmp.547 = load i32, ptr %factorial_addr
  %rcc.tmp.548 = add i32 %rcc.tmp.547, 0
  %rcc.tmp.549 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.550 = getelementptr [1024 x i32], ptr %rcc.tmp.549, i32 0, i32 %rcc.tmp.548
  store i32 400, ptr %rcc.tmp.550
  store i32 600, ptr %fib_addr
  %rcc.tmp.553 = load i32, ptr %fib_addr
  %rcc.tmp.554 = add i32 %rcc.tmp.553, 0
  %rcc.tmp.555 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.556 = getelementptr [1024 x i32], ptr %rcc.tmp.555, i32 0, i32 %rcc.tmp.554
  store i32 13, ptr %rcc.tmp.556
  %rcc.tmp.558 = load i32, ptr %fib_addr
  %rcc.tmp.559 = add i32 %rcc.tmp.558, 1
  store i32 %rcc.tmp.559, ptr %fib_addr
  %rcc.tmp.561 = load i32, ptr %fib_addr
  %rcc.tmp.562 = add i32 %rcc.tmp.561, 0
  %rcc.tmp.563 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.564 = getelementptr [1024 x i32], ptr %rcc.tmp.563, i32 0, i32 %rcc.tmp.562
  store i32 700, ptr %rcc.tmp.564
  %rcc.tmp.566 = load i32, ptr %fib_addr
  %rcc.tmp.567 = add i32 %rcc.tmp.566, 1
  store i32 %rcc.tmp.567, ptr %fib_addr
  %rcc.tmp.569 = load i32, ptr %fib_addr
  %rcc.tmp.570 = add i32 %rcc.tmp.569, 0
  %rcc.tmp.571 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.572 = getelementptr [1024 x i32], ptr %rcc.tmp.571, i32 0, i32 %rcc.tmp.570
  store i32 14, ptr %rcc.tmp.572
  %rcc.tmp.574 = load i32, ptr %fib_addr
  %rcc.tmp.575 = add i32 %rcc.tmp.574, 1
  store i32 %rcc.tmp.575, ptr %fib_addr
  %rcc.tmp.577 = load i32, ptr %fib_addr
  %rcc.tmp.578 = add i32 %rcc.tmp.577, 0
  %rcc.tmp.579 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.580 = getelementptr [1024 x i32], ptr %rcc.tmp.579, i32 0, i32 %rcc.tmp.578
  store i32 700, ptr %rcc.tmp.580
  %rcc.tmp.582 = load i32, ptr %fib_addr
  %rcc.tmp.583 = add i32 %rcc.tmp.582, 1
  store i32 %rcc.tmp.583, ptr %fib_addr
  %rcc.tmp.585 = load i32, ptr %fib_addr
  %rcc.tmp.586 = add i32 %rcc.tmp.585, 0
  %rcc.tmp.587 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.588 = getelementptr [1024 x i32], ptr %rcc.tmp.587, i32 0, i32 %rcc.tmp.586
  store i32 1, ptr %rcc.tmp.588
  %rcc.tmp.590 = load i32, ptr %fib_addr
  %rcc.tmp.591 = add i32 %rcc.tmp.590, 1
  store i32 %rcc.tmp.591, ptr %fib_addr
  %rcc.tmp.593 = load i32, ptr %fib_addr
  %rcc.tmp.594 = add i32 %rcc.tmp.593, 0
  %rcc.tmp.595 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.596 = getelementptr [1024 x i32], ptr %rcc.tmp.595, i32 0, i32 %rcc.tmp.594
  store i32 2, ptr %rcc.tmp.596
  %rcc.tmp.598 = load i32, ptr %fib_addr
  %rcc.tmp.599 = add i32 %rcc.tmp.598, 1
  store i32 %rcc.tmp.599, ptr %fib_addr
  %rcc.tmp.601 = load i32, ptr %fib_addr
  %rcc.tmp.602 = add i32 %rcc.tmp.601, 0
  %rcc.tmp.603 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.604 = getelementptr [1024 x i32], ptr %rcc.tmp.603, i32 0, i32 %rcc.tmp.602
  store i32 12, ptr %rcc.tmp.604
  %rcc.tmp.606 = load i32, ptr %fib_addr
  %rcc.tmp.607 = add i32 %rcc.tmp.606, 1
  store i32 %rcc.tmp.607, ptr %fib_addr
  %rcc.tmp.609 = load i32, ptr %fib_addr
  %rcc.tmp.610 = add i32 %rcc.tmp.609, 0
  %rcc.tmp.611 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.612 = getelementptr [1024 x i32], ptr %rcc.tmp.611, i32 0, i32 %rcc.tmp.610
  store i32 9, ptr %rcc.tmp.612
  %rcc.tmp.614 = load i32, ptr %fib_addr
  %rcc.tmp.615 = add i32 %rcc.tmp.614, 1
  store i32 %rcc.tmp.615, ptr %fib_addr
  %rcc.tmp.617 = load i32, ptr %fib_addr
  %rcc.tmp.618 = add i32 %rcc.tmp.617, 0
  %rcc.tmp.619 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.620 = getelementptr [1024 x i32], ptr %rcc.tmp.619, i32 0, i32 %rcc.tmp.618
  %rcc.tmp.621 = load i32, ptr %fib_addr
  %rcc.tmp.622 = add i32 %rcc.tmp.621, 4
  store i32 %rcc.tmp.622, ptr %rcc.tmp.620
  %rcc.tmp.624 = load i32, ptr %fib_addr
  %rcc.tmp.625 = add i32 %rcc.tmp.624, 1
  store i32 %rcc.tmp.625, ptr %fib_addr
  %rcc.tmp.627 = load i32, ptr %fib_addr
  %rcc.tmp.628 = add i32 %rcc.tmp.627, 0
  %rcc.tmp.629 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.630 = getelementptr [1024 x i32], ptr %rcc.tmp.629, i32 0, i32 %rcc.tmp.628
  store i32 14, ptr %rcc.tmp.630
  %rcc.tmp.632 = load i32, ptr %fib_addr
  %rcc.tmp.633 = add i32 %rcc.tmp.632, 1
  store i32 %rcc.tmp.633, ptr %fib_addr
  %rcc.tmp.635 = load i32, ptr %fib_addr
  %rcc.tmp.636 = add i32 %rcc.tmp.635, 0
  %rcc.tmp.637 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.638 = getelementptr [1024 x i32], ptr %rcc.tmp.637, i32 0, i32 %rcc.tmp.636
  store i32 700, ptr %rcc.tmp.638
  %rcc.tmp.640 = load i32, ptr %fib_addr
  %rcc.tmp.641 = add i32 %rcc.tmp.640, 1
  store i32 %rcc.tmp.641, ptr %fib_addr
  %rcc.tmp.643 = load i32, ptr %fib_addr
  %rcc.tmp.644 = add i32 %rcc.tmp.643, 0
  %rcc.tmp.645 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.646 = getelementptr [1024 x i32], ptr %rcc.tmp.645, i32 0, i32 %rcc.tmp.644
  store i32 8, ptr %rcc.tmp.646
  %rcc.tmp.648 = load i32, ptr %fib_addr
  %rcc.tmp.649 = add i32 %rcc.tmp.648, 1
  store i32 %rcc.tmp.649, ptr %fib_addr
  %rcc.tmp.651 = load i32, ptr %fib_addr
  %rcc.tmp.652 = add i32 %rcc.tmp.651, 0
  %rcc.tmp.653 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.654 = getelementptr [1024 x i32], ptr %rcc.tmp.653, i32 0, i32 %rcc.tmp.652
  store i32 800, ptr %rcc.tmp.654
  %rcc.tmp.656 = load i32, ptr %fib_addr
  %rcc.tmp.657 = add i32 %rcc.tmp.656, 0
  %rcc.tmp.658 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.659 = getelementptr [1024 x i32], ptr %rcc.tmp.658, i32 0, i32 %rcc.tmp.657
  store i32 14, ptr %rcc.tmp.659
  %rcc.tmp.661 = load i32, ptr %fib_addr
  %rcc.tmp.662 = add i32 %rcc.tmp.661, 1
  store i32 %rcc.tmp.662, ptr %fib_addr
  %rcc.tmp.664 = load i32, ptr %fib_addr
  %rcc.tmp.665 = add i32 %rcc.tmp.664, 0
  %rcc.tmp.666 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.667 = getelementptr [1024 x i32], ptr %rcc.tmp.666, i32 0, i32 %rcc.tmp.665
  store i32 700, ptr %rcc.tmp.667
  %rcc.tmp.669 = load i32, ptr %fib_addr
  %rcc.tmp.670 = add i32 %rcc.tmp.669, 1
  store i32 %rcc.tmp.670, ptr %fib_addr
  %rcc.tmp.672 = load i32, ptr %fib_addr
  %rcc.tmp.673 = add i32 %rcc.tmp.672, 0
  %rcc.tmp.674 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.675 = getelementptr [1024 x i32], ptr %rcc.tmp.674, i32 0, i32 %rcc.tmp.673
  store i32 1, ptr %rcc.tmp.675
  %rcc.tmp.677 = load i32, ptr %fib_addr
  %rcc.tmp.678 = add i32 %rcc.tmp.677, 1
  store i32 %rcc.tmp.678, ptr %fib_addr
  %rcc.tmp.680 = load i32, ptr %fib_addr
  %rcc.tmp.681 = add i32 %rcc.tmp.680, 0
  %rcc.tmp.682 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.683 = getelementptr [1024 x i32], ptr %rcc.tmp.682, i32 0, i32 %rcc.tmp.681
  store i32 1, ptr %rcc.tmp.683
  %rcc.tmp.685 = load i32, ptr %fib_addr
  %rcc.tmp.686 = add i32 %rcc.tmp.685, 1
  store i32 %rcc.tmp.686, ptr %fib_addr
  %rcc.tmp.688 = load i32, ptr %fib_addr
  %rcc.tmp.689 = add i32 %rcc.tmp.688, 0
  %rcc.tmp.690 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.691 = getelementptr [1024 x i32], ptr %rcc.tmp.690, i32 0, i32 %rcc.tmp.689
  store i32 4, ptr %rcc.tmp.691
  %rcc.tmp.693 = load i32, ptr %fib_addr
  %rcc.tmp.694 = add i32 %rcc.tmp.693, 1
  store i32 %rcc.tmp.694, ptr %fib_addr
  %rcc.tmp.696 = load i32, ptr %fib_addr
  %rcc.tmp.697 = add i32 %rcc.tmp.696, 0
  %rcc.tmp.698 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.699 = getelementptr [1024 x i32], ptr %rcc.tmp.698, i32 0, i32 %rcc.tmp.697
  store i32 8, ptr %rcc.tmp.699
  %rcc.tmp.701 = load i32, ptr %fib_addr
  %rcc.tmp.702 = add i32 %rcc.tmp.701, 1
  store i32 %rcc.tmp.702, ptr %fib_addr
  %rcc.tmp.704 = load i32, ptr %fib_addr
  %rcc.tmp.705 = add i32 %rcc.tmp.704, 0
  %rcc.tmp.706 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.707 = getelementptr [1024 x i32], ptr %rcc.tmp.706, i32 0, i32 %rcc.tmp.705
  store i32 600, ptr %rcc.tmp.707
  %rcc.tmp.709 = load i32, ptr %fib_addr
  %rcc.tmp.710 = add i32 %rcc.tmp.709, 1
  store i32 %rcc.tmp.710, ptr %fib_addr
  %rcc.tmp.712 = load i32, ptr %fib_addr
  %rcc.tmp.713 = add i32 %rcc.tmp.712, 0
  %rcc.tmp.714 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.715 = getelementptr [1024 x i32], ptr %rcc.tmp.714, i32 0, i32 %rcc.tmp.713
  store i32 14, ptr %rcc.tmp.715
  %rcc.tmp.717 = load i32, ptr %fib_addr
  %rcc.tmp.718 = add i32 %rcc.tmp.717, 1
  store i32 %rcc.tmp.718, ptr %fib_addr
  %rcc.tmp.720 = load i32, ptr %fib_addr
  %rcc.tmp.721 = add i32 %rcc.tmp.720, 0
  %rcc.tmp.722 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.723 = getelementptr [1024 x i32], ptr %rcc.tmp.722, i32 0, i32 %rcc.tmp.721
  store i32 700, ptr %rcc.tmp.723
  %rcc.tmp.725 = load i32, ptr %fib_addr
  %rcc.tmp.726 = add i32 %rcc.tmp.725, 1
  store i32 %rcc.tmp.726, ptr %fib_addr
  %rcc.tmp.728 = load i32, ptr %fib_addr
  %rcc.tmp.729 = add i32 %rcc.tmp.728, 0
  %rcc.tmp.730 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.731 = getelementptr [1024 x i32], ptr %rcc.tmp.730, i32 0, i32 %rcc.tmp.729
  store i32 1, ptr %rcc.tmp.731
  %rcc.tmp.733 = load i32, ptr %fib_addr
  %rcc.tmp.734 = add i32 %rcc.tmp.733, 1
  store i32 %rcc.tmp.734, ptr %fib_addr
  %rcc.tmp.736 = load i32, ptr %fib_addr
  %rcc.tmp.737 = add i32 %rcc.tmp.736, 0
  %rcc.tmp.738 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.739 = getelementptr [1024 x i32], ptr %rcc.tmp.738, i32 0, i32 %rcc.tmp.737
  store i32 2, ptr %rcc.tmp.739
  %rcc.tmp.741 = load i32, ptr %fib_addr
  %rcc.tmp.742 = add i32 %rcc.tmp.741, 1
  store i32 %rcc.tmp.742, ptr %fib_addr
  %rcc.tmp.744 = load i32, ptr %fib_addr
  %rcc.tmp.745 = add i32 %rcc.tmp.744, 0
  %rcc.tmp.746 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.747 = getelementptr [1024 x i32], ptr %rcc.tmp.746, i32 0, i32 %rcc.tmp.745
  store i32 4, ptr %rcc.tmp.747
  %rcc.tmp.749 = load i32, ptr %fib_addr
  %rcc.tmp.750 = add i32 %rcc.tmp.749, 1
  store i32 %rcc.tmp.750, ptr %fib_addr
  %rcc.tmp.752 = load i32, ptr %fib_addr
  %rcc.tmp.753 = add i32 %rcc.tmp.752, 0
  %rcc.tmp.754 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.755 = getelementptr [1024 x i32], ptr %rcc.tmp.754, i32 0, i32 %rcc.tmp.753
  store i32 8, ptr %rcc.tmp.755
  %rcc.tmp.757 = load i32, ptr %fib_addr
  %rcc.tmp.758 = add i32 %rcc.tmp.757, 1
  store i32 %rcc.tmp.758, ptr %fib_addr
  %rcc.tmp.760 = load i32, ptr %fib_addr
  %rcc.tmp.761 = add i32 %rcc.tmp.760, 0
  %rcc.tmp.762 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.763 = getelementptr [1024 x i32], ptr %rcc.tmp.762, i32 0, i32 %rcc.tmp.761
  store i32 600, ptr %rcc.tmp.763
  %rcc.tmp.765 = load i32, ptr %fib_addr
  %rcc.tmp.766 = add i32 %rcc.tmp.765, 1
  store i32 %rcc.tmp.766, ptr %fib_addr
  %rcc.tmp.768 = load i32, ptr %fib_addr
  %rcc.tmp.769 = add i32 %rcc.tmp.768, 0
  %rcc.tmp.770 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.771 = getelementptr [1024 x i32], ptr %rcc.tmp.770, i32 0, i32 %rcc.tmp.769
  store i32 3, ptr %rcc.tmp.771
  %rcc.tmp.773 = load i32, ptr %fib_addr
  %rcc.tmp.774 = add i32 %rcc.tmp.773, 1
  store i32 %rcc.tmp.774, ptr %fib_addr
  %rcc.tmp.776 = load i32, ptr %fib_addr
  %rcc.tmp.777 = add i32 %rcc.tmp.776, 0
  %rcc.tmp.778 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.779 = getelementptr [1024 x i32], ptr %rcc.tmp.778, i32 0, i32 %rcc.tmp.777
  store i32 8, ptr %rcc.tmp.779
  %rcc.tmp.781 = load i32, ptr %fib_addr
  %rcc.tmp.782 = add i32 %rcc.tmp.781, 1
  store i32 %rcc.tmp.782, ptr %fib_addr
  %rcc.tmp.784 = load i32, ptr %fib_addr
  %rcc.tmp.785 = add i32 %rcc.tmp.784, 0
  %rcc.tmp.786 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.787 = getelementptr [1024 x i32], ptr %rcc.tmp.786, i32 0, i32 %rcc.tmp.785
  store i32 800, ptr %rcc.tmp.787
  ret void
}
define void @execute_cycle.([1024 x i32]* %memory.tmp, i32* %pc.tmp, [256 x i32]* %stack.tmp, i32* %sp.tmp, i1* %running.tmp) {
entry:
  %memory..tmp = alloca [1024 x i32]* 
  %pc..tmp = alloca i32* 
  %stack..tmp = alloca [256 x i32]* 
  %sp..tmp = alloca i32* 
  %running..tmp = alloca i1* 
  %instruction = alloca i32 
  %value = alloca i32 
  %b = alloca i32 
  %a = alloca i32 
  %b.2 = alloca i32 
  %a.2 = alloca i32 
  %b.3 = alloca i32 
  %a.3 = alloca i32 
  %b.4 = alloca i32 
  %a.4 = alloca i32 
  %val = alloca i32 
  %val.2 = alloca i32 
  %val.3 = alloca i32 
  %b.5 = alloca i32 
  %a.5 = alloca i32 
  %b.6 = alloca i32 
  %a.6 = alloca i32 
  %addr = alloca i32 
  %val.4 = alloca i32 
  %addr.2 = alloca i32 
  %val.5 = alloca i32 
  %val.6 = alloca i32 
  store [1024 x i32]* %memory.tmp, ptr %memory..tmp
  store i32* %pc.tmp, ptr %pc..tmp
  store [256 x i32]* %stack.tmp, ptr %stack..tmp
  store i32* %sp.tmp, ptr %sp..tmp
  store i1* %running.tmp, ptr %running..tmp
  %rcc.tmp.6 = load i32*, ptr %pc..tmp
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 0
  %rcc.tmp.9 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.10 = getelementptr [1024 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.8
  %rcc.tmp.11 = load i32, ptr %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %instruction
  %rcc.tmp.13 = load i32*, ptr %pc..tmp
  %rcc.tmp.14 = load i32*, ptr %pc..tmp
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %rcc.tmp.13
  %rcc.tmp.18 = load i32, ptr %instruction
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i1*, ptr %running..tmp
  store i1 0, ptr %rcc.tmp.21
  br label %if.merge
if.else:
  %rcc.tmp.24 = load i32, ptr %instruction
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 1
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32*, ptr %pc..tmp
  %rcc.tmp.28 = load i32, ptr %rcc.tmp.27
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.31 = getelementptr [1024 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %value
  %rcc.tmp.34 = load i32*, ptr %pc..tmp
  %rcc.tmp.35 = load i32*, ptr %pc..tmp
  %rcc.tmp.36 = load i32, ptr %rcc.tmp.35
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %rcc.tmp.34
  %rcc.tmp.39 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.40 = load i32*, ptr %sp..tmp
  %rcc.tmp.41 = load i32, ptr %value
  call void @push_stack.([256 x i32]* %rcc.tmp.39, i32* %rcc.tmp.40, i32 %rcc.tmp.41)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.44 = load i32, ptr %instruction
  %rcc.tmp.45 = icmp eq i32 %rcc.tmp.44, 2
  br i1 %rcc.tmp.45, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.47 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.48 = load i32*, ptr %sp..tmp
  %rcc.tmp.49 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.47, i32* %rcc.tmp.48)
  br label %if.merge.3
if.else.3:
  %rcc.tmp.51 = load i32, ptr %instruction
  %rcc.tmp.52 = icmp eq i32 %rcc.tmp.51, 3
  br i1 %rcc.tmp.52, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.54 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.55 = load i32*, ptr %sp..tmp
  %rcc.tmp.56 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.54, i32* %rcc.tmp.55)
  store i32 %rcc.tmp.56, ptr %b
  %rcc.tmp.58 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.59 = load i32*, ptr %sp..tmp
  %rcc.tmp.60 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.58, i32* %rcc.tmp.59)
  store i32 %rcc.tmp.60, ptr %a
  %rcc.tmp.62 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.63 = load i32*, ptr %sp..tmp
  %rcc.tmp.64 = load i32, ptr %a
  %rcc.tmp.65 = load i32, ptr %b
  %rcc.tmp.66 = add i32 %rcc.tmp.64, %rcc.tmp.65
  call void @push_stack.([256 x i32]* %rcc.tmp.62, i32* %rcc.tmp.63, i32 %rcc.tmp.66)
  br label %if.merge.4
if.else.4:
  %rcc.tmp.69 = load i32, ptr %instruction
  %rcc.tmp.70 = icmp eq i32 %rcc.tmp.69, 4
  br i1 %rcc.tmp.70, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.72 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.73 = load i32*, ptr %sp..tmp
  %rcc.tmp.74 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.72, i32* %rcc.tmp.73)
  store i32 %rcc.tmp.74, ptr %b.2
  %rcc.tmp.76 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.77 = load i32*, ptr %sp..tmp
  %rcc.tmp.78 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.76, i32* %rcc.tmp.77)
  store i32 %rcc.tmp.78, ptr %a.2
  %rcc.tmp.80 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.81 = load i32*, ptr %sp..tmp
  %rcc.tmp.82 = load i32, ptr %a.2
  %rcc.tmp.83 = load i32, ptr %b.2
  %rcc.tmp.84 = sub i32 %rcc.tmp.82, %rcc.tmp.83
  call void @push_stack.([256 x i32]* %rcc.tmp.80, i32* %rcc.tmp.81, i32 %rcc.tmp.84)
  br label %if.merge.5
if.else.5:
  %rcc.tmp.87 = load i32, ptr %instruction
  %rcc.tmp.88 = icmp eq i32 %rcc.tmp.87, 5
  br i1 %rcc.tmp.88, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.90 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.91 = load i32*, ptr %sp..tmp
  %rcc.tmp.92 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.90, i32* %rcc.tmp.91)
  store i32 %rcc.tmp.92, ptr %b.3
  %rcc.tmp.94 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.95 = load i32*, ptr %sp..tmp
  %rcc.tmp.96 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.94, i32* %rcc.tmp.95)
  store i32 %rcc.tmp.96, ptr %a.3
  %rcc.tmp.98 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.99 = load i32*, ptr %sp..tmp
  %rcc.tmp.100 = load i32, ptr %a.3
  %rcc.tmp.101 = load i32, ptr %b.3
  %rcc.tmp.102 = mul i32 %rcc.tmp.100, %rcc.tmp.101
  call void @push_stack.([256 x i32]* %rcc.tmp.98, i32* %rcc.tmp.99, i32 %rcc.tmp.102)
  br label %if.merge.6
if.else.6:
  %rcc.tmp.105 = load i32, ptr %instruction
  %rcc.tmp.106 = icmp eq i32 %rcc.tmp.105, 6
  br i1 %rcc.tmp.106, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.108 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.109 = load i32*, ptr %sp..tmp
  %rcc.tmp.110 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.108, i32* %rcc.tmp.109)
  store i32 %rcc.tmp.110, ptr %b.4
  %rcc.tmp.112 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.113 = load i32*, ptr %sp..tmp
  %rcc.tmp.114 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.112, i32* %rcc.tmp.113)
  store i32 %rcc.tmp.114, ptr %a.4
  %rcc.tmp.116 = load i32, ptr %b.4
  %rcc.tmp.117 = icmp ne i32 %rcc.tmp.116, 0
  br i1 %rcc.tmp.117, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.119 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.120 = load i32*, ptr %sp..tmp
  %rcc.tmp.121 = load i32, ptr %a.4
  %rcc.tmp.122 = load i32, ptr %b.4
  %rcc.tmp.123 = sdiv i32 %rcc.tmp.121, %rcc.tmp.122
  call void @push_stack.([256 x i32]* %rcc.tmp.119, i32* %rcc.tmp.120, i32 %rcc.tmp.123)
  br label %if.merge.8
if.else.8:
  %rcc.tmp.126 = load i1*, ptr %running..tmp
  store i1 0, ptr %rcc.tmp.126
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.130 = load i32, ptr %instruction
  %rcc.tmp.131 = icmp eq i32 %rcc.tmp.130, 7
  br i1 %rcc.tmp.131, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.133 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.134 = load i32*, ptr %sp..tmp
  %rcc.tmp.135 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.133, i32* %rcc.tmp.134)
  store i32 %rcc.tmp.135, ptr %val
  %rcc.tmp.137 = load i32, ptr %val
  call void @printlnInt.(i32 %rcc.tmp.137)
  br label %if.merge.9
if.else.9:
  %rcc.tmp.140 = load i32, ptr %instruction
  %rcc.tmp.141 = icmp eq i32 %rcc.tmp.140, 8
  br i1 %rcc.tmp.141, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.143 = load i32*, ptr %pc..tmp
  %rcc.tmp.144 = load i32*, ptr %pc..tmp
  %rcc.tmp.145 = load i32, ptr %rcc.tmp.144
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.148 = getelementptr [1024 x i32], ptr %rcc.tmp.147, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.149 = load i32, ptr %rcc.tmp.148
  store i32 %rcc.tmp.149, ptr %rcc.tmp.143
  br label %if.merge.10
if.else.10:
  %rcc.tmp.152 = load i32, ptr %instruction
  %rcc.tmp.153 = icmp eq i32 %rcc.tmp.152, 9
  br i1 %rcc.tmp.153, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.155 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.156 = load i32*, ptr %sp..tmp
  %rcc.tmp.157 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.155, i32* %rcc.tmp.156)
  store i32 %rcc.tmp.157, ptr %val.2
  %rcc.tmp.159 = load i32, ptr %val.2
  %rcc.tmp.160 = icmp eq i32 %rcc.tmp.159, 0
  br i1 %rcc.tmp.160, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.162 = load i32*, ptr %pc..tmp
  %rcc.tmp.163 = load i32*, ptr %pc..tmp
  %rcc.tmp.164 = load i32, ptr %rcc.tmp.163
  %rcc.tmp.165 = add i32 %rcc.tmp.164, 0
  %rcc.tmp.166 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.167 = getelementptr [1024 x i32], ptr %rcc.tmp.166, i32 0, i32 %rcc.tmp.165
  %rcc.tmp.168 = load i32, ptr %rcc.tmp.167
  store i32 %rcc.tmp.168, ptr %rcc.tmp.162
  br label %if.merge.12
if.else.12:
  %rcc.tmp.171 = load i32*, ptr %pc..tmp
  %rcc.tmp.172 = load i32*, ptr %pc..tmp
  %rcc.tmp.173 = load i32, ptr %rcc.tmp.172
  %rcc.tmp.174 = add i32 %rcc.tmp.173, 1
  store i32 %rcc.tmp.174, ptr %rcc.tmp.171
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.else.11:
  %rcc.tmp.178 = load i32, ptr %instruction
  %rcc.tmp.179 = icmp eq i32 %rcc.tmp.178, 10
  br i1 %rcc.tmp.179, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.181 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.182 = load i32*, ptr %sp..tmp
  %rcc.tmp.183 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.181, i32* %rcc.tmp.182)
  store i32 %rcc.tmp.183, ptr %val.3
  %rcc.tmp.185 = load i32, ptr %val.3
  %rcc.tmp.186 = icmp ne i32 %rcc.tmp.185, 0
  br i1 %rcc.tmp.186, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.188 = load i32*, ptr %pc..tmp
  %rcc.tmp.189 = load i32*, ptr %pc..tmp
  %rcc.tmp.190 = load i32, ptr %rcc.tmp.189
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.193 = getelementptr [1024 x i32], ptr %rcc.tmp.192, i32 0, i32 %rcc.tmp.191
  %rcc.tmp.194 = load i32, ptr %rcc.tmp.193
  store i32 %rcc.tmp.194, ptr %rcc.tmp.188
  br label %if.merge.14
if.else.14:
  %rcc.tmp.197 = load i32*, ptr %pc..tmp
  %rcc.tmp.198 = load i32*, ptr %pc..tmp
  %rcc.tmp.199 = load i32, ptr %rcc.tmp.198
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 1
  store i32 %rcc.tmp.200, ptr %rcc.tmp.197
  br label %if.merge.14
if.merge.14:
  br label %if.merge.13
if.else.13:
  %rcc.tmp.204 = load i32, ptr %instruction
  %rcc.tmp.205 = icmp eq i32 %rcc.tmp.204, 11
  br i1 %rcc.tmp.205, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.207 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.208 = load i32*, ptr %sp..tmp
  %rcc.tmp.209 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.207, i32* %rcc.tmp.208)
  store i32 %rcc.tmp.209, ptr %b.5
  %rcc.tmp.211 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.212 = load i32*, ptr %sp..tmp
  %rcc.tmp.213 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.211, i32* %rcc.tmp.212)
  store i32 %rcc.tmp.213, ptr %a.5
  %rcc.tmp.215 = load i32, ptr %a.5
  %rcc.tmp.216 = load i32, ptr %b.5
  %rcc.tmp.217 = icmp eq i32 %rcc.tmp.215, %rcc.tmp.216
  br i1 %rcc.tmp.217, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.219 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.220 = load i32*, ptr %sp..tmp
  call void @push_stack.([256 x i32]* %rcc.tmp.219, i32* %rcc.tmp.220, i32 1)
  br label %if.merge.16
if.else.16:
  %rcc.tmp.223 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.224 = load i32*, ptr %sp..tmp
  call void @push_stack.([256 x i32]* %rcc.tmp.223, i32* %rcc.tmp.224, i32 0)
  br label %if.merge.16
if.merge.16:
  br label %if.merge.15
if.else.15:
  %rcc.tmp.228 = load i32, ptr %instruction
  %rcc.tmp.229 = icmp eq i32 %rcc.tmp.228, 12
  br i1 %rcc.tmp.229, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.231 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.232 = load i32*, ptr %sp..tmp
  %rcc.tmp.233 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.231, i32* %rcc.tmp.232)
  store i32 %rcc.tmp.233, ptr %b.6
  %rcc.tmp.235 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.236 = load i32*, ptr %sp..tmp
  %rcc.tmp.237 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.235, i32* %rcc.tmp.236)
  store i32 %rcc.tmp.237, ptr %a.6
  %rcc.tmp.239 = load i32, ptr %a.6
  %rcc.tmp.240 = load i32, ptr %b.6
  %rcc.tmp.241 = icmp slt i32 %rcc.tmp.239, %rcc.tmp.240
  br i1 %rcc.tmp.241, label %if.then.18, label %if.else.18
if.then.18:
  %rcc.tmp.243 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.244 = load i32*, ptr %sp..tmp
  call void @push_stack.([256 x i32]* %rcc.tmp.243, i32* %rcc.tmp.244, i32 1)
  br label %if.merge.18
if.else.18:
  %rcc.tmp.247 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.248 = load i32*, ptr %sp..tmp
  call void @push_stack.([256 x i32]* %rcc.tmp.247, i32* %rcc.tmp.248, i32 0)
  br label %if.merge.18
if.merge.18:
  br label %if.merge.17
if.else.17:
  %rcc.tmp.252 = load i32, ptr %instruction
  %rcc.tmp.253 = icmp eq i32 %rcc.tmp.252, 13
  br i1 %rcc.tmp.253, label %if.then.19, label %if.else.19
if.then.19:
  %rcc.tmp.255 = load i32*, ptr %pc..tmp
  %rcc.tmp.256 = load i32, ptr %rcc.tmp.255
  %rcc.tmp.257 = add i32 %rcc.tmp.256, 0
  %rcc.tmp.258 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.259 = getelementptr [1024 x i32], ptr %rcc.tmp.258, i32 0, i32 %rcc.tmp.257
  %rcc.tmp.260 = load i32, ptr %rcc.tmp.259
  store i32 %rcc.tmp.260, ptr %addr
  %rcc.tmp.262 = load i32*, ptr %pc..tmp
  %rcc.tmp.263 = load i32*, ptr %pc..tmp
  %rcc.tmp.264 = load i32, ptr %rcc.tmp.263
  %rcc.tmp.265 = add i32 %rcc.tmp.264, 1
  store i32 %rcc.tmp.265, ptr %rcc.tmp.262
  %rcc.tmp.267 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.268 = load i32*, ptr %sp..tmp
  %rcc.tmp.269 = call i32 @pop_stack.([256 x i32]* %rcc.tmp.267, i32* %rcc.tmp.268)
  store i32 %rcc.tmp.269, ptr %val.4
  %rcc.tmp.271 = load i32, ptr %addr
  %rcc.tmp.272 = add i32 %rcc.tmp.271, 0
  %rcc.tmp.273 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.274 = getelementptr [1024 x i32], ptr %rcc.tmp.273, i32 0, i32 %rcc.tmp.272
  %rcc.tmp.275 = load i32, ptr %val.4
  store i32 %rcc.tmp.275, ptr %rcc.tmp.274
  br label %if.merge.19
if.else.19:
  %rcc.tmp.278 = load i32, ptr %instruction
  %rcc.tmp.279 = icmp eq i32 %rcc.tmp.278, 14
  br i1 %rcc.tmp.279, label %if.then.20, label %if.else.20
if.then.20:
  %rcc.tmp.281 = load i32*, ptr %pc..tmp
  %rcc.tmp.282 = load i32, ptr %rcc.tmp.281
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 0
  %rcc.tmp.284 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.285 = getelementptr [1024 x i32], ptr %rcc.tmp.284, i32 0, i32 %rcc.tmp.283
  %rcc.tmp.286 = load i32, ptr %rcc.tmp.285
  store i32 %rcc.tmp.286, ptr %addr.2
  %rcc.tmp.288 = load i32*, ptr %pc..tmp
  %rcc.tmp.289 = load i32*, ptr %pc..tmp
  %rcc.tmp.290 = load i32, ptr %rcc.tmp.289
  %rcc.tmp.291 = add i32 %rcc.tmp.290, 1
  store i32 %rcc.tmp.291, ptr %rcc.tmp.288
  %rcc.tmp.293 = load i32, ptr %addr.2
  %rcc.tmp.294 = add i32 %rcc.tmp.293, 0
  %rcc.tmp.295 = load [1024 x i32]*, ptr %memory..tmp
  %rcc.tmp.296 = getelementptr [1024 x i32], ptr %rcc.tmp.295, i32 0, i32 %rcc.tmp.294
  %rcc.tmp.297 = load i32, ptr %rcc.tmp.296
  store i32 %rcc.tmp.297, ptr %val.5
  %rcc.tmp.299 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.300 = load i32*, ptr %sp..tmp
  %rcc.tmp.301 = load i32, ptr %val.5
  call void @push_stack.([256 x i32]* %rcc.tmp.299, i32* %rcc.tmp.300, i32 %rcc.tmp.301)
  br label %if.merge.20
if.else.20:
  %rcc.tmp.304 = load i32, ptr %instruction
  %rcc.tmp.305 = icmp eq i32 %rcc.tmp.304, 15
  br i1 %rcc.tmp.305, label %if.then.21, label %if.else.21
if.then.21:
  %rcc.tmp.307 = load i32*, ptr %sp..tmp
  %rcc.tmp.308 = load i32, ptr %rcc.tmp.307
  %rcc.tmp.309 = add i32 %rcc.tmp.308, 0
  %rcc.tmp.310 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.311 = getelementptr [256 x i32], ptr %rcc.tmp.310, i32 0, i32 %rcc.tmp.309
  %rcc.tmp.312 = load i32, ptr %rcc.tmp.311
  store i32 %rcc.tmp.312, ptr %val.6
  %rcc.tmp.314 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.315 = load i32*, ptr %sp..tmp
  %rcc.tmp.316 = load i32, ptr %val.6
  call void @push_stack.([256 x i32]* %rcc.tmp.314, i32* %rcc.tmp.315, i32 %rcc.tmp.316)
  br label %if.merge.21
if.else.21:
  br label %if.merge.21
if.merge.21:
  br label %if.merge.20
if.merge.20:
  br label %if.merge.19
if.merge.19:
  br label %if.merge.17
if.merge.17:
  br label %if.merge.15
if.merge.15:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.7
if.merge.7:
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
  ret void
}
define void @main() {
entry:
  %memory = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %stack = alloca [256 x i32] 
  %fill.idx.2 = alloca i32 
  %pc = alloca i32 
  %sp = alloca i32 
  %running = alloca i1 
  %cycle_count = alloca i32 
  %max_cycles = alloca i32 
  %i = alloca i32 
  %checksum = alloca i32 
  %vm_state = alloca i32 
  %i.2 = alloca i32 
  %vm_state.2 = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 1024
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [1024 x i32], ptr %memory, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.9, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.14 = load i32, ptr %fill.idx.2
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 256
  br i1 %rcc.tmp.15, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.17 = load i32, ptr %fill.idx.2
  %rcc.tmp.18 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.17
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.20, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %pc
  %rcc.tmp.24 = sub i32 0, 1
  store i32 %rcc.tmp.24, ptr %sp
  store i1 1, ptr %running
  call void @load_program.([1024 x i32]* %memory)
  store i32 0, ptr %cycle_count
  store i32 5000, ptr %max_cycles
  br label %while.cond
while.cond:
  %rcc.tmp.31 = load i1, ptr %running
  br i1 %rcc.tmp.31, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.34 = load i32, ptr %cycle_count
  %rcc.tmp.35 = load i32, ptr %max_cycles
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then, label %if.else
if.then:
  br label %while.linker
if.else:
  br label %if.merge
if.merge:
  call void @execute_cycle.([1024 x i32]* %memory, i32* %pc, [256 x i32]* %stack, i32* %sp, i1* %running)
  %rcc.tmp.41 = load i32, ptr %cycle_count
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %cycle_count
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %cycle_count
  call void @printlnInt.(i32 %rcc.tmp.45)
  %rcc.tmp.47 = load i32, ptr %sp
  call void @printlnInt.(i32 %rcc.tmp.47)
  store i32 0, ptr %i
  store i32 0, ptr %checksum
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.52, 256
  br i1 %rcc.tmp.53, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.56 = load i32, ptr %checksum
  %rcc.tmp.57 = load i32, ptr %i
  %rcc.tmp.58 = add i32 %rcc.tmp.57, 0
  %rcc.tmp.59 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  %rcc.tmp.61 = add i32 %rcc.tmp.56, %rcc.tmp.60
  store i32 %rcc.tmp.61, ptr %checksum
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 1
  store i32 %rcc.tmp.64, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.67 = load i32, ptr %checksum
  call void @printlnInt.(i32 %rcc.tmp.67)
  store i32 100, ptr %pc
  %rcc.tmp.70 = sub i32 0, 1
  store i32 %rcc.tmp.70, ptr %sp
  store i1 1, ptr %running
  store i32 0, ptr %cycle_count
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.75 = load i1, ptr %running
  br i1 %rcc.tmp.75, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.78 = load i32, ptr %cycle_count
  %rcc.tmp.79 = icmp sgt i32 %rcc.tmp.78, 100
  br i1 %rcc.tmp.79, label %if.then.2, label %if.else.2
if.then.2:
  br label %while.linker.3
if.else.2:
  br label %if.merge.2
if.merge.2:
  call void @execute_cycle.([1024 x i32]* %memory, i32* %pc, [256 x i32]* %stack, i32* %sp, i1* %running)
  %rcc.tmp.84 = load i32, ptr %cycle_count
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 1
  store i32 %rcc.tmp.85, ptr %cycle_count
  br label %while.cond.3
while.end.3:
  store i32 1, ptr %vm_state
  store i32 0, ptr %i.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.91 = load i32, ptr %i.2
  %rcc.tmp.92 = icmp slt i32 %rcc.tmp.91, 10
  br i1 %rcc.tmp.92, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.95 = load i32, ptr %vm_state
  %rcc.tmp.96 = load i32, ptr %i.2
  %rcc.tmp.97 = add i32 %rcc.tmp.95, %rcc.tmp.96
  store i32 %rcc.tmp.97, ptr %vm_state.2
  %rcc.tmp.99 = load i32, ptr %i.2
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 1
  store i32 %rcc.tmp.100, ptr %i.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.103 = load i32, ptr %vm_state
  call void @printlnInt.(i32 %rcc.tmp.103)
  call void @exit.(i32 0)
  ret void
}
