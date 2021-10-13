import 'package:flutter/material.dart';

@immutable
class Item {
  final String title;

  const Item({
    required this.title,
  });
}

const List<Item> sampleItems = [
  Item(title: 'Item 1'),
  Item(title: 'Item 2'),
  Item(title: 'Item 3')
];
