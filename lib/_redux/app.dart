import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_state_management/item.dart';
import 'package:redux/redux.dart';

import '_store.dart';

class App extends StatelessWidget {
  final store =
      Store<AppState>(appReducer, initialState: const AppState.initialState());

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Redux Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Page(title: 'Redux Sample'),
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
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () {
            store.dispatch(
                AddItemAction(payload: Item(title: DateTime.now().toString())));
          };
        },
        builder: (context, onPressedCallback) {
          return FloatingActionButton(
            onPressed: onPressedCallback,
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
    return StoreConnector<AppState, List<Item>>(
      converter: (store) => store.state.items,
      builder: (context, items) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index].title),
            );
          },
        );
      },
    );
  }
}
