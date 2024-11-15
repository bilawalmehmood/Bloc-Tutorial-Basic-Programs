import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoLoad extends TodoEvent {}

class TodoAdded extends TodoEvent {
  final String description;
  const TodoAdded(this.description);

  @override
  List<Object> get props => [description];
}

class TodoUpdated extends TodoEvent {}

class TodoDeleted extends TodoEvent {
  final Object todo;
  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];
}



