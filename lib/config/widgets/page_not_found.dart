import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  final String? message;
  const PageNotFound({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Page Not Found'),
            if (message != null) Text(message!),
          ],
        ),
      ),
    );
  }
}