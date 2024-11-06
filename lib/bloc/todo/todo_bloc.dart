import 'package:bloc_prectice/bloc/todo/todo_event.dart';
import 'package:bloc_prectice/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState>{
  final List<String> todos;
  TodoBloc(this.todos) : super(TodoState(todos: todos)){
    on<TodoLoad>(_onTodoLoad);
    on<TodoAdded>(_onTodoAdded);
    on<TodoUpdated>(_onTodoUpdated);
    on<TodoDeleted>(_onTodoDeleted);
  }

  void _onTodoLoad(TodoLoad event, Emitter<TodoState> emit){
    emit(state.copyWith(todos: todos));
  }

  void _onTodoAdded(TodoAdded event, Emitter<TodoState> emit){
    final todos = List<String>.from(state.todos)..add(event.description);
    emit(state.copyWith(todos: todos));
  }

  void _onTodoUpdated(TodoUpdated event, Emitter<TodoState> emit){
    
  }

  void _onTodoDeleted(TodoDeleted event, Emitter<TodoState> emit){
    final todos = List<String>.from(state.todos)..remove(event.todo);
    emit(state.copyWith(todos: todos));
  }
}