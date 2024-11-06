import 'dart:math';

import 'package:bloc_prectice/bloc/todo/todo_bloc.dart';
import 'package:bloc_prectice/bloc/todo/todo_event.dart';
import 'package:bloc_prectice/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        buildWhen: (previous, current) => previous.todos != current.todos,
        bloc: context.read<TodoBloc>(),
        builder: (context, state) {
        if (state.todos.isEmpty) {
          return const Center(
            child: Text('No Todos', style: TextStyle(fontSize: 20)),
          );
        } else {
          return ListView.builder(
            itemCount: state.todos.length,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(state.todos[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<TodoBloc>().add(TodoDeleted(state.todos[index]));
                    },
                  ),
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List todos = ['Image', 'Audio', 'Beaty'];
          int index = Random().nextInt(todos.length);
          context.read<TodoBloc>().add(TodoAdded(todos[index]));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
