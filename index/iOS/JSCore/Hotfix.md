
# Hotfix 基本原理
OC 上所有方法的调用/类的生成都通过 Objective-C Runtime 在运行时进行。
我们可以通过类名/方法名
反射得到相应的类和方法，
替换某个类的方法为新的实现，
新注册一个类，为类添加方法。


1. 引入类
在中间代码中加入类名，保存为全局变量
```
比如 require('ZLDemoClass')
相当于在 js的全局变量中加入了 ZLDemoClass (只是{__clsName: clsName}的js对象，这时并没有和oc 产生关联)

//之前
在js的的原型链中加入了__c 方法

最终是由该方法和OC产生的调用
_methodFunc(slf.__obj, slf.__clsName, methodName, args, slf.__isSuper)
_OC_callI(instance, selectorName, args, isSuper)
_OC_callC(clsName, selectorName, args)
```

2. 调用接口
为js对象保存oc对象中的所有方法代价太大，
可以通过函数调用，将方法名做参数传入，动态调用的方式

最后将类名， 方法名，入参等必须的，传给oc执行。

3. 消息传递
JSContext 实现
OC 里的 NSArray, NSDictionary, NSString, NSNumber, NSBlock 
会分别转为JS端的数组/对象/字符串/数字/函数类型

4. 对象持有和转换


5. 参数转换

