import 'package:flutter/widgets.dart';

import '_bloc.dart';

class ItemsBlocProvider extends InheritedWidget {
  final ItemsBloc bloc;

  const ItemsBlocProvider({
    Key? key,
    required Widget child,
    required this.bloc,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static ItemsBloc of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ItemsBlocProvider>();
    return provider!.bloc;
  }
}
