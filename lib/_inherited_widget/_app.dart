import 'package:flutter/material.dart';
import 'package:flutter_state_management/item.dart';

class AppStateWidget extends InheritedWidget {
  const AppStateWidget({
    Key? key,
    required Widget child,
    required this.items,
  }) : super(key: key, child: child);

  final List<Item> items;

  @override
  bool updateShouldNotify(AppStateWidget oldWidget) => true;
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStateWidget(
      items: sampleItems,
      child: MaterialApp(
          title: 'Inherited Widget Sample',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Page(title: 'Inherited Widget Sample')),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const ListViewWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final List<Item> items = context
                .dependOnInheritedWidgetOfExactType<AppStateWidget>()!
                .items;
            items.add(Item(title: DateTime.now().toString()));
          },
          tooltip: 'Add',
          child: const Icon(Icons.add),
        ));
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Item> items =
        context.dependOnInheritedWidgetOfExactType<AppStateWidget>()!.items;

    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(items[index].title),
          );
        });
  }
}
