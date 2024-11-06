import 'package:bloc_prectice/bloc/counter/counter_bloc.dart';
import 'package:bloc_prectice/bloc/favourites/favourite_bloc.dart';
import 'package:bloc_prectice/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_prectice/bloc/slider/slider_bloc.dart';
import 'package:bloc_prectice/bloc/todo/todo_bloc.dart';
import 'package:bloc_prectice/repository/favourite_repository.dart';
import 'package:bloc_prectice/ui/favourite/favourite_screen.dart';
import 'package:bloc_prectice/ui/image_picker/image_picker_screen.dart';
import 'package:bloc_prectice/ui/todo/todo_screen.dart';
import 'package:bloc_prectice/utils/image_picker_utls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SliderBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtls())),
        BlocProvider(create: (context) => TodoBloc(['Image', 'Audio', 'Beaty'])),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
      ],
      child: MaterialApp(
      title: 'Bloc Prectice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FavouriteScreen(),
    ),
    );
  }
}
