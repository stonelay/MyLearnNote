

## MRB_OBJECT_HEADER
```
#define MRB_OBJECT_HEADER \
  enum mrb_vtype tt:8;\  
  uint32_t color:3;\
  uint32_t flags:21;\
  struct RClass *c;\
  struct RBasic *gcnext
```
mrb_vtype // 实际类型
color // gc相关标位
RClass //Object 的 class
RBasic // gc 相关内容

## Object
ruby中所有对象都是Object的子类，Object是BasicObject的子类。在mruby实现中，BasicObject是RBasic
```
struct RBasic {  
  MRB_OBJECT_HEADER;
};
```

就是除了MRBOBJECTHEADER以外没有任何内容。Object是RObject，内容如下:

struct RObject {  
  MRB_OBJECT_HEADER;
  struct iv_tbl *iv;
};
额外多存储了一个iv字段，内容为实例变量表。

同时Class也是一个Object，为RClass

struct RClass {  
  MRB_OBJECT_HEADER;
  struct iv_tbl *iv;
  struct kh_mt *mt;
  struct RClass *super;
};
其中super指向父类。

在mrb_init_class中，会创建BasicObject / Object / Module / Class 四个类对象，并且指定继承关系。