part of 'favorite_bloc.dart';

enum FavoriteStatus {
  initial,
  successData,
  errorData,
  loading,
  notFoundData,
  successDelete,
}

class FavoriteState extends Equatable {
  final FavoriteStatus status;
  final List<Product> products;

  const FavoriteState({required this.products, required this.status});

  FavoriteState copyWith({
    FavoriteStatus? status,
    List<Product>? products,
  }) {
    return FavoriteState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  List<Object?> get props => [products, status];
}
