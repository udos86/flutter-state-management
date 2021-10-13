import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

@immutable
class Entity extends Equatable {
  final String id;

  Entity([String? id]) : id = id ?? const Uuid().v4();

  @override
  List<Object> get props => [id];
}

@immutable
abstract class EntityEvent<E extends Entity> extends Equatable {}

@immutable
class EntityState<E extends Entity> extends Equatable {
  final Map<String, E> dictionary;
  final List<String> ids;
  final List<E> entities;

  EntityState([this.entities = const []])
      : dictionary = {for (var entity in entities) entity.id: entity},
        ids = List.from(entities.map((entity) => entity.id));

  @override
  List<Object> get props => [dictionary, ids, entities];
}

abstract class EntityBloc<Event extends EntityEvent, State extends EntityState>
    extends Bloc<Event, State> {
  EntityBloc(State initialState) : super(initialState);
}
