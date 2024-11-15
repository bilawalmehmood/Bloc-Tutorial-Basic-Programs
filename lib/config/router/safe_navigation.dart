import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void safeNavigate(BuildContext context, String path) {
  if (context.mounted) {
    context.go(path);
  }
}