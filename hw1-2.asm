#第一次互评作业
#第二题：字符串查找比较
#黎舜尧 1500012934
	.data
msg_succ: .asciiz "\r\nSuccess! Location: "
msg_fail: .asciiz "\r\nFail!\r\n"
newline: .asciiz "\r\n"
buf: .space 200
	.text
	.globl main
main:	
	la $a0, buf 
	la $a1, 200 #字符串最大长度
	li $v0, 8 #8号系统调用，读字符串
	syscall
	
readchar: #读入待查询字符
	li $v0, 12 #12号系统调用，读字符
	syscall
	li $t0, '?'
	beq $v0, $t0, quit #v0 == '?'

	la $s0, buf #s0：buf起始地址
	li $s1, 0 #s1：相对起始地址的偏移量
	
query_loop:
	add $s2, $s0, $s1 #s2：当前比较字符地址
	lb $s3, ($s2) #s3：当前比较字符
	beq $s3, $v0, find #找到匹配字符
	addi $s1, $s1, 1 #偏移量+1
	beq $s1, $a1, fail 
	j query_loop
	
find: #找到匹配字符
	la $a0, msg_succ #输出success字符串
	li $v0, 4
	syscall
	addi $a0, $s1, 1 #位置编码从1开始
	li $v0, 1 #输出位置编码
	syscall
	la $a0, newline #换行
	li $v0, 4
	syscall
	j readchar #支持反复输入希望查询的字符

fail: #字符串里没有该字符
	la $a0, msg_fail #输出fail字符串
	li $v0, 4
	syscall
	j readchar #支持反复输入希望查询的字符
	
quit: #读到'?'结束程序