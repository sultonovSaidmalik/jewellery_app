import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jewellery_app/src/repository/product_repository/product_repository.dart';

import '../../../common/models/product_model.dart';
import '../../../repository/favorite_repositor/favorite_repositor.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final ProductRepository productRepository;
  final FavoriteRepository repository;

  FavoriteBloc()
      : productRepository = ProductRepositoryImpl(),
        repository = FavoriteRepositoryImpl(),
        super(const FavoriteState(
          products: [],
          status: FavoriteStatus.initial,
        )) {
    on<FavoriteEvent>((event, emit) => switch (event) {
          FavoriteGetDataEvent e => _getData(e, emit),
          FavoriteDeleteEvent e => _deleteFavorite(e, emit),
          _ => () {},
        });
  }

  void _getData(FavoriteGetDataEvent event, Emitter emit) async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    List<String> productsId = repository.getFavourites();
    List<Product> products = await productRepository.getAllProduct() ?? [];
    final result = products
        .where((element) => productsId.contains(element.productId))
        .toList();
    if (result.isEmpty) {
      emit(state.copyWith(products: [], status: FavoriteStatus.notFoundData));
      return;
    }
    emit(state.copyWith(products: result, status: FavoriteStatus.successData));
  }

  void _deleteFavorite(FavoriteDeleteEvent event, Emitter emit) async {
    emit(state.copyWith(status: FavoriteStatus.loading));
    await repository.addFavoriteProduct(event.productId);
    emit(state.copyWith(status: FavoriteStatus.successDelete));
  }
}
