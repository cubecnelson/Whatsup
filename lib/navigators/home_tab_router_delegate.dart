import 'package:whatsup/pages/events/app_events_page.dart';
import 'package:whatsup/pages/messages/app_messages_page.dart';
import 'package:whatsup/pages/nearby/app_nearby_page.dart';
import 'package:whatsup/pages/settings/app_settings_page.dart';
import 'package:whatsup/pages/whatsup_nav_page.dart';
import 'package:whatsup/viewmodels/home/app_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHomeTabRouteInformationParser
    extends RouteInformationParser<AppHomeViewModel> {
  AppHomeTabRouteInformationParser({@required this.homeViewModel});
  AppHomeViewModel homeViewModel;
  @override
  Future<AppHomeViewModel> parseRouteInformation(
      RouteInformation routeInformation) async {
    return homeViewModel;
  }
}

class WUHomeTabRouterDelegate extends RouterDelegate<AppHomeViewModel>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppHomeViewModel> {
  @override
  Widget build(BuildContext context) {
    final AppHomeViewModel homeViewModel =
        Provider.of<AppHomeViewModel>(context);
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => Container()),
      key: navigatorKey,
      pages: [
        if (homeViewModel.currentTabPageKey == AppHomeTabPageKey.nearby)
          WhatsupNavigationPage(
            key: const ValueKey('NearbyPage'),
            child: AppNearbyPage(),
          ),
        if (homeViewModel.currentTabPageKey == AppHomeTabPageKey.events)
          WhatsupNavigationPage(
            key: const ValueKey('EventsPage'),
            child: AppEventsPage(),
          ),
        if (homeViewModel.currentTabPageKey == AppHomeTabPageKey.messages)
          WhatsupNavigationPage(
            key: const ValueKey('MessagesPage'),
            child: AppMessagesPage(),
          ),
        if (homeViewModel.currentTabPageKey == AppHomeTabPageKey.settings)
          WhatsupNavigationPage(
            key: const ValueKey('SettingsPage'),
            child: AppSettingsPage(),
          ),
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
  Future<void> setNewRoutePath(AppHomeViewModel configuration) async {
    // ignore: avoid_returning_null_for_void
    return null;
  }
}
