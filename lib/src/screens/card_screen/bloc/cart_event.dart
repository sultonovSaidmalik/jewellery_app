part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartInitialEvent extends CartEvent {
  @override
  List<Object?> get props => [];
}

class CartAddProductEvent extends CartEvent {
  final CartItem cartItem;

  const CartAddProductEvent({required this.cartItem});

  @override
  List<Object?> get props => [cartItem];
}

class CartIncrementProductEvent extends CartEvent {
  final String productId;

  const CartIncrementProductEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CartDecrementProductEvent extends CartEvent {
  final String productId;

  const CartDecrementProductEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CartDeleteProductEvent extends CartEvent {
  final String productId;

  const CartDeleteProductEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class CartClearEvent extends CartEvent {
  const CartClearEvent();

  @override
  List<Object?> get props => [];
}
