import 'package:flutter/material.dart';
import 'package:flutter_state_management/_inherited_widget/_state.dart';
import 'package:flutter_state_management/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      initialState: AppStateModel(items: sampleItems),
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
          final AppState state = AppStateProvider.of(context);
          state.addItem(Item(title: DateTime.now().toString()));
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState state = AppStateProvider.of(context);
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

// Extract action button widget to decrease rebuilds
class AddItemButton extends StatelessWidget {
  const AddItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState state = AppStateProvider.of(context);

    return FloatingActionButton(
      onPressed: () {
        state.addItem(Item(title: DateTime.now().toString()));
      },
      tooltip: 'Add',
      child: const Icon(Icons.add),
    );
  }
}
