# shell
#------------------------------1.factorial.sh----------------------------------

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

#--------------------------------------END--------------------------------------

#-----------------------------2.self_compression.sh------------------------------

第一步:判断参数个数,若$#是0或1,那么对应if输出
第二步:据指定文件路径$1,得到压缩文件后缀名suffix和压缩包名字filename.
第三步:在$2中mkdir一个命名为$filename的空目录
第四步:使用if分类型解压到目标目录下
第五步:遍历新目录下的所有文件,输出

细节:
suffix="${1##*.}"				#对$1取尾得到suffix
filename="${1%.*}"				#对$1去尾得到filename
if [ $suffix = "gz" -o $suffix = "bz2" ]	#如果suffix不是完整后缀
then
	suffix="${filename##*.}.$suffix"	#对filename再取尾合并
	filename="${filename%.*}"		#对filename再去尾
fi
filename="${filename##*/}"			#最后取尾/

Example:
Input : ./2.self_compression.sh  ~/Desktop/shell_script/shell/shell.tar.bz2 ./
Output :
Archive:  /home/user/Desktop/shell_script/shell/shell.tar.bz2
   creating:  ./shell/
  inflating:  ./shell/Untitled Document 2
  inflating:  ./shell/Untitled Document 3
  inflating:  ./shell/Untitled.h

Input : ./2.self_compression.sh ~/Desktop/shell_script/shell/shell.zip ./
Archive:  /home/ryu/Desktop/shell_script/shell/shell.zip
   creating:  ./shell/
  inflating:  ./shell/Untitled Document
  inflating:  ./shell/Untitled Document 2
  inflating:  ./shell/Untitled Document 3

#----------------------------------------------------------------------------

#--------------------------------3.file_size.sh------------------------------
