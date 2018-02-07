# Notice

## glBindAttribLocation, glGetAttribLocation
### reason
[https://stackoverflow.com/questions/12051205/why-should-i-use-glbindattriblocation]

1. 使用 glBindAttribLocation 可以使用name 来绑定 attribute number，使提高程序可读性
2. 在 频繁 更新attribute的时候， 使用glGetAttribLocation 得到的number 会变化。不利于程序维护。
3. 还有一种说法是、glGetAttribLocation如果在编译以后使用，会强制同步的执行，影响性能。