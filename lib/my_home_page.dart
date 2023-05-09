import 'package:bloc_orchestration/completer_event_mixin.dart';
import 'package:bloc_orchestration/ice_cream_bloc/ice_cream_bloc.dart';
import 'package:bloc_orchestration/juice_bloc/juice_bloc.dart';
import 'package:bloc_orchestration/menu_item_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
    await Future.wait<dynamic>([
      _juiceBloc.addSync(JuiceLoadEvent()),
      _iceCreamBloc.addSync(IceCreamLoadEvent()),
    ]);
    _showEmptyWarningToast();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JuiceBloc>(
      create: (context) => _juiceBloc,
      child: BlocProvider<IceCreamBloc>(
        create: (context) => _iceCreamBloc,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: const MenuItemList(),
          ),
        ),
      ),
    );
  }

  void _showEmptyWarningToast() {
    Fluttertoast.showToast(
      msg: "Empty menu!",
    );
  }
}
