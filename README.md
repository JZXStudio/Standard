# Standard

## **Swift开发的基础工程**

此工程提供：

+ ATools：基础工具包
+ CommonFramework：基于MVVM开发所需的基础类库

```此基础工程基于自研的Aquarius框架实现，工程包中已经提供了相应的framework```

__ATools：__提供AppDelegate的基础封装。引入__DebugSwift__、__LifetimeTracker__，支持对调试的支持。

__CommonFramework：__基于__Aquarius__框架，提供对__MVVM__设计模式的支持。同时，支持创建标准的__颜色库__、__样式库__，并可在__View__、__cell__中使用。

__ATools__类库包含：

+ __AAppDelegate：__APPDelegate的基础封装

__CommonFramework__类库包含：

+ __BaseVC：__UIViewController基础类
+ __BaseView：__UIView基础类
+ __BaseVM：__viewModel基础类
+ __BaseCell：__UITableViewCell基础类
+ __BaseCollectionViewCell：__UICollectionViewCell基础类
+ __BaseDesign：__设计基础类，类中实现了ColorDesign和StyleDesign
+ __ColorDesign：__标准颜色库
+ __StyleDesign：__标准样式库
+ __BaseCommon：__基础功能包。基础功能全部写在此类中
+ __ThirdpartyUtils：__三方工具配置包。例如：友盟等第三方库的AppKey等
+ __Utils：__公共工具包。一些小工具可以写在这里
+ __CommonParameters：__全局基础参数

