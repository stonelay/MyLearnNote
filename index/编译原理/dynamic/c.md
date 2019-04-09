
## 
```
#include<dlfcn.h>
void* dlsym(void*handle,constchar*symbol)

dlsym(RTLD_DEFAULT, "name");

int testFunc(int n, int m) {
  return n+m;
}

int main() {
  // (1)
  int (*funcPointer)(int, int) = dlsym(RTLD_DEFAULT, "testFunc");
  funcPointer(1, 2);

  // (2)
  void (*funcPointer)() = dlsym(RTLD_DEFAULT, "testFunc");
  funcPointer(1, 2); //error

  return 0;
}

```
handle：由dlopen打开动态链接库后返回的指针；
symbol：要求获取的函数或全局变量的名称。

|Method name|Corresponding encoding| 
|:--------------|:-------------------------| 
|initWithContentRect:styleMask:backing:defer: |@36@0:4{_NSRect={_NSPoint=ff}{NSSize=ff}}8I24I28c32| 
|initWithFrame |@24@0:4{_NSRect={_NSPoint=ff}{NSSize=ff}}8| 
|setBottomCornerRounded:|v12@0:4c8 | 
|respondsToSelector:|c12@0:4:8 | 
|addSubview: |v12@0:4@8 | 
| sharedController|@8@0:4 |