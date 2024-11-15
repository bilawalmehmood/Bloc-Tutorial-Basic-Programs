import 'package:bloc_prectice/config/router/screens_import.dart';
import 'package:bloc_prectice/config/widgets/page_not_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

class AppRouter {
  static final GoRouter router =
    GoRouter(
      initialLocation: '/', 
      routes: [
        GoRoute(
          name: kHomeScreenRouteName,
          path: '/',
          pageBuilder: (context, state) => 
          buildPageWithDefaultTransition(context: context, state: state, child: const HomeScreen())
        ),
      GoRoute(
        name: kCounterScreenRouteName,
        path: '/counter',
        pageBuilder: (context, state) => 
        buildPageWithDefaultTransition(context: context, state: state, child: const CounterScreen())
        ),
      GoRoute(
        name: kImagePickerScreenRouteName,
        path: '/image_picker',
        pageBuilder: (context, state) => 
        buildPageWithDefaultTransition(context: context, state: state, child: const ImagePickerScreen())
        ),
      GoRoute(
        name: kPostScreenRouteName,
        path: '/post',
        pageBuilder: (context, state) => 
        buildPageWithDefaultTransition(context: context, state: state, child: const PostScreen())
        ),
      GoRoute(
        name: kSliderScreenRouteName,
        path: '/slider',
        pageBuilder: (context, state) => 
        buildPageWithDefaultTransition(context: context, state: state, child: const SliderScreen())
        ),
      GoRoute(
        name: kTodoScreenRouteName,
        path: '/todo',
        pageBuilder: (context, state) => 
        buildPageWithDefaultTransition(context: context, state: state, child: const TodoScreen())
        ),
      GoRoute(
        name: kFavouriteScreenRouteName,
        path: '/favourite',
        pageBuilder: (context, state) => 
        buildPageWithDefaultTransition(context: context, state: state, child: const FavouriteScreen())
        ),
  ],
  errorPageBuilder: (context, state) => 
    buildPageWithDefaultTransition(context: context, state: state, child: PageNotFound(message: state.error.toString(),)),
  );
}
