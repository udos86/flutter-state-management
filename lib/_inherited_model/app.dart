import 'package:flutter/material.dart';
import 'package:flutter_state_management/_inherited_model/_state.dart';
import 'package:flutter_state_management/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStateContainer(
      initialState: AppStateModel(items: sampleItems),
      child: MaterialApp(
          title: 'Inherited Model Sample',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Page(title: 'Inherited Model Sample')),
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
          final AppState state = AppStateContainer.of(context, aspect: 'items');
          state.addItem(Item(title: DateTime.now().toString()));
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState state = AppStateContainer.of(context, aspect: 'items');
    final List<Item> items = state.items;

    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index].title),
        );
      },
    );
  }
}
