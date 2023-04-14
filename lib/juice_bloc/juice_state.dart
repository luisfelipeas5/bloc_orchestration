part of 'juice_bloc.dart';

class JuiceState extends BaseState {
  final List<MenuItem> items;

  JuiceState({
    required this.items,
  });

  JuiceState copyWith({
    List<MenuItem>? items,
  }) {
    return JuiceState(
      items: items ?? this.items,
    );
  }
}
