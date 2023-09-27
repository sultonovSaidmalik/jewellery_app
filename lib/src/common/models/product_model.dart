class Product {
  String? productId;
  String? productName;
  String? productDescription;
  num? productPrice;
  String? productType;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? likedProduct;

  Product({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productType,
    required this.createdAt,
    required this.updatedAt,
    required this.likedProduct,
  });

  factory Product.fromJson(Map<String, Object?> json) => Product(
      productId : json["productId"] as String,
      productName : json["productName"] as String,
      productDescription : json["productDescription"] as String,
      productPrice : json["productPrice"] as num,
      productType : json["productType"] as String,
      createdAt : json["createdAt"] as DateTime,
      updatedAt : json["updatedAt"] as DateTime,
      likedProduct : json["likedProduct"] as bool,
  );

  Map<String, Object?> toJson() => {
    "productId" : productId,
    "productName" : productName,
    "productDescription" : productDescription,
    "productPrice" : productPrice,
    "productType" : productType,
    "createdAt" : createdAt,
    "updatedAt" : updatedAt,
    "likedProduct" : likedProduct,
  };


  @override
  String toString() {
    return 'Product{productId: $productId, productName: $productName, productDescription: $productDescription, productPrice: $productPrice, productType: $productType, createdAt: $createdAt, updatedAt: $updatedAt, likedProduct: $likedProduct}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          productId == other.productId &&
          productName == other.productName &&
          productDescription == other.productDescription &&
          productPrice == other.productPrice &&
          productType == other.productType &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt &&
          likedProduct == other.likedProduct;

  @override
  int get hashCode =>
      productId.hashCode ^
      productName.hashCode ^
      productDescription.hashCode ^
      productPrice.hashCode ^
      productType.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      likedProduct.hashCode;
}
