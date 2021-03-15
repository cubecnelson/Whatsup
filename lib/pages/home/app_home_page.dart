import 'package:whatsup/components/atoms/app_bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:whatsup/components/organisms/icon_button/icon_list.dart';
import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:whatsup/navigators/home_tab_router_delegate.dart';
import 'package:whatsup/viewmodels/home/app_home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppHomeViewModel homeViewModel = Provider.of(context);

    final WUHomeTabRouterDelegate _routerDelegate = WUHomeTabRouterDelegate();

    final PlatformRouteInformationProvider _platformRouteInformationProvider =
        PlatformRouteInformationProvider(
            initialRouteInformation: const RouteInformation(location: '/'));
    return Scaffold(
      bottomNavigationBar: AppBottomNavigationBar(
          items: <AppBottomNavigationItemDef>[
            AppBottomNavigationItemDef(
                icon: 'nearby_home',
                selectedIcon: 'nearby_home_selected',
                label: 'Nearby'),
            AppBottomNavigationItemDef(
                icon: 'events_home',
                selectedIcon: 'events_home_selected',
                label: 'Events'),
            AppBottomNavigationItemDef(
                icon: 'messages_home',
                selectedIcon: 'messages_home_selected',
                label: 'Messages'),
            AppBottomNavigationItemDef(
                icon: 'settings_home',
                selectedIcon: 'settings_home_selected',
                label: 'Settings')
          ],
          currentIndex: homeViewModel.index,
          onTap: (int index) {
            homeViewModel.index = index;
          }),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.background,
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image(
            image: AssetImage(iconList['logo']),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
                icon: Image(
                  image: AssetImage(iconList['profile']),
                ),
                onPressed: () {}),
          )
        ],
      ),
      body: MaterialApp.router(
        theme: ThemeData(
          primaryColor: AppColors.primaryDark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _routerDelegate,
        routeInformationParser:
            AppHomeTabRouteInformationParser(homeViewModel: homeViewModel),
        routeInformationProvider: _platformRouteInformationProvider,
      ),
    );
  }
}
