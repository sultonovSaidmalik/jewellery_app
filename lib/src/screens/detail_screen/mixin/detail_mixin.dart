part of '../detail_screen.dart';

mixin DetailMixin on State<DetailScreen> {
  final PageController screenController = PageController(initialPage: 0);
  int index = 0;

  void addProductCart() {
    context.read<CartBloc>().add(CartAddProductEvent(
        cartItem: CartItem(
            id: widget.product.productId ?? "",
            product: widget.product,
            productCount: 1,
            totalPrice: widget.product.productPrice ?? 0)));
  }
}
