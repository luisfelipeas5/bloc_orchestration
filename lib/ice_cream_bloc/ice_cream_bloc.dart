import 'dart:async';

import 'package:bloc_orchestration/menu_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ice_cream_event.dart';
part 'ice_cream_state.dart';

class IceCreamBloc extends Bloc<IceCreamEvent, IceCreamState> {
  IceCreamBloc()
      : super(IceCreamState(
          items: [],
        )) {
    on<IceCreamLoadEvent>(_onLoad);
  }

  FutureOr<void> _onLoad(
    IceCreamLoadEvent event,
    Emitter<IceCreamState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(items: [
        ...state.items,
        // MenuItem(name: "Sorvete de laranja", price: 7),
        // MenuItem(name: "Sorvete de morango", price: 7),
        // MenuItem(name: "Sorvete de chocolate", price: 7),
      ]),
    );
    event.consumptionCompleter.complete();
  }
}
