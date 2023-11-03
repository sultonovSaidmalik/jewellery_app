part of '../card_screen.dart';

mixin CartMixin on State<CartScreen> {
  void orderPress() {
    if (LocalDataService.isUser) {
      context.read<CartBloc>().add(const CartOrderEvent());
    } else {
      context.pushNamed(Routes.identification);
    }
  }
}
