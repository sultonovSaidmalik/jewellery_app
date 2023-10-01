import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/models/product_model.dart';
import '../../../repository/product_repository/product_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductRepository repository;

  HomeBloc({required this.repository})
      : super(const HomeState(status: HomeStatus.init, products: [])) {
    on<HomeEvent>((event, emit) => switch (event) {
          HomeGetAllDataEvent e => _getAllData(event, emit),
          HomeGetCategoryProductEvent e => _getCategoryProducts(event, emit),
          _ => () {},
        });
  }

  void _getAllData(HomeGetAllDataEvent event, Emitter emit) async {
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await repository.getAllProduct();
    emit(state.copyWith(status: HomeStatus.successData, products: products));
  }

  void _getCategoryProducts(
      HomeGetCategoryProductEvent event, Emitter emit) async {
    if (event.category == "All") return add(const HomeGetAllDataEvent());
    emit(state.copyWith(status: HomeStatus.loading));
    final products = await repository.getCategoryProduct(event.category);
    emit(state.copyWith(status: HomeStatus.successData, products: products));
  }
}
