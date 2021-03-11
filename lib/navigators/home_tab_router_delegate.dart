import 'package:whatsup/pages/events/wu_events_page.dart';
import 'package:whatsup/pages/messages/wu_messages_page.dart';
import 'package:whatsup/pages/nearby/wu_nearby_page.dart';
import 'package:whatsup/pages/settings/wu_settings_page.dart';
import 'package:whatsup/pages/whatsup_nav_page.dart';
import 'package:whatsup/viewmodels/home/wu_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WUHomeTabRouteInformationParser
    extends RouteInformationParser<WUHomeViewModel> {
  WUHomeTabRouteInformationParser({@required this.homeViewModel});
  WUHomeViewModel homeViewModel;
  @override
  Future<WUHomeViewModel> parseRouteInformation(
      RouteInformation routeInformation) async {
    return homeViewModel;
  }
}

class WUHomeTabRouterDelegate extends RouterDelegate<WUHomeViewModel>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<WUHomeViewModel> {
  @override
  Widget build(BuildContext context) {
    final WUHomeViewModel homeViewModel = Provider.of<WUHomeViewModel>(context);
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(builder: (_) => Container()),
      key: navigatorKey,
      pages: [
        if (homeViewModel.currentTabPageKey == WUHomeTabPageKey.nearby)
          WhatsupNavigationPage(
            key: const ValueKey('NearbyPage'),
            child: WUNearbyPage(),
          ),
        if (homeViewModel.currentTabPageKey == WUHomeTabPageKey.events)
          WhatsupNavigationPage(
            key: const ValueKey('EventsPage'),
            child: WUEventsPage(),
          ),
        if (homeViewModel.currentTabPageKey == WUHomeTabPageKey.messages)
          WhatsupNavigationPage(
            key: const ValueKey('MessagesPage'),
            child: WUMessagesPage(),
          ),
        if (homeViewModel.currentTabPageKey == WUHomeTabPageKey.settings)
          WhatsupNavigationPage(
            key: const ValueKey('SettingsPage'),
            child: WUSettingsPage(),
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
  Future<void> setNewRoutePath(WUHomeViewModel configuration) async {
    // ignore: avoid_returning_null_for_void
    return null;
  }
}
