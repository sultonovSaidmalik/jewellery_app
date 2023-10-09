import 'cart_model.dart';

class Order {
  String? orderId;
  String? userId;
  String? userName;
  String? userPhone;
  CartModel? cart;
  num? totalPrice;

  Order({
    required this.orderId,
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.cart,
    required this.totalPrice,
  });

  factory Order.fromJson(Map<String, Object?> json) => Order(
      orderId : json["orderId"] as String,
      userId : json["userId"] as String,
      userName : json["userName"] as String,
      userPhone : json["userPhone"] as String,
      cart : CartModel.fromJson(json["cart"] as Map<String, Object?>),
      totalPrice : json["totalPrice"] as num,
  );

  Map<String, Object?> toJson() => {
    "orderId" : orderId,
    "userId" : userId,
    "userName" : userName,
    "userPhone" : userPhone,
    "cart" : cart!.toJson(),
    "totalPrice" : totalPrice,
  };

  @override
  String toString() {
    return 'Order{orderId: $orderId, userId: $userId, userName: $userName, userPhone: $userPhone, cart: $cart, totalPrice: $totalPrice}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Order &&
          runtimeType == other.runtimeType &&
          orderId == other.orderId &&
          userId == other.userId &&
          userName == other.userName &&
          userPhone == other.userPhone &&
          cart == other.cart &&
          totalPrice == other.totalPrice;

  @override
  int get hashCode =>
      orderId.hashCode ^
      userId.hashCode ^
      userName.hashCode ^
      userPhone.hashCode ^
      cart.hashCode ^
      totalPrice.hashCode;
}
