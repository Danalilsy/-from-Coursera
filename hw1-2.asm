#��һ�λ�����ҵ
#�ڶ��⣺�ַ������ұȽ�
#��˴Ң 1500012934
	.data
msg_succ: .asciiz "\r\nSuccess! Location: "
msg_fail: .asciiz "\r\nFail!\r\n"
newline: .asciiz "\r\n"
buf: .space 200
	.text
	.globl main
main:	
	la $a0, buf 
	la $a1, 200 #�ַ�����󳤶�
	li $v0, 8 #8��ϵͳ���ã����ַ���
	syscall
	
readchar: #�������ѯ�ַ�
	li $v0, 12 #12��ϵͳ���ã����ַ�
	syscall
	li $t0, '?'
	beq $v0, $t0, quit #v0 == '?'

	la $s0, buf #s0��buf��ʼ��ַ
	li $s1, 0 #s1�������ʼ��ַ��ƫ����
	
query_loop:
	add $s2, $s0, $s1 #s2����ǰ�Ƚ��ַ���ַ
	lb $s3, ($s2) #s3����ǰ�Ƚ��ַ�
	beq $s3, $v0, find #�ҵ�ƥ���ַ�
	addi $s1, $s1, 1 #ƫ����+1
	beq $s1, $a1, fail 
	j query_loop
	
find: #�ҵ�ƥ���ַ�
	la $a0, msg_succ #���success�ַ���
	li $v0, 4
	syscall
	addi $a0, $s1, 1 #λ�ñ����1��ʼ
	li $v0, 1 #���λ�ñ���
	syscall
	la $a0, newline #����
	li $v0, 4
	syscall
	j readchar #֧�ַ�������ϣ����ѯ���ַ�

fail: #�ַ�����û�и��ַ�
	la $a0, msg_fail #���fail�ַ���
	li $v0, 4
	syscall
	j readchar #֧�ַ�������ϣ����ѯ���ַ�
	
quit: #����'?'��������