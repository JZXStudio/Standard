# Standard

## **Swift开发的基础工程**

此工程提供：

+ ATools：基础工具包
+ CommonFramework：基于MVVM开发所需的基础类库

```此基础工程基于自研的Aquarius框架实现，工程包中已经提供了相应的framework```

**ATools：**提供AppDelegate的基础封装。引入**DebugSwift**、**LifetimeTracker**，支持对调试的支持。

**CommonFramework：**基于**Aquarius**框架，提供对**MVVM**设计模式的支持。同时，支持创建标准的**颜色库**、**样式库**，并可在**View**、**cell**中使用。

**ATools**类库包含：

+ **AAppDelegate：**APPDelegate的基础封装

**CommonFramework**类库包含：

+ **BaseVC：**UIViewController基础类
+ **BaseView：**UIView基础类
+ **BaseVM：**viewModel基础类
+ **BaseCell：**UITableViewCell基础类
+ **BaseCollectionViewCell：**UICollectionViewCell基础类
+ **BaseDesign：**设计基础类，类中实现了ColorDesign和StyleDesign
+ **ColorDesign：**标准颜色库
+ **StyleDesign：**标准样式库
+ **BaseCommon：**基础功能包。基础功能全部写在此类中
+ **ThirdpartyUtils：**三方工具配置包。例如：友盟等第三方库的AppKey等
+ **Utils：**公共工具包。一些小工具可以写在这里
+ **CommonParameters：**全局基础参数

