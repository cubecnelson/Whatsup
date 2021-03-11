import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:whatsup/navigators/auth_router_delegate.dart';
import 'package:whatsup/providers/setup.dart';
import 'package:whatsup/service/firebase/firebase_init.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp();

  @override
  Widget build(BuildContext context) {
    final AppRouterDelegate _routerDelegate = AppRouterDelegate();

    final PlatformRouteInformationProvider _platformRouteInformationProvider =
        PlatformRouteInformationProvider(
            initialRouteInformation: const RouteInformation(location: '/'));
    return FirebaseInit(
      child: MultiProvider(
        providers: providers,
        builder: (context, widget) {
          final AppRouteInformationParser _routeInformationParser =
              Provider.of<AppRouteInformationParser>(context);
          return MaterialApp.router(
            theme: ThemeData(
              primaryColor: AppColors.primaryDark,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            title: 'Whatsup',
            routerDelegate: _routerDelegate,
            routeInformationParser: _routeInformationParser,
            routeInformationProvider: _platformRouteInformationProvider,
          );
        },
      ),
    );
  }
}
