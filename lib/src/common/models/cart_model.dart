import 'cart_item_model.dart';

class Cart {
  String? id;
  List<CartItem>? items;

  Cart({
    required this.id,
    required this.items,
  });

  factory Cart.fromJson(Map<String, Object?> json) => Cart(
    id: json["id"] as String,
    items: json["items"] as List<CartItem>,
  );

  Map<String, Object?> toJson() => {
    "id" : id,
    "items" : items,
  };

  @override
  String toString() {
    return 'Cart{id: $id, items: $items}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Cart &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          items == other.items;

  @override
  int get hashCode => id.hashCode ^ items.hashCode;
}
