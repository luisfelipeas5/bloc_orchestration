import 'package:bloc_orchestration/ice_cream_bloc/ice_cream_bloc.dart';
import 'package:bloc_orchestration/juice_bloc/juice_bloc.dart';
import 'package:bloc_orchestration/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuItemList extends StatelessWidget {
  const MenuItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JuiceBloc, JuiceState>(
      builder: (context, juiceState) {
        return BlocBuilder<IceCreamBloc, IceCreamState>(
          builder: (context, iceCreamState) {
            final items = [
              ...iceCreamState.items,
              ...juiceState.items,
            ];
            return _buildList(items);
          },
        );
      },
    );
  }

  Widget _buildList(List<MenuItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => _itemBuilder(items[index]),
    );
  }

  Widget _itemBuilder(MenuItem item) {
    return Row(
      children: [
        Expanded(child: Text(item.name)),
        Text(item.price.toString()),
      ],
    );
  }
}
