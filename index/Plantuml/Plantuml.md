# PlantUML类图 语法

### 类关系
* Class01 <|-- Class02:泛化
* Class03 <-- Class04:关联
* Class05 *-- Class06:组合
* Class07 o-- Class08:聚合
* Class09 -- Class10

### 变量方法的定义
*  \- ： private
*  \# ： protected
*  \~ ： package private
*  \+ ： public

-- 实线
.. 虚线
 >  "-","." 的数量 可以表示长度

```
```plantuml

@startuml

note "This is a floating note" as N1
Class02 .. N1



interface Class03 {
    - String mString
}

note left : 123

Class07 : equals()

Class01 "1" *-- "many" Class02 : contains

Class03 <-- Class04:关联 <
Class05 *-- Class06:组合
Class07 o-- Class08:聚合



Class09 -- Class10

class User {
  .. Simple Getter ..
  + getName()
  + getAddress()
  .. Some setter ..
  + setName()
  __ private data __
  int age
  -- encrypted --
  String password
}

@enduml

```

![](plantuml.png)