import 'package:get_it/get_it.dart';
import 'package:jewellery_app/src/repository/product_repository/product_repository.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
}