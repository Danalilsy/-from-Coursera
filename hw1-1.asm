#��һ�λ�����ҵ
#��һ�⣺��ϵͳ���ܵ���ʵ�ּ��������
#��˴Ң 1500012934
	.data
A: .asciiz "Alpha "
B_: .asciiz "Bravo "
C: .asciiz "China "
D: .asciiz "Delta "
E: .asciiz "Echo "
F: .asciiz "Foxtrot "
G: .asciiz "Golf "
H: .asciiz "Hotel "
I: .asciiz "India "
J_: .asciiz "Juliet "
K: .asciiz "Kilo "
L: .asciiz "Lima "
M: .asciiz "Mary "
N: .asciiz "November "
O: .asciiz "Oscar "
P: .asciiz "Paper "
Q: .asciiz "Quebec "
R: .asciiz "Research "
S: .asciiz "Sierra "
T: .asciiz "Tango "
U: .asciiz "Uniform "
V: .asciiz "Victor "
W: .asciiz "Whisky "
X: .asciiz "X-ray "
Y: .asciiz "Yankee "
Z: .asciiz "Zulu "

a: .asciiz "alpha "
b_: .asciiz "bravo "
c: .asciiz "china "
d: .asciiz "delta "
e: .asciiz "echo "
f: .asciiz "foxtrot "
g: .asciiz "golf "
h: .asciiz "hotel "
i: .asciiz "india "
j_: .asciiz "juliet "
k: .asciiz "kilo "
l: .asciiz "lima "
m: .asciiz "mary "
n: .asciiz "november "
o: .asciiz "oscar "
p: .asciiz "paper "
q: .asciiz "quebec "
r: .asciiz "research "
s: .asciiz "sierra "
t: .asciiz "tango "
u: .asciiz "uniform "
v: .asciiz "victor "
w: .asciiz "whisky "
x: .asciiz "x-ray "
y: .asciiz "yankee "
z: .asciiz "zulu "

zero: .asciiz "zero "
one: .asciiz "First "
two: .asciiz "Second "
three: .asciiz "Third "
four: .asciiz "Fourth "
five: .asciiz "Fifth "
six: .asciiz "Sixth "
seven: .asciiz "Seventh "
eight: .asciiz "Eighth "
nine: .asciiz "Ninth "

alphabet_captain: .word A, B_, C, D, E, F, G, H, I, J_, K, L, M, N, O, P, Q, R, S, T, U, V, W, X, Y, Z
alphabet: .word a, b_, c, d, e, f, g, h, i, j_, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
number: .word zero, one, two, three, four, five, six, seven, eight, nine
star: .asciiz "* "

	.text
	.globl main
main:	
	li $s0, 'z' #����Сд��ĸ�߽�
	li $s1, 'a'
	li $s2, 'Z' #���ô�д��ĸ�߽�
	li $s3, 'A'
	li $s4, '9' #�������ֱ߽�
	li $s5, '0'
getchar:
	li $v0, 12 
	syscall	#12��ϵͳ���ã�����һ���ַ���v0
	#�ж��ǲ���'��'
	li $t0, '?'
	beq $v0, $t0, quit #v0 == '?'
	#�ж��ǲ���Сд��ĸ
	slt $t0, $s0, $v0 
	bnez $t0, disp_star #v0 > 'z'
	slt $t0, $v0, $s1 
	beq $t0, $0, disp_alpha #v0 >= 'a'
	#�ж��ǲ��Ǵ�д��ĸ
	slt $t0, $s2, $v0
	bnez $t0, disp_star #v0 > 'Z'
	slt $t0, $v0, $s3
	beq $t0, $0, disp_alpha_c #v0 >= 'A'
	#�ж��ǲ�������
	slt $t0, $s4, $v0
	bnez $t0, disp_star #v0 > '9'
	slt $t0, $v0, $s5
	beq $t0, $0, disp_num #v0 >= '0' 
	
	j disp_star #�����ַ��������'*'
	
disp_alpha: #����Сд��ĸ
	sub $v0, $v0, $s1 #v0 -= 'a'
	sll $v0, $v0, 2 #MIPS��wordΪ4�ֽ�
	la $t0, alphabet
	add $t0, $t0, $v0
	lw $a0, ($t0)
	li $v0, 4 #4��ϵͳ���ã���ӡ�ַ���
	syscall
	j getchar

disp_alpha_c: #�����д��ĸ
	sub $v0, $v0, $s3 #v0 -= 'A'
	sll $v0, $v0, 2
	la $t0, alphabet_captain
	add $t0, $t0, $v0
	lw $a0, ($t0)
	li $v0, 4
	syscall
	j getchar

disp_num: #��������
	sub $v0, $v0, $s5 #v0 -= '0'
	sll $v0, $v0, 2
	la $t0, number
	add $t0, $t0, $v0
	lw $a0, ($t0)
	li $v0, 4
	syscall
	j getchar
	
disp_star: #�����ַ������'*'
	la $a0, star
	li $v0, 4
	syscall
	j getchar
	
quit: #����'��'�˳�
	
	
