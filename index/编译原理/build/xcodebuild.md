
## xcode build run
1. 编译信息写入辅助文件，创建文件架构 .app 文件 
2. 处理文件打包信息 
3. 执行 CocoaPod 编译前脚本，checkPods Manifest.lock 
4. 编译.m文件，使用 CompileC 和 clang 命令 
5. 链接需要的 Framework 
6. 编译 xib 
7. 拷贝 xib ，资源文件 
8. 编译 ImageAssets 
9. 处理 info.plist 
10. 执行 CocoaPod 脚本 
11. 拷贝标准库 
12. 创建 .app 文件和签名

### 编译信息写入辅助文件，创建文件架构 .app 文件 
```shell
# 创建 .app
MkDir /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/CompLogDemo.app (in target: CompLogDemo)
    cd /Users/zhanglei/Desktop/temp/CompLogDemo
    /bin/mkdir -p /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/CompLogDemo.app
```
```shell
# 写入辅助文件 Entitlements.plist
WriteAuxiliaryFile /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/DerivedSources/Entitlements.plist (in target: CompLogDemo)
    cd /Users/zhanglei/Desktop/temp/CompLogDemo
    write-file /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/DerivedSources/Entitlements.plist
```

### 处理文件打包信息 
```
ProcessProductPackaging "" /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo.app.xcent (in target: CompLogDemo)
    cd /Users/zhanglei/Desktop/temp/CompLogDemo
    

Entitlements:

{
    "com.apple.security.get-task-allow" = 1;
}


    builtin-productPackagingUtility -entitlements -format xml -o /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo.app.xcent
```

### 执行 CocoaPod 编译前脚本，checkPods Manifest.lock
### 编译.m文件，使用 CompileC 和 clang 命令 
CompileC 
```shell
# 编译其中一个例子
/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/ViewController.o 
/Users/zhanglei/Desktop/temp/CompLogDemo/CompLogDemo/ViewController.m 
normal x86_64 objective-c com.apple.compilers.llvm.clang.1_0.compiler (in target: CompLogDemo)
```

// xcode tool path 
/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/
```shell
cd /Users/zhanglei/Desktop/temp/CompLogDemo
export LANG=en_US.US-ASCII # 语言环境
clang -x objective-c # 将要编译的文件的类型
-arch x86_64 # 将要编译的硬件架构
-fmessage-length=0 
-fdiagnostics-show-note-include-stack 
-fmacro-backtrace-limit=0 
-std=gnu11 
-fobjc-arc 
-fobjc-weak 
-fmodules 
-gmodules
-fmodules-cache-path=/Users/zhanglei/Library/Developer/Xcode/DerivedData/ModuleCache.noindex 
-fmodules-prune-interval=86400 
-fmodules-prune-after=345600 
-fbuild-session-file=/Users/zhanglei/Library/Developer/Xcode/DerivedData/ModuleCache.noindex/Session.modulevalidation 
-fmodules-validate-once-per-build-session 
-Wnon-modular-include-in-framework-module 
-Werror=non-modular-include-in-framework-module 
-Wno-trigraphs 
-fpascal-strings 
-O0 
-fno-common 
-Wno-missing-field-initializers 
-Wno-missing-prototypes 
-Werror=return-type 
-Wdocumentation 
-Wunreachable-code 
-Wno-implicit-atomic-properties 
-Werror=deprecated-objc-isa-usage 
-Wno-objc-interface-ivars 
-Werror=objc-root-class 
-Wno-arc-repeated-use-of-weak 
-Wimplicit-retain-self 
-Wduplicate-method-match 
-Wno-missing-braces 
-Wparentheses 
-Wswitch 
-Wunused-function 
-Wno-unused-label 
-Wno-unused-parameter 
-Wunused-variable 
-Wunused-value 
-Wempty-body 
-Wuninitialized 
-Wconditional-uninitialized 
-Wno-unknown-pragmas 
-Wno-shadow 
-Wno-four-char-constants 
-Wno-conversion 
-Wconstant-conversion 
-Wint-conversion 
-Wbool-conversion 
-Wenum-conversion 
-Wno-float-conversion 
-Wnon-literal-null-conversion 
-Wobjc-literal-conversion 
-Wshorten-64-to-32 
-Wpointer-sign 
-Wno-newline-eof 
-Wno-selector 
-Wno-strict-selector-match 
-Wundeclared-selector 
-Wdeprecated-implementations 
-DDEBUG=1 
-DOBJC_OLD_DISPATCH_PROTOTYPES=0 
-isysroot 

/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator12.2.sdk 
-fasm-blocks 
-fstrict-aliasing 
-Wprotocol 
-Wdeprecated-declarations 
-mios-simulator-version-min=12.2 
-g 
-Wno-sign-conversion 
-Winfinite-recursion 
-Wcomma 
-Wblock-capture-autoreleasing 
-Wstrict-prototypes 
-Wno-semicolon-before-method-body 
-Wunguarded-availability 
-fobjc-abi-version=2 
-fobjc-legacy-dispatch 
-index-store-path 

/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Index/DataStore 
-iquote 
/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo-generated-files.hmap 
-I/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo-own-target-headers.hmap 
-I/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo-all-target-headers.hmap 
-iquote /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo-project-headers.hmap 
-I/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/include 
-I/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/DerivedSources-normal/x86_64 
-I/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/DerivedSources/x86_64 
-I/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/DerivedSources 
-F/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator 
-MMD -MT dependencies -MF 
/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/ViewController.d 
--serialize-diagnostics 
/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/ViewController.dia 
-c /Users/zhanglei/Desktop/temp/CompLogDemo/CompLogDemo/ViewController.m 

-o /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/ViewController.o
```

