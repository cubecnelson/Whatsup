import 'package:whatsup/components/organisms/icon_button/icon_list.dart';
import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

class AppBottomNavigationItemDef {
  AppBottomNavigationItemDef(
      {@required this.icon, @required this.selectedIcon, @required this.label});
  String icon;
  String selectedIcon;
  String label;
}

BottomNavigationBarItem getItemFromItemDef(AppBottomNavigationItemDef itemDef) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.all(8),
      child: Image(image: AssetImage(iconList[itemDef.icon])),
    ),
    activeIcon: Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(40))),
      height: 40,
      width: 40,
      child: Image(image: AssetImage(iconList[itemDef.selectedIcon])),
    ),
    label: itemDef.label,
    backgroundColor: AppColors.background,
  );
}

@swidget
Widget AppBottomNavigationBar({
  List<AppBottomNavigationItemDef> items,
  void Function(int) onTap,
  int currentIndex,
}) {
  return BottomNavigationBar(
    items: items.map((e) => getItemFromItemDef(e)).toList(),
    selectedItemColor: Colors.black,
    onTap: onTap,
    currentIndex: currentIndex,
    elevation: 24,
  );
}
