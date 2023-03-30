part of 'ice_cream_bloc.dart';

abstract class IceCreamEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class IceCreamLoadEvent extends IceCreamEvent {
  final Completer consumptionCompleter;

  IceCreamLoadEvent({
    required this.consumptionCompleter,
  });
}
