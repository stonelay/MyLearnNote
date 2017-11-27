# dispatch_source

## 

```
NSArray *name = @[@"a",@"b",@"c",@"d",@"e"];
    
    dispatch_source_t source = dispatch_source_create(DISPATCH_SOURCE_TYPE_DATA_ADD, 0, 0, dispatch_get_main_queue());
    dispatch_source_set_event_handler(source, ^{
        // 如果时间间隔短， 会联结
        NSLog(@"handler get data %ld", dispatch_source_get_data(source));
    });
    // 启动 
    dispatch_resume(source);
    
    dispatch_apply(5, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSLog(@"done %@", name[index]);
        dispatch_source_merge_data(source, 1);
        sleep(1);
        // 调用 get 会使 这个值会被重置为0
//        NSLog(@"%ld", dispatch_source_get_data(source));
    });
```