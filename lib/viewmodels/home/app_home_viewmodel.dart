import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:whatsup/service/location/location_service.dart';

enum AppHomeTabPageKey { nearby, events, messages, settings }

const List<AppHomeTabPageKey> homeTabPagesList = [
  AppHomeTabPageKey.nearby,
  AppHomeTabPageKey.events,
  AppHomeTabPageKey.messages,
  AppHomeTabPageKey.settings,
];

class AppHomeViewModel extends ChangeNotifier {
  AppHomeViewModel({required LocationService locationService}) {
    _locationService = locationService;
    subscribeToLocationChangesFromLocationService();
  }

  late LocationService _locationService;
  // late LatLng currentLatLng;

  AppHomeTabPageKey currentTabPageKey = AppHomeTabPageKey.nearby;
  int _currentIndex = 0;

  set index(int index) {
    _currentIndex = index;
    currentTabPageKey = homeTabPagesList[_currentIndex];
    notifyListeners();
  }

  int get index {
    return _currentIndex;
  }

  PermissionStatus get permissionStatus {
    return _locationService.permissionGranted;
  }

  // ignore: avoid_void_async
  void subscribeToLocationChangesFromLocationService() async {
    final LocationData locationData =
        await _locationService.getRealTimeLocation();
    // currentLatLng = LatLng(locationData.latitude!, locationData.longitude!);
    notifyListeners();
    _locationService.locationChanges().listen((newLocationData) {
      // currentLatLng =
      //     LatLng(newLocationData.latitude!, newLocationData.longitude!);
      notifyListeners();
    });
  }
}
