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

  int? _loadEventCount;

  @override
  void initState() {
    super.initState();
    _loadMenuItems();
  }

  void _loadMenuItems() async {
    _loadEventCount = 0;
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
            _showEmptyWarningToastByJuiceStateListener,
            _showEmptyWarningToastByIceCreamStateListener,
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
  BlocListener get _showEmptyWarningToastByJuiceStateListener {
    return BlocListener<JuiceBloc, JuiceState>(
      listener: (context, state) {
        _onStateReceived();
      },
    );
  }

  BlocListener get _showEmptyWarningToastByIceCreamStateListener {
    return BlocListener<IceCreamBloc, IceCreamState>(
      listener: (context, state) {
        _onStateReceived();
      },
    );
  }

  void _onStateReceived() {
    _loadEventCount = (_loadEventCount ?? 0) + 1;
    if ((_loadEventCount ?? 0) < 2) return;

    final emptyJuice = _juiceBloc.state.items.isEmpty;
    final emptyIceCream = _iceCreamBloc.state.items.isEmpty;
    if (emptyJuice && emptyIceCream) {
      _showEmptyWarningToast();
    }
    _loadEventCount = 0;
  }

  void _showEmptyWarningToast() {
    Fluttertoast.showToast(
      msg: "Empty menu!",
    );
  }
}
