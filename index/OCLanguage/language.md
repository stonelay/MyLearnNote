
## attibute 
#### overloadable
__attribute__((overloadable)) 
static void myTest(int a) {
    NSLog(@"aaa");
}

__attribute__((overloadable))
static void myTest(double a) {
    NSLog(@"bbb");
}