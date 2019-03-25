
# 变量
set valueName value
set valueName (command)

# find
find . -name "fileName"

# 文件大小
ls -lht // 内容比较多的
du -h * // kb
wc -c filename // 字节

# grep 
grep -i -n 'char' filepath

-i 忽略大小写
-n 显示line number
-v 不带关键字的，反向查询
-Bn 之前的n行
-An 之后的n行
-Cn 当前前后的n行
-w 精确匹配
-e 多个匹配

# printf
printf '%-10s %10s\n' a b c aids asdj

# echo
-e 转义
-n 连续

# regex
^ 行首
$ 行尾
^$ 空行
\b 词首词尾
\B 非词首词尾




https://gems.ruby-china.com/
https://rubygems.org/