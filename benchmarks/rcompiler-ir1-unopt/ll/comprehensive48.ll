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
  %warehouse_stock_A = alloca i32 
  %warehouse_stock_B = alloca i32 
  %warehouse_stock_C = alloca i32 
  %pending_orders_A = alloca i32 
  %pending_orders_B = alloca i32 
  %pending_orders_C = alloca i32 
  %processed_orders = alloca i32 
  %total_revenue = alloca i32 
  %price_A = alloca i32 
  %price_B = alloca i32 
  %price_C = alloca i32 
  %i = alloca i32 
  %order_type = alloca i32 
  %order_quantity = alloca i32 
  %can_process_A = alloca i1 
  %can_process_B = alloca i1 
  %can_process_C = alloca i1 
  %special_bonus = alloca i32 
  %revenue_A = alloca i32 
  %discount = alloca i32 
  %revenue_B = alloca i32 
  %discount.2 = alloca i32 
  %revenue_C = alloca i32 
  %discount.3 = alloca i32 
  %audit_result = alloca i32 
  store i32 1000, ptr %warehouse_stock_A
  store i32 1500, ptr %warehouse_stock_B
  store i32 800, ptr %warehouse_stock_C
  store i32 0, ptr %pending_orders_A
  store i32 0, ptr %pending_orders_B
  store i32 0, ptr %pending_orders_C
  store i32 0, ptr %processed_orders
  store i32 0, ptr %total_revenue
  store i32 10, ptr %price_A
  store i32 15, ptr %price_B
  store i32 20, ptr %price_C
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.14 = load i32, ptr %i
  %rcc.tmp.15 = icmp slt i32 %rcc.tmp.14, 200
  br i1 %rcc.tmp.15, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.18 = load i32, ptr %i
  %rcc.tmp.19 = srem i32 %rcc.tmp.18, 3
  store i32 %rcc.tmp.19, ptr %order_type
  %rcc.tmp.21 = load i32, ptr %i
  %rcc.tmp.22 = mul i32 %rcc.tmp.21, 7
  %rcc.tmp.23 = add i32 %rcc.tmp.22, 15
  %rcc.tmp.24 = srem i32 %rcc.tmp.23, 50
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 10
  store i32 %rcc.tmp.25, ptr %order_quantity
  %rcc.tmp.27 = load i32, ptr %order_type
  %rcc.tmp.28 = icmp eq i32 %rcc.tmp.27, 0
  br i1 %rcc.tmp.28, label %if.then, label %if.else
if.then:
  %rcc.tmp.30 = load i32, ptr %pending_orders_A
  %rcc.tmp.31 = load i32, ptr %order_quantity
  %rcc.tmp.32 = add i32 %rcc.tmp.30, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %pending_orders_A
  br label %if.merge
if.else:
  %rcc.tmp.35 = load i32, ptr %order_type
  %rcc.tmp.36 = icmp eq i32 %rcc.tmp.35, 1
  br i1 %rcc.tmp.36, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.38 = load i32, ptr %pending_orders_B
  %rcc.tmp.39 = load i32, ptr %order_quantity
  %rcc.tmp.40 = add i32 %rcc.tmp.38, %rcc.tmp.39
  store i32 %rcc.tmp.40, ptr %pending_orders_B
  br label %if.merge.2
if.else.2:
  %rcc.tmp.43 = load i32, ptr %pending_orders_C
  %rcc.tmp.44 = load i32, ptr %order_quantity
  %rcc.tmp.45 = add i32 %rcc.tmp.43, %rcc.tmp.44
  store i32 %rcc.tmp.45, ptr %pending_orders_C
  br label %if.merge.2
if.merge.2:
  br label %if.merge
if.merge:
  %rcc.tmp.49 = load i32, ptr %i
  %rcc.tmp.50 = srem i32 %rcc.tmp.49, 10
  %rcc.tmp.51 = icmp eq i32 %rcc.tmp.50, 0
  br i1 %rcc.tmp.51, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.53 = load i32, ptr %warehouse_stock_A
  %rcc.tmp.54 = add i32 %rcc.tmp.53, 200
  store i32 %rcc.tmp.54, ptr %warehouse_stock_A
  %rcc.tmp.56 = load i32, ptr %warehouse_stock_B
  %rcc.tmp.57 = add i32 %rcc.tmp.56, 300
  store i32 %rcc.tmp.57, ptr %warehouse_stock_B
  %rcc.tmp.59 = load i32, ptr %warehouse_stock_C
  %rcc.tmp.60 = add i32 %rcc.tmp.59, 150
  store i32 %rcc.tmp.60, ptr %warehouse_stock_C
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  store i1 0, ptr %can_process_A
  store i1 0, ptr %can_process_B
  store i1 0, ptr %can_process_C
  %rcc.tmp.67 = load i32, ptr %pending_orders_A
  %rcc.tmp.68 = icmp sgt i32 %rcc.tmp.67, 0
  br i1 %rcc.tmp.68, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.70 = load i32, ptr %warehouse_stock_A
  %rcc.tmp.71 = load i32, ptr %pending_orders_A
  %rcc.tmp.72 = icmp sge i32 %rcc.tmp.70, %rcc.tmp.71
  br i1 %rcc.tmp.72, label %if.then.5, label %if.else.5
