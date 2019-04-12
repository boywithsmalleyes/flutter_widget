## 容器类 Widget

容器类Widget和布局类Widget都作用于其子Widget，不同的是：

布局类Widget一般都需要接收一个widget数组（children），他们直接或间接继承自（或包含）MultiChildRenderObjectWidget ；而容器类Widget一般只需要接受一个子Widget（child），他们直接或间接继承自（或包含）SingleChildRenderObjectWidget。
布局类Widget是按照一定的排列方式来对其子Widget进行排列；而容器类Widget一般只是包装其子Widget，对其添加一些修饰（补白或背景色等）、变换(旋转或剪裁等)、或限制(大小等)。


1. Padding 
2. ConstrainedBox
3. DecoratedBox
4. Transform
5. Container
6. Scaffold, TitleBar, Navigator