
## 动态调用C函数

```
void test() {
  printf("testFunc");
}

int main() {
  void (*funcPointer)() = dlsym(RTLD_DEFAULT, "test");
  funcPointer();
  return 0;
}
```

* 先准备好任意 参数类型/参数个数/返回值类型 排列组合的 C 函数指针，让最终的汇编把所有情况都准备好，最后调用时通过 switch 去找到正确的那个去执行（PS. 必须先准备好所有的参数）

### libffi
它就是提供了动态调用任意 C 函数的功能

1. 通过 dlsym 拿到函数指针。
2. 给每个参数申请内存空间，按 ffi 要求把参数数据组装成数组。（用alloca()申请空间，不需要free()去释放）
3. 用函数参数个数/参数类型/返回值类型组装成 cif 对象，表示这个函数原型。（有点像OC的methodSignature）
4. 申请内存空间用于保存函数返回值。
5. 把 cif 函数原型，函数指针，返回值内存指针，参数数据 传入 ffi_call调用这个函数。
