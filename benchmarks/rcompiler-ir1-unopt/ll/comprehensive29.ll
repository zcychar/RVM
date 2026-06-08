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
define void @init_vm.([16 x i32]* %registers.tmp, [2048 x i32]* %memory.tmp, [256 x i32]* %stack.tmp, i32* %pc.tmp, i32* %sp.tmp, i1* %zf.tmp, i1* %cf.tmp, i1* %halt.tmp) {
entry:
  %registers..tmp = alloca [16 x i32]* 
  %memory..tmp = alloca [2048 x i32]* 
  %stack..tmp = alloca [256 x i32]* 
  %pc..tmp = alloca i32* 
  %sp..tmp = alloca i32* 
  %zf..tmp = alloca i1* 
  %cf..tmp = alloca i1* 
  %halt..tmp = alloca i1* 
  %i = alloca i32 
  store [16 x i32]* %registers.tmp, ptr %registers..tmp
  store [2048 x i32]* %memory.tmp, ptr %memory..tmp
  store [256 x i32]* %stack.tmp, ptr %stack..tmp
  store i32* %pc.tmp, ptr %pc..tmp
  store i32* %sp.tmp, ptr %sp..tmp
  store i1* %zf.tmp, ptr %zf..tmp
  store i1* %cf.tmp, ptr %cf..tmp
  store i1* %halt.tmp, ptr %halt..tmp
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
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 1
  store i32 %rcc.tmp.21, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 2048
  br i1 %rcc.tmp.27, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.33 = getelementptr [2048 x i32], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 1
  store i32 %rcc.tmp.36, ptr %i
  br label %while.cond.2
while.end.2:
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 256
  br i1 %rcc.tmp.42, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = add i32 %rcc.tmp.45, 0
  %rcc.tmp.47 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.48 = getelementptr [256 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.46
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.54 = load i32*, ptr %pc..tmp
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = load i32*, ptr %sp..tmp
  store i32 256, ptr %rcc.tmp.56
  %rcc.tmp.58 = load i1*, ptr %zf..tmp
  store i1 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = load i1*, ptr %cf..tmp
  store i1 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = load i1*, ptr %halt..tmp
  store i1 0, ptr %rcc.tmp.62
  ret void
}
define void @load_program.([2048 x i32]* %memory.tmp) {
entry:
  %memory..tmp = alloca [2048 x i32]* 
  %program = alloca [168 x i32] 
  %i = alloca i32 
  store [2048 x i32]* %memory.tmp, ptr %memory..tmp
  %rcc.tmp.2 = getelementptr [168 x i32], ptr %program, i32 0, i32 0
  store i32 2, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [168 x i32], ptr %program, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [168 x i32], ptr %program, i32 0, i32 2
  store i32 15, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [168 x i32], ptr %program, i32 0, i32 3
  store i32 2, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [168 x i32], ptr %program, i32 0, i32 4
  store i32 1, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [168 x i32], ptr %program, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [168 x i32], ptr %program, i32 0, i32 6
  store i32 2, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [168 x i32], ptr %program, i32 0, i32 7
  store i32 2, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [168 x i32], ptr %program, i32 0, i32 8
  store i32 1, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [168 x i32], ptr %program, i32 0, i32 9
  store i32 1, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [168 x i32], ptr %program, i32 0, i32 10
  store i32 4, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [168 x i32], ptr %program, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [168 x i32], ptr %program, i32 0, i32 12
  store i32 25, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [168 x i32], ptr %program, i32 0, i32 13
  store i32 4, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [168 x i32], ptr %program, i32 0, i32 14
  store i32 1, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [168 x i32], ptr %program, i32 0, i32 15
  store i32 18, ptr %rcc.tmp.32
  %rcc.tmp.34 = getelementptr [168 x i32], ptr %program, i32 0, i32 16
  store i32 36, ptr %rcc.tmp.34
  %rcc.tmp.36 = getelementptr [168 x i32], ptr %program, i32 0, i32 17
  store i32 0, ptr %rcc.tmp.36
  %rcc.tmp.38 = getelementptr [168 x i32], ptr %program, i32 0, i32 18
  store i32 1, ptr %rcc.tmp.38
  %rcc.tmp.40 = getelementptr [168 x i32], ptr %program, i32 0, i32 19
  store i32 3, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr [168 x i32], ptr %program, i32 0, i32 20
  store i32 1, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr [168 x i32], ptr %program, i32 0, i32 21
  store i32 1, ptr %rcc.tmp.44
  %rcc.tmp.46 = getelementptr [168 x i32], ptr %program, i32 0, i32 22
  store i32 1, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [168 x i32], ptr %program, i32 0, i32 23
  store i32 2, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [168 x i32], ptr %program, i32 0, i32 24
  store i32 3, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [168 x i32], ptr %program, i32 0, i32 25
  store i32 2, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [168 x i32], ptr %program, i32 0, i32 26
  store i32 3, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [168 x i32], ptr %program, i32 0, i32 27
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [168 x i32], ptr %program, i32 0, i32 28
  store i32 4, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [168 x i32], ptr %program, i32 0, i32 29
  store i32 4, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [168 x i32], ptr %program, i32 0, i32 30
  store i32 1, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [168 x i32], ptr %program, i32 0, i32 31
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [168 x i32], ptr %program, i32 0, i32 32
  store i32 25, ptr %rcc.tmp.66
  %rcc.tmp.68 = getelementptr [168 x i32], ptr %program, i32 0, i32 33
  store i32 4, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [168 x i32], ptr %program, i32 0, i32 34
  store i32 1, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [168 x i32], ptr %program, i32 0, i32 35
  store i32 19, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [168 x i32], ptr %program, i32 0, i32 36
  store i32 21, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [168 x i32], ptr %program, i32 0, i32 37
  store i32 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [168 x i32], ptr %program, i32 0, i32 38
  store i32 26, ptr %rcc.tmp.78
  %rcc.tmp.80 = getelementptr [168 x i32], ptr %program, i32 0, i32 39
  store i32 1, ptr %rcc.tmp.80
  %rcc.tmp.82 = getelementptr [168 x i32], ptr %program, i32 0, i32 40
  store i32 0, ptr %rcc.tmp.82
  %rcc.tmp.84 = getelementptr [168 x i32], ptr %program, i32 0, i32 41
  store i32 2, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr [168 x i32], ptr %program, i32 0, i32 42
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr [168 x i32], ptr %program, i32 0, i32 43
  store i32 10, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [168 x i32], ptr %program, i32 0, i32 44
  store i32 13, ptr %rcc.tmp.90
  %rcc.tmp.92 = getelementptr [168 x i32], ptr %program, i32 0, i32 45
  store i32 0, ptr %rcc.tmp.92
  %rcc.tmp.94 = getelementptr [168 x i32], ptr %program, i32 0, i32 46
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr [168 x i32], ptr %program, i32 0, i32 47
  store i32 22, ptr %rcc.tmp.96
  %rcc.tmp.98 = getelementptr [168 x i32], ptr %program, i32 0, i32 48
  store i32 81, ptr %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [168 x i32], ptr %program, i32 0, i32 49
  store i32 0, ptr %rcc.tmp.100
  %rcc.tmp.102 = getelementptr [168 x i32], ptr %program, i32 0, i32 50
  store i32 14, ptr %rcc.tmp.102
  %rcc.tmp.104 = getelementptr [168 x i32], ptr %program, i32 0, i32 51
  store i32 1, ptr %rcc.tmp.104
  %rcc.tmp.106 = getelementptr [168 x i32], ptr %program, i32 0, i32 52
  store i32 0, ptr %rcc.tmp.106
  %rcc.tmp.108 = getelementptr [168 x i32], ptr %program, i32 0, i32 53
  store i32 26, ptr %rcc.tmp.108
  %rcc.tmp.110 = getelementptr [168 x i32], ptr %program, i32 0, i32 54
  store i32 1, ptr %rcc.tmp.110
  %rcc.tmp.112 = getelementptr [168 x i32], ptr %program, i32 0, i32 55
  store i32 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = getelementptr [168 x i32], ptr %program, i32 0, i32 56
  store i32 2, ptr %rcc.tmp.114
  %rcc.tmp.116 = getelementptr [168 x i32], ptr %program, i32 0, i32 57
  store i32 5, ptr %rcc.tmp.116
  %rcc.tmp.118 = getelementptr [168 x i32], ptr %program, i32 0, i32 58
  store i32 12345, ptr %rcc.tmp.118
  %rcc.tmp.120 = getelementptr [168 x i32], ptr %program, i32 0, i32 59
  store i32 2, ptr %rcc.tmp.120
  %rcc.tmp.122 = getelementptr [168 x i32], ptr %program, i32 0, i32 60
  store i32 6, ptr %rcc.tmp.122
  %rcc.tmp.124 = getelementptr [168 x i32], ptr %program, i32 0, i32 61
  store i32 54321, ptr %rcc.tmp.124
  %rcc.tmp.126 = getelementptr [168 x i32], ptr %program, i32 0, i32 62
  store i32 7, ptr %rcc.tmp.126
  %rcc.tmp.128 = getelementptr [168 x i32], ptr %program, i32 0, i32 63
  store i32 5, ptr %rcc.tmp.128
  %rcc.tmp.130 = getelementptr [168 x i32], ptr %program, i32 0, i32 64
  store i32 6, ptr %rcc.tmp.130
  %rcc.tmp.132 = getelementptr [168 x i32], ptr %program, i32 0, i32 65
  store i32 0, ptr %rcc.tmp.132
  %rcc.tmp.134 = getelementptr [168 x i32], ptr %program, i32 0, i32 66
  store i32 26, ptr %rcc.tmp.134
  %rcc.tmp.136 = getelementptr [168 x i32], ptr %program, i32 0, i32 67
  store i32 5, ptr %rcc.tmp.136
  %rcc.tmp.138 = getelementptr [168 x i32], ptr %program, i32 0, i32 68
  store i32 0, ptr %rcc.tmp.138
  %rcc.tmp.140 = getelementptr [168 x i32], ptr %program, i32 0, i32 69
  store i32 2, ptr %rcc.tmp.140
  %rcc.tmp.142 = getelementptr [168 x i32], ptr %program, i32 0, i32 70
  store i32 5, ptr %rcc.tmp.142
  %rcc.tmp.144 = getelementptr [168 x i32], ptr %program, i32 0, i32 71
  store i32 12345, ptr %rcc.tmp.144
  %rcc.tmp.146 = getelementptr [168 x i32], ptr %program, i32 0, i32 72
  store i32 8, ptr %rcc.tmp.146
  %rcc.tmp.148 = getelementptr [168 x i32], ptr %program, i32 0, i32 73
  store i32 5, ptr %rcc.tmp.148
  %rcc.tmp.150 = getelementptr [168 x i32], ptr %program, i32 0, i32 74
  store i32 6, ptr %rcc.tmp.150
  %rcc.tmp.152 = getelementptr [168 x i32], ptr %program, i32 0, i32 75
  store i32 0, ptr %rcc.tmp.152
  %rcc.tmp.154 = getelementptr [168 x i32], ptr %program, i32 0, i32 76
  store i32 26, ptr %rcc.tmp.154
  %rcc.tmp.156 = getelementptr [168 x i32], ptr %program, i32 0, i32 77
  store i32 5, ptr %rcc.tmp.156
  %rcc.tmp.158 = getelementptr [168 x i32], ptr %program, i32 0, i32 78
  store i32 0, ptr %rcc.tmp.158
  %rcc.tmp.160 = getelementptr [168 x i32], ptr %program, i32 0, i32 79
  store i32 11, ptr %rcc.tmp.160
  %rcc.tmp.162 = getelementptr [168 x i32], ptr %program, i32 0, i32 80
  store i32 5, ptr %rcc.tmp.162
  %rcc.tmp.164 = getelementptr [168 x i32], ptr %program, i32 0, i32 81
  store i32 3, ptr %rcc.tmp.164
  %rcc.tmp.166 = getelementptr [168 x i32], ptr %program, i32 0, i32 82
  store i32 0, ptr %rcc.tmp.166
  %rcc.tmp.168 = getelementptr [168 x i32], ptr %program, i32 0, i32 83
  store i32 26, ptr %rcc.tmp.168
  %rcc.tmp.170 = getelementptr [168 x i32], ptr %program, i32 0, i32 84
  store i32 5, ptr %rcc.tmp.170
  %rcc.tmp.172 = getelementptr [168 x i32], ptr %program, i32 0, i32 85
  store i32 0, ptr %rcc.tmp.172
  %rcc.tmp.174 = getelementptr [168 x i32], ptr %program, i32 0, i32 86
  store i32 12, ptr %rcc.tmp.174
  %rcc.tmp.176 = getelementptr [168 x i32], ptr %program, i32 0, i32 87
  store i32 5, ptr %rcc.tmp.176
  %rcc.tmp.178 = getelementptr [168 x i32], ptr %program, i32 0, i32 88
  store i32 5, ptr %rcc.tmp.178
  %rcc.tmp.180 = getelementptr [168 x i32], ptr %program, i32 0, i32 89
  store i32 0, ptr %rcc.tmp.180
  %rcc.tmp.182 = getelementptr [168 x i32], ptr %program, i32 0, i32 90
  store i32 26, ptr %rcc.tmp.182
  %rcc.tmp.184 = getelementptr [168 x i32], ptr %program, i32 0, i32 91
  store i32 5, ptr %rcc.tmp.184
  %rcc.tmp.186 = getelementptr [168 x i32], ptr %program, i32 0, i32 92
  store i32 0, ptr %rcc.tmp.186
  %rcc.tmp.188 = getelementptr [168 x i32], ptr %program, i32 0, i32 93
  store i32 0, ptr %rcc.tmp.188
  %rcc.tmp.190 = getelementptr [168 x i32], ptr %program, i32 0, i32 94
  store i32 0, ptr %rcc.tmp.190
  %rcc.tmp.192 = getelementptr [168 x i32], ptr %program, i32 0, i32 95
  store i32 0, ptr %rcc.tmp.192
  %rcc.tmp.194 = getelementptr [168 x i32], ptr %program, i32 0, i32 96
  store i32 13, ptr %rcc.tmp.194
  %rcc.tmp.196 = getelementptr [168 x i32], ptr %program, i32 0, i32 97
  store i32 14, ptr %rcc.tmp.196
  %rcc.tmp.198 = getelementptr [168 x i32], ptr %program, i32 0, i32 98
  store i32 0, ptr %rcc.tmp.198
  %rcc.tmp.200 = getelementptr [168 x i32], ptr %program, i32 0, i32 99
  store i32 13, ptr %rcc.tmp.200
  %rcc.tmp.202 = getelementptr [168 x i32], ptr %program, i32 0, i32 100
  store i32 2, ptr %rcc.tmp.202
  %rcc.tmp.204 = getelementptr [168 x i32], ptr %program, i32 0, i32 101
  store i32 0, ptr %rcc.tmp.204
  %rcc.tmp.206 = getelementptr [168 x i32], ptr %program, i32 0, i32 102
  store i32 13, ptr %rcc.tmp.206
  %rcc.tmp.208 = getelementptr [168 x i32], ptr %program, i32 0, i32 103
  store i32 3, ptr %rcc.tmp.208
  %rcc.tmp.210 = getelementptr [168 x i32], ptr %program, i32 0, i32 104
  store i32 0, ptr %rcc.tmp.210
  %rcc.tmp.212 = getelementptr [168 x i32], ptr %program, i32 0, i32 105
  store i32 15, ptr %rcc.tmp.212
  %rcc.tmp.214 = getelementptr [168 x i32], ptr %program, i32 0, i32 106
  store i32 0, ptr %rcc.tmp.214
  %rcc.tmp.216 = getelementptr [168 x i32], ptr %program, i32 0, i32 107
  store i32 1, ptr %rcc.tmp.216
  %rcc.tmp.218 = getelementptr [168 x i32], ptr %program, i32 0, i32 108
  store i32 4, ptr %rcc.tmp.218
  %rcc.tmp.220 = getelementptr [168 x i32], ptr %program, i32 0, i32 109
  store i32 25, ptr %rcc.tmp.220
  %rcc.tmp.222 = getelementptr [168 x i32], ptr %program, i32 0, i32 110
  store i32 0, ptr %rcc.tmp.222
  %rcc.tmp.224 = getelementptr [168 x i32], ptr %program, i32 0, i32 111
  store i32 2, ptr %rcc.tmp.224
  %rcc.tmp.226 = getelementptr [168 x i32], ptr %program, i32 0, i32 112
  store i32 20, ptr %rcc.tmp.226
  %rcc.tmp.228 = getelementptr [168 x i32], ptr %program, i32 0, i32 113
  store i32 108, ptr %rcc.tmp.228
  %rcc.tmp.230 = getelementptr [168 x i32], ptr %program, i32 0, i32 114
  store i32 0, ptr %rcc.tmp.230
  %rcc.tmp.232 = getelementptr [168 x i32], ptr %program, i32 0, i32 115
  store i32 4, ptr %rcc.tmp.232
  %rcc.tmp.234 = getelementptr [168 x i32], ptr %program, i32 0, i32 116
  store i32 0, ptr %rcc.tmp.234
  %rcc.tmp.236 = getelementptr [168 x i32], ptr %program, i32 0, i32 117
  store i32 1, ptr %rcc.tmp.236
  %rcc.tmp.238 = getelementptr [168 x i32], ptr %program, i32 0, i32 118
  store i32 0, ptr %rcc.tmp.238
  %rcc.tmp.240 = getelementptr [168 x i32], ptr %program, i32 0, i32 119
  store i32 13, ptr %rcc.tmp.240
  %rcc.tmp.242 = getelementptr [168 x i32], ptr %program, i32 0, i32 120
  store i32 0, ptr %rcc.tmp.242
  %rcc.tmp.244 = getelementptr [168 x i32], ptr %program, i32 0, i32 121
  store i32 0, ptr %rcc.tmp.244
  %rcc.tmp.246 = getelementptr [168 x i32], ptr %program, i32 0, i32 122
  store i32 22, ptr %rcc.tmp.246
  %rcc.tmp.248 = getelementptr [168 x i32], ptr %program, i32 0, i32 123
  store i32 81, ptr %rcc.tmp.248
  %rcc.tmp.250 = getelementptr [168 x i32], ptr %program, i32 0, i32 124
  store i32 0, ptr %rcc.tmp.250
  %rcc.tmp.252 = getelementptr [168 x i32], ptr %program, i32 0, i32 125
  store i32 14, ptr %rcc.tmp.252
  %rcc.tmp.254 = getelementptr [168 x i32], ptr %program, i32 0, i32 126
  store i32 2, ptr %rcc.tmp.254
  %rcc.tmp.256 = getelementptr [168 x i32], ptr %program, i32 0, i32 127
  store i32 0, ptr %rcc.tmp.256
  %rcc.tmp.258 = getelementptr [168 x i32], ptr %program, i32 0, i32 128
  store i32 4, ptr %rcc.tmp.258
  %rcc.tmp.260 = getelementptr [168 x i32], ptr %program, i32 0, i32 129
  store i32 0, ptr %rcc.tmp.260
  %rcc.tmp.262 = getelementptr [168 x i32], ptr %program, i32 0, i32 130
  store i32 1, ptr %rcc.tmp.262
  %rcc.tmp.264 = getelementptr [168 x i32], ptr %program, i32 0, i32 131
  store i32 0, ptr %rcc.tmp.264
  %rcc.tmp.266 = getelementptr [168 x i32], ptr %program, i32 0, i32 132
  store i32 13, ptr %rcc.tmp.266
  %rcc.tmp.268 = getelementptr [168 x i32], ptr %program, i32 0, i32 133
  store i32 0, ptr %rcc.tmp.268
  %rcc.tmp.270 = getelementptr [168 x i32], ptr %program, i32 0, i32 134
  store i32 0, ptr %rcc.tmp.270
  %rcc.tmp.272 = getelementptr [168 x i32], ptr %program, i32 0, i32 135
  store i32 22, ptr %rcc.tmp.272
  %rcc.tmp.274 = getelementptr [168 x i32], ptr %program, i32 0, i32 136
  store i32 81, ptr %rcc.tmp.274
  %rcc.tmp.276 = getelementptr [168 x i32], ptr %program, i32 0, i32 137
  store i32 0, ptr %rcc.tmp.276
  %rcc.tmp.278 = getelementptr [168 x i32], ptr %program, i32 0, i32 138
  store i32 14, ptr %rcc.tmp.278
  %rcc.tmp.280 = getelementptr [168 x i32], ptr %program, i32 0, i32 139
  store i32 3, ptr %rcc.tmp.280
  %rcc.tmp.282 = getelementptr [168 x i32], ptr %program, i32 0, i32 140
  store i32 0, ptr %rcc.tmp.282
  %rcc.tmp.284 = getelementptr [168 x i32], ptr %program, i32 0, i32 141
  store i32 3, ptr %rcc.tmp.284
  %rcc.tmp.286 = getelementptr [168 x i32], ptr %program, i32 0, i32 142
  store i32 0, ptr %rcc.tmp.286
  %rcc.tmp.288 = getelementptr [168 x i32], ptr %program, i32 0, i32 143
  store i32 2, ptr %rcc.tmp.288
  %rcc.tmp.290 = getelementptr [168 x i32], ptr %program, i32 0, i32 144
  store i32 3, ptr %rcc.tmp.290
  %rcc.tmp.292 = getelementptr [168 x i32], ptr %program, i32 0, i32 145
  store i32 17, ptr %rcc.tmp.292
  %rcc.tmp.294 = getelementptr [168 x i32], ptr %program, i32 0, i32 146
  store i32 114, ptr %rcc.tmp.294
  %rcc.tmp.296 = getelementptr [168 x i32], ptr %program, i32 0, i32 147
  store i32 0, ptr %rcc.tmp.296
  %rcc.tmp.298 = getelementptr [168 x i32], ptr %program, i32 0, i32 148
  store i32 15, ptr %rcc.tmp.298
  %rcc.tmp.300 = getelementptr [168 x i32], ptr %program, i32 0, i32 149
  store i32 0, ptr %rcc.tmp.300
  %rcc.tmp.302 = getelementptr [168 x i32], ptr %program, i32 0, i32 150
  store i32 1, ptr %rcc.tmp.302
  %rcc.tmp.304 = getelementptr [168 x i32], ptr %program, i32 0, i32 151
  store i32 4, ptr %rcc.tmp.304
  %rcc.tmp.306 = getelementptr [168 x i32], ptr %program, i32 0, i32 152
  store i32 16, ptr %rcc.tmp.306
  %rcc.tmp.308 = getelementptr [168 x i32], ptr %program, i32 0, i32 153
  store i32 0, ptr %rcc.tmp.308
  %rcc.tmp.310 = getelementptr [168 x i32], ptr %program, i32 0, i32 154
  store i32 1, ptr %rcc.tmp.310
  %rcc.tmp.312 = getelementptr [168 x i32], ptr %program, i32 0, i32 155
  store i32 4, ptr %rcc.tmp.312
  %rcc.tmp.314 = getelementptr [168 x i32], ptr %program, i32 0, i32 156
  store i32 14, ptr %rcc.tmp.314
  %rcc.tmp.316 = getelementptr [168 x i32], ptr %program, i32 0, i32 157
  store i32 3, ptr %rcc.tmp.316
  %rcc.tmp.318 = getelementptr [168 x i32], ptr %program, i32 0, i32 158
  store i32 0, ptr %rcc.tmp.318
  %rcc.tmp.320 = getelementptr [168 x i32], ptr %program, i32 0, i32 159
  store i32 14, ptr %rcc.tmp.320
  %rcc.tmp.322 = getelementptr [168 x i32], ptr %program, i32 0, i32 160
  store i32 2, ptr %rcc.tmp.322
  %rcc.tmp.324 = getelementptr [168 x i32], ptr %program, i32 0, i32 161
  store i32 0, ptr %rcc.tmp.324
  %rcc.tmp.326 = getelementptr [168 x i32], ptr %program, i32 0, i32 162
  store i32 14, ptr %rcc.tmp.326
  %rcc.tmp.328 = getelementptr [168 x i32], ptr %program, i32 0, i32 163
  store i32 14, ptr %rcc.tmp.328
  %rcc.tmp.330 = getelementptr [168 x i32], ptr %program, i32 0, i32 164
  store i32 0, ptr %rcc.tmp.330
  %rcc.tmp.332 = getelementptr [168 x i32], ptr %program, i32 0, i32 165
  store i32 23, ptr %rcc.tmp.332
  %rcc.tmp.334 = getelementptr [168 x i32], ptr %program, i32 0, i32 166
  store i32 0, ptr %rcc.tmp.334
  %rcc.tmp.336 = getelementptr [168 x i32], ptr %program, i32 0, i32 167
  store i32 0, ptr %rcc.tmp.336
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.340 = load i32, ptr %i
  %rcc.tmp.341 = icmp slt i32 %rcc.tmp.340, 168
  br i1 %rcc.tmp.341, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.344 = load i32, ptr %i
  %rcc.tmp.345 = add i32 %rcc.tmp.344, 0
  %rcc.tmp.346 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.347 = getelementptr [2048 x i32], ptr %rcc.tmp.346, i32 0, i32 %rcc.tmp.345
  %rcc.tmp.348 = load i32, ptr %i
  %rcc.tmp.349 = add i32 %rcc.tmp.348, 0
  %rcc.tmp.350 = getelementptr [168 x i32], ptr %program, i32 0, i32 %rcc.tmp.349
  %rcc.tmp.351 = load i32, ptr %rcc.tmp.350
  store i32 %rcc.tmp.351, ptr %rcc.tmp.347
  %rcc.tmp.353 = load i32, ptr %i
  %rcc.tmp.354 = add i32 %rcc.tmp.353, 1
  store i32 %rcc.tmp.354, ptr %i
  br label %while.cond
while.end:
  ret void
}
define void @fetch_decode_execute.([16 x i32]* %registers.tmp, [2048 x i32]* %memory.tmp, [256 x i32]* %stack.tmp, i32* %pc.tmp, i32* %sp.tmp, i1* %zf.tmp, i1* %cf.tmp, i1* %halt.tmp) {
entry:
  %registers..tmp = alloca [16 x i32]* 
  %memory..tmp = alloca [2048 x i32]* 
  %stack..tmp = alloca [256 x i32]* 
  %pc..tmp = alloca i32* 
  %sp..tmp = alloca i32* 
  %zf..tmp = alloca i1* 
  %cf..tmp = alloca i1* 
  %halt..tmp = alloca i1* 
  %opcode = alloca i32 
  %r_dst = alloca i32 
  %r_src = alloca i32 
  %r_dst.2 = alloca i32 
  %imm = alloca i32 
  %r_dst.3 = alloca i32 
  %r_src.2 = alloca i32 
  %res = alloca i32 
  %r_dst.4 = alloca i32 
  %r_src.3 = alloca i32 
  %res.2 = alloca i32 
  %r_dst.5 = alloca i32 
  %r_src.4 = alloca i32 
  %r_dst.6 = alloca i32 
  %r_src.5 = alloca i32 
  %r_dst.7 = alloca i32 
  %r_src.6 = alloca i32 
  %r_dst.8 = alloca i32 
  %r_src.7 = alloca i32 
  %r_dst.9 = alloca i32 
  %r_src.8 = alloca i32 
  %r_dst.10 = alloca i32 
  %r_dst.11 = alloca i32 
  %imm.2 = alloca i32 
  %r_dst.12 = alloca i32 
  %imm.3 = alloca i32 
  %r_src.9 = alloca i32 
  %r_dst.13 = alloca i32 
  %r_dst.14 = alloca i32 
  %r_addr = alloca i32 
  %offset = alloca i32 
  %addr = alloca i32 
  %r_src.10 = alloca i32 
  %r_addr.2 = alloca i32 
  %offset.2 = alloca i32 
  %addr.2 = alloca i32 
  %r1 = alloca i32 
  %r2 = alloca i32 
  %val1 = alloca i32 
  %val2 = alloca i32 
  %r1.2 = alloca i32 
  %imm.4 = alloca i32 
  %val1.2 = alloca i32 
  %r_src.11 = alloca i32 
  store [16 x i32]* %registers.tmp, ptr %registers..tmp
  store [2048 x i32]* %memory.tmp, ptr %memory..tmp
  store [256 x i32]* %stack.tmp, ptr %stack..tmp
  store i32* %pc.tmp, ptr %pc..tmp
  store i32* %sp.tmp, ptr %sp..tmp
  store i1* %zf.tmp, ptr %zf..tmp
  store i1* %cf.tmp, ptr %cf..tmp
  store i1* %halt.tmp, ptr %halt..tmp
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i1*, ptr %halt..tmp
  %rcc.tmp.11 = load i1, ptr %rcc.tmp.10
  %rcc.tmp.12 = icmp eq i1 %rcc.tmp.11, 0
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32*, ptr %pc..tmp
  %rcc.tmp.16 = load i32, ptr %rcc.tmp.15
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %sc.merge, label %or.rhs
or.rhs:
  %rcc.tmp.19 = load i32*, ptr %pc..tmp
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = icmp sge i32 %rcc.tmp.20, 2048
  br label %sc.merge
sc.merge:
  %rcc.tmp.23 = phi i1 [1, %while.body], [%rcc.tmp.21, %or.rhs]
  br i1 %rcc.tmp.23, label %if.then, label %if.else
if.then:
  %rcc.tmp.25 = load i1*, ptr %halt..tmp
  store i1 1, ptr %rcc.tmp.25
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.29 = load i1*, ptr %halt..tmp
  %rcc.tmp.30 = load i1, ptr %rcc.tmp.29
  %rcc.tmp.31 = icmp eq i1 %rcc.tmp.30, 1
  br i1 %rcc.tmp.31, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.34 = load i32*, ptr %pc..tmp
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 0
  %rcc.tmp.37 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.38 = getelementptr [2048 x i32], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.36
  %rcc.tmp.39 = load i32, ptr %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %opcode
  %rcc.tmp.41 = load i32*, ptr %pc..tmp
  %rcc.tmp.42 = load i32*, ptr %pc..tmp
  %rcc.tmp.43 = load i32, ptr %rcc.tmp.42
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %rcc.tmp.41
  %rcc.tmp.46 = load i32, ptr %opcode
  %rcc.tmp.47 = icmp eq i32 %rcc.tmp.46, 0
  br i1 %rcc.tmp.47, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.49 = load i1*, ptr %halt..tmp
  store i1 1, ptr %rcc.tmp.49
  br label %if.merge.3
if.else.3:
  %rcc.tmp.52 = load i32, ptr %opcode
  %rcc.tmp.53 = icmp eq i32 %rcc.tmp.52, 1
  br i1 %rcc.tmp.53, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.55 = load i32*, ptr %pc..tmp
  %rcc.tmp.56 = load i32, ptr %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.59 = getelementptr [2048 x i32], ptr %rcc.tmp.58, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.60 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.60, ptr %r_dst
  %rcc.tmp.62 = load i32*, ptr %pc..tmp
  %rcc.tmp.63 = load i32, ptr %rcc.tmp.62
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  %rcc.tmp.66 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.67 = getelementptr [2048 x i32], ptr %rcc.tmp.66, i32 0, i32 %rcc.tmp.65
  %rcc.tmp.68 = load i32, ptr %rcc.tmp.67
  store i32 %rcc.tmp.68, ptr %r_src
  %rcc.tmp.70 = load i32, ptr %r_dst
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.73 = getelementptr [16 x i32], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.71
  %rcc.tmp.74 = load i32, ptr %r_src
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 0
  %rcc.tmp.76 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.77 = getelementptr [16 x i32], ptr %rcc.tmp.76, i32 0, i32 %rcc.tmp.75
  %rcc.tmp.78 = load i32, ptr %rcc.tmp.77
  store i32 %rcc.tmp.78, ptr %rcc.tmp.73
  %rcc.tmp.80 = load i32*, ptr %pc..tmp
  %rcc.tmp.81 = load i32*, ptr %pc..tmp
  %rcc.tmp.82 = load i32, ptr %rcc.tmp.81
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 2
  store i32 %rcc.tmp.83, ptr %rcc.tmp.80
  br label %if.merge.4
if.else.4:
  %rcc.tmp.86 = load i32, ptr %opcode
  %rcc.tmp.87 = icmp eq i32 %rcc.tmp.86, 2
  br i1 %rcc.tmp.87, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.89 = load i32*, ptr %pc..tmp
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 0
  %rcc.tmp.92 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.93 = getelementptr [2048 x i32], ptr %rcc.tmp.92, i32 0, i32 %rcc.tmp.91
  %rcc.tmp.94 = load i32, ptr %rcc.tmp.93
  store i32 %rcc.tmp.94, ptr %r_dst.2
  %rcc.tmp.96 = load i32*, ptr %pc..tmp
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 1
  %rcc.tmp.100 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.101 = getelementptr [2048 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.102 = load i32, ptr %rcc.tmp.101
  store i32 %rcc.tmp.102, ptr %imm
  %rcc.tmp.104 = load i32, ptr %r_dst.2
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.107 = getelementptr [16 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %imm
  store i32 %rcc.tmp.108, ptr %rcc.tmp.107
  %rcc.tmp.110 = load i32*, ptr %pc..tmp
  %rcc.tmp.111 = load i32*, ptr %pc..tmp
  %rcc.tmp.112 = load i32, ptr %rcc.tmp.111
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 2
  store i32 %rcc.tmp.113, ptr %rcc.tmp.110
  br label %if.merge.5
if.else.5:
  %rcc.tmp.116 = load i32, ptr %opcode
  %rcc.tmp.117 = icmp eq i32 %rcc.tmp.116, 3
  br i1 %rcc.tmp.117, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.119 = load i32*, ptr %pc..tmp
  %rcc.tmp.120 = load i32, ptr %rcc.tmp.119
  %rcc.tmp.121 = add i32 %rcc.tmp.120, 0
  %rcc.tmp.122 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.123 = getelementptr [2048 x i32], ptr %rcc.tmp.122, i32 0, i32 %rcc.tmp.121
  %rcc.tmp.124 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.124, ptr %r_dst.3
  %rcc.tmp.126 = load i32*, ptr %pc..tmp
  %rcc.tmp.127 = load i32, ptr %rcc.tmp.126
  %rcc.tmp.128 = add i32 %rcc.tmp.127, 0
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 1
  %rcc.tmp.130 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.131 = getelementptr [2048 x i32], ptr %rcc.tmp.130, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.132 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.132, ptr %r_src.2
  %rcc.tmp.134 = load i32, ptr %r_dst.3
  %rcc.tmp.135 = add i32 %rcc.tmp.134, 0
  %rcc.tmp.136 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.137 = getelementptr [16 x i32], ptr %rcc.tmp.136, i32 0, i32 %rcc.tmp.135
  %rcc.tmp.138 = load i32, ptr %rcc.tmp.137
  %rcc.tmp.139 = load i32, ptr %r_src.2
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 0
  %rcc.tmp.141 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.142 = getelementptr [16 x i32], ptr %rcc.tmp.141, i32 0, i32 %rcc.tmp.140
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.142
  %rcc.tmp.144 = add i32 %rcc.tmp.138, %rcc.tmp.143
  store i32 %rcc.tmp.144, ptr %res
  %rcc.tmp.146 = load i32, ptr %r_dst.3
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 0
  %rcc.tmp.148 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.149 = getelementptr [16 x i32], ptr %rcc.tmp.148, i32 0, i32 %rcc.tmp.147
  %rcc.tmp.150 = load i32, ptr %rcc.tmp.149
  %rcc.tmp.151 = icmp sgt i32 %rcc.tmp.150, 0
  br i1 %rcc.tmp.151, label %and.rhs, label %sc.merge.2
and.rhs:
  %rcc.tmp.153 = load i32, ptr %r_src.2
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.156 = getelementptr [16 x i32], ptr %rcc.tmp.155, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.157 = load i32, ptr %rcc.tmp.156
  %rcc.tmp.158 = icmp sgt i32 %rcc.tmp.157, 0
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.160 = phi i1 [0, %if.then.6], [%rcc.tmp.158, %and.rhs]
  br i1 %rcc.tmp.160, label %and.rhs.2, label %sc.merge.3
and.rhs.2:
  %rcc.tmp.162 = load i32, ptr %res
  %rcc.tmp.163 = icmp slt i32 %rcc.tmp.162, 0
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.165 = phi i1 [0, %sc.merge.2], [%rcc.tmp.163, %and.rhs.2]
  br i1 %rcc.tmp.165, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.167 = load i1*, ptr %cf..tmp
  store i1 1, ptr %rcc.tmp.167
  br label %if.merge.7
if.else.7:
  %rcc.tmp.170 = load i32, ptr %r_dst.3
  %rcc.tmp.171 = add i32 %rcc.tmp.170, 0
  %rcc.tmp.172 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.173 = getelementptr [16 x i32], ptr %rcc.tmp.172, i32 0, i32 %rcc.tmp.171
  %rcc.tmp.174 = load i32, ptr %rcc.tmp.173
  %rcc.tmp.175 = icmp slt i32 %rcc.tmp.174, 0
  br i1 %rcc.tmp.175, label %and.rhs.3, label %sc.merge.4
and.rhs.3:
  %rcc.tmp.177 = load i32, ptr %r_src.2
  %rcc.tmp.178 = add i32 %rcc.tmp.177, 0
  %rcc.tmp.179 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.180 = getelementptr [16 x i32], ptr %rcc.tmp.179, i32 0, i32 %rcc.tmp.178
  %rcc.tmp.181 = load i32, ptr %rcc.tmp.180
  %rcc.tmp.182 = icmp slt i32 %rcc.tmp.181, 0
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.184 = phi i1 [0, %if.else.7], [%rcc.tmp.182, %and.rhs.3]
  br i1 %rcc.tmp.184, label %and.rhs.4, label %sc.merge.5
and.rhs.4:
  %rcc.tmp.186 = load i32, ptr %res
  %rcc.tmp.187 = icmp sgt i32 %rcc.tmp.186, 0
  br label %sc.merge.5
sc.merge.5:
  %rcc.tmp.189 = phi i1 [0, %sc.merge.4], [%rcc.tmp.187, %and.rhs.4]
  br i1 %rcc.tmp.189, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.191 = load i1*, ptr %cf..tmp
  store i1 1, ptr %rcc.tmp.191
  br label %if.merge.8
if.else.8:
  %rcc.tmp.194 = load i1*, ptr %cf..tmp
  store i1 0, ptr %rcc.tmp.194
  br label %if.merge.8
if.merge.8:
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.198 = load i32, ptr %r_dst.3
  %rcc.tmp.199 = add i32 %rcc.tmp.198, 0
  %rcc.tmp.200 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.201 = getelementptr [16 x i32], ptr %rcc.tmp.200, i32 0, i32 %rcc.tmp.199
  %rcc.tmp.202 = load i32, ptr %res
  store i32 %rcc.tmp.202, ptr %rcc.tmp.201
  %rcc.tmp.204 = load i1*, ptr %zf..tmp
  %rcc.tmp.205 = load i32, ptr %res
  %rcc.tmp.206 = icmp eq i32 %rcc.tmp.205, 0
  store i1 %rcc.tmp.206, ptr %rcc.tmp.204
  %rcc.tmp.208 = load i32*, ptr %pc..tmp
  %rcc.tmp.209 = load i32*, ptr %pc..tmp
  %rcc.tmp.210 = load i32, ptr %rcc.tmp.209
  %rcc.tmp.211 = add i32 %rcc.tmp.210, 2
  store i32 %rcc.tmp.211, ptr %rcc.tmp.208
  br label %if.merge.6
if.else.6:
  %rcc.tmp.214 = load i32, ptr %opcode
  %rcc.tmp.215 = icmp eq i32 %rcc.tmp.214, 4
  br i1 %rcc.tmp.215, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.217 = load i32*, ptr %pc..tmp
  %rcc.tmp.218 = load i32, ptr %rcc.tmp.217
  %rcc.tmp.219 = add i32 %rcc.tmp.218, 0
  %rcc.tmp.220 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.221 = getelementptr [2048 x i32], ptr %rcc.tmp.220, i32 0, i32 %rcc.tmp.219
  %rcc.tmp.222 = load i32, ptr %rcc.tmp.221
  store i32 %rcc.tmp.222, ptr %r_dst.4
  %rcc.tmp.224 = load i32*, ptr %pc..tmp
  %rcc.tmp.225 = load i32, ptr %rcc.tmp.224
  %rcc.tmp.226 = add i32 %rcc.tmp.225, 0
  %rcc.tmp.227 = add i32 %rcc.tmp.226, 1
  %rcc.tmp.228 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.229 = getelementptr [2048 x i32], ptr %rcc.tmp.228, i32 0, i32 %rcc.tmp.227
  %rcc.tmp.230 = load i32, ptr %rcc.tmp.229
  store i32 %rcc.tmp.230, ptr %r_src.3
  %rcc.tmp.232 = load i32, ptr %r_dst.4
  %rcc.tmp.233 = add i32 %rcc.tmp.232, 0
  %rcc.tmp.234 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.235 = getelementptr [16 x i32], ptr %rcc.tmp.234, i32 0, i32 %rcc.tmp.233
  %rcc.tmp.236 = load i32, ptr %rcc.tmp.235
  %rcc.tmp.237 = load i32, ptr %r_src.3
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 0
  %rcc.tmp.239 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.240 = getelementptr [16 x i32], ptr %rcc.tmp.239, i32 0, i32 %rcc.tmp.238
  %rcc.tmp.241 = load i32, ptr %rcc.tmp.240
  %rcc.tmp.242 = sub i32 %rcc.tmp.236, %rcc.tmp.241
  store i32 %rcc.tmp.242, ptr %res.2
  %rcc.tmp.244 = load i32, ptr %r_dst.4
  %rcc.tmp.245 = add i32 %rcc.tmp.244, 0
  %rcc.tmp.246 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.247 = getelementptr [16 x i32], ptr %rcc.tmp.246, i32 0, i32 %rcc.tmp.245
  %rcc.tmp.248 = load i32, ptr %rcc.tmp.247
  %rcc.tmp.249 = icmp sgt i32 %rcc.tmp.248, 0
  br i1 %rcc.tmp.249, label %and.rhs.5, label %sc.merge.6
and.rhs.5:
  %rcc.tmp.251 = load i32, ptr %r_src.3
  %rcc.tmp.252 = add i32 %rcc.tmp.251, 0
  %rcc.tmp.253 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.254 = getelementptr [16 x i32], ptr %rcc.tmp.253, i32 0, i32 %rcc.tmp.252
  %rcc.tmp.255 = load i32, ptr %rcc.tmp.254
  %rcc.tmp.256 = icmp slt i32 %rcc.tmp.255, 0
  br label %sc.merge.6
sc.merge.6:
  %rcc.tmp.258 = phi i1 [0, %if.then.9], [%rcc.tmp.256, %and.rhs.5]
  br i1 %rcc.tmp.258, label %and.rhs.6, label %sc.merge.7
and.rhs.6:
  %rcc.tmp.260 = load i32, ptr %res.2
  %rcc.tmp.261 = icmp slt i32 %rcc.tmp.260, 0
  br label %sc.merge.7
sc.merge.7:
  %rcc.tmp.263 = phi i1 [0, %sc.merge.6], [%rcc.tmp.261, %and.rhs.6]
  br i1 %rcc.tmp.263, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.265 = load i1*, ptr %cf..tmp
  store i1 1, ptr %rcc.tmp.265
  br label %if.merge.10
if.else.10:
  %rcc.tmp.268 = load i32, ptr %r_dst.4
  %rcc.tmp.269 = add i32 %rcc.tmp.268, 0
  %rcc.tmp.270 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.271 = getelementptr [16 x i32], ptr %rcc.tmp.270, i32 0, i32 %rcc.tmp.269
  %rcc.tmp.272 = load i32, ptr %rcc.tmp.271
  %rcc.tmp.273 = icmp slt i32 %rcc.tmp.272, 0
  br i1 %rcc.tmp.273, label %and.rhs.7, label %sc.merge.8
and.rhs.7:
  %rcc.tmp.275 = load i32, ptr %r_src.3
  %rcc.tmp.276 = add i32 %rcc.tmp.275, 0
  %rcc.tmp.277 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.278 = getelementptr [16 x i32], ptr %rcc.tmp.277, i32 0, i32 %rcc.tmp.276
  %rcc.tmp.279 = load i32, ptr %rcc.tmp.278
  %rcc.tmp.280 = icmp sgt i32 %rcc.tmp.279, 0
  br label %sc.merge.8
sc.merge.8:
  %rcc.tmp.282 = phi i1 [0, %if.else.10], [%rcc.tmp.280, %and.rhs.7]
  br i1 %rcc.tmp.282, label %and.rhs.8, label %sc.merge.9
and.rhs.8:
  %rcc.tmp.284 = load i32, ptr %res.2
  %rcc.tmp.285 = icmp sgt i32 %rcc.tmp.284, 0
  br label %sc.merge.9
sc.merge.9:
  %rcc.tmp.287 = phi i1 [0, %sc.merge.8], [%rcc.tmp.285, %and.rhs.8]
  br i1 %rcc.tmp.287, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.289 = load i1*, ptr %cf..tmp
  store i1 1, ptr %rcc.tmp.289
  br label %if.merge.11
if.else.11:
  %rcc.tmp.292 = load i1*, ptr %cf..tmp
  store i1 0, ptr %rcc.tmp.292
  br label %if.merge.11
if.merge.11:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.296 = load i32, ptr %r_dst.4
  %rcc.tmp.297 = add i32 %rcc.tmp.296, 0
  %rcc.tmp.298 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.299 = getelementptr [16 x i32], ptr %rcc.tmp.298, i32 0, i32 %rcc.tmp.297
  %rcc.tmp.300 = load i32, ptr %res.2
  store i32 %rcc.tmp.300, ptr %rcc.tmp.299
  %rcc.tmp.302 = load i1*, ptr %zf..tmp
  %rcc.tmp.303 = load i32, ptr %res.2
  %rcc.tmp.304 = icmp eq i32 %rcc.tmp.303, 0
  store i1 %rcc.tmp.304, ptr %rcc.tmp.302
  %rcc.tmp.306 = load i32*, ptr %pc..tmp
  %rcc.tmp.307 = load i32*, ptr %pc..tmp
  %rcc.tmp.308 = load i32, ptr %rcc.tmp.307
  %rcc.tmp.309 = add i32 %rcc.tmp.308, 2
  store i32 %rcc.tmp.309, ptr %rcc.tmp.306
  br label %if.merge.9
if.else.9:
  %rcc.tmp.312 = load i32, ptr %opcode
  %rcc.tmp.313 = icmp eq i32 %rcc.tmp.312, 5
  br i1 %rcc.tmp.313, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.315 = load i32*, ptr %pc..tmp
  %rcc.tmp.316 = load i32, ptr %rcc.tmp.315
  %rcc.tmp.317 = add i32 %rcc.tmp.316, 0
  %rcc.tmp.318 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.319 = getelementptr [2048 x i32], ptr %rcc.tmp.318, i32 0, i32 %rcc.tmp.317
  %rcc.tmp.320 = load i32, ptr %rcc.tmp.319
  store i32 %rcc.tmp.320, ptr %r_dst.5
  %rcc.tmp.322 = load i32*, ptr %pc..tmp
  %rcc.tmp.323 = load i32, ptr %rcc.tmp.322
  %rcc.tmp.324 = add i32 %rcc.tmp.323, 0
  %rcc.tmp.325 = add i32 %rcc.tmp.324, 1
  %rcc.tmp.326 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.327 = getelementptr [2048 x i32], ptr %rcc.tmp.326, i32 0, i32 %rcc.tmp.325
  %rcc.tmp.328 = load i32, ptr %rcc.tmp.327
  store i32 %rcc.tmp.328, ptr %r_src.4
  %rcc.tmp.330 = load i32, ptr %r_dst.5
  %rcc.tmp.331 = add i32 %rcc.tmp.330, 0
  %rcc.tmp.332 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.333 = getelementptr [16 x i32], ptr %rcc.tmp.332, i32 0, i32 %rcc.tmp.331
  %rcc.tmp.334 = load i32, ptr %r_dst.5
  %rcc.tmp.335 = add i32 %rcc.tmp.334, 0
  %rcc.tmp.336 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.337 = getelementptr [16 x i32], ptr %rcc.tmp.336, i32 0, i32 %rcc.tmp.335
  %rcc.tmp.338 = load i32, ptr %rcc.tmp.337
  %rcc.tmp.339 = load i32, ptr %r_src.4
  %rcc.tmp.340 = add i32 %rcc.tmp.339, 0
  %rcc.tmp.341 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.342 = getelementptr [16 x i32], ptr %rcc.tmp.341, i32 0, i32 %rcc.tmp.340
  %rcc.tmp.343 = load i32, ptr %rcc.tmp.342
  %rcc.tmp.344 = mul i32 %rcc.tmp.338, %rcc.tmp.343
  store i32 %rcc.tmp.344, ptr %rcc.tmp.333
  %rcc.tmp.346 = load i1*, ptr %zf..tmp
  %rcc.tmp.347 = load i32, ptr %r_dst.5
  %rcc.tmp.348 = add i32 %rcc.tmp.347, 0
  %rcc.tmp.349 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.350 = getelementptr [16 x i32], ptr %rcc.tmp.349, i32 0, i32 %rcc.tmp.348
  %rcc.tmp.351 = load i32, ptr %rcc.tmp.350
  %rcc.tmp.352 = icmp eq i32 %rcc.tmp.351, 0
  store i1 %rcc.tmp.352, ptr %rcc.tmp.346
  %rcc.tmp.354 = load i32*, ptr %pc..tmp
  %rcc.tmp.355 = load i32*, ptr %pc..tmp
  %rcc.tmp.356 = load i32, ptr %rcc.tmp.355
  %rcc.tmp.357 = add i32 %rcc.tmp.356, 2
  store i32 %rcc.tmp.357, ptr %rcc.tmp.354
  br label %if.merge.12
if.else.12:
  %rcc.tmp.360 = load i32, ptr %opcode
  %rcc.tmp.361 = icmp eq i32 %rcc.tmp.360, 6
  br i1 %rcc.tmp.361, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.363 = load i32*, ptr %pc..tmp
  %rcc.tmp.364 = load i32, ptr %rcc.tmp.363
  %rcc.tmp.365 = add i32 %rcc.tmp.364, 0
  %rcc.tmp.366 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.367 = getelementptr [2048 x i32], ptr %rcc.tmp.366, i32 0, i32 %rcc.tmp.365
  %rcc.tmp.368 = load i32, ptr %rcc.tmp.367
  store i32 %rcc.tmp.368, ptr %r_dst.6
  %rcc.tmp.370 = load i32*, ptr %pc..tmp
  %rcc.tmp.371 = load i32, ptr %rcc.tmp.370
  %rcc.tmp.372 = add i32 %rcc.tmp.371, 0
  %rcc.tmp.373 = add i32 %rcc.tmp.372, 1
  %rcc.tmp.374 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.375 = getelementptr [2048 x i32], ptr %rcc.tmp.374, i32 0, i32 %rcc.tmp.373
  %rcc.tmp.376 = load i32, ptr %rcc.tmp.375
  store i32 %rcc.tmp.376, ptr %r_src.5
  %rcc.tmp.378 = load i32, ptr %r_src.5
  %rcc.tmp.379 = add i32 %rcc.tmp.378, 0
  %rcc.tmp.380 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.381 = getelementptr [16 x i32], ptr %rcc.tmp.380, i32 0, i32 %rcc.tmp.379
  %rcc.tmp.382 = load i32, ptr %rcc.tmp.381
  %rcc.tmp.383 = icmp ne i32 %rcc.tmp.382, 0
  br i1 %rcc.tmp.383, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.385 = load i32, ptr %r_dst.6
  %rcc.tmp.386 = add i32 %rcc.tmp.385, 0
  %rcc.tmp.387 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.388 = getelementptr [16 x i32], ptr %rcc.tmp.387, i32 0, i32 %rcc.tmp.386
  %rcc.tmp.389 = load i32, ptr %r_dst.6
  %rcc.tmp.390 = add i32 %rcc.tmp.389, 0
  %rcc.tmp.391 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.392 = getelementptr [16 x i32], ptr %rcc.tmp.391, i32 0, i32 %rcc.tmp.390
  %rcc.tmp.393 = load i32, ptr %rcc.tmp.392
  %rcc.tmp.394 = load i32, ptr %r_src.5
  %rcc.tmp.395 = add i32 %rcc.tmp.394, 0
  %rcc.tmp.396 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.397 = getelementptr [16 x i32], ptr %rcc.tmp.396, i32 0, i32 %rcc.tmp.395
  %rcc.tmp.398 = load i32, ptr %rcc.tmp.397
  %rcc.tmp.399 = sdiv i32 %rcc.tmp.393, %rcc.tmp.398
  store i32 %rcc.tmp.399, ptr %rcc.tmp.388
  br label %if.merge.14
if.else.14:
  %rcc.tmp.402 = load i1*, ptr %halt..tmp
  store i1 1, ptr %rcc.tmp.402
  br label %if.merge.14
if.merge.14:
  %rcc.tmp.405 = load i1*, ptr %zf..tmp
  %rcc.tmp.406 = load i32, ptr %r_dst.6
  %rcc.tmp.407 = add i32 %rcc.tmp.406, 0
  %rcc.tmp.408 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.409 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 %rcc.tmp.407
  %rcc.tmp.410 = load i32, ptr %rcc.tmp.409
  %rcc.tmp.411 = icmp eq i32 %rcc.tmp.410, 0
  store i1 %rcc.tmp.411, ptr %rcc.tmp.405
  %rcc.tmp.413 = load i32*, ptr %pc..tmp
  %rcc.tmp.414 = load i32*, ptr %pc..tmp
  %rcc.tmp.415 = load i32, ptr %rcc.tmp.414
  %rcc.tmp.416 = add i32 %rcc.tmp.415, 2
  store i32 %rcc.tmp.416, ptr %rcc.tmp.413
  br label %if.merge.13
if.else.13:
  %rcc.tmp.419 = load i32, ptr %opcode
  %rcc.tmp.420 = icmp eq i32 %rcc.tmp.419, 7
  br i1 %rcc.tmp.420, label %if.then.15, label %if.else.15
if.then.15:
  %rcc.tmp.422 = load i32*, ptr %pc..tmp
  %rcc.tmp.423 = load i32, ptr %rcc.tmp.422
  %rcc.tmp.424 = add i32 %rcc.tmp.423, 0
  %rcc.tmp.425 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.426 = getelementptr [2048 x i32], ptr %rcc.tmp.425, i32 0, i32 %rcc.tmp.424
  %rcc.tmp.427 = load i32, ptr %rcc.tmp.426
  store i32 %rcc.tmp.427, ptr %r_dst.7
  %rcc.tmp.429 = load i32*, ptr %pc..tmp
  %rcc.tmp.430 = load i32, ptr %rcc.tmp.429
  %rcc.tmp.431 = add i32 %rcc.tmp.430, 0
  %rcc.tmp.432 = add i32 %rcc.tmp.431, 1
  %rcc.tmp.433 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.434 = getelementptr [2048 x i32], ptr %rcc.tmp.433, i32 0, i32 %rcc.tmp.432
  %rcc.tmp.435 = load i32, ptr %rcc.tmp.434
  store i32 %rcc.tmp.435, ptr %r_src.6
  %rcc.tmp.437 = load i32, ptr %r_dst.7
  %rcc.tmp.438 = add i32 %rcc.tmp.437, 0
  %rcc.tmp.439 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.440 = getelementptr [16 x i32], ptr %rcc.tmp.439, i32 0, i32 %rcc.tmp.438
  %rcc.tmp.441 = load i32, ptr %r_dst.7
  %rcc.tmp.442 = add i32 %rcc.tmp.441, 0
  %rcc.tmp.443 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.444 = getelementptr [16 x i32], ptr %rcc.tmp.443, i32 0, i32 %rcc.tmp.442
  %rcc.tmp.445 = load i32, ptr %rcc.tmp.444
  %rcc.tmp.446 = load i32, ptr %r_src.6
  %rcc.tmp.447 = add i32 %rcc.tmp.446, 0
  %rcc.tmp.448 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.449 = getelementptr [16 x i32], ptr %rcc.tmp.448, i32 0, i32 %rcc.tmp.447
  %rcc.tmp.450 = load i32, ptr %rcc.tmp.449
  %rcc.tmp.451 = and i32 %rcc.tmp.445, %rcc.tmp.450
  store i32 %rcc.tmp.451, ptr %rcc.tmp.440
  %rcc.tmp.453 = load i1*, ptr %zf..tmp
  %rcc.tmp.454 = load i32, ptr %r_dst.7
  %rcc.tmp.455 = add i32 %rcc.tmp.454, 0
  %rcc.tmp.456 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.457 = getelementptr [16 x i32], ptr %rcc.tmp.456, i32 0, i32 %rcc.tmp.455
  %rcc.tmp.458 = load i32, ptr %rcc.tmp.457
  %rcc.tmp.459 = icmp eq i32 %rcc.tmp.458, 0
  store i1 %rcc.tmp.459, ptr %rcc.tmp.453
  %rcc.tmp.461 = load i32*, ptr %pc..tmp
  %rcc.tmp.462 = load i32*, ptr %pc..tmp
  %rcc.tmp.463 = load i32, ptr %rcc.tmp.462
  %rcc.tmp.464 = add i32 %rcc.tmp.463, 2
  store i32 %rcc.tmp.464, ptr %rcc.tmp.461
  br label %if.merge.15
if.else.15:
  %rcc.tmp.467 = load i32, ptr %opcode
  %rcc.tmp.468 = icmp eq i32 %rcc.tmp.467, 8
  br i1 %rcc.tmp.468, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.470 = load i32*, ptr %pc..tmp
  %rcc.tmp.471 = load i32, ptr %rcc.tmp.470
  %rcc.tmp.472 = add i32 %rcc.tmp.471, 0
  %rcc.tmp.473 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.474 = getelementptr [2048 x i32], ptr %rcc.tmp.473, i32 0, i32 %rcc.tmp.472
  %rcc.tmp.475 = load i32, ptr %rcc.tmp.474
  store i32 %rcc.tmp.475, ptr %r_dst.8
  %rcc.tmp.477 = load i32*, ptr %pc..tmp
  %rcc.tmp.478 = load i32, ptr %rcc.tmp.477
  %rcc.tmp.479 = add i32 %rcc.tmp.478, 0
  %rcc.tmp.480 = add i32 %rcc.tmp.479, 1
  %rcc.tmp.481 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.482 = getelementptr [2048 x i32], ptr %rcc.tmp.481, i32 0, i32 %rcc.tmp.480
  %rcc.tmp.483 = load i32, ptr %rcc.tmp.482
  store i32 %rcc.tmp.483, ptr %r_src.7
  %rcc.tmp.485 = load i32, ptr %r_dst.8
  %rcc.tmp.486 = add i32 %rcc.tmp.485, 0
  %rcc.tmp.487 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.488 = getelementptr [16 x i32], ptr %rcc.tmp.487, i32 0, i32 %rcc.tmp.486
  %rcc.tmp.489 = load i32, ptr %r_dst.8
  %rcc.tmp.490 = add i32 %rcc.tmp.489, 0
  %rcc.tmp.491 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.492 = getelementptr [16 x i32], ptr %rcc.tmp.491, i32 0, i32 %rcc.tmp.490
  %rcc.tmp.493 = load i32, ptr %rcc.tmp.492
  %rcc.tmp.494 = load i32, ptr %r_src.7
  %rcc.tmp.495 = add i32 %rcc.tmp.494, 0
  %rcc.tmp.496 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.497 = getelementptr [16 x i32], ptr %rcc.tmp.496, i32 0, i32 %rcc.tmp.495
  %rcc.tmp.498 = load i32, ptr %rcc.tmp.497
  %rcc.tmp.499 = or i32 %rcc.tmp.493, %rcc.tmp.498
  store i32 %rcc.tmp.499, ptr %rcc.tmp.488
  %rcc.tmp.501 = load i1*, ptr %zf..tmp
  %rcc.tmp.502 = load i32, ptr %r_dst.8
  %rcc.tmp.503 = add i32 %rcc.tmp.502, 0
  %rcc.tmp.504 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.505 = getelementptr [16 x i32], ptr %rcc.tmp.504, i32 0, i32 %rcc.tmp.503
  %rcc.tmp.506 = load i32, ptr %rcc.tmp.505
  %rcc.tmp.507 = icmp eq i32 %rcc.tmp.506, 0
  store i1 %rcc.tmp.507, ptr %rcc.tmp.501
  %rcc.tmp.509 = load i32*, ptr %pc..tmp
  %rcc.tmp.510 = load i32*, ptr %pc..tmp
  %rcc.tmp.511 = load i32, ptr %rcc.tmp.510
  %rcc.tmp.512 = add i32 %rcc.tmp.511, 2
  store i32 %rcc.tmp.512, ptr %rcc.tmp.509
  br label %if.merge.16
if.else.16:
  %rcc.tmp.515 = load i32, ptr %opcode
  %rcc.tmp.516 = icmp eq i32 %rcc.tmp.515, 9
  br i1 %rcc.tmp.516, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.518 = load i32*, ptr %pc..tmp
  %rcc.tmp.519 = load i32, ptr %rcc.tmp.518
  %rcc.tmp.520 = add i32 %rcc.tmp.519, 0
  %rcc.tmp.521 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.522 = getelementptr [2048 x i32], ptr %rcc.tmp.521, i32 0, i32 %rcc.tmp.520
  %rcc.tmp.523 = load i32, ptr %rcc.tmp.522
  store i32 %rcc.tmp.523, ptr %r_dst.9
  %rcc.tmp.525 = load i32*, ptr %pc..tmp
  %rcc.tmp.526 = load i32, ptr %rcc.tmp.525
  %rcc.tmp.527 = add i32 %rcc.tmp.526, 0
  %rcc.tmp.528 = add i32 %rcc.tmp.527, 1
  %rcc.tmp.529 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.530 = getelementptr [2048 x i32], ptr %rcc.tmp.529, i32 0, i32 %rcc.tmp.528
  %rcc.tmp.531 = load i32, ptr %rcc.tmp.530
  store i32 %rcc.tmp.531, ptr %r_src.8
  %rcc.tmp.533 = load i32, ptr %r_dst.9
  %rcc.tmp.534 = add i32 %rcc.tmp.533, 0
  %rcc.tmp.535 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.536 = getelementptr [16 x i32], ptr %rcc.tmp.535, i32 0, i32 %rcc.tmp.534
  %rcc.tmp.537 = load i32, ptr %r_dst.9
  %rcc.tmp.538 = add i32 %rcc.tmp.537, 0
  %rcc.tmp.539 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.540 = getelementptr [16 x i32], ptr %rcc.tmp.539, i32 0, i32 %rcc.tmp.538
  %rcc.tmp.541 = load i32, ptr %rcc.tmp.540
  %rcc.tmp.542 = load i32, ptr %r_src.8
  %rcc.tmp.543 = add i32 %rcc.tmp.542, 0
  %rcc.tmp.544 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.545 = getelementptr [16 x i32], ptr %rcc.tmp.544, i32 0, i32 %rcc.tmp.543
  %rcc.tmp.546 = load i32, ptr %rcc.tmp.545
  %rcc.tmp.547 = xor i32 %rcc.tmp.541, %rcc.tmp.546
  store i32 %rcc.tmp.547, ptr %rcc.tmp.536
  %rcc.tmp.549 = load i1*, ptr %zf..tmp
  %rcc.tmp.550 = load i32, ptr %r_dst.9
  %rcc.tmp.551 = add i32 %rcc.tmp.550, 0
  %rcc.tmp.552 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.553 = getelementptr [16 x i32], ptr %rcc.tmp.552, i32 0, i32 %rcc.tmp.551
  %rcc.tmp.554 = load i32, ptr %rcc.tmp.553
  %rcc.tmp.555 = icmp eq i32 %rcc.tmp.554, 0
  store i1 %rcc.tmp.555, ptr %rcc.tmp.549
  %rcc.tmp.557 = load i32*, ptr %pc..tmp
  %rcc.tmp.558 = load i32*, ptr %pc..tmp
  %rcc.tmp.559 = load i32, ptr %rcc.tmp.558
  %rcc.tmp.560 = add i32 %rcc.tmp.559, 2
  store i32 %rcc.tmp.560, ptr %rcc.tmp.557
  br label %if.merge.17
if.else.17:
  %rcc.tmp.563 = load i32, ptr %opcode
  %rcc.tmp.564 = icmp eq i32 %rcc.tmp.563, 10
  br i1 %rcc.tmp.564, label %if.then.18, label %if.else.18
if.then.18:
  %rcc.tmp.566 = load i32*, ptr %pc..tmp
  %rcc.tmp.567 = load i32, ptr %rcc.tmp.566
  %rcc.tmp.568 = add i32 %rcc.tmp.567, 0
  %rcc.tmp.569 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.570 = getelementptr [2048 x i32], ptr %rcc.tmp.569, i32 0, i32 %rcc.tmp.568
  %rcc.tmp.571 = load i32, ptr %rcc.tmp.570
  store i32 %rcc.tmp.571, ptr %r_dst.10
  %rcc.tmp.573 = load i32, ptr %r_dst.10
  %rcc.tmp.574 = add i32 %rcc.tmp.573, 0
  %rcc.tmp.575 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.576 = getelementptr [16 x i32], ptr %rcc.tmp.575, i32 0, i32 %rcc.tmp.574
  %rcc.tmp.577 = load i32, ptr %r_dst.10
  %rcc.tmp.578 = add i32 %rcc.tmp.577, 0
  %rcc.tmp.579 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.580 = getelementptr [16 x i32], ptr %rcc.tmp.579, i32 0, i32 %rcc.tmp.578
  %rcc.tmp.581 = load i32, ptr %rcc.tmp.580
  %rcc.tmp.582 = xor i32 %rcc.tmp.581, -1
  store i32 %rcc.tmp.582, ptr %rcc.tmp.576
  %rcc.tmp.584 = load i1*, ptr %zf..tmp
  %rcc.tmp.585 = load i32, ptr %r_dst.10
  %rcc.tmp.586 = add i32 %rcc.tmp.585, 0
  %rcc.tmp.587 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.588 = getelementptr [16 x i32], ptr %rcc.tmp.587, i32 0, i32 %rcc.tmp.586
  %rcc.tmp.589 = load i32, ptr %rcc.tmp.588
  %rcc.tmp.590 = icmp eq i32 %rcc.tmp.589, 0
  store i1 %rcc.tmp.590, ptr %rcc.tmp.584
  %rcc.tmp.592 = load i32*, ptr %pc..tmp
  %rcc.tmp.593 = load i32*, ptr %pc..tmp
  %rcc.tmp.594 = load i32, ptr %rcc.tmp.593
  %rcc.tmp.595 = add i32 %rcc.tmp.594, 1
  store i32 %rcc.tmp.595, ptr %rcc.tmp.592
  br label %if.merge.18
if.else.18:
  %rcc.tmp.598 = load i32, ptr %opcode
  %rcc.tmp.599 = icmp eq i32 %rcc.tmp.598, 11
  br i1 %rcc.tmp.599, label %if.then.19, label %if.else.19
if.then.19:
  %rcc.tmp.601 = load i32*, ptr %pc..tmp
  %rcc.tmp.602 = load i32, ptr %rcc.tmp.601
  %rcc.tmp.603 = add i32 %rcc.tmp.602, 0
  %rcc.tmp.604 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.605 = getelementptr [2048 x i32], ptr %rcc.tmp.604, i32 0, i32 %rcc.tmp.603
  %rcc.tmp.606 = load i32, ptr %rcc.tmp.605
  store i32 %rcc.tmp.606, ptr %r_dst.11
  %rcc.tmp.608 = load i32*, ptr %pc..tmp
  %rcc.tmp.609 = load i32, ptr %rcc.tmp.608
  %rcc.tmp.610 = add i32 %rcc.tmp.609, 0
  %rcc.tmp.611 = add i32 %rcc.tmp.610, 1
  %rcc.tmp.612 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.613 = getelementptr [2048 x i32], ptr %rcc.tmp.612, i32 0, i32 %rcc.tmp.611
  %rcc.tmp.614 = load i32, ptr %rcc.tmp.613
  store i32 %rcc.tmp.614, ptr %imm.2
  %rcc.tmp.616 = load i32, ptr %r_dst.11
  %rcc.tmp.617 = add i32 %rcc.tmp.616, 0
  %rcc.tmp.618 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.619 = getelementptr [16 x i32], ptr %rcc.tmp.618, i32 0, i32 %rcc.tmp.617
  %rcc.tmp.620 = load i32, ptr %r_dst.11
  %rcc.tmp.621 = add i32 %rcc.tmp.620, 0
  %rcc.tmp.622 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.623 = getelementptr [16 x i32], ptr %rcc.tmp.622, i32 0, i32 %rcc.tmp.621
  %rcc.tmp.624 = load i32, ptr %rcc.tmp.623
  %rcc.tmp.625 = load i32, ptr %imm.2
  %rcc.tmp.626 = add i32 %rcc.tmp.625, 0
  %rcc.tmp.627 = shl i32 %rcc.tmp.624, %rcc.tmp.626
  store i32 %rcc.tmp.627, ptr %rcc.tmp.619
  %rcc.tmp.629 = load i1*, ptr %zf..tmp
  %rcc.tmp.630 = load i32, ptr %r_dst.11
  %rcc.tmp.631 = add i32 %rcc.tmp.630, 0
  %rcc.tmp.632 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.633 = getelementptr [16 x i32], ptr %rcc.tmp.632, i32 0, i32 %rcc.tmp.631
  %rcc.tmp.634 = load i32, ptr %rcc.tmp.633
  %rcc.tmp.635 = icmp eq i32 %rcc.tmp.634, 0
  store i1 %rcc.tmp.635, ptr %rcc.tmp.629
  %rcc.tmp.637 = load i32*, ptr %pc..tmp
  %rcc.tmp.638 = load i32*, ptr %pc..tmp
  %rcc.tmp.639 = load i32, ptr %rcc.tmp.638
  %rcc.tmp.640 = add i32 %rcc.tmp.639, 2
  store i32 %rcc.tmp.640, ptr %rcc.tmp.637
  br label %if.merge.19
if.else.19:
  %rcc.tmp.643 = load i32, ptr %opcode
  %rcc.tmp.644 = icmp eq i32 %rcc.tmp.643, 12
  br i1 %rcc.tmp.644, label %if.then.20, label %if.else.20
if.then.20:
  %rcc.tmp.646 = load i32*, ptr %pc..tmp
  %rcc.tmp.647 = load i32, ptr %rcc.tmp.646
  %rcc.tmp.648 = add i32 %rcc.tmp.647, 0
  %rcc.tmp.649 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.650 = getelementptr [2048 x i32], ptr %rcc.tmp.649, i32 0, i32 %rcc.tmp.648
  %rcc.tmp.651 = load i32, ptr %rcc.tmp.650
  store i32 %rcc.tmp.651, ptr %r_dst.12
  %rcc.tmp.653 = load i32*, ptr %pc..tmp
  %rcc.tmp.654 = load i32, ptr %rcc.tmp.653
  %rcc.tmp.655 = add i32 %rcc.tmp.654, 0
  %rcc.tmp.656 = add i32 %rcc.tmp.655, 1
  %rcc.tmp.657 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.658 = getelementptr [2048 x i32], ptr %rcc.tmp.657, i32 0, i32 %rcc.tmp.656
  %rcc.tmp.659 = load i32, ptr %rcc.tmp.658
  store i32 %rcc.tmp.659, ptr %imm.3
  %rcc.tmp.661 = load i32, ptr %r_dst.12
  %rcc.tmp.662 = add i32 %rcc.tmp.661, 0
  %rcc.tmp.663 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.664 = getelementptr [16 x i32], ptr %rcc.tmp.663, i32 0, i32 %rcc.tmp.662
  %rcc.tmp.665 = load i32, ptr %r_dst.12
  %rcc.tmp.666 = add i32 %rcc.tmp.665, 0
  %rcc.tmp.667 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.668 = getelementptr [16 x i32], ptr %rcc.tmp.667, i32 0, i32 %rcc.tmp.666
  %rcc.tmp.669 = load i32, ptr %rcc.tmp.668
  %rcc.tmp.670 = load i32, ptr %imm.3
  %rcc.tmp.671 = add i32 %rcc.tmp.670, 0
  %rcc.tmp.672 = ashr i32 %rcc.tmp.669, %rcc.tmp.671
  store i32 %rcc.tmp.672, ptr %rcc.tmp.664
  %rcc.tmp.674 = load i1*, ptr %zf..tmp
  %rcc.tmp.675 = load i32, ptr %r_dst.12
  %rcc.tmp.676 = add i32 %rcc.tmp.675, 0
  %rcc.tmp.677 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.678 = getelementptr [16 x i32], ptr %rcc.tmp.677, i32 0, i32 %rcc.tmp.676
  %rcc.tmp.679 = load i32, ptr %rcc.tmp.678
  %rcc.tmp.680 = icmp eq i32 %rcc.tmp.679, 0
  store i1 %rcc.tmp.680, ptr %rcc.tmp.674
  %rcc.tmp.682 = load i32*, ptr %pc..tmp
  %rcc.tmp.683 = load i32*, ptr %pc..tmp
  %rcc.tmp.684 = load i32, ptr %rcc.tmp.683
  %rcc.tmp.685 = add i32 %rcc.tmp.684, 2
  store i32 %rcc.tmp.685, ptr %rcc.tmp.682
  br label %if.merge.20
if.else.20:
  %rcc.tmp.688 = load i32, ptr %opcode
  %rcc.tmp.689 = icmp eq i32 %rcc.tmp.688, 13
  br i1 %rcc.tmp.689, label %if.then.21, label %if.else.21
if.then.21:
  %rcc.tmp.691 = load i32*, ptr %pc..tmp
  %rcc.tmp.692 = load i32, ptr %rcc.tmp.691
  %rcc.tmp.693 = add i32 %rcc.tmp.692, 0
  %rcc.tmp.694 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.695 = getelementptr [2048 x i32], ptr %rcc.tmp.694, i32 0, i32 %rcc.tmp.693
  %rcc.tmp.696 = load i32, ptr %rcc.tmp.695
  store i32 %rcc.tmp.696, ptr %r_src.9
  %rcc.tmp.698 = load i32*, ptr %sp..tmp
  %rcc.tmp.699 = load i32*, ptr %sp..tmp
  %rcc.tmp.700 = load i32, ptr %rcc.tmp.699
  %rcc.tmp.701 = sub i32 %rcc.tmp.700, 1
  store i32 %rcc.tmp.701, ptr %rcc.tmp.698
  %rcc.tmp.703 = load i32*, ptr %sp..tmp
  %rcc.tmp.704 = load i32, ptr %rcc.tmp.703
  %rcc.tmp.705 = add i32 %rcc.tmp.704, 0
  %rcc.tmp.706 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.707 = getelementptr [256 x i32], ptr %rcc.tmp.706, i32 0, i32 %rcc.tmp.705
  %rcc.tmp.708 = load i32, ptr %r_src.9
  %rcc.tmp.709 = add i32 %rcc.tmp.708, 0
  %rcc.tmp.710 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.711 = getelementptr [16 x i32], ptr %rcc.tmp.710, i32 0, i32 %rcc.tmp.709
  %rcc.tmp.712 = load i32, ptr %rcc.tmp.711
  store i32 %rcc.tmp.712, ptr %rcc.tmp.707
  %rcc.tmp.714 = load i32*, ptr %pc..tmp
  %rcc.tmp.715 = load i32*, ptr %pc..tmp
  %rcc.tmp.716 = load i32, ptr %rcc.tmp.715
  %rcc.tmp.717 = add i32 %rcc.tmp.716, 1
  store i32 %rcc.tmp.717, ptr %rcc.tmp.714
  br label %if.merge.21
if.else.21:
  %rcc.tmp.720 = load i32, ptr %opcode
  %rcc.tmp.721 = icmp eq i32 %rcc.tmp.720, 14
  br i1 %rcc.tmp.721, label %if.then.22, label %if.else.22
if.then.22:
  %rcc.tmp.723 = load i32*, ptr %pc..tmp
  %rcc.tmp.724 = load i32, ptr %rcc.tmp.723
  %rcc.tmp.725 = add i32 %rcc.tmp.724, 0
  %rcc.tmp.726 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.727 = getelementptr [2048 x i32], ptr %rcc.tmp.726, i32 0, i32 %rcc.tmp.725
  %rcc.tmp.728 = load i32, ptr %rcc.tmp.727
  store i32 %rcc.tmp.728, ptr %r_dst.13
  %rcc.tmp.730 = load i32, ptr %r_dst.13
  %rcc.tmp.731 = add i32 %rcc.tmp.730, 0
  %rcc.tmp.732 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.733 = getelementptr [16 x i32], ptr %rcc.tmp.732, i32 0, i32 %rcc.tmp.731
  %rcc.tmp.734 = load i32*, ptr %sp..tmp
  %rcc.tmp.735 = load i32, ptr %rcc.tmp.734
  %rcc.tmp.736 = add i32 %rcc.tmp.735, 0
  %rcc.tmp.737 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.738 = getelementptr [256 x i32], ptr %rcc.tmp.737, i32 0, i32 %rcc.tmp.736
  %rcc.tmp.739 = load i32, ptr %rcc.tmp.738
  store i32 %rcc.tmp.739, ptr %rcc.tmp.733
  %rcc.tmp.741 = load i32*, ptr %sp..tmp
  %rcc.tmp.742 = load i32*, ptr %sp..tmp
  %rcc.tmp.743 = load i32, ptr %rcc.tmp.742
  %rcc.tmp.744 = add i32 %rcc.tmp.743, 1
  store i32 %rcc.tmp.744, ptr %rcc.tmp.741
  %rcc.tmp.746 = load i32*, ptr %pc..tmp
  %rcc.tmp.747 = load i32*, ptr %pc..tmp
  %rcc.tmp.748 = load i32, ptr %rcc.tmp.747
  %rcc.tmp.749 = add i32 %rcc.tmp.748, 1
  store i32 %rcc.tmp.749, ptr %rcc.tmp.746
  br label %if.merge.22
if.else.22:
  %rcc.tmp.752 = load i32, ptr %opcode
  %rcc.tmp.753 = icmp eq i32 %rcc.tmp.752, 15
  br i1 %rcc.tmp.753, label %if.then.23, label %if.else.23
if.then.23:
  %rcc.tmp.755 = load i32*, ptr %pc..tmp
  %rcc.tmp.756 = load i32, ptr %rcc.tmp.755
  %rcc.tmp.757 = add i32 %rcc.tmp.756, 0
  %rcc.tmp.758 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.759 = getelementptr [2048 x i32], ptr %rcc.tmp.758, i32 0, i32 %rcc.tmp.757
  %rcc.tmp.760 = load i32, ptr %rcc.tmp.759
  store i32 %rcc.tmp.760, ptr %r_dst.14
  %rcc.tmp.762 = load i32*, ptr %pc..tmp
  %rcc.tmp.763 = load i32, ptr %rcc.tmp.762
  %rcc.tmp.764 = add i32 %rcc.tmp.763, 0
  %rcc.tmp.765 = add i32 %rcc.tmp.764, 1
  %rcc.tmp.766 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.767 = getelementptr [2048 x i32], ptr %rcc.tmp.766, i32 0, i32 %rcc.tmp.765
  %rcc.tmp.768 = load i32, ptr %rcc.tmp.767
  store i32 %rcc.tmp.768, ptr %r_addr
  %rcc.tmp.770 = load i32*, ptr %pc..tmp
  %rcc.tmp.771 = load i32, ptr %rcc.tmp.770
  %rcc.tmp.772 = add i32 %rcc.tmp.771, 0
  %rcc.tmp.773 = add i32 %rcc.tmp.772, 2
  %rcc.tmp.774 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.775 = getelementptr [2048 x i32], ptr %rcc.tmp.774, i32 0, i32 %rcc.tmp.773
  %rcc.tmp.776 = load i32, ptr %rcc.tmp.775
  store i32 %rcc.tmp.776, ptr %offset
  %rcc.tmp.778 = load i32, ptr %r_addr
  %rcc.tmp.779 = add i32 %rcc.tmp.778, 0
  %rcc.tmp.780 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.781 = getelementptr [16 x i32], ptr %rcc.tmp.780, i32 0, i32 %rcc.tmp.779
  %rcc.tmp.782 = load i32, ptr %rcc.tmp.781
  %rcc.tmp.783 = load i32, ptr %offset
  %rcc.tmp.784 = add i32 %rcc.tmp.782, %rcc.tmp.783
  store i32 %rcc.tmp.784, ptr %addr
  %rcc.tmp.786 = load i32, ptr %addr
  %rcc.tmp.787 = icmp sge i32 %rcc.tmp.786, 0
  br i1 %rcc.tmp.787, label %and.rhs.9, label %sc.merge.10
and.rhs.9:
  %rcc.tmp.789 = load i32, ptr %addr
  %rcc.tmp.790 = icmp slt i32 %rcc.tmp.789, 2048
  br label %sc.merge.10
sc.merge.10:
  %rcc.tmp.792 = phi i1 [0, %if.then.23], [%rcc.tmp.790, %and.rhs.9]
  br i1 %rcc.tmp.792, label %if.then.24, label %if.else.24
if.then.24:
  %rcc.tmp.794 = load i32, ptr %r_dst.14
  %rcc.tmp.795 = add i32 %rcc.tmp.794, 0
  %rcc.tmp.796 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.797 = getelementptr [16 x i32], ptr %rcc.tmp.796, i32 0, i32 %rcc.tmp.795
  %rcc.tmp.798 = load i32, ptr %addr
  %rcc.tmp.799 = add i32 %rcc.tmp.798, 0
  %rcc.tmp.800 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.801 = getelementptr [2048 x i32], ptr %rcc.tmp.800, i32 0, i32 %rcc.tmp.799
  %rcc.tmp.802 = load i32, ptr %rcc.tmp.801
  store i32 %rcc.tmp.802, ptr %rcc.tmp.797
  br label %if.merge.24
if.else.24:
  %rcc.tmp.805 = load i1*, ptr %halt..tmp
  store i1 1, ptr %rcc.tmp.805
  br label %if.merge.24
if.merge.24:
  %rcc.tmp.808 = load i32*, ptr %pc..tmp
  %rcc.tmp.809 = load i32*, ptr %pc..tmp
  %rcc.tmp.810 = load i32, ptr %rcc.tmp.809
  %rcc.tmp.811 = add i32 %rcc.tmp.810, 3
  store i32 %rcc.tmp.811, ptr %rcc.tmp.808
  br label %if.merge.23
if.else.23:
  %rcc.tmp.814 = load i32, ptr %opcode
  %rcc.tmp.815 = icmp eq i32 %rcc.tmp.814, 16
  br i1 %rcc.tmp.815, label %if.then.25, label %if.else.25
if.then.25:
  %rcc.tmp.817 = load i32*, ptr %pc..tmp
  %rcc.tmp.818 = load i32, ptr %rcc.tmp.817
  %rcc.tmp.819 = add i32 %rcc.tmp.818, 0
  %rcc.tmp.820 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.821 = getelementptr [2048 x i32], ptr %rcc.tmp.820, i32 0, i32 %rcc.tmp.819
  %rcc.tmp.822 = load i32, ptr %rcc.tmp.821
  store i32 %rcc.tmp.822, ptr %r_src.10
  %rcc.tmp.824 = load i32*, ptr %pc..tmp
  %rcc.tmp.825 = load i32, ptr %rcc.tmp.824
  %rcc.tmp.826 = add i32 %rcc.tmp.825, 0
  %rcc.tmp.827 = add i32 %rcc.tmp.826, 1
  %rcc.tmp.828 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.829 = getelementptr [2048 x i32], ptr %rcc.tmp.828, i32 0, i32 %rcc.tmp.827
  %rcc.tmp.830 = load i32, ptr %rcc.tmp.829
  store i32 %rcc.tmp.830, ptr %r_addr.2
  %rcc.tmp.832 = load i32*, ptr %pc..tmp
  %rcc.tmp.833 = load i32, ptr %rcc.tmp.832
  %rcc.tmp.834 = add i32 %rcc.tmp.833, 0
  %rcc.tmp.835 = add i32 %rcc.tmp.834, 2
  %rcc.tmp.836 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.837 = getelementptr [2048 x i32], ptr %rcc.tmp.836, i32 0, i32 %rcc.tmp.835
  %rcc.tmp.838 = load i32, ptr %rcc.tmp.837
  store i32 %rcc.tmp.838, ptr %offset.2
  %rcc.tmp.840 = load i32, ptr %r_addr.2
  %rcc.tmp.841 = add i32 %rcc.tmp.840, 0
  %rcc.tmp.842 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.843 = getelementptr [16 x i32], ptr %rcc.tmp.842, i32 0, i32 %rcc.tmp.841
  %rcc.tmp.844 = load i32, ptr %rcc.tmp.843
  %rcc.tmp.845 = load i32, ptr %offset.2
  %rcc.tmp.846 = add i32 %rcc.tmp.844, %rcc.tmp.845
  store i32 %rcc.tmp.846, ptr %addr.2
  %rcc.tmp.848 = load i32, ptr %addr.2
  %rcc.tmp.849 = icmp sge i32 %rcc.tmp.848, 0
  br i1 %rcc.tmp.849, label %and.rhs.10, label %sc.merge.11
and.rhs.10:
  %rcc.tmp.851 = load i32, ptr %addr.2
  %rcc.tmp.852 = icmp slt i32 %rcc.tmp.851, 2048
  br label %sc.merge.11
sc.merge.11:
  %rcc.tmp.854 = phi i1 [0, %if.then.25], [%rcc.tmp.852, %and.rhs.10]
  br i1 %rcc.tmp.854, label %if.then.26, label %if.else.26
if.then.26:
  %rcc.tmp.856 = load i32, ptr %addr.2
  %rcc.tmp.857 = add i32 %rcc.tmp.856, 0
  %rcc.tmp.858 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.859 = getelementptr [2048 x i32], ptr %rcc.tmp.858, i32 0, i32 %rcc.tmp.857
  %rcc.tmp.860 = load i32, ptr %r_src.10
  %rcc.tmp.861 = add i32 %rcc.tmp.860, 0
  %rcc.tmp.862 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.863 = getelementptr [16 x i32], ptr %rcc.tmp.862, i32 0, i32 %rcc.tmp.861
  %rcc.tmp.864 = load i32, ptr %rcc.tmp.863
  store i32 %rcc.tmp.864, ptr %rcc.tmp.859
  br label %if.merge.26
if.else.26:
  %rcc.tmp.867 = load i1*, ptr %halt..tmp
  store i1 1, ptr %rcc.tmp.867
  br label %if.merge.26
if.merge.26:
  %rcc.tmp.870 = load i32*, ptr %pc..tmp
  %rcc.tmp.871 = load i32*, ptr %pc..tmp
  %rcc.tmp.872 = load i32, ptr %rcc.tmp.871
  %rcc.tmp.873 = add i32 %rcc.tmp.872, 3
  store i32 %rcc.tmp.873, ptr %rcc.tmp.870
  br label %if.merge.25
if.else.25:
  %rcc.tmp.876 = load i32, ptr %opcode
  %rcc.tmp.877 = icmp eq i32 %rcc.tmp.876, 17
  br i1 %rcc.tmp.877, label %if.then.27, label %if.else.27
if.then.27:
  %rcc.tmp.879 = load i32*, ptr %pc..tmp
  %rcc.tmp.880 = load i32*, ptr %pc..tmp
  %rcc.tmp.881 = load i32, ptr %rcc.tmp.880
  %rcc.tmp.882 = add i32 %rcc.tmp.881, 0
  %rcc.tmp.883 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.884 = getelementptr [2048 x i32], ptr %rcc.tmp.883, i32 0, i32 %rcc.tmp.882
  %rcc.tmp.885 = load i32, ptr %rcc.tmp.884
  store i32 %rcc.tmp.885, ptr %rcc.tmp.879
  br label %if.merge.27
if.else.27:
  %rcc.tmp.888 = load i32, ptr %opcode
  %rcc.tmp.889 = icmp eq i32 %rcc.tmp.888, 18
  br i1 %rcc.tmp.889, label %if.then.28, label %if.else.28
if.then.28:
  %rcc.tmp.891 = load i1*, ptr %zf..tmp
  %rcc.tmp.892 = load i1, ptr %rcc.tmp.891
  br i1 %rcc.tmp.892, label %if.then.29, label %if.else.29
if.then.29:
  %rcc.tmp.894 = load i32*, ptr %pc..tmp
  %rcc.tmp.895 = load i32*, ptr %pc..tmp
  %rcc.tmp.896 = load i32, ptr %rcc.tmp.895
  %rcc.tmp.897 = add i32 %rcc.tmp.896, 0
  %rcc.tmp.898 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.899 = getelementptr [2048 x i32], ptr %rcc.tmp.898, i32 0, i32 %rcc.tmp.897
  %rcc.tmp.900 = load i32, ptr %rcc.tmp.899
  store i32 %rcc.tmp.900, ptr %rcc.tmp.894
  br label %if.merge.29
if.else.29:
  %rcc.tmp.903 = load i32*, ptr %pc..tmp
  %rcc.tmp.904 = load i32*, ptr %pc..tmp
  %rcc.tmp.905 = load i32, ptr %rcc.tmp.904
  %rcc.tmp.906 = add i32 %rcc.tmp.905, 1
  store i32 %rcc.tmp.906, ptr %rcc.tmp.903
  br label %if.merge.29
if.merge.29:
  br label %if.merge.28
if.else.28:
  %rcc.tmp.910 = load i32, ptr %opcode
  %rcc.tmp.911 = icmp eq i32 %rcc.tmp.910, 19
  br i1 %rcc.tmp.911, label %if.then.30, label %if.else.30
if.then.30:
  %rcc.tmp.913 = load i1*, ptr %zf..tmp
  %rcc.tmp.914 = load i1, ptr %rcc.tmp.913
  %rcc.tmp.915 = xor i1 %rcc.tmp.914, true
  br i1 %rcc.tmp.915, label %if.then.31, label %if.else.31
if.then.31:
  %rcc.tmp.917 = load i32*, ptr %pc..tmp
  %rcc.tmp.918 = load i32*, ptr %pc..tmp
  %rcc.tmp.919 = load i32, ptr %rcc.tmp.918
  %rcc.tmp.920 = add i32 %rcc.tmp.919, 0
  %rcc.tmp.921 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.922 = getelementptr [2048 x i32], ptr %rcc.tmp.921, i32 0, i32 %rcc.tmp.920
  %rcc.tmp.923 = load i32, ptr %rcc.tmp.922
  store i32 %rcc.tmp.923, ptr %rcc.tmp.917
  br label %if.merge.31
if.else.31:
  %rcc.tmp.926 = load i32*, ptr %pc..tmp
  %rcc.tmp.927 = load i32*, ptr %pc..tmp
  %rcc.tmp.928 = load i32, ptr %rcc.tmp.927
  %rcc.tmp.929 = add i32 %rcc.tmp.928, 1
  store i32 %rcc.tmp.929, ptr %rcc.tmp.926
  br label %if.merge.31
if.merge.31:
  br label %if.merge.30
if.else.30:
  %rcc.tmp.933 = load i32, ptr %opcode
  %rcc.tmp.934 = icmp eq i32 %rcc.tmp.933, 20
  br i1 %rcc.tmp.934, label %if.then.32, label %if.else.32
if.then.32:
  %rcc.tmp.936 = load i1*, ptr %cf..tmp
  %rcc.tmp.937 = load i1, ptr %rcc.tmp.936
  br i1 %rcc.tmp.937, label %if.then.33, label %if.else.33
if.then.33:
  %rcc.tmp.939 = load i32*, ptr %pc..tmp
  %rcc.tmp.940 = load i32*, ptr %pc..tmp
  %rcc.tmp.941 = load i32, ptr %rcc.tmp.940
  %rcc.tmp.942 = add i32 %rcc.tmp.941, 0
  %rcc.tmp.943 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.944 = getelementptr [2048 x i32], ptr %rcc.tmp.943, i32 0, i32 %rcc.tmp.942
  %rcc.tmp.945 = load i32, ptr %rcc.tmp.944
  store i32 %rcc.tmp.945, ptr %rcc.tmp.939
  br label %if.merge.33
if.else.33:
  %rcc.tmp.948 = load i32*, ptr %pc..tmp
  %rcc.tmp.949 = load i32*, ptr %pc..tmp
  %rcc.tmp.950 = load i32, ptr %rcc.tmp.949
  %rcc.tmp.951 = add i32 %rcc.tmp.950, 1
  store i32 %rcc.tmp.951, ptr %rcc.tmp.948
  br label %if.merge.33
if.merge.33:
  br label %if.merge.32
if.else.32:
  %rcc.tmp.955 = load i32, ptr %opcode
  %rcc.tmp.956 = icmp eq i32 %rcc.tmp.955, 21
  br i1 %rcc.tmp.956, label %if.then.34, label %if.else.34
if.then.34:
  %rcc.tmp.958 = load i1*, ptr %cf..tmp
  %rcc.tmp.959 = load i1, ptr %rcc.tmp.958
  %rcc.tmp.960 = xor i1 %rcc.tmp.959, true
  br i1 %rcc.tmp.960, label %if.then.35, label %if.else.35
if.then.35:
  %rcc.tmp.962 = load i32*, ptr %pc..tmp
  %rcc.tmp.963 = load i32*, ptr %pc..tmp
  %rcc.tmp.964 = load i32, ptr %rcc.tmp.963
  %rcc.tmp.965 = add i32 %rcc.tmp.964, 0
  %rcc.tmp.966 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.967 = getelementptr [2048 x i32], ptr %rcc.tmp.966, i32 0, i32 %rcc.tmp.965
  %rcc.tmp.968 = load i32, ptr %rcc.tmp.967
  store i32 %rcc.tmp.968, ptr %rcc.tmp.962
  br label %if.merge.35
if.else.35:
  %rcc.tmp.971 = load i32*, ptr %pc..tmp
  %rcc.tmp.972 = load i32*, ptr %pc..tmp
  %rcc.tmp.973 = load i32, ptr %rcc.tmp.972
  %rcc.tmp.974 = add i32 %rcc.tmp.973, 1
  store i32 %rcc.tmp.974, ptr %rcc.tmp.971
  br label %if.merge.35
if.merge.35:
  br label %if.merge.34
if.else.34:
  %rcc.tmp.978 = load i32, ptr %opcode
  %rcc.tmp.979 = icmp eq i32 %rcc.tmp.978, 22
  br i1 %rcc.tmp.979, label %if.then.36, label %if.else.36
if.then.36:
  %rcc.tmp.981 = load i32*, ptr %sp..tmp
  %rcc.tmp.982 = load i32*, ptr %sp..tmp
  %rcc.tmp.983 = load i32, ptr %rcc.tmp.982
  %rcc.tmp.984 = sub i32 %rcc.tmp.983, 1
  store i32 %rcc.tmp.984, ptr %rcc.tmp.981
  %rcc.tmp.986 = load i32*, ptr %sp..tmp
  %rcc.tmp.987 = load i32, ptr %rcc.tmp.986
  %rcc.tmp.988 = add i32 %rcc.tmp.987, 0
  %rcc.tmp.989 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.990 = getelementptr [256 x i32], ptr %rcc.tmp.989, i32 0, i32 %rcc.tmp.988
  %rcc.tmp.991 = load i32*, ptr %pc..tmp
  %rcc.tmp.992 = load i32, ptr %rcc.tmp.991
  %rcc.tmp.993 = add i32 %rcc.tmp.992, 1
  store i32 %rcc.tmp.993, ptr %rcc.tmp.990
  %rcc.tmp.995 = load i32*, ptr %pc..tmp
  %rcc.tmp.996 = load i32*, ptr %pc..tmp
  %rcc.tmp.997 = load i32, ptr %rcc.tmp.996
  %rcc.tmp.998 = add i32 %rcc.tmp.997, 0
  %rcc.tmp.999 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.1000 = getelementptr [2048 x i32], ptr %rcc.tmp.999, i32 0, i32 %rcc.tmp.998
  %rcc.tmp.1001 = load i32, ptr %rcc.tmp.1000
  store i32 %rcc.tmp.1001, ptr %rcc.tmp.995
  br label %if.merge.36
if.else.36:
  %rcc.tmp.1004 = load i32, ptr %opcode
  %rcc.tmp.1005 = icmp eq i32 %rcc.tmp.1004, 23
  br i1 %rcc.tmp.1005, label %if.then.37, label %if.else.37
if.then.37:
  %rcc.tmp.1007 = load i32*, ptr %pc..tmp
  %rcc.tmp.1008 = load i32*, ptr %sp..tmp
  %rcc.tmp.1009 = load i32, ptr %rcc.tmp.1008
  %rcc.tmp.1010 = add i32 %rcc.tmp.1009, 0
  %rcc.tmp.1011 = load [256 x i32]*, ptr %stack..tmp
  %rcc.tmp.1012 = getelementptr [256 x i32], ptr %rcc.tmp.1011, i32 0, i32 %rcc.tmp.1010
  %rcc.tmp.1013 = load i32, ptr %rcc.tmp.1012
  store i32 %rcc.tmp.1013, ptr %rcc.tmp.1007
  %rcc.tmp.1015 = load i32*, ptr %sp..tmp
  %rcc.tmp.1016 = load i32*, ptr %sp..tmp
  %rcc.tmp.1017 = load i32, ptr %rcc.tmp.1016
  %rcc.tmp.1018 = add i32 %rcc.tmp.1017, 1
  store i32 %rcc.tmp.1018, ptr %rcc.tmp.1015
  br label %if.merge.37
if.else.37:
  %rcc.tmp.1021 = load i32, ptr %opcode
  %rcc.tmp.1022 = icmp eq i32 %rcc.tmp.1021, 24
  br i1 %rcc.tmp.1022, label %if.then.38, label %if.else.38
if.then.38:
  %rcc.tmp.1024 = load i32*, ptr %pc..tmp
  %rcc.tmp.1025 = load i32, ptr %rcc.tmp.1024
  %rcc.tmp.1026 = add i32 %rcc.tmp.1025, 0
  %rcc.tmp.1027 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.1028 = getelementptr [2048 x i32], ptr %rcc.tmp.1027, i32 0, i32 %rcc.tmp.1026
  %rcc.tmp.1029 = load i32, ptr %rcc.tmp.1028
  store i32 %rcc.tmp.1029, ptr %r1
  %rcc.tmp.1031 = load i32*, ptr %pc..tmp
  %rcc.tmp.1032 = load i32, ptr %rcc.tmp.1031
  %rcc.tmp.1033 = add i32 %rcc.tmp.1032, 0
  %rcc.tmp.1034 = add i32 %rcc.tmp.1033, 1
  %rcc.tmp.1035 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.1036 = getelementptr [2048 x i32], ptr %rcc.tmp.1035, i32 0, i32 %rcc.tmp.1034
  %rcc.tmp.1037 = load i32, ptr %rcc.tmp.1036
  store i32 %rcc.tmp.1037, ptr %r2
  %rcc.tmp.1039 = load i32, ptr %r1
  %rcc.tmp.1040 = add i32 %rcc.tmp.1039, 0
  %rcc.tmp.1041 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.1042 = getelementptr [16 x i32], ptr %rcc.tmp.1041, i32 0, i32 %rcc.tmp.1040
  %rcc.tmp.1043 = load i32, ptr %rcc.tmp.1042
  store i32 %rcc.tmp.1043, ptr %val1
  %rcc.tmp.1045 = load i32, ptr %r2
  %rcc.tmp.1046 = add i32 %rcc.tmp.1045, 0
  %rcc.tmp.1047 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.1048 = getelementptr [16 x i32], ptr %rcc.tmp.1047, i32 0, i32 %rcc.tmp.1046
  %rcc.tmp.1049 = load i32, ptr %rcc.tmp.1048
  store i32 %rcc.tmp.1049, ptr %val2
  %rcc.tmp.1051 = load i1*, ptr %zf..tmp
  %rcc.tmp.1052 = load i32, ptr %val1
  %rcc.tmp.1053 = load i32, ptr %val2
  %rcc.tmp.1054 = icmp eq i32 %rcc.tmp.1052, %rcc.tmp.1053
  store i1 %rcc.tmp.1054, ptr %rcc.tmp.1051
  %rcc.tmp.1056 = load i1*, ptr %cf..tmp
  %rcc.tmp.1057 = load i32, ptr %val1
  %rcc.tmp.1058 = load i32, ptr %val2
  %rcc.tmp.1059 = icmp slt i32 %rcc.tmp.1057, %rcc.tmp.1058
  store i1 %rcc.tmp.1059, ptr %rcc.tmp.1056
  %rcc.tmp.1061 = load i32*, ptr %pc..tmp
  %rcc.tmp.1062 = load i32*, ptr %pc..tmp
  %rcc.tmp.1063 = load i32, ptr %rcc.tmp.1062
  %rcc.tmp.1064 = add i32 %rcc.tmp.1063, 2
  store i32 %rcc.tmp.1064, ptr %rcc.tmp.1061
  br label %if.merge.38
if.else.38:
  %rcc.tmp.1067 = load i32, ptr %opcode
  %rcc.tmp.1068 = icmp eq i32 %rcc.tmp.1067, 25
  br i1 %rcc.tmp.1068, label %if.then.39, label %if.else.39
if.then.39:
  %rcc.tmp.1070 = load i32*, ptr %pc..tmp
  %rcc.tmp.1071 = load i32, ptr %rcc.tmp.1070
  %rcc.tmp.1072 = add i32 %rcc.tmp.1071, 0
  %rcc.tmp.1073 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.1074 = getelementptr [2048 x i32], ptr %rcc.tmp.1073, i32 0, i32 %rcc.tmp.1072
  %rcc.tmp.1075 = load i32, ptr %rcc.tmp.1074
  store i32 %rcc.tmp.1075, ptr %r1.2
  %rcc.tmp.1077 = load i32*, ptr %pc..tmp
  %rcc.tmp.1078 = load i32, ptr %rcc.tmp.1077
  %rcc.tmp.1079 = add i32 %rcc.tmp.1078, 0
  %rcc.tmp.1080 = add i32 %rcc.tmp.1079, 1
  %rcc.tmp.1081 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.1082 = getelementptr [2048 x i32], ptr %rcc.tmp.1081, i32 0, i32 %rcc.tmp.1080
  %rcc.tmp.1083 = load i32, ptr %rcc.tmp.1082
  store i32 %rcc.tmp.1083, ptr %imm.4
  %rcc.tmp.1085 = load i32, ptr %r1.2
  %rcc.tmp.1086 = add i32 %rcc.tmp.1085, 0
  %rcc.tmp.1087 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.1088 = getelementptr [16 x i32], ptr %rcc.tmp.1087, i32 0, i32 %rcc.tmp.1086
  %rcc.tmp.1089 = load i32, ptr %rcc.tmp.1088
  store i32 %rcc.tmp.1089, ptr %val1.2
  %rcc.tmp.1091 = load i1*, ptr %zf..tmp
  %rcc.tmp.1092 = load i32, ptr %val1.2
  %rcc.tmp.1093 = load i32, ptr %imm.4
  %rcc.tmp.1094 = icmp eq i32 %rcc.tmp.1092, %rcc.tmp.1093
  store i1 %rcc.tmp.1094, ptr %rcc.tmp.1091
  %rcc.tmp.1096 = load i1*, ptr %cf..tmp
  %rcc.tmp.1097 = load i32, ptr %val1.2
  %rcc.tmp.1098 = load i32, ptr %imm.4
  %rcc.tmp.1099 = icmp slt i32 %rcc.tmp.1097, %rcc.tmp.1098
  store i1 %rcc.tmp.1099, ptr %rcc.tmp.1096
  %rcc.tmp.1101 = load i32*, ptr %pc..tmp
  %rcc.tmp.1102 = load i32*, ptr %pc..tmp
  %rcc.tmp.1103 = load i32, ptr %rcc.tmp.1102
  %rcc.tmp.1104 = add i32 %rcc.tmp.1103, 2
  store i32 %rcc.tmp.1104, ptr %rcc.tmp.1101
  br label %if.merge.39
if.else.39:
  %rcc.tmp.1107 = load i32, ptr %opcode
  %rcc.tmp.1108 = icmp eq i32 %rcc.tmp.1107, 26
  br i1 %rcc.tmp.1108, label %if.then.40, label %if.else.40
if.then.40:
  %rcc.tmp.1110 = load i32*, ptr %pc..tmp
  %rcc.tmp.1111 = load i32, ptr %rcc.tmp.1110
  %rcc.tmp.1112 = add i32 %rcc.tmp.1111, 0
  %rcc.tmp.1113 = load [2048 x i32]*, ptr %memory..tmp
  %rcc.tmp.1114 = getelementptr [2048 x i32], ptr %rcc.tmp.1113, i32 0, i32 %rcc.tmp.1112
  %rcc.tmp.1115 = load i32, ptr %rcc.tmp.1114
  store i32 %rcc.tmp.1115, ptr %r_src.11
  %rcc.tmp.1117 = load i32, ptr %r_src.11
  %rcc.tmp.1118 = add i32 %rcc.tmp.1117, 0
  %rcc.tmp.1119 = load [16 x i32]*, ptr %registers..tmp
  %rcc.tmp.1120 = getelementptr [16 x i32], ptr %rcc.tmp.1119, i32 0, i32 %rcc.tmp.1118
  %rcc.tmp.1121 = load i32, ptr %rcc.tmp.1120
  call void @printlnInt.(i32 %rcc.tmp.1121)
  %rcc.tmp.1123 = load i32*, ptr %pc..tmp
  %rcc.tmp.1124 = load i32*, ptr %pc..tmp
  %rcc.tmp.1125 = load i32, ptr %rcc.tmp.1124
  %rcc.tmp.1126 = add i32 %rcc.tmp.1125, 1
  store i32 %rcc.tmp.1126, ptr %rcc.tmp.1123
  br label %if.merge.40
if.else.40:
  %rcc.tmp.1129 = load i1*, ptr %halt..tmp
  store i1 1, ptr %rcc.tmp.1129
  br label %if.merge.40
if.merge.40:
  br label %if.merge.39
if.merge.39:
  br label %if.merge.38
if.merge.38:
  br label %if.merge.37
if.merge.37:
  br label %if.merge.36
if.merge.36:
  br label %if.merge.34
if.merge.34:
  br label %if.merge.32
if.merge.32:
  br label %if.merge.30
if.merge.30:
  br label %if.merge.28
if.merge.28:
  br label %if.merge.27
if.merge.27:
  br label %if.merge.25
if.merge.25:
  br label %if.merge.23
if.merge.23:
  br label %if.merge.22
if.merge.22:
  br label %if.merge.21
if.merge.21:
  br label %if.merge.20
if.merge.20:
  br label %if.merge.19
if.merge.19:
  br label %if.merge.18
if.merge.18:
  br label %if.merge.17
if.merge.17:
  br label %if.merge.16
if.merge.16:
  br label %if.merge.15
if.merge.15:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.9
if.merge.9:
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
  br label %while.cond
while.end:
  ret void
}
define void @main() {
entry:
  %registers = alloca [16 x i32] 
  %memory = alloca [2048 x i32] 
  %fill.idx = alloca i32 
  %stack = alloca [256 x i32] 
  %fill.idx.2 = alloca i32 
  %pc = alloca i32 
  %sp = alloca i32 
  %zf = alloca i1 
  %cf = alloca i1 
  %halt = alloca i1 
  %rcc.tmp.1 = getelementptr [16 x i32], ptr %registers, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.1
  %rcc.tmp.3 = getelementptr [16 x i32], ptr %registers, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.3
  %rcc.tmp.5 = getelementptr [16 x i32], ptr %registers, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.5
  %rcc.tmp.7 = getelementptr [16 x i32], ptr %registers, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.7
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %registers, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.9
  %rcc.tmp.11 = getelementptr [16 x i32], ptr %registers, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %registers, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [16 x i32], ptr %registers, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %registers, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %registers, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %registers, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [16 x i32], ptr %registers, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %registers, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [16 x i32], ptr %registers, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %registers, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [16 x i32], ptr %registers, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.31
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.35 = load i32, ptr %fill.idx
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 2048
  br i1 %rcc.tmp.36, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.38 = load i32, ptr %fill.idx
  %rcc.tmp.39 = getelementptr [2048 x i32], ptr %memory, i32 0, i32 %rcc.tmp.38
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = add i32 %rcc.tmp.38, 1
  store i32 %rcc.tmp.41, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.46 = load i32, ptr %fill.idx.2
  %rcc.tmp.47 = icmp slt i32 %rcc.tmp.46, 256
  br i1 %rcc.tmp.47, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.49 = load i32, ptr %fill.idx.2
  %rcc.tmp.50 = getelementptr [256 x i32], ptr %stack, i32 0, i32 %rcc.tmp.49
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = add i32 %rcc.tmp.49, 1
  store i32 %rcc.tmp.52, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %pc
  store i32 0, ptr %sp
  store i1 0, ptr %zf
  store i1 0, ptr %cf
  store i1 0, ptr %halt
  call void @init_vm.([16 x i32]* %registers, [2048 x i32]* %memory, [256 x i32]* %stack, i32* %pc, i32* %sp, i1* %zf, i1* %cf, i1* %halt)
  call void @load_program.([2048 x i32]* %memory)
  call void @fetch_decode_execute.([16 x i32]* %registers, [2048 x i32]* %memory, [256 x i32]* %stack, i32* %pc, i32* %sp, i1* %zf, i1* %cf, i1* %halt)
  %rcc.tmp.63 = load i1, ptr %halt
  br i1 %rcc.tmp.63, label %if.then, label %if.else
if.then:
  call void @printlnInt.(i32 1337)
  br label %if.merge
if.else:
  call void @printlnInt.(i32 9999)
  br label %if.merge
if.merge:
  call void @exit.(i32 0)
  ret void
}
