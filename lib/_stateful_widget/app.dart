import 'package:flutter/material.dart';
import 'package:flutter_state_management/item.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Widget Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Page(title: 'Stateful Widget Sample'),
    );
  }
}

class Page extends StatefulWidget {
  const Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  List<Item> items = sampleItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListViewWidget(items: items),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final item = Item(title: DateTime.now().toString());
            items = List.unmodifiable([...items, item]);
          });
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({Key? key, this.items = const []}) : super(key: key);

  final List<Item> items;

  @override
  Widget build(BuildContext context) {
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
