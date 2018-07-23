# shell
#-----------1.factorial.sh------------

第一步:判断输入参数个数,如果$#为0,那么就usage反馈,否则进行函数功能.

第二步:进入函数,$1作为factorial的参数.
		使用局部变量num存储函数参数,fac做为全局变量输出.
	    如果小于等于1,那么fac=1.
		否则,num-1作为参数再执行函数,然后将fac与num递归相乘.

第三步:返回函数值fac

Example:
Input : ./1.factorial.sh
Output : 1.usage: 1.factorial.sh [n]
	 calculates a number's factorial

	 Input : ./1.factorial.sh 5
	 Output : 120

	 Input : ./1.factorial.sh 13
	 Output : 6227020800
#---------------END---------------------

#--------------2.self_compression.sh--------------

