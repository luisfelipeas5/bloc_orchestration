part of 'juice_bloc.dart';

abstract class JuiceEvent extends BaseEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class JuiceLoadEvent extends JuiceEvent {}
