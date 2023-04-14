import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'base_event.dart';
part 'base_state.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(super.initialState);

  Future<S> addSync(E event) async {
    add(event);
    await event.consumptionCompleter.future;
    return state;
  }
}
