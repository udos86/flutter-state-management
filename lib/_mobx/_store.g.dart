// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$itemsAtom = Atom(name: '_AppStore.items');

  @override
  ObservableList<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$checkedItemIdsAtom = Atom(name: '_AppStore.checkedItemIds');

  @override
  ObservableSet<String> get checkedItemIds {
    _$checkedItemIdsAtom.reportRead();
    return super.checkedItemIds;
  }

  @override
  set checkedItemIds(ObservableSet<String> value) {
    _$checkedItemIdsAtom.reportWrite(value, super.checkedItemIds, () {
      super.checkedItemIds = value;
    });
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void addItem(Item item) {
    final _$actionInfo =
        _$_AppStoreActionController.startAction(name: '_AppStore.addItem');
    try {
      return super.addItem(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
checkedItemIds: ${checkedItemIds}
    ''';
  }
}
