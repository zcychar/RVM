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
  %page_size = alloca i32 
  %virtual_address_space = alloca i32 
  %physical_memory_size = alloca i32 
  %num_virtual_pages = alloca i32 
  %num_physical_frames = alloca i32 
  %page_directory = alloca [16 x i32] 
  %page_tables = alloca [16 x [16 x i32]] 
  %frame_allocation_table = alloca [64 x i32] 
  %fill.idx = alloca i32 
  %reverse_mapping = alloca [64 x i32] 
  %fill.idx.2 = alloca i32 
  %lru_counter = alloca [256 x i32] 
  %fill.idx.3 = alloca i32 
  %reference_bits = alloca [256 x i1] 
  %fill.idx.4 = alloca i32 
  %modify_bits = alloca [256 x i1] 
  %fill.idx.5 = alloca i32 
  %clock_hand = alloca i32 
  %working_set_window = alloca i32 
  %access_history = alloca [1000 x i32] 
  %fill.idx.6 = alloca i32 
  %history_head = alloca i32 
  %l1_cache = alloca [64 x [4 x i32]] 
  %fill.idx.7 = alloca i32 
  %l1_tags = alloca [64 x [4 x i32]] 
  %fill.idx.8 = alloca i32 
  %l1_valid = alloca [64 x [4 x i1]] 
  %fill.idx.9 = alloca i32 
  %l1_lru_bits = alloca [64 x [4 x i32]] 
  %fill.idx.10 = alloca i32 
  %l2_cache = alloca [128 x [8 x i32]] 
  %fill.idx.11 = alloca i32 
  %l2_tags = alloca [128 x [8 x i32]] 
  %fill.idx.12 = alloca i32 
  %l2_valid = alloca [128 x [8 x i1]] 
  %fill.idx.13 = alloca i32 
  %l2_lru_bits = alloca [128 x [8 x i32]] 
  %fill.idx.14 = alloca i32 
  %total_accesses = alloca i32 
  %page_faults = alloca i32 
  %l1_hits = alloca i32 
  %l1_misses = alloca i32 
  %l2_hits = alloca i32 
  %l2_misses = alloca i32 
  %tlb_hits = alloca i32 
  %tlb_misses = alloca i32 
  %tlb_virtual_tags = alloca [16 x i32] 
  %tlb_physical_frames = alloca [16 x i32] 
  %tlb_valid = alloca [16 x i1] 
  %tlb_lru_counters = alloca [16 x i32] 
  %free_frame_list = alloca [64 x i32] 
  %fill.idx.15 = alloca i32 
  %free_frame_count = alloca i32 
  %fragmentation_score = alloca i32 
  %i = alloca i32 
  %access_patterns = alloca i32 
  %access_count = alloca i32 
  %current_time = alloca i32 
  %virtual_address = alloca i32 
  %virtual_page = alloca i32 
  %page_offset = alloca i32 
  %tlb_hit = alloca i1 
  %physical_frame = alloca i32 
  %page_dir_index = alloca i32 
  %page_table_index = alloca i32 
  %page_table_entry = alloca i32 
  %physical_address = alloca i32 
  %l1_hit = alloca i1 
  %l2_hit = alloca i1 
  %working_set_size = alloca i32 
  %page_fault_rate = alloca i32 
  %l1_hit_rate = alloca i32 
  %l2_hit_rate = alloca i32 
  %tlb_hit_rate = alloca i32 
  %memory_utilization = alloca i32 
  %avg_memory_access_time = alloca i32 
  %final_fragmentation = alloca i32 
  call void @printlnInt.(i32 42)
  store i32 4096, ptr %page_size
  store i32 1048576, ptr %virtual_address_space
  store i32 262144, ptr %physical_memory_size
  %rcc.tmp.5 = load i32, ptr %virtual_address_space
  %rcc.tmp.6 = load i32, ptr %page_size
  %rcc.tmp.7 = sdiv i32 %rcc.tmp.5, %rcc.tmp.6
  store i32 %rcc.tmp.7, ptr %num_virtual_pages
  %rcc.tmp.9 = load i32, ptr %physical_memory_size
  %rcc.tmp.10 = load i32, ptr %page_size
  %rcc.tmp.11 = sdiv i32 %rcc.tmp.9, %rcc.tmp.10
  store i32 %rcc.tmp.11, ptr %num_physical_frames
  %rcc.tmp.13 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.13
  %rcc.tmp.15 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.15
  %rcc.tmp.17 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.17
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.19
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.21
  %rcc.tmp.23 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.23
  %rcc.tmp.25 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.25
  %rcc.tmp.27 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.27
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.29
  %rcc.tmp.31 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.31
  %rcc.tmp.33 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.33
  %rcc.tmp.35 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.35
  %rcc.tmp.37 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.37
  %rcc.tmp.39 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.39
  %rcc.tmp.41 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.41
  %rcc.tmp.43 = getelementptr [16 x i32], ptr %page_directory, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.43
  %rcc.tmp.45 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 0
  %rcc.tmp.46 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.46
  %rcc.tmp.48 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.48
  %rcc.tmp.50 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.50
  %rcc.tmp.52 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.54
  %rcc.tmp.56 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.56
  %rcc.tmp.58 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.58
  %rcc.tmp.60 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.60
  %rcc.tmp.62 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.62
  %rcc.tmp.64 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.64
  %rcc.tmp.66 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.66
  %rcc.tmp.68 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.68
  %rcc.tmp.70 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.70
  %rcc.tmp.72 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.72
  %rcc.tmp.74 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.74
  %rcc.tmp.76 = getelementptr [16 x i32], ptr %rcc.tmp.45, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.76
  %rcc.tmp.78 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 1
  %rcc.tmp.79 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.79
  %rcc.tmp.81 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.81
  %rcc.tmp.83 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.83
  %rcc.tmp.85 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.85
  %rcc.tmp.87 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.87
  %rcc.tmp.89 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.89
  %rcc.tmp.91 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.91
  %rcc.tmp.93 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.93
  %rcc.tmp.95 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.95
  %rcc.tmp.97 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.97
  %rcc.tmp.99 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.99
  %rcc.tmp.101 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.101
  %rcc.tmp.103 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.103
  %rcc.tmp.105 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.105
  %rcc.tmp.107 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.107
  %rcc.tmp.109 = getelementptr [16 x i32], ptr %rcc.tmp.78, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.109
  %rcc.tmp.111 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 2
  %rcc.tmp.112 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.112
  %rcc.tmp.114 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.114
  %rcc.tmp.116 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.116
  %rcc.tmp.118 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.118
  %rcc.tmp.120 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.120
  %rcc.tmp.122 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.122
  %rcc.tmp.124 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.124
  %rcc.tmp.126 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.126
  %rcc.tmp.128 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.128
  %rcc.tmp.130 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.130
  %rcc.tmp.132 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.132
  %rcc.tmp.134 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.134
  %rcc.tmp.136 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.136
  %rcc.tmp.138 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.138
  %rcc.tmp.140 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.140
  %rcc.tmp.142 = getelementptr [16 x i32], ptr %rcc.tmp.111, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.142
  %rcc.tmp.144 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 3
  %rcc.tmp.145 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.145
  %rcc.tmp.147 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.147
  %rcc.tmp.149 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.149
  %rcc.tmp.151 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.151
  %rcc.tmp.153 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.153
  %rcc.tmp.155 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.155
  %rcc.tmp.157 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.157
  %rcc.tmp.159 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.159
  %rcc.tmp.161 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.161
  %rcc.tmp.163 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.163
  %rcc.tmp.165 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.165
  %rcc.tmp.167 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.167
  %rcc.tmp.169 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.169
  %rcc.tmp.171 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.171
  %rcc.tmp.173 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.173
  %rcc.tmp.175 = getelementptr [16 x i32], ptr %rcc.tmp.144, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.175
  %rcc.tmp.177 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 4
  %rcc.tmp.178 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.178
  %rcc.tmp.180 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.180
  %rcc.tmp.182 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.182
  %rcc.tmp.184 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.184
  %rcc.tmp.186 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.186
  %rcc.tmp.188 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.188
  %rcc.tmp.190 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.190
  %rcc.tmp.192 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.192
  %rcc.tmp.194 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.194
  %rcc.tmp.196 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.196
  %rcc.tmp.198 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.198
  %rcc.tmp.200 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.200
  %rcc.tmp.202 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.202
  %rcc.tmp.204 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.204
  %rcc.tmp.206 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.206
  %rcc.tmp.208 = getelementptr [16 x i32], ptr %rcc.tmp.177, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.208
  %rcc.tmp.210 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 5
  %rcc.tmp.211 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.211
  %rcc.tmp.213 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.213
  %rcc.tmp.215 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.215
  %rcc.tmp.217 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.217
  %rcc.tmp.219 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.219
  %rcc.tmp.221 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.221
  %rcc.tmp.223 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.223
  %rcc.tmp.225 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.225
  %rcc.tmp.227 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.227
  %rcc.tmp.229 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.229
  %rcc.tmp.231 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.231
  %rcc.tmp.233 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.233
  %rcc.tmp.235 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.235
  %rcc.tmp.237 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.237
  %rcc.tmp.239 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.239
  %rcc.tmp.241 = getelementptr [16 x i32], ptr %rcc.tmp.210, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.241
  %rcc.tmp.243 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 6
  %rcc.tmp.244 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.244
  %rcc.tmp.246 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.246
  %rcc.tmp.248 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.248
  %rcc.tmp.250 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.250
  %rcc.tmp.252 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.252
  %rcc.tmp.254 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.254
  %rcc.tmp.256 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.256
  %rcc.tmp.258 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.258
  %rcc.tmp.260 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.260
  %rcc.tmp.262 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.262
  %rcc.tmp.264 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.264
  %rcc.tmp.266 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.266
  %rcc.tmp.268 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.268
  %rcc.tmp.270 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.270
  %rcc.tmp.272 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.272
  %rcc.tmp.274 = getelementptr [16 x i32], ptr %rcc.tmp.243, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.274
  %rcc.tmp.276 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 7
  %rcc.tmp.277 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.277
  %rcc.tmp.279 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.279
  %rcc.tmp.281 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.281
  %rcc.tmp.283 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.283
  %rcc.tmp.285 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.285
  %rcc.tmp.287 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.287
  %rcc.tmp.289 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.289
  %rcc.tmp.291 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.291
  %rcc.tmp.293 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.293
  %rcc.tmp.295 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.295
  %rcc.tmp.297 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.297
  %rcc.tmp.299 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.299
  %rcc.tmp.301 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.301
  %rcc.tmp.303 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.303
  %rcc.tmp.305 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.305
  %rcc.tmp.307 = getelementptr [16 x i32], ptr %rcc.tmp.276, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.307
  %rcc.tmp.309 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 8
  %rcc.tmp.310 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.310
  %rcc.tmp.312 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.312
  %rcc.tmp.314 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.314
  %rcc.tmp.316 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.316
  %rcc.tmp.318 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.318
  %rcc.tmp.320 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.320
  %rcc.tmp.322 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.322
  %rcc.tmp.324 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.324
  %rcc.tmp.326 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.326
  %rcc.tmp.328 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.328
  %rcc.tmp.330 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.330
  %rcc.tmp.332 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.332
  %rcc.tmp.334 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.334
  %rcc.tmp.336 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.336
  %rcc.tmp.338 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.338
  %rcc.tmp.340 = getelementptr [16 x i32], ptr %rcc.tmp.309, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.340
  %rcc.tmp.342 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 9
  %rcc.tmp.343 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.343
  %rcc.tmp.345 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.345
  %rcc.tmp.347 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.347
  %rcc.tmp.349 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.349
  %rcc.tmp.351 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.351
  %rcc.tmp.353 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.353
  %rcc.tmp.355 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.355
  %rcc.tmp.357 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.357
  %rcc.tmp.359 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.359
  %rcc.tmp.361 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.361
  %rcc.tmp.363 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.363
  %rcc.tmp.365 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.365
  %rcc.tmp.367 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.367
  %rcc.tmp.369 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.369
  %rcc.tmp.371 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.371
  %rcc.tmp.373 = getelementptr [16 x i32], ptr %rcc.tmp.342, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.373
  %rcc.tmp.375 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 10
  %rcc.tmp.376 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.376
  %rcc.tmp.378 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.378
  %rcc.tmp.380 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.380
  %rcc.tmp.382 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.382
  %rcc.tmp.384 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.384
  %rcc.tmp.386 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.386
  %rcc.tmp.388 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.388
  %rcc.tmp.390 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.390
  %rcc.tmp.392 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.392
  %rcc.tmp.394 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.394
  %rcc.tmp.396 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.396
  %rcc.tmp.398 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.398
  %rcc.tmp.400 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.400
  %rcc.tmp.402 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.402
  %rcc.tmp.404 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.404
  %rcc.tmp.406 = getelementptr [16 x i32], ptr %rcc.tmp.375, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.406
  %rcc.tmp.408 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 11
  %rcc.tmp.409 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.409
  %rcc.tmp.411 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.411
  %rcc.tmp.413 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.413
  %rcc.tmp.415 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.415
  %rcc.tmp.417 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.417
  %rcc.tmp.419 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.419
  %rcc.tmp.421 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.421
  %rcc.tmp.423 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.423
  %rcc.tmp.425 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.425
  %rcc.tmp.427 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.427
  %rcc.tmp.429 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.429
  %rcc.tmp.431 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.431
  %rcc.tmp.433 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.433
  %rcc.tmp.435 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.435
  %rcc.tmp.437 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.437
  %rcc.tmp.439 = getelementptr [16 x i32], ptr %rcc.tmp.408, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.439
  %rcc.tmp.441 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 12
  %rcc.tmp.442 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.442
  %rcc.tmp.444 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.444
  %rcc.tmp.446 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.446
  %rcc.tmp.448 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.448
  %rcc.tmp.450 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.450
  %rcc.tmp.452 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.452
  %rcc.tmp.454 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.454
  %rcc.tmp.456 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.456
  %rcc.tmp.458 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.458
  %rcc.tmp.460 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.460
  %rcc.tmp.462 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.462
  %rcc.tmp.464 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.464
  %rcc.tmp.466 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.466
  %rcc.tmp.468 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.468
  %rcc.tmp.470 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.470
  %rcc.tmp.472 = getelementptr [16 x i32], ptr %rcc.tmp.441, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.472
  %rcc.tmp.474 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 13
  %rcc.tmp.475 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.475
  %rcc.tmp.477 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.477
  %rcc.tmp.479 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.479
  %rcc.tmp.481 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.481
  %rcc.tmp.483 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.483
  %rcc.tmp.485 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.485
  %rcc.tmp.487 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.487
  %rcc.tmp.489 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.489
  %rcc.tmp.491 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.491
  %rcc.tmp.493 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.493
  %rcc.tmp.495 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.495
  %rcc.tmp.497 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.497
  %rcc.tmp.499 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.499
  %rcc.tmp.501 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.501
  %rcc.tmp.503 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.503
  %rcc.tmp.505 = getelementptr [16 x i32], ptr %rcc.tmp.474, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.505
  %rcc.tmp.507 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 14
  %rcc.tmp.508 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.508
  %rcc.tmp.510 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.510
  %rcc.tmp.512 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.512
  %rcc.tmp.514 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.514
  %rcc.tmp.516 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.516
  %rcc.tmp.518 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.518
  %rcc.tmp.520 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.520
  %rcc.tmp.522 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.522
  %rcc.tmp.524 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.524
  %rcc.tmp.526 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.526
  %rcc.tmp.528 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.528
  %rcc.tmp.530 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.530
  %rcc.tmp.532 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.532
  %rcc.tmp.534 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.534
  %rcc.tmp.536 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.536
  %rcc.tmp.538 = getelementptr [16 x i32], ptr %rcc.tmp.507, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.538
  %rcc.tmp.540 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 15
  %rcc.tmp.541 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.541
  %rcc.tmp.543 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.543
  %rcc.tmp.545 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.545
  %rcc.tmp.547 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.547
  %rcc.tmp.549 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.549
  %rcc.tmp.551 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.551
  %rcc.tmp.553 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.553
  %rcc.tmp.555 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.555
  %rcc.tmp.557 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.557
  %rcc.tmp.559 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.559
  %rcc.tmp.561 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.561
  %rcc.tmp.563 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.563
  %rcc.tmp.565 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.565
  %rcc.tmp.567 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.567
  %rcc.tmp.569 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.569
  %rcc.tmp.571 = getelementptr [16 x i32], ptr %rcc.tmp.540, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.571
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.575 = load i32, ptr %fill.idx
  %rcc.tmp.576 = icmp slt i32 %rcc.tmp.575, 64
  br i1 %rcc.tmp.576, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.578 = load i32, ptr %fill.idx
  %rcc.tmp.579 = getelementptr [64 x i32], ptr %frame_allocation_table, i32 0, i32 %rcc.tmp.578
  store i32 0, ptr %rcc.tmp.579
  %rcc.tmp.581 = add i32 %rcc.tmp.578, 1
  store i32 %rcc.tmp.581, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.cond.2:
  %rcc.tmp.586 = load i32, ptr %fill.idx.2
  %rcc.tmp.587 = icmp slt i32 %rcc.tmp.586, 64
  br i1 %rcc.tmp.587, label %array.fill.body.2, label %array.fill.end.2
array.fill.body.2:
  %rcc.tmp.589 = load i32, ptr %fill.idx.2
  %rcc.tmp.590 = getelementptr [64 x i32], ptr %reverse_mapping, i32 0, i32 %rcc.tmp.589
  %rcc.tmp.591 = sub i32 0, 1
  store i32 %rcc.tmp.591, ptr %rcc.tmp.590
  %rcc.tmp.593 = add i32 %rcc.tmp.589, 1
  store i32 %rcc.tmp.593, ptr %fill.idx.2
  br label %array.fill.cond.2
array.fill.end.2:
  store i32 0, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.cond.3:
  %rcc.tmp.598 = load i32, ptr %fill.idx.3
  %rcc.tmp.599 = icmp slt i32 %rcc.tmp.598, 256
  br i1 %rcc.tmp.599, label %array.fill.body.3, label %array.fill.end.3
array.fill.body.3:
  %rcc.tmp.601 = load i32, ptr %fill.idx.3
  %rcc.tmp.602 = getelementptr [256 x i32], ptr %lru_counter, i32 0, i32 %rcc.tmp.601
  store i32 0, ptr %rcc.tmp.602
  %rcc.tmp.604 = add i32 %rcc.tmp.601, 1
  store i32 %rcc.tmp.604, ptr %fill.idx.3
  br label %array.fill.cond.3
array.fill.end.3:
  store i32 0, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.cond.4:
  %rcc.tmp.609 = load i32, ptr %fill.idx.4
  %rcc.tmp.610 = icmp slt i32 %rcc.tmp.609, 256
  br i1 %rcc.tmp.610, label %array.fill.body.4, label %array.fill.end.4
array.fill.body.4:
  %rcc.tmp.612 = load i32, ptr %fill.idx.4
  %rcc.tmp.613 = getelementptr [256 x i1], ptr %reference_bits, i32 0, i32 %rcc.tmp.612
  store i1 0, ptr %rcc.tmp.613
  %rcc.tmp.615 = add i32 %rcc.tmp.612, 1
  store i32 %rcc.tmp.615, ptr %fill.idx.4
  br label %array.fill.cond.4
