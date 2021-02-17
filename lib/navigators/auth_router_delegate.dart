// ignore: file_names
import 'package:whatsup/pages/home/home_page.dart';
import 'package:whatsup/pages/login/login_page.dart';
import 'package:whatsup/pages/login/sms_verification_page.dart';
import 'package:whatsup/pages/whatsup_nav_page.dart';
import 'package:whatsup/viewmodels/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouteInformationParser extends RouteInformationParser<LoginViewModel> {
  AppRouteInformationParser({@required this.loginViewModel});
  LoginViewModel loginViewModel;
  @override
  Future<LoginViewModel> parseRouteInformation(
      RouteInformation routeInformation) async {
    return loginViewModel;
  }
}

class AppRouterDelegate extends RouterDelegate<LoginViewModel>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<LoginViewModel> {
  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => Container()),
      key: navigatorKey,
      observers: [HeroController()],
      pages: [
        if (loginViewModel.loginStatus != LoginStatus.authenicated)
          WhatsupNavigationPage(
            key: const ValueKey('LoginPage'),
            child: LoginPage(),
          ),
        if (loginViewModel.loginStatus == LoginStatus.authenicated)
          WhatsupNavigationPage(
            key: const ValueKey('HomePage'),
            child: HomePage(),
          ),
        if (loginViewModel.loginStatus == LoginStatus.smsVerification)
          WhatsupNavigationPage(
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
  Future<void> setNewRoutePath(LoginViewModel configuration) async {
    // ignore: avoid_returning_null_for_void
    return null;
  }
}
