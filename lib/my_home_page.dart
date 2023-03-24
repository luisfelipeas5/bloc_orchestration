import 'package:bloc_orchestration/ice_cream_bloc/ice_cream_bloc.dart';
import 'package:bloc_orchestration/juice_bloc/juice_bloc.dart';
import 'package:bloc_orchestration/menu_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _juiceBloc = JuiceBloc();
  final _iceCreamBloc = IceCreamBloc();

  @override
  void initState() {
    super.initState();
    _loadMenuItems();
  }

  void _loadMenuItems() async {
    _juiceBloc.add(JuiceLoadEvent());
    _iceCreamBloc.add(IceCreamLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JuiceBloc>(
      create: (context) => _juiceBloc,
      child: BlocProvider<IceCreamBloc>(
        create: (context) => _iceCreamBloc,
        child: MultiBlocListener(
          listeners: [
            _showEmptyWarningToastListener,
          ],
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
              ),
              body: const MenuItemList(),
            ),
          ),
        ),
      ),
    );
  }

  //Show a toast when both juice and ice cream list are empty
  BlocListener get _showEmptyWarningToastListener {
    return BlocListener<JuiceBloc, JuiceState>(
      listener: (context, state) {
        //TODO
      },
    );
  }
}