### 链接需要的 Framework 
ld BSD General Commands Manual
link
```
Ld /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/CompLogDemo.app/CompLogDemo normal x86_64 (in target: CompLogDemo)

cd /Users/zhanglei/Desktop/temp/CompLogDemo
export IPHONEOS_DEPLOYMENT_TARGET=12.2

clang 
-arch x86_64
-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator12.2.sdk 

-L/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator 
-F/Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator 
-filelist /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/CompLogDemo.LinkFileList 
-Xlinker 
-rpath 
-Xlinker 
@executable_path/Frameworks 
-mios-simulator-version-min=12.2 
-dead_strip 
-Xlinker 
-object_path_lto -Xlinker /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/CompLogDemo_lto.o 
-Xlinker -export_dynamic 
-Xlinker -no_deduplicate 
-Xlinker -objc_abi_version 
-Xlinker 2 -fobjc-arc -fobjc-link-runtime 
-Xlinker -sectcreate 
-Xlinker __TEXT 
-Xlinker __entitlements 
-Xlinker /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/CompLogDemo.app-Simulated.xcent -Xlinker -dependency_info 
-Xlinker /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Intermediates.noindex/CompLogDemo.build/Debug-iphonesimulator/CompLogDemo.build/Objects-normal/x86_64/CompLogDemo_dependency_info.dat 

-o /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/CompLogDemo.app/CompLogDemo

```

### 编译 xib 
### 拷贝 xib ，资源文件 

### 执行 CocoaPod 脚本 
### 拷贝标准库 

### 创建 .app 文件和签名
```shell
CodeSign /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/CompLogDemo.app (in target: CompLogDemo)

cd /Users/zhanglei/Desktop/temp/CompLogDemo
export CODESIGN_ALLOCATE=/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/codesign_allocate
    
Signing Identity:     "-"

/usr/bin/codesign --force --sign - --timestamp=none /Users/zhanglei/Library/Developer/Xcode/DerivedData/CompLogDemo-bnbxbviyzryyjyhhyhyjjdvybcjj/Build/Products/Debug-iphonesimulator/CompLogDemo.app
```

#### ps 实用命令
```shell
# 查看编译源文件
clang -ccc-print-phases main.m
0: input, "main.m", objective-c
1: preprocessor, {0}, objective-c-cpp-output
2: compiler, {1}, ir
3: backend, {2}, assembler
4: assembler, {3}, object
5: linker, {4}, image
6: bind-arch, "x86_64", {5}, image
```
```shell 
# 查看oc的c实现
clang -rewrite-objc main.m
```
```shell
# 想看清clang的全部过程，可以先通过-E查看clang在预处理处理这步做了什么:(这个过程的处理包括宏的替换，头文件的导入，以及类似#if的处理)
clang -E main.m
```
```shell
# 预处理完成后就会进行词法分析，这里会把代码切成一个个 Token，比如大小括号，等于号还有字符串等:
clang -fmodules -fsyntax-only -Xclang -dump-tokens main.m
```
```shell
# 然后是语法分析，验证语法是否正确，然后将所有节点组成抽象语法树 AST:
clang -fmodules -fsyntax-only -Xclang -ast-dump main.m
```
```shell
# 完成这些步骤后就可以开始IR中间代码的生成了，CodeGen 会负责将语法树自顶向下遍历逐步翻译成 LLVM IR，IR 是编译过程的前端的输出后端的输入:
clang -S -fobjc-arc -emit-llvm main.m -o main.ll
```
```shell
# 这里 LLVM 会去做些优化工作，在 Xcode 的编译设置里也可以设置优化级别-01，-03，-0s，还可以写些自己的 Pass:
clang -O3 -S -fobjc-arc -emit-llvm main.m -o main.ll
```
```shell
# 生成汇编
clang -S -fobjc-arc main.m -o main.s
```
```shell
# 生成目标文件
clang -fmodules -c main.m -o main.o
```
```shell
# 生成可执行文件
clang main.o -o main
```