import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension GoRouterExt on BuildContext {
  void goTo(String routeName) {
    GoRouter.of(this).push(routeName);
  }
}
