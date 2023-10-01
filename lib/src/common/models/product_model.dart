class Product {
  String? productId;
  String? productName;
  String? productDescription;
  num? productPrice;
  String? productType;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? likedProduct;
  List<String> images;
  String genderType;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productType,
    required this.createdAt,
    required this.updatedAt,
    required this.likedProduct,
    required this.images,
    required this.genderType,
  });

  factory Product.fromJson(Map<String, Object?> json) => Product(
    productId: json["productId"] as String,
    productName: json["productName"] as String,
    productDescription: json["productDescription"] as String,
    productPrice: json["productPrice"] as num,
    productType: json["productType"] as String,
    createdAt: DateTime.tryParse(json["createdAt"] as String),
    updatedAt: DateTime.tryParse(json["updatedAt"] as String),
    likedProduct: json["likedProduct"] as bool,
    images: List.from(json["images"] as List),
    genderType: json["genderType"] as String,
  );

  Map<String, Object?> toJson() => {
    "productId": productId,
    "productName": productName,
    "productDescription": productDescription,
    "productPrice": productPrice,
    "productType": productType,
    "createdAt": createdAt?.toIso8601String() ?? "",
    "updatedAt": updatedAt?.toIso8601String() ?? "",
    "likedProduct": likedProduct,
    "images": images,
    "genderType": genderType,
  };

  @override
  String toString() {
    return 'Product{productId: $productId, productName: $productName, productDescription: $productDescription, productPrice: $productPrice, productType: $productType, createdAt: $createdAt, updatedAt: $updatedAt, likedProduct: $likedProduct}';
  }


}
