import 'dart:convert';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../../common/models/product_model.dart';

abstract interface class ProductRepository {
  const ProductRepository();

  Future<List<Product>?> getAllProduct();

  Future<bool> storeProduct(Product product);

  Future<String> storePicture(File file);

  Future<Map<String, List<Product>>> getWithCategory();

  Future<List<Product>> getCategoryProduct(String category);

}

class ProductRepositoryImpl extends ProductRepository {
  late final FirebaseDatabase _db;
  late final FirebaseStorage _st;

  late final _storage = _db.ref("app");

  ProductRepositoryImpl()
      : _db = FirebaseDatabase.instance,
        _st = FirebaseStorage.instance;

  @override
  Future<List<Product>?> getAllProduct() async {
    try {
      final data = await _storage.child(Folder.products.name).get();
      return data.children
          .map((e) => Product.fromJson(jsonDecode(jsonEncode(e.value))))
          .toList();
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
  }

  @override
  Future<List<Product>> getCategoryProduct(String category) async {
    final data = await _storage.child(Folder.products.name).equalTo(category, key: "productType").get();
    return data.children
        .map((e) => Product.fromJson(jsonDecode(jsonEncode(e.value))))
        .toList();
  }

  @override
  Future<Map<String, List<Product>>> getWithCategory() async {
    try {
      final data = await _storage.child(Folder.products.name).get();
      final products = data.children
          .map((e) => Product.fromJson(jsonDecode(jsonEncode(e.value))))
          .toList();
      Map<String, List<Product>> productWithCategory = {};
      productWithCategory["all"] = products;
      for (var item in products) {
        if (productWithCategory.containsKey(item.productType)) {
          productWithCategory[item.productType ?? ""] = [
            ...productWithCategory[item.productType]!,
            item
          ];
        } else {
          productWithCategory[item.productType ?? ""] = [item];
        }
      }
      return productWithCategory;
    } catch (e, s) {
      print(e);
      print(s);
      return {};
    }
  }

  @override
  Future<bool> storeProduct(Product product) async {
    try {
      final folder =
          _storage.child(Folder.products.name).child(product.productId!);
      await folder.set(product.toJson());
      return true;
    } catch (e, s) {
      print(e);
      print(s);
      return false;
    }
  }

  @override
  Future<String> storePicture(File file) async {
    final image = _st.ref(Folder.images.name).child(
        "image_${DateTime.now().toIso8601String()}${file.path.substring(file.path.lastIndexOf("."))}");
    final task = image.putFile(file);
    await task.whenComplete(() {});
    return image.getDownloadURL();
  }
}

enum Folder {
  products,
  images,
}