array.fill.end.4:
  store i32 0, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.cond.5:
  %rcc.tmp.620 = load i32, ptr %fill.idx.5
  %rcc.tmp.621 = icmp slt i32 %rcc.tmp.620, 256
  br i1 %rcc.tmp.621, label %array.fill.body.5, label %array.fill.end.5
array.fill.body.5:
  %rcc.tmp.623 = load i32, ptr %fill.idx.5
  %rcc.tmp.624 = getelementptr [256 x i1], ptr %modify_bits, i32 0, i32 %rcc.tmp.623
  store i1 0, ptr %rcc.tmp.624
  %rcc.tmp.626 = add i32 %rcc.tmp.623, 1
  store i32 %rcc.tmp.626, ptr %fill.idx.5
  br label %array.fill.cond.5
array.fill.end.5:
  store i32 0, ptr %clock_hand
  store i32 50, ptr %working_set_window
  store i32 0, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.cond.6:
  %rcc.tmp.633 = load i32, ptr %fill.idx.6
  %rcc.tmp.634 = icmp slt i32 %rcc.tmp.633, 1000
  br i1 %rcc.tmp.634, label %array.fill.body.6, label %array.fill.end.6
array.fill.body.6:
  %rcc.tmp.636 = load i32, ptr %fill.idx.6
  %rcc.tmp.637 = getelementptr [1000 x i32], ptr %access_history, i32 0, i32 %rcc.tmp.636
  store i32 0, ptr %rcc.tmp.637
  %rcc.tmp.639 = add i32 %rcc.tmp.636, 1
  store i32 %rcc.tmp.639, ptr %fill.idx.6
  br label %array.fill.cond.6
array.fill.end.6:
  store i32 0, ptr %history_head
  store i32 0, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.cond.7:
  %rcc.tmp.645 = load i32, ptr %fill.idx.7
  %rcc.tmp.646 = icmp slt i32 %rcc.tmp.645, 64
  br i1 %rcc.tmp.646, label %array.fill.body.7, label %array.fill.end.7
array.fill.body.7:
  %rcc.tmp.648 = load i32, ptr %fill.idx.7
  %rcc.tmp.649 = getelementptr [64 x [4 x i32]], ptr %l1_cache, i32 0, i32 %rcc.tmp.648
  %rcc.tmp.650 = getelementptr [4 x i32], ptr %rcc.tmp.649, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.650
  %rcc.tmp.652 = getelementptr [4 x i32], ptr %rcc.tmp.649, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.652
  %rcc.tmp.654 = getelementptr [4 x i32], ptr %rcc.tmp.649, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.654
  %rcc.tmp.656 = getelementptr [4 x i32], ptr %rcc.tmp.649, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.656
  %rcc.tmp.658 = add i32 %rcc.tmp.648, 1
  store i32 %rcc.tmp.658, ptr %fill.idx.7
  br label %array.fill.cond.7
array.fill.end.7:
  store i32 0, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.cond.8:
  %rcc.tmp.663 = load i32, ptr %fill.idx.8
  %rcc.tmp.664 = icmp slt i32 %rcc.tmp.663, 64
  br i1 %rcc.tmp.664, label %array.fill.body.8, label %array.fill.end.8
array.fill.body.8:
  %rcc.tmp.666 = load i32, ptr %fill.idx.8
  %rcc.tmp.667 = getelementptr [64 x [4 x i32]], ptr %l1_tags, i32 0, i32 %rcc.tmp.666
  %rcc.tmp.668 = sub i32 0, 1
  %rcc.tmp.669 = getelementptr [4 x i32], ptr %rcc.tmp.667, i32 0, i32 0
  store i32 %rcc.tmp.668, ptr %rcc.tmp.669
  %rcc.tmp.671 = getelementptr [4 x i32], ptr %rcc.tmp.667, i32 0, i32 1
  store i32 %rcc.tmp.668, ptr %rcc.tmp.671
  %rcc.tmp.673 = getelementptr [4 x i32], ptr %rcc.tmp.667, i32 0, i32 2
  store i32 %rcc.tmp.668, ptr %rcc.tmp.673
  %rcc.tmp.675 = getelementptr [4 x i32], ptr %rcc.tmp.667, i32 0, i32 3
  store i32 %rcc.tmp.668, ptr %rcc.tmp.675
  %rcc.tmp.677 = add i32 %rcc.tmp.666, 1
  store i32 %rcc.tmp.677, ptr %fill.idx.8
  br label %array.fill.cond.8
array.fill.end.8:
  store i32 0, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.cond.9:
  %rcc.tmp.682 = load i32, ptr %fill.idx.9
  %rcc.tmp.683 = icmp slt i32 %rcc.tmp.682, 64
  br i1 %rcc.tmp.683, label %array.fill.body.9, label %array.fill.end.9
array.fill.body.9:
  %rcc.tmp.685 = load i32, ptr %fill.idx.9
  %rcc.tmp.686 = getelementptr [64 x [4 x i1]], ptr %l1_valid, i32 0, i32 %rcc.tmp.685
  %rcc.tmp.687 = getelementptr [4 x i1], ptr %rcc.tmp.686, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.687
  %rcc.tmp.689 = getelementptr [4 x i1], ptr %rcc.tmp.686, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.689
  %rcc.tmp.691 = getelementptr [4 x i1], ptr %rcc.tmp.686, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.691
  %rcc.tmp.693 = getelementptr [4 x i1], ptr %rcc.tmp.686, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.693
  %rcc.tmp.695 = add i32 %rcc.tmp.685, 1
  store i32 %rcc.tmp.695, ptr %fill.idx.9
  br label %array.fill.cond.9
array.fill.end.9:
  store i32 0, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.cond.10:
  %rcc.tmp.700 = load i32, ptr %fill.idx.10
  %rcc.tmp.701 = icmp slt i32 %rcc.tmp.700, 64
  br i1 %rcc.tmp.701, label %array.fill.body.10, label %array.fill.end.10
array.fill.body.10:
  %rcc.tmp.703 = load i32, ptr %fill.idx.10
  %rcc.tmp.704 = getelementptr [64 x [4 x i32]], ptr %l1_lru_bits, i32 0, i32 %rcc.tmp.703
  %rcc.tmp.705 = getelementptr [4 x i32], ptr %rcc.tmp.704, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.705
  %rcc.tmp.707 = getelementptr [4 x i32], ptr %rcc.tmp.704, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.707
  %rcc.tmp.709 = getelementptr [4 x i32], ptr %rcc.tmp.704, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.709
  %rcc.tmp.711 = getelementptr [4 x i32], ptr %rcc.tmp.704, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.711
  %rcc.tmp.713 = add i32 %rcc.tmp.703, 1
  store i32 %rcc.tmp.713, ptr %fill.idx.10
  br label %array.fill.cond.10
array.fill.end.10:
  store i32 0, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.cond.11:
  %rcc.tmp.718 = load i32, ptr %fill.idx.11
  %rcc.tmp.719 = icmp slt i32 %rcc.tmp.718, 128
  br i1 %rcc.tmp.719, label %array.fill.body.11, label %array.fill.end.11
array.fill.body.11:
  %rcc.tmp.721 = load i32, ptr %fill.idx.11
  %rcc.tmp.722 = getelementptr [128 x [8 x i32]], ptr %l2_cache, i32 0, i32 %rcc.tmp.721
  %rcc.tmp.723 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.723
  %rcc.tmp.725 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.725
  %rcc.tmp.727 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.727
  %rcc.tmp.729 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.729
  %rcc.tmp.731 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.731
  %rcc.tmp.733 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.733
  %rcc.tmp.735 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.735
  %rcc.tmp.737 = getelementptr [8 x i32], ptr %rcc.tmp.722, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.737
  %rcc.tmp.739 = add i32 %rcc.tmp.721, 1
  store i32 %rcc.tmp.739, ptr %fill.idx.11
  br label %array.fill.cond.11
array.fill.end.11:
  store i32 0, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.cond.12:
  %rcc.tmp.744 = load i32, ptr %fill.idx.12
  %rcc.tmp.745 = icmp slt i32 %rcc.tmp.744, 128
  br i1 %rcc.tmp.745, label %array.fill.body.12, label %array.fill.end.12
array.fill.body.12:
  %rcc.tmp.747 = load i32, ptr %fill.idx.12
  %rcc.tmp.748 = getelementptr [128 x [8 x i32]], ptr %l2_tags, i32 0, i32 %rcc.tmp.747
  %rcc.tmp.749 = sub i32 0, 1
  %rcc.tmp.750 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 0
  store i32 %rcc.tmp.749, ptr %rcc.tmp.750
  %rcc.tmp.752 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 1
  store i32 %rcc.tmp.749, ptr %rcc.tmp.752
  %rcc.tmp.754 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 2
  store i32 %rcc.tmp.749, ptr %rcc.tmp.754
  %rcc.tmp.756 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 3
  store i32 %rcc.tmp.749, ptr %rcc.tmp.756
  %rcc.tmp.758 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 4
  store i32 %rcc.tmp.749, ptr %rcc.tmp.758
  %rcc.tmp.760 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 5
  store i32 %rcc.tmp.749, ptr %rcc.tmp.760
  %rcc.tmp.762 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 6
  store i32 %rcc.tmp.749, ptr %rcc.tmp.762
  %rcc.tmp.764 = getelementptr [8 x i32], ptr %rcc.tmp.748, i32 0, i32 7
  store i32 %rcc.tmp.749, ptr %rcc.tmp.764
  %rcc.tmp.766 = add i32 %rcc.tmp.747, 1
  store i32 %rcc.tmp.766, ptr %fill.idx.12
  br label %array.fill.cond.12
array.fill.end.12:
  store i32 0, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.cond.13:
  %rcc.tmp.771 = load i32, ptr %fill.idx.13
  %rcc.tmp.772 = icmp slt i32 %rcc.tmp.771, 128
  br i1 %rcc.tmp.772, label %array.fill.body.13, label %array.fill.end.13
array.fill.body.13:
  %rcc.tmp.774 = load i32, ptr %fill.idx.13
  %rcc.tmp.775 = getelementptr [128 x [8 x i1]], ptr %l2_valid, i32 0, i32 %rcc.tmp.774
  %rcc.tmp.776 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.776
  %rcc.tmp.778 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.778
  %rcc.tmp.780 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.780
  %rcc.tmp.782 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.782
  %rcc.tmp.784 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.784
  %rcc.tmp.786 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.786
  %rcc.tmp.788 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.788
  %rcc.tmp.790 = getelementptr [8 x i1], ptr %rcc.tmp.775, i32 0, i32 7
  store i1 0, ptr %rcc.tmp.790
  %rcc.tmp.792 = add i32 %rcc.tmp.774, 1
  store i32 %rcc.tmp.792, ptr %fill.idx.13
  br label %array.fill.cond.13
array.fill.end.13:
  store i32 0, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.cond.14:
  %rcc.tmp.797 = load i32, ptr %fill.idx.14
  %rcc.tmp.798 = icmp slt i32 %rcc.tmp.797, 128
  br i1 %rcc.tmp.798, label %array.fill.body.14, label %array.fill.end.14
array.fill.body.14:
  %rcc.tmp.800 = load i32, ptr %fill.idx.14
  %rcc.tmp.801 = getelementptr [128 x [8 x i32]], ptr %l2_lru_bits, i32 0, i32 %rcc.tmp.800
  %rcc.tmp.802 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.802
  %rcc.tmp.804 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.804
  %rcc.tmp.806 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.806
  %rcc.tmp.808 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.808
  %rcc.tmp.810 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.810
  %rcc.tmp.812 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.812
  %rcc.tmp.814 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.814
  %rcc.tmp.816 = getelementptr [8 x i32], ptr %rcc.tmp.801, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.816
  %rcc.tmp.818 = add i32 %rcc.tmp.800, 1
  store i32 %rcc.tmp.818, ptr %fill.idx.14
  br label %array.fill.cond.14
array.fill.end.14:
  store i32 0, ptr %total_accesses
  store i32 0, ptr %page_faults
  store i32 0, ptr %l1_hits
  store i32 0, ptr %l1_misses
  store i32 0, ptr %l2_hits
  store i32 0, ptr %l2_misses
  store i32 0, ptr %tlb_hits
  store i32 0, ptr %tlb_misses
  %rcc.tmp.829 = sub i32 0, 1
  %rcc.tmp.830 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 0
  store i32 %rcc.tmp.829, ptr %rcc.tmp.830
  %rcc.tmp.832 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 1
  store i32 %rcc.tmp.829, ptr %rcc.tmp.832
  %rcc.tmp.834 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 2
  store i32 %rcc.tmp.829, ptr %rcc.tmp.834
  %rcc.tmp.836 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 3
  store i32 %rcc.tmp.829, ptr %rcc.tmp.836
  %rcc.tmp.838 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 4
  store i32 %rcc.tmp.829, ptr %rcc.tmp.838
  %rcc.tmp.840 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 5
  store i32 %rcc.tmp.829, ptr %rcc.tmp.840
  %rcc.tmp.842 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 6
  store i32 %rcc.tmp.829, ptr %rcc.tmp.842
  %rcc.tmp.844 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 7
  store i32 %rcc.tmp.829, ptr %rcc.tmp.844
  %rcc.tmp.846 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 8
  store i32 %rcc.tmp.829, ptr %rcc.tmp.846
  %rcc.tmp.848 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 9
  store i32 %rcc.tmp.829, ptr %rcc.tmp.848
  %rcc.tmp.850 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 10
  store i32 %rcc.tmp.829, ptr %rcc.tmp.850
  %rcc.tmp.852 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 11
  store i32 %rcc.tmp.829, ptr %rcc.tmp.852
  %rcc.tmp.854 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 12
  store i32 %rcc.tmp.829, ptr %rcc.tmp.854
  %rcc.tmp.856 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 13
  store i32 %rcc.tmp.829, ptr %rcc.tmp.856
  %rcc.tmp.858 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 14
  store i32 %rcc.tmp.829, ptr %rcc.tmp.858
  %rcc.tmp.860 = getelementptr [16 x i32], ptr %tlb_virtual_tags, i32 0, i32 15
  store i32 %rcc.tmp.829, ptr %rcc.tmp.860
  %rcc.tmp.862 = sub i32 0, 1
  %rcc.tmp.863 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 0
  store i32 %rcc.tmp.862, ptr %rcc.tmp.863
  %rcc.tmp.865 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 1
  store i32 %rcc.tmp.862, ptr %rcc.tmp.865
  %rcc.tmp.867 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 2
  store i32 %rcc.tmp.862, ptr %rcc.tmp.867
  %rcc.tmp.869 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 3
  store i32 %rcc.tmp.862, ptr %rcc.tmp.869
  %rcc.tmp.871 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 4
  store i32 %rcc.tmp.862, ptr %rcc.tmp.871
  %rcc.tmp.873 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 5
  store i32 %rcc.tmp.862, ptr %rcc.tmp.873
  %rcc.tmp.875 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 6
  store i32 %rcc.tmp.862, ptr %rcc.tmp.875
  %rcc.tmp.877 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 7
  store i32 %rcc.tmp.862, ptr %rcc.tmp.877
  %rcc.tmp.879 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 8
  store i32 %rcc.tmp.862, ptr %rcc.tmp.879
  %rcc.tmp.881 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 9
  store i32 %rcc.tmp.862, ptr %rcc.tmp.881
  %rcc.tmp.883 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 10
  store i32 %rcc.tmp.862, ptr %rcc.tmp.883
  %rcc.tmp.885 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 11
  store i32 %rcc.tmp.862, ptr %rcc.tmp.885
  %rcc.tmp.887 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 12
  store i32 %rcc.tmp.862, ptr %rcc.tmp.887
  %rcc.tmp.889 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 13
  store i32 %rcc.tmp.862, ptr %rcc.tmp.889
  %rcc.tmp.891 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 14
  store i32 %rcc.tmp.862, ptr %rcc.tmp.891
  %rcc.tmp.893 = getelementptr [16 x i32], ptr %tlb_physical_frames, i32 0, i32 15
  store i32 %rcc.tmp.862, ptr %rcc.tmp.893
  %rcc.tmp.895 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 0
  store i1 0, ptr %rcc.tmp.895
  %rcc.tmp.897 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 1
  store i1 0, ptr %rcc.tmp.897
  %rcc.tmp.899 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 2
  store i1 0, ptr %rcc.tmp.899
  %rcc.tmp.901 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 3
  store i1 0, ptr %rcc.tmp.901
  %rcc.tmp.903 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 4
  store i1 0, ptr %rcc.tmp.903
  %rcc.tmp.905 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 5
  store i1 0, ptr %rcc.tmp.905
  %rcc.tmp.907 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 6
  store i1 0, ptr %rcc.tmp.907
  %rcc.tmp.909 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 7
  store i1 0, ptr %rcc.tmp.909
  %rcc.tmp.911 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 8
  store i1 0, ptr %rcc.tmp.911
  %rcc.tmp.913 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 9
  store i1 0, ptr %rcc.tmp.913
  %rcc.tmp.915 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 10
  store i1 0, ptr %rcc.tmp.915
  %rcc.tmp.917 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 11
  store i1 0, ptr %rcc.tmp.917
  %rcc.tmp.919 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 12
  store i1 0, ptr %rcc.tmp.919
  %rcc.tmp.921 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 13
  store i1 0, ptr %rcc.tmp.921
  %rcc.tmp.923 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 14
  store i1 0, ptr %rcc.tmp.923
  %rcc.tmp.925 = getelementptr [16 x i1], ptr %tlb_valid, i32 0, i32 15
  store i1 0, ptr %rcc.tmp.925
  %rcc.tmp.927 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 0
  store i32 0, ptr %rcc.tmp.927
  %rcc.tmp.929 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 1
  store i32 0, ptr %rcc.tmp.929
  %rcc.tmp.931 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 2
  store i32 0, ptr %rcc.tmp.931
  %rcc.tmp.933 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 3
  store i32 0, ptr %rcc.tmp.933
  %rcc.tmp.935 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 4
  store i32 0, ptr %rcc.tmp.935
  %rcc.tmp.937 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 5
  store i32 0, ptr %rcc.tmp.937
  %rcc.tmp.939 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 6
  store i32 0, ptr %rcc.tmp.939
  %rcc.tmp.941 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 7
  store i32 0, ptr %rcc.tmp.941
  %rcc.tmp.943 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 8
  store i32 0, ptr %rcc.tmp.943
  %rcc.tmp.945 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 9
  store i32 0, ptr %rcc.tmp.945
  %rcc.tmp.947 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 10
  store i32 0, ptr %rcc.tmp.947
  %rcc.tmp.949 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 11
  store i32 0, ptr %rcc.tmp.949
  %rcc.tmp.951 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 12
  store i32 0, ptr %rcc.tmp.951
  %rcc.tmp.953 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 13
  store i32 0, ptr %rcc.tmp.953
  %rcc.tmp.955 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 14
  store i32 0, ptr %rcc.tmp.955
  %rcc.tmp.957 = getelementptr [16 x i32], ptr %tlb_lru_counters, i32 0, i32 15
  store i32 0, ptr %rcc.tmp.957
  store i32 0, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.cond.15:
  %rcc.tmp.961 = load i32, ptr %fill.idx.15
  %rcc.tmp.962 = icmp slt i32 %rcc.tmp.961, 64
  br i1 %rcc.tmp.962, label %array.fill.body.15, label %array.fill.end.15
