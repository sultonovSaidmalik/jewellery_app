import 'dart:convert';

import 'package:uuid/uuid.dart';

import '../../common/models/cart_model.dart';
import '../../common/service/local_dara_service.dart';

abstract interface class CartRepository {
  Future<void> saveCard(CartModel card);

  CartModel getCard();
}

class CartRepositoryImpl implements CartRepository {
  @override
  Future<void> saveCard(CartModel card) async {
    await LocalDataService.save<String>(BoxKeys.card, jsonEncode(card.toJson()));
  }

  @override
  CartModel getCard() {
    String? result = LocalDataService.getData<String>(
      BoxKeys.card,
      null,
    );
    if (result == null) return CartModel(id: const Uuid().v4(), items: []);
    return CartModel.fromJson(jsonDecode(result));
  }
}
