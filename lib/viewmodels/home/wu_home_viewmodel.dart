import 'package:flutter/material.dart';

enum WUHomeTabPageKey { nearby, events, messages, settings }

const List<WUHomeTabPageKey> homeTabPagesList = [
  WUHomeTabPageKey.nearby,
  WUHomeTabPageKey.events,
  WUHomeTabPageKey.messages,
  WUHomeTabPageKey.settings,
];

class WUHomeViewModel extends ChangeNotifier {
  WUHomeTabPageKey currentTabPageKey = WUHomeTabPageKey.nearby;
  int _currentIndex = 0;

  set index(int index) {
    _currentIndex = index;
    currentTabPageKey = homeTabPagesList[_currentIndex];
    notifyListeners();
  }

  int get index {
    return _currentIndex;
  }
}
