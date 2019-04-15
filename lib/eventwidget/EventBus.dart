// Created by Tony.wang on 19-4-15.

typedef void EventCallback(arg);

class EventBus {
  // 私有构造
  EventBus._internal();

  // 保存单例
  static EventBus _singleton = EventBus._internal();

  // 工厂构造
  factory EventBus() => _singleton;

  // 保存事件订阅者队列， key：事件名（id)， value: 对应事件的订阅者队列
  var _eMap = Map<Object, List<EventCallback>>();

  // 添加订阅者
  void on(eventName, eventCallback) {
    if (eventName == null || eventCallback == null) return;
    _eMap[eventName] ??= List<EventCallback>();
    _eMap[eventName].add(eventCallback);
  }

  // 移除订阅者
  void off(eventName, [eventCallback]) {
    var list = _eMap[eventName];
    if (eventName == null || list == null) return;
    if (eventCallback == null) {
      _eMap[eventName] = null;
    } else {
      list.remove(eventCallback);
    }
  }

  // 触发事件，事件触发后该事件所有订阅者都会被调用
  void emit(eventName, [arg]) {
    var list = _eMap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }

  // 定义一个 top-level 变量，页面引入该文件后可以直接使用 bus
  var bus = EventBus();
}
