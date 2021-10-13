import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_state_management/_mobx/_store.dart';
import 'package:flutter_state_management/item.dart';

final store = AppStore();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Page(title: 'MobX Sample'),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.addItem(Item(title: DateTime.now().toString()));
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
    return Observer(
      builder: (_) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: store.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(store.items[index].title),
            );
          },
        );
      },
    );
  }
}
