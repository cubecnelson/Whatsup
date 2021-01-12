import 'package:Whatsup/components/atom/neumor_container/neumor_container.dart';
import 'package:Whatsup/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

final filledDecoration = BoxDecoration(
    color: AppColors.primary,
    boxShadow: NeumorDecorationMap[NeumorVariation.flat].boxShadow,
    borderRadius: const BorderRadius.all(Radius.circular(25)));

final outlineDecoration = BoxDecoration(
    border: Border.all(color: AppColors.primaryDark, width: 2.0),
    borderRadius: const BorderRadius.all(Radius.circular(25)));

const filledStyle = TextStyle(
  color: Colors.white,
);

const outlineStyle = TextStyle(color: AppColors.primaryDark);

final decorMap = {
  ButtonVariation.filled: ButtonDecoration(
    decoration: filledDecoration,
    style: filledStyle,
  ),
  ButtonVariation.outline: ButtonDecoration(
    decoration: outlineDecoration,
    style: outlineStyle,
  ),
};

class ButtonDecoration {
  ButtonDecoration({this.decoration, this.style});
  BoxDecoration decoration;
  TextStyle style;
}

enum ButtonVariation { filled, outline, alert }

@swidget
Widget Button({
  BuildContext context,
  ButtonVariation variation = ButtonVariation.filled,
  String label,
  void Function() onPressed,
}) {
  final ButtonDecoration buttonDecoration = decorMap[variation];
  final decoration = buttonDecoration.decoration;
  final style = buttonDecoration.style.merge(
      TextStyle(fontSize: Theme.of(context).textTheme.headline5.fontSize));

  return Container(
    decoration: decoration,
    child: FlatButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: style,
      ),
    ),
  );
}
