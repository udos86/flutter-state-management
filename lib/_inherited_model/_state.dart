import 'package:flutter/widgets.dart';
import 'package:flutter_state_management/item.dart';

class _AppStateWidget extends InheritedModel<String> {
  const _AppStateWidget({
    Key? key,
    required Widget child,
    required this.state,
  }) : super(key: key, child: child);

  final AppState state;

  @override
  bool updateShouldNotify(_AppStateWidget oldWidget) => true;

  @override
  bool updateShouldNotifyDependent(
      InheritedModel<String> oldWidget, Set<String> dependencies) {
    if (dependencies.contains('items')) {
      return true;
    }

    return false;
  }
}

class AppStateContainer extends StatefulWidget {
  const AppStateContainer({
    Key? key,
    required this.child,
    required this.initialState,
  }) : super(key: key);

  final Widget child;
  final AppStateModel initialState;

  @override
  State<AppStateContainer> createState() => AppState();

  static AppState of(BuildContext context, {Object? aspect}) {
    return (InheritedModel.inheritFrom<_AppStateWidget>(
      context,
      aspect: aspect,
    ))!
        .state;
  }
}

class AppStateModel {
  AppStateModel({this.items = const []});

  List<Item> items;
}

class AppState extends State<AppStateContainer> implements AppStateModel {
  @override
  late List<Item> items;

  @override
  void initState() {
    super.initState();

    items = widget.initialState.items;
  }

  @override
  Widget build(BuildContext context) {
    return _AppStateWidget(state: this, child: widget.child);
  }

  void addItem(Item item) {
    setState(() {
      items = List.unmodifiable([...items, item]);
    });
  }
}
