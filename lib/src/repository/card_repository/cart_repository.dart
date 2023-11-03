import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:jewellery_app/src/common/models/order_model.dart';
import 'package:jewellery_app/src/repository/folder/folder.dart';
import 'package:uuid/uuid.dart';

import '../../common/models/cart_model.dart';
import '../../common/service/local_dara_service.dart';

abstract interface class CartRepository {
  Future<void> saveCard(CartModel card);

  CartModel getCard();
  Future<bool> storeOrder(Order order);
}

class CartRepositoryImpl implements CartRepository {
  late final FirebaseDatabase _db;

  CartRepositoryImpl() : _db = FirebaseDatabase.instance;

  @override
  Future<void> saveCard(CartModel card) async {
    await LocalDataService.save<String>(
        BoxKeys.card, jsonEncode(card.toJson()));
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

  Future<bool> storeOrder(Order order) async {
    try {
      await _db
          .ref(Folder.orders.name)
          .child(order.orderId ?? "")
          .set(order.toJson());
      return true;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(e.toString());
      return false;
    }
  }
}
