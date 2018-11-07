# TS_BaseViewController
A lib for base vc。

##  基于我理解的ViewController，以及开发的这么多个项目写出了BaseVC
##  使用的技术面向对象的三大特征（继承、多态），有运行时添加属性、
### 1.继承自UIViewController的TSBaseViewController

### 2.继承自UINavigationController的TSNavigarionController

### 3.封装了tabbar设置title和image的函数

### 4.封装了UIBarButtonItem的函数

### 5.各种vc的分类以及navi 和tabbar的分类

        Orientation 朝向的分类 因为许多项目的图片和视频都支持横屏 而如果在General只设置Portrait的话 就不能自动旋转 所以在General里朝向需设置为除了UpSide Down都选中 通过代码控制朝向 详细请参考分类
        
        StatusBar 设置了状态栏样式
        
        Call 拨打电话 
        
        PhotoShow
