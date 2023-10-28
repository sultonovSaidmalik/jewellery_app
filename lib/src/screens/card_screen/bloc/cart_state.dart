part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  addCartItemSuccess,
  addCartItemError,
  increment,
  decrement,
  deletedSuccess,
  clearCart,
  clearCartEmpty,
}

class CartState extends Equatable {
  final CartModel cart;
  final CartStatus status;

  const CartState({required this.cart, required this.status});

  @override
  List<Object?> get props => [cart, status];


  CartItem? isProduct(String productId) {
    CartItem? cartItem;
    for(var item in cart.items) {
      if(item.id == productId) {
        cartItem = item;
        return cartItem;
      }
    }
    return cartItem;
  }

  CartState copyWith({
    CartModel? cart,
    CartStatus? status,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      status: status ?? this.status,
    );
  }
}