if.then.5:
  store i1 1, ptr %can_process_A
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.79 = load i32, ptr %pending_orders_B
  %rcc.tmp.80 = icmp sgt i32 %rcc.tmp.79, 0
  br i1 %rcc.tmp.80, label %if.then.6, label %if.else.6
if.then.6:
  %rcc.tmp.82 = load i32, ptr %warehouse_stock_B
  %rcc.tmp.83 = load i32, ptr %pending_orders_B
  %rcc.tmp.84 = icmp sge i32 %rcc.tmp.82, %rcc.tmp.83
  br i1 %rcc.tmp.84, label %if.then.7, label %if.else.7
if.then.7:
  store i1 1, ptr %can_process_B
  br label %if.merge.7
if.else.7:
  br label %if.merge.7
if.merge.7:
  br label %if.merge.6
if.else.6:
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.91 = load i32, ptr %pending_orders_C
  %rcc.tmp.92 = icmp sgt i32 %rcc.tmp.91, 0
  br i1 %rcc.tmp.92, label %if.then.8, label %if.else.8
if.then.8:
  %rcc.tmp.94 = load i32, ptr %warehouse_stock_C
  %rcc.tmp.95 = load i32, ptr %pending_orders_C
  %rcc.tmp.96 = icmp sge i32 %rcc.tmp.94, %rcc.tmp.95
  br i1 %rcc.tmp.96, label %if.then.9, label %if.else.9
if.then.9:
  store i1 1, ptr %can_process_C
  br label %if.merge.9
if.else.9:
  br label %if.merge.9
if.merge.9:
  br label %if.merge.8
if.else.8:
  br label %if.merge.8
if.merge.8:
  store i32 0, ptr %special_bonus
  %rcc.tmp.104 = load i1, ptr %can_process_A
  br i1 %rcc.tmp.104, label %if.then.10, label %if.else.10
if.then.10:
  %rcc.tmp.106 = load i32, ptr %pending_orders_A
  %rcc.tmp.107 = icmp sgt i32 %rcc.tmp.106, 50
  br i1 %rcc.tmp.107, label %if.then.11, label %if.else.11
if.then.11:
  store i32 5, ptr %discount
  store i32 100, ptr %special_bonus
  %rcc.tmp.111 = load i32, ptr %pending_orders_A
  %rcc.tmp.112 = load i32, ptr %price_A
  %rcc.tmp.113 = load i32, ptr %discount
  %rcc.tmp.114 = sub i32 %rcc.tmp.112, %rcc.tmp.113
  %rcc.tmp.115 = mul i32 %rcc.tmp.111, %rcc.tmp.114
  br label %if.merge.11
if.else.11:
  %rcc.tmp.117 = load i32, ptr %pending_orders_A
  %rcc.tmp.118 = load i32, ptr %price_A
  %rcc.tmp.119 = mul i32 %rcc.tmp.117, %rcc.tmp.118
  br label %if.merge.11
if.merge.11:
  %rcc.tmp.121 = phi i32 [%rcc.tmp.115, %if.then.11], [%rcc.tmp.119, %if.else.11]
  store i32 %rcc.tmp.121, ptr %revenue_A
  %rcc.tmp.123 = load i32, ptr %warehouse_stock_A
  %rcc.tmp.124 = load i32, ptr %pending_orders_A
  %rcc.tmp.125 = sub i32 %rcc.tmp.123, %rcc.tmp.124
  store i32 %rcc.tmp.125, ptr %warehouse_stock_A
  %rcc.tmp.127 = load i32, ptr %total_revenue
  %rcc.tmp.128 = load i32, ptr %revenue_A
  %rcc.tmp.129 = add i32 %rcc.tmp.127, %rcc.tmp.128
  store i32 %rcc.tmp.129, ptr %total_revenue
  %rcc.tmp.131 = load i32, ptr %processed_orders
  %rcc.tmp.132 = load i32, ptr %pending_orders_A
  %rcc.tmp.133 = add i32 %rcc.tmp.131, %rcc.tmp.132
  store i32 %rcc.tmp.133, ptr %processed_orders
  store i32 0, ptr %pending_orders_A
  br label %if.merge.10
