# 可滚动 Widget 

```
Scrollable({
    ...
    this.axisDirection = AxisDirection.down,
    this.controller,
    this.physics,
    @required this.viewportBuilder,
    
})
```

* axisDirection：滚动方向。
* physics：此属性接受一个ScrollPhysics对象，它决定可滚动Widget如何响应用户操作，比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。默认情况下，Flutter会根据具体平台分别使用不同的ScrollPhysics对象，应用不同的显示效果，如当滑动到边界时，继续拖动的话，在iOS上会出现弹性效果，而在Android上会出现微光效果。如果你想在所有平台下使用同一种效果，可以显式指定，Flutter SDK中包含了两个ScrollPhysics的子类可以直接使用：
    
    * ClampingScrollPhysics：Android下微光效果。
    * BouncingScrollPhysics：iOS下弹性效果。
* controller：此属性接受一个ScrollController对象。ScrollController的主要作用是控制滚动位置和监听滚动事件。默认情况下，widget树中会有一个默认的PrimaryScrollController，如果子树中的可滚动widget没有显式的指定controller并且primary属性值为true时（默认就为true），可滚动widget会使用这个默认的PrimaryScrollController，这种机制带来的好处是父widget可以控制子树中可滚动widget的滚动，例如，Scaffold使用这种机制在iOS中实现了"回到顶部"的手势。我们将在本章后面“滚动控制”一节详细介绍ScrollController。


## ScrollBar

指示器（滚动条）， Material 风格，如在 iOS 系统下，则为 CupertinoScrollbar 风格；
实现方式为，讲 ScrollBar 包裹在可滚动 widget 外层（作为父节点）即可

```
Scrollbar(
  child: SingleChildScrollView(),
)
```

## ViewPort 视口

布局系统中的术语，无特别说明，则指示为 Widget 的实际显示区域。
例如一个 ListView 的显示区域高度为 800px， 虽然其列表总高度可能远远高于 800px，但是其 ViewPort 仍然是 800px。

## 主轴和纵轴

在可滚动 Widget 的坐标描述中， 通常将滚动方向称为主轴，非滚动方向称为纵轴，由于可滚动 Widget 的默认方向一般都是沿垂直方向，所以默认情况下主轴就是指垂直方向，水平方向同理。