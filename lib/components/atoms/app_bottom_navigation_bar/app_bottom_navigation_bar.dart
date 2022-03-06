import 'package:flutter/material.dart';
import 'package:whatsup/components/organisms/icon_button/icon_list.dart';
import 'package:whatsup/constants/colors/app_colors.dart';

class AppBottomNavigationItemDef {
  AppBottomNavigationItemDef(
      {required this.icon, required this.selectedIcon, required this.label});
  String icon;
  String selectedIcon;
  String label;
}

BottomNavigationBarItem getItemFromItemDef(AppBottomNavigationItemDef itemDef) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.all(8),
      child: Image(image: AssetImage(iconList[itemDef.icon]!)),
    ),
    activeIcon: Container(
      decoration: const BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(40)),),
      height: 40,
      width: 40,
      child: Image(image: AssetImage(iconList[itemDef.selectedIcon]!)),
    ),
    label: itemDef.label,
    backgroundColor: AppColors.background,
  );
}

Widget AppBottomNavigationBar({
  required List<AppBottomNavigationItemDef> items,
  required void Function(int) onTap,
  required int currentIndex,
}) {
  return BottomNavigationBar(
    items: items.map((e) => getItemFromItemDef(e)).toList(),
    selectedItemColor: Colors.black,
    onTap: onTap,
    currentIndex: currentIndex,
    elevation: 24,
  );
}
