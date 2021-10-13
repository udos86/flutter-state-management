import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ItemsSelectionEvent extends Equatable {}

class SelectItemEvent extends ItemsSelectionEvent {
  final String itemId;

  SelectItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class DeselectItemEvent extends ItemsSelectionEvent {
  final String itemId;

  DeselectItemEvent(this.itemId);

  @override
  List<Object> get props => [itemId];
}

class ClearItemSelectionEvent extends ItemsSelectionEvent {
  ClearItemSelectionEvent();

  @override
  List<Object> get props => [];
}
