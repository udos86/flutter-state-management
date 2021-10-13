import 'package:flutter_state_management/_bloc_lib/_shared/entitity.dart';
import 'package:flutter_state_management/_bloc_lib/_shared/item.entity.dart';

class ItemsState extends EntityState<Item> {
  ItemsState([List<Item> items = const []]) : super(items);
}
