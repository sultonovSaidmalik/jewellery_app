import 'dart:convert';

import 'package:jewellery_app/src/common/service/local_dara_service.dart';

abstract interface class FavoriteRepository {
  Future<bool> addFavoriteProduct(String productId);
  List<String> getFavourites();
}

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<bool> addFavoriteProduct(String productId) async{
    List<String> datas = getFavourites();
    if(datas.contains(productId)) {
      datas.remove(productId);
      await LocalDataService.save(
          BoxKeys.favourites, datas);
      return false;
    }else {
      await LocalDataService.save(
          BoxKeys.favourites, [...datas, productId]);
      return true;
    }
  }

  @override
  List<String> getFavourites() {
    return List.from(LocalDataService.getData(BoxKeys.favourites, []));
  }
}