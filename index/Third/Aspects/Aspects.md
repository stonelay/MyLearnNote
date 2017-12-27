# Aspects

## pre

项目需要行为记录，需要将业务逻辑和打点逻辑 解耦。
可以使用 AOP， 面向切面。
通过生成一个动态代理类，从而实现对目标对象嵌入附加的操作。
github 上已有实现的轮子 [Aspects](https://github.com/steipete/Aspects)

需要知道 oc 执行函数的时候，是一个[消息发送](../../iOS/消息转发.md)的过程。 我们可以动态的 消息替换实现AOP。

## Aspects 实现

#### AspectsContainer

对于多个 重复替换:
若是 相同的Selector 替换方法一次，后续替换，以队列的方式存在container中，以block形式存储




## source

block 本质上来说是 函数指针
aspects 是 最后执行的是block
```objc
// Block internals.
typedef NS_OPTIONS(int, AspectBlockFlags) {
	AspectBlockFlagsHasCopyDisposeHelpers = (1 << 25),
	AspectBlockFlagsHasSignature          = (1 << 30)
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
```


# Aspect 部分 数据结构
```c
// AspectTracker
// 标记类方法的 替换 方法
// 内存中维护 者一个 swizzledClassesDict (Class-->aspectTracker)
@interface AspectTracker : NSObject
- (id)initWithTrackedClass:(Class)trackedClass;
@property (nonatomic, strong) Class trackedClass;// tracker 的 class
@property (nonatomic, readonly) NSString *trackedClassName; 
@property (nonatomic, strong) NSMutableSet *selectorNames;//树枝 Traker有SEL
@property (nonatomic, strong) NSMutableDictionary *selectorNamesToSubclassTrackers; // 非树枝 包含子类的Tracker
- (void)addSubclassTracker:(AspectTracker *)subclassTracker hookingSelectorName:(NSString *)selectorName;
- (void)removeSubclassTracker:(AspectTracker *)subclassTracker hookingSelectorName:(NSString *)selectorName;
- (BOOL)subclassHasHookedSelectorName:(NSString *)selectorName;
- (NSSet *)subclassTrackersHookingSelectorName:(NSString *)selectorName;
@end

```