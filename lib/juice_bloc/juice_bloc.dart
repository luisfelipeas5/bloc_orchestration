import 'dart:async';

import 'package:bloc_orchestration/menu_item.dart';
import 'package:bloc_orchestration/base_bloc/base_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'juice_event.dart';
part 'juice_state.dart';

class JuiceBloc extends BaseBloc<JuiceEvent, JuiceState> {
  JuiceBloc()
      : super(JuiceState(
          items: [],
        )) {
    on<JuiceLoadEvent>(_onLoad);
  }

  FutureOr<void> _onLoad(
    JuiceLoadEvent event,
    Emitter<JuiceState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(
      state.copyWith(items: [
        ...state.items,
        // MenuItem(name: "Suco de laranja", price: 5),
        // MenuItem(name: "Suco de morango", price: 5),
        // MenuItem(name: "Suco de laranja e morango", price: 7),
      ]),
    );
    event.consumptionCompleter.complete();
  }
}
