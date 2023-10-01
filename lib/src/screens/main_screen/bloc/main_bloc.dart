import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState(index: 1)) {
    on<MainEvent>((event, emit) => switch (event) {
          MainChangeEvent e => _changePage(event, emit),
          _ => () {},
        });
  }

  void _changePage(MainChangeEvent event, Emitter emit) {
    emit(state.copyWith(index: event.index));
  }
}
