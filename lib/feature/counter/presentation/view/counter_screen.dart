import 'package:bloc_prectice/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:bloc_prectice/feature/counter/presentation/bloc/counter_event.dart';
import 'package:bloc_prectice/feature/counter/presentation/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Text('Counter'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
              ),
              bottomNavigationBar: Container(
                margin: const EdgeInsets.all(10),
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.remove_circle, size: 40),
                      onPressed: () =>
                          context.read<CounterBloc>().add(Decrement()),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    const SizedBox(width: 100),
                    IconButton(
                      icon: const Icon(Icons.add_circle, size: 40),
                      onPressed: () =>
                          context.read<CounterBloc>().add(Increment()),
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
