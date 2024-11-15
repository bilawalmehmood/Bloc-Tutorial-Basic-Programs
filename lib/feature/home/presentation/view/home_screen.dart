import 'package:bloc_prectice/config/constants/router_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(onPressed: () => GoRouter.of(context).pushNamed(kCounterScreenRouteName), child: const Text('Counter Screen')),
            TextButton(onPressed: () => GoRouter.of(context).pushNamed(kImagePickerScreenRouteName), child: const Text('Image Picker Screen')),
            TextButton(onPressed: () => GoRouter.of(context).pushNamed(kPostScreenRouteName), child: const Text('Post Screen')),
            TextButton(onPressed: () => GoRouter.of(context).pushNamed(kSliderScreenRouteName), child: const Text('Slider Screen')),
            TextButton(onPressed: () => GoRouter.of(context).pushNamed(kTodoScreenRouteName), child: const Text('Todo Screen')),
            TextButton(onPressed: () => GoRouter.of(context).pushNamed(kFavouriteScreenRouteName), child: const Text('Favourite Screen')),
          ],
        ),
      ),
    );
  }
}
