import 'package:flutter/cupertino.dart';

class CartScope extends InheritedWidget {
  final void Function() onPressOrder;

  const CartScope({
    super.key,
    required super.child,
    required this.onPressOrder,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return oldWidget != this;
  }

  static CartScope? of(BuildContext context) {
    return context.getInheritedWidgetOfExactType<CartScope>();
  }
}
