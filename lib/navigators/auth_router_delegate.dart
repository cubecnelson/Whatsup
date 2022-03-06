// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsup/pages/home/app_home_page.dart';
import 'package:whatsup/pages/login/login_page.dart';
import 'package:whatsup/pages/login/sms_verification_page.dart';
import 'package:whatsup/pages/app_nav_page.dart';
import 'package:whatsup/service/location/location_service.dart';
import 'package:whatsup/viewmodels/home/app_home_viewmodel.dart';
import 'package:whatsup/viewmodels/login/app_login_viewmodel.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppLoginViewModel> {
  AppRouteInformationParser({required this.loginViewModel});
  AppLoginViewModel loginViewModel;
  @override
  Future<AppLoginViewModel> parseRouteInformation(
      RouteInformation routeInformation) async {
    return loginViewModel;
  }
}

class AppRouterDelegate extends RouterDelegate<AppLoginViewModel>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppLoginViewModel> {
  @override
  Widget build(BuildContext context) {
    final AppLoginViewModel loginViewModel =
        Provider.of<AppLoginViewModel>(context);
    final LocationService locationService =
        Provider.of<LocationService>(context);
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => Container()),
      key: navigatorKey,
      pages: [
        if (loginViewModel.loginStatus != AppLoginStatus.authenicated)
          AppNavigationPage(
            key: const ValueKey('LoginPage'),
            child: LoginPage(),
          ),
        if (loginViewModel.loginStatus == AppLoginStatus.authenicated)
          AppNavigationPage(
            key: const ValueKey('HomePage'),
            child: ChangeNotifierProvider(
              create: (BuildContext context) {
                return AppHomeViewModel(locationService: locationService);
              },
              builder: (BuildContext content, Widget? widget) {
                return AppHomePage();
              },
            ),
          ),
        if (loginViewModel.loginStatus == AppLoginStatus.smsVerification)
          AppNavigationPage(
            key: const ValueKey('SmsVerificationPage'),
            child: SmsVerificationPage(),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        notifyListeners();

        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(AppLoginViewModel configuration) async {
    // ignore: avoid_returning_null_for_void
    return null;
  }
}
