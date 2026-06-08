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
%VM = type {i32, i32, [256 x i32], [1024 x i32]}
define void @main() {
entry:
  %vm = alloca %VM 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %rcc.tmp.1 = getelementptr %VM, ptr %vm, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr %VM, ptr %vm, i32 0, i32 1
  %rcc.tmp.4 = sub i32 256, 1
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr %VM, ptr %vm, i32 0, i32 2
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 256
  br i1 %rcc.tmp.10, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.12 = load i32, ptr %fill.idx
  %rcc.tmp.13 = getelementptr [256 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.12
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.15, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.18 = getelementptr %VM, ptr %vm, i32 0, i32 3
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.21 = load i32, ptr %fill.idx.2
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 1024
  br i1 %rcc.tmp.22, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.24 = load i32, ptr %fill.idx.2
  %rcc.tmp.25 = getelementptr [1024 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.27, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  call void @load_program.(%VM* %vm)
  call void @execute.(%VM* %vm)
  call void @printlnInt.(i32 9999)
  call void @exit.(i32 0)
  ret void
}
define void @load_program.(%VM* %vm.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %prog = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %loop_start = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 1024
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.15
  store i32 1, ptr %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 1
  store i32 %rcc.tmp.19, ptr %i
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.22
  store i32 10, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %i
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.29
  store i32 1, ptr %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.36
  store i32 20, ptr %rcc.tmp.37
  %rcc.tmp.39 = load i32, ptr %i
  %rcc.tmp.40 = add i32 %rcc.tmp.39, 1
  store i32 %rcc.tmp.40, ptr %i
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.43
  store i32 13, ptr %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.50
  store i32 50, ptr %rcc.tmp.51
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  %rcc.tmp.56 = load i32, ptr %i
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.57
  store i32 15, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i32, ptr %i
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 1
  store i32 %rcc.tmp.61, ptr %i
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.64
  store i32 0, ptr %rcc.tmp.65
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 1
  store i32 %rcc.tmp.68, ptr %i
  store i32 50, ptr %i
  %rcc.tmp.71 = load i32, ptr %i
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.72
  store i32 1, ptr %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %i
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %i
  %rcc.tmp.78 = load i32, ptr %i
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.79
  store i32 5, ptr %rcc.tmp.80
  %rcc.tmp.82 = load i32, ptr %i
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %i
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 0
  %rcc.tmp.87 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.86
  store i32 1, ptr %rcc.tmp.87
  %rcc.tmp.89 = load i32, ptr %i
  %rcc.tmp.90 = add i32 %rcc.tmp.89, 1
  store i32 %rcc.tmp.90, ptr %i
  %rcc.tmp.92 = load i32, ptr %i
  %rcc.tmp.93 = add i32 %rcc.tmp.92, 0
  %rcc.tmp.94 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.93
  store i32 3, ptr %rcc.tmp.94
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %i
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = add i32 %rcc.tmp.99, 0
  %rcc.tmp.101 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.100
  store i32 4, ptr %rcc.tmp.101
  %rcc.tmp.103 = load i32, ptr %i
  %rcc.tmp.104 = add i32 %rcc.tmp.103, 1
  store i32 %rcc.tmp.104, ptr %i
  %rcc.tmp.106 = load i32, ptr %i
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.107
  store i32 15, ptr %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %i
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 1
  store i32 %rcc.tmp.111, ptr %i
  %rcc.tmp.113 = load i32, ptr %i
  %rcc.tmp.114 = add i32 %rcc.tmp.113, 0
  %rcc.tmp.115 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.114
  store i32 1, ptr %rcc.tmp.115
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %i
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.121
  store i32 100, ptr %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %i
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.128
  store i32 13, ptr %rcc.tmp.129
  %rcc.tmp.131 = load i32, ptr %i
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  store i32 %rcc.tmp.132, ptr %i
  %rcc.tmp.134 = load i32, ptr %i
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.135
  store i32 200, ptr %rcc.tmp.136
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  %rcc.tmp.141 = load i32, ptr %i
  %rcc.tmp.142 = add i32 %rcc.tmp.141, 0
  %rcc.tmp.143 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.142
  store i32 3, ptr %rcc.tmp.143
  %rcc.tmp.145 = load i32, ptr %i
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 1
  store i32 %rcc.tmp.146, ptr %i
  %rcc.tmp.148 = load i32, ptr %i
  %rcc.tmp.149 = add i32 %rcc.tmp.148, 0
  %rcc.tmp.150 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.149
  store i32 14, ptr %rcc.tmp.150
  %rcc.tmp.152 = load i32, ptr %i
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 1
  store i32 %rcc.tmp.153, ptr %i
  store i32 100, ptr %i
  %rcc.tmp.156 = load i32, ptr %i
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 0
  %rcc.tmp.158 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.157
  store i32 1, ptr %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %i
  %rcc.tmp.163 = load i32, ptr %i
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 0
  %rcc.tmp.165 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.164
  store i32 1, ptr %rcc.tmp.165
  %rcc.tmp.167 = load i32, ptr %i
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  store i32 %rcc.tmp.168, ptr %i
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 0
  %rcc.tmp.172 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.171
  store i32 1, ptr %rcc.tmp.172
  %rcc.tmp.174 = load i32, ptr %i
  %rcc.tmp.175 = add i32 %rcc.tmp.174, 1
  store i32 %rcc.tmp.175, ptr %i
  %rcc.tmp.177 = load i32, ptr %i
  %rcc.tmp.178 = add i32 %rcc.tmp.177, 0
  %rcc.tmp.179 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.178
  store i32 1, ptr %rcc.tmp.179
  %rcc.tmp.181 = load i32, ptr %i
  %rcc.tmp.182 = add i32 %rcc.tmp.181, 1
  store i32 %rcc.tmp.182, ptr %i
  store i32 0, ptr %j
  br label %while.cond
while.cond:
  %rcc.tmp.186 = load i32, ptr %j
  %rcc.tmp.187 = icmp slt i32 %rcc.tmp.186, 10
  br i1 %rcc.tmp.187, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.190 = load i32, ptr %i
  %rcc.tmp.191 = add i32 %rcc.tmp.190, 0
  %rcc.tmp.192 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.191
  store i32 3, ptr %rcc.tmp.192
  %rcc.tmp.194 = load i32, ptr %i
  %rcc.tmp.195 = add i32 %rcc.tmp.194, 1
  store i32 %rcc.tmp.195, ptr %i
  %rcc.tmp.197 = load i32, ptr %i
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 0
  %rcc.tmp.199 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.198
  store i32 1, ptr %rcc.tmp.199
  %rcc.tmp.201 = load i32, ptr %i
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 1
  store i32 %rcc.tmp.202, ptr %i
  %rcc.tmp.204 = load i32, ptr %i
  %rcc.tmp.205 = add i32 %rcc.tmp.204, 0
  %rcc.tmp.206 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.205
  %rcc.tmp.207 = load %VM*, ptr %vm..tmp
  %rcc.tmp.208 = getelementptr %VM, ptr %rcc.tmp.207, i32 0, i32 2
  %rcc.tmp.209 = load %VM*, ptr %vm..tmp
  %rcc.tmp.210 = getelementptr %VM, ptr %rcc.tmp.209, i32 0, i32 1
  %rcc.tmp.211 = load i32, ptr %rcc.tmp.210
  %rcc.tmp.212 = add i32 %rcc.tmp.211, 0
  %rcc.tmp.213 = getelementptr [256 x i32], ptr %rcc.tmp.208, i32 0, i32 %rcc.tmp.212
  %rcc.tmp.214 = load i32, ptr %rcc.tmp.213
  store i32 %rcc.tmp.214, ptr %rcc.tmp.206
  %rcc.tmp.216 = load i32, ptr %i
  %rcc.tmp.217 = add i32 %rcc.tmp.216, 1
  store i32 %rcc.tmp.217, ptr %i
  %rcc.tmp.219 = load i32, ptr %i
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 0
  %rcc.tmp.221 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.220
  store i32 1, ptr %rcc.tmp.221
  %rcc.tmp.223 = load i32, ptr %i
  %rcc.tmp.224 = add i32 %rcc.tmp.223, 1
  store i32 %rcc.tmp.224, ptr %i
  %rcc.tmp.226 = load i32, ptr %i
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 0
  %rcc.tmp.228 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.227
  %rcc.tmp.229 = load %VM*, ptr %vm..tmp
  %rcc.tmp.230 = getelementptr %VM, ptr %rcc.tmp.229, i32 0, i32 2
  %rcc.tmp.231 = load %VM*, ptr %vm..tmp
  %rcc.tmp.232 = getelementptr %VM, ptr %rcc.tmp.231, i32 0, i32 1
  %rcc.tmp.233 = load i32, ptr %rcc.tmp.232
  %rcc.tmp.234 = sub i32 %rcc.tmp.233, 1
  %rcc.tmp.235 = add i32 %rcc.tmp.234, 0
  %rcc.tmp.236 = getelementptr [256 x i32], ptr %rcc.tmp.230, i32 0, i32 %rcc.tmp.235
  %rcc.tmp.237 = load i32, ptr %rcc.tmp.236
  store i32 %rcc.tmp.237, ptr %rcc.tmp.228
  %rcc.tmp.239 = load i32, ptr %i
  %rcc.tmp.240 = add i32 %rcc.tmp.239, 1
  store i32 %rcc.tmp.240, ptr %i
  %rcc.tmp.242 = load i32, ptr %j
  %rcc.tmp.243 = add i32 %rcc.tmp.242, 1
  store i32 %rcc.tmp.243, ptr %j
  br label %while.cond
while.end:
  %rcc.tmp.246 = load i32, ptr %i
  %rcc.tmp.247 = add i32 %rcc.tmp.246, 0
  %rcc.tmp.248 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.247
  store i32 2, ptr %rcc.tmp.248
  %rcc.tmp.250 = load i32, ptr %i
  %rcc.tmp.251 = add i32 %rcc.tmp.250, 1
  store i32 %rcc.tmp.251, ptr %i
  %rcc.tmp.253 = load i32, ptr %i
  %rcc.tmp.254 = add i32 %rcc.tmp.253, 0
  %rcc.tmp.255 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.254
  store i32 15, ptr %rcc.tmp.255
  %rcc.tmp.257 = load i32, ptr %i
  %rcc.tmp.258 = add i32 %rcc.tmp.257, 1
  store i32 %rcc.tmp.258, ptr %i
  %rcc.tmp.260 = load i32, ptr %i
  %rcc.tmp.261 = add i32 %rcc.tmp.260, 0
  %rcc.tmp.262 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.261
  store i32 14, ptr %rcc.tmp.262
  %rcc.tmp.264 = load i32, ptr %i
  %rcc.tmp.265 = add i32 %rcc.tmp.264, 1
  store i32 %rcc.tmp.265, ptr %i
  store i32 200, ptr %i
  %rcc.tmp.268 = load i32, ptr %i
  %rcc.tmp.269 = add i32 %rcc.tmp.268, 0
  %rcc.tmp.270 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.269
  store i32 1, ptr %rcc.tmp.270
  %rcc.tmp.272 = load i32, ptr %i
  %rcc.tmp.273 = add i32 %rcc.tmp.272, 1
  store i32 %rcc.tmp.273, ptr %i
  %rcc.tmp.275 = load i32, ptr %i
  %rcc.tmp.276 = add i32 %rcc.tmp.275, 0
  %rcc.tmp.277 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.276
  store i32 10, ptr %rcc.tmp.277
  %rcc.tmp.279 = load i32, ptr %i
  %rcc.tmp.280 = add i32 %rcc.tmp.279, 1
  store i32 %rcc.tmp.280, ptr %i
  %rcc.tmp.282 = load i32, ptr %i
  %rcc.tmp.283 = add i32 %rcc.tmp.282, 0
  %rcc.tmp.284 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.283
  store i32 1, ptr %rcc.tmp.284
  %rcc.tmp.286 = load i32, ptr %i
  %rcc.tmp.287 = add i32 %rcc.tmp.286, 1
  store i32 %rcc.tmp.287, ptr %i
  %rcc.tmp.289 = load i32, ptr %i
  %rcc.tmp.290 = add i32 %rcc.tmp.289, 0
  %rcc.tmp.291 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.290
  store i32 0, ptr %rcc.tmp.291
  %rcc.tmp.293 = load i32, ptr %i
  %rcc.tmp.294 = add i32 %rcc.tmp.293, 1
  store i32 %rcc.tmp.294, ptr %i
  %rcc.tmp.296 = load i32, ptr %i
  %rcc.tmp.297 = add i32 %rcc.tmp.296, 0
  %rcc.tmp.298 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.297
  store i32 1, ptr %rcc.tmp.298
  %rcc.tmp.300 = load i32, ptr %i
  %rcc.tmp.301 = add i32 %rcc.tmp.300, 1
  store i32 %rcc.tmp.301, ptr %i
  %rcc.tmp.303 = load i32, ptr %i
  %rcc.tmp.304 = add i32 %rcc.tmp.303, 0
  %rcc.tmp.305 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.304
  store i32 1, ptr %rcc.tmp.305
  %rcc.tmp.307 = load i32, ptr %i
  %rcc.tmp.308 = add i32 %rcc.tmp.307, 1
  store i32 %rcc.tmp.308, ptr %i
  %rcc.tmp.310 = load i32, ptr %i
  store i32 %rcc.tmp.310, ptr %loop_start
  %rcc.tmp.312 = load i32, ptr %i
  %rcc.tmp.313 = add i32 %rcc.tmp.312, 0
  %rcc.tmp.314 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.313
  store i32 1, ptr %rcc.tmp.314
  %rcc.tmp.316 = load i32, ptr %i
  %rcc.tmp.317 = add i32 %rcc.tmp.316, 1
  store i32 %rcc.tmp.317, ptr %i
  %rcc.tmp.319 = load i32, ptr %i
  %rcc.tmp.320 = add i32 %rcc.tmp.319, 0
  %rcc.tmp.321 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.320
  %rcc.tmp.322 = load %VM*, ptr %vm..tmp
  %rcc.tmp.323 = getelementptr %VM, ptr %rcc.tmp.322, i32 0, i32 2
  %rcc.tmp.324 = load %VM*, ptr %vm..tmp
  %rcc.tmp.325 = getelementptr %VM, ptr %rcc.tmp.324, i32 0, i32 1
  %rcc.tmp.326 = load i32, ptr %rcc.tmp.325
  %rcc.tmp.327 = sub i32 %rcc.tmp.326, 2
  %rcc.tmp.328 = add i32 %rcc.tmp.327, 0
  %rcc.tmp.329 = getelementptr [256 x i32], ptr %rcc.tmp.323, i32 0, i32 %rcc.tmp.328
  %rcc.tmp.330 = load i32, ptr %rcc.tmp.329
  store i32 %rcc.tmp.330, ptr %rcc.tmp.321
  %rcc.tmp.332 = load i32, ptr %i
  %rcc.tmp.333 = add i32 %rcc.tmp.332, 1
  store i32 %rcc.tmp.333, ptr %i
  %rcc.tmp.335 = load i32, ptr %i
  %rcc.tmp.336 = add i32 %rcc.tmp.335, 0
  %rcc.tmp.337 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.336
  store i32 1, ptr %rcc.tmp.337
  %rcc.tmp.339 = load i32, ptr %i
  %rcc.tmp.340 = add i32 %rcc.tmp.339, 1
  store i32 %rcc.tmp.340, ptr %i
  %rcc.tmp.342 = load i32, ptr %i
  %rcc.tmp.343 = add i32 %rcc.tmp.342, 0
  %rcc.tmp.344 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.343
  %rcc.tmp.345 = load %VM*, ptr %vm..tmp
  %rcc.tmp.346 = getelementptr %VM, ptr %rcc.tmp.345, i32 0, i32 2
  %rcc.tmp.347 = load %VM*, ptr %vm..tmp
  %rcc.tmp.348 = getelementptr %VM, ptr %rcc.tmp.347, i32 0, i32 1
  %rcc.tmp.349 = load i32, ptr %rcc.tmp.348
  %rcc.tmp.350 = sub i32 %rcc.tmp.349, 2
  %rcc.tmp.351 = add i32 %rcc.tmp.350, 0
  %rcc.tmp.352 = getelementptr [256 x i32], ptr %rcc.tmp.346, i32 0, i32 %rcc.tmp.351
  %rcc.tmp.353 = load i32, ptr %rcc.tmp.352
  store i32 %rcc.tmp.353, ptr %rcc.tmp.344
  %rcc.tmp.355 = load i32, ptr %i
  %rcc.tmp.356 = add i32 %rcc.tmp.355, 1
  store i32 %rcc.tmp.356, ptr %i
  %rcc.tmp.358 = load i32, ptr %i
  %rcc.tmp.359 = add i32 %rcc.tmp.358, 0
  %rcc.tmp.360 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.359
  store i32 3, ptr %rcc.tmp.360
  %rcc.tmp.362 = load i32, ptr %i
  %rcc.tmp.363 = add i32 %rcc.tmp.362, 1
  store i32 %rcc.tmp.363, ptr %i
  %rcc.tmp.365 = load i32, ptr %i
  %rcc.tmp.366 = add i32 %rcc.tmp.365, 0
  %rcc.tmp.367 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.366
  store i32 2, ptr %rcc.tmp.367
  %rcc.tmp.369 = load i32, ptr %i
  %rcc.tmp.370 = add i32 %rcc.tmp.369, 1
  store i32 %rcc.tmp.370, ptr %i
  %rcc.tmp.372 = load %VM*, ptr %vm..tmp
  %rcc.tmp.373 = getelementptr %VM, ptr %rcc.tmp.372, i32 0, i32 2
  %rcc.tmp.374 = load %VM*, ptr %vm..tmp
  %rcc.tmp.375 = getelementptr %VM, ptr %rcc.tmp.374, i32 0, i32 1
  %rcc.tmp.376 = load i32, ptr %rcc.tmp.375
  %rcc.tmp.377 = sub i32 %rcc.tmp.376, 2
  %rcc.tmp.378 = add i32 %rcc.tmp.377, 0
  %rcc.tmp.379 = getelementptr [256 x i32], ptr %rcc.tmp.373, i32 0, i32 %rcc.tmp.378
  %rcc.tmp.380 = load %VM*, ptr %vm..tmp
  %rcc.tmp.381 = getelementptr %VM, ptr %rcc.tmp.380, i32 0, i32 2
  %rcc.tmp.382 = load %VM*, ptr %vm..tmp
  %rcc.tmp.383 = getelementptr %VM, ptr %rcc.tmp.382, i32 0, i32 1
  %rcc.tmp.384 = load i32, ptr %rcc.tmp.383
  %rcc.tmp.385 = add i32 %rcc.tmp.384, 0
  %rcc.tmp.386 = getelementptr [256 x i32], ptr %rcc.tmp.381, i32 0, i32 %rcc.tmp.385
  %rcc.tmp.387 = load i32, ptr %rcc.tmp.386
  store i32 %rcc.tmp.387, ptr %rcc.tmp.379
  %rcc.tmp.389 = load i32, ptr %i
  %rcc.tmp.390 = add i32 %rcc.tmp.389, 0
  %rcc.tmp.391 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.390
  %rcc.tmp.392 = load %VM*, ptr %vm..tmp
  %rcc.tmp.393 = getelementptr %VM, ptr %rcc.tmp.392, i32 0, i32 2
  %rcc.tmp.394 = load %VM*, ptr %vm..tmp
  %rcc.tmp.395 = getelementptr %VM, ptr %rcc.tmp.394, i32 0, i32 1
  %rcc.tmp.396 = load i32, ptr %rcc.tmp.395
  %rcc.tmp.397 = sub i32 %rcc.tmp.396, 2
  %rcc.tmp.398 = add i32 %rcc.tmp.397, 0
  %rcc.tmp.399 = getelementptr [256 x i32], ptr %rcc.tmp.393, i32 0, i32 %rcc.tmp.398
  %rcc.tmp.400 = load i32, ptr %rcc.tmp.399
  store i32 %rcc.tmp.400, ptr %rcc.tmp.391
  %rcc.tmp.402 = load i32, ptr %i
  %rcc.tmp.403 = add i32 %rcc.tmp.402, 1
  store i32 %rcc.tmp.403, ptr %i
  %rcc.tmp.405 = load i32, ptr %i
  %rcc.tmp.406 = add i32 %rcc.tmp.405, 0
  %rcc.tmp.407 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.406
  store i32 2, ptr %rcc.tmp.407
  %rcc.tmp.409 = load i32, ptr %i
  %rcc.tmp.410 = add i32 %rcc.tmp.409, 1
  store i32 %rcc.tmp.410, ptr %i
  %rcc.tmp.412 = load i32, ptr %i
  %rcc.tmp.413 = add i32 %rcc.tmp.412, 0
  %rcc.tmp.414 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.413
  store i32 1, ptr %rcc.tmp.414
  %rcc.tmp.416 = load i32, ptr %i
  %rcc.tmp.417 = add i32 %rcc.tmp.416, 1
  store i32 %rcc.tmp.417, ptr %i
  %rcc.tmp.419 = load i32, ptr %i
  %rcc.tmp.420 = add i32 %rcc.tmp.419, 0
  %rcc.tmp.421 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.420
  %rcc.tmp.422 = load %VM*, ptr %vm..tmp
  %rcc.tmp.423 = getelementptr %VM, ptr %rcc.tmp.422, i32 0, i32 2
  %rcc.tmp.424 = load %VM*, ptr %vm..tmp
  %rcc.tmp.425 = getelementptr %VM, ptr %rcc.tmp.424, i32 0, i32 1
  %rcc.tmp.426 = load i32, ptr %rcc.tmp.425
  %rcc.tmp.427 = sub i32 %rcc.tmp.426, 1
  %rcc.tmp.428 = add i32 %rcc.tmp.427, 0
  %rcc.tmp.429 = getelementptr [256 x i32], ptr %rcc.tmp.423, i32 0, i32 %rcc.tmp.428
  %rcc.tmp.430 = load i32, ptr %rcc.tmp.429
  store i32 %rcc.tmp.430, ptr %rcc.tmp.421
  %rcc.tmp.432 = load i32, ptr %i
  %rcc.tmp.433 = add i32 %rcc.tmp.432, 1
  store i32 %rcc.tmp.433, ptr %i
  %rcc.tmp.435 = load i32, ptr %i
  %rcc.tmp.436 = add i32 %rcc.tmp.435, 0
  %rcc.tmp.437 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.436
  store i32 1, ptr %rcc.tmp.437
  %rcc.tmp.439 = load i32, ptr %i
  %rcc.tmp.440 = add i32 %rcc.tmp.439, 1
  store i32 %rcc.tmp.440, ptr %i
  %rcc.tmp.442 = load i32, ptr %i
  %rcc.tmp.443 = add i32 %rcc.tmp.442, 0
  %rcc.tmp.444 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.443
  store i32 1, ptr %rcc.tmp.444
  %rcc.tmp.446 = load i32, ptr %i
  %rcc.tmp.447 = add i32 %rcc.tmp.446, 1
  store i32 %rcc.tmp.447, ptr %i
  %rcc.tmp.449 = load i32, ptr %i
  %rcc.tmp.450 = add i32 %rcc.tmp.449, 0
  %rcc.tmp.451 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.450
  store i32 3, ptr %rcc.tmp.451
  %rcc.tmp.453 = load i32, ptr %i
  %rcc.tmp.454 = add i32 %rcc.tmp.453, 1
  store i32 %rcc.tmp.454, ptr %i
  %rcc.tmp.456 = load i32, ptr %i
  %rcc.tmp.457 = add i32 %rcc.tmp.456, 0
  %rcc.tmp.458 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.457
  store i32 2, ptr %rcc.tmp.458
  %rcc.tmp.460 = load i32, ptr %i
  %rcc.tmp.461 = add i32 %rcc.tmp.460, 1
  store i32 %rcc.tmp.461, ptr %i
  %rcc.tmp.463 = load i32, ptr %i
  %rcc.tmp.464 = add i32 %rcc.tmp.463, 0
  %rcc.tmp.465 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.464
  %rcc.tmp.466 = load %VM*, ptr %vm..tmp
  %rcc.tmp.467 = getelementptr %VM, ptr %rcc.tmp.466, i32 0, i32 2
  %rcc.tmp.468 = load %VM*, ptr %vm..tmp
  %rcc.tmp.469 = getelementptr %VM, ptr %rcc.tmp.468, i32 0, i32 1
  %rcc.tmp.470 = load i32, ptr %rcc.tmp.469
  %rcc.tmp.471 = sub i32 %rcc.tmp.470, 1
  %rcc.tmp.472 = add i32 %rcc.tmp.471, 0
  %rcc.tmp.473 = getelementptr [256 x i32], ptr %rcc.tmp.467, i32 0, i32 %rcc.tmp.472
  %rcc.tmp.474 = load i32, ptr %rcc.tmp.473
  store i32 %rcc.tmp.474, ptr %rcc.tmp.465
  %rcc.tmp.476 = load %VM*, ptr %vm..tmp
  %rcc.tmp.477 = getelementptr %VM, ptr %rcc.tmp.476, i32 0, i32 2
  %rcc.tmp.478 = load %VM*, ptr %vm..tmp
  %rcc.tmp.479 = getelementptr %VM, ptr %rcc.tmp.478, i32 0, i32 1
  %rcc.tmp.480 = load i32, ptr %rcc.tmp.479
  %rcc.tmp.481 = sub i32 %rcc.tmp.480, 1
  %rcc.tmp.482 = add i32 %rcc.tmp.481, 0
  %rcc.tmp.483 = getelementptr [256 x i32], ptr %rcc.tmp.477, i32 0, i32 %rcc.tmp.482
  %rcc.tmp.484 = load %VM*, ptr %vm..tmp
  %rcc.tmp.485 = getelementptr %VM, ptr %rcc.tmp.484, i32 0, i32 2
  %rcc.tmp.486 = load %VM*, ptr %vm..tmp
  %rcc.tmp.487 = getelementptr %VM, ptr %rcc.tmp.486, i32 0, i32 1
  %rcc.tmp.488 = load i32, ptr %rcc.tmp.487
  %rcc.tmp.489 = add i32 %rcc.tmp.488, 0
  %rcc.tmp.490 = getelementptr [256 x i32], ptr %rcc.tmp.485, i32 0, i32 %rcc.tmp.489
  %rcc.tmp.491 = load i32, ptr %rcc.tmp.490
  store i32 %rcc.tmp.491, ptr %rcc.tmp.483
  %rcc.tmp.493 = load i32, ptr %i
  %rcc.tmp.494 = add i32 %rcc.tmp.493, 1
  store i32 %rcc.tmp.494, ptr %i
  %rcc.tmp.496 = load i32, ptr %i
  %rcc.tmp.497 = add i32 %rcc.tmp.496, 0
  %rcc.tmp.498 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.497
  store i32 2, ptr %rcc.tmp.498
  %rcc.tmp.500 = load i32, ptr %i
  %rcc.tmp.501 = add i32 %rcc.tmp.500, 1
  store i32 %rcc.tmp.501, ptr %i
  %rcc.tmp.503 = load i32, ptr %i
  %rcc.tmp.504 = add i32 %rcc.tmp.503, 0
  %rcc.tmp.505 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.504
  store i32 1, ptr %rcc.tmp.505
  %rcc.tmp.507 = load i32, ptr %i
  %rcc.tmp.508 = add i32 %rcc.tmp.507, 1
  store i32 %rcc.tmp.508, ptr %i
  %rcc.tmp.510 = load i32, ptr %i
  %rcc.tmp.511 = add i32 %rcc.tmp.510, 0
  %rcc.tmp.512 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.511
  %rcc.tmp.513 = load %VM*, ptr %vm..tmp
  %rcc.tmp.514 = getelementptr %VM, ptr %rcc.tmp.513, i32 0, i32 2
  %rcc.tmp.515 = load %VM*, ptr %vm..tmp
  %rcc.tmp.516 = getelementptr %VM, ptr %rcc.tmp.515, i32 0, i32 1
  %rcc.tmp.517 = load i32, ptr %rcc.tmp.516
  %rcc.tmp.518 = add i32 %rcc.tmp.517, 0
  %rcc.tmp.519 = getelementptr [256 x i32], ptr %rcc.tmp.514, i32 0, i32 %rcc.tmp.518
  %rcc.tmp.520 = load i32, ptr %rcc.tmp.519
  store i32 %rcc.tmp.520, ptr %rcc.tmp.512
  %rcc.tmp.522 = load i32, ptr %i
  %rcc.tmp.523 = add i32 %rcc.tmp.522, 1
  store i32 %rcc.tmp.523, ptr %i
  %rcc.tmp.525 = load i32, ptr %i
  %rcc.tmp.526 = add i32 %rcc.tmp.525, 0
  %rcc.tmp.527 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.526
  store i32 1, ptr %rcc.tmp.527
  %rcc.tmp.529 = load i32, ptr %i
  %rcc.tmp.530 = add i32 %rcc.tmp.529, 1
  store i32 %rcc.tmp.530, ptr %i
  %rcc.tmp.532 = load i32, ptr %i
  %rcc.tmp.533 = add i32 %rcc.tmp.532, 0
  %rcc.tmp.534 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.533
  store i32 10, ptr %rcc.tmp.534
  %rcc.tmp.536 = load i32, ptr %i
  %rcc.tmp.537 = add i32 %rcc.tmp.536, 1
  store i32 %rcc.tmp.537, ptr %i
  %rcc.tmp.539 = load i32, ptr %i
  %rcc.tmp.540 = add i32 %rcc.tmp.539, 0
  %rcc.tmp.541 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.540
  store i32 8, ptr %rcc.tmp.541
  %rcc.tmp.543 = load i32, ptr %i
  %rcc.tmp.544 = add i32 %rcc.tmp.543, 1
  store i32 %rcc.tmp.544, ptr %i
  %rcc.tmp.546 = load i32, ptr %i
  %rcc.tmp.547 = add i32 %rcc.tmp.546, 0
  %rcc.tmp.548 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.547
  store i32 12, ptr %rcc.tmp.548
  %rcc.tmp.550 = load i32, ptr %i
  %rcc.tmp.551 = add i32 %rcc.tmp.550, 1
  store i32 %rcc.tmp.551, ptr %i
  %rcc.tmp.553 = load i32, ptr %i
  %rcc.tmp.554 = add i32 %rcc.tmp.553, 0
  %rcc.tmp.555 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.554
  %rcc.tmp.556 = load i32, ptr %loop_start
  store i32 %rcc.tmp.556, ptr %rcc.tmp.555
  %rcc.tmp.558 = load i32, ptr %i
  %rcc.tmp.559 = add i32 %rcc.tmp.558, 1
  store i32 %rcc.tmp.559, ptr %i
  %rcc.tmp.561 = load i32, ptr %i
  %rcc.tmp.562 = add i32 %rcc.tmp.561, 0
  %rcc.tmp.563 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.562
  store i32 2, ptr %rcc.tmp.563
  %rcc.tmp.565 = load i32, ptr %i
  %rcc.tmp.566 = add i32 %rcc.tmp.565, 1
  store i32 %rcc.tmp.566, ptr %i
  %rcc.tmp.568 = load i32, ptr %i
  %rcc.tmp.569 = add i32 %rcc.tmp.568, 0
  %rcc.tmp.570 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.569
  store i32 2, ptr %rcc.tmp.570
  %rcc.tmp.572 = load i32, ptr %i
  %rcc.tmp.573 = add i32 %rcc.tmp.572, 1
  store i32 %rcc.tmp.573, ptr %i
  %rcc.tmp.575 = load i32, ptr %i
  %rcc.tmp.576 = add i32 %rcc.tmp.575, 0
  %rcc.tmp.577 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.576
  store i32 14, ptr %rcc.tmp.577
  %rcc.tmp.579 = load i32, ptr %i
  %rcc.tmp.580 = add i32 %rcc.tmp.579, 1
  store i32 %rcc.tmp.580, ptr %i
  %rcc.tmp.582 = load %VM*, ptr %vm..tmp
  %rcc.tmp.583 = getelementptr %VM, ptr %rcc.tmp.582, i32 0, i32 3
  %rcc.tmp.584 = bitcast [1024 x i32]* %rcc.tmp.583 to i8*
  %rcc.tmp.585 = bitcast [1024 x i32]* %prog to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.584, i8* %rcc.tmp.585, i32 4096, i1 0)
  ret void
}
define void @execute.(%VM* %vm.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %running = alloca i1 
  %op = alloca i32 
  %val = alloca i32 
  %b = alloca i32 
  %a = alloca i32 
  %b.2 = alloca i32 
  %a.2 = alloca i32 
  %b.3 = alloca i32 
  %a.3 = alloca i32 
  %b.4 = alloca i32 
  %a.4 = alloca i32 
  %b.5 = alloca i32 
  %a.5 = alloca i32 
  %b.6 = alloca i32 
  %a.6 = alloca i32 
  %b.7 = alloca i32 
  %a.7 = alloca i32 
  %addr = alloca i32 
  %addr.2 = alloca i32 
  %addr.3 = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  store i1 1, ptr %running
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i1, ptr %running
  br i1 %rcc.tmp.4, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.7 = load %VM*, ptr %vm..tmp
  %rcc.tmp.8 = call i32 @fetch.(%VM* %rcc.tmp.7)
  store i32 %rcc.tmp.8, ptr %op
  %rcc.tmp.10 = load i32, ptr %op
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  store i1 0, ptr %running
  br label %if.merge
if.else:
  %rcc.tmp.15 = load i32, ptr %op
  %rcc.tmp.16 = icmp eq i32 %rcc.tmp.15, 1
  br i1 %rcc.tmp.16, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.18 = load %VM*, ptr %vm..tmp
  %rcc.tmp.19 = call i32 @fetch.(%VM* %rcc.tmp.18)
  store i32 %rcc.tmp.19, ptr %val
  %rcc.tmp.21 = load %VM*, ptr %vm..tmp
  %rcc.tmp.22 = load i32, ptr %val
  call void @push.(%VM* %rcc.tmp.21, i32 %rcc.tmp.22)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.25 = load i32, ptr %op
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 2
  br i1 %rcc.tmp.26, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.28 = load %VM*, ptr %vm..tmp
  %rcc.tmp.29 = call i32 @pop.(%VM* %rcc.tmp.28)
  br label %if.merge.3
if.else.3:
  %rcc.tmp.31 = load i32, ptr %op
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 3
  br i1 %rcc.tmp.32, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.34 = load %VM*, ptr %vm..tmp
  %rcc.tmp.35 = call i32 @pop.(%VM* %rcc.tmp.34)
  store i32 %rcc.tmp.35, ptr %b
  %rcc.tmp.37 = load %VM*, ptr %vm..tmp
  %rcc.tmp.38 = call i32 @pop.(%VM* %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %a
  %rcc.tmp.40 = load %VM*, ptr %vm..tmp
  %rcc.tmp.41 = load i32, ptr %a
  %rcc.tmp.42 = load i32, ptr %b
  %rcc.tmp.43 = add i32 %rcc.tmp.41, %rcc.tmp.42
  call void @push.(%VM* %rcc.tmp.40, i32 %rcc.tmp.43)
  br label %if.merge.4
if.else.4:
  %rcc.tmp.46 = load i32, ptr %op
  %rcc.tmp.47 = icmp eq i32 %rcc.tmp.46, 4
  br i1 %rcc.tmp.47, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.49 = load %VM*, ptr %vm..tmp
  %rcc.tmp.50 = call i32 @pop.(%VM* %rcc.tmp.49)
  store i32 %rcc.tmp.50, ptr %b.2
  %rcc.tmp.52 = load %VM*, ptr %vm..tmp
  %rcc.tmp.53 = call i32 @pop.(%VM* %rcc.tmp.52)
  store i32 %rcc.tmp.53, ptr %a.2
  %rcc.tmp.55 = load %VM*, ptr %vm..tmp
  %rcc.tmp.56 = load i32, ptr %a.2
  %rcc.tmp.57 = load i32, ptr %b.2
  %rcc.tmp.58 = sub i32 %rcc.tmp.56, %rcc.tmp.57
  call void @push.(%VM* %rcc.tmp.55, i32 %rcc.tmp.58)
  br label %if.merge.5
if.else.5:
  %rcc.tmp.61 = load i32, ptr %op
  %rcc.tmp.62 = icmp eq i32 %rcc.tmp.61, 5
  br i1 %rcc.tmp.62, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.64 = load %VM*, ptr %vm..tmp
  %rcc.tmp.65 = call i32 @pop.(%VM* %rcc.tmp.64)
  store i32 %rcc.tmp.65, ptr %b.3
  %rcc.tmp.67 = load %VM*, ptr %vm..tmp
  %rcc.tmp.68 = call i32 @pop.(%VM* %rcc.tmp.67)
  store i32 %rcc.tmp.68, ptr %a.3
  %rcc.tmp.70 = load %VM*, ptr %vm..tmp
  %rcc.tmp.71 = load i32, ptr %a.3
  %rcc.tmp.72 = load i32, ptr %b.3
  %rcc.tmp.73 = mul i32 %rcc.tmp.71, %rcc.tmp.72
  call void @push.(%VM* %rcc.tmp.70, i32 %rcc.tmp.73)
  br label %if.merge.6
if.else.6:
  %rcc.tmp.76 = load i32, ptr %op
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.76, 6
  br i1 %rcc.tmp.77, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.79 = load %VM*, ptr %vm..tmp
  %rcc.tmp.80 = call i32 @pop.(%VM* %rcc.tmp.79)
  store i32 %rcc.tmp.80, ptr %b.4
  %rcc.tmp.82 = load %VM*, ptr %vm..tmp
  %rcc.tmp.83 = call i32 @pop.(%VM* %rcc.tmp.82)
  store i32 %rcc.tmp.83, ptr %a.4
  %rcc.tmp.85 = load i32, ptr %b.4
  %rcc.tmp.86 = icmp ne i32 %rcc.tmp.85, 0
  br i1 %rcc.tmp.86, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.88 = load %VM*, ptr %vm..tmp
  %rcc.tmp.89 = load i32, ptr %a.4
  %rcc.tmp.90 = load i32, ptr %b.4
  %rcc.tmp.91 = sdiv i32 %rcc.tmp.89, %rcc.tmp.90
  call void @push.(%VM* %rcc.tmp.88, i32 %rcc.tmp.91)
  br label %if.merge.8
if.else.8:
  %rcc.tmp.94 = sub i32 0, 1
  call void @printlnInt.(i32 %rcc.tmp.94)
  store i1 0, ptr %running
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.99 = load i32, ptr %op
  %rcc.tmp.100 = icmp eq i32 %rcc.tmp.99, 7
  br i1 %rcc.tmp.100, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.102 = load %VM*, ptr %vm..tmp
  %rcc.tmp.103 = call i32 @pop.(%VM* %rcc.tmp.102)
  store i32 %rcc.tmp.103, ptr %b.5
  %rcc.tmp.105 = load %VM*, ptr %vm..tmp
  %rcc.tmp.106 = call i32 @pop.(%VM* %rcc.tmp.105)
  store i32 %rcc.tmp.106, ptr %a.5
  %rcc.tmp.108 = load %VM*, ptr %vm..tmp
  %rcc.tmp.109 = load i32, ptr %a.5
  %rcc.tmp.110 = load i32, ptr %b.5
  %rcc.tmp.111 = icmp eq i32 %rcc.tmp.109, %rcc.tmp.110
  br i1 %rcc.tmp.111, label %if.then.10, label %if.else.10
if.then.10:
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.115 = phi i32 [1, %if.then.10], [0, %if.else.10]
  call void @push.(%VM* %rcc.tmp.108, i32 %rcc.tmp.115)
  br label %if.merge.9
if.else.9:
  %rcc.tmp.118 = load i32, ptr %op
  %rcc.tmp.119 = icmp eq i32 %rcc.tmp.118, 8
  br i1 %rcc.tmp.119, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.121 = load %VM*, ptr %vm..tmp
  %rcc.tmp.122 = call i32 @pop.(%VM* %rcc.tmp.121)
  store i32 %rcc.tmp.122, ptr %b.6
  %rcc.tmp.124 = load %VM*, ptr %vm..tmp
  %rcc.tmp.125 = call i32 @pop.(%VM* %rcc.tmp.124)
  store i32 %rcc.tmp.125, ptr %a.6
  %rcc.tmp.127 = load %VM*, ptr %vm..tmp
  %rcc.tmp.128 = load i32, ptr %a.6
  %rcc.tmp.129 = load i32, ptr %b.6
  %rcc.tmp.130 = icmp slt i32 %rcc.tmp.128, %rcc.tmp.129
  br i1 %rcc.tmp.130, label %if.then.12, label %if.else.12
if.then.12:
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.134 = phi i32 [1, %if.then.12], [0, %if.else.12]
  call void @push.(%VM* %rcc.tmp.127, i32 %rcc.tmp.134)
  br label %if.merge.11
if.else.11:
  %rcc.tmp.137 = load i32, ptr %op
  %rcc.tmp.138 = icmp eq i32 %rcc.tmp.137, 9
  br i1 %rcc.tmp.138, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.140 = load %VM*, ptr %vm..tmp
  %rcc.tmp.141 = call i32 @pop.(%VM* %rcc.tmp.140)
  store i32 %rcc.tmp.141, ptr %b.7
  %rcc.tmp.143 = load %VM*, ptr %vm..tmp
  %rcc.tmp.144 = call i32 @pop.(%VM* %rcc.tmp.143)
  store i32 %rcc.tmp.144, ptr %a.7
  %rcc.tmp.146 = load %VM*, ptr %vm..tmp
  %rcc.tmp.147 = load i32, ptr %a.7
  %rcc.tmp.148 = load i32, ptr %b.7
  %rcc.tmp.149 = icmp sgt i32 %rcc.tmp.147, %rcc.tmp.148
  br i1 %rcc.tmp.149, label %if.then.14, label %if.else.14
if.then.14:
  br label %if.merge.14
if.else.14:
  br label %if.merge.14
if.merge.14:
  %rcc.tmp.153 = phi i32 [1, %if.then.14], [0, %if.else.14]
  call void @push.(%VM* %rcc.tmp.146, i32 %rcc.tmp.153)
  br label %if.merge.13
if.else.13:
  %rcc.tmp.156 = load i32, ptr %op
  %rcc.tmp.157 = icmp eq i32 %rcc.tmp.156, 10
  br i1 %rcc.tmp.157, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.159 = load %VM*, ptr %vm..tmp
  %rcc.tmp.160 = getelementptr %VM, ptr %rcc.tmp.159, i32 0, i32 0
  %rcc.tmp.161 = load %VM*, ptr %vm..tmp
  %rcc.tmp.162 = call i32 @fetch.(%VM* %rcc.tmp.161)
  store i32 %rcc.tmp.162, ptr %rcc.tmp.160
  br label %if.merge.15
if.else.15:
  %rcc.tmp.165 = load i32, ptr %op
  %rcc.tmp.166 = icmp eq i32 %rcc.tmp.165, 11
  br i1 %rcc.tmp.166, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.168 = load %VM*, ptr %vm..tmp
  %rcc.tmp.169 = call i32 @fetch.(%VM* %rcc.tmp.168)
  store i32 %rcc.tmp.169, ptr %addr
  %rcc.tmp.171 = load %VM*, ptr %vm..tmp
  %rcc.tmp.172 = call i32 @pop.(%VM* %rcc.tmp.171)
  %rcc.tmp.173 = icmp eq i32 %rcc.tmp.172, 0
  br i1 %rcc.tmp.173, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.175 = load %VM*, ptr %vm..tmp
  %rcc.tmp.176 = getelementptr %VM, ptr %rcc.tmp.175, i32 0, i32 0
  %rcc.tmp.177 = load i32, ptr %addr
  store i32 %rcc.tmp.177, ptr %rcc.tmp.176
  br label %if.merge.17
if.else.17:
  br label %if.merge.17
if.merge.17:
  br label %if.merge.16
if.else.16:
  %rcc.tmp.182 = load i32, ptr %op
  %rcc.tmp.183 = icmp eq i32 %rcc.tmp.182, 12
  br i1 %rcc.tmp.183, label %if.then.18, label %if.else.18
if.then.18:
  %rcc.tmp.185 = load %VM*, ptr %vm..tmp
  %rcc.tmp.186 = call i32 @fetch.(%VM* %rcc.tmp.185)
  store i32 %rcc.tmp.186, ptr %addr.2
  %rcc.tmp.188 = load %VM*, ptr %vm..tmp
  %rcc.tmp.189 = call i32 @pop.(%VM* %rcc.tmp.188)
  %rcc.tmp.190 = icmp ne i32 %rcc.tmp.189, 0
  br i1 %rcc.tmp.190, label %if.then.19, label %if.else.19
if.then.19:
  %rcc.tmp.192 = load %VM*, ptr %vm..tmp
  %rcc.tmp.193 = getelementptr %VM, ptr %rcc.tmp.192, i32 0, i32 0
  %rcc.tmp.194 = load i32, ptr %addr.2
  store i32 %rcc.tmp.194, ptr %rcc.tmp.193
  br label %if.merge.19
if.else.19:
  br label %if.merge.19
if.merge.19:
  br label %if.merge.18
if.else.18:
  %rcc.tmp.199 = load i32, ptr %op
  %rcc.tmp.200 = icmp eq i32 %rcc.tmp.199, 13
  br i1 %rcc.tmp.200, label %if.then.20, label %if.else.20
if.then.20:
  %rcc.tmp.202 = load %VM*, ptr %vm..tmp
  %rcc.tmp.203 = call i32 @fetch.(%VM* %rcc.tmp.202)
  store i32 %rcc.tmp.203, ptr %addr.3
  %rcc.tmp.205 = load %VM*, ptr %vm..tmp
  %rcc.tmp.206 = load %VM*, ptr %vm..tmp
  %rcc.tmp.207 = getelementptr %VM, ptr %rcc.tmp.206, i32 0, i32 0
  %rcc.tmp.208 = load i32, ptr %rcc.tmp.207
  call void @push.(%VM* %rcc.tmp.205, i32 %rcc.tmp.208)
  %rcc.tmp.210 = load %VM*, ptr %vm..tmp
  %rcc.tmp.211 = getelementptr %VM, ptr %rcc.tmp.210, i32 0, i32 0
  %rcc.tmp.212 = load i32, ptr %addr.3
  store i32 %rcc.tmp.212, ptr %rcc.tmp.211
  br label %if.merge.20
if.else.20:
  %rcc.tmp.215 = load i32, ptr %op
  %rcc.tmp.216 = icmp eq i32 %rcc.tmp.215, 14
  br i1 %rcc.tmp.216, label %if.then.21, label %if.else.21
if.then.21:
  %rcc.tmp.218 = load %VM*, ptr %vm..tmp
  %rcc.tmp.219 = getelementptr %VM, ptr %rcc.tmp.218, i32 0, i32 0
  %rcc.tmp.220 = load %VM*, ptr %vm..tmp
  %rcc.tmp.221 = call i32 @pop.(%VM* %rcc.tmp.220)
  store i32 %rcc.tmp.221, ptr %rcc.tmp.219
  br label %if.merge.21
if.else.21:
  %rcc.tmp.224 = load i32, ptr %op
  %rcc.tmp.225 = icmp eq i32 %rcc.tmp.224, 15
  br i1 %rcc.tmp.225, label %if.then.22, label %if.else.22
if.then.22:
  %rcc.tmp.227 = load %VM*, ptr %vm..tmp
  %rcc.tmp.228 = getelementptr %VM, ptr %rcc.tmp.227, i32 0, i32 2
  %rcc.tmp.229 = load %VM*, ptr %vm..tmp
  %rcc.tmp.230 = getelementptr %VM, ptr %rcc.tmp.229, i32 0, i32 1
  %rcc.tmp.231 = load i32, ptr %rcc.tmp.230
  %rcc.tmp.232 = add i32 %rcc.tmp.231, 0
  %rcc.tmp.233 = getelementptr [256 x i32], ptr %rcc.tmp.228, i32 0, i32 %rcc.tmp.232
  %rcc.tmp.234 = load i32, ptr %rcc.tmp.233
  call void @printlnInt.(i32 %rcc.tmp.234)
  br label %if.merge.22
if.else.22:
  %rcc.tmp.237 = sub i32 0, 2
  call void @printlnInt.(i32 %rcc.tmp.237)
  store i1 0, ptr %running
  br label %if.merge.22
if.merge.22:
  br label %if.merge.21
if.merge.21:
  br label %if.merge.20
if.merge.20:
  br label %if.merge.18
if.merge.18:
  br label %if.merge.16
if.merge.16:
  br label %if.merge.15
if.merge.15:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.11
if.merge.11:
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
  br label %while.cond
while.end:
  ret void
}
define i32 @fetch.(%VM* %vm.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %instruction = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  %rcc.tmp.2 = load %VM*, ptr %vm..tmp
  %rcc.tmp.3 = getelementptr %VM, ptr %rcc.tmp.2, i32 0, i32 3
  %rcc.tmp.4 = load %VM*, ptr %vm..tmp
  %rcc.tmp.5 = getelementptr %VM, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = getelementptr [1024 x i32], ptr %rcc.tmp.3, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %instruction
  %rcc.tmp.11 = load %VM*, ptr %vm..tmp
  %rcc.tmp.12 = getelementptr %VM, ptr %rcc.tmp.11, i32 0, i32 0
  %rcc.tmp.13 = load %VM*, ptr %vm..tmp
  %rcc.tmp.14 = getelementptr %VM, ptr %rcc.tmp.13, i32 0, i32 0
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %rcc.tmp.12
  %rcc.tmp.18 = load i32, ptr %instruction
  ret i32 %rcc.tmp.18
}
define void @push.(%VM* %vm.tmp, i32 %val.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %val..tmp = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  store i32 %val.tmp, ptr %val..tmp
  %rcc.tmp.3 = load %VM*, ptr %vm..tmp
  %rcc.tmp.4 = getelementptr %VM, ptr %rcc.tmp.3, i32 0, i32 1
  %rcc.tmp.5 = load %VM*, ptr %vm..tmp
  %rcc.tmp.6 = getelementptr %VM, ptr %rcc.tmp.5, i32 0, i32 1
  %rcc.tmp.7 = load i32, ptr %rcc.tmp.6
  %rcc.tmp.8 = add i32 %rcc.tmp.7, 1
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 256
  store i32 %rcc.tmp.9, ptr %rcc.tmp.4
  %rcc.tmp.11 = load %VM*, ptr %vm..tmp
  %rcc.tmp.12 = getelementptr %VM, ptr %rcc.tmp.11, i32 0, i32 2
  %rcc.tmp.13 = load %VM*, ptr %vm..tmp
  %rcc.tmp.14 = getelementptr %VM, ptr %rcc.tmp.13, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [256 x i32], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.18 = load i32, ptr %val..tmp
  store i32 %rcc.tmp.18, ptr %rcc.tmp.17
  ret void
}
define i32 @pop.(%VM* %vm.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %val = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  %rcc.tmp.2 = load %VM*, ptr %vm..tmp
  %rcc.tmp.3 = getelementptr %VM, ptr %rcc.tmp.2, i32 0, i32 2
  %rcc.tmp.4 = load %VM*, ptr %vm..tmp
  %rcc.tmp.5 = getelementptr %VM, ptr %rcc.tmp.4, i32 0, i32 1
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = getelementptr [256 x i32], ptr %rcc.tmp.3, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %val
  %rcc.tmp.11 = load %VM*, ptr %vm..tmp
  %rcc.tmp.12 = getelementptr %VM, ptr %rcc.tmp.11, i32 0, i32 1
  %rcc.tmp.13 = load %VM*, ptr %vm..tmp
  %rcc.tmp.14 = getelementptr %VM, ptr %rcc.tmp.13, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = sub i32 %rcc.tmp.15, 1
  store i32 %rcc.tmp.16, ptr %rcc.tmp.12
  %rcc.tmp.18 = load %VM*, ptr %vm..tmp
  %rcc.tmp.19 = getelementptr %VM, ptr %rcc.tmp.18, i32 0, i32 1
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.20, 0
  br i1 %rcc.tmp.21, label %if.then, label %if.else
if.then:
  %rcc.tmp.23 = load %VM*, ptr %vm..tmp
  %rcc.tmp.24 = getelementptr %VM, ptr %rcc.tmp.23, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 256
  store i32 %rcc.tmp.26, ptr %rcc.tmp.24
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.30 = load i32, ptr %val
  ret i32 %rcc.tmp.30
}
define void @deep_recursive_test.(%VM* %vm.tmp, i32 %depth.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %depth..tmp = alloca i32 
  %val = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  store i32 %depth.tmp, ptr %depth..tmp
  %rcc.tmp.3 = load i32, ptr %depth..tmp
  %rcc.tmp.4 = icmp sle i32 %rcc.tmp.3, 0
  br i1 %rcc.tmp.4, label %if.then, label %if.else
if.then:
  ret void
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.8 = load %VM*, ptr %vm..tmp
  %rcc.tmp.9 = load i32, ptr %depth..tmp
  call void @push.(%VM* %rcc.tmp.8, i32 %rcc.tmp.9)
  %rcc.tmp.11 = load %VM*, ptr %vm..tmp
  %rcc.tmp.12 = load i32, ptr %depth..tmp
  %rcc.tmp.13 = sub i32 %rcc.tmp.12, 1
  call void @deep_recursive_test.(%VM* %rcc.tmp.11, i32 %rcc.tmp.13)
  %rcc.tmp.15 = load %VM*, ptr %vm..tmp
  %rcc.tmp.16 = call i32 @pop.(%VM* %rcc.tmp.15)
  store i32 %rcc.tmp.16, ptr %val
  %rcc.tmp.18 = load %VM*, ptr %vm..tmp
  %rcc.tmp.19 = load i32, ptr %val
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  call void @push.(%VM* %rcc.tmp.18, i32 %rcc.tmp.20)
  ret void
}
define void @complex_stack_manipulation.(%VM* %vm.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %i = alloca i32 
  %a = alloca i32 
  %b = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 20
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %VM*, ptr %vm..tmp
  %rcc.tmp.9 = load i32, ptr %i
  call void @push.(%VM* %rcc.tmp.8, i32 %rcc.tmp.9)
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = add i32 %rcc.tmp.11, 1
  store i32 %rcc.tmp.12, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 10
  br i1 %rcc.tmp.18, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.21 = load %VM*, ptr %vm..tmp
  %rcc.tmp.22 = call i32 @pop.(%VM* %rcc.tmp.21)
  store i32 %rcc.tmp.22, ptr %a
  %rcc.tmp.24 = load %VM*, ptr %vm..tmp
  %rcc.tmp.25 = call i32 @pop.(%VM* %rcc.tmp.24)
  store i32 %rcc.tmp.25, ptr %b
  %rcc.tmp.27 = load %VM*, ptr %vm..tmp
  %rcc.tmp.28 = load i32, ptr %a
  %rcc.tmp.29 = load i32, ptr %b
  %rcc.tmp.30 = add i32 %rcc.tmp.28, %rcc.tmp.29
  call void @push.(%VM* %rcc.tmp.27, i32 %rcc.tmp.30)
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 1
  store i32 %rcc.tmp.33, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.36 = load %VM*, ptr %vm..tmp
  %rcc.tmp.37 = call i32 @pop.(%VM* %rcc.tmp.36)
  call void @printlnInt.(i32 %rcc.tmp.37)
  ret void
}
define void @run_fibonacci_in_vm.(%VM* %vm.tmp, i32 %n.tmp) {
entry:
  %vm..tmp = alloca %VM* 
  %n..tmp = alloca i32 
  %prog = alloca [1024 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %fib_start = alloca i32 
  %old_prog = alloca [1024 x i32] 
  %old_pc = alloca i32 
  %old_sp = alloca i32 
  store %VM* %vm.tmp, ptr %vm..tmp
  store i32 %n.tmp, ptr %n..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.5 = load i32, ptr %fill.idx
  %rcc.tmp.6 = icmp slt i32 %rcc.tmp.5, 1024
  br i1 %rcc.tmp.6, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.8 = load i32, ptr %fill.idx
  %rcc.tmp.9 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.8
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = add i32 %rcc.tmp.8, 1
  store i32 %rcc.tmp.11, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.16
  store i32 1, ptr %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %i
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.20, ptr %i
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 0
  %rcc.tmp.24 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = load i32, ptr %i
  %rcc.tmp.28 = add i32 %rcc.tmp.27, 1
  store i32 %rcc.tmp.28, ptr %i
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.31
  store i32 13, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  %rcc.tmp.37 = load i32, ptr %i
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.38
  store i32 10, ptr %rcc.tmp.39
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.45
  store i32 15, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  %rcc.tmp.51 = load i32, ptr %i
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 0
  %rcc.tmp.53 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.52
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  store i32 10, ptr %i
  %rcc.tmp.59 = load i32, ptr %i
  store i32 %rcc.tmp.59, ptr %fib_start
  %rcc.tmp.61 = load i32, ptr %i
  %rcc.tmp.62 = add i32 %rcc.tmp.61, 0
  %rcc.tmp.63 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.62
  store i32 1, ptr %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %i
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 1
  store i32 %rcc.tmp.66, ptr %i
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.71 = load %VM*, ptr %vm..tmp
  %rcc.tmp.72 = getelementptr %VM, ptr %rcc.tmp.71, i32 0, i32 2
  %rcc.tmp.73 = load %VM*, ptr %vm..tmp
  %rcc.tmp.74 = getelementptr %VM, ptr %rcc.tmp.73, i32 0, i32 1
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 0
  %rcc.tmp.77 = getelementptr [256 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.76
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.78, ptr %rcc.tmp.70
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = add i32 %rcc.tmp.80, 1
  store i32 %rcc.tmp.81, ptr %i
  %rcc.tmp.83 = load i32, ptr %i
  %rcc.tmp.84 = add i32 %rcc.tmp.83, 0
  %rcc.tmp.85 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.84
  store i32 1, ptr %rcc.tmp.85
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %i
  %rcc.tmp.90 = load i32, ptr %i
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.91
  store i32 2, ptr %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %i
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 1
  store i32 %rcc.tmp.95, ptr %i
  %rcc.tmp.97 = load i32, ptr %i
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.98
  store i32 8, ptr %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %i
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 1
  store i32 %rcc.tmp.102, ptr %i
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.105
  store i32 11, ptr %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %i
  %rcc.tmp.109 = add i32 %rcc.tmp.108, 1
  store i32 %rcc.tmp.109, ptr %i
  %rcc.tmp.111 = load i32, ptr %i
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 0
  %rcc.tmp.113 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.112
  %rcc.tmp.114 = load i32, ptr %fib_start
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 20
  store i32 %rcc.tmp.115, ptr %rcc.tmp.113
  %rcc.tmp.117 = load i32, ptr %i
  %rcc.tmp.118 = add i32 %rcc.tmp.117, 1
  store i32 %rcc.tmp.118, ptr %i
  %rcc.tmp.120 = load i32, ptr %i
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.121
  store i32 1, ptr %rcc.tmp.122
  %rcc.tmp.124 = load i32, ptr %i
  %rcc.tmp.125 = add i32 %rcc.tmp.124, 1
  store i32 %rcc.tmp.125, ptr %i
  %rcc.tmp.127 = load i32, ptr %i
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.128
  %rcc.tmp.130 = load %VM*, ptr %vm..tmp
  %rcc.tmp.131 = getelementptr %VM, ptr %rcc.tmp.130, i32 0, i32 2
  %rcc.tmp.132 = load %VM*, ptr %vm..tmp
  %rcc.tmp.133 = getelementptr %VM, ptr %rcc.tmp.132, i32 0, i32 1
  %rcc.tmp.134 = load i32, ptr %rcc.tmp.133
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = getelementptr [256 x i32], ptr %rcc.tmp.131, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.136
  store i32 %rcc.tmp.137, ptr %rcc.tmp.129
  %rcc.tmp.139 = load i32, ptr %i
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 1
  store i32 %rcc.tmp.140, ptr %i
  %rcc.tmp.142 = load i32, ptr %i
  %rcc.tmp.143 = add i32 %rcc.tmp.142, 0
  %rcc.tmp.144 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.143
  store i32 1, ptr %rcc.tmp.144
  %rcc.tmp.146 = load i32, ptr %i
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %i
  %rcc.tmp.149 = load i32, ptr %i
  %rcc.tmp.150 = add i32 %rcc.tmp.149, 0
  %rcc.tmp.151 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.150
  store i32 1, ptr %rcc.tmp.151
  %rcc.tmp.153 = load i32, ptr %i
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 1
  store i32 %rcc.tmp.154, ptr %i
  %rcc.tmp.156 = load i32, ptr %i
  %rcc.tmp.157 = add i32 %rcc.tmp.156, 0
  %rcc.tmp.158 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.157
  store i32 4, ptr %rcc.tmp.158
  %rcc.tmp.160 = load i32, ptr %i
  %rcc.tmp.161 = add i32 %rcc.tmp.160, 1
  store i32 %rcc.tmp.161, ptr %i
  %rcc.tmp.163 = load i32, ptr %i
  %rcc.tmp.164 = add i32 %rcc.tmp.163, 0
  %rcc.tmp.165 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.164
  store i32 13, ptr %rcc.tmp.165
  %rcc.tmp.167 = load i32, ptr %i
  %rcc.tmp.168 = add i32 %rcc.tmp.167, 1
  store i32 %rcc.tmp.168, ptr %i
  %rcc.tmp.170 = load i32, ptr %i
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 0
  %rcc.tmp.172 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.171
  %rcc.tmp.173 = load i32, ptr %fib_start
  store i32 %rcc.tmp.173, ptr %rcc.tmp.172
  %rcc.tmp.175 = load i32, ptr %i
  %rcc.tmp.176 = add i32 %rcc.tmp.175, 1
  store i32 %rcc.tmp.176, ptr %i
  %rcc.tmp.178 = load i32, ptr %i
  %rcc.tmp.179 = add i32 %rcc.tmp.178, 0
  %rcc.tmp.180 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.179
  store i32 1, ptr %rcc.tmp.180
  %rcc.tmp.182 = load i32, ptr %i
  %rcc.tmp.183 = add i32 %rcc.tmp.182, 1
  store i32 %rcc.tmp.183, ptr %i
  %rcc.tmp.185 = load i32, ptr %i
  %rcc.tmp.186 = add i32 %rcc.tmp.185, 0
  %rcc.tmp.187 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.186
  %rcc.tmp.188 = load %VM*, ptr %vm..tmp
  %rcc.tmp.189 = getelementptr %VM, ptr %rcc.tmp.188, i32 0, i32 2
  %rcc.tmp.190 = load %VM*, ptr %vm..tmp
  %rcc.tmp.191 = getelementptr %VM, ptr %rcc.tmp.190, i32 0, i32 1
  %rcc.tmp.192 = load i32, ptr %rcc.tmp.191
  %rcc.tmp.193 = add i32 %rcc.tmp.192, 1
  %rcc.tmp.194 = add i32 %rcc.tmp.193, 0
  %rcc.tmp.195 = getelementptr [256 x i32], ptr %rcc.tmp.189, i32 0, i32 %rcc.tmp.194
  %rcc.tmp.196 = load i32, ptr %rcc.tmp.195
  store i32 %rcc.tmp.196, ptr %rcc.tmp.187
  %rcc.tmp.198 = load i32, ptr %i
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 1
  store i32 %rcc.tmp.199, ptr %i
  %rcc.tmp.201 = load i32, ptr %i
  %rcc.tmp.202 = add i32 %rcc.tmp.201, 0
  %rcc.tmp.203 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.202
  store i32 1, ptr %rcc.tmp.203
  %rcc.tmp.205 = load i32, ptr %i
  %rcc.tmp.206 = add i32 %rcc.tmp.205, 1
  store i32 %rcc.tmp.206, ptr %i
  %rcc.tmp.208 = load i32, ptr %i
  %rcc.tmp.209 = add i32 %rcc.tmp.208, 0
  %rcc.tmp.210 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.209
  store i32 2, ptr %rcc.tmp.210
  %rcc.tmp.212 = load i32, ptr %i
  %rcc.tmp.213 = add i32 %rcc.tmp.212, 1
  store i32 %rcc.tmp.213, ptr %i
  %rcc.tmp.215 = load i32, ptr %i
  %rcc.tmp.216 = add i32 %rcc.tmp.215, 0
  %rcc.tmp.217 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.216
  store i32 4, ptr %rcc.tmp.217
  %rcc.tmp.219 = load i32, ptr %i
  %rcc.tmp.220 = add i32 %rcc.tmp.219, 1
  store i32 %rcc.tmp.220, ptr %i
  %rcc.tmp.222 = load i32, ptr %i
  %rcc.tmp.223 = add i32 %rcc.tmp.222, 0
  %rcc.tmp.224 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.223
  store i32 13, ptr %rcc.tmp.224
  %rcc.tmp.226 = load i32, ptr %i
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 1
  store i32 %rcc.tmp.227, ptr %i
  %rcc.tmp.229 = load i32, ptr %i
  %rcc.tmp.230 = add i32 %rcc.tmp.229, 0
  %rcc.tmp.231 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.230
  %rcc.tmp.232 = load i32, ptr %fib_start
  store i32 %rcc.tmp.232, ptr %rcc.tmp.231
  %rcc.tmp.234 = load i32, ptr %i
  %rcc.tmp.235 = add i32 %rcc.tmp.234, 1
  store i32 %rcc.tmp.235, ptr %i
  %rcc.tmp.237 = load i32, ptr %i
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.238
  store i32 3, ptr %rcc.tmp.239
  %rcc.tmp.241 = load i32, ptr %i
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 1
  store i32 %rcc.tmp.242, ptr %i
  %rcc.tmp.244 = load i32, ptr %i
  %rcc.tmp.245 = add i32 %rcc.tmp.244, 0
  %rcc.tmp.246 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.245
  store i32 14, ptr %rcc.tmp.246
  %rcc.tmp.248 = load i32, ptr %i
  %rcc.tmp.249 = add i32 %rcc.tmp.248, 1
  store i32 %rcc.tmp.249, ptr %i
  %rcc.tmp.251 = load i32, ptr %fib_start
  %rcc.tmp.252 = add i32 %rcc.tmp.251, 20
  store i32 %rcc.tmp.252, ptr %i
  %rcc.tmp.254 = load i32, ptr %i
  %rcc.tmp.255 = add i32 %rcc.tmp.254, 0
  %rcc.tmp.256 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.255
  store i32 2, ptr %rcc.tmp.256
  %rcc.tmp.258 = load i32, ptr %i
  %rcc.tmp.259 = add i32 %rcc.tmp.258, 1
  store i32 %rcc.tmp.259, ptr %i
  %rcc.tmp.261 = load i32, ptr %i
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 0
  %rcc.tmp.263 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.262
  store i32 1, ptr %rcc.tmp.263
  %rcc.tmp.265 = load i32, ptr %i
  %rcc.tmp.266 = add i32 %rcc.tmp.265, 1
  store i32 %rcc.tmp.266, ptr %i
  %rcc.tmp.268 = load i32, ptr %i
  %rcc.tmp.269 = add i32 %rcc.tmp.268, 0
  %rcc.tmp.270 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.269
  %rcc.tmp.271 = load %VM*, ptr %vm..tmp
  %rcc.tmp.272 = getelementptr %VM, ptr %rcc.tmp.271, i32 0, i32 2
  %rcc.tmp.273 = load %VM*, ptr %vm..tmp
  %rcc.tmp.274 = getelementptr %VM, ptr %rcc.tmp.273, i32 0, i32 1
  %rcc.tmp.275 = load i32, ptr %rcc.tmp.274
  %rcc.tmp.276 = add i32 %rcc.tmp.275, 0
  %rcc.tmp.277 = getelementptr [256 x i32], ptr %rcc.tmp.272, i32 0, i32 %rcc.tmp.276
  %rcc.tmp.278 = load i32, ptr %rcc.tmp.277
  store i32 %rcc.tmp.278, ptr %rcc.tmp.270
  %rcc.tmp.280 = load i32, ptr %i
  %rcc.tmp.281 = add i32 %rcc.tmp.280, 1
  store i32 %rcc.tmp.281, ptr %i
  %rcc.tmp.283 = load i32, ptr %i
  %rcc.tmp.284 = add i32 %rcc.tmp.283, 0
  %rcc.tmp.285 = getelementptr [1024 x i32], ptr %prog, i32 0, i32 %rcc.tmp.284
  store i32 14, ptr %rcc.tmp.285
  %rcc.tmp.287 = load i32, ptr %i
  %rcc.tmp.288 = add i32 %rcc.tmp.287, 1
  store i32 %rcc.tmp.288, ptr %i
  %rcc.tmp.290 = load %VM*, ptr %vm..tmp
  %rcc.tmp.291 = getelementptr %VM, ptr %rcc.tmp.290, i32 0, i32 3
  %rcc.tmp.292 = bitcast [1024 x i32]* %old_prog to i8*
  %rcc.tmp.293 = bitcast [1024 x i32]* %rcc.tmp.291 to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.292, i8* %rcc.tmp.293, i32 4096, i1 0)
  %rcc.tmp.295 = load %VM*, ptr %vm..tmp
  %rcc.tmp.296 = getelementptr %VM, ptr %rcc.tmp.295, i32 0, i32 0
  %rcc.tmp.297 = load i32, ptr %rcc.tmp.296
  store i32 %rcc.tmp.297, ptr %old_pc
  %rcc.tmp.299 = load %VM*, ptr %vm..tmp
  %rcc.tmp.300 = getelementptr %VM, ptr %rcc.tmp.299, i32 0, i32 1
  %rcc.tmp.301 = load i32, ptr %rcc.tmp.300
  store i32 %rcc.tmp.301, ptr %old_sp
  %rcc.tmp.303 = load %VM*, ptr %vm..tmp
  %rcc.tmp.304 = getelementptr %VM, ptr %rcc.tmp.303, i32 0, i32 3
  %rcc.tmp.305 = bitcast [1024 x i32]* %rcc.tmp.304 to i8*
  %rcc.tmp.306 = bitcast [1024 x i32]* %prog to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.305, i8* %rcc.tmp.306, i32 4096, i1 0)
  %rcc.tmp.308 = load %VM*, ptr %vm..tmp
  %rcc.tmp.309 = getelementptr %VM, ptr %rcc.tmp.308, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.309
  %rcc.tmp.311 = load %VM*, ptr %vm..tmp
  %rcc.tmp.312 = getelementptr %VM, ptr %rcc.tmp.311, i32 0, i32 1
  %rcc.tmp.313 = sub i32 256, 1
  store i32 %rcc.tmp.313, ptr %rcc.tmp.312
  %rcc.tmp.315 = load %VM*, ptr %vm..tmp
  call void @execute.(%VM* %rcc.tmp.315)
  %rcc.tmp.317 = load %VM*, ptr %vm..tmp
  %rcc.tmp.318 = getelementptr %VM, ptr %rcc.tmp.317, i32 0, i32 3
  %rcc.tmp.319 = bitcast [1024 x i32]* %rcc.tmp.318 to i8*
  %rcc.tmp.320 = bitcast [1024 x i32]* %old_prog to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.319, i8* %rcc.tmp.320, i32 4096, i1 0)
  %rcc.tmp.322 = load %VM*, ptr %vm..tmp
  %rcc.tmp.323 = getelementptr %VM, ptr %rcc.tmp.322, i32 0, i32 0
  %rcc.tmp.324 = load i32, ptr %old_pc
  store i32 %rcc.tmp.324, ptr %rcc.tmp.323
  %rcc.tmp.326 = load %VM*, ptr %vm..tmp
  %rcc.tmp.327 = getelementptr %VM, ptr %rcc.tmp.326, i32 0, i32 1
  %rcc.tmp.328 = load i32, ptr %old_sp
  store i32 %rcc.tmp.328, ptr %rcc.tmp.327
  ret void
}
define void @error_case_test.(%VM* %vm.tmp) {
entry:
  %vm..local = alloca %VM 
  %local_vm = alloca %VM 
  %val = alloca i32 
  %rcc.tmp.1 = bitcast %VM* %vm..local to i8*
  %rcc.tmp.2 = bitcast %VM* %vm.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.1, i8* %rcc.tmp.2, i32 5128, i1 0)
  %rcc.tmp.4 = bitcast %VM* %local_vm to i8*
  %rcc.tmp.5 = bitcast %VM* %vm..local to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.4, i8* %rcc.tmp.5, i32 5128, i1 0)
  %rcc.tmp.7 = getelementptr %VM, ptr %local_vm, i32 0, i32 1
  %rcc.tmp.8 = getelementptr %VM, ptr %local_vm, i32 0, i32 1
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 10
  store i32 %rcc.tmp.10, ptr %rcc.tmp.7
  %rcc.tmp.12 = getelementptr %VM, ptr %local_vm, i32 0, i32 1
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = icmp sgt i32 %rcc.tmp.13, 256
  br i1 %rcc.tmp.14, label %if.then, label %if.else
