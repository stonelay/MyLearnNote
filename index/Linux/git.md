##

git reset --hard HEAD^
git reset --hard 1094a
git reflog

-- to discard changes in working directory// 从暂存区中
git checkout -- readme.txt 

-- 暂存区的修改撤销掉
git reset HEAD readme.txt

git reset --hard HEAD^

git remote add origin

git stash
git stash list 
git stash pop

git push origin v1.0
git push origin --tags

命令git tag <tagname>用于新建一个标签，默认为HEAD，也可以指定一个commit id；
命令git tag -a <tagname> -m "blablabla..."可以指定标签信息；
命令git tag可以查看所有标签。
命令git push origin <tagname>可以推送一个本地标签；
命令git push origin --tags可以推送全部未推送过的本地标签；
命令git tag -d <tagname>可以删除一个本地标签；
命令git push origin :refs/tags/<tagname>可以删除一个远程标签。


git push <远程主机名> <本地分支名>  <远程分支名>


## branch
git checkout -b dev
-->
git branch dev
git checkout dev

## 修改最近一次的commit 信息
git commit --amend


