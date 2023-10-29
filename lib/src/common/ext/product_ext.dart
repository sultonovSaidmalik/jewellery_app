import '../models/product_model.dart';

extension ProductExt on List<Product> {
  bool isIdEqual(String id){
    for(var item in this) {
      if(item.productId == id) return true;
    }
    return false;
  }
}