if.then:
  %rcc.tmp.16 = sub i32 0, 100
  call void @printlnInt.(i32 %rcc.tmp.16)
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.20 = getelementptr %VM, ptr %local_vm, i32 0, i32 1
  %rcc.tmp.21 = sub i32 256, 10
  store i32 %rcc.tmp.21, ptr %rcc.tmp.20
  %rcc.tmp.23 = call i32 @pop.(%VM* %local_vm)
  store i32 %rcc.tmp.23, ptr %val
  %rcc.tmp.25 = load i32, ptr %val
  call void @printlnInt.(i32 %rcc.tmp.25)
  ret void
}
define void @another_test_scenario.() {
entry:
  %vm = alloca %VM 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %rcc.tmp.1 = getelementptr %VM, ptr %vm, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr %VM, ptr %vm, i32 0, i32 1
  %rcc.tmp.4 = sub i32 256, 1
  store i32 %rcc.tmp.4, ptr %rcc.tmp.3
  %rcc.tmp.6 = getelementptr %VM, ptr %vm, i32 0, i32 2
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = icmp slt i32 %rcc.tmp.9, 256
  br i1 %rcc.tmp.10, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.12 = load i32, ptr %fill.idx
  %rcc.tmp.13 = getelementptr [256 x i32], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.12
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = add i32 %rcc.tmp.12, 1
  store i32 %rcc.tmp.15, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.18 = getelementptr %VM, ptr %vm, i32 0, i32 3
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.21 = load i32, ptr %fill.idx.2
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 1024
  br i1 %rcc.tmp.22, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.24 = load i32, ptr %fill.idx.2
  %rcc.tmp.25 = getelementptr [1024 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.27, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  call void @run_fibonacci_in_vm.(%VM* %vm, i32 15)
  call void @complex_stack_manipulation.(%VM* %vm)
  call void @deep_recursive_test.(%VM* %vm, i32 30)
  call void @error_case_test.(%VM* %vm)
  ret void
}
