import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ItemsSelectionState extends Equatable {
  final List<String> ids;

  const ItemsSelectionState([List<String>? ids]) : ids = ids ?? const [];

  @override
  List<Object> get props => [ids];
}
