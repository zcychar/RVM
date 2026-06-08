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
%Vec3 = type {i32, i32, i32}
%Ray = type {%Vec3, %Vec3}
%Sphere = type {%Vec3, i32, %Vec3}
%Light = type {%Vec3, i32}
define void @setup_scene.([4 x %Sphere]* %spheres.tmp, [2 x %Light]* %lights.tmp) {
entry:
  %spheres..tmp = alloca [4 x %Sphere]* 
  %lights..tmp = alloca [2 x %Light]* 
  store [4 x %Sphere]* %spheres.tmp, ptr %spheres..tmp
  store [2 x %Light]* %lights.tmp, ptr %lights..tmp
  %rcc.tmp.3 = load [4 x %Sphere]*, ptr %spheres..tmp
  %rcc.tmp.4 = getelementptr [4 x %Sphere], ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = getelementptr %Sphere, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = getelementptr %Vec3, ptr %rcc.tmp.5, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr %Vec3, ptr %rcc.tmp.5, i32 0, i32 1
  %rcc.tmp.9 = sub i32 0, 1
  %rcc.tmp.10 = mul i32 %rcc.tmp.9, 80
  store i32 %rcc.tmp.10, ptr %rcc.tmp.8
  %rcc.tmp.12 = getelementptr %Vec3, ptr %rcc.tmp.5, i32 0, i32 2
  %rcc.tmp.13 = mul i32 3, 80
  store i32 %rcc.tmp.13, ptr %rcc.tmp.12
  %rcc.tmp.15 = getelementptr %Sphere, ptr %rcc.tmp.4, i32 0, i32 1
  %rcc.tmp.16 = mul i32 1, 80
  store i32 %rcc.tmp.16, ptr %rcc.tmp.15
  %rcc.tmp.18 = getelementptr %Sphere, ptr %rcc.tmp.4, i32 0, i32 2
  %rcc.tmp.19 = getelementptr %Vec3, ptr %rcc.tmp.18, i32 0, i32 0
  store i32 255, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr %Vec3, ptr %rcc.tmp.18, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr %Vec3, ptr %rcc.tmp.18, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = load [4 x %Sphere]*, ptr %spheres..tmp
  %rcc.tmp.26 = getelementptr [4 x %Sphere], ptr %rcc.tmp.25, i32 0, i32 1
  %rcc.tmp.27 = getelementptr %Sphere, ptr %rcc.tmp.26, i32 0, i32 0
  %rcc.tmp.28 = getelementptr %Vec3, ptr %rcc.tmp.27, i32 0, i32 0
  %rcc.tmp.29 = mul i32 2, 80
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = getelementptr %Vec3, ptr %rcc.tmp.27, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr %Vec3, ptr %rcc.tmp.27, i32 0, i32 2
  %rcc.tmp.34 = mul i32 4, 80
  store i32 %rcc.tmp.34, ptr %rcc.tmp.33
  %rcc.tmp.36 = getelementptr %Sphere, ptr %rcc.tmp.26, i32 0, i32 1
  %rcc.tmp.37 = mul i32 1, 80
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = getelementptr %Sphere, ptr %rcc.tmp.26, i32 0, i32 2
  %rcc.tmp.40 = getelementptr %Vec3, ptr %rcc.tmp.39, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.40
  %rcc.tmp.42 = getelementptr %Vec3, ptr %rcc.tmp.39, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.42
  %rcc.tmp.44 = getelementptr %Vec3, ptr %rcc.tmp.39, i32 0, i32 2
  store i32 255, ptr %rcc.tmp.44
  %rcc.tmp.46 = load [4 x %Sphere]*, ptr %spheres..tmp
  %rcc.tmp.47 = getelementptr [4 x %Sphere], ptr %rcc.tmp.46, i32 0, i32 2
  %rcc.tmp.48 = getelementptr %Sphere, ptr %rcc.tmp.47, i32 0, i32 0
  %rcc.tmp.49 = getelementptr %Vec3, ptr %rcc.tmp.48, i32 0, i32 0
  %rcc.tmp.50 = sub i32 0, 2
  %rcc.tmp.51 = mul i32 %rcc.tmp.50, 80
  store i32 %rcc.tmp.51, ptr %rcc.tmp.49
  %rcc.tmp.53 = getelementptr %Vec3, ptr %rcc.tmp.48, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr %Vec3, ptr %rcc.tmp.48, i32 0, i32 2
  %rcc.tmp.56 = mul i32 4, 80
  store i32 %rcc.tmp.56, ptr %rcc.tmp.55
  %rcc.tmp.58 = getelementptr %Sphere, ptr %rcc.tmp.47, i32 0, i32 1
  %rcc.tmp.59 = mul i32 1, 80
  store i32 %rcc.tmp.59, ptr %rcc.tmp.58
  %rcc.tmp.61 = getelementptr %Sphere, ptr %rcc.tmp.47, i32 0, i32 2
  %rcc.tmp.62 = getelementptr %Vec3, ptr %rcc.tmp.61, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr %Vec3, ptr %rcc.tmp.61, i32 0, i32 1
  store i32 255, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr %Vec3, ptr %rcc.tmp.61, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.66
  %rcc.tmp.68 = load [4 x %Sphere]*, ptr %spheres..tmp
  %rcc.tmp.69 = getelementptr [4 x %Sphere], ptr %rcc.tmp.68, i32 0, i32 3
  %rcc.tmp.70 = getelementptr %Sphere, ptr %rcc.tmp.69, i32 0, i32 0
  %rcc.tmp.71 = getelementptr %Vec3, ptr %rcc.tmp.70, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr %Vec3, ptr %rcc.tmp.70, i32 0, i32 1
  %rcc.tmp.74 = sub i32 0, 201
  %rcc.tmp.75 = mul i32 %rcc.tmp.74, 80
  store i32 %rcc.tmp.75, ptr %rcc.tmp.73
  %rcc.tmp.77 = getelementptr %Vec3, ptr %rcc.tmp.70, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr %Sphere, ptr %rcc.tmp.69, i32 0, i32 1
  %rcc.tmp.80 = mul i32 200, 80
  store i32 %rcc.tmp.80, ptr %rcc.tmp.79
  %rcc.tmp.82 = getelementptr %Sphere, ptr %rcc.tmp.69, i32 0, i32 2
  %rcc.tmp.83 = getelementptr %Vec3, ptr %rcc.tmp.82, i32 0, i32 0
  store i32 200, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr %Vec3, ptr %rcc.tmp.82, i32 0, i32 1
  store i32 200, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr %Vec3, ptr %rcc.tmp.82, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = load [2 x %Light]*, ptr %lights..tmp
  %rcc.tmp.90 = getelementptr [2 x %Light], ptr %rcc.tmp.89, i32 0, i32 0
  %rcc.tmp.91 = getelementptr %Light, ptr %rcc.tmp.90, i32 0, i32 0
  %rcc.tmp.92 = getelementptr %Vec3, ptr %rcc.tmp.91, i32 0, i32 0
  %rcc.tmp.93 = sub i32 0, 20
  %rcc.tmp.94 = mul i32 %rcc.tmp.93, 80
  store i32 %rcc.tmp.94, ptr %rcc.tmp.92
  %rcc.tmp.96 = getelementptr %Vec3, ptr %rcc.tmp.91, i32 0, i32 1
  %rcc.tmp.97 = mul i32 20, 80
  store i32 %rcc.tmp.97, ptr %rcc.tmp.96
  %rcc.tmp.99 = getelementptr %Vec3, ptr %rcc.tmp.91, i32 0, i32 2
  %rcc.tmp.100 = sub i32 0, 20
  %rcc.tmp.101 = mul i32 %rcc.tmp.100, 80
  store i32 %rcc.tmp.101, ptr %rcc.tmp.99
  %rcc.tmp.103 = getelementptr %Light, ptr %rcc.tmp.90, i32 0, i32 1
  store i32 150, ptr %rcc.tmp.103
  %rcc.tmp.105 = load [2 x %Light]*, ptr %lights..tmp
  %rcc.tmp.106 = getelementptr [2 x %Light], ptr %rcc.tmp.105, i32 0, i32 1
  %rcc.tmp.107 = getelementptr %Light, ptr %rcc.tmp.106, i32 0, i32 0
  %rcc.tmp.108 = getelementptr %Vec3, ptr %rcc.tmp.107, i32 0, i32 0
  %rcc.tmp.109 = mul i32 20, 80
  store i32 %rcc.tmp.109, ptr %rcc.tmp.108
  %rcc.tmp.111 = getelementptr %Vec3, ptr %rcc.tmp.107, i32 0, i32 1
  %rcc.tmp.112 = mul i32 30, 80
  store i32 %rcc.tmp.112, ptr %rcc.tmp.111
  %rcc.tmp.114 = getelementptr %Vec3, ptr %rcc.tmp.107, i32 0, i32 2
  %rcc.tmp.115 = sub i32 0, 10
  %rcc.tmp.116 = mul i32 %rcc.tmp.115, 80
  store i32 %rcc.tmp.116, ptr %rcc.tmp.114
  %rcc.tmp.118 = getelementptr %Light, ptr %rcc.tmp.106, i32 0, i32 1
  store i32 120, ptr %rcc.tmp.118
  ret void
}
define i32 @vec_dot.(%Vec3* %a.tmp, %Vec3* %b.tmp) {
entry:
  %a..tmp = alloca %Vec3* 
  %b..tmp = alloca %Vec3* 
  store %Vec3* %a.tmp, ptr %a..tmp
  store %Vec3* %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = load %Vec3*, ptr %a..tmp
  %rcc.tmp.4 = getelementptr %Vec3, ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = load %Vec3*, ptr %b..tmp
  %rcc.tmp.7 = getelementptr %Vec3, ptr %rcc.tmp.6, i32 0, i32 0
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  %rcc.tmp.9 = mul i32 %rcc.tmp.5, %rcc.tmp.8
  %rcc.tmp.10 = load %Vec3*, ptr %a..tmp
  %rcc.tmp.11 = getelementptr %Vec3, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = load i32, ptr %rcc.tmp.11
  %rcc.tmp.13 = load %Vec3*, ptr %b..tmp
  %rcc.tmp.14 = getelementptr %Vec3, ptr %rcc.tmp.13, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = mul i32 %rcc.tmp.12, %rcc.tmp.15
  %rcc.tmp.17 = add i32 %rcc.tmp.9, %rcc.tmp.16
  %rcc.tmp.18 = load %Vec3*, ptr %a..tmp
  %rcc.tmp.19 = getelementptr %Vec3, ptr %rcc.tmp.18, i32 0, i32 2
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load %Vec3*, ptr %b..tmp
  %rcc.tmp.22 = getelementptr %Vec3, ptr %rcc.tmp.21, i32 0, i32 2
  %rcc.tmp.23 = load i32, ptr %rcc.tmp.22
  %rcc.tmp.24 = mul i32 %rcc.tmp.20, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.17, %rcc.tmp.24
  %rcc.tmp.26 = sdiv i32 %rcc.tmp.25, 80
  ret i32 %rcc.tmp.26
}
define void @vec_sub.(%Vec3* sret(%Vec3) %ret.slot, %Vec3* %a.tmp, %Vec3* %b.tmp) {
entry:
  %a..tmp = alloca %Vec3* 
  %b..tmp = alloca %Vec3* 
  store %Vec3* %a.tmp, ptr %a..tmp
  store %Vec3* %b.tmp, ptr %b..tmp
  %rcc.tmp.3 = getelementptr %Vec3, ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.4 = load %Vec3*, ptr %a..tmp
  %rcc.tmp.5 = getelementptr %Vec3, ptr %rcc.tmp.4, i32 0, i32 0
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  %rcc.tmp.7 = load %Vec3*, ptr %b..tmp
  %rcc.tmp.8 = getelementptr %Vec3, ptr %rcc.tmp.7, i32 0, i32 0
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  %rcc.tmp.10 = sub i32 %rcc.tmp.6, %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %rcc.tmp.3
  %rcc.tmp.12 = getelementptr %Vec3, ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.13 = load %Vec3*, ptr %a..tmp
  %rcc.tmp.14 = getelementptr %Vec3, ptr %rcc.tmp.13, i32 0, i32 1
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  %rcc.tmp.16 = load %Vec3*, ptr %b..tmp
  %rcc.tmp.17 = getelementptr %Vec3, ptr %rcc.tmp.16, i32 0, i32 1
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = sub i32 %rcc.tmp.15, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %rcc.tmp.12
  %rcc.tmp.21 = getelementptr %Vec3, ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.22 = load %Vec3*, ptr %a..tmp
  %rcc.tmp.23 = getelementptr %Vec3, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load %Vec3*, ptr %b..tmp
  %rcc.tmp.26 = getelementptr %Vec3, ptr %rcc.tmp.25, i32 0, i32 2
  %rcc.tmp.27 = load i32, ptr %rcc.tmp.26
  %rcc.tmp.28 = sub i32 %rcc.tmp.24, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %rcc.tmp.21
  ret void
}
define i32 @intersect.(%Ray* %ray.tmp, %Sphere* %sphere.tmp) {
entry:
  %ray..tmp = alloca %Ray* 
  %sphere..tmp = alloca %Sphere* 
  %oc = alloca %Vec3 
  %a = alloca i32 
  %b = alloca i32 
  %c = alloca i32 
  %discriminant = alloca i32 
  store %Ray* %ray.tmp, ptr %ray..tmp
  store %Sphere* %sphere.tmp, ptr %sphere..tmp
  %rcc.tmp.3 = load %Ray*, ptr %ray..tmp
  %rcc.tmp.4 = getelementptr %Ray, ptr %rcc.tmp.3, i32 0, i32 0
  %rcc.tmp.5 = load %Sphere*, ptr %sphere..tmp
  %rcc.tmp.6 = getelementptr %Sphere, ptr %rcc.tmp.5, i32 0, i32 0
  call void @vec_sub.(%Vec3* %oc, %Vec3* %rcc.tmp.4, %Vec3* %rcc.tmp.6)
  %rcc.tmp.8 = load %Ray*, ptr %ray..tmp
  %rcc.tmp.9 = getelementptr %Ray, ptr %rcc.tmp.8, i32 0, i32 1
  %rcc.tmp.10 = load %Ray*, ptr %ray..tmp
  %rcc.tmp.11 = getelementptr %Ray, ptr %rcc.tmp.10, i32 0, i32 1
  %rcc.tmp.12 = call i32 @vec_dot.(%Vec3* %rcc.tmp.9, %Vec3* %rcc.tmp.11)
  store i32 %rcc.tmp.12, ptr %a
  %rcc.tmp.14 = load %Ray*, ptr %ray..tmp
  %rcc.tmp.15 = getelementptr %Ray, ptr %rcc.tmp.14, i32 0, i32 1
  %rcc.tmp.16 = call i32 @vec_dot.(%Vec3* %oc, %Vec3* %rcc.tmp.15)
  %rcc.tmp.17 = mul i32 2, %rcc.tmp.16
  store i32 %rcc.tmp.17, ptr %b
  %rcc.tmp.19 = call i32 @vec_dot.(%Vec3* %oc, %Vec3* %oc)
  %rcc.tmp.20 = load %Sphere*, ptr %sphere..tmp
  %rcc.tmp.21 = getelementptr %Sphere, ptr %rcc.tmp.20, i32 0, i32 1
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load %Sphere*, ptr %sphere..tmp
  %rcc.tmp.24 = getelementptr %Sphere, ptr %rcc.tmp.23, i32 0, i32 1
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.24
  %rcc.tmp.26 = mul i32 %rcc.tmp.22, %rcc.tmp.25
  %rcc.tmp.27 = sdiv i32 %rcc.tmp.26, 80
  %rcc.tmp.28 = sub i32 %rcc.tmp.19, %rcc.tmp.27
  store i32 %rcc.tmp.28, ptr %c
  %rcc.tmp.30 = load i32, ptr %b
  %rcc.tmp.31 = load i32, ptr %b
  %rcc.tmp.32 = mul i32 %rcc.tmp.30, %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %a
  %rcc.tmp.34 = mul i32 4, %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %c
  %rcc.tmp.36 = mul i32 %rcc.tmp.34, %rcc.tmp.35
  %rcc.tmp.37 = sdiv i32 %rcc.tmp.36, 80
  %rcc.tmp.38 = sub i32 %rcc.tmp.32, %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %discriminant
  %rcc.tmp.40 = load i32, ptr %discriminant
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.40, 0
  br i1 %rcc.tmp.41, label %if.then, label %if.else
if.then:
  %rcc.tmp.43 = sub i32 0, 1
  ret i32 %rcc.tmp.43
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %b
  %rcc.tmp.47 = sub i32 0, %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %discriminant
  %rcc.tmp.49 = call i32 @isqrt.(i32 %rcc.tmp.48)
  %rcc.tmp.50 = sub i32 %rcc.tmp.47, %rcc.tmp.49
  %rcc.tmp.51 = load i32, ptr %a
  %rcc.tmp.52 = mul i32 2, %rcc.tmp.51
  %rcc.tmp.53 = sdiv i32 %rcc.tmp.52, 80
  %rcc.tmp.54 = sdiv i32 %rcc.tmp.50, %rcc.tmp.53
  ret i32 %rcc.tmp.54
}
define i32 @isqrt.(i32 %n.tmp) {
entry:
  %n..tmp = alloca i32 
  %x = alloca i32 
  %y = alloca i32 
  store i32 %n.tmp, ptr %n..tmp
  %rcc.tmp.2 = load i32, ptr %n..tmp
  %rcc.tmp.3 = icmp slt i32 %rcc.tmp.2, 0
  br i1 %rcc.tmp.3, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.7 = load i32, ptr %n..tmp
  store i32 %rcc.tmp.7, ptr %x
  %rcc.tmp.9 = load i32, ptr %x
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  %rcc.tmp.11 = sdiv i32 %rcc.tmp.10, 2
  store i32 %rcc.tmp.11, ptr %y
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %y
  %rcc.tmp.15 = load i32, ptr %x
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %y
  store i32 %rcc.tmp.19, ptr %x
  %rcc.tmp.21 = load i32, ptr %x
  %rcc.tmp.22 = load i32, ptr %n..tmp
  %rcc.tmp.23 = load i32, ptr %x
  %rcc.tmp.24 = sdiv i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = add i32 %rcc.tmp.21, %rcc.tmp.24
  %rcc.tmp.26 = sdiv i32 %rcc.tmp.25, 2
  store i32 %rcc.tmp.26, ptr %y
  br label %while.cond
while.end:
  %rcc.tmp.29 = load i32, ptr %x
  ret i32 %rcc.tmp.29
}
define void @main() {
entry:
  %screen = alloca [64 x [64 x i32]] 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %spheres = alloca [4 x %Sphere] 
  %lights = alloca [2 x %Light] 
  %width = alloca i32 
  %height = alloca i32 
  %y = alloca i32 
  %x = alloca i32 
  %ray_dir = alloca %Vec3 
  %ray = alloca %Ray 
  %min_dist = alloca i32 
  %hit_color = alloca %Vec3 
  %s = alloca i32 
  %dist = alloca i32 
  %checksum = alloca i32 
  %x.2 = alloca i32 
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.3 = load i32, ptr %fill.idx
  %rcc.tmp.4 = icmp slt i32 %rcc.tmp.3, 64
  br i1 %rcc.tmp.4, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = getelementptr [64 x [64 x i32]], ptr %screen, i32 0, i32 %rcc.tmp.6
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.10 = load i32, ptr %fill.idx.2
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 64
  br i1 %rcc.tmp.11, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.13 = load i32, ptr %fill.idx.2
  %rcc.tmp.14 = getelementptr [64 x i32], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.19 = add i32 %rcc.tmp.6, 1
  store i32 %rcc.tmp.19, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.22 = getelementptr [4 x %Sphere], ptr %spheres, i32 0, i32 0
  %rcc.tmp.23 = getelementptr %Sphere, ptr %rcc.tmp.22, i32 0, i32 0
  %rcc.tmp.24 = getelementptr %Vec3, ptr %rcc.tmp.23, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr %Vec3, ptr %rcc.tmp.23, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr %Vec3, ptr %rcc.tmp.23, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr %Sphere, ptr %rcc.tmp.22, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr %Sphere, ptr %rcc.tmp.22, i32 0, i32 2
  %rcc.tmp.33 = getelementptr %Vec3, ptr %rcc.tmp.32, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr %Vec3, ptr %rcc.tmp.32, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr %Vec3, ptr %rcc.tmp.32, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [4 x %Sphere], ptr %spheres, i32 0, i32 1
  %rcc.tmp.40 = getelementptr %Sphere, ptr %rcc.tmp.39, i32 0, i32 0
  %rcc.tmp.41 = getelementptr %Vec3, ptr %rcc.tmp.40, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr %Vec3, ptr %rcc.tmp.40, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr %Vec3, ptr %rcc.tmp.40, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr %Sphere, ptr %rcc.tmp.39, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr %Sphere, ptr %rcc.tmp.39, i32 0, i32 2
  %rcc.tmp.50 = getelementptr %Vec3, ptr %rcc.tmp.49, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr %Vec3, ptr %rcc.tmp.49, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr %Vec3, ptr %rcc.tmp.49, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [4 x %Sphere], ptr %spheres, i32 0, i32 2
  %rcc.tmp.57 = getelementptr %Sphere, ptr %rcc.tmp.56, i32 0, i32 0
  %rcc.tmp.58 = getelementptr %Vec3, ptr %rcc.tmp.57, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr %Vec3, ptr %rcc.tmp.57, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr %Vec3, ptr %rcc.tmp.57, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr %Sphere, ptr %rcc.tmp.56, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr %Sphere, ptr %rcc.tmp.56, i32 0, i32 2
  %rcc.tmp.67 = getelementptr %Vec3, ptr %rcc.tmp.66, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr %Vec3, ptr %rcc.tmp.66, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.69
  %rcc.tmp.71 = getelementptr %Vec3, ptr %rcc.tmp.66, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.71
  %rcc.tmp.73 = getelementptr [4 x %Sphere], ptr %spheres, i32 0, i32 3
  %rcc.tmp.74 = getelementptr %Sphere, ptr %rcc.tmp.73, i32 0, i32 0
  %rcc.tmp.75 = getelementptr %Vec3, ptr %rcc.tmp.74, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.75
  %rcc.tmp.77 = getelementptr %Vec3, ptr %rcc.tmp.74, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.77
  %rcc.tmp.79 = getelementptr %Vec3, ptr %rcc.tmp.74, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr %Sphere, ptr %rcc.tmp.73, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr %Sphere, ptr %rcc.tmp.73, i32 0, i32 2
  %rcc.tmp.84 = getelementptr %Vec3, ptr %rcc.tmp.83, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.84
  %rcc.tmp.86 = getelementptr %Vec3, ptr %rcc.tmp.83, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.86
  %rcc.tmp.88 = getelementptr %Vec3, ptr %rcc.tmp.83, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.88
  %rcc.tmp.90 = getelementptr [2 x %Light], ptr %lights, i32 0, i32 0
  %rcc.tmp.91 = getelementptr %Light, ptr %rcc.tmp.90, i32 0, i32 0
  %rcc.tmp.92 = getelementptr %Vec3, ptr %rcc.tmp.91, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.92
  %rcc.tmp.94 = getelementptr %Vec3, ptr %rcc.tmp.91, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.94
  %rcc.tmp.96 = getelementptr %Vec3, ptr %rcc.tmp.91, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.96
  %rcc.tmp.98 = getelementptr %Light, ptr %rcc.tmp.90, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.98
  %rcc.tmp.100 = getelementptr [2 x %Light], ptr %lights, i32 0, i32 1
  %rcc.tmp.101 = getelementptr %Light, ptr %rcc.tmp.100, i32 0, i32 0
  %rcc.tmp.102 = getelementptr %Vec3, ptr %rcc.tmp.101, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.102
  %rcc.tmp.104 = getelementptr %Vec3, ptr %rcc.tmp.101, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.104
  %rcc.tmp.106 = getelementptr %Vec3, ptr %rcc.tmp.101, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.106
  %rcc.tmp.108 = getelementptr %Light, ptr %rcc.tmp.100, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.108
  call void @setup_scene.([4 x %Sphere]* %spheres, [2 x %Light]* %lights)
  store i32 64, ptr %width
  store i32 64, ptr %height
  store i32 0, ptr %y
  br label %while.cond
while.cond:
  %rcc.tmp.115 = load i32, ptr %y
  %rcc.tmp.116 = load i32, ptr %height
  %rcc.tmp.117 = icmp slt i32 %rcc.tmp.115, %rcc.tmp.116
  br i1 %rcc.tmp.117, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %x
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.122 = load i32, ptr %x
  %rcc.tmp.123 = load i32, ptr %width
  %rcc.tmp.124 = icmp slt i32 %rcc.tmp.122, %rcc.tmp.123
  br i1 %rcc.tmp.124, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.127 = getelementptr %Vec3, ptr %ray_dir, i32 0, i32 0
  %rcc.tmp.128 = load i32, ptr %x
  %rcc.tmp.129 = load i32, ptr %width
  %rcc.tmp.130 = sdiv i32 %rcc.tmp.129, 2
  %rcc.tmp.131 = sub i32 %rcc.tmp.128, %rcc.tmp.130
  %rcc.tmp.132 = mul i32 %rcc.tmp.131, 80
  %rcc.tmp.133 = load i32, ptr %width
  %rcc.tmp.134 = sdiv i32 %rcc.tmp.132, %rcc.tmp.133
  store i32 %rcc.tmp.134, ptr %rcc.tmp.127
  %rcc.tmp.136 = getelementptr %Vec3, ptr %ray_dir, i32 0, i32 1
  %rcc.tmp.137 = load i32, ptr %y
  %rcc.tmp.138 = load i32, ptr %height
  %rcc.tmp.139 = sdiv i32 %rcc.tmp.138, 2
  %rcc.tmp.140 = sub i32 %rcc.tmp.137, %rcc.tmp.139
  %rcc.tmp.141 = mul i32 %rcc.tmp.140, 80
  %rcc.tmp.142 = load i32, ptr %height
  %rcc.tmp.143 = sdiv i32 %rcc.tmp.141, %rcc.tmp.142
  store i32 %rcc.tmp.143, ptr %rcc.tmp.136
  %rcc.tmp.145 = getelementptr %Vec3, ptr %ray_dir, i32 0, i32 2
  store i32 80, ptr %rcc.tmp.145
  %rcc.tmp.147 = getelementptr %Ray, ptr %ray, i32 0, i32 0
  %rcc.tmp.148 = getelementptr %Vec3, ptr %rcc.tmp.147, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.148
  %rcc.tmp.150 = getelementptr %Vec3, ptr %rcc.tmp.147, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.150
  %rcc.tmp.152 = getelementptr %Vec3, ptr %rcc.tmp.147, i32 0, i32 2
  %rcc.tmp.153 = sub i32 0, 1
  %rcc.tmp.154 = mul i32 %rcc.tmp.153, 80
  store i32 %rcc.tmp.154, ptr %rcc.tmp.152
  %rcc.tmp.156 = getelementptr %Ray, ptr %ray, i32 0, i32 1
  %rcc.tmp.157 = getelementptr %Vec3, ptr %ray_dir, i32 0, i32 0
  %rcc.tmp.158 = getelementptr %Vec3, ptr %rcc.tmp.156, i32 0, i32 0
  %rcc.tmp.159 = load i32, ptr %rcc.tmp.157
  store i32 %rcc.tmp.159, ptr %rcc.tmp.158
  %rcc.tmp.161 = getelementptr %Vec3, ptr %ray_dir, i32 0, i32 1
  %rcc.tmp.162 = getelementptr %Vec3, ptr %rcc.tmp.156, i32 0, i32 1
  %rcc.tmp.163 = load i32, ptr %rcc.tmp.161
  store i32 %rcc.tmp.163, ptr %rcc.tmp.162
  %rcc.tmp.165 = getelementptr %Vec3, ptr %ray_dir, i32 0, i32 2
  %rcc.tmp.166 = getelementptr %Vec3, ptr %rcc.tmp.156, i32 0, i32 2
  %rcc.tmp.167 = load i32, ptr %rcc.tmp.165
  store i32 %rcc.tmp.167, ptr %rcc.tmp.166
  %rcc.tmp.169 = mul i32 10000, 80
  store i32 %rcc.tmp.169, ptr %min_dist
  %rcc.tmp.171 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 0
  store i32 20, ptr %rcc.tmp.171
  %rcc.tmp.173 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 1
  store i32 20, ptr %rcc.tmp.173
  %rcc.tmp.175 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 2
  store i32 40, ptr %rcc.tmp.175
  store i32 0, ptr %s
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.179 = load i32, ptr %s
  %rcc.tmp.180 = icmp slt i32 %rcc.tmp.179, 4
  br i1 %rcc.tmp.180, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.183 = load i32, ptr %s
  %rcc.tmp.184 = add i32 %rcc.tmp.183, 0
  %rcc.tmp.185 = getelementptr [4 x %Sphere], ptr %spheres, i32 0, i32 %rcc.tmp.184
  %rcc.tmp.186 = call i32 @intersect.(%Ray* %ray, %Sphere* %rcc.tmp.185)
  store i32 %rcc.tmp.186, ptr %dist
  %rcc.tmp.188 = load i32, ptr %dist
  %rcc.tmp.189 = icmp sgt i32 %rcc.tmp.188, 0
  br i1 %rcc.tmp.189, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.191 = load i32, ptr %dist
  %rcc.tmp.192 = load i32, ptr %min_dist
  %rcc.tmp.193 = icmp slt i32 %rcc.tmp.191, %rcc.tmp.192
  br label %sc.merge
sc.merge:
  %rcc.tmp.195 = phi i1 [0, %while.body.3], [%rcc.tmp.193, %and.rhs]
  br i1 %rcc.tmp.195, label %if.then, label %if.else
if.then:
  %rcc.tmp.197 = load i32, ptr %dist
  store i32 %rcc.tmp.197, ptr %min_dist
  %rcc.tmp.199 = load i32, ptr %s
  %rcc.tmp.200 = add i32 %rcc.tmp.199, 0
  %rcc.tmp.201 = getelementptr [4 x %Sphere], ptr %spheres, i32 0, i32 %rcc.tmp.200
  %rcc.tmp.202 = getelementptr %Sphere, ptr %rcc.tmp.201, i32 0, i32 2
  %rcc.tmp.203 = getelementptr %Vec3, ptr %rcc.tmp.202, i32 0, i32 0
  %rcc.tmp.204 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 0
  %rcc.tmp.205 = load i32, ptr %rcc.tmp.203
  store i32 %rcc.tmp.205, ptr %rcc.tmp.204
  %rcc.tmp.207 = getelementptr %Vec3, ptr %rcc.tmp.202, i32 0, i32 1
  %rcc.tmp.208 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 1
  %rcc.tmp.209 = load i32, ptr %rcc.tmp.207
  store i32 %rcc.tmp.209, ptr %rcc.tmp.208
  %rcc.tmp.211 = getelementptr %Vec3, ptr %rcc.tmp.202, i32 0, i32 2
  %rcc.tmp.212 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 2
  %rcc.tmp.213 = load i32, ptr %rcc.tmp.211
  store i32 %rcc.tmp.213, ptr %rcc.tmp.212
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.217 = load i32, ptr %s
  %rcc.tmp.218 = add i32 %rcc.tmp.217, 1
  store i32 %rcc.tmp.218, ptr %s
  br label %while.cond.3
while.end.3:
  %rcc.tmp.221 = load i32, ptr %x
  %rcc.tmp.222 = add i32 %rcc.tmp.221, 0
  %rcc.tmp.223 = getelementptr [64 x [64 x i32]], ptr %screen, i32 0, i32 %rcc.tmp.222
  %rcc.tmp.224 = load i32, ptr %y
  %rcc.tmp.225 = add i32 %rcc.tmp.224, 0
  %rcc.tmp.226 = getelementptr [64 x i32], ptr %rcc.tmp.223, i32 0, i32 %rcc.tmp.225
  %rcc.tmp.227 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 0
  %rcc.tmp.228 = load i32, ptr %rcc.tmp.227
  %rcc.tmp.229 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 1
  %rcc.tmp.230 = load i32, ptr %rcc.tmp.229
  %rcc.tmp.231 = add i32 %rcc.tmp.228, %rcc.tmp.230
  %rcc.tmp.232 = getelementptr %Vec3, ptr %hit_color, i32 0, i32 2
  %rcc.tmp.233 = load i32, ptr %rcc.tmp.232
  %rcc.tmp.234 = add i32 %rcc.tmp.231, %rcc.tmp.233
  %rcc.tmp.235 = sdiv i32 %rcc.tmp.234, 3
  store i32 %rcc.tmp.235, ptr %rcc.tmp.226
  %rcc.tmp.237 = load i32, ptr %x
  %rcc.tmp.238 = add i32 %rcc.tmp.237, 1
  store i32 %rcc.tmp.238, ptr %x
  br label %while.cond.2
while.end.2:
  %rcc.tmp.241 = load i32, ptr %y
  %rcc.tmp.242 = add i32 %rcc.tmp.241, 1
  store i32 %rcc.tmp.242, ptr %y
  br label %while.cond
while.end:
  store i32 0, ptr %checksum
  store i32 0, ptr %y
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.248 = load i32, ptr %y
  %rcc.tmp.249 = load i32, ptr %height
  %rcc.tmp.250 = icmp slt i32 %rcc.tmp.248, %rcc.tmp.249
  br i1 %rcc.tmp.250, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  store i32 0, ptr %x.2
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.255 = load i32, ptr %x.2
  %rcc.tmp.256 = load i32, ptr %width
  %rcc.tmp.257 = icmp slt i32 %rcc.tmp.255, %rcc.tmp.256
  br i1 %rcc.tmp.257, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.260 = load i32, ptr %checksum
  %rcc.tmp.261 = load i32, ptr %x.2
  %rcc.tmp.262 = add i32 %rcc.tmp.261, 0
  %rcc.tmp.263 = getelementptr [64 x [64 x i32]], ptr %screen, i32 0, i32 %rcc.tmp.262
  %rcc.tmp.264 = load i32, ptr %y
  %rcc.tmp.265 = add i32 %rcc.tmp.264, 0
  %rcc.tmp.266 = getelementptr [64 x i32], ptr %rcc.tmp.263, i32 0, i32 %rcc.tmp.265
  %rcc.tmp.267 = load i32, ptr %rcc.tmp.266
  %rcc.tmp.268 = load i32, ptr %x.2
  %rcc.tmp.269 = load i32, ptr %y
  %rcc.tmp.270 = load i32, ptr %width
  %rcc.tmp.271 = mul i32 %rcc.tmp.269, %rcc.tmp.270
  %rcc.tmp.272 = add i32 %rcc.tmp.268, %rcc.tmp.271
  %rcc.tmp.273 = mul i32 %rcc.tmp.267, %rcc.tmp.272
  %rcc.tmp.274 = add i32 %rcc.tmp.260, %rcc.tmp.273
  store i32 %rcc.tmp.274, ptr %checksum
  %rcc.tmp.276 = load i32, ptr %x.2
  %rcc.tmp.277 = add i32 %rcc.tmp.276, 1
  store i32 %rcc.tmp.277, ptr %x.2
  br label %while.cond.5
while.end.5:
  %rcc.tmp.280 = load i32, ptr %y
  %rcc.tmp.281 = add i32 %rcc.tmp.280, 1
  store i32 %rcc.tmp.281, ptr %y
  br label %while.cond.4
while.end.4:
  %rcc.tmp.284 = load i32, ptr %checksum
  call void @printlnInt.(i32 %rcc.tmp.284)
  call void @exit.(i32 0)
  ret void
}
