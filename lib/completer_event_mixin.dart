import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

mixin CompleterEventMixin {
  final consumptionCompleter = Completer();
}

extension AddSyncBlocExtension<E extends CompleterEventMixin, S> on Bloc<E, S> {
  Future<S> addSync(E event) async {
    add(event);
    await event.consumptionCompleter.future;
    return state;
  }
}