if.else.10:
  br label %if.merge.10
if.merge.10:
  %rcc.tmp.138 = load i1, ptr %can_process_B
  br i1 %rcc.tmp.138, label %if.then.12, label %if.else.12
if.then.12:
  %rcc.tmp.140 = load i32, ptr %pending_orders_B
  %rcc.tmp.141 = icmp sgt i32 %rcc.tmp.140, 40
  br i1 %rcc.tmp.141, label %if.then.13, label %if.else.13
if.then.13:
  store i32 3, ptr %discount.2
  %rcc.tmp.144 = load i32, ptr %pending_orders_B
  %rcc.tmp.145 = load i32, ptr %price_B
  %rcc.tmp.146 = load i32, ptr %discount.2
  %rcc.tmp.147 = sub i32 %rcc.tmp.145, %rcc.tmp.146
  %rcc.tmp.148 = mul i32 %rcc.tmp.144, %rcc.tmp.147
  br label %if.merge.13
if.else.13:
  %rcc.tmp.150 = load i32, ptr %pending_orders_B
  %rcc.tmp.151 = load i32, ptr %price_B
  %rcc.tmp.152 = mul i32 %rcc.tmp.150, %rcc.tmp.151
  br label %if.merge.13
if.merge.13:
  %rcc.tmp.154 = phi i32 [%rcc.tmp.148, %if.then.13], [%rcc.tmp.152, %if.else.13]
  store i32 %rcc.tmp.154, ptr %revenue_B
  %rcc.tmp.156 = load i32, ptr %warehouse_stock_B
  %rcc.tmp.157 = load i32, ptr %pending_orders_B
  %rcc.tmp.158 = sub i32 %rcc.tmp.156, %rcc.tmp.157
  store i32 %rcc.tmp.158, ptr %warehouse_stock_B
  %rcc.tmp.160 = load i32, ptr %total_revenue
  %rcc.tmp.161 = load i32, ptr %revenue_B
  %rcc.tmp.162 = add i32 %rcc.tmp.160, %rcc.tmp.161
  store i32 %rcc.tmp.162, ptr %total_revenue
  %rcc.tmp.164 = load i32, ptr %processed_orders
  %rcc.tmp.165 = load i32, ptr %pending_orders_B
  %rcc.tmp.166 = add i32 %rcc.tmp.164, %rcc.tmp.165
  store i32 %rcc.tmp.166, ptr %processed_orders
  store i32 0, ptr %pending_orders_B
  br label %if.merge.12
if.else.12:
  br label %if.merge.12
if.merge.12:
  %rcc.tmp.171 = load i1, ptr %can_process_C
  br i1 %rcc.tmp.171, label %if.then.14, label %if.else.14
if.then.14:
  %rcc.tmp.173 = load i32, ptr %pending_orders_C
  %rcc.tmp.174 = icmp sgt i32 %rcc.tmp.173, 30
  br i1 %rcc.tmp.174, label %if.then.15, label %if.else.15
if.then.15:
  store i32 2, ptr %discount.3
  %rcc.tmp.177 = load i32, ptr %pending_orders_C
  %rcc.tmp.178 = load i32, ptr %price_C
  %rcc.tmp.179 = load i32, ptr %discount.3
  %rcc.tmp.180 = sub i32 %rcc.tmp.178, %rcc.tmp.179
  %rcc.tmp.181 = mul i32 %rcc.tmp.177, %rcc.tmp.180
  br label %if.merge.15
if.else.15:
  %rcc.tmp.183 = load i32, ptr %pending_orders_C
  %rcc.tmp.184 = load i32, ptr %price_C
  %rcc.tmp.185 = mul i32 %rcc.tmp.183, %rcc.tmp.184
  br label %if.merge.15
if.merge.15:
  %rcc.tmp.187 = phi i32 [%rcc.tmp.181, %if.then.15], [%rcc.tmp.185, %if.else.15]
  store i32 %rcc.tmp.187, ptr %revenue_C
  %rcc.tmp.189 = load i32, ptr %warehouse_stock_C
  %rcc.tmp.190 = load i32, ptr %pending_orders_C
  %rcc.tmp.191 = sub i32 %rcc.tmp.189, %rcc.tmp.190
  store i32 %rcc.tmp.191, ptr %warehouse_stock_C
  %rcc.tmp.193 = load i32, ptr %total_revenue
  %rcc.tmp.194 = load i32, ptr %revenue_C
  %rcc.tmp.195 = add i32 %rcc.tmp.193, %rcc.tmp.194
  store i32 %rcc.tmp.195, ptr %total_revenue
  %rcc.tmp.197 = load i32, ptr %processed_orders
  %rcc.tmp.198 = load i32, ptr %pending_orders_C
  %rcc.tmp.199 = add i32 %rcc.tmp.197, %rcc.tmp.198
  store i32 %rcc.tmp.199, ptr %processed_orders
  store i32 0, ptr %pending_orders_C
  br label %if.merge.14
