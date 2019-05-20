1. 添加索引库
```
~/.cocoapods/repos
pod repo add mpodspec https://github.com/stonelay/mpodspec.git
```

2. 创建模版库
```
pod lib create mPodTool
```
修改 summary 和des, 并打tag
验证
pod lib lint  --private

3. 建立关联
```
pod repo push mpodspec mPodTool.podspec
```

4. 引入我们的库
pod 'mPodTool'
