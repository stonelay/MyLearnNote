# linux


# 查看所有 用户
```
cat /etc/passwd|grep -v nologin|grep -v halt|grep -v shutdown|awk -F":" '{ print $1"|"$3"|"$4 }'|more
```

# kill
kill -9 [pid]

ps -u [username]






