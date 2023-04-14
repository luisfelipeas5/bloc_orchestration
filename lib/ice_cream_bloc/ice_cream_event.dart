part of 'ice_cream_bloc.dart';

abstract class IceCreamEvent extends BaseEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class IceCreamLoadEvent extends IceCreamEvent {}
