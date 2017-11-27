# SomeSnippet

## 多参数

```objc
// print args
- (void)print:(NSString *)first, ... {
    id value;
    va_list args;
    if (first) {
        NSLog(@"%@", first);
        va_start(args, first);
        while ((value = va_arg(args, id)))
            NSLog(@"%@", value);
        va_end(args);
    }
}
```


## block 获取MethodSignature

```objc
typedef NS_OPTIONS(int, AspectBlockFlags) {
	AspectBlockFlagsHasCopyDisposeHelpers = (1 << 25),  // 是否有copy 和 dispose
	AspectBlockFlagsHasSignature          = (1 << 30)   // 是否有签名
};

typedef struct _AspectBlock {
	__unused Class isa;
	AspectBlockFlags flags;
	__unused int reserved;
	void (__unused *invoke)(struct _AspectBlock *block, ...);
	struct {
		unsigned long int reserved;
		unsigned long int size;
		// requires AspectBlockFlagsHasCopyDisposeHelpers
		void (*copy)(void *dst, const void *src);
		void (*dispose)(const void *);
		// requires AspectBlockFlagsHasSignature
        const char *signature;
		const char *layout;
	} *descriptor;
	// imported variables
} *AspectBlockRef;

static NSMethodSignature *aspect_blockMethodSignature(id block, NSError **error) {
    AspectBlockRef layout = (__bridge void *)block;
	if (!(layout->flags & AspectBlockFlagsHasSignature)) {
        NSString *description = [NSString stringWithFormat:@"The block %@ doesn't contain a type signature.", block];
        AspectError(AspectErrorMissingBlockSignature, description);
        return nil;
    }
    void *desc = layout->descriptor;
    desc += 2 * sizeof(unsigned long int);// 因为 descriptor 结构体， 前还有两个reserved 和 size
    if (layout->flags & AspectBlockFlagsHasCopyDisposeHelpers) { // 若 有 copy 和 dispose 函数指针， 还需要移动两个位置
        desc += 2 * sizeof(void *);
    }
//    指针移到 signature
    if (!desc) {
        NSString *description = [NSString stringWithFormat:@"The block %@ doesn't has a type signature.", block];
        AspectError(AspectErrorMissingBlockSignature, description);
        return nil;
    }
    
    const char *signature = (*(const char **)desc);
	return [NSMethodSignature signatureWithObjCTypes:signature];
}

```


