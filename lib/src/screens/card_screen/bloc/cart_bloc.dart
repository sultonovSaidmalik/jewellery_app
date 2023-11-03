import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/common/models/order_model.dart';
import 'package:jewellery_app/src/common/service/local_dara_service.dart';
import 'package:jewellery_app/src/repository/telegram_repository/telegram_repository.dart';
import 'package:uuid/uuid.dart';

import '../../../common/models/cart_item_model.dart';
import '../../../common/models/cart_model.dart';
import '../../../repository/card_repository/cart_repository.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartRepository repository;
  TelegramRepository telegramRepository;
  CartModel cart;

  CartBloc(this.cart)
      : repository = CartRepositoryImpl(),
        telegramRepository = TelegramRepositoryImpl(),
        super(CartState(cart: cart, status: CartStatus.initial)) {
    on<CartEvent>((event, emit) => switch (event) {
          CartAddProductEvent e => _addProduct(e, emit),
          CartIncrementProductEvent e => _productIncrement(e, emit),
          CartDecrementProductEvent e => _productDecrement(e, emit),
          CartDeleteProductEvent e => _productDelete(e, emit),
          CartClearEvent e => _clearCart(e, emit),
          CartOrderEvent e => _order(e, emit),
          _ => () {},
        });
  }

  // Bloc Methods

  void _order(CartOrderEvent event, Emitter emit) async {
    final user = LocalDataService.getUser();
    final result = await repository.storeOrder(
      Order(
        orderId: const Uuid().v4(),
        userName: user.$1,
        userPhone: user.$2,
        cart: cart,
        totalPrice: cart.items
            .map((e) => e.totalPrice)
            .fold<num>(0, (total, element) => total += element),
      ),
    );
    print(result);
    if (result) {
      await telegramRepository.sendMessage(message: "Buyurtma Berildi!");
      cart = CartModel(id: const Uuid().v4(), items: []);
      await repository.saveCard(cart);

      emit(state.copyWith(cart: cart, status: CartStatus.ordered));
    } else {
      emit(state.copyWith(status: CartStatus.ordered));
    }
  }

  void _addProduct(CartAddProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    bool have = false;
    for (var item in cart.items) {
      if (item.id == event.cartItem.id) {
        have = true;
      }
    }
    if (have) {
      _productInc(event.cartItem.id);
    } else {
      cart.items = [...cart.items, event.cartItem];
    }
    await repository.saveCard(cart);
    emit(state.copyWith(status: CartStatus.addCartItemSuccess, cart: cart));
  }

  void _productIncrement(CartIncrementProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = _productInc(event.productId);
    if (result == null) {
      emit(state.copyWith(status: CartStatus.increment, cart: cart));
    } else {}
    await repository.saveCard(cart);
  }

  void _productDecrement(CartDecrementProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = _productDec(event.productId);
    if (result == null) {
      emit(state.copyWith(status: CartStatus.decrement, cart: cart));
    } else if (result == "-") {
      _deleteProduct(event.productId);
    } else {}
    await repository.saveCard(cart);
  }

  void _productDelete(CartDeleteProductEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    final result = _deleteProduct(event.productId);
    if (result == null) {
      emit(state.copyWith(status: CartStatus.deletedSuccess, cart: cart));
    } else {}
    await repository.saveCard(cart);
  }

  void _clearCart(CartClearEvent event, Emitter emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    if (cart.items.isEmpty) {
      emit(state.copyWith(status: CartStatus.clearCartEmpty));
      return;
    }
    cart.items = [];
    emit(state.copyWith(status: CartStatus.clearCart, cart: cart));
    await repository.saveCard(cart);
  }

  // Auxiliary Methods
  String? _productInc(String productId) {
    String? result = "Not Found Cart Item";
    for (int i = 0; i < cart.items.length; i++) {
      if (cart.items[i].id == productId) {
        cart.items[i].productCount = (cart.items[i].productCount + 1);
        cart.items[i].totalPrice = (cart.items[i].totalPrice +
            (cart.items[i].product.productPrice ?? 0));
        return null;
      }
    }
    return result;
  }

  String? _productDec(String productId) {
    String? result = "Not Found Cart Item";
    for (int i = 0; i < cart.items.length; i++) {
      if (cart.items[i].id == productId) {
        if (cart.items[i].productCount > 1) {
          cart.items[i].productCount = (cart.items[i].productCount - 1);
          cart.items[i].totalPrice = (cart.items[i].totalPrice -
              (cart.items[i].product.productPrice ?? 0));
          result = null;
        } else {
          return "-";
        }
      }
    }
    return result;
  }

  String? _deleteProduct(String productId) {
    String? result = "Not Found Cart Item";

    for (int i = 0; i < cart.items.length; i++) {
      if (cart.items[i].id == productId) {
        cart.items.removeAt(i);
        result = null;
      }
    }
    return result;
  }
}
