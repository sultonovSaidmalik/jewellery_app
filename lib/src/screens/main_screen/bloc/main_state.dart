part of 'main_bloc.dart';

class MainState extends Equatable {
  final int index;

  const MainState({required this.index});

  @override
  List<Object> get props => [index];

  MainState copyWith({
    int? index,
  }) {
    return MainState(
      index: index ?? this.index,
    );
  }
}