if.else.14:
  br label %if.merge.14
if.merge.14:
  %rcc.tmp.204 = load i32, ptr %i
  %rcc.tmp.205 = srem i32 %rcc.tmp.204, 25
  %rcc.tmp.206 = icmp eq i32 %rcc.tmp.205, 0
  br i1 %rcc.tmp.206, label %if.then.16, label %if.else.16
if.then.16:
  %rcc.tmp.208 = load i32, ptr %warehouse_stock_A
  %rcc.tmp.209 = load i32, ptr %warehouse_stock_B
  %rcc.tmp.210 = load i32, ptr %warehouse_stock_C
  %rcc.tmp.211 = load i32, ptr %total_revenue
  %rcc.tmp.212 = call i32 @perform_audit.(i32 %rcc.tmp.208, i32 %rcc.tmp.209, i32 %rcc.tmp.210, i32 %rcc.tmp.211)
  store i32 %rcc.tmp.212, ptr %audit_result
  %rcc.tmp.214 = load i32, ptr %audit_result
  %rcc.tmp.215 = icmp slt i32 %rcc.tmp.214, 0
  br i1 %rcc.tmp.215, label %if.then.17, label %if.else.17
if.then.17:
  %rcc.tmp.217 = load i32, ptr %total_revenue
  %rcc.tmp.218 = load i32, ptr %special_bonus
  %rcc.tmp.219 = add i32 %rcc.tmp.217, %rcc.tmp.218
  store i32 %rcc.tmp.219, ptr %total_revenue
  br label %if.merge.17
if.else.17:
  br label %if.merge.17
if.merge.17:
  br label %if.merge.16
if.else.16:
  br label %if.merge.16
