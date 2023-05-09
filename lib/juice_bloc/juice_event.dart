part of 'juice_bloc.dart';

abstract class JuiceEvent extends Equatable with CompleterEventMixin {
  @override
  List<Object?> get props => [];
}

class JuiceLoadEvent extends JuiceEvent {
  JuiceLoadEvent();
}
