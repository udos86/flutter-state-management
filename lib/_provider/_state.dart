import 'package:flutter/foundation.dart';
import 'package:flutter_state_management/item.dart';

class AppState with ChangeNotifier {
  List<Item> _items = sampleItems;

  List<Item> get items => _items;

  void addItem(Item item) {
    _items = List.unmodifiable([...items, item]);

    notifyListeners();
  }
}
