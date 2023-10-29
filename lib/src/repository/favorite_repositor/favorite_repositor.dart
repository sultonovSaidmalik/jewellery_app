import 'dart:convert';

import 'package:jewellery_app/src/common/service/local_dara_service.dart';

import '../../common/models/product_model.dart';

abstract interface class FavoriteRepository {
  Future<bool> addFavoriteProduct(String productId);
  Future<void> updateFavorite(List<Product> products);
  List<String> getFavourites();
}

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<bool> addFavoriteProduct(String productId) async {
    List<String> datas = getFavourites();
    if (datas.contains(productId)) {
      datas.remove(productId);
      await LocalDataService.save(
        BoxKeys.favourites,
        datas,
      );
      return false;
    } else {
      await LocalDataService.save(BoxKeys.favourites, [...datas, productId]);
      return true;
    }
  }

  Future<void> updateFavorite(List<Product> products) async {
    await LocalDataService.save(
        BoxKeys.favourites, products.map((e) => e.productId).toList());
  }

  @override
  List<String> getFavourites() {
    return List.from(LocalDataService.getData(BoxKeys.favourites, []));
  }
}
