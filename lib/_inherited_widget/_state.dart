import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/item.dart';

class _AppStateWidget extends InheritedWidget {
  const _AppStateWidget({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  final AppState state;

  @override
  bool updateShouldNotify(_AppStateWidget oldWidget) {
    return true;
  }
}

class AppStateModel {
  AppStateModel({
    this.items = const [],
  });

  List<Item> items;
}

class AppStateProvider extends StatefulWidget {
  const AppStateProvider({
    Key? key,
    required this.child,
    required this.initialState,
  }) : super(key: key);

  final Widget child;
  final AppStateModel initialState;

  @override
  State<AppStateProvider> createState() => AppState();

  static AppState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AppStateWidget>()!.state;
  }
}

class AppState extends State<AppStateProvider> implements AppStateModel {
  @override
  late List<Item> items;

  @override
  void initState() {
    super.initState();

    items = widget.initialState.items;
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateWidget(
      state: this,
      child: widget.child,
    );
  }

  void addItem(Item item) {
    setState(() {
      items = List.unmodifiable([...items, item]);
    });
  }
}
