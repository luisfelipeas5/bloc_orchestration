part of 'ice_cream_bloc.dart';

class IceCreamState extends BaseState {
  final List<MenuItem> items;

  IceCreamState({
    required this.items,
  });

  IceCreamState copyWith({
    List<MenuItem>? items,
  }) {
    return IceCreamState(
      items: items ?? this.items,
    );
  }
}
