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
%FS = type {[16384 x i32], [128 x i32], [128 x i32], [128 x [6 x i32]], [256 x i1], [128 x i1]}
define void @new_fs.(%FS* sret(%FS) %ret.slot) {
entry:
  %fs = alloca %FS 
  %fill.idx = alloca i32 
  %fill.idx.2 = alloca i32 
  %fill.idx.3 = alloca i32 
  %fill.idx.4 = alloca i32 
  %fill.idx.5 = alloca i32 
  %fill.idx.6 = alloca i32 
  %rcc.tmp.1 = getelementptr %FS, ptr %fs, i32 0, i32 0
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.4 = load i32, ptr %fill.idx
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 16384
  br i1 %rcc.tmp.5, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = getelementptr [16384 x i32], ptr %rcc.tmp.1, i32 0, i32 %rcc.tmp.7
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = add i32 %rcc.tmp.7, 1
  store i32 %rcc.tmp.10, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  %rcc.tmp.13 = getelementptr %FS, ptr %fs, i32 0, i32 1
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.16 = load i32, ptr %fill.idx.2
  %rcc.tmp.17 = icmp slt i32 %rcc.tmp.16, 128
  br i1 %rcc.tmp.17, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.19 = load i32, ptr %fill.idx.2
  %rcc.tmp.20 = getelementptr [128 x i32], ptr %rcc.tmp.13, i32 0, i32 %rcc.tmp.19
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = add i32 %rcc.tmp.19, 1
  store i32 %rcc.tmp.22, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  %rcc.tmp.25 = getelementptr %FS, ptr %fs, i32 0, i32 2
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.28 = load i32, ptr %fill.idx.3
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 128
  br i1 %rcc.tmp.29, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.31 = load i32, ptr %fill.idx.3
  %rcc.tmp.32 = getelementptr [128 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.31
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.34, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  %rcc.tmp.37 = getelementptr %FS, ptr %fs, i32 0, i32 3
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.40 = load i32, ptr %fill.idx.4
  %rcc.tmp.41 = icmp slt i32 %rcc.tmp.40, 128
  br i1 %rcc.tmp.41, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.43 = load i32, ptr %fill.idx.4
  %rcc.tmp.44 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.37, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [6 x i32], ptr %rcc.tmp.44, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.45
  %rcc.tmp.47 = getelementptr [6 x i32], ptr %rcc.tmp.44, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.47
  %rcc.tmp.49 = getelementptr [6 x i32], ptr %rcc.tmp.44, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.49
  %rcc.tmp.51 = getelementptr [6 x i32], ptr %rcc.tmp.44, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [6 x i32], ptr %rcc.tmp.44, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [6 x i32], ptr %rcc.tmp.44, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.55
  %rcc.tmp.57 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.57, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  %rcc.tmp.60 = getelementptr %FS, ptr %fs, i32 0, i32 4
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.63 = load i32, ptr %fill.idx.5
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.63, 256
  br i1 %rcc.tmp.64, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.66 = load i32, ptr %fill.idx.5
  %rcc.tmp.67 = getelementptr [256 x i1], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.66
  store i1 0, ptr %rcc.tmp.67
  %rcc.tmp.69 = add i32 %rcc.tmp.66, 1
  store i32 %rcc.tmp.69, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  %rcc.tmp.72 = getelementptr %FS, ptr %fs, i32 0, i32 5
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.75 = load i32, ptr %fill.idx.6
  %rcc.tmp.76 = icmp slt i32 %rcc.tmp.75, 128
  br i1 %rcc.tmp.76, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.78 = load i32, ptr %fill.idx.6
  %rcc.tmp.79 = getelementptr [128 x i1], ptr %rcc.tmp.72, i32 0, i32 %rcc.tmp.78
  store i1 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = add i32 %rcc.tmp.78, 1
  store i32 %rcc.tmp.81, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  %rcc.tmp.84 = bitcast %FS* %ret.slot to i8*
  %rcc.tmp.85 = bitcast %FS* %fs to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.84, i8* %rcc.tmp.85, i32 70016, i1 0)
  ret void
}
define void @fs_format.(%FS* %fs.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %i = alloca i32 
  %root_inode = alloca i32 
  %root_block = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 256
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %FS*, ptr %fs..tmp
  %rcc.tmp.9 = getelementptr %FS, ptr %rcc.tmp.8, i32 0, i32 4
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [256 x i1], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  store i1 1, ptr %rcc.tmp.12
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 1
  store i32 %rcc.tmp.15, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.20 = load i32, ptr %i
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.20, 128
  br i1 %rcc.tmp.21, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.24 = load %FS*, ptr %fs..tmp
  %rcc.tmp.25 = getelementptr %FS, ptr %rcc.tmp.24, i32 0, i32 5
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [128 x i1], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  store i1 1, ptr %rcc.tmp.28
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 1
  store i32 %rcc.tmp.31, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.34 = load %FS*, ptr %fs..tmp
  %rcc.tmp.35 = call i32 @allocate_inode.(%FS* %rcc.tmp.34)
  store i32 %rcc.tmp.35, ptr %root_inode
  %rcc.tmp.37 = load %FS*, ptr %fs..tmp
  %rcc.tmp.38 = call i32 @allocate_block.(%FS* %rcc.tmp.37)
  store i32 %rcc.tmp.38, ptr %root_block
  %rcc.tmp.40 = load %FS*, ptr %fs..tmp
  %rcc.tmp.41 = getelementptr %FS, ptr %rcc.tmp.40, i32 0, i32 1
  %rcc.tmp.42 = load i32, ptr %root_inode
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [128 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  store i32 2, ptr %rcc.tmp.44
  %rcc.tmp.46 = load %FS*, ptr %fs..tmp
  %rcc.tmp.47 = getelementptr %FS, ptr %rcc.tmp.46, i32 0, i32 2
  %rcc.tmp.48 = load i32, ptr %root_inode
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = getelementptr [128 x i32], ptr %rcc.tmp.47, i32 0, i32 %rcc.tmp.49
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = load %FS*, ptr %fs..tmp
  %rcc.tmp.53 = getelementptr %FS, ptr %rcc.tmp.52, i32 0, i32 3
  %rcc.tmp.54 = load i32, ptr %root_inode
  %rcc.tmp.55 = add i32 %rcc.tmp.54, 0
  %rcc.tmp.56 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.53, i32 0, i32 %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [6 x i32], ptr %rcc.tmp.56, i32 0, i32 0
  %rcc.tmp.58 = load i32, ptr %root_block
  store i32 %rcc.tmp.58, ptr %rcc.tmp.57
  ret void
}
define i32 @allocate_inode.(%FS* %fs.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %i = alloca i32 
  %j = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 128
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %FS*, ptr %fs..tmp
  %rcc.tmp.9 = getelementptr %FS, ptr %rcc.tmp.8, i32 0, i32 5
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [128 x i1], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = load i1, ptr %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load %FS*, ptr %fs..tmp
  %rcc.tmp.16 = getelementptr %FS, ptr %rcc.tmp.15, i32 0, i32 5
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [128 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  store i1 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = load %FS*, ptr %fs..tmp
  %rcc.tmp.22 = getelementptr %FS, ptr %rcc.tmp.21, i32 0, i32 1
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [128 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = load %FS*, ptr %fs..tmp
  %rcc.tmp.28 = getelementptr %FS, ptr %rcc.tmp.27, i32 0, i32 2
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [128 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  store i32 0, ptr %rcc.tmp.31
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.35 = load i32, ptr %j
  %rcc.tmp.36 = icmp slt i32 %rcc.tmp.35, 6
  br i1 %rcc.tmp.36, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.39 = load %FS*, ptr %fs..tmp
  %rcc.tmp.40 = getelementptr %FS, ptr %rcc.tmp.39, i32 0, i32 3
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 0
  %rcc.tmp.43 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.42
  %rcc.tmp.44 = load i32, ptr %j
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = getelementptr [6 x i32], ptr %rcc.tmp.43, i32 0, i32 %rcc.tmp.45
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.52 = load i32, ptr %i
  ret i32 %rcc.tmp.52
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.55 = load i32, ptr %i
  %rcc.tmp.56 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.56, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.59 = sub i32 0, 1
  ret i32 %rcc.tmp.59
}
define i32 @allocate_block.(%FS* %fs.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %i = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.4 = load i32, ptr %i
  %rcc.tmp.5 = icmp slt i32 %rcc.tmp.4, 256
  br i1 %rcc.tmp.5, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.8 = load %FS*, ptr %fs..tmp
  %rcc.tmp.9 = getelementptr %FS, ptr %rcc.tmp.8, i32 0, i32 4
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [256 x i1], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = load i1, ptr %rcc.tmp.12
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load %FS*, ptr %fs..tmp
  %rcc.tmp.16 = getelementptr %FS, ptr %rcc.tmp.15, i32 0, i32 4
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = getelementptr [256 x i1], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.18
  store i1 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %i
  ret i32 %rcc.tmp.21
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.28 = sub i32 0, 1
  ret i32 %rcc.tmp.28
}
define i32 @find_in_dir.(%FS* %fs.tmp, i32 %dir_inode_num.tmp, [16 x i32]* %filename.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %dir_inode_num..tmp = alloca i32 
  %filename..local = alloca [16 x i32] 
  %dir_size = alloca i32 
  %num_entries = alloca i32 
  %i = alloca i32 
  %block_idx = alloca i32 
  %offset_in_block = alloca i32 
  %data_block = alloca i32 
  %entry_addr = alloca i32 
  %flag = alloca i1 
  %j = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 %dir_inode_num.tmp, ptr %dir_inode_num..tmp
  %rcc.tmp.3 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 0
  %rcc.tmp.4 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.3
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  %rcc.tmp.7 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 1
  %rcc.tmp.8 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 1
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 2
  %rcc.tmp.12 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.13, ptr %rcc.tmp.12
  %rcc.tmp.15 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 3
  %rcc.tmp.16 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 3
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 4
  %rcc.tmp.20 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 4
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.21, ptr %rcc.tmp.20
  %rcc.tmp.23 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 5
  %rcc.tmp.24 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 5
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 6
  %rcc.tmp.28 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 6
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 7
  %rcc.tmp.32 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 7
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 8
  %rcc.tmp.36 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 8
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 9
  %rcc.tmp.40 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 9
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.41, ptr %rcc.tmp.40
  %rcc.tmp.43 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 10
  %rcc.tmp.44 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 10
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.45, ptr %rcc.tmp.44
  %rcc.tmp.47 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 11
  %rcc.tmp.48 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 11
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.47
  store i32 %rcc.tmp.49, ptr %rcc.tmp.48
  %rcc.tmp.51 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 12
  %rcc.tmp.52 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 12
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 13
  %rcc.tmp.56 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 13
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.55
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  %rcc.tmp.59 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 14
  %rcc.tmp.60 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 14
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.61, ptr %rcc.tmp.60
  %rcc.tmp.63 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 15
  %rcc.tmp.64 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 15
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load %FS*, ptr %fs..tmp
  %rcc.tmp.68 = getelementptr %FS, ptr %rcc.tmp.67, i32 0, i32 2
  %rcc.tmp.69 = load i32, ptr %dir_inode_num..tmp
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 0
  %rcc.tmp.71 = getelementptr [128 x i32], ptr %rcc.tmp.68, i32 0, i32 %rcc.tmp.70
  %rcc.tmp.72 = load i32, ptr %rcc.tmp.71
  store i32 %rcc.tmp.72, ptr %dir_size
  %rcc.tmp.74 = load i32, ptr %dir_size
  %rcc.tmp.75 = sdiv i32 %rcc.tmp.74, 24
  store i32 %rcc.tmp.75, ptr %num_entries
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.79 = load i32, ptr %i
  %rcc.tmp.80 = load i32, ptr %num_entries
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.79, %rcc.tmp.80
  br i1 %rcc.tmp.81, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = mul i32 %rcc.tmp.84, 24
  %rcc.tmp.86 = sdiv i32 %rcc.tmp.85, 64
  store i32 %rcc.tmp.86, ptr %block_idx
  %rcc.tmp.88 = load i32, ptr %i
  %rcc.tmp.89 = mul i32 %rcc.tmp.88, 24
  %rcc.tmp.90 = srem i32 %rcc.tmp.89, 64
  store i32 %rcc.tmp.90, ptr %offset_in_block
  %rcc.tmp.92 = load %FS*, ptr %fs..tmp
  %rcc.tmp.93 = getelementptr %FS, ptr %rcc.tmp.92, i32 0, i32 3
  %rcc.tmp.94 = load i32, ptr %dir_inode_num..tmp
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %block_idx
  %rcc.tmp.98 = add i32 %rcc.tmp.97, 0
  %rcc.tmp.99 = getelementptr [6 x i32], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.98
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.100, ptr %data_block
  %rcc.tmp.102 = load i32, ptr %data_block
  %rcc.tmp.103 = mul i32 %rcc.tmp.102, 64
  %rcc.tmp.104 = load i32, ptr %offset_in_block
  %rcc.tmp.105 = add i32 %rcc.tmp.103, %rcc.tmp.104
  store i32 %rcc.tmp.105, ptr %entry_addr
  store i1 1, ptr %flag
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.110 = load i32, ptr %j
  %rcc.tmp.111 = icmp slt i32 %rcc.tmp.110, 16
  br i1 %rcc.tmp.111, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.114 = load %FS*, ptr %fs..tmp
  %rcc.tmp.115 = getelementptr %FS, ptr %rcc.tmp.114, i32 0, i32 0
  %rcc.tmp.116 = load i32, ptr %entry_addr
  %rcc.tmp.117 = load i32, ptr %j
  %rcc.tmp.118 = add i32 %rcc.tmp.116, %rcc.tmp.117
  %rcc.tmp.119 = add i32 %rcc.tmp.118, 0
  %rcc.tmp.120 = getelementptr [16384 x i32], ptr %rcc.tmp.115, i32 0, i32 %rcc.tmp.119
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.120
  %rcc.tmp.122 = load i32, ptr %j
  %rcc.tmp.123 = add i32 %rcc.tmp.122, 0
  %rcc.tmp.124 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 %rcc.tmp.123
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.124
  %rcc.tmp.126 = icmp ne i32 %rcc.tmp.121, %rcc.tmp.125
  br i1 %rcc.tmp.126, label %if.then, label %if.else
if.then:
  store i1 0, ptr %flag
  br label %while.linker.2
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.131 = load i32, ptr %j
  %rcc.tmp.132 = add i32 %rcc.tmp.131, 1
  store i32 %rcc.tmp.132, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.135 = load i1, ptr %flag
  br i1 %rcc.tmp.135, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.137 = load %FS*, ptr %fs..tmp
  %rcc.tmp.138 = getelementptr %FS, ptr %rcc.tmp.137, i32 0, i32 0
  %rcc.tmp.139 = load i32, ptr %entry_addr
  %rcc.tmp.140 = add i32 %rcc.tmp.139, 16
  %rcc.tmp.141 = add i32 %rcc.tmp.140, 0
  %rcc.tmp.142 = getelementptr [16384 x i32], ptr %rcc.tmp.138, i32 0, i32 %rcc.tmp.141
  %rcc.tmp.143 = load i32, ptr %rcc.tmp.142
  ret i32 %rcc.tmp.143
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.146 = load i32, ptr %i
  %rcc.tmp.147 = add i32 %rcc.tmp.146, 1
  store i32 %rcc.tmp.147, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.150 = sub i32 0, 1
  ret i32 %rcc.tmp.150
}
define i32 @create_file.(%FS* %fs.tmp, i32 %parent_dir_inode.tmp, [16 x i32]* %filename.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %parent_dir_inode..tmp = alloca i32 
  %filename..local = alloca [16 x i32] 
  %new_inode_num = alloca i32 
  %dir_size = alloca i32 
  %block_idx = alloca i32 
  %offset_in_block = alloca i32 
  %data_block = alloca i32 
  %entry_addr = alloca i32 
  %i = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 %parent_dir_inode.tmp, ptr %parent_dir_inode..tmp
  %rcc.tmp.3 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 0
  %rcc.tmp.4 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 0
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.3
  store i32 %rcc.tmp.5, ptr %rcc.tmp.4
  %rcc.tmp.7 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 1
  %rcc.tmp.8 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 1
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.9, ptr %rcc.tmp.8
  %rcc.tmp.11 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 2
  %rcc.tmp.12 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 2
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.11
  store i32 %rcc.tmp.13, ptr %rcc.tmp.12
  %rcc.tmp.15 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 3
  %rcc.tmp.16 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 3
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.15
  store i32 %rcc.tmp.17, ptr %rcc.tmp.16
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 4
  %rcc.tmp.20 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 4
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.19
  store i32 %rcc.tmp.21, ptr %rcc.tmp.20
  %rcc.tmp.23 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 5
  %rcc.tmp.24 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 5
  %rcc.tmp.25 = load i32, ptr %rcc.tmp.23
  store i32 %rcc.tmp.25, ptr %rcc.tmp.24
  %rcc.tmp.27 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 6
  %rcc.tmp.28 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 6
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.27
  store i32 %rcc.tmp.29, ptr %rcc.tmp.28
  %rcc.tmp.31 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 7
  %rcc.tmp.32 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 7
  %rcc.tmp.33 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.33, ptr %rcc.tmp.32
  %rcc.tmp.35 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 8
  %rcc.tmp.36 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 8
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.35
  store i32 %rcc.tmp.37, ptr %rcc.tmp.36
  %rcc.tmp.39 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 9
  %rcc.tmp.40 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 9
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.41, ptr %rcc.tmp.40
  %rcc.tmp.43 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 10
  %rcc.tmp.44 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 10
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.43
  store i32 %rcc.tmp.45, ptr %rcc.tmp.44
  %rcc.tmp.47 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 11
  %rcc.tmp.48 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 11
  %rcc.tmp.49 = load i32, ptr %rcc.tmp.47
  store i32 %rcc.tmp.49, ptr %rcc.tmp.48
  %rcc.tmp.51 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 12
  %rcc.tmp.52 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 12
  %rcc.tmp.53 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.53, ptr %rcc.tmp.52
  %rcc.tmp.55 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 13
  %rcc.tmp.56 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 13
  %rcc.tmp.57 = load i32, ptr %rcc.tmp.55
  store i32 %rcc.tmp.57, ptr %rcc.tmp.56
  %rcc.tmp.59 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 14
  %rcc.tmp.60 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 14
  %rcc.tmp.61 = load i32, ptr %rcc.tmp.59
  store i32 %rcc.tmp.61, ptr %rcc.tmp.60
  %rcc.tmp.63 = getelementptr [16 x i32], ptr %filename.tmp, i32 0, i32 15
  %rcc.tmp.64 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 15
  %rcc.tmp.65 = load i32, ptr %rcc.tmp.63
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load %FS*, ptr %fs..tmp
  %rcc.tmp.68 = load i32, ptr %parent_dir_inode..tmp
  %rcc.tmp.69 = call i32 @find_in_dir.(%FS* %rcc.tmp.67, i32 %rcc.tmp.68, [16 x i32]* %filename..local)
  %rcc.tmp.70 = sub i32 0, 1
  %rcc.tmp.71 = icmp ne i32 %rcc.tmp.69, %rcc.tmp.70
  br i1 %rcc.tmp.71, label %if.then, label %if.else
if.then:
  %rcc.tmp.73 = sub i32 0, 1
  ret i32 %rcc.tmp.73
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.76 = load %FS*, ptr %fs..tmp
  %rcc.tmp.77 = call i32 @allocate_inode.(%FS* %rcc.tmp.76)
  store i32 %rcc.tmp.77, ptr %new_inode_num
  %rcc.tmp.79 = load i32, ptr %new_inode_num
  %rcc.tmp.80 = sub i32 0, 1
  %rcc.tmp.81 = icmp eq i32 %rcc.tmp.79, %rcc.tmp.80
  br i1 %rcc.tmp.81, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.83 = sub i32 0, 1
  ret i32 %rcc.tmp.83
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.86 = load %FS*, ptr %fs..tmp
  %rcc.tmp.87 = getelementptr %FS, ptr %rcc.tmp.86, i32 0, i32 1
  %rcc.tmp.88 = load i32, ptr %new_inode_num
  %rcc.tmp.89 = add i32 %rcc.tmp.88, 0
  %rcc.tmp.90 = getelementptr [128 x i32], ptr %rcc.tmp.87, i32 0, i32 %rcc.tmp.89
  store i32 1, ptr %rcc.tmp.90
  %rcc.tmp.92 = load %FS*, ptr %fs..tmp
  %rcc.tmp.93 = getelementptr %FS, ptr %rcc.tmp.92, i32 0, i32 2
  %rcc.tmp.94 = load i32, ptr %parent_dir_inode..tmp
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = getelementptr [128 x i32], ptr %rcc.tmp.93, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  store i32 %rcc.tmp.97, ptr %dir_size
  %rcc.tmp.99 = load i32, ptr %dir_size
  %rcc.tmp.100 = sdiv i32 %rcc.tmp.99, 64
  store i32 %rcc.tmp.100, ptr %block_idx
  %rcc.tmp.102 = load i32, ptr %dir_size
  %rcc.tmp.103 = srem i32 %rcc.tmp.102, 64
  store i32 %rcc.tmp.103, ptr %offset_in_block
  %rcc.tmp.105 = load %FS*, ptr %fs..tmp
  %rcc.tmp.106 = getelementptr %FS, ptr %rcc.tmp.105, i32 0, i32 3
  %rcc.tmp.107 = load i32, ptr %parent_dir_inode..tmp
  %rcc.tmp.108 = add i32 %rcc.tmp.107, 0
  %rcc.tmp.109 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.108
  %rcc.tmp.110 = load i32, ptr %block_idx
  %rcc.tmp.111 = add i32 %rcc.tmp.110, 0
  %rcc.tmp.112 = getelementptr [6 x i32], ptr %rcc.tmp.109, i32 0, i32 %rcc.tmp.111
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.112
  store i32 %rcc.tmp.113, ptr %data_block
  %rcc.tmp.115 = load i32, ptr %data_block
  %rcc.tmp.116 = mul i32 %rcc.tmp.115, 64
  %rcc.tmp.117 = load i32, ptr %offset_in_block
  %rcc.tmp.118 = add i32 %rcc.tmp.116, %rcc.tmp.117
  store i32 %rcc.tmp.118, ptr %entry_addr
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.122 = load i32, ptr %i
  %rcc.tmp.123 = icmp slt i32 %rcc.tmp.122, 16
  br i1 %rcc.tmp.123, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.126 = load %FS*, ptr %fs..tmp
  %rcc.tmp.127 = getelementptr %FS, ptr %rcc.tmp.126, i32 0, i32 0
  %rcc.tmp.128 = load i32, ptr %entry_addr
  %rcc.tmp.129 = load i32, ptr %i
  %rcc.tmp.130 = add i32 %rcc.tmp.128, %rcc.tmp.129
  %rcc.tmp.131 = add i32 %rcc.tmp.130, 0
  %rcc.tmp.132 = getelementptr [16384 x i32], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.131
  %rcc.tmp.133 = load i32, ptr %i
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 0
  %rcc.tmp.135 = getelementptr [16 x i32], ptr %filename..local, i32 0, i32 %rcc.tmp.134
  %rcc.tmp.136 = load i32, ptr %rcc.tmp.135
  store i32 %rcc.tmp.136, ptr %rcc.tmp.132
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.142 = load %FS*, ptr %fs..tmp
  %rcc.tmp.143 = getelementptr %FS, ptr %rcc.tmp.142, i32 0, i32 0
  %rcc.tmp.144 = load i32, ptr %entry_addr
  %rcc.tmp.145 = add i32 %rcc.tmp.144, 16
  %rcc.tmp.146 = add i32 %rcc.tmp.145, 0
  %rcc.tmp.147 = getelementptr [16384 x i32], ptr %rcc.tmp.143, i32 0, i32 %rcc.tmp.146
  %rcc.tmp.148 = load i32, ptr %new_inode_num
  store i32 %rcc.tmp.148, ptr %rcc.tmp.147
  %rcc.tmp.150 = load %FS*, ptr %fs..tmp
  %rcc.tmp.151 = getelementptr %FS, ptr %rcc.tmp.150, i32 0, i32 2
  %rcc.tmp.152 = load i32, ptr %parent_dir_inode..tmp
  %rcc.tmp.153 = add i32 %rcc.tmp.152, 0
  %rcc.tmp.154 = getelementptr [128 x i32], ptr %rcc.tmp.151, i32 0, i32 %rcc.tmp.153
  %rcc.tmp.155 = load i32, ptr %dir_size
  %rcc.tmp.156 = add i32 %rcc.tmp.155, 24
  store i32 %rcc.tmp.156, ptr %rcc.tmp.154
  %rcc.tmp.158 = load i32, ptr %new_inode_num
  ret i32 %rcc.tmp.158
}
define i32 @write_file.(%FS* %fs.tmp, i32 %inode_num.tmp, [100 x i32]* %data.tmp, i32 %len.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %inode_num..tmp = alloca i32 
  %data..local = alloca [100 x i32] 
  %len..tmp = alloca i32 
  %bytes_written = alloca i32 
  %data_ptr = alloca i32 
  %block_alloc_count = alloca i32 
  %max_len = alloca i32 
  %block_idx = alloca i32 
  %current_block = alloca i32 
  %offset_in_block = alloca i32 
  %write_addr = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 %inode_num.tmp, ptr %inode_num..tmp
  %rcc.tmp.3 = bitcast [100 x i32]* %data..local to i8*
  %rcc.tmp.4 = bitcast [100 x i32]* %data.tmp to i8*
  call void @llvm.memcpy.p0.p0.i32(i8* %rcc.tmp.3, i8* %rcc.tmp.4, i32 400, i1 0)
  store i32 %len.tmp, ptr %len..tmp
  store i32 0, ptr %bytes_written
  store i32 0, ptr %data_ptr
  store i32 0, ptr %block_alloc_count
  %rcc.tmp.10 = load i32, ptr %len..tmp
  store i32 %rcc.tmp.10, ptr %max_len
  %rcc.tmp.12 = load i32, ptr %max_len
  %rcc.tmp.13 = icmp sgt i32 %rcc.tmp.12, 100
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  store i32 100, ptr %max_len
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %data_ptr
  %rcc.tmp.20 = load i32, ptr %max_len
  %rcc.tmp.21 = icmp slt i32 %rcc.tmp.19, %rcc.tmp.20
  br i1 %rcc.tmp.21, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.24 = load %FS*, ptr %fs..tmp
  %rcc.tmp.25 = getelementptr %FS, ptr %rcc.tmp.24, i32 0, i32 2
  %rcc.tmp.26 = load i32, ptr %inode_num..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [128 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %rcc.tmp.28
  %rcc.tmp.30 = sdiv i32 %rcc.tmp.29, 64
  store i32 %rcc.tmp.30, ptr %block_idx
  %rcc.tmp.32 = load i32, ptr %block_idx
  %rcc.tmp.33 = icmp sge i32 %rcc.tmp.32, 6
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.35 = sub i32 0, 1
  ret i32 %rcc.tmp.35
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.38 = load %FS*, ptr %fs..tmp
  %rcc.tmp.39 = getelementptr %FS, ptr %rcc.tmp.38, i32 0, i32 3
  %rcc.tmp.40 = load i32, ptr %inode_num..tmp
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.43 = load i32, ptr %block_idx
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 0
  %rcc.tmp.45 = getelementptr [6 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.44
  %rcc.tmp.46 = load i32, ptr %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %current_block
  %rcc.tmp.48 = load i32, ptr %current_block
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 0
  br i1 %rcc.tmp.49, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.51 = load %FS*, ptr %fs..tmp
  %rcc.tmp.52 = call i32 @allocate_block.(%FS* %rcc.tmp.51)
  store i32 %rcc.tmp.52, ptr %current_block
  %rcc.tmp.54 = load i32, ptr %current_block
  %rcc.tmp.55 = sub i32 0, 1
  %rcc.tmp.56 = icmp eq i32 %rcc.tmp.54, %rcc.tmp.55
  br i1 %rcc.tmp.56, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.58 = sub i32 0, 1
  ret i32 %rcc.tmp.58
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.61 = load %FS*, ptr %fs..tmp
  %rcc.tmp.62 = getelementptr %FS, ptr %rcc.tmp.61, i32 0, i32 3
  %rcc.tmp.63 = load i32, ptr %inode_num..tmp
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %block_idx
  %rcc.tmp.67 = add i32 %rcc.tmp.66, 0
  %rcc.tmp.68 = getelementptr [6 x i32], ptr %rcc.tmp.65, i32 0, i32 %rcc.tmp.67
  %rcc.tmp.69 = load i32, ptr %current_block
  store i32 %rcc.tmp.69, ptr %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %block_alloc_count
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 1
  store i32 %rcc.tmp.72, ptr %block_alloc_count
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.76 = load %FS*, ptr %fs..tmp
  %rcc.tmp.77 = getelementptr %FS, ptr %rcc.tmp.76, i32 0, i32 2
  %rcc.tmp.78 = load i32, ptr %inode_num..tmp
  %rcc.tmp.79 = add i32 %rcc.tmp.78, 0
  %rcc.tmp.80 = getelementptr [128 x i32], ptr %rcc.tmp.77, i32 0, i32 %rcc.tmp.79
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = srem i32 %rcc.tmp.81, 64
  store i32 %rcc.tmp.82, ptr %offset_in_block
  %rcc.tmp.84 = load i32, ptr %current_block
  %rcc.tmp.85 = mul i32 %rcc.tmp.84, 64
  %rcc.tmp.86 = load i32, ptr %offset_in_block
  %rcc.tmp.87 = add i32 %rcc.tmp.85, %rcc.tmp.86
  store i32 %rcc.tmp.87, ptr %write_addr
  %rcc.tmp.89 = load %FS*, ptr %fs..tmp
  %rcc.tmp.90 = getelementptr %FS, ptr %rcc.tmp.89, i32 0, i32 0
  %rcc.tmp.91 = load i32, ptr %write_addr
  %rcc.tmp.92 = add i32 %rcc.tmp.91, 0
  %rcc.tmp.93 = getelementptr [16384 x i32], ptr %rcc.tmp.90, i32 0, i32 %rcc.tmp.92
  %rcc.tmp.94 = load i32, ptr %data_ptr
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = getelementptr [100 x i32], ptr %data..local, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.96
  store i32 %rcc.tmp.97, ptr %rcc.tmp.93
  %rcc.tmp.99 = load %FS*, ptr %fs..tmp
  %rcc.tmp.100 = getelementptr %FS, ptr %rcc.tmp.99, i32 0, i32 2
  %rcc.tmp.101 = load i32, ptr %inode_num..tmp
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = getelementptr [128 x i32], ptr %rcc.tmp.100, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.104 = load %FS*, ptr %fs..tmp
  %rcc.tmp.105 = getelementptr %FS, ptr %rcc.tmp.104, i32 0, i32 2
  %rcc.tmp.106 = load i32, ptr %inode_num..tmp
  %rcc.tmp.107 = add i32 %rcc.tmp.106, 0
  %rcc.tmp.108 = getelementptr [128 x i32], ptr %rcc.tmp.105, i32 0, i32 %rcc.tmp.107
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.108
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %rcc.tmp.103
  %rcc.tmp.112 = load i32, ptr %data_ptr
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 1
  store i32 %rcc.tmp.113, ptr %data_ptr
  %rcc.tmp.115 = load i32, ptr %bytes_written
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %bytes_written
  br label %while.cond
while.end:
  %rcc.tmp.119 = load i32, ptr %bytes_written
  ret i32 %rcc.tmp.119
}
define i32 @read_file.(%FS* %fs.tmp, i32 %inode_num.tmp) {
entry:
  %fs..tmp = alloca %FS* 
  %inode_num..tmp = alloca i32 
  %size = alloca i32 
  %checksum = alloca i32 
  %bytes_read = alloca i32 
  %block_idx = alloca i32 
  %offset_in_block = alloca i32 
  %data_block = alloca i32 
  %read_addr = alloca i32 
  store %FS* %fs.tmp, ptr %fs..tmp
  store i32 %inode_num.tmp, ptr %inode_num..tmp
  %rcc.tmp.3 = load %FS*, ptr %fs..tmp
  %rcc.tmp.4 = getelementptr %FS, ptr %rcc.tmp.3, i32 0, i32 2
  %rcc.tmp.5 = load i32, ptr %inode_num..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = getelementptr [128 x i32], ptr %rcc.tmp.4, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.8 = load i32, ptr %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %size
  store i32 0, ptr %checksum
  store i32 0, ptr %bytes_read
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %bytes_read
  %rcc.tmp.14 = load i32, ptr %size
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.13, %rcc.tmp.14
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %bytes_read
  %rcc.tmp.19 = sdiv i32 %rcc.tmp.18, 64
  store i32 %rcc.tmp.19, ptr %block_idx
  %rcc.tmp.21 = load i32, ptr %bytes_read
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 64
  store i32 %rcc.tmp.22, ptr %offset_in_block
  %rcc.tmp.24 = load %FS*, ptr %fs..tmp
  %rcc.tmp.25 = getelementptr %FS, ptr %rcc.tmp.24, i32 0, i32 3
  %rcc.tmp.26 = load i32, ptr %inode_num..tmp
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = getelementptr [128 x [6 x i32]], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.29 = load i32, ptr %block_idx
  %rcc.tmp.30 = add i32 %rcc.tmp.29, 0
  %rcc.tmp.31 = getelementptr [6 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %data_block
  %rcc.tmp.34 = load i32, ptr %data_block
  %rcc.tmp.35 = mul i32 %rcc.tmp.34, 64
  %rcc.tmp.36 = load i32, ptr %offset_in_block
  %rcc.tmp.37 = add i32 %rcc.tmp.35, %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %read_addr
  %rcc.tmp.39 = load i32, ptr %checksum
  %rcc.tmp.40 = load %FS*, ptr %fs..tmp
  %rcc.tmp.41 = getelementptr %FS, ptr %rcc.tmp.40, i32 0, i32 0
  %rcc.tmp.42 = load i32, ptr %read_addr
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 0
  %rcc.tmp.44 = getelementptr [16384 x i32], ptr %rcc.tmp.41, i32 0, i32 %rcc.tmp.43
  %rcc.tmp.45 = load i32, ptr %rcc.tmp.44
  %rcc.tmp.46 = add i32 %rcc.tmp.39, %rcc.tmp.45
  store i32 %rcc.tmp.46, ptr %checksum
  %rcc.tmp.48 = load i32, ptr %bytes_read
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %bytes_read
  br label %while.cond
while.end:
  %rcc.tmp.52 = load i32, ptr %checksum
  ret i32 %rcc.tmp.52
}
define void @str_to_arr.([16 x i32]* sret([16 x i32]) %ret.slot, i32 %s.tmp) {
entry:
  %s..tmp = alloca i32 
  %arr = alloca [16 x i32] 
  store i32 %s.tmp, ptr %s..tmp
  %rcc.tmp.2 = getelementptr [16 x i32], ptr %arr, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.2
  %rcc.tmp.4 = getelementptr [16 x i32], ptr %arr, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.4
  %rcc.tmp.6 = getelementptr [16 x i32], ptr %arr, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.6
  %rcc.tmp.8 = getelementptr [16 x i32], ptr %arr, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.8
  %rcc.tmp.10 = getelementptr [16 x i32], ptr %arr, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = getelementptr [16 x i32], ptr %arr, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.12
  %rcc.tmp.14 = getelementptr [16 x i32], ptr %arr, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = getelementptr [16 x i32], ptr %arr, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.16
  %rcc.tmp.18 = getelementptr [16 x i32], ptr %arr, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.18
  %rcc.tmp.20 = getelementptr [16 x i32], ptr %arr, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.20
  %rcc.tmp.22 = getelementptr [16 x i32], ptr %arr, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.22
  %rcc.tmp.24 = getelementptr [16 x i32], ptr %arr, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.24
  %rcc.tmp.26 = getelementptr [16 x i32], ptr %arr, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.26
  %rcc.tmp.28 = getelementptr [16 x i32], ptr %arr, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.28
  %rcc.tmp.30 = getelementptr [16 x i32], ptr %arr, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.30
  %rcc.tmp.32 = getelementptr [16 x i32], ptr %arr, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.32
  %rcc.tmp.34 = load i32, ptr %s..tmp
  %rcc.tmp.35 = icmp eq i32 %rcc.tmp.34, 1
  br i1 %rcc.tmp.35, label %if.then, label %if.else
if.then:
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %arr, i32 0, i32 0
  store i32 102, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [16 x i32], ptr %arr, i32 0, i32 1
  store i32 105, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %arr, i32 0, i32 2
  store i32 108, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [16 x i32], ptr %arr, i32 0, i32 3
  store i32 101, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [16 x i32], ptr %arr, i32 0, i32 4
  store i32 49, ptr %rcc.tmp.45
  br label %if.merge
if.else:
  %rcc.tmp.48 = load i32, ptr %s..tmp
  %rcc.tmp.49 = icmp eq i32 %rcc.tmp.48, 2
  br i1 %rcc.tmp.49, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.51 = getelementptr [16 x i32], ptr %arr, i32 0, i32 0
  store i32 100, ptr %rcc.tmp.51
  %rcc.tmp.53 = getelementptr [16 x i32], ptr %arr, i32 0, i32 1
  store i32 97, ptr %rcc.tmp.53
  %rcc.tmp.55 = getelementptr [16 x i32], ptr %arr, i32 0, i32 2
  store i32 116, ptr %rcc.tmp.55
  %rcc.tmp.57 = getelementptr [16 x i32], ptr %arr, i32 0, i32 3
  store i32 97, ptr %rcc.tmp.57
  br label %if.merge.2
if.else.2:
  %rcc.tmp.60 = load i32, ptr %s..tmp
  %rcc.tmp.61 = icmp eq i32 %rcc.tmp.60, 3
  br i1 %rcc.tmp.61, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.63 = getelementptr [16 x i32], ptr %arr, i32 0, i32 0
  store i32 116, ptr %rcc.tmp.63
  %rcc.tmp.65 = getelementptr [16 x i32], ptr %arr, i32 0, i32 1
  store i32 101, ptr %rcc.tmp.65
  %rcc.tmp.67 = getelementptr [16 x i32], ptr %arr, i32 0, i32 2
  store i32 109, ptr %rcc.tmp.67
  %rcc.tmp.69 = getelementptr [16 x i32], ptr %arr, i32 0, i32 3
  store i32 112, ptr %rcc.tmp.69
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.75 = getelementptr [16 x i32], ptr %arr, i32 0, i32 0
  %rcc.tmp.76 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 0
  %rcc.tmp.77 = load i32, ptr %rcc.tmp.75
  store i32 %rcc.tmp.77, ptr %rcc.tmp.76
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %arr, i32 0, i32 1
  %rcc.tmp.80 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 1
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.79
  store i32 %rcc.tmp.81, ptr %rcc.tmp.80
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %arr, i32 0, i32 2
  %rcc.tmp.84 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 2
  %rcc.tmp.85 = load i32, ptr %rcc.tmp.83
  store i32 %rcc.tmp.85, ptr %rcc.tmp.84
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %arr, i32 0, i32 3
  %rcc.tmp.88 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 3
  %rcc.tmp.89 = load i32, ptr %rcc.tmp.87
  store i32 %rcc.tmp.89, ptr %rcc.tmp.88
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %arr, i32 0, i32 4
  %rcc.tmp.92 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 4
  %rcc.tmp.93 = load i32, ptr %rcc.tmp.91
  store i32 %rcc.tmp.93, ptr %rcc.tmp.92
  %rcc.tmp.95 = getelementptr [16 x i32], ptr %arr, i32 0, i32 5
  %rcc.tmp.96 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 5
  %rcc.tmp.97 = load i32, ptr %rcc.tmp.95
  store i32 %rcc.tmp.97, ptr %rcc.tmp.96
  %rcc.tmp.99 = getelementptr [16 x i32], ptr %arr, i32 0, i32 6
  %rcc.tmp.100 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 6
  %rcc.tmp.101 = load i32, ptr %rcc.tmp.99
  store i32 %rcc.tmp.101, ptr %rcc.tmp.100
  %rcc.tmp.103 = getelementptr [16 x i32], ptr %arr, i32 0, i32 7
  %rcc.tmp.104 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 7
  %rcc.tmp.105 = load i32, ptr %rcc.tmp.103
  store i32 %rcc.tmp.105, ptr %rcc.tmp.104
  %rcc.tmp.107 = getelementptr [16 x i32], ptr %arr, i32 0, i32 8
  %rcc.tmp.108 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 8
  %rcc.tmp.109 = load i32, ptr %rcc.tmp.107
  store i32 %rcc.tmp.109, ptr %rcc.tmp.108
  %rcc.tmp.111 = getelementptr [16 x i32], ptr %arr, i32 0, i32 9
  %rcc.tmp.112 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 9
  %rcc.tmp.113 = load i32, ptr %rcc.tmp.111
  store i32 %rcc.tmp.113, ptr %rcc.tmp.112
  %rcc.tmp.115 = getelementptr [16 x i32], ptr %arr, i32 0, i32 10
  %rcc.tmp.116 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 10
  %rcc.tmp.117 = load i32, ptr %rcc.tmp.115
  store i32 %rcc.tmp.117, ptr %rcc.tmp.116
  %rcc.tmp.119 = getelementptr [16 x i32], ptr %arr, i32 0, i32 11
  %rcc.tmp.120 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 11
  %rcc.tmp.121 = load i32, ptr %rcc.tmp.119
  store i32 %rcc.tmp.121, ptr %rcc.tmp.120
  %rcc.tmp.123 = getelementptr [16 x i32], ptr %arr, i32 0, i32 12
  %rcc.tmp.124 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 12
  %rcc.tmp.125 = load i32, ptr %rcc.tmp.123
  store i32 %rcc.tmp.125, ptr %rcc.tmp.124
  %rcc.tmp.127 = getelementptr [16 x i32], ptr %arr, i32 0, i32 13
  %rcc.tmp.128 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 13
  %rcc.tmp.129 = load i32, ptr %rcc.tmp.127
  store i32 %rcc.tmp.129, ptr %rcc.tmp.128
  %rcc.tmp.131 = getelementptr [16 x i32], ptr %arr, i32 0, i32 14
  %rcc.tmp.132 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 14
  %rcc.tmp.133 = load i32, ptr %rcc.tmp.131
  store i32 %rcc.tmp.133, ptr %rcc.tmp.132
  %rcc.tmp.135 = getelementptr [16 x i32], ptr %arr, i32 0, i32 15
  %rcc.tmp.136 = getelementptr [16 x i32], ptr %ret.slot, i32 0, i32 15
  %rcc.tmp.137 = load i32, ptr %rcc.tmp.135
  store i32 %rcc.tmp.137, ptr %rcc.tmp.136
  ret void
}
define void @main() {
entry:
  %fs = alloca %FS 
  %file1_name = alloca [16 x i32] 
  %file1_inode = alloca i32 
  %data1 = alloca [100 x i32] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %written1 = alloca i32 
  %checksum1 = alloca i32 
  %file2_name = alloca [16 x i32] 
  %file2_inode = alloca i32 
  %data2 = alloca [100 x i32] 
  %fill.idx.2 = alloca i32 
  %written2 = alloca i32 
  %checksum2 = alloca i32 
  %found_inode = alloca i32 
  %not_found_name = alloca [16 x i32] 
  %not_found_inode = alloca i32 
  %free_blocks = alloca i32 
  %free_inodes = alloca i32 
  %fs_checksum = alloca i32 
  %j = alloca i32 
  %data = alloca [100 x i32] 
  %fill.idx.3 = alloca i32 
  %k = alloca i32 
  %final_status = alloca i32 
  %k.2 = alloca i32 
  %final_status.2 = alloca i32 
  call void @new_fs.(%FS* %fs)
  call void @fs_format.(%FS* %fs)
  call void @str_to_arr.([16 x i32]* %file1_name, i32 1)
  %rcc.tmp.4 = call i32 @create_file.(%FS* %fs, i32 0, [16 x i32]* %file1_name)
  store i32 %rcc.tmp.4, ptr %file1_inode
  %rcc.tmp.6 = load i32, ptr %file1_inode
  call void @printlnInt.(i32 %rcc.tmp.6)
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 100
  br i1 %rcc.tmp.11, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.13 = load i32, ptr %fill.idx
  %rcc.tmp.14 = getelementptr [100 x i32], ptr %data1, i32 0, i32 %rcc.tmp.13
  store i32 0, ptr %rcc.tmp.14
  %rcc.tmp.16 = add i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.16, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = icmp slt i32 %rcc.tmp.21, 100
  br i1 %rcc.tmp.22, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [100 x i32], ptr %data1, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = mul i32 %rcc.tmp.28, 3
  store i32 %rcc.tmp.29, ptr %rcc.tmp.27
  %rcc.tmp.31 = load i32, ptr %i
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.35 = load i32, ptr %file1_inode
  %rcc.tmp.36 = call i32 @write_file.(%FS* %fs, i32 %rcc.tmp.35, [100 x i32]* %data1, i32 80)
  store i32 %rcc.tmp.36, ptr %written1
  %rcc.tmp.38 = load i32, ptr %written1
  call void @printlnInt.(i32 %rcc.tmp.38)
  %rcc.tmp.40 = load i32, ptr %file1_inode
  %rcc.tmp.41 = call i32 @read_file.(%FS* %fs, i32 %rcc.tmp.40)
  store i32 %rcc.tmp.41, ptr %checksum1
  %rcc.tmp.43 = load i32, ptr %checksum1
  call void @printlnInt.(i32 %rcc.tmp.43)
  call void @str_to_arr.([16 x i32]* %file2_name, i32 2)
  %rcc.tmp.46 = call i32 @create_file.(%FS* %fs, i32 0, [16 x i32]* %file2_name)
  store i32 %rcc.tmp.46, ptr %file2_inode
  %rcc.tmp.48 = load i32, ptr %file2_inode
  call void @printlnInt.(i32 %rcc.tmp.48)
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.52 = load i32, ptr %fill.idx.2
  %rcc.tmp.53 = icmp slt i32 %rcc.tmp.52, 100
  br i1 %rcc.tmp.53, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.55 = load i32, ptr %fill.idx.2
  %rcc.tmp.56 = getelementptr [100 x i32], ptr %data2, i32 0, i32 %rcc.tmp.55
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = add i32 %rcc.tmp.55, 1
  store i32 %rcc.tmp.58, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = icmp slt i32 %rcc.tmp.63, 100
  br i1 %rcc.tmp.64, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = getelementptr [100 x i32], ptr %data2, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.70 = load i32, ptr %i
  %rcc.tmp.71 = sub i32 100, %rcc.tmp.70
  store i32 %rcc.tmp.71, ptr %rcc.tmp.69
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.77 = load i32, ptr %file2_inode
  %rcc.tmp.78 = call i32 @write_file.(%FS* %fs, i32 %rcc.tmp.77, [100 x i32]* %data2, i32 150)
  store i32 %rcc.tmp.78, ptr %written2
  %rcc.tmp.80 = load i32, ptr %written2
  call void @printlnInt.(i32 %rcc.tmp.80)
  %rcc.tmp.82 = load i32, ptr %file2_inode
  %rcc.tmp.83 = call i32 @read_file.(%FS* %fs, i32 %rcc.tmp.82)
  store i32 %rcc.tmp.83, ptr %checksum2
  %rcc.tmp.85 = load i32, ptr %checksum2
  call void @printlnInt.(i32 %rcc.tmp.85)
  %rcc.tmp.87 = call i32 @find_in_dir.(%FS* %fs, i32 0, [16 x i32]* %file1_name)
  store i32 %rcc.tmp.87, ptr %found_inode
  %rcc.tmp.89 = load i32, ptr %found_inode
  call void @printlnInt.(i32 %rcc.tmp.89)
  call void @str_to_arr.([16 x i32]* %not_found_name, i32 3)
  %rcc.tmp.92 = call i32 @find_in_dir.(%FS* %fs, i32 0, [16 x i32]* %not_found_name)
  store i32 %rcc.tmp.92, ptr %not_found_inode
  %rcc.tmp.94 = load i32, ptr %not_found_inode
  call void @printlnInt.(i32 %rcc.tmp.94)
  store i32 0, ptr %free_blocks
  store i32 0, ptr %i
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.99 = load i32, ptr %i
  %rcc.tmp.100 = icmp slt i32 %rcc.tmp.99, 256
  br i1 %rcc.tmp.100, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  %rcc.tmp.103 = getelementptr %FS, ptr %fs, i32 0, i32 4
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = getelementptr [256 x i1], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.107 = load i1, ptr %rcc.tmp.106
  br i1 %rcc.tmp.107, label %if.then, label %if.else
if.then:
  %rcc.tmp.109 = load i32, ptr %free_blocks
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %free_blocks
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.114 = load i32, ptr %i
  %rcc.tmp.115 = add i32 %rcc.tmp.114, 1
  store i32 %rcc.tmp.115, ptr %i
  br label %while.cond.3
while.end.3:
  %rcc.tmp.118 = load i32, ptr %free_blocks
  call void @printlnInt.(i32 %rcc.tmp.118)
  store i32 0, ptr %free_inodes
  store i32 0, ptr %i
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.123 = load i32, ptr %i
  %rcc.tmp.124 = icmp slt i32 %rcc.tmp.123, 128
  br i1 %rcc.tmp.124, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.127 = getelementptr %FS, ptr %fs, i32 0, i32 5
  %rcc.tmp.128 = load i32, ptr %i
  %rcc.tmp.129 = add i32 %rcc.tmp.128, 0
  %rcc.tmp.130 = getelementptr [128 x i1], ptr %rcc.tmp.127, i32 0, i32 %rcc.tmp.129
  %rcc.tmp.131 = load i1, ptr %rcc.tmp.130
  br i1 %rcc.tmp.131, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.133 = load i32, ptr %free_inodes
  %rcc.tmp.134 = add i32 %rcc.tmp.133, 1
  store i32 %rcc.tmp.134, ptr %free_inodes
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.138 = load i32, ptr %i
  %rcc.tmp.139 = add i32 %rcc.tmp.138, 1
  store i32 %rcc.tmp.139, ptr %i
  br label %while.cond.4
while.end.4:
  %rcc.tmp.142 = load i32, ptr %free_inodes
  call void @printlnInt.(i32 %rcc.tmp.142)
  store i32 0, ptr %fs_checksum
  store i32 0, ptr %i
  br label %while.cond.5
while.cond.5:
  %rcc.tmp.147 = load i32, ptr %i
  %rcc.tmp.148 = icmp slt i32 %rcc.tmp.147, 16384
  br i1 %rcc.tmp.148, label %while.body.5, label %while.linker.5
while.linker.5:
  br label %while.end.5
while.body.5:
  %rcc.tmp.151 = load i32, ptr %fs_checksum
  %rcc.tmp.152 = getelementptr %FS, ptr %fs, i32 0, i32 0
  %rcc.tmp.153 = load i32, ptr %i
  %rcc.tmp.154 = add i32 %rcc.tmp.153, 0
  %rcc.tmp.155 = getelementptr [16384 x i32], ptr %rcc.tmp.152, i32 0, i32 %rcc.tmp.154
  %rcc.tmp.156 = load i32, ptr %rcc.tmp.155
  %rcc.tmp.157 = add i32 %rcc.tmp.151, %rcc.tmp.156
  store i32 %rcc.tmp.157, ptr %fs_checksum
  %rcc.tmp.159 = load i32, ptr %i
  %rcc.tmp.160 = add i32 %rcc.tmp.159, 1
  store i32 %rcc.tmp.160, ptr %i
  br label %while.cond.5
while.end.5:
  %rcc.tmp.163 = load i32, ptr %fs_checksum
  %rcc.tmp.164 = srem i32 %rcc.tmp.163, 10000
  call void @printlnInt.(i32 %rcc.tmp.164)
  store i32 0, ptr %j
  br label %while.cond.6
while.cond.6:
  %rcc.tmp.168 = load i32, ptr %j
  %rcc.tmp.169 = icmp slt i32 %rcc.tmp.168, 10
  br i1 %rcc.tmp.169, label %while.body.6, label %while.linker.6
while.linker.6:
  br label %while.end.6
while.body.6:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.174 = load i32, ptr %fill.idx.3
  %rcc.tmp.175 = icmp slt i32 %rcc.tmp.174, 100
  br i1 %rcc.tmp.175, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.177 = load i32, ptr %fill.idx.3
  %rcc.tmp.178 = getelementptr [100 x i32], ptr %data, i32 0, i32 %rcc.tmp.177
  store i32 0, ptr %rcc.tmp.178
  %rcc.tmp.180 = add i32 %rcc.tmp.177, 1
  store i32 %rcc.tmp.180, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %k
  br label %while.cond.7
while.cond.7:
  %rcc.tmp.185 = load i32, ptr %k
  %rcc.tmp.186 = icmp slt i32 %rcc.tmp.185, 10
  br i1 %rcc.tmp.186, label %while.body.7, label %while.linker.7
while.linker.7:
  br label %while.end.7
while.body.7:
  %rcc.tmp.189 = load i32, ptr %k
  %rcc.tmp.190 = add i32 %rcc.tmp.189, 0
  %rcc.tmp.191 = getelementptr [100 x i32], ptr %data, i32 0, i32 %rcc.tmp.190
  %rcc.tmp.192 = load i32, ptr %j
  %rcc.tmp.193 = mul i32 %rcc.tmp.192, 10
  %rcc.tmp.194 = load i32, ptr %k
  %rcc.tmp.195 = add i32 %rcc.tmp.193, %rcc.tmp.194
  store i32 %rcc.tmp.195, ptr %rcc.tmp.191
  %rcc.tmp.197 = load i32, ptr %k
  %rcc.tmp.198 = add i32 %rcc.tmp.197, 1
  store i32 %rcc.tmp.198, ptr %k
  br label %while.cond.7
while.end.7:
  %rcc.tmp.201 = load i32, ptr %file1_inode
  %rcc.tmp.202 = call i32 @write_file.(%FS* %fs, i32 %rcc.tmp.201, [100 x i32]* %data, i32 10)
  %rcc.tmp.203 = load i32, ptr %j
  %rcc.tmp.204 = add i32 %rcc.tmp.203, 1
  store i32 %rcc.tmp.204, ptr %j
  br label %while.cond.6
while.end.6:
  %rcc.tmp.207 = load i32, ptr %file1_inode
  %rcc.tmp.208 = call i32 @read_file.(%FS* %fs, i32 %rcc.tmp.207)
  call void @printlnInt.(i32 %rcc.tmp.208)
  store i32 1, ptr %final_status
  store i32 0, ptr %k.2
  br label %while.cond.8
while.cond.8:
  %rcc.tmp.213 = load i32, ptr %k.2
  %rcc.tmp.214 = icmp slt i32 %rcc.tmp.213, 5
  br i1 %rcc.tmp.214, label %while.body.8, label %while.linker.8
while.linker.8:
  br label %while.end.8
while.body.8:
  %rcc.tmp.217 = load i32, ptr %final_status
  %rcc.tmp.218 = load i32, ptr %k.2
  %rcc.tmp.219 = add i32 %rcc.tmp.217, %rcc.tmp.218
  store i32 %rcc.tmp.219, ptr %final_status.2
  %rcc.tmp.221 = load i32, ptr %k.2
  %rcc.tmp.222 = add i32 %rcc.tmp.221, 1
  store i32 %rcc.tmp.222, ptr %k.2
  br label %while.cond.8
while.end.8:
  %rcc.tmp.225 = load i32, ptr %final_status
  call void @printlnInt.(i32 %rcc.tmp.225)
  call void @exit.(i32 0)
  ret void
}
