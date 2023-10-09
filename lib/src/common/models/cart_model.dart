import 'cart_item_model.dart';

class CartModel {
  String id;
  List<CartItem> items;

  CartModel({
    required this.id,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"] as String,
        items:
            (json["items"] as List).map((e) => CartItem.fromJson(e)).toList(),
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "items": items.map((e) => e.toJson()).toList(),
      };

  @override
  String toString() {
    return 'CartModel{id: $id, items: $items}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          items == other.items;

  @override
  int get hashCode => id.hashCode ^ items.hashCode;
}
