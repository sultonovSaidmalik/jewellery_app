class User {
  String? userId;
  String? userName;
  String? userPhone;
  String? userEmail;
  String? password;
  DateTime? updatedAt;
  DateTime? createdAt;
  List<String>? orderHistories;
  List<String>? favouriteProduct;

  User({
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.userEmail,
    required this.password,
    required this.updatedAt,
    required this.createdAt,
    required this.orderHistories,
    required this.favouriteProduct,
  });

  factory User.fromJson(Map<String, Object?> json) => User(
      userId : json["userId"] as String,
      userName : json["userName"] as String,
      userPhone : json["userPhone"] as String,
      userEmail : json["userEmail"] as String,
      password : json["password"] as String,
      updatedAt : json["updatedAt"] as DateTime,
      createdAt : json["createdAt"] as DateTime,
      orderHistories : json["orderHistories"] as List<String>,
      favouriteProduct : json["favouriteProduct"] as List<String>,
  );

  Map<String, Object?> toJson() => {
    "userId" : userId,
    "userName" : userName,
    "userPhone" : userPhone,
    "userEmail" : userEmail,
    "password" : password,
    "updatedAt" : updatedAt,
    "createdAt" : createdAt,
    "orderHistories" : orderHistories,
    "favouriteProduct" : favouriteProduct,
  };

  @override
  String toString() {
    return 'User{userId: $userId, userName: $userName, userPhone: $userPhone, userEmail: $userEmail, password: $password, updatedAt: $updatedAt, createdAt: $createdAt, orderHistories: $orderHistories, favouriteProduct: $favouriteProduct}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          userName == other.userName &&
          userPhone == other.userPhone &&
          userEmail == other.userEmail &&
          password == other.password &&
          updatedAt == other.updatedAt &&
          createdAt == other.createdAt &&
          orderHistories == other.orderHistories &&
          favouriteProduct == other.favouriteProduct;

  @override
  int get hashCode =>
      userId.hashCode ^
      userName.hashCode ^
      userPhone.hashCode ^
      userEmail.hashCode ^
      password.hashCode ^
      updatedAt.hashCode ^
      createdAt.hashCode ^
      orderHistories.hashCode ^
      favouriteProduct.hashCode;
}
