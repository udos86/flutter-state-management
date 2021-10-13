import 'package:flutter/material.dart';
import 'package:flutter_state_management/_scoped_model/_model.dart';
import 'package:flutter_state_management/item.dart';
import 'package:scoped_model/scoped_model.dart';

class App extends StatelessWidget {
  final AppModel appModel = AppModel();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppModel>(
      model: appModel,
      child: MaterialApp(
        title: 'Scoped Model Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page(title: 'Scoped Model Sample'),
      ),
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
      floatingActionButton: ScopedModelDescendant<AppModel>(
        builder: (context, child, model) {
          return FloatingActionButton(
            onPressed: () {
              model.addItem(Item(title: DateTime.now().toString()));
            },
            tooltip: 'Add',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppModel>(
      builder: (context, child, model) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: model.items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(model.items[index].title),
            );
          },
        );
      },
    );
  }
}
