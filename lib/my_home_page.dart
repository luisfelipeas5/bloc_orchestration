import 'dart:async';

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
    final juiceLoadCompleter = Completer();
    _juiceBloc.add(JuiceLoadEvent(
      consumptionCompleter: juiceLoadCompleter,
    ));
    final iceCreamLoadCompleter = Completer();
    _iceCreamBloc.add(IceCreamLoadEvent(
      consumptionCompleter: iceCreamLoadCompleter,
    ));
    await juiceLoadCompleter.future;
    await iceCreamLoadCompleter.future;
    _showEmptyWarningToastIfEmpty();
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

  //Show a toast when both juice and ice cream list are empty
  void _showEmptyWarningToastIfEmpty() {
    Fluttertoast.showToast(
      msg: "Empty menu!",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _showEmptyWarningToast() {
    Fluttertoast.showToast(
      msg: "Empty menu!",
    );
  }
}
