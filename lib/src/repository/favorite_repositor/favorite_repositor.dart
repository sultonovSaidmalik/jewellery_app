import 'dart:convert';

import 'package:jewellery_app/src/common/service/local_dara_service.dart';

abstract interface class FavoriteRepository {
  Future<void> addFavoriteProduct(String productId);
  List<String> getFavourites();
}

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<void> addFavoriteProduct(String productId) async{
    List<String> datas = getFavourites();
    if(datas.contains(productId)) {
      datas.remove(productId);
      await LocalDataService.save(
          BoxKeys.favourites, datas);
    }else {
      await LocalDataService.save(
          BoxKeys.favourites, [...datas, productId]);
    }
  }

  @override
  List<String> getFavourites() {
    return List.from(LocalDataService.getData(BoxKeys.favourites, []));
  }
}