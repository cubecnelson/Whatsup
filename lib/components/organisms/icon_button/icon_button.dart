import 'package:flutter/material.dart';
import 'package:whatsup/components/molecules/button/button.dart';
import 'package:whatsup/components/organisms/icon_button/icon_list.dart';

Widget AppIconButton({
  required BuildContext context,
  Color? color,
  void Function()? onPressed,
  String? iconName,
}) {
  return AppButton(
    width: 60,
    height: 60,
    context: context,
    color: color,
    child:
        iconName != null ? Image(image: AssetImage(iconList[iconName]!)) : null,
    onPressed: onPressed,
  );
}
