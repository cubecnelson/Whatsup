import 'package:flutter/material.dart';

class AppNavigationPage extends Page {
  final Widget child;

  // ignore: sort_constructors_first
  const AppNavigationPage({required this.child, required LocalKey key})
      : super(key: key);

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SlideTransition(
          position:
              Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0))
                  .animate(animation),
          child: child,
        );
      },
    );
  }
}
