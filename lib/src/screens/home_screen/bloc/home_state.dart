part of 'home_bloc.dart';

enum HomeStatus { init, loading, successData, errorData }

class HomeState extends Equatable {
  final List<Product> products;
  final HomeStatus status;

  const HomeState({required this.status, required this.products});

  HomeState copyWith({
    List<Product>? products,
    HomeStatus? status,
  }) {
    return HomeState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [products, status];
}
