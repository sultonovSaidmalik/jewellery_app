import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connectivity_event.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, bool> {
  final Connectivity connectivity;
  final InternetConnectionChecker checker;

  ConnectivityBloc()
      : connectivity = Connectivity(),
        checker = InternetConnectionChecker(),
        super(true) {
    on<ConnectivityEvent>(_check);
    connectivity.onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        if (await checker.hasConnection) {
          add(const ConnectivityEvent(connection: true));
        } else {
          add(const ConnectivityEvent(connection: false));
        }
      },
    );
  }

  void _check(ConnectivityEvent event, Emitter emit) {
    emit(event.connection);
  }
}
