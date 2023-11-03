part of 'connectivity_bloc.dart';

class ConnectivityEvent extends Equatable {
  final bool connection;
  const ConnectivityEvent({required this.connection});

  @override
  List<Object?> get props => [connection];
}
