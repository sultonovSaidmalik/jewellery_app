import 'package:jewellery_app/src/common/models/product_model.dart';

import 'cart_model.dart';

class Order {
  String? orderId;
  String? userName;
  String? userPhone;
  CartModel? cart;
  num? totalPrice;

  Order({
    required this.orderId,
    required this.userName,
    required this.userPhone,
    required this.cart,
    required this.totalPrice,
  });

  factory Order.fromJson(Map<String, Object?> json) => Order(
        orderId: json["orderId"] as String,
        userName: json["userName"] as String,
        userPhone: json["userPhone"] as String,
        cart: CartModel.fromJson(json["cart"] as Map<String, Object?>),
        totalPrice: json["totalPrice"] as num,
      );

  Map<String, Object?> toJson() => {
        "orderId": orderId,
        "userName": userName,
        "userPhone": userPhone,
        "cart": cart!.toJson(),
        "totalPrice": totalPrice,
      };

  @override
  String toString() {
    return 'Order{orderId: $orderId, userName: $userName, userPhone: $userPhone, cart: $cart, totalPrice: $totalPrice}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          runtimeType == other.runtimeType &&
          orderId == other.orderId &&
          userName == other.userName &&
          userPhone == other.userPhone &&
          cart == other.cart &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode =>
      orderId.hashCode ^
      userName.hashCode ^
      userPhone.hashCode ^
      cart.hashCode ^
      totalPrice.hashCode;

  String toOrderString() {
    String products = "";
    for (final item in cart!.items) {
      products += """
      ${productToString(item.product)}
      Soni  : ${item.productCount},
      Summasi  : ${item.totalPrice},
      """;
    }
    return """
Buyurma Berildi !

Buyurmachining Ismi : $userName,
Buyurmachining Telefon Raqami : $userPhone,

Maxsulotlar : 
  $products


Jami Summa : $totalPrice,
    """;
  }

  String productToString(Product product) {
    return """
        Nomi : ${product.productName},
        Malumoti : ${product.productDescription},
        Turi : ${product.productType},
        Jins : ${product.genderType},
        Rasmlari : ${product.images},
        Narxi : ${product.productPrice},
    """;
  }
}
