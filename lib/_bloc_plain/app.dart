import 'package:flutter/material.dart';
import 'package:flutter_state_management/item.dart';

import '_bloc.dart';
import '_provider.dart';

class App extends StatelessWidget {
  final ItemsBloc itemsBloc = ItemsBloc();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemsBlocProvider(
      bloc: itemsBloc,
      child: MaterialApp(
        title: 'BLoC Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page(title: 'BLoC Sample'),
      ),
    );
  }
}

class Page extends StatelessWidget {
  const Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ItemsBloc itemsBloc = ItemsBlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const ListViewWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          itemsBloc.addItem(Item(title: DateTime.now().toString()));
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
    final ItemsBloc itemsBloc = ItemsBlocProvider.of(context);

    return StreamBuilder<List<Item>>(
      stream: itemsBloc.items,
      builder: (context, snapshot) {
        final items = snapshot.data;

        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: items is List<Item> ? items.length : 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items![index].title),
            );
          },
        );
      },
    );
  }
}
