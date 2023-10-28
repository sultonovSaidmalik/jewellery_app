part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
}

class FavoriteGetDataEvent extends FavoriteEvent {
  const FavoriteGetDataEvent();

  @override
  List<Object?> get props => [];
}

class FavoriteDeleteEvent extends FavoriteEvent {
  final String productId;

  const FavoriteDeleteEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}

class FavoriteAddEvent extends FavoriteEvent {
  final String productId;

  const FavoriteAddEvent({required this.productId});

  @override
  List<Object?> get props => [productId];
}
