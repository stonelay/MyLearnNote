# SubclassesGetter

### 获取当前 class的所有子类

```objc
// 1231
+ (NSArray *)zl_subclasses {
    int numClasses = objc_getClassList(NULL, 0); // 获取当前所有类的个数
    
    Class *classes = (Class *)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);// 配好内存空间的数组 classes 中存放元素
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < numClasses; ++i) {
        Class superClass = classes[i];
        
        do {
            superClass = class_getSuperclass(superClass);
        } while(superClass && superClass != [self class]);
        
        if (superClass == nil) {
            continue;
        }
        
        [result addObject:classes[i]];
    }
    
    free(classes);
    
    return result;
}
```

# property
```objc 
- (void)setName:(NSString *)name {
    if(_name != name) {
        [_name release];
        _name = [_name retain];
    }
}

- (void)setName:(NSString *)name {
    if(_name != name) {
        [_name release];
        _name = [_name copy];
    }
}
```