if.merge.16:
  %rcc.tmp.225 = load i32, ptr %i
  %rcc.tmp.226 = add i32 %rcc.tmp.225, 1
  store i32 %rcc.tmp.226, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.229 = load i32, ptr %total_revenue
  call void @printlnInt.(i32 %rcc.tmp.229)
  %rcc.tmp.231 = load i32, ptr %processed_orders
  call void @printlnInt.(i32 %rcc.tmp.231)
  %rcc.tmp.233 = load i32, ptr %warehouse_stock_A
  call void @printlnInt.(i32 %rcc.tmp.233)
  %rcc.tmp.235 = load i32, ptr %warehouse_stock_B
  call void @printlnInt.(i32 %rcc.tmp.235)
  %rcc.tmp.237 = load i32, ptr %warehouse_stock_C
  call void @printlnInt.(i32 %rcc.tmp.237)
  call void @exit.(i32 0)
  ret void
}
define i32 @perform_audit.(i32 %stock_a.tmp, i32 %stock_b.tmp, i32 %stock_c.tmp, i32 %revenue.tmp) {
entry:
  %stock_a..tmp = alloca i32 
  %stock_b..tmp = alloca i32 
  %stock_c..tmp = alloca i32 
  %revenue..tmp = alloca i32 
  %score = alloca i32 
  %i = alloca i32 
  %temp_rev = alloca i32 
  store i32 %stock_a.tmp, ptr %stock_a..tmp
  store i32 %stock_b.tmp, ptr %stock_b..tmp
  store i32 %stock_c.tmp, ptr %stock_c..tmp
  store i32 %revenue.tmp, ptr %revenue..tmp
  store i32 0, ptr %score
  %rcc.tmp.6 = load i32, ptr %stock_a..tmp
  %rcc.tmp.7 = icmp slt i32 %rcc.tmp.6, 100
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %score
  %rcc.tmp.10 = sub i32 %rcc.tmp.9, 10
  store i32 %rcc.tmp.10, ptr %score
  br label %if.merge
if.else:
  %rcc.tmp.13 = load i32, ptr %score
  %rcc.tmp.14 = add i32 %rcc.tmp.13, 5
  store i32 %rcc.tmp.14, ptr %score
  br label %if.merge
if.merge:
  %rcc.tmp.17 = load i32, ptr %stock_b..tmp
  %rcc.tmp.18 = icmp slt i32 %rcc.tmp.17, 150
  br i1 %rcc.tmp.18, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.20 = load i32, ptr %score
  %rcc.tmp.21 = sub i32 %rcc.tmp.20, 10
  store i32 %rcc.tmp.21, ptr %score
  br label %if.merge.2
if.else.2:
  %rcc.tmp.24 = load i32, ptr %score
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 5
  store i32 %rcc.tmp.25, ptr %score
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.28 = load i32, ptr %stock_c..tmp
  %rcc.tmp.29 = icmp slt i32 %rcc.tmp.28, 80
  br i1 %rcc.tmp.29, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.31 = load i32, ptr %score
  %rcc.tmp.32 = sub i32 %rcc.tmp.31, 10
  store i32 %rcc.tmp.32, ptr %score
  br label %if.merge.3
if.else.3:
  %rcc.tmp.35 = load i32, ptr %score
  %rcc.tmp.36 = add i32 %rcc.tmp.35, 5
  store i32 %rcc.tmp.36, ptr %score
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.39 = load i32, ptr %revenue..tmp
  %rcc.tmp.40 = icmp sgt i32 %rcc.tmp.39, 50000
  br i1 %rcc.tmp.40, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.42 = load i32, ptr %score
  %rcc.tmp.43 = add i32 %rcc.tmp.42, 20
  store i32 %rcc.tmp.43, ptr %score
  br label %if.merge.4
if.else.4:
  %rcc.tmp.46 = load i32, ptr %revenue..tmp
  %rcc.tmp.47 = icmp sgt i32 %rcc.tmp.46, 20000
  br i1 %rcc.tmp.47, label %if.then.5, label %if.else.5
if.then.5:
  %rcc.tmp.49 = load i32, ptr %score
  %rcc.tmp.50 = add i32 %rcc.tmp.49, 10
  store i32 %rcc.tmp.50, ptr %score
  br label %if.merge.5
if.else.5:
  br label %if.merge.5
if.merge.5:
  br label %if.merge.4
if.merge.4:
  store i32 0, ptr %i
  %rcc.tmp.56 = load i32, ptr %revenue..tmp
  store i32 %rcc.tmp.56, ptr %temp_rev
  br label %while.cond
while.cond:
  %rcc.tmp.59 = load i32, ptr %i
  %rcc.tmp.60 = icmp slt i32 %rcc.tmp.59, 5
  br i1 %rcc.tmp.60, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.63 = load i32, ptr %temp_rev
  %rcc.tmp.64 = load i32, ptr %i
  %rcc.tmp.65 = add i32 %rcc.tmp.64, 1
  %rcc.tmp.66 = sdiv i32 %rcc.tmp.63, %rcc.tmp.65
  store i32 %rcc.tmp.66, ptr %temp_rev
  %rcc.tmp.68 = load i32, ptr %i
  %rcc.tmp.69 = add i32 %rcc.tmp.68, 1
  store i32 %rcc.tmp.69, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.72 = load i32, ptr %score
  %rcc.tmp.73 = load i32, ptr %temp_rev
  %rcc.tmp.74 = srem i32 %rcc.tmp.73, 10
  %rcc.tmp.75 = add i32 %rcc.tmp.72, %rcc.tmp.74
  store i32 %rcc.tmp.75, ptr %score
  %rcc.tmp.77 = load i32, ptr %score
  %rcc.tmp.78 = icmp sgt i32 %rcc.tmp.77, 15
  br i1 %rcc.tmp.78, label %if.then.6, label %if.else.6
if.then.6:
  br label %if.merge.6
if.else.6:
  %rcc.tmp.81 = load i32, ptr %score
  %rcc.tmp.82 = icmp sgt i32 %rcc.tmp.81, 0
  br i1 %rcc.tmp.82, label %if.then.7, label %if.else.7
if.then.7:
  br label %if.merge.7
if.else.7:
  %rcc.tmp.85 = sub i32 0, 1
  br label %if.merge.7
if.merge.7:
  %rcc.tmp.87 = phi i32 [0, %if.then.7], [%rcc.tmp.85, %if.else.7]
  br label %if.merge.6
if.merge.6:
  %rcc.tmp.89 = phi i32 [1, %if.then.6], [%rcc.tmp.87, %if.merge.7]
  ret i32 %rcc.tmp.89
}
define i32 @another_level_of_processing.(i32 %data.tmp, i32 %factor.tmp) {
entry:
  %data..tmp = alloca i32 
  %factor..tmp = alloca i32 
  %i = alloca i32 
  %result = alloca i32 
  %j = alloca i32 
  store i32 %data.tmp, ptr %data..tmp
  store i32 %factor.tmp, ptr %factor..tmp
  store i32 0, ptr %i
  %rcc.tmp.4 = load i32, ptr %data..tmp
  store i32 %rcc.tmp.4, ptr %result
  br label %while.cond
while.cond:
  %rcc.tmp.7 = load i32, ptr %i
  %rcc.tmp.8 = icmp slt i32 %rcc.tmp.7, 10
  br i1 %rcc.tmp.8, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.11 = load i32, ptr %i
  %rcc.tmp.12 = srem i32 %rcc.tmp.11, 2
  %rcc.tmp.13 = icmp eq i32 %rcc.tmp.12, 0
  br i1 %rcc.tmp.13, label %if.then, label %if.else
if.then:
  %rcc.tmp.15 = load i32, ptr %result
  %rcc.tmp.16 = load i32, ptr %factor..tmp
  %rcc.tmp.17 = load i32, ptr %i
  %rcc.tmp.18 = mul i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = add i32 %rcc.tmp.15, %rcc.tmp.18
  store i32 %rcc.tmp.19, ptr %result
  br label %if.merge
if.else:
  %rcc.tmp.22 = load i32, ptr %result
  %rcc.tmp.23 = load i32, ptr %factor..tmp
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = mul i32 %rcc.tmp.23, %rcc.tmp.24
  %rcc.tmp.26 = sdiv i32 %rcc.tmp.25, 2
  %rcc.tmp.27 = sub i32 %rcc.tmp.22, %rcc.tmp.26
  store i32 %rcc.tmp.27, ptr %result
  br label %if.merge
if.merge:
  store i32 0, ptr %j
  br label %while.cond.2
while.cond.2:
  %rcc.tmp.32 = load i32, ptr %j
  %rcc.tmp.33 = icmp slt i32 %rcc.tmp.32, 5
  br i1 %rcc.tmp.33, label %while.body.2, label %while.linker.2
while.linker.2:
  br label %while.end.2
while.body.2:
  %rcc.tmp.36 = load i32, ptr %result
  %rcc.tmp.37 = load i32, ptr %j
  %rcc.tmp.38 = add i32 %rcc.tmp.36, %rcc.tmp.37
  store i32 %rcc.tmp.38, ptr %result
  %rcc.tmp.40 = load i32, ptr %j
  %rcc.tmp.41 = add i32 %rcc.tmp.40, 1
  store i32 %rcc.tmp.41, ptr %j
  br label %while.cond.2
while.end.2:
  %rcc.tmp.44 = load i32, ptr %i
  %rcc.tmp.45 = add i32 %rcc.tmp.44, 1
  store i32 %rcc.tmp.45, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.48 = load i32, ptr %result
  ret i32 %rcc.tmp.48
}
define i32 @yet_another_function.(i32 %val1.tmp, i32 %val2.tmp) {
entry:
  %val1..tmp = alloca i32 
  %val2..tmp = alloca i32 
  %intermediate = alloca i32 
  %k = alloca i32 
  store i32 %val1.tmp, ptr %val1..tmp
  store i32 %val2.tmp, ptr %val2..tmp
  %rcc.tmp.3 = load i32, ptr %val1..tmp
  %rcc.tmp.4 = load i32, ptr %val2..tmp
  %rcc.tmp.5 = icmp sgt i32 %rcc.tmp.3, %rcc.tmp.4
  br i1 %rcc.tmp.5, label %if.then, label %if.else
if.then:
  %rcc.tmp.7 = load i32, ptr %val1..tmp
  %rcc.tmp.8 = load i32, ptr %val2..tmp
  %rcc.tmp.9 = sub i32 %rcc.tmp.7, %rcc.tmp.8
  br label %if.merge
if.else:
  %rcc.tmp.11 = load i32, ptr %val2..tmp
  %rcc.tmp.12 = load i32, ptr %val1..tmp
  %rcc.tmp.13 = sub i32 %rcc.tmp.11, %rcc.tmp.12
  br label %if.merge
if.merge:
  %rcc.tmp.15 = phi i32 [%rcc.tmp.9, %if.then], [%rcc.tmp.13, %if.else]
  store i32 %rcc.tmp.15, ptr %intermediate
  store i32 0, ptr %k
  br label %while.cond
while.cond:
  %rcc.tmp.19 = load i32, ptr %k
  %rcc.tmp.20 = icmp slt i32 %rcc.tmp.19, 5
  br i1 %rcc.tmp.20, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.23 = load i32, ptr %intermediate
  %rcc.tmp.24 = load i32, ptr %k
  %rcc.tmp.25 = add i32 %rcc.tmp.24, 1
  %rcc.tmp.26 = call i32 @another_level_of_processing.(i32 %rcc.tmp.23, i32 %rcc.tmp.25)
  store i32 %rcc.tmp.26, ptr %intermediate
  %rcc.tmp.28 = load i32, ptr %k
  %rcc.tmp.29 = add i32 %rcc.tmp.28, 1
  store i32 %rcc.tmp.29, ptr %k
  br label %while.cond
while.end:
  %rcc.tmp.32 = load i32, ptr %intermediate
  %rcc.tmp.33 = icmp sgt i32 %rcc.tmp.32, 1000
  br i1 %rcc.tmp.33, label %if.then.2, label %if.else.2
if.then.2:
  ret i32 1000
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.37 = load i32, ptr %intermediate
  ret i32 %rcc.tmp.37
}
define i32 @process_complex_data.(i32 %a.tmp, i32 %b.tmp, i32 %c.tmp) {
entry:
  %a..tmp = alloca i32 
  %b..tmp = alloca i32 
  %c..tmp = alloca i32 
  %res1 = alloca i32 
  %res2 = alloca i32 
  %res3 = alloca i32 
  %final_val = alloca i32 
  %i = alloca i32 
  store i32 %a.tmp, ptr %a..tmp
  store i32 %b.tmp, ptr %b..tmp
  store i32 %c.tmp, ptr %c..tmp
  %rcc.tmp.4 = load i32, ptr %a..tmp
  %rcc.tmp.5 = load i32, ptr %b..tmp
  %rcc.tmp.6 = call i32 @yet_another_function.(i32 %rcc.tmp.4, i32 %rcc.tmp.5)
  store i32 %rcc.tmp.6, ptr %res1
  %rcc.tmp.8 = load i32, ptr %b..tmp
  %rcc.tmp.9 = load i32, ptr %c..tmp
  %rcc.tmp.10 = call i32 @yet_another_function.(i32 %rcc.tmp.8, i32 %rcc.tmp.9)
  store i32 %rcc.tmp.10, ptr %res2
  %rcc.tmp.12 = load i32, ptr %a..tmp
  %rcc.tmp.13 = load i32, ptr %c..tmp
  %rcc.tmp.14 = call i32 @yet_another_function.(i32 %rcc.tmp.12, i32 %rcc.tmp.13)
  store i32 %rcc.tmp.14, ptr %res3
  %rcc.tmp.16 = load i32, ptr %res1
  %rcc.tmp.17 = load i32, ptr %res2
  %rcc.tmp.18 = add i32 %rcc.tmp.16, %rcc.tmp.17
  %rcc.tmp.19 = load i32, ptr %res3
  %rcc.tmp.20 = add i32 %rcc.tmp.18, %rcc.tmp.19
  store i32 %rcc.tmp.20, ptr %final_val
  store i32 0, ptr %i
  br label %while.cond
while.cond:
  %rcc.tmp.24 = load i32, ptr %i
  %rcc.tmp.25 = icmp slt i32 %rcc.tmp.24, 10
  br i1 %rcc.tmp.25, label %while.body, label %while.linker
while.linker:
  br label %while.end
while.body:
  %rcc.tmp.28 = load i32, ptr %final_val
  %rcc.tmp.29 = load i32, ptr %i
  %rcc.tmp.30 = load i32, ptr %i
  %rcc.tmp.31 = mul i32 %rcc.tmp.29, %rcc.tmp.30
  %rcc.tmp.32 = sub i32 %rcc.tmp.28, %rcc.tmp.31
  store i32 %rcc.tmp.32, ptr %final_val
  %rcc.tmp.34 = load i32, ptr %i
  %rcc.tmp.35 = add i32 %rcc.tmp.34, 1
  store i32 %rcc.tmp.35, ptr %i
  br label %while.cond
while.end:
  %rcc.tmp.38 = load i32, ptr %final_val
  ret i32 %rcc.tmp.38
}
define i32 @simulate_external_factors.(i32 %current_rev.tmp) {
entry:
  %current_rev..tmp = alloca i32 
  %market_condition = alloca i32 
  store i32 %current_rev.tmp, ptr %current_rev..tmp
  %rcc.tmp.2 = load i32, ptr %current_rev..tmp
  %rcc.tmp.3 = srem i32 %rcc.tmp.2, 5
  store i32 %rcc.tmp.3, ptr %market_condition
  %rcc.tmp.5 = load i32, ptr %market_condition
  %rcc.tmp.6 = icmp eq i32 %rcc.tmp.5, 0
  br i1 %rcc.tmp.6, label %if.then, label %if.else
if.then:
  %rcc.tmp.8 = sub i32 0, 500
  br label %if.merge
if.else:
  %rcc.tmp.10 = load i32, ptr %market_condition
  %rcc.tmp.11 = icmp eq i32 %rcc.tmp.10, 1
  br i1 %rcc.tmp.11, label %if.then.2, label %if.else.2
if.then.2:
  br label %if.merge.2
if.else.2:
  %rcc.tmp.14 = load i32, ptr %market_condition
  %rcc.tmp.15 = icmp eq i32 %rcc.tmp.14, 2
  br i1 %rcc.tmp.15, label %if.then.3, label %if.else.3
if.then.3:
  br label %if.merge.3
if.else.3:
  %rcc.tmp.18 = load i32, ptr %market_condition
  %rcc.tmp.19 = icmp eq i32 %rcc.tmp.18, 3
  br i1 %rcc.tmp.19, label %if.then.4, label %if.else.4
if.then.4:
  br label %if.merge.4
if.else.4:
  %rcc.tmp.22 = sub i32 0, 100
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.24 = phi i32 [1000, %if.then.4], [%rcc.tmp.22, %if.else.4]
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.26 = phi i32 [0, %if.then.3], [%rcc.tmp.24, %if.merge.4]
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.28 = phi i32 [200, %if.then.2], [%rcc.tmp.26, %if.merge.3]
  br label %if.merge
if.merge:
  %rcc.tmp.30 = phi i32 [%rcc.tmp.8, %if.then], [%rcc.tmp.28, %if.merge.2]
  ret i32 %rcc.tmp.30
}
define i32 @final_check.(i32 %stock_a.tmp, i32 %stock_b.tmp, i32 %stock_c.tmp, i32 %revenue.tmp) {
entry:
  %stock_a..tmp = alloca i32 
  %stock_b..tmp = alloca i32 
  %stock_c..tmp = alloca i32 
  %revenue..tmp = alloca i32 
  %score = alloca i32 
  store i32 %stock_a.tmp, ptr %stock_a..tmp
  store i32 %stock_b.tmp, ptr %stock_b..tmp
  store i32 %stock_c.tmp, ptr %stock_c..tmp
  store i32 %revenue.tmp, ptr %revenue..tmp
  store i32 0, ptr %score
  %rcc.tmp.6 = load i32, ptr %stock_a..tmp
  %rcc.tmp.7 = icmp sgt i32 %rcc.tmp.6, 500
  br i1 %rcc.tmp.7, label %if.then, label %if.else
if.then:
  %rcc.tmp.9 = load i32, ptr %score
  %rcc.tmp.10 = add i32 %rcc.tmp.9, 1
  store i32 %rcc.tmp.10, ptr %score
  br label %if.merge
if.else:
  br label %if.merge
if.merge:
  %rcc.tmp.14 = load i32, ptr %stock_b..tmp
  %rcc.tmp.15 = icmp sgt i32 %rcc.tmp.14, 800
  br i1 %rcc.tmp.15, label %if.then.2, label %if.else.2
if.then.2:
  %rcc.tmp.17 = load i32, ptr %score
  %rcc.tmp.18 = add i32 %rcc.tmp.17, 1
  store i32 %rcc.tmp.18, ptr %score
  br label %if.merge.2
if.else.2:
  br label %if.merge.2
if.merge.2:
  %rcc.tmp.22 = load i32, ptr %stock_c..tmp
  %rcc.tmp.23 = icmp sgt i32 %rcc.tmp.22, 400
  br i1 %rcc.tmp.23, label %if.then.3, label %if.else.3
if.then.3:
  %rcc.tmp.25 = load i32, ptr %score
  %rcc.tmp.26 = add i32 %rcc.tmp.25, 1
  store i32 %rcc.tmp.26, ptr %score
  br label %if.merge.3
if.else.3:
  br label %if.merge.3
if.merge.3:
  %rcc.tmp.30 = load i32, ptr %revenue..tmp
  %rcc.tmp.31 = icmp sgt i32 %rcc.tmp.30, 100000
  br i1 %rcc.tmp.31, label %if.then.4, label %if.else.4
if.then.4:
  %rcc.tmp.33 = load i32, ptr %score
  %rcc.tmp.34 = add i32 %rcc.tmp.33, 2
  store i32 %rcc.tmp.34, ptr %score
  br label %if.merge.4
if.else.4:
  br label %if.merge.4
if.merge.4:
  %rcc.tmp.38 = load i32, ptr %score
  ret i32 %rcc.tmp.38
}