array.fill.body.15:
  %rcc.tmp.964 = load i32, ptr %fill.idx.15
  %rcc.tmp.965 = getelementptr [64 x i32], ptr %free_frame_list, i32 0, i32 %rcc.tmp.964
  store i32 0, ptr %rcc.tmp.965
  %rcc.tmp.967 = add i32 %rcc.tmp.964, 1
  store i32 %rcc.tmp.967, ptr %fill.idx.15
  br label %array.fill.cond.15
array.fill.end.15:
  %rcc.tmp.970 = load i32, ptr %num_physical_frames
  store i32 %rcc.tmp.970, ptr %free_frame_count
  store i32 0, ptr %fragmentation_score
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.975 = load i32, ptr %i
  %rcc.tmp.976 = load i32, ptr %num_physical_frames
  %rcc.tmp.977 = icmp slt i32 %rcc.tmp.975, %rcc.tmp.976
  br i1 %rcc.tmp.977, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.980 = load i32, ptr %i
  %rcc.tmp.981 = add i32 %rcc.tmp.980, 0
  %rcc.tmp.982 = getelementptr [64 x i32], ptr %free_frame_list, i32 0, i32 %rcc.tmp.981
  %rcc.tmp.983 = load i32, ptr %i
  store i32 %rcc.tmp.983, ptr %rcc.tmp.982
  %rcc.tmp.985 = load i32, ptr %i
  %rcc.tmp.986 = add i32 %rcc.tmp.985, 0
  %rcc.tmp.987 = getelementptr [64 x i32], ptr %frame_allocation_table, i32 0, i32 %rcc.tmp.986
  store i32 0, ptr %rcc.tmp.987
  %rcc.tmp.989 = load i32, ptr %i
  %rcc.tmp.990 = add i32 %rcc.tmp.989, 1
  store i32 %rcc.tmp.990, ptr %i
  br label %while.cond
while.end:
  store i32 5000, ptr %access_patterns
  store i32 0, ptr %access_count
  store i32 0, ptr %current_time
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.997 = load i32, ptr %access_count
  %rcc.tmp.998 = load i32, ptr %access_patterns
  %rcc.tmp.999 = icmp slt i32 %rcc.tmp.997, %rcc.tmp.998
  br i1 %rcc.tmp.999, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.1002 = load i32, ptr %current_time
  %rcc.tmp.1003 = add i32 %rcc.tmp.1002, 1
  store i32 %rcc.tmp.1003, ptr %current_time
  %rcc.tmp.1005 = load i32, ptr %access_count
  %rcc.tmp.1006 = load i32, ptr %access_patterns
  %rcc.tmp.1007 = call i32 @generate_memory_access_pattern.(i32 %rcc.tmp.1005, i32 %rcc.tmp.1006)
  store i32 %rcc.tmp.1007, ptr %virtual_address
  %rcc.tmp.1009 = load i32, ptr %virtual_address
  %rcc.tmp.1010 = load i32, ptr %page_size
  %rcc.tmp.1011 = sdiv i32 %rcc.tmp.1009, %rcc.tmp.1010
  store i32 %rcc.tmp.1011, ptr %virtual_page
  %rcc.tmp.1013 = load i32, ptr %virtual_address
  %rcc.tmp.1014 = load i32, ptr %page_size
  %rcc.tmp.1015 = srem i32 %rcc.tmp.1013, %rcc.tmp.1014
  store i32 %rcc.tmp.1015, ptr %page_offset
  %rcc.tmp.1017 = load i32, ptr %total_accesses
  %rcc.tmp.1018 = add i32 %rcc.tmp.1017, 1
  store i32 %rcc.tmp.1018, ptr %total_accesses
  %rcc.tmp.1020 = load i32, ptr %history_head
  %rcc.tmp.1021 = add i32 %rcc.tmp.1020, 0
  %rcc.tmp.1022 = getelementptr [1000 x i32], ptr %access_history, i32 0, i32 %rcc.tmp.1021
  %rcc.tmp.1023 = load i32, ptr %virtual_page
  store i32 %rcc.tmp.1023, ptr %rcc.tmp.1022
  %rcc.tmp.1025 = load i32, ptr %history_head
  %rcc.tmp.1026 = add i32 %rcc.tmp.1025, 1
  %rcc.tmp.1027 = srem i32 %rcc.tmp.1026, 1000
  store i32 %rcc.tmp.1027, ptr %history_head
  %rcc.tmp.1029 = load i32, ptr %virtual_page
  %rcc.tmp.1030 = call i1 @lookup_tlb.(i32 %rcc.tmp.1029, [16 x i32]* %tlb_virtual_tags, [16 x i1]* %tlb_valid)
  store i1 %rcc.tmp.1030, ptr %tlb_hit
  %rcc.tmp.1032 = sub i32 0, 1
  store i32 %rcc.tmp.1032, ptr %physical_frame
  %rcc.tmp.1034 = load i1, ptr %tlb_hit
  br i1 %rcc.tmp.1034, label %if.then, label %if.else
if.then:
  %rcc.tmp.1036 = load i32, ptr %tlb_hits
  %rcc.tmp.1037 = add i32 %rcc.tmp.1036, 1
  store i32 %rcc.tmp.1037, ptr %tlb_hits
  br label %if.merge
if.else:
  %rcc.tmp.1040 = load i32, ptr %tlb_misses
  %rcc.tmp.1041 = add i32 %rcc.tmp.1040, 1
  store i32 %rcc.tmp.1041, ptr %tlb_misses
  %rcc.tmp.1043 = load i32, ptr %virtual_page
  %rcc.tmp.1044 = sdiv i32 %rcc.tmp.1043, 16
  store i32 %rcc.tmp.1044, ptr %page_dir_index
  %rcc.tmp.1046 = load i32, ptr %virtual_page
  %rcc.tmp.1047 = srem i32 %rcc.tmp.1046, 16
  store i32 %rcc.tmp.1047, ptr %page_table_index
  %rcc.tmp.1049 = load i32, ptr %page_dir_index
  %rcc.tmp.1050 = add i32 %rcc.tmp.1049, 0
  %rcc.tmp.1051 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 %rcc.tmp.1050
  %rcc.tmp.1052 = load i32, ptr %page_table_index
  %rcc.tmp.1053 = add i32 %rcc.tmp.1052, 0
  %rcc.tmp.1054 = getelementptr [16 x i32], ptr %rcc.tmp.1051, i32 0, i32 %rcc.tmp.1053
  %rcc.tmp.1055 = load i32, ptr %rcc.tmp.1054
  store i32 %rcc.tmp.1055, ptr %page_table_entry
  %rcc.tmp.1057 = load i32, ptr %page_table_entry
  %rcc.tmp.1058 = icmp sgt i32 %rcc.tmp.1057, 0
  br i1 %rcc.tmp.1058, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.1060 = load i32, ptr %page_table_entry
  %rcc.tmp.1061 = sub i32 %rcc.tmp.1060, 1
  store i32 %rcc.tmp.1061, ptr %physical_frame
  %rcc.tmp.1063 = load i32, ptr %virtual_page
  %rcc.tmp.1064 = add i32 %rcc.tmp.1063, 0
  %rcc.tmp.1065 = getelementptr [256 x i1], ptr %reference_bits, i32 0, i32 %rcc.tmp.1064
  store i1 1, ptr %rcc.tmp.1065
  %rcc.tmp.1067 = load i32, ptr %virtual_page
  %rcc.tmp.1068 = add i32 %rcc.tmp.1067, 0
  %rcc.tmp.1069 = getelementptr [256 x i32], ptr %lru_counter, i32 0, i32 %rcc.tmp.1068
  %rcc.tmp.1070 = load i32, ptr %current_time
  store i32 %rcc.tmp.1070, ptr %rcc.tmp.1069
  %rcc.tmp.1072 = load i32, ptr %virtual_page
  %rcc.tmp.1073 = load i32, ptr %physical_frame
  call void @update_tlb.(i32 %rcc.tmp.1072, i32 %rcc.tmp.1073, [16 x i32]* %tlb_virtual_tags, [16 x i32]* %tlb_physical_frames, [16 x i1]* %tlb_valid, [16 x i32]* %tlb_lru_counters)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.1076 = load i32, ptr %page_faults
  %rcc.tmp.1077 = add i32 %rcc.tmp.1076, 1
  store i32 %rcc.tmp.1077, ptr %page_faults
  %rcc.tmp.1079 = load i32, ptr %free_frame_count
  %rcc.tmp.1080 = icmp sgt i32 %rcc.tmp.1079, 0
  br i1 %rcc.tmp.1080, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.1082 = call i32 @allocate_free_frame.([64 x i32]* %free_frame_list, i32* %free_frame_count, [64 x i32]* %frame_allocation_table)
  store i32 %rcc.tmp.1082, ptr %physical_frame
  br label %if.merge.3
if.else.3:
  %rcc.tmp.1085 = load i32, ptr %history_head
  %rcc.tmp.1086 = load i32, ptr %working_set_window
  %rcc.tmp.1087 = load i32, ptr %current_time
  %rcc.tmp.1088 = load i32, ptr %access_count
  %rcc.tmp.1089 = call i32 @page_replacement_algorithm.([16 x [16 x i32]]* %page_tables, [64 x i32]* %reverse_mapping, [256 x i1]* %reference_bits, [256 x i1]* %modify_bits, i32* %clock_hand, [256 x i32]* %lru_counter, [1000 x i32]* %access_history, i32 %rcc.tmp.1085, i32 %rcc.tmp.1086, i32 %rcc.tmp.1087, i32 %rcc.tmp.1088)
  store i32 %rcc.tmp.1089, ptr %physical_frame
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.1092 = load i32, ptr %physical_frame
  %rcc.tmp.1093 = icmp sge i32 %rcc.tmp.1092, 0
  br i1 %rcc.tmp.1093, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.1095 = load i32, ptr %page_dir_index
  %rcc.tmp.1096 = add i32 %rcc.tmp.1095, 0
  %rcc.tmp.1097 = getelementptr [16 x [16 x i32]], ptr %page_tables, i32 0, i32 %rcc.tmp.1096
  %rcc.tmp.1098 = load i32, ptr %page_table_index
  %rcc.tmp.1099 = add i32 %rcc.tmp.1098, 0
  %rcc.tmp.1100 = getelementptr [16 x i32], ptr %rcc.tmp.1097, i32 0, i32 %rcc.tmp.1099
  %rcc.tmp.1101 = load i32, ptr %physical_frame
  %rcc.tmp.1102 = add i32 %rcc.tmp.1101, 1
  store i32 %rcc.tmp.1102, ptr %rcc.tmp.1100
  %rcc.tmp.1104 = load i32, ptr %physical_frame
  %rcc.tmp.1105 = add i32 %rcc.tmp.1104, 0
  %rcc.tmp.1106 = getelementptr [64 x i32], ptr %reverse_mapping, i32 0, i32 %rcc.tmp.1105
  %rcc.tmp.1107 = load i32, ptr %virtual_page
  store i32 %rcc.tmp.1107, ptr %rcc.tmp.1106
  %rcc.tmp.1109 = load i32, ptr %virtual_page
  %rcc.tmp.1110 = add i32 %rcc.tmp.1109, 0
  %rcc.tmp.1111 = getelementptr [256 x i1], ptr %reference_bits, i32 0, i32 %rcc.tmp.1110
  store i1 1, ptr %rcc.tmp.1111
  %rcc.tmp.1113 = load i32, ptr %virtual_page
  %rcc.tmp.1114 = add i32 %rcc.tmp.1113, 0
  %rcc.tmp.1115 = getelementptr [256 x i32], ptr %lru_counter, i32 0, i32 %rcc.tmp.1114
  %rcc.tmp.1116 = load i32, ptr %current_time
  store i32 %rcc.tmp.1116, ptr %rcc.tmp.1115
  %rcc.tmp.1118 = load i32, ptr %physical_frame
  %rcc.tmp.1119 = add i32 %rcc.tmp.1118, 0
  %rcc.tmp.1120 = getelementptr [64 x i32], ptr %frame_allocation_table, i32 0, i32 %rcc.tmp.1119
  store i32 1, ptr %rcc.tmp.1120
  %rcc.tmp.1122 = load i32, ptr %virtual_page
  %rcc.tmp.1123 = load i32, ptr %physical_frame
  call void @update_tlb.(i32 %rcc.tmp.1122, i32 %rcc.tmp.1123, [16 x i32]* %tlb_virtual_tags, [16 x i32]* %tlb_physical_frames, [16 x i1]* %tlb_valid, [16 x i32]* %tlb_lru_counters)
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.1128 = load i32, ptr %current_time
  %rcc.tmp.1129 = add i32 %rcc.tmp.1128, 100
  store i32 %rcc.tmp.1129, ptr %current_time
  br label %if.merge
if.merge:
  %rcc.tmp.1132 = load i32, ptr %physical_frame
  %rcc.tmp.1133 = icmp sge i32 %rcc.tmp.1132, 0
  br i1 %rcc.tmp.1133, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.1135 = load i32, ptr %physical_frame
  %rcc.tmp.1136 = load i32, ptr %page_size
  %rcc.tmp.1137 = mul i32 %rcc.tmp.1135, %rcc.tmp.1136
  %rcc.tmp.1138 = load i32, ptr %page_offset
  %rcc.tmp.1139 = add i32 %rcc.tmp.1137, %rcc.tmp.1138
  store i32 %rcc.tmp.1139, ptr %physical_address
  %rcc.tmp.1141 = load i32, ptr %physical_address
  %rcc.tmp.1142 = load i32, ptr %current_time
  %rcc.tmp.1143 = call i1 @access_l1_cache.(i32 %rcc.tmp.1141, [64 x [4 x i32]]* %l1_cache, [64 x [4 x i32]]* %l1_tags, [64 x [4 x i1]]* %l1_valid, [64 x [4 x i32]]* %l1_lru_bits, i32 %rcc.tmp.1142)
  store i1 %rcc.tmp.1143, ptr %l1_hit
  %rcc.tmp.1145 = load i1, ptr %l1_hit
  br i1 %rcc.tmp.1145, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.1147 = load i32, ptr %l1_hits
  %rcc.tmp.1148 = add i32 %rcc.tmp.1147, 1
  store i32 %rcc.tmp.1148, ptr %l1_hits
  br label %if.merge.6
if.else.6:
  %rcc.tmp.1151 = load i32, ptr %l1_misses
  %rcc.tmp.1152 = add i32 %rcc.tmp.1151, 1
  store i32 %rcc.tmp.1152, ptr %l1_misses
  %rcc.tmp.1154 = load i32, ptr %physical_address
  %rcc.tmp.1155 = load i32, ptr %current_time
  %rcc.tmp.1156 = call i1 @access_l2_cache.(i32 %rcc.tmp.1154, [128 x [8 x i32]]* %l2_cache, [128 x [8 x i32]]* %l2_tags, [128 x [8 x i1]]* %l2_valid, [128 x [8 x i32]]* %l2_lru_bits, i32 %rcc.tmp.1155)
  store i1 %rcc.tmp.1156, ptr %l2_hit
  %rcc.tmp.1158 = load i1, ptr %l2_hit
  br i1 %rcc.tmp.1158, label %if.then.7, label %if.else.7
if.then.7:
  %rcc.tmp.1160 = load i32, ptr %l2_hits
  %rcc.tmp.1161 = add i32 %rcc.tmp.1160, 1
  store i32 %rcc.tmp.1161, ptr %l2_hits
  br label %if.merge.7
if.else.7:
  %rcc.tmp.1164 = load i32, ptr %l2_misses
  %rcc.tmp.1165 = add i32 %rcc.tmp.1164, 1
  store i32 %rcc.tmp.1165, ptr %l2_misses
  %rcc.tmp.1167 = load i32, ptr %current_time
  %rcc.tmp.1168 = add i32 %rcc.tmp.1167, 200
  store i32 %rcc.tmp.1168, ptr %current_time
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.merge.6:
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.1174 = load i32, ptr %access_count
  %rcc.tmp.1175 = srem i32 %rcc.tmp.1174, 4
  %rcc.tmp.1176 = icmp eq i32 %rcc.tmp.1175, 0
  br i1 %rcc.tmp.1176, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.1178 = load i32, ptr %virtual_page
  %rcc.tmp.1179 = icmp slt i32 %rcc.tmp.1178, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.1181 = phi i1 [0, %if.merge.5], [%rcc.tmp.1179, %and.rhs]
  br i1 %rcc.tmp.1181, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.1183 = load i32, ptr %virtual_page
  %rcc.tmp.1184 = add i32 %rcc.tmp.1183, 0
  %rcc.tmp.1185 = getelementptr [256 x i1], ptr %modify_bits, i32 0, i32 %rcc.tmp.1184
  store i1 1, ptr %rcc.tmp.1185
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  %rcc.tmp.1189 = load i32, ptr %access_count
  %rcc.tmp.1190 = srem i32 %rcc.tmp.1189, 500
  %rcc.tmp.1191 = icmp eq i32 %rcc.tmp.1190, 0
  br i1 %rcc.tmp.1191, label %if.then.9, label %if.else.9
if.then.9:
  %rcc.tmp.1193 = load i32, ptr %num_physical_frames
  %rcc.tmp.1194 = call i32 @analyze_memory_fragmentation.([64 x i32]* %frame_allocation_table, i32 %rcc.tmp.1193)
  store i32 %rcc.tmp.1194, ptr %fragmentation_score
  %rcc.tmp.1196 = load i32, ptr %fragmentation_score
  %rcc.tmp.1197 = icmp sgt i32 %rcc.tmp.1196, 30
  br i1 %rcc.tmp.1197, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.1199 = load i32, ptr %num_physical_frames
  call void @compact_memory.([16 x [16 x i32]]* %page_tables, [64 x i32]* %reverse_mapping, [64 x i32]* %frame_allocation_table, [64 x i32]* %free_frame_list, i32* %free_frame_count, i32 %rcc.tmp.1199)
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  %rcc.tmp.1205 = load i32, ptr %access_count
  %rcc.tmp.1206 = srem i32 %rcc.tmp.1205, 100
  %rcc.tmp.1207 = icmp eq i32 %rcc.tmp.1206, 0
  br i1 %rcc.tmp.1207, label %if.then.11, label %if.else.11
if.then.11:
  %rcc.tmp.1209 = load i32, ptr %history_head
  %rcc.tmp.1210 = load i32, ptr %working_set_window
  %rcc.tmp.1211 = call i32 @calculate_working_set_size.([1000 x i32]* %access_history, i32 %rcc.tmp.1209, i32 %rcc.tmp.1210)
  store i32 %rcc.tmp.1211, ptr %working_set_size
  %rcc.tmp.1213 = load i32, ptr %working_set_size
  %rcc.tmp.1214 = icmp sgt i32 %rcc.tmp.1213, 40
  br i1 %rcc.tmp.1214, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.1216 = load i32, ptr %working_set_window
  %rcc.tmp.1217 = add i32 %rcc.tmp.1216, 5
  store i32 %rcc.tmp.1217, ptr %working_set_window
  br label %if.merge.12
