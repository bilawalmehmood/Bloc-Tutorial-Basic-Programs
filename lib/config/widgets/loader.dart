import 'package:bloc_prectice/config/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loader extends StatelessWidget {
  final String? message;

  const Loader({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    var isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: MediaQuery.of(context).size.height, // S
      decoration: BoxDecoration(
        color: isDarkMode
            ? kDarkScaffoldBackgroundColor
            : kScaffoldBackgroundColor,
      ), // et height to screen height
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoadingAnimationWidget.staggeredDotsWave(
                color: kPrimaryColor, size: 80),
            const SizedBox(
              height: 20,
            ),
            if (message != null)
              Text(
                message!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
          ],
        ),
      ),
    );
  }
}
