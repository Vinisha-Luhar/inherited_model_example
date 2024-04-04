import 'package:flutter/material.dart';

enum CounterType
{
  enumCounter1,
  enumCounter2
}

class MyInheritedModel extends InheritedModel<String>
{
  int counter1;
  int counter2;
  MyInheritedModel({super.key, required this.counter1,required this.counter2,required super.child});

  @override
  bool updateShouldNotify(MyInheritedModel oldWidget) {
    return (oldWidget.counter1 != counter1) || (oldWidget.counter2 != counter2);
  }

  @override
  bool updateShouldNotifyDependent(MyInheritedModel oldWidget, Set<String> dependencies) {
    return (dependencies.contains('counter2') && (oldWidget.counter2 != counter2))
    || (dependencies.contains('counter1') && (oldWidget.counter1 != counter1));
  }

  static MyInheritedModel of(BuildContext context,{required String aspect})
  {
    //return context.dependOnInheritedWidgetOfExactType<MyInheritedModel>()!;
    return InheritedModel.inheritFrom<MyInheritedModel>(context,aspect: aspect)!;
  }

}