if.else.12:
  %rcc.tmp.1220 = load i32, ptr %working_set_size
  %rcc.tmp.1221 = icmp slt i32 %rcc.tmp.1220, 20
  br i1 %rcc.tmp.1221, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.1223 = load i32, ptr %working_set_window
  %rcc.tmp.1224 = icmp sgt i32 %rcc.tmp.1223, 10
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.1226 = phi i1 [0, %if.else.12], [%rcc.tmp.1224, %and.rhs.2]
  br i1 %rcc.tmp.1226, label %if.then.13, label %if.else.13
if.then.13:
  %rcc.tmp.1228 = load i32, ptr %working_set_window
  %rcc.tmp.1229 = sub i32 %rcc.tmp.1228, 5
  store i32 %rcc.tmp.1229, ptr %working_set_window
  br label %if.merge.13
if.else.13:
  br label %if.merge.13
if.merge.13:
  br label %if.merge.12
if.merge.12:
  br label %if.merge.11
if.else.11:
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.1236 = load i32, ptr %access_count
  %rcc.tmp.1237 = srem i32 %rcc.tmp.1236, 200
  %rcc.tmp.1238 = icmp eq i32 %rcc.tmp.1237, 0
  br i1 %rcc.tmp.1238, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.1240 = load i32, ptr %l1_hits
  %rcc.tmp.1241 = load i32, ptr %l1_misses
  %rcc.tmp.1242 = load i32, ptr %l2_hits
  %rcc.tmp.1243 = load i32, ptr %l2_misses
  call void @adjust_cache_policies.([64 x [4 x i32]]* %l1_lru_bits, [128 x [8 x i32]]* %l2_lru_bits, i32 %rcc.tmp.1240, i32 %rcc.tmp.1241, i32 %rcc.tmp.1242, i32 %rcc.tmp.1243)
  br label %if.merge.14
if.else.14:
  br label %if.merge.14
if.merge.14:
  %rcc.tmp.1247 = load i32, ptr %access_count
  %rcc.tmp.1248 = add i32 %rcc.tmp.1247, 1
  store i32 %rcc.tmp.1248, ptr %access_count
  br label %while.cond.2
while.end.2:
  %rcc.tmp.1251 = load i32, ptr %page_faults
  %rcc.tmp.1252 = mul i32 %rcc.tmp.1251, 100
  %rcc.tmp.1253 = load i32, ptr %total_accesses
  %rcc.tmp.1254 = sdiv i32 %rcc.tmp.1252, %rcc.tmp.1253
  store i32 %rcc.tmp.1254, ptr %page_fault_rate
  %rcc.tmp.1256 = load i32, ptr %l1_hits
  %rcc.tmp.1257 = mul i32 %rcc.tmp.1256, 100
  %rcc.tmp.1258 = load i32, ptr %total_accesses
  %rcc.tmp.1259 = sdiv i32 %rcc.tmp.1257, %rcc.tmp.1258
  store i32 %rcc.tmp.1259, ptr %l1_hit_rate
  %rcc.tmp.1261 = load i32, ptr %l2_hits
  %rcc.tmp.1262 = mul i32 %rcc.tmp.1261, 100
  %rcc.tmp.1263 = load i32, ptr %total_accesses
  %rcc.tmp.1264 = sdiv i32 %rcc.tmp.1262, %rcc.tmp.1263
  store i32 %rcc.tmp.1264, ptr %l2_hit_rate
  %rcc.tmp.1266 = load i32, ptr %tlb_hits
  %rcc.tmp.1267 = mul i32 %rcc.tmp.1266, 100
  %rcc.tmp.1268 = load i32, ptr %total_accesses
  %rcc.tmp.1269 = sdiv i32 %rcc.tmp.1267, %rcc.tmp.1268
  store i32 %rcc.tmp.1269, ptr %tlb_hit_rate
  %rcc.tmp.1271 = load i32, ptr %num_physical_frames
  %rcc.tmp.1272 = load i32, ptr %free_frame_count
  %rcc.tmp.1273 = sub i32 %rcc.tmp.1271, %rcc.tmp.1272
  %rcc.tmp.1274 = mul i32 %rcc.tmp.1273, 100
  %rcc.tmp.1275 = load i32, ptr %num_physical_frames
  %rcc.tmp.1276 = sdiv i32 %rcc.tmp.1274, %rcc.tmp.1275
  store i32 %rcc.tmp.1276, ptr %memory_utilization
  %rcc.tmp.1278 = load i32, ptr %l1_hits
  %rcc.tmp.1279 = load i32, ptr %l1_misses
  %rcc.tmp.1280 = load i32, ptr %l2_hits
  %rcc.tmp.1281 = load i32, ptr %l2_misses
  %rcc.tmp.1282 = load i32, ptr %page_faults
  %rcc.tmp.1283 = call i32 @calculate_average_memory_access_time.(i32 %rcc.tmp.1278, i32 %rcc.tmp.1279, i32 %rcc.tmp.1280, i32 %rcc.tmp.1281, i32 %rcc.tmp.1282)
  store i32 %rcc.tmp.1283, ptr %avg_memory_access_time
  %rcc.tmp.1285 = load i32, ptr %num_physical_frames
  %rcc.tmp.1286 = call i32 @analyze_memory_fragmentation.([64 x i32]* %frame_allocation_table, i32 %rcc.tmp.1285)
  store i32 %rcc.tmp.1286, ptr %final_fragmentation
  %rcc.tmp.1288 = load i32, ptr %page_fault_rate
  call void @printlnInt.(i32 %rcc.tmp.1288)
  %rcc.tmp.1290 = load i32, ptr %l1_hit_rate
  call void @printlnInt.(i32 %rcc.tmp.1290)
  %rcc.tmp.1292 = load i32, ptr %l2_hit_rate
  call void @printlnInt.(i32 %rcc.tmp.1292)
  %rcc.tmp.1294 = load i32, ptr %tlb_hit_rate
  call void @printlnInt.(i32 %rcc.tmp.1294)
  %rcc.tmp.1296 = load i32, ptr %memory_utilization
  call void @printlnInt.(i32 %rcc.tmp.1296)
  %rcc.tmp.1298 = load i32, ptr %avg_memory_access_time
  call void @printlnInt.(i32 %rcc.tmp.1298)
  %rcc.tmp.1300 = load i32, ptr %final_fragmentation
  call void @printlnInt.(i32 %rcc.tmp.1300)
  %rcc.tmp.1302 = load i32, ptr %working_set_window
  call void @printlnInt.(i32 %rcc.tmp.1302)
  call void @exit.(i32 0)
  ret void
}
define i32 @generate_memory_access_pattern.(i32 %access_num.tmp, i32 %total_accesses.tmp) {
entry:
  %access_num..tmp = alloca i32 
  %total_accesses..tmp = alloca i32 
  %pattern_type = alloca i32 
  %base_addr = alloca i32 
  %working_set_base = alloca i32 
  store i32 %access_num.tmp, ptr %access_num..tmp
  store i32 %total_accesses.tmp, ptr %total_accesses..tmp
  %rcc.tmp.3 = load i32, ptr %access_num..tmp
  %rcc.tmp.4 = sdiv i32 %rcc.tmp.3, 100
  %rcc.tmp.5 = srem i32 %rcc.tmp.4, 6
  store i32 %rcc.tmp.5, ptr %pattern_type
  %rcc.tmp.7 = load i32, ptr %pattern_type
  %rcc.tmp.8 = icmp eq i32 %rcc.tmp.7, 0
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %access_num..tmp
  %rcc.tmp.11 = mul i32 %rcc.tmp.10, 64
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 1048576
  br label %if.merge
if.else:
  %rcc.tmp.14 = load i32, ptr %pattern_type
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 1
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %access_num..tmp
  %rcc.tmp.18 = mul i32 %rcc.tmp.17, 17
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 23
  %rcc.tmp.20 = mul i32 %rcc.tmp.19, 131
  %rcc.tmp.21 = add i32 %rcc.tmp.20, 47
  %rcc.tmp.22 = srem i32 %rcc.tmp.21, 1048576
  br label %if.merge.2
if.else.2:
  %rcc.tmp.24 = load i32, ptr %pattern_type
  %rcc.tmp.25 = icmp eq i32 %rcc.tmp.24, 2
  br i1 %rcc.tmp.25, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.27 = load i32, ptr %access_num..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.27, 512
  %rcc.tmp.29 = srem i32 %rcc.tmp.28, 1048576
  br label %if.merge.3
if.else.3:
  %rcc.tmp.31 = load i32, ptr %pattern_type
  %rcc.tmp.32 = icmp eq i32 %rcc.tmp.31, 3
  br i1 %rcc.tmp.32, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.34 = load i32, ptr %access_num..tmp
  %rcc.tmp.35 = sdiv i32 %rcc.tmp.34, 50
  %rcc.tmp.36 = mul i32 %rcc.tmp.35, 8192
  %rcc.tmp.37 = srem i32 %rcc.tmp.36, 1048576
  store i32 %rcc.tmp.37, ptr %base_addr
  %rcc.tmp.39 = load i32, ptr %access_num..tmp
  %rcc.tmp.40 = mul i32 %rcc.tmp.39, 7
  %rcc.tmp.41 = srem i32 %rcc.tmp.40, 10
  %rcc.tmp.42 = icmp slt i32 %rcc.tmp.41, 8
  br i1 %rcc.tmp.42, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.44 = load i32, ptr %base_addr
  %rcc.tmp.45 = load i32, ptr %access_num..tmp
  %rcc.tmp.46 = mul i32 %rcc.tmp.45, 3
  %rcc.tmp.47 = srem i32 %rcc.tmp.46, 1024
  %rcc.tmp.48 = add i32 %rcc.tmp.44, %rcc.tmp.47
  br label %if.merge.5
if.else.5:
  %rcc.tmp.50 = load i32, ptr %access_num..tmp
  %rcc.tmp.51 = mul i32 %rcc.tmp.50, 19
  %rcc.tmp.52 = add i32 %rcc.tmp.51, 37
  %rcc.tmp.53 = mul i32 %rcc.tmp.52, 113
  %rcc.tmp.54 = srem i32 %rcc.tmp.53, 1048576
  br label %if.merge.5
if.merge.5:
  %rcc.tmp.56 = phi i32 [%rcc.tmp.48, %if.then.5], [%rcc.tmp.54, %if.else.5]
  br label %if.merge.4
if.else.4:
  %rcc.tmp.58 = load i32, ptr %pattern_type
  %rcc.tmp.59 = icmp eq i32 %rcc.tmp.58, 4
  br i1 %rcc.tmp.59, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.61 = load i32, ptr %access_num..tmp
  %rcc.tmp.62 = sdiv i32 %rcc.tmp.61, 200
  %rcc.tmp.63 = mul i32 %rcc.tmp.62, 16384
  %rcc.tmp.64 = srem i32 %rcc.tmp.63, 1048576
  store i32 %rcc.tmp.64, ptr %working_set_base
  %rcc.tmp.66 = load i32, ptr %working_set_base
  %rcc.tmp.67 = load i32, ptr %access_num..tmp
  %rcc.tmp.68 = mul i32 %rcc.tmp.67, 5
  %rcc.tmp.69 = srem i32 %rcc.tmp.68, 4096
  %rcc.tmp.70 = add i32 %rcc.tmp.66, %rcc.tmp.69
  br label %if.merge.6
if.else.6:
  %rcc.tmp.72 = load i32, ptr %access_num..tmp
  %rcc.tmp.73 = mul i32 %rcc.tmp.72, 97
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 113
  %rcc.tmp.75 = mul i32 %rcc.tmp.74, 211
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 307
  %rcc.tmp.77 = srem i32 %rcc.tmp.76, 1048576
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.79 = phi i32 [%rcc.tmp.70, %if.then.6], [%rcc.tmp.77, %if.else.6]
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.81 = phi i32 [%rcc.tmp.56, %if.merge.5], [%rcc.tmp.79, %if.merge.6]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.83 = phi i32 [%rcc.tmp.29, %if.then.3], [%rcc.tmp.81, %if.merge.4]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.85 = phi i32 [%rcc.tmp.22, %if.then.2], [%rcc.tmp.83, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.87 = phi i32 [%rcc.tmp.12, %if.then], [%rcc.tmp.85, %if.merge.2]
  ret i32 %rcc.tmp.87
}
define i1 @lookup_tlb.(i32 %virtual_page.tmp, [16 x i32]* %tlb_tags.tmp, [16 x i1]* %tlb_valid.tmp) {
entry:
  %virtual_page..tmp = alloca i32 
  %tlb_tags..tmp = alloca [16 x i32]* 
  %tlb_valid..tmp = alloca [16 x i1]* 
  %i = alloca i32 
  store i32 %virtual_page.tmp, ptr %virtual_page..tmp
  store [16 x i32]* %tlb_tags.tmp, ptr %tlb_tags..tmp
  store [16 x i1]* %tlb_valid.tmp, ptr %tlb_valid..tmp
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.6 = load i32, ptr %i
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 16
  br i1 %rcc.tmp.7, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = load [16 x i1]*, ptr %tlb_valid..tmp
  %rcc.tmp.13 = getelementptr [16 x i1], ptr %rcc.tmp.12, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.14 = load i1, ptr %rcc.tmp.13
  br i1 %rcc.tmp.14, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.16 = load i32, ptr %i
  %rcc.tmp.17 = add i32 %rcc.tmp.16, 0
  %rcc.tmp.18 = load [16 x i32]*, ptr %tlb_tags..tmp
  %rcc.tmp.19 = getelementptr [16 x i32], ptr %rcc.tmp.18, i32 0, i32 %rcc.tmp.17
  %rcc.tmp.20 = load i32, ptr %rcc.tmp.19
  %rcc.tmp.21 = load i32, ptr %virtual_page..tmp
  %rcc.tmp.22 = icmp eq i32 %rcc.tmp.20, %rcc.tmp.21
  br label %sc.merge
sc.merge:
  %rcc.tmp.24 = phi i1 [0, %while.body], [%rcc.tmp.22, %and.rhs]
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.28 = load i32, ptr %i
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %i
  br label %while.cond
while.end:
  ret i1 0
}
define void @update_tlb.(i32 %virtual_page.tmp, i32 %physical_frame.tmp, [16 x i32]* %tlb_tags.tmp, [16 x i32]* %tlb_frames.tmp, [16 x i1]* %tlb_valid.tmp, [16 x i32]* %tlb_lru.tmp) {
entry:
  %virtual_page..tmp = alloca i32 
  %physical_frame..tmp = alloca i32 
  %tlb_tags..tmp = alloca [16 x i32]* 
  %tlb_frames..tmp = alloca [16 x i32]* 
  %tlb_valid..tmp = alloca [16 x i1]* 
  %tlb_lru..tmp = alloca [16 x i32]* 
  %lru_index = alloca i32 
  %min_counter = alloca i32 
  %i = alloca i32 
  store i32 %virtual_page.tmp, ptr %virtual_page..tmp
  store i32 %physical_frame.tmp, ptr %physical_frame..tmp
  store [16 x i32]* %tlb_tags.tmp, ptr %tlb_tags..tmp
  store [16 x i32]* %tlb_frames.tmp, ptr %tlb_frames..tmp
  store [16 x i1]* %tlb_valid.tmp, ptr %tlb_valid..tmp
  store [16 x i32]* %tlb_lru.tmp, ptr %tlb_lru..tmp
  store i32 0, ptr %lru_index
  %rcc.tmp.8 = load [16 x i32]*, ptr %tlb_lru..tmp
  %rcc.tmp.9 = getelementptr [16 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %min_counter
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 16
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [16 x i32]*, ptr %tlb_lru..tmp
  %rcc.tmp.21 = getelementptr [16 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  %rcc.tmp.23 = load i32, ptr %min_counter
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then, label %if.else
if.then:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [16 x i32]*, ptr %tlb_lru..tmp
  %rcc.tmp.29 = getelementptr [16 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %min_counter
  %rcc.tmp.32 = load i32, ptr %i
  store i32 %rcc.tmp.32, ptr %lru_index
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.36 = load i32, ptr %i
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 1
  store i32 %rcc.tmp.37, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.40 = load i32, ptr %lru_index
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 0
  %rcc.tmp.42 = load [16 x i32]*, ptr %tlb_tags..tmp
  %rcc.tmp.43 = getelementptr [16 x i32], ptr %rcc.tmp.42, i32 0, i32 %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %virtual_page..tmp
  store i32 %rcc.tmp.44, ptr %rcc.tmp.43
  %rcc.tmp.46 = load i32, ptr %lru_index
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [16 x i32]*, ptr %tlb_frames..tmp
  %rcc.tmp.49 = getelementptr [16 x i32], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i32, ptr %physical_frame..tmp
  store i32 %rcc.tmp.50, ptr %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %lru_index
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [16 x i1]*, ptr %tlb_valid..tmp
  %rcc.tmp.55 = getelementptr [16 x i1], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  store i1 1, ptr %rcc.tmp.55
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 16
  br i1 %rcc.tmp.60, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.63 = load i32, ptr %i
  %rcc.tmp.64 = load i32, ptr %lru_index
  %rcc.tmp.65 = icmp eq i32 %rcc.tmp.63, %rcc.tmp.64
  br i1 %rcc.tmp.65, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.67 = load i32, ptr %i
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [16 x i32]*, ptr %tlb_lru..tmp
  %rcc.tmp.70 = getelementptr [16 x i32], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  store i32 1000, ptr %rcc.tmp.70
  br label %if.merge.2
if.else.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 0
  %rcc.tmp.75 = load [16 x i32]*, ptr %tlb_lru..tmp
  %rcc.tmp.76 = getelementptr [16 x i32], ptr %rcc.tmp.75, i32 0, i32 %rcc.tmp.74
  %rcc.tmp.77 = load i32, ptr %i
  %rcc.tmp.78 = add i32 %rcc.tmp.77, 0
  %rcc.tmp.79 = load [16 x i32]*, ptr %tlb_lru..tmp
  %rcc.tmp.80 = getelementptr [16 x i32], ptr %rcc.tmp.79, i32 0, i32 %rcc.tmp.78
  %rcc.tmp.81 = load i32, ptr %rcc.tmp.80
  %rcc.tmp.82 = sub i32 %rcc.tmp.81, 1
  store i32 %rcc.tmp.82, ptr %rcc.tmp.76
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @allocate_free_frame.([64 x i32]* %free_list.tmp, i32* %free_count.tmp, [64 x i32]* %allocation_table.tmp) {
entry:
  %free_list..tmp = alloca [64 x i32]* 
  %free_count..tmp = alloca i32* 
  %allocation_table..tmp = alloca [64 x i32]* 
  %frame = alloca i32 
  store [64 x i32]* %free_list.tmp, ptr %free_list..tmp
  store i32* %free_count.tmp, ptr %free_count..tmp
  store [64 x i32]* %allocation_table.tmp, ptr %allocation_table..tmp
  %rcc.tmp.4 = load i32*, ptr %free_count..tmp
  %rcc.tmp.5 = load i32, ptr %rcc.tmp.4
  %rcc.tmp.6 = icmp sle i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = sub i32 0, 1
  ret i32 %rcc.tmp.8
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.11 = load i32*, ptr %free_count..tmp
  %rcc.tmp.12 = load i32*, ptr %free_count..tmp
  %rcc.tmp.13 = load i32, ptr %rcc.tmp.12
  %rcc.tmp.14 = sub i32 %rcc.tmp.13, 1
  store i32 %rcc.tmp.14, ptr %rcc.tmp.11
  %rcc.tmp.16 = load i32*, ptr %free_count..tmp
  %rcc.tmp.17 = load i32, ptr %rcc.tmp.16
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [64 x i32]*, ptr %free_list..tmp
  %rcc.tmp.20 = getelementptr [64 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %frame
  %rcc.tmp.23 = load i32, ptr %frame
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = load [64 x i32]*, ptr %allocation_table..tmp
  %rcc.tmp.26 = getelementptr [64 x i32], ptr %rcc.tmp.25, i32 0, i32 %rcc.tmp.24
  store i32 1, ptr %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %frame
  ret i32 %rcc.tmp.28
}
define i32 @page_replacement_algorithm.([16 x [16 x i32]]* %page_tables.tmp, [64 x i32]* %reverse_mapping.tmp, [256 x i1]* %reference_bits.tmp, [256 x i1]* %modify_bits.tmp, i32* %clock_hand.tmp, [256 x i32]* %lru_counter.tmp, [1000 x i32]* %access_history.tmp, i32 %history_head.tmp, i32 %working_set_window.tmp, i32 %current_time.tmp, i32 %access_num.tmp) {
entry:
  %page_tables..tmp = alloca [16 x [16 x i32]]* 
  %reverse_mapping..tmp = alloca [64 x i32]* 
  %reference_bits..tmp = alloca [256 x i1]* 
  %modify_bits..tmp = alloca [256 x i1]* 
  %clock_hand..tmp = alloca i32* 
  %lru_counter..tmp = alloca [256 x i32]* 
  %access_history..tmp = alloca [1000 x i32]* 
  %history_head..tmp = alloca i32 
  %working_set_window..tmp = alloca i32 
  %current_time..tmp = alloca i32 
  %access_num..tmp = alloca i32 
  %algorithm_choice = alloca i32 
  store [16 x [16 x i32]]* %page_tables.tmp, ptr %page_tables..tmp
  store [64 x i32]* %reverse_mapping.tmp, ptr %reverse_mapping..tmp
  store [256 x i1]* %reference_bits.tmp, ptr %reference_bits..tmp
  store [256 x i1]* %modify_bits.tmp, ptr %modify_bits..tmp
  store i32* %clock_hand.tmp, ptr %clock_hand..tmp
  store [256 x i32]* %lru_counter.tmp, ptr %lru_counter..tmp
  store [1000 x i32]* %access_history.tmp, ptr %access_history..tmp
  store i32 %history_head.tmp, ptr %history_head..tmp
  store i32 %working_set_window.tmp, ptr %working_set_window..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  store i32 %access_num.tmp, ptr %access_num..tmp
  %rcc.tmp.12 = load i32, ptr %access_num..tmp
  %rcc.tmp.13 = sdiv i32 %rcc.tmp.12, 50
  %rcc.tmp.14 = srem i32 %rcc.tmp.13, 4
  store i32 %rcc.tmp.14, ptr %algorithm_choice
  %rcc.tmp.16 = load i32, ptr %algorithm_choice
  %rcc.tmp.17 = icmp eq i32 %rcc.tmp.16, 0
  br i1 %rcc.tmp.17, label %if.then, label %if.else
if.then:
  %rcc.tmp.19 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.20 = load [256 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.21 = load [256 x i1]*, ptr %modify_bits..tmp
  %rcc.tmp.22 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.23 = call i32 @enhanced_clock_replacement.([64 x i32]* %rcc.tmp.19, [256 x i1]* %rcc.tmp.20, [256 x i1]* %rcc.tmp.21, i32* %rcc.tmp.22)
  br label %if.merge
if.else:
  %rcc.tmp.25 = load i32, ptr %algorithm_choice
  %rcc.tmp.26 = icmp eq i32 %rcc.tmp.25, 1
  br i1 %rcc.tmp.26, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.28 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.29 = load [256 x i32]*, ptr %lru_counter..tmp
  %rcc.tmp.30 = load i32, ptr %current_time..tmp
  %rcc.tmp.31 = call i32 @lru_replacement.([64 x i32]* %rcc.tmp.28, [256 x i32]* %rcc.tmp.29, i32 %rcc.tmp.30)
  br label %if.merge.2
if.else.2:
  %rcc.tmp.33 = load i32, ptr %algorithm_choice
  %rcc.tmp.34 = icmp eq i32 %rcc.tmp.33, 2
  br i1 %rcc.tmp.34, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.36 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.37 = load [1000 x i32]*, ptr %access_history..tmp
  %rcc.tmp.38 = load i32, ptr %history_head..tmp
  %rcc.tmp.39 = load i32, ptr %working_set_window..tmp
  %rcc.tmp.40 = call i32 @working_set_replacement.([64 x i32]* %rcc.tmp.36, [1000 x i32]* %rcc.tmp.37, i32 %rcc.tmp.38, i32 %rcc.tmp.39)
  br label %if.merge.3
if.else.3:
  %rcc.tmp.42 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.43 = load [256 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.44 = load [256 x i1]*, ptr %modify_bits..tmp
  %rcc.tmp.45 = load [256 x i32]*, ptr %lru_counter..tmp
  %rcc.tmp.46 = load i32, ptr %current_time..tmp
  %rcc.tmp.47 = load [1000 x i32]*, ptr %access_history..tmp
  %rcc.tmp.48 = load i32, ptr %history_head..tmp
  %rcc.tmp.49 = load i32, ptr %working_set_window..tmp
  %rcc.tmp.50 = call i32 @adaptive_replacement.([64 x i32]* %rcc.tmp.42, [256 x i1]* %rcc.tmp.43, [256 x i1]* %rcc.tmp.44, [256 x i32]* %rcc.tmp.45, i32 %rcc.tmp.46, [1000 x i32]* %rcc.tmp.47, i32 %rcc.tmp.48, i32 %rcc.tmp.49)
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.52 = phi i32 [%rcc.tmp.40, %if.then.3], [%rcc.tmp.50, %if.else.3]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.54 = phi i32 [%rcc.tmp.31, %if.then.2], [%rcc.tmp.52, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.56 = phi i32 [%rcc.tmp.23, %if.then], [%rcc.tmp.54, %if.merge.2]
  ret i32 %rcc.tmp.56
}
define i32 @enhanced_clock_replacement.([64 x i32]* %reverse_mapping.tmp, [256 x i1]* %reference_bits.tmp, [256 x i1]* %modify_bits.tmp, i32* %clock_hand.tmp) {
entry:
  %reverse_mapping..tmp = alloca [64 x i32]* 
  %reference_bits..tmp = alloca [256 x i1]* 
  %modify_bits..tmp = alloca [256 x i1]* 
  %clock_hand..tmp = alloca i32* 
  %start_hand = alloca i32 
  %passes = alloca i32 
  %frame = alloca i32 
  %virtual_page = alloca i32 
  %victim = alloca i32 
  store [64 x i32]* %reverse_mapping.tmp, ptr %reverse_mapping..tmp
  store [256 x i1]* %reference_bits.tmp, ptr %reference_bits..tmp
  store [256 x i1]* %modify_bits.tmp, ptr %modify_bits..tmp
  store i32* %clock_hand.tmp, ptr %clock_hand..tmp
  %rcc.tmp.5 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.6 = load i32, ptr %rcc.tmp.5
  store i32 %rcc.tmp.6, ptr %start_hand
  store i32 0, ptr %passes
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %passes
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 3
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.15 = load i32, ptr %rcc.tmp.14
  store i32 %rcc.tmp.15, ptr %frame
  %rcc.tmp.17 = load i32, ptr %frame
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.20 = getelementptr [64 x i32], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %rcc.tmp.20
  store i32 %rcc.tmp.21, ptr %virtual_page
  %rcc.tmp.23 = load i32, ptr %virtual_page
  %rcc.tmp.24 = icmp sge i32 %rcc.tmp.23, 0
  br i1 %rcc.tmp.24, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.26 = load i32, ptr %virtual_page
  %rcc.tmp.27 = icmp slt i32 %rcc.tmp.26, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.29 = phi i1 [0, %while.body], [%rcc.tmp.27, %and.rhs]
  br i1 %rcc.tmp.29, label %if.then, label %if.else
if.then:
  %rcc.tmp.31 = load i32, ptr %virtual_page
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 0
  %rcc.tmp.33 = load [256 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.34 = getelementptr [256 x i1], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.32
  %rcc.tmp.35 = load i1, ptr %rcc.tmp.34
  %rcc.tmp.36 = xor i1 %rcc.tmp.35, true
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load i32, ptr %virtual_page
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [256 x i1]*, ptr %modify_bits..tmp
  %rcc.tmp.41 = getelementptr [256 x i1], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = load i1, ptr %rcc.tmp.41
  %rcc.tmp.43 = xor i1 %rcc.tmp.42, true
  br i1 %rcc.tmp.43, label %sc.merge.2, label %or.rhs
or.rhs:
  %rcc.tmp.45 = load i32, ptr %passes
  %rcc.tmp.46 = icmp sge i32 %rcc.tmp.45, 2
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.48 = phi i1 [1, %if.then.2], [%rcc.tmp.46, %or.rhs]
  br i1 %rcc.tmp.48, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.50 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.51 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 1
  %rcc.tmp.54 = srem i32 %rcc.tmp.53, 64
  store i32 %rcc.tmp.54, ptr %rcc.tmp.50
  %rcc.tmp.56 = load i32, ptr %frame
  ret i32 %rcc.tmp.56
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.60 = load i32, ptr %virtual_page
  %rcc.tmp.61 = add i32 %rcc.tmp.60, 0
  %rcc.tmp.62 = load [256 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.63 = getelementptr [256 x i1], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.61
  store i1 0, ptr %rcc.tmp.63
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.68 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.69 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.70 = load i32, ptr %rcc.tmp.69
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = srem i32 %rcc.tmp.71, 64
  store i32 %rcc.tmp.72, ptr %rcc.tmp.68
  %rcc.tmp.74 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.75 = load i32, ptr %rcc.tmp.74
  %rcc.tmp.76 = load i32, ptr %start_hand
  %rcc.tmp.77 = icmp eq i32 %rcc.tmp.75, %rcc.tmp.76
  br i1 %rcc.tmp.77, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.79 = load i32, ptr %passes
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 1
  store i32 %rcc.tmp.80, ptr %passes
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  br label %while.cond
while.end:
  %rcc.tmp.85 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.86 = load i32, ptr %rcc.tmp.85
  store i32 %rcc.tmp.86, ptr %victim
  %rcc.tmp.88 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.89 = load i32*, ptr %clock_hand..tmp
  %rcc.tmp.90 = load i32, ptr %rcc.tmp.89
  %rcc.tmp.91 = add i32 %rcc.tmp.90, 1
  %rcc.tmp.92 = srem i32 %rcc.tmp.91, 64
  store i32 %rcc.tmp.92, ptr %rcc.tmp.88
  %rcc.tmp.94 = load i32, ptr %victim
  ret i32 %rcc.tmp.94
}
define i32 @lru_replacement.([64 x i32]* %reverse_mapping.tmp, [256 x i32]* %lru_counter.tmp, i32 %current_time.tmp) {
entry:
  %reverse_mapping..tmp = alloca [64 x i32]* 
  %lru_counter..tmp = alloca [256 x i32]* 
  %current_time..tmp = alloca i32 
  %victim_frame = alloca i32 
  %oldest_time = alloca i32 
  %i = alloca i32 
  %virtual_page = alloca i32 
  store [64 x i32]* %reverse_mapping.tmp, ptr %reverse_mapping..tmp
  store [256 x i32]* %lru_counter.tmp, ptr %lru_counter..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  store i32 0, ptr %victim_frame
  %rcc.tmp.5 = load i32, ptr %current_time..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 1
  store i32 %rcc.tmp.6, ptr %oldest_time
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.10, 64
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.17 = getelementptr [64 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  store i32 %rcc.tmp.18, ptr %virtual_page
  %rcc.tmp.20 = load i32, ptr %virtual_page
  %rcc.tmp.21 = icmp sge i32 %rcc.tmp.20, 0
  br i1 %rcc.tmp.21, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.23 = load i32, ptr %virtual_page
  %rcc.tmp.24 = icmp slt i32 %rcc.tmp.23, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.26 = phi i1 [0, %while.body], [%rcc.tmp.24, %and.rhs]
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %virtual_page
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [256 x i32]*, ptr %lru_counter..tmp
  %rcc.tmp.31 = getelementptr [256 x i32], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %rcc.tmp.31
  %rcc.tmp.33 = load i32, ptr %oldest_time
  %rcc.tmp.34 = icmp slt i32 %rcc.tmp.32, %rcc.tmp.33
  br i1 %rcc.tmp.34, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.36 = load i32, ptr %virtual_page
  %rcc.tmp.37 = add i32 %rcc.tmp.36, 0
  %rcc.tmp.38 = load [256 x i32]*, ptr %lru_counter..tmp
  %rcc.tmp.39 = getelementptr [256 x i32], ptr %rcc.tmp.38, i32 0, i32 %rcc.tmp.37
  %rcc.tmp.40 = load i32, ptr %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %oldest_time
  %rcc.tmp.42 = load i32, ptr %i
  store i32 %rcc.tmp.42, ptr %victim_frame
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.48 = load i32, ptr %i
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 1
  store i32 %rcc.tmp.49, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.52 = load i32, ptr %victim_frame
  ret i32 %rcc.tmp.52
}
define i32 @working_set_replacement.([64 x i32]* %reverse_mapping.tmp, [1000 x i32]* %access_history.tmp, i32 %history_head.tmp, i32 %window_size.tmp) {
entry:
  %reverse_mapping..tmp = alloca [64 x i32]* 
  %access_history..tmp = alloca [1000 x i32]* 
  %history_head..tmp = alloca i32 
  %window_size..tmp = alloca i32 
  %working_set = alloca [256 x i1] 
  %fill.idx = alloca i32 
  %i = alloca i32 
  %start_pos = alloca i32 
  %pos = alloca i32 
  %page = alloca i32 
  %virtual_page = alloca i32 
  store [64 x i32]* %reverse_mapping.tmp, ptr %reverse_mapping..tmp
  store [1000 x i32]* %access_history.tmp, ptr %access_history..tmp
  store i32 %history_head.tmp, ptr %history_head..tmp
  store i32 %window_size.tmp, ptr %window_size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.7 = load i32, ptr %fill.idx
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 256
  br i1 %rcc.tmp.8, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.10 = load i32, ptr %fill.idx
  %rcc.tmp.11 = getelementptr [256 x i1], ptr %working_set, i32 0, i32 %rcc.tmp.10
  store i1 0, ptr %rcc.tmp.11
  %rcc.tmp.13 = add i32 %rcc.tmp.10, 1
  store i32 %rcc.tmp.13, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %i
  %rcc.tmp.17 = load i32, ptr %history_head..tmp
  %rcc.tmp.18 = load i32, ptr %window_size..tmp
  %rcc.tmp.19 = icmp sge i32 %rcc.tmp.17, %rcc.tmp.18
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %history_head..tmp
  %rcc.tmp.22 = load i32, ptr %window_size..tmp
  %rcc.tmp.23 = sub i32 %rcc.tmp.21, %rcc.tmp.22
  br label %if.merge
if.else:
  %rcc.tmp.25 = load i32, ptr %window_size..tmp
  %rcc.tmp.26 = load i32, ptr %history_head..tmp
  %rcc.tmp.27 = sub i32 %rcc.tmp.25, %rcc.tmp.26
  %rcc.tmp.28 = sub i32 1000, %rcc.tmp.27
  br label %if.merge
if.merge:
  %rcc.tmp.30 = phi i32 [%rcc.tmp.23, %if.then], [%rcc.tmp.28, %if.else]
  store i32 %rcc.tmp.30, ptr %start_pos
  %rcc.tmp.32 = load i32, ptr %start_pos
  store i32 %rcc.tmp.32, ptr %pos
  br label %while.cond
while.cond:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %window_size..tmp
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.40 = load i32, ptr %pos
  %rcc.tmp.41 = icmp sge i32 %rcc.tmp.40, 0
  br i1 %rcc.tmp.41, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.43 = load i32, ptr %pos
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.43, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.46 = phi i1 [0, %while.body], [%rcc.tmp.44, %and.rhs]
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.48 = load i32, ptr %pos
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [1000 x i32]*, ptr %access_history..tmp
  %rcc.tmp.51 = getelementptr [1000 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %page
  %rcc.tmp.54 = load i32, ptr %page
  %rcc.tmp.55 = icmp sge i32 %rcc.tmp.54, 0
  br i1 %rcc.tmp.55, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.57 = load i32, ptr %page
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 256
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.60 = phi i1 [0, %if.then.2], [%rcc.tmp.58, %and.rhs.2]
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.62 = load i32, ptr %page
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [256 x i1], ptr %working_set, i32 0, i32 %rcc.tmp.63
  store i1 1, ptr %rcc.tmp.64
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.70 = load i32, ptr %pos
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 1
  %rcc.tmp.72 = srem i32 %rcc.tmp.71, 1000
  store i32 %rcc.tmp.72, ptr %pos
  %rcc.tmp.74 = load i32, ptr %i
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %i
  br label %while.cond
while.end:
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.80 = load i32, ptr %i
  %rcc.tmp.81 = icmp slt i32 %rcc.tmp.80, 64
  br i1 %rcc.tmp.81, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.84 = load i32, ptr %i
  %rcc.tmp.85 = add i32 %rcc.tmp.84, 0
  %rcc.tmp.86 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.87 = getelementptr [64 x i32], ptr %rcc.tmp.86, i32 0, i32 %rcc.tmp.85
  %rcc.tmp.88 = load i32, ptr %rcc.tmp.87
  store i32 %rcc.tmp.88, ptr %virtual_page
  %rcc.tmp.90 = load i32, ptr %virtual_page
  %rcc.tmp.91 = icmp sge i32 %rcc.tmp.90, 0
  br i1 %rcc.tmp.91, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.93 = load i32, ptr %virtual_page
  %rcc.tmp.94 = icmp slt i32 %rcc.tmp.93, 256
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.96 = phi i1 [0, %while.body.2], [%rcc.tmp.94, %and.rhs.3]
  br i1 %rcc.tmp.96, label %and.rhs.4, label %sc.merge.4
and.rhs.4:
  %rcc.tmp.98 = load i32, ptr %virtual_page
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [256 x i1], ptr %working_set, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i1, ptr %rcc.tmp.100
  %rcc.tmp.102 = xor i1 %rcc.tmp.101, true
  br label %sc.merge.4
sc.merge.4:
  %rcc.tmp.104 = phi i1 [0, %sc.merge.3], [%rcc.tmp.102, %and.rhs.4]
  br i1 %rcc.tmp.104, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.106 = load i32, ptr %i
  ret i32 %rcc.tmp.106
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = add i32 %rcc.tmp.109, 1
  store i32 %rcc.tmp.110, ptr %i
  br label %while.cond.2
while.end.2:
  %rcc.tmp.113 = load i32, ptr %history_head..tmp
  %rcc.tmp.114 = mul i32 %rcc.tmp.113, 7
  %rcc.tmp.115 = srem i32 %rcc.tmp.114, 64
  ret i32 %rcc.tmp.115
}
define i32 @adaptive_replacement.([64 x i32]* %reverse_mapping.tmp, [256 x i1]* %reference_bits.tmp, [256 x i1]* %modify_bits.tmp, [256 x i32]* %lru_counter.tmp, i32 %current_time.tmp, [1000 x i32]* %access_history.tmp, i32 %history_head.tmp, i32 %window_size.tmp) {
entry:
  %reverse_mapping..tmp = alloca [64 x i32]* 
  %reference_bits..tmp = alloca [256 x i1]* 
  %modify_bits..tmp = alloca [256 x i1]* 
  %lru_counter..tmp = alloca [256 x i32]* 
  %current_time..tmp = alloca i32 
  %access_history..tmp = alloca [1000 x i32]* 
  %history_head..tmp = alloca i32 
  %window_size..tmp = alloca i32 
  %best_frame = alloca i32 
  %best_score = alloca i32 
  %i = alloca i32 
  %virtual_page = alloca i32 
  %score = alloca i32 
  %age = alloca i32 
  %in_working_set = alloca i1 
  store [64 x i32]* %reverse_mapping.tmp, ptr %reverse_mapping..tmp
  store [256 x i1]* %reference_bits.tmp, ptr %reference_bits..tmp
  store [256 x i1]* %modify_bits.tmp, ptr %modify_bits..tmp
  store [256 x i32]* %lru_counter.tmp, ptr %lru_counter..tmp
  store i32 %current_time.tmp, ptr %current_time..tmp
  store [1000 x i32]* %access_history.tmp, ptr %access_history..tmp
  store i32 %history_head.tmp, ptr %history_head..tmp
  store i32 %window_size.tmp, ptr %window_size..tmp
  store i32 0, ptr %best_frame
  %rcc.tmp.10 = sub i32 0, 1
  store i32 %rcc.tmp.10, ptr %best_score
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 64
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = add i32 %rcc.tmp.18, 0
  %rcc.tmp.20 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.21 = getelementptr [64 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.19
  %rcc.tmp.22 = load i32, ptr %rcc.tmp.21
  store i32 %rcc.tmp.22, ptr %virtual_page
  %rcc.tmp.24 = load i32, ptr %virtual_page
  %rcc.tmp.25 = icmp sge i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.27 = load i32, ptr %virtual_page
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.27, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.30 = phi i1 [0, %while.body], [%rcc.tmp.28, %and.rhs]
  br i1 %rcc.tmp.30, label %if.then, label %if.else
if.then:
  store i32 0, ptr %score
  %rcc.tmp.33 = load i32, ptr %current_time..tmp
  %rcc.tmp.34 = load i32, ptr %virtual_page
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = load [256 x i32]*, ptr %lru_counter..tmp
  %rcc.tmp.37 = getelementptr [256 x i32], ptr %rcc.tmp.36, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %rcc.tmp.37
  %rcc.tmp.39 = sub i32 %rcc.tmp.33, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %age
  %rcc.tmp.41 = load i32, ptr %score
  %rcc.tmp.42 = load i32, ptr %age
  %rcc.tmp.43 = sdiv i32 %rcc.tmp.42, 10
  %rcc.tmp.44 = add i32 %rcc.tmp.41, %rcc.tmp.43
  store i32 %rcc.tmp.44, ptr %score
  %rcc.tmp.46 = load i32, ptr %virtual_page
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 0
  %rcc.tmp.48 = load [256 x i1]*, ptr %reference_bits..tmp
  %rcc.tmp.49 = getelementptr [256 x i1], ptr %rcc.tmp.48, i32 0, i32 %rcc.tmp.47
  %rcc.tmp.50 = load i1, ptr %rcc.tmp.49
  %rcc.tmp.51 = xor i1 %rcc.tmp.50, true
  br i1 %rcc.tmp.51, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.53 = load i32, ptr %score
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 50
  store i32 %rcc.tmp.54, ptr %score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.58 = load i32, ptr %virtual_page
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [256 x i1]*, ptr %modify_bits..tmp
  %rcc.tmp.61 = getelementptr [256 x i1], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i1, ptr %rcc.tmp.61
  %rcc.tmp.63 = xor i1 %rcc.tmp.62, true
  br i1 %rcc.tmp.63, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.65 = load i32, ptr %score
  %rcc.tmp.66 = add i32 %rcc.tmp.65, 30
  store i32 %rcc.tmp.66, ptr %score
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.70 = load i32, ptr %virtual_page
  %rcc.tmp.71 = load [1000 x i32]*, ptr %access_history..tmp
  %rcc.tmp.72 = load i32, ptr %history_head..tmp
  %rcc.tmp.73 = load i32, ptr %window_size..tmp
  %rcc.tmp.74 = call i1 @check_working_set_membership.(i32 %rcc.tmp.70, [1000 x i32]* %rcc.tmp.71, i32 %rcc.tmp.72, i32 %rcc.tmp.73)
  store i1 %rcc.tmp.74, ptr %in_working_set
  %rcc.tmp.76 = load i1, ptr %in_working_set
  %rcc.tmp.77 = xor i1 %rcc.tmp.76, true
  br i1 %rcc.tmp.77, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.79 = load i32, ptr %score
  %rcc.tmp.80 = add i32 %rcc.tmp.79, 40
  store i32 %rcc.tmp.80, ptr %score
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.84 = load i32, ptr %score
  %rcc.tmp.85 = load i32, ptr %best_score
  %rcc.tmp.86 = icmp sgt i32 %rcc.tmp.84, %rcc.tmp.85
  br i1 %rcc.tmp.86, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.88 = load i32, ptr %score
  store i32 %rcc.tmp.88, ptr %best_score
  %rcc.tmp.90 = load i32, ptr %i
  store i32 %rcc.tmp.90, ptr %best_frame
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.96 = load i32, ptr %i
  %rcc.tmp.97 = add i32 %rcc.tmp.96, 1
  store i32 %rcc.tmp.97, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.100 = load i32, ptr %best_frame
  ret i32 %rcc.tmp.100
}
define i1 @check_working_set_membership.(i32 %page.tmp, [1000 x i32]* %access_history.tmp, i32 %history_head.tmp, i32 %window_size.tmp) {
entry:
  %page..tmp = alloca i32 
  %access_history..tmp = alloca [1000 x i32]* 
  %history_head..tmp = alloca i32 
  %window_size..tmp = alloca i32 
  %i = alloca i32 
  %start_pos = alloca i32 
  %pos = alloca i32 
  store i32 %page.tmp, ptr %page..tmp
  store [1000 x i32]* %access_history.tmp, ptr %access_history..tmp
  store i32 %history_head.tmp, ptr %history_head..tmp
  store i32 %window_size.tmp, ptr %window_size..tmp
  store i32 0, ptr %i
  %rcc.tmp.6 = load i32, ptr %history_head..tmp
  %rcc.tmp.7 = load i32, ptr %window_size..tmp
  %rcc.tmp.8 = icmp sge i32 %rcc.tmp.6, %rcc.tmp.7
  br i1 %rcc.tmp.8, label %if.then, label %if.else
if.then:
  %rcc.tmp.10 = load i32, ptr %history_head..tmp
  %rcc.tmp.11 = load i32, ptr %window_size..tmp
  %rcc.tmp.12 = sub i32 %rcc.tmp.10, %rcc.tmp.11
  br label %if.merge
if.else:
  %rcc.tmp.14 = load i32, ptr %window_size..tmp
  %rcc.tmp.15 = load i32, ptr %history_head..tmp
  %rcc.tmp.16 = sub i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = sub i32 1000, %rcc.tmp.16
  br label %if.merge
if.merge:
  %rcc.tmp.19 = phi i32 [%rcc.tmp.12, %if.then], [%rcc.tmp.17, %if.else]
  store i32 %rcc.tmp.19, ptr %start_pos
  %rcc.tmp.21 = load i32, ptr %start_pos
  store i32 %rcc.tmp.21, ptr %pos
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = load i32, ptr %window_size..tmp
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.29 = load i32, ptr %pos
  %rcc.tmp.30 = icmp sge i32 %rcc.tmp.29, 0
  br i1 %rcc.tmp.30, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.32 = load i32, ptr %pos
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.35 = phi i1 [0, %while.body], [%rcc.tmp.33, %and.rhs]
  br i1 %rcc.tmp.35, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.37 = load i32, ptr %pos
  %rcc.tmp.38 = add i32 %rcc.tmp.37, 0
  %rcc.tmp.39 = load [1000 x i32]*, ptr %access_history..tmp
  %rcc.tmp.40 = getelementptr [1000 x i32], ptr %rcc.tmp.39, i32 0, i32 %rcc.tmp.38
  %rcc.tmp.41 = load i32, ptr %rcc.tmp.40
  %rcc.tmp.42 = load i32, ptr %page..tmp
  %rcc.tmp.43 = icmp eq i32 %rcc.tmp.41, %rcc.tmp.42
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.45 = phi i1 [0, %sc.merge], [%rcc.tmp.43, %and.rhs.2]
  br i1 %rcc.tmp.45, label %if.then.2, label %if.else.2
if.then.2:
  ret i1 1
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.49 = load i32, ptr %pos
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 1
  %rcc.tmp.51 = srem i32 %rcc.tmp.50, 1000
  store i32 %rcc.tmp.51, ptr %pos
  %rcc.tmp.53 = load i32, ptr %i
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %i
  br label %while.cond
while.end:
  ret i1 0
}
define i1 @access_l1_cache.(i32 %address.tmp, [64 x [4 x i32]]* %cache.tmp, [64 x [4 x i32]]* %tags.tmp, [64 x [4 x i1]]* %valid.tmp, [64 x [4 x i32]]* %lru_bits.tmp, i32 %time.tmp) {
entry:
  %address..tmp = alloca i32 
  %cache..tmp = alloca [64 x [4 x i32]]* 
  %tags..tmp = alloca [64 x [4 x i32]]* 
  %valid..tmp = alloca [64 x [4 x i1]]* 
  %lru_bits..tmp = alloca [64 x [4 x i32]]* 
  %time..tmp = alloca i32 
  %set_index = alloca i32 
  %tag = alloca i32 
  %i = alloca i32 
  %victim_way = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  store [64 x [4 x i32]]* %cache.tmp, ptr %cache..tmp
  store [64 x [4 x i32]]* %tags.tmp, ptr %tags..tmp
  store [64 x [4 x i1]]* %valid.tmp, ptr %valid..tmp
  store [64 x [4 x i32]]* %lru_bits.tmp, ptr %lru_bits..tmp
  store i32 %time.tmp, ptr %time..tmp
  %rcc.tmp.7 = load i32, ptr %address..tmp
  %rcc.tmp.8 = sdiv i32 %rcc.tmp.7, 64
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 64
  store i32 %rcc.tmp.9, ptr %set_index
  %rcc.tmp.11 = load i32, ptr %address..tmp
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.11, 64
  %rcc.tmp.13 = sdiv i32 %rcc.tmp.12, 64
  store i32 %rcc.tmp.13, ptr %tag
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 4
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %set_index
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [64 x [4 x i1]]*, ptr %valid..tmp
  %rcc.tmp.24 = getelementptr [64 x [4 x i1]], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [4 x i1], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i1, ptr %rcc.tmp.27
  br i1 %rcc.tmp.28, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.30 = load i32, ptr %set_index
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [64 x [4 x i32]]*, ptr %tags..tmp
  %rcc.tmp.33 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [4 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %tag
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.37, %rcc.tmp.38
  br label %sc.merge
sc.merge:
  %rcc.tmp.41 = phi i1 [0, %while.body], [%rcc.tmp.39, %and.rhs]
  br i1 %rcc.tmp.41, label %if.then, label %if.else
if.then:
  %rcc.tmp.43 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.44 = load i32, ptr %set_index
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load i32, ptr %time..tmp
  call void @update_cache_lru.([64 x [4 x i32]]* %rcc.tmp.43, i32 %rcc.tmp.44, i32 %rcc.tmp.45, i32 %rcc.tmp.46, i32 4)
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.54 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.55 = load i32, ptr %set_index
  %rcc.tmp.56 = call i32 @find_lru_way.([64 x [4 x i32]]* %rcc.tmp.54, i32 %rcc.tmp.55, i32 4)
  store i32 %rcc.tmp.56, ptr %victim_way
  %rcc.tmp.58 = load i32, ptr %set_index
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [64 x [4 x i32]]*, ptr %tags..tmp
  %rcc.tmp.61 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %victim_way
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [4 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %tag
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %set_index
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [64 x [4 x i1]]*, ptr %valid..tmp
  %rcc.tmp.70 = getelementptr [64 x [4 x i1]], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %victim_way
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [4 x i1], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.72
  store i1 1, ptr %rcc.tmp.73
  %rcc.tmp.75 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.76 = load i32, ptr %set_index
  %rcc.tmp.77 = load i32, ptr %victim_way
  %rcc.tmp.78 = load i32, ptr %time..tmp
  call void @update_cache_lru.([64 x [4 x i32]]* %rcc.tmp.75, i32 %rcc.tmp.76, i32 %rcc.tmp.77, i32 %rcc.tmp.78, i32 4)
  ret i1 0
}
define i1 @access_l2_cache.(i32 %address.tmp, [128 x [8 x i32]]* %cache.tmp, [128 x [8 x i32]]* %tags.tmp, [128 x [8 x i1]]* %valid.tmp, [128 x [8 x i32]]* %lru_bits.tmp, i32 %time.tmp) {
entry:
  %address..tmp = alloca i32 
  %cache..tmp = alloca [128 x [8 x i32]]* 
  %tags..tmp = alloca [128 x [8 x i32]]* 
  %valid..tmp = alloca [128 x [8 x i1]]* 
  %lru_bits..tmp = alloca [128 x [8 x i32]]* 
  %time..tmp = alloca i32 
  %set_index = alloca i32 
  %tag = alloca i32 
  %i = alloca i32 
  %victim_way = alloca i32 
  store i32 %address.tmp, ptr %address..tmp
  store [128 x [8 x i32]]* %cache.tmp, ptr %cache..tmp
  store [128 x [8 x i32]]* %tags.tmp, ptr %tags..tmp
  store [128 x [8 x i1]]* %valid.tmp, ptr %valid..tmp
  store [128 x [8 x i32]]* %lru_bits.tmp, ptr %lru_bits..tmp
  store i32 %time.tmp, ptr %time..tmp
  %rcc.tmp.7 = load i32, ptr %address..tmp
  %rcc.tmp.8 = sdiv i32 %rcc.tmp.7, 64
  %rcc.tmp.9 = srem i32 %rcc.tmp.8, 128
  store i32 %rcc.tmp.9, ptr %set_index
  %rcc.tmp.11 = load i32, ptr %address..tmp
  %rcc.tmp.12 = sdiv i32 %rcc.tmp.11, 64
  %rcc.tmp.13 = sdiv i32 %rcc.tmp.12, 128
  store i32 %rcc.tmp.13, ptr %tag
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 8
  br i1 %rcc.tmp.18, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.21 = load i32, ptr %set_index
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = load [128 x [8 x i1]]*, ptr %valid..tmp
  %rcc.tmp.24 = getelementptr [128 x [8 x i1]], ptr %rcc.tmp.23, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.25 = load i32, ptr %i
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 0
  %rcc.tmp.27 = getelementptr [8 x i1], ptr %rcc.tmp.24, i32 0, i32 %rcc.tmp.26
  %rcc.tmp.28 = load i1, ptr %rcc.tmp.27
  br i1 %rcc.tmp.28, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.30 = load i32, ptr %set_index
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [128 x [8 x i32]]*, ptr %tags..tmp
  %rcc.tmp.33 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [8 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  %rcc.tmp.38 = load i32, ptr %tag
  %rcc.tmp.39 = icmp eq i32 %rcc.tmp.37, %rcc.tmp.38
  br label %sc.merge
sc.merge:
  %rcc.tmp.41 = phi i1 [0, %while.body], [%rcc.tmp.39, %and.rhs]
  br i1 %rcc.tmp.41, label %if.then, label %if.else
if.then:
  %rcc.tmp.43 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.44 = load i32, ptr %set_index
  %rcc.tmp.45 = load i32, ptr %i
  %rcc.tmp.46 = load i32, ptr %time..tmp
  call void @update_cache_lru_8way.([128 x [8 x i32]]* %rcc.tmp.43, i32 %rcc.tmp.44, i32 %rcc.tmp.45, i32 %rcc.tmp.46)
  ret i1 1
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.50 = load i32, ptr %i
  %rcc.tmp.51 = add i32 %rcc.tmp.50, 1
  store i32 %rcc.tmp.51, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.54 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.55 = load i32, ptr %set_index
  %rcc.tmp.56 = call i32 @find_lru_way_8.([128 x [8 x i32]]* %rcc.tmp.54, i32 %rcc.tmp.55)
  store i32 %rcc.tmp.56, ptr %victim_way
  %rcc.tmp.58 = load i32, ptr %set_index
  %rcc.tmp.59 = add i32 %rcc.tmp.58, 0
  %rcc.tmp.60 = load [128 x [8 x i32]]*, ptr %tags..tmp
  %rcc.tmp.61 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.60, i32 0, i32 %rcc.tmp.59
  %rcc.tmp.62 = load i32, ptr %victim_way
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [8 x i32], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i32, ptr %tag
  store i32 %rcc.tmp.65, ptr %rcc.tmp.64
  %rcc.tmp.67 = load i32, ptr %set_index
  %rcc.tmp.68 = add i32 %rcc.tmp.67, 0
  %rcc.tmp.69 = load [128 x [8 x i1]]*, ptr %valid..tmp
  %rcc.tmp.70 = getelementptr [128 x [8 x i1]], ptr %rcc.tmp.69, i32 0, i32 %rcc.tmp.68
  %rcc.tmp.71 = load i32, ptr %victim_way
  %rcc.tmp.72 = add i32 %rcc.tmp.71, 0
  %rcc.tmp.73 = getelementptr [8 x i1], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.72
  store i1 1, ptr %rcc.tmp.73
  %rcc.tmp.75 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.76 = load i32, ptr %set_index
  %rcc.tmp.77 = load i32, ptr %victim_way
  %rcc.tmp.78 = load i32, ptr %time..tmp
  call void @update_cache_lru_8way.([128 x [8 x i32]]* %rcc.tmp.75, i32 %rcc.tmp.76, i32 %rcc.tmp.77, i32 %rcc.tmp.78)
  ret i1 0
}
define void @update_cache_lru.([64 x [4 x i32]]* %lru_bits.tmp, i32 %set_index.tmp, i32 %way.tmp, i32 %time.tmp, i32 %ways.tmp) {
entry:
  %lru_bits..tmp = alloca [64 x [4 x i32]]* 
  %set_index..tmp = alloca i32 
  %way..tmp = alloca i32 
  %time..tmp = alloca i32 
  %ways..tmp = alloca i32 
  store [64 x [4 x i32]]* %lru_bits.tmp, ptr %lru_bits..tmp
  store i32 %set_index.tmp, ptr %set_index..tmp
  store i32 %way.tmp, ptr %way..tmp
  store i32 %time.tmp, ptr %time..tmp
  store i32 %ways.tmp, ptr %ways..tmp
  %rcc.tmp.6 = load i32, ptr %set_index..tmp
  %rcc.tmp.7 = add i32 %rcc.tmp.6, 0
  %rcc.tmp.8 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.9 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.7
  %rcc.tmp.10 = load i32, ptr %way..tmp
  %rcc.tmp.11 = add i32 %rcc.tmp.10, 0
  %rcc.tmp.12 = getelementptr [4 x i32], ptr %rcc.tmp.9, i32 0, i32 %rcc.tmp.11
  %rcc.tmp.13 = load i32, ptr %time..tmp
  store i32 %rcc.tmp.13, ptr %rcc.tmp.12
  ret void
}
define void @update_cache_lru_8way.([128 x [8 x i32]]* %lru_bits.tmp, i32 %set_index.tmp, i32 %way.tmp, i32 %time.tmp) {
entry:
  %lru_bits..tmp = alloca [128 x [8 x i32]]* 
  %set_index..tmp = alloca i32 
  %way..tmp = alloca i32 
  %time..tmp = alloca i32 
  store [128 x [8 x i32]]* %lru_bits.tmp, ptr %lru_bits..tmp
  store i32 %set_index.tmp, ptr %set_index..tmp
  store i32 %way.tmp, ptr %way..tmp
  store i32 %time.tmp, ptr %time..tmp
  %rcc.tmp.5 = load i32, ptr %set_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.8 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = load i32, ptr %way..tmp
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 0
  %rcc.tmp.11 = getelementptr [8 x i32], ptr %rcc.tmp.8, i32 0, i32 %rcc.tmp.10
  %rcc.tmp.12 = load i32, ptr %time..tmp
  store i32 %rcc.tmp.12, ptr %rcc.tmp.11
  ret void
}
define i32 @find_lru_way.([64 x [4 x i32]]* %lru_bits.tmp, i32 %set_index.tmp, i32 %ways.tmp) {
entry:
  %lru_bits..tmp = alloca [64 x [4 x i32]]* 
  %set_index..tmp = alloca i32 
  %ways..tmp = alloca i32 
  %lru_way = alloca i32 
  %min_time = alloca i32 
  %i = alloca i32 
  store [64 x [4 x i32]]* %lru_bits.tmp, ptr %lru_bits..tmp
  store i32 %set_index.tmp, ptr %set_index..tmp
  store i32 %ways.tmp, ptr %ways..tmp
  store i32 0, ptr %lru_way
  %rcc.tmp.5 = load i32, ptr %set_index..tmp
  %rcc.tmp.6 = add i32 %rcc.tmp.5, 0
  %rcc.tmp.7 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.8 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.7, i32 0, i32 %rcc.tmp.6
  %rcc.tmp.9 = getelementptr [4 x i32], ptr %rcc.tmp.8, i32 0, i32 0
  %rcc.tmp.10 = load i32, ptr %rcc.tmp.9
  store i32 %rcc.tmp.10, ptr %min_time
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = load i32, ptr %ways..tmp
  %rcc.tmp.16 = icmp slt i32 %rcc.tmp.14, %rcc.tmp.15
  br i1 %rcc.tmp.16, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.19 = load i32, ptr %set_index..tmp
  %rcc.tmp.20 = add i32 %rcc.tmp.19, 0
  %rcc.tmp.21 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.22 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.21, i32 0, i32 %rcc.tmp.20
  %rcc.tmp.23 = load i32, ptr %i
  %rcc.tmp.24 = add i32 %rcc.tmp.23, 0
  %rcc.tmp.25 = getelementptr [4 x i32], ptr %rcc.tmp.22, i32 0, i32 %rcc.tmp.24
  %rcc.tmp.26 = load i32, ptr %rcc.tmp.25
  %rcc.tmp.27 = load i32, ptr %min_time
  %rcc.tmp.28 = icmp slt i32 %rcc.tmp.26, %rcc.tmp.27
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %set_index..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.30, 0
  %rcc.tmp.32 = load [64 x [4 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.33 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.32, i32 0, i32 %rcc.tmp.31
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 0
  %rcc.tmp.36 = getelementptr [4 x i32], ptr %rcc.tmp.33, i32 0, i32 %rcc.tmp.35
  %rcc.tmp.37 = load i32, ptr %rcc.tmp.36
  store i32 %rcc.tmp.37, ptr %min_time
  %rcc.tmp.39 = load i32, ptr %i
  store i32 %rcc.tmp.39, ptr %lru_way
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.43 = load i32, ptr %i
  %rcc.tmp.44 = add i32 %rcc.tmp.43, 1
  store i32 %rcc.tmp.44, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.47 = load i32, ptr %lru_way
  ret i32 %rcc.tmp.47
}
define i32 @find_lru_way_8.([128 x [8 x i32]]* %lru_bits.tmp, i32 %set_index.tmp) {
entry:
  %lru_bits..tmp = alloca [128 x [8 x i32]]* 
  %set_index..tmp = alloca i32 
  %lru_way = alloca i32 
  %min_time = alloca i32 
  %i = alloca i32 
  store [128 x [8 x i32]]* %lru_bits.tmp, ptr %lru_bits..tmp
  store i32 %set_index.tmp, ptr %set_index..tmp
  store i32 0, ptr %lru_way
  %rcc.tmp.4 = load i32, ptr %set_index..tmp
  %rcc.tmp.5 = add i32 %rcc.tmp.4, 0
  %rcc.tmp.6 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.7 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.6, i32 0, i32 %rcc.tmp.5
  %rcc.tmp.8 = getelementptr [8 x i32], ptr %rcc.tmp.7, i32 0, i32 0
  %rcc.tmp.9 = load i32, ptr %rcc.tmp.8
  store i32 %rcc.tmp.9, ptr %min_time
  store i32 1, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.13 = load i32, ptr %i
  %rcc.tmp.14 = icmp slt i32 %rcc.tmp.13, 8
  br i1 %rcc.tmp.14, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.17 = load i32, ptr %set_index..tmp
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 0
  %rcc.tmp.19 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.20 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.19, i32 0, i32 %rcc.tmp.18
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 0
  %rcc.tmp.23 = getelementptr [8 x i32], ptr %rcc.tmp.20, i32 0, i32 %rcc.tmp.22
  %rcc.tmp.24 = load i32, ptr %rcc.tmp.23
  %rcc.tmp.25 = load i32, ptr %min_time
  %rcc.tmp.26 = icmp slt i32 %rcc.tmp.24, %rcc.tmp.25
  br i1 %rcc.tmp.26, label %if.then, label %if.else
if.then:
  %rcc.tmp.28 = load i32, ptr %set_index..tmp
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 0
  %rcc.tmp.30 = load [128 x [8 x i32]]*, ptr %lru_bits..tmp
  %rcc.tmp.31 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.30, i32 0, i32 %rcc.tmp.29
  %rcc.tmp.32 = load i32, ptr %i
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = getelementptr [8 x i32], ptr %rcc.tmp.31, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.35 = load i32, ptr %rcc.tmp.34
  store i32 %rcc.tmp.35, ptr %min_time
  %rcc.tmp.37 = load i32, ptr %i
  store i32 %rcc.tmp.37, ptr %lru_way
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.41 = load i32, ptr %i
  %rcc.tmp.42 = add i32 %rcc.tmp.41, 1
  store i32 %rcc.tmp.42, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.45 = load i32, ptr %lru_way
  ret i32 %rcc.tmp.45
}
define i32 @analyze_memory_fragmentation.([64 x i32]* %allocation_table.tmp, i32 %num_frames.tmp) {
entry:
  %allocation_table..tmp = alloca [64 x i32]* 
  %num_frames..tmp = alloca i32 
  %free_blocks = alloca i32 
  %largest_free_block = alloca i32 
  %current_free_block = alloca i32 
  %total_free = alloca i32 
  %i = alloca i32 
  store [64 x i32]* %allocation_table.tmp, ptr %allocation_table..tmp
  store i32 %num_frames.tmp, ptr %num_frames..tmp
  store i32 0, ptr %free_blocks
  store i32 0, ptr %largest_free_block
  store i32 0, ptr %current_free_block
  store i32 0, ptr %total_free
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.9 = load i32, ptr %i
  %rcc.tmp.10 = load i32, ptr %num_frames..tmp
  %rcc.tmp.11 = icmp slt i32 %rcc.tmp.9, %rcc.tmp.10
  br i1 %rcc.tmp.11, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = add i32 %rcc.tmp.14, 0
  %rcc.tmp.16 = load [64 x i32]*, ptr %allocation_table..tmp
  %rcc.tmp.17 = getelementptr [64 x i32], ptr %rcc.tmp.16, i32 0, i32 %rcc.tmp.15
  %rcc.tmp.18 = load i32, ptr %rcc.tmp.17
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 0
  br i1 %rcc.tmp.19, label %if.then, label %if.else
if.then:
  %rcc.tmp.21 = load i32, ptr %current_free_block
  %rcc.tmp.22 = add i32 %rcc.tmp.21, 1
  store i32 %rcc.tmp.22, ptr %current_free_block
  %rcc.tmp.24 = load i32, ptr %total_free
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  store i32 %rcc.tmp.25, ptr %total_free
  br label %if.merge
if.else:
  %rcc.tmp.28 = load i32, ptr %current_free_block
  %rcc.tmp.29 = icmp sgt i32 %rcc.tmp.28, 0
  br i1 %rcc.tmp.29, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.31 = load i32, ptr %free_blocks
  %rcc.tmp.32 = add i32 %rcc.tmp.31, 1
  store i32 %rcc.tmp.32, ptr %free_blocks
  %rcc.tmp.34 = load i32, ptr %current_free_block
  %rcc.tmp.35 = load i32, ptr %largest_free_block
  %rcc.tmp.36 = icmp sgt i32 %rcc.tmp.34, %rcc.tmp.35
  br i1 %rcc.tmp.36, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.38 = load i32, ptr %current_free_block
  store i32 %rcc.tmp.38, ptr %largest_free_block
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  store i32 0, ptr %current_free_block
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.46 = load i32, ptr %i
  %rcc.tmp.47 = add i32 %rcc.tmp.46, 1
  store i32 %rcc.tmp.47, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.50 = load i32, ptr %current_free_block
  %rcc.tmp.51 = icmp sgt i32 %rcc.tmp.50, 0
  br i1 %rcc.tmp.51, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.53 = load i32, ptr %free_blocks
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 1
  store i32 %rcc.tmp.54, ptr %free_blocks
  %rcc.tmp.56 = load i32, ptr %current_free_block
  %rcc.tmp.57 = load i32, ptr %largest_free_block
  %rcc.tmp.58 = icmp sgt i32 %rcc.tmp.56, %rcc.tmp.57
  br i1 %rcc.tmp.58, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.60 = load i32, ptr %current_free_block
  store i32 %rcc.tmp.60, ptr %largest_free_block
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.66 = load i32, ptr %total_free
  %rcc.tmp.67 = icmp eq i32 %rcc.tmp.66, 0
  br i1 %rcc.tmp.67, label %if.then.6, label %if.else.6
if.then.6:
  br label %if.merge.6
if.else.6:
  %rcc.tmp.70 = load i32, ptr %largest_free_block
  %rcc.tmp.71 = mul i32 %rcc.tmp.70, 100
  %rcc.tmp.72 = load i32, ptr %total_free
  %rcc.tmp.73 = sdiv i32 %rcc.tmp.71, %rcc.tmp.72
  %rcc.tmp.74 = sub i32 100, %rcc.tmp.73
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.76 = phi i32 [0, %if.then.6], [%rcc.tmp.74, %if.else.6]
  ret i32 %rcc.tmp.76
}
define void @compact_memory.([16 x [16 x i32]]* %page_tables.tmp, [64 x i32]* %reverse_mapping.tmp, [64 x i32]* %allocation_table.tmp, [64 x i32]* %free_list.tmp, i32* %free_count.tmp, i32 %num_frames.tmp) {
entry:
  %page_tables..tmp = alloca [16 x [16 x i32]]* 
  %reverse_mapping..tmp = alloca [64 x i32]* 
  %allocation_table..tmp = alloca [64 x i32]* 
  %free_list..tmp = alloca [64 x i32]* 
  %free_count..tmp = alloca i32* 
  %num_frames..tmp = alloca i32 
  %compacted_pos = alloca i32 
  %i = alloca i32 
  %virtual_page = alloca i32 
  %page_dir_index = alloca i32 
  %page_table_index = alloca i32 
  store [16 x [16 x i32]]* %page_tables.tmp, ptr %page_tables..tmp
  store [64 x i32]* %reverse_mapping.tmp, ptr %reverse_mapping..tmp
  store [64 x i32]* %allocation_table.tmp, ptr %allocation_table..tmp
  store [64 x i32]* %free_list.tmp, ptr %free_list..tmp
  store i32* %free_count.tmp, ptr %free_count..tmp
  store i32 %num_frames.tmp, ptr %num_frames..tmp
  store i32 0, ptr %compacted_pos
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.10 = load i32, ptr %i
  %rcc.tmp.11 = load i32, ptr %num_frames..tmp
  %rcc.tmp.12 = icmp slt i32 %rcc.tmp.10, %rcc.tmp.11
  br i1 %rcc.tmp.12, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.15 = load i32, ptr %i
  %rcc.tmp.16 = add i32 %rcc.tmp.15, 0
  %rcc.tmp.17 = load [64 x i32]*, ptr %allocation_table..tmp
  %rcc.tmp.18 = getelementptr [64 x i32], ptr %rcc.tmp.17, i32 0, i32 %rcc.tmp.16
  %rcc.tmp.19 = load i32, ptr %rcc.tmp.18
  %rcc.tmp.20 = icmp eq i32 %rcc.tmp.19, 1
  br i1 %rcc.tmp.20, label %if.then, label %if.else
if.then:
  %rcc.tmp.22 = load i32, ptr %i
  %rcc.tmp.23 = load i32, ptr %compacted_pos
  %rcc.tmp.24 = icmp ne i32 %rcc.tmp.22, %rcc.tmp.23
  br i1 %rcc.tmp.24, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.26 = load i32, ptr %i
  %rcc.tmp.27 = add i32 %rcc.tmp.26, 0
  %rcc.tmp.28 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.29 = getelementptr [64 x i32], ptr %rcc.tmp.28, i32 0, i32 %rcc.tmp.27
  %rcc.tmp.30 = load i32, ptr %rcc.tmp.29
  store i32 %rcc.tmp.30, ptr %virtual_page
  %rcc.tmp.32 = load i32, ptr %compacted_pos
  %rcc.tmp.33 = add i32 %rcc.tmp.32, 0
  %rcc.tmp.34 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.35 = getelementptr [64 x i32], ptr %rcc.tmp.34, i32 0, i32 %rcc.tmp.33
  %rcc.tmp.36 = load i32, ptr %virtual_page
  store i32 %rcc.tmp.36, ptr %rcc.tmp.35
  %rcc.tmp.38 = load i32, ptr %i
  %rcc.tmp.39 = add i32 %rcc.tmp.38, 0
  %rcc.tmp.40 = load [64 x i32]*, ptr %reverse_mapping..tmp
  %rcc.tmp.41 = getelementptr [64 x i32], ptr %rcc.tmp.40, i32 0, i32 %rcc.tmp.39
  %rcc.tmp.42 = sub i32 0, 1
  store i32 %rcc.tmp.42, ptr %rcc.tmp.41
  %rcc.tmp.44 = load i32, ptr %compacted_pos
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 0
  %rcc.tmp.46 = load [64 x i32]*, ptr %allocation_table..tmp
  %rcc.tmp.47 = getelementptr [64 x i32], ptr %rcc.tmp.46, i32 0, i32 %rcc.tmp.45
  store i32 1, ptr %rcc.tmp.47
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 0
  %rcc.tmp.51 = load [64 x i32]*, ptr %allocation_table..tmp
  %rcc.tmp.52 = getelementptr [64 x i32], ptr %rcc.tmp.51, i32 0, i32 %rcc.tmp.50
  store i32 0, ptr %rcc.tmp.52
  %rcc.tmp.54 = load i32, ptr %virtual_page
  %rcc.tmp.55 = icmp sge i32 %rcc.tmp.54, 0
  br i1 %rcc.tmp.55, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.57 = load i32, ptr %virtual_page
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 256
  br label %sc.merge
sc.merge:
  %rcc.tmp.60 = phi i1 [0, %if.then.2], [%rcc.tmp.58, %and.rhs]
  br i1 %rcc.tmp.60, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.62 = load i32, ptr %virtual_page
  %rcc.tmp.63 = sdiv i32 %rcc.tmp.62, 16
  store i32 %rcc.tmp.63, ptr %page_dir_index
  %rcc.tmp.65 = load i32, ptr %virtual_page
  %rcc.tmp.66 = srem i32 %rcc.tmp.65, 16
  store i32 %rcc.tmp.66, ptr %page_table_index
  %rcc.tmp.68 = load i32, ptr %page_dir_index
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 0
  %rcc.tmp.70 = load [16 x [16 x i32]]*, ptr %page_tables..tmp
  %rcc.tmp.71 = getelementptr [16 x [16 x i32]], ptr %rcc.tmp.70, i32 0, i32 %rcc.tmp.69
  %rcc.tmp.72 = load i32, ptr %page_table_index
  %rcc.tmp.73 = add i32 %rcc.tmp.72, 0
  %rcc.tmp.74 = getelementptr [16 x i32], ptr %rcc.tmp.71, i32 0, i32 %rcc.tmp.73
  %rcc.tmp.75 = load i32, ptr %compacted_pos
  %rcc.tmp.76 = add i32 %rcc.tmp.75, 1
  store i32 %rcc.tmp.76, ptr %rcc.tmp.74
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.82 = load i32, ptr %compacted_pos
  %rcc.tmp.83 = add i32 %rcc.tmp.82, 1
  store i32 %rcc.tmp.83, ptr %compacted_pos
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.87 = load i32, ptr %i
  %rcc.tmp.88 = add i32 %rcc.tmp.87, 1
  store i32 %rcc.tmp.88, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.91 = load i32*, ptr %free_count..tmp
  %rcc.tmp.92 = load i32, ptr %num_frames..tmp
  %rcc.tmp.93 = load i32, ptr %compacted_pos
  %rcc.tmp.94 = sub i32 %rcc.tmp.92, %rcc.tmp.93
  store i32 %rcc.tmp.94, ptr %rcc.tmp.91
  store i32 0, ptr %i
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.98 = load i32, ptr %i
  %rcc.tmp.99 = load i32*, ptr %free_count..tmp
  %rcc.tmp.100 = load i32, ptr %rcc.tmp.99
  %rcc.tmp.101 = icmp slt i32 %rcc.tmp.98, %rcc.tmp.100
  br i1 %rcc.tmp.101, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.104 = load i32, ptr %i
  %rcc.tmp.105 = add i32 %rcc.tmp.104, 0
  %rcc.tmp.106 = load [64 x i32]*, ptr %free_list..tmp
  %rcc.tmp.107 = getelementptr [64 x i32], ptr %rcc.tmp.106, i32 0, i32 %rcc.tmp.105
  %rcc.tmp.108 = load i32, ptr %compacted_pos
  %rcc.tmp.109 = load i32, ptr %i
  %rcc.tmp.110 = add i32 %rcc.tmp.108, %rcc.tmp.109
  store i32 %rcc.tmp.110, ptr %rcc.tmp.107
  %rcc.tmp.112 = load i32, ptr %i
  %rcc.tmp.113 = add i32 %rcc.tmp.112, 1
  store i32 %rcc.tmp.113, ptr %i
  br label %while.cond.2
while.end.2:
  ret void
}
define i32 @calculate_working_set_size.([1000 x i32]* %access_history.tmp, i32 %history_head.tmp, i32 %window_size.tmp) {
entry:
  %access_history..tmp = alloca [1000 x i32]* 
  %history_head..tmp = alloca i32 
  %window_size..tmp = alloca i32 
  %unique_pages = alloca [256 x i1] 
  %fill.idx = alloca i32 
  %working_set_size = alloca i32 
  %start_pos = alloca i32 
  %i = alloca i32 
  %pos = alloca i32 
  %page = alloca i32 
  store [1000 x i32]* %access_history.tmp, ptr %access_history..tmp
  store i32 %history_head.tmp, ptr %history_head..tmp
  store i32 %window_size.tmp, ptr %window_size..tmp
  store i32 0, ptr %fill.idx
  br label %array.fill.cond
array.fill.cond:
  %rcc.tmp.6 = load i32, ptr %fill.idx
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 256
  br i1 %rcc.tmp.7, label %array.fill.body, label %array.fill.end
array.fill.body:
  %rcc.tmp.9 = load i32, ptr %fill.idx
  %rcc.tmp.10 = getelementptr [256 x i1], ptr %unique_pages, i32 0, i32 %rcc.tmp.9
  store i1 0, ptr %rcc.tmp.10
  %rcc.tmp.12 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.12, ptr %fill.idx
  br label %array.fill.cond
array.fill.end:
  store i32 0, ptr %working_set_size
  %rcc.tmp.16 = load i32, ptr %history_head..tmp
  %rcc.tmp.17 = load i32, ptr %window_size..tmp
  %rcc.tmp.18 = icmp sge i32 %rcc.tmp.16, %rcc.tmp.17
  br i1 %rcc.tmp.18, label %if.then, label %if.else
if.then:
  %rcc.tmp.20 = load i32, ptr %history_head..tmp
  %rcc.tmp.21 = load i32, ptr %window_size..tmp
  %rcc.tmp.22 = sub i32 %rcc.tmp.20, %rcc.tmp.21
  br label %if.merge
if.else:
  %rcc.tmp.24 = load i32, ptr %window_size..tmp
  %rcc.tmp.25 = load i32, ptr %history_head..tmp
  %rcc.tmp.26 = sub i32 %rcc.tmp.24, %rcc.tmp.25
  %rcc.tmp.27 = sub i32 1000, %rcc.tmp.26
  br label %if.merge
if.merge:
  %rcc.tmp.29 = phi i32 [%rcc.tmp.22, %if.then], [%rcc.tmp.27, %if.else]
  store i32 %rcc.tmp.29, ptr %start_pos
  store i32 0, ptr %i
  %rcc.tmp.32 = load i32, ptr %start_pos
  store i32 %rcc.tmp.32, ptr %pos
  br label %while.cond
while.cond:
  %rcc.tmp.35 = load i32, ptr %i
  %rcc.tmp.36 = load i32, ptr %window_size..tmp
  %rcc.tmp.37 = icmp slt i32 %rcc.tmp.35, %rcc.tmp.36
  br i1 %rcc.tmp.37, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.40 = load i32, ptr %pos
  %rcc.tmp.41 = icmp sge i32 %rcc.tmp.40, 0
  br i1 %rcc.tmp.41, label %and.rhs, label %sc.merge
and.rhs:
  %rcc.tmp.43 = load i32, ptr %pos
  %rcc.tmp.44 = icmp slt i32 %rcc.tmp.43, 1000
  br label %sc.merge
sc.merge:
  %rcc.tmp.46 = phi i1 [0, %while.body], [%rcc.tmp.44, %and.rhs]
  br i1 %rcc.tmp.46, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.48 = load i32, ptr %pos
  %rcc.tmp.49 = add i32 %rcc.tmp.48, 0
  %rcc.tmp.50 = load [1000 x i32]*, ptr %access_history..tmp
  %rcc.tmp.51 = getelementptr [1000 x i32], ptr %rcc.tmp.50, i32 0, i32 %rcc.tmp.49
  %rcc.tmp.52 = load i32, ptr %rcc.tmp.51
  store i32 %rcc.tmp.52, ptr %page
  %rcc.tmp.54 = load i32, ptr %page
  %rcc.tmp.55 = icmp sge i32 %rcc.tmp.54, 0
  br i1 %rcc.tmp.55, label %and.rhs.2, label %sc.merge.2
and.rhs.2:
  %rcc.tmp.57 = load i32, ptr %page
  %rcc.tmp.58 = icmp slt i32 %rcc.tmp.57, 256
  br label %sc.merge.2
sc.merge.2:
  %rcc.tmp.60 = phi i1 [0, %if.then.2], [%rcc.tmp.58, %and.rhs.2]
  br i1 %rcc.tmp.60, label %and.rhs.3, label %sc.merge.3
and.rhs.3:
  %rcc.tmp.62 = load i32, ptr %page
  %rcc.tmp.63 = add i32 %rcc.tmp.62, 0
  %rcc.tmp.64 = getelementptr [256 x i1], ptr %unique_pages, i32 0, i32 %rcc.tmp.63
  %rcc.tmp.65 = load i1, ptr %rcc.tmp.64
  %rcc.tmp.66 = xor i1 %rcc.tmp.65, true
  br label %sc.merge.3
sc.merge.3:
  %rcc.tmp.68 = phi i1 [0, %sc.merge.2], [%rcc.tmp.66, %and.rhs.3]
  br i1 %rcc.tmp.68, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.70 = load i32, ptr %page
  %rcc.tmp.71 = add i32 %rcc.tmp.70, 0
  %rcc.tmp.72 = getelementptr [256 x i1], ptr %unique_pages, i32 0, i32 %rcc.tmp.71
  store i1 1, ptr %rcc.tmp.72
  %rcc.tmp.74 = load i32, ptr %working_set_size
  %rcc.tmp.75 = add i32 %rcc.tmp.74, 1
  store i32 %rcc.tmp.75, ptr %working_set_size
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.81 = load i32, ptr %pos
  %rcc.tmp.82 = add i32 %rcc.tmp.81, 1
  %rcc.tmp.83 = srem i32 %rcc.tmp.82, 1000
  store i32 %rcc.tmp.83, ptr %pos
  %rcc.tmp.85 = load i32, ptr %i
  %rcc.tmp.86 = add i32 %rcc.tmp.85, 1
  store i32 %rcc.tmp.86, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.89 = load i32, ptr %working_set_size
  ret i32 %rcc.tmp.89
}
define void @adjust_cache_policies.([64 x [4 x i32]]* %l1_lru.tmp, [128 x [8 x i32]]* %l2_lru.tmp, i32 %l1_hits.tmp, i32 %l1_misses.tmp, i32 %l2_hits.tmp, i32 %l2_misses.tmp) {
entry:
  %l1_lru..tmp = alloca [64 x [4 x i32]]* 
  %l2_lru..tmp = alloca [128 x [8 x i32]]* 
  %l1_hits..tmp = alloca i32 
  %l1_misses..tmp = alloca i32 
  %l2_hits..tmp = alloca i32 
  %l2_misses..tmp = alloca i32 
  %l1_hit_rate = alloca i32 
  %l2_hit_rate = alloca i32 
  %i = alloca i32 
  %j = alloca i32 
  %i.2 = alloca i32 
  %j.2 = alloca i32 
  store [64 x [4 x i32]]* %l1_lru.tmp, ptr %l1_lru..tmp
  store [128 x [8 x i32]]* %l2_lru.tmp, ptr %l2_lru..tmp
  store i32 %l1_hits.tmp, ptr %l1_hits..tmp
  store i32 %l1_misses.tmp, ptr %l1_misses..tmp
  store i32 %l2_hits.tmp, ptr %l2_hits..tmp
  store i32 %l2_misses.tmp, ptr %l2_misses..tmp
  %rcc.tmp.7 = load i32, ptr %l1_hits..tmp
  %rcc.tmp.8 = load i32, ptr %l1_misses..tmp
  %rcc.tmp.9 = add i32 %rcc.tmp.7, %rcc.tmp.8
  %rcc.tmp.10 = icmp sgt i32 %rcc.tmp.9, 0
  br i1 %rcc.tmp.10, label %if.then, label %if.else
if.then:
  %rcc.tmp.12 = load i32, ptr %l1_hits..tmp
  %rcc.tmp.13 = mul i32 %rcc.tmp.12, 100
  %rcc.tmp.14 = load i32, ptr %l1_hits..tmp
  %rcc.tmp.15 = load i32, ptr %l1_misses..tmp
  %rcc.tmp.16 = add i32 %rcc.tmp.14, %rcc.tmp.15
  %rcc.tmp.17 = sdiv i32 %rcc.tmp.13, %rcc.tmp.16
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.20 = phi i32 [%rcc.tmp.17, %if.then], [0, %if.else]
  store i32 %rcc.tmp.20, ptr %l1_hit_rate
  %rcc.tmp.22 = load i32, ptr %l2_hits..tmp
  %rcc.tmp.23 = load i32, ptr %l2_misses..tmp
  %rcc.tmp.24 = add i32 %rcc.tmp.22, %rcc.tmp.23
  %rcc.tmp.25 = icmp sgt i32 %rcc.tmp.24, 0
  br i1 %rcc.tmp.25, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.27 = load i32, ptr %l2_hits..tmp
  %rcc.tmp.28 = mul i32 %rcc.tmp.27, 100
  %rcc.tmp.29 = load i32, ptr %l2_hits..tmp
  %rcc.tmp.30 = load i32, ptr %l2_misses..tmp
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = sdiv i32 %rcc.tmp.28, %rcc.tmp.31
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.35 = phi i32 [%rcc.tmp.32, %if.then.2], [0, %if.else.2]
  store i32 %rcc.tmp.35, ptr %l2_hit_rate
  %rcc.tmp.37 = load i32, ptr %l1_hit_rate
  %rcc.tmp.38 = icmp slt i32 %rcc.tmp.37, 70
  br i1 %rcc.tmp.38, label %if.then.3, label %if.else.3
if.then.3:
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.42 = load i32, ptr %i
  %rcc.tmp.43 = icmp slt i32 %rcc.tmp.42, 64
  br i1 %rcc.tmp.43, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.48 = load i32, ptr %j
  %rcc.tmp.49 = icmp slt i32 %rcc.tmp.48, 4
  br i1 %rcc.tmp.49, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.52 = load i32, ptr %i
  %rcc.tmp.53 = add i32 %rcc.tmp.52, 0
  %rcc.tmp.54 = load [64 x [4 x i32]]*, ptr %l1_lru..tmp
  %rcc.tmp.55 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.54, i32 0, i32 %rcc.tmp.53
  %rcc.tmp.56 = load i32, ptr %j
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 0
  %rcc.tmp.58 = getelementptr [4 x i32], ptr %rcc.tmp.55, i32 0, i32 %rcc.tmp.57
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 0
  %rcc.tmp.61 = load [64 x [4 x i32]]*, ptr %l1_lru..tmp
  %rcc.tmp.62 = getelementptr [64 x [4 x i32]], ptr %rcc.tmp.61, i32 0, i32 %rcc.tmp.60
  %rcc.tmp.63 = load i32, ptr %j
  %rcc.tmp.64 = add i32 %rcc.tmp.63, 0
  %rcc.tmp.65 = getelementptr [4 x i32], ptr %rcc.tmp.62, i32 0, i32 %rcc.tmp.64
  %rcc.tmp.66 = load i32, ptr %rcc.tmp.65
  %rcc.tmp.67 = sub i32 %rcc.tmp.66, 10
  store i32 %rcc.tmp.67, ptr %rcc.tmp.58
  %rcc.tmp.69 = load i32, ptr %j
  %rcc.tmp.70 = add i32 %rcc.tmp.69, 1
  store i32 %rcc.tmp.70, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.73 = load i32, ptr %i
  %rcc.tmp.74 = add i32 %rcc.tmp.73, 1
  store i32 %rcc.tmp.74, ptr %i
  br label %while.cond
while.end:
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.79 = load i32, ptr %l2_hit_rate
  %rcc.tmp.80 = icmp slt i32 %rcc.tmp.79, 60
  br i1 %rcc.tmp.80, label %if.then.4, label %if.else.4
if.then.4:
  store i32 0, ptr %i.2
  br label %while.cond.3
while.cond.3:
  %rcc.tmp.84 = load i32, ptr %i.2
  %rcc.tmp.85 = icmp slt i32 %rcc.tmp.84, 128
  br i1 %rcc.tmp.85, label %while.body.3, label %while.linker.3
while.linker.3:
  br label %while.end.3
while.body.3:
  store i32 0, ptr %j.2
  br label %while.cond.4
while.cond.4:
  %rcc.tmp.90 = load i32, ptr %j.2
  %rcc.tmp.91 = icmp slt i32 %rcc.tmp.90, 8
  br i1 %rcc.tmp.91, label %while.body.4, label %while.linker.4
while.linker.4:
  br label %while.end.4
while.body.4:
  %rcc.tmp.94 = load i32, ptr %i.2
  %rcc.tmp.95 = add i32 %rcc.tmp.94, 0
  %rcc.tmp.96 = load [128 x [8 x i32]]*, ptr %l2_lru..tmp
  %rcc.tmp.97 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.96, i32 0, i32 %rcc.tmp.95
  %rcc.tmp.98 = load i32, ptr %j.2
  %rcc.tmp.99 = add i32 %rcc.tmp.98, 0
  %rcc.tmp.100 = getelementptr [8 x i32], ptr %rcc.tmp.97, i32 0, i32 %rcc.tmp.99
  %rcc.tmp.101 = load i32, ptr %i.2
  %rcc.tmp.102 = add i32 %rcc.tmp.101, 0
  %rcc.tmp.103 = load [128 x [8 x i32]]*, ptr %l2_lru..tmp
  %rcc.tmp.104 = getelementptr [128 x [8 x i32]], ptr %rcc.tmp.103, i32 0, i32 %rcc.tmp.102
  %rcc.tmp.105 = load i32, ptr %j.2
  %rcc.tmp.106 = add i32 %rcc.tmp.105, 0
  %rcc.tmp.107 = getelementptr [8 x i32], ptr %rcc.tmp.104, i32 0, i32 %rcc.tmp.106
  %rcc.tmp.108 = load i32, ptr %rcc.tmp.107
  %rcc.tmp.109 = sub i32 %rcc.tmp.108, 15
  store i32 %rcc.tmp.109, ptr %rcc.tmp.100
  %rcc.tmp.111 = load i32, ptr %j.2
  %rcc.tmp.112 = add i32 %rcc.tmp.111, 1
  store i32 %rcc.tmp.112, ptr %j.2
  br label %while.cond.4
while.end.4:
  %rcc.tmp.115 = load i32, ptr %i.2
  %rcc.tmp.116 = add i32 %rcc.tmp.115, 1
  store i32 %rcc.tmp.116, ptr %i.2
  br label %while.cond.3
while.end.3:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  ret void
}
define i32 @calculate_average_memory_access_time.(i32 %l1_hits.tmp, i32 %l1_misses.tmp, i32 %l2_hits.tmp, i32 %l2_misses.tmp, i32 %page_faults.tmp) {
entry:
  %l1_hits..tmp = alloca i32 
  %l1_misses..tmp = alloca i32 
  %l2_hits..tmp = alloca i32 
  %l2_misses..tmp = alloca i32 
  %page_faults..tmp = alloca i32 
  %total_accesses = alloca i32 
  %l1_hit_time = alloca i32 
  %l2_hit_time = alloca i32 
  %memory_access_time = alloca i32 
  %page_fault_time = alloca i32 
  %total_time = alloca i32 
  store i32 %l1_hits.tmp, ptr %l1_hits..tmp
  store i32 %l1_misses.tmp, ptr %l1_misses..tmp
  store i32 %l2_hits.tmp, ptr %l2_hits..tmp
  store i32 %l2_misses.tmp, ptr %l2_misses..tmp
  store i32 %page_faults.tmp, ptr %page_faults..tmp
  %rcc.tmp.6 = load i32, ptr %l1_hits..tmp
  %rcc.tmp.7 = load i32, ptr %l1_misses..tmp
  %rcc.tmp.8 = add i32 %rcc.tmp.6, %rcc.tmp.7
  store i32 %rcc.tmp.8, ptr %total_accesses
  %rcc.tmp.10 = load i32, ptr %total_accesses
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 0
  br i1 %rcc.tmp.11, label %if.then, label %if.else
if.then:
  ret i32 0
if.else:
  br label %if.merge
if.merge:
  store i32 1, ptr %l1_hit_time
  store i32 10, ptr %l2_hit_time
  store i32 100, ptr %memory_access_time
  store i32 10000, ptr %page_fault_time
  %rcc.tmp.19 = load i32, ptr %l1_hits..tmp
  %rcc.tmp.20 = load i32, ptr %l1_hit_time
  %rcc.tmp.21 = mul i32 %rcc.tmp.19, %rcc.tmp.20
  %rcc.tmp.22 = load i32, ptr %l2_hits..tmp
  %rcc.tmp.23 = load i32, ptr %l1_hit_time
  %rcc.tmp.24 = load i32, ptr %l2_hit_time
  %rcc.tmp.25 = add i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = mul i32 %rcc.tmp.22, %rcc.tmp.25
  %rcc.tmp.27 = add i32 %rcc.tmp.21, %rcc.tmp.26
  %rcc.tmp.28 = load i32, ptr %l2_misses..tmp
  %rcc.tmp.29 = load i32, ptr %l1_hit_time
  %rcc.tmp.30 = load i32, ptr %l2_hit_time
  %rcc.tmp.31 = add i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = load i32, ptr %memory_access_time
  %rcc.tmp.33 = add i32 %rcc.tmp.31, %rcc.tmp.32
  %rcc.tmp.34 = mul i32 %rcc.tmp.28, %rcc.tmp.33
  %rcc.tmp.35 = add i32 %rcc.tmp.27, %rcc.tmp.34
  %rcc.tmp.36 = load i32, ptr %page_faults..tmp
  %rcc.tmp.37 = load i32, ptr %page_fault_time
  %rcc.tmp.38 = mul i32 %rcc.tmp.36, %rcc.tmp.37
  %rcc.tmp.39 = add i32 %rcc.tmp.35, %rcc.tmp.38
  store i32 %rcc.tmp.39, ptr %total_time
  %rcc.tmp.41 = load i32, ptr %total_time
  %rcc.tmp.42 = load i32, ptr %total_accesses
  %rcc.tmp.43 = sdiv i32 %rcc.tmp.41, %rcc.tmp.42
  ret i32 %rcc.tmp.43
}
