import 'package:bloc_prectice/feature/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:bloc_prectice/feature/image_picker/presentation/bloc/image_picker_bloc.dart';
import 'package:bloc_prectice/feature/posts/presentation/bloc/post_bloc.dart';
import 'package:bloc_prectice/feature/slider/presentation/bloc/slider_bloc.dart';
import 'package:bloc_prectice/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:bloc_prectice/config/router/app_router.dart';
import 'package:bloc_prectice/feature/favourite/data/repositories/favourite_repository.dart';
import 'package:bloc_prectice/config/utils/image_picker_utls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
     final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SliderBloc()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtls())),
        BlocProvider(create: (context) => TodoBloc(['Image', 'Audio', 'Beaty'])),
        BlocProvider(create: (context) => FavouriteBloc(FavouriteRepository())),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp.router(
      title: 'Bloc Prectice',
      key: navigatorKey,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    ),
    );
  }
}

