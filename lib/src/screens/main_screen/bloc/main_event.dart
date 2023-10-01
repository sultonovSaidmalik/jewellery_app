part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();
}

class MainChangeEvent extends MainEvent {
  final int index;
  const MainChangeEvent({required this.index});

  @override
  List<Object?> get props => [index];
}