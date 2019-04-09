## 做什么
我们在函数调用前，需要明确的告诉编译器这个函数的参数和返回值类型是什么，函数才能正常执行。

那这样来说动态的调用一个C函数是不可能实现了，因为我们在编译前，就要将遵循调用规则的函数调用写在需要调用的地方，然后通过编译器编译生成对应的汇编代码，将相应的栈和寄存器状态准备好。如果想在运行时动态去调用的话，将没有人为我们做这一系列的处理。

所以我们要解决的问题是：当我们在运行时动态调用一个函数时，自己要先将相应栈和寄存器状态准备好，然后生成相应的汇编指令。这也正是libffi所做的。

## 怎么做
FFI（Foreign Function Interface）允许以一种语言编写的代码调用另一种语言的代码，而libffi库提供了最底层的、与架构相关的、完整的FFI。libffi的作用就相当于编译器，它为多种调用规则提供了一系列高级语言编程接口，然后通过相应接口完成函数调用，底层会根据对应的规则，完成数据准备，生成相应的汇编指令代码。

那么这样我们就可以通过libffi动态的调用任意C函数。

### 动态调用
使用libffi提供接口动态调用流程如下： 
1. 准备好参数数据及其对应ffi_type数组、返回值内存指针、函数指针 
2. 创建与函数特征相匹配的函数原型：ffi_cif对象 
3. 使用“ffi_call”来完成函数调用

```
  void apply (void *func, int argc, ffi_type *rtype, ffi_type **atypes, void *rvalue, void **avalue) {
    // 生成函数原型 ffi_cfi 对象
  ffi_cif cif;
  ffi_prep_cif(&cif, FFI_DEFAULT_ABI, argc, rtype, atypes);
  // 根据函数指针调用
  ffi_call(&cif, func, rvalue, avalue);
}
```
可见使用ffi，只要有函数原型cif对象，函数实现指针，返回值内存指针和函数参数数组，我们就可以实现在运行时动态调用任意C函数。

所以如果想实现其他语言(譬如JS)，执行过程中动态调用C函数，只需在调用过程中加一层转换，将参数及返回值类型转换成libffi对应类型，并封装成函数原型cif对象，准备好参数数据，找到对应函数指针，然后调用即可。

## 动态定义
上述步骤大致分为： 
1. 准备一个函数实体 
2. 声明一个函数指针 
3. 根据函数参数个数/参数及返回值类型生成一个函数原型 
4. 创建一个ffi_closure对象，并用其将函数原型、函数实体、函数上下文、函数指针关联起来 
5. 释放closure
```
ffi_status ffi_prep_closure_loc (ffi_closure *closure,  //闭包，一个ffi_closure对象
       ffi_cif *cif,  //函数原型
       void (*fun) (ffi_cif *cif, void *ret, void **args, void*user_data), //函数实体
       void *user_data, //函数上下文，函数实体实参
       void *codeloc)   //函数指针，指向函数实体


void ffi_function(ffi_cif *cif, void *ret, void **args, void *userdata) {
   // args为所有参数的内存地址
   *(ffi_arg *)ret = 100;
}

- (void)colsureDemo
{
    int argc = 2;
    ffi_type *rtype = &ffi_type_sint;
    void* avalue[2];
    int a, b;
    avalue[0] = &a;
    avalue[1] = &b;
    int r;
    
    ffi_type *atypes[2];
    atypes[0] = &ffi_type_sint;
    atypes[1] = &ffi_type_sint;
    
    void *imp;
    ffi_cif cif;
    ffi_closure *closure = ffi_closure_alloc(sizeof(ffi_closure), (void **)&imp);
    
    if (closure) {
      //生成函数原型
        if (ffi_prep_cif(&cif, FFI_DEFAULT_ABI, argc, rtype, atypes) == FFI_OK) {
          // 函数原型 关联
            if (ffi_prep_closure_loc(closure, &cif, ffi_function, (__bridge void *)(self), imp) == FFI_OK) {
                r = ((int (*)(void))imp)();
                NSLog(@"%d", r);
            }
        }
    }   
    ffi_closure_free(closure);
}
```


* 数据类型
ffi_type
```
typedef struct _ffi_type
{
  size_t size;
  unsigned short alignment;
  unsigned short type;
  struct _ffi_type **elements;
} ffi_type;
```

* 模版
ffi_cif
```
typedef struct {
  ffi_abi abi;
  unsigned nargs;
  ffi_type **arg_types;
  ffi_type *rtype;
  unsigned bytes;
  unsigned flags;
#ifdef FFI_EXTRA_CIF_FIELDS
  FFI_EXTRA_CIF_FIELDS;
#endif
} ffi_cif;
```

* 生成模版
```
ffi_prep_cif(&cif, FFI_DEFAULT_ABI, 2, retType, types);
```

* 动态调用
```
ffi_call(&cif, fun1,  &ret, args);
```

* 闭包
```

```