part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeGetAllDataEvent extends HomeEvent {
  const HomeGetAllDataEvent();

  @override
  List<Object?> get props => [];
}

class HomeGetCategoryProductEvent extends HomeEvent {
  final String category;

  const HomeGetCategoryProductEvent({
    required this.category,
  });

  @override
  List<Object?> get props => [category];
}
