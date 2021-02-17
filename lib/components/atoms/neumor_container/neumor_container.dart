import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

enum NeumorVariation { flat, concave, convex, pressed, shadow }

final NeumorDecorationMap = {
  NeumorVariation.shadow: const BoxDecoration(
    color: AppColors.background,
    boxShadow: [
      BoxShadow(
          color: Colors.black26, offset: Offset(4.0, 4.0), blurRadius: 8.0),
    ],
  ),
  NeumorVariation.flat: const BoxDecoration(
    color: AppColors.background,
    boxShadow: [
      BoxShadow(
          color: Colors.black26, offset: Offset(4.0, 4.0), blurRadius: 8.0),
      BoxShadow(
          color: Colors.white, offset: Offset(-4.0, -4.0), blurRadius: 8.0)
    ],
  ),
  NeumorVariation.concave: BoxDecoration(
    color: AppColors.background,
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black12.withOpacity(0.1),
        AppColors.background.withOpacity(0.1),
        AppColors.background.withOpacity(0.5),
        AppColors.background.withOpacity(0.5),
        Colors.white.withOpacity(0.3),
        Colors.white.withOpacity(0.8)
      ],
    ),
    boxShadow: const [
      BoxShadow(
          color: Colors.black12, offset: Offset(1.0, 1.0), blurRadius: 2.0),
      BoxShadow(
          color: Colors.white10, offset: Offset(-1.0, -1.0), blurRadius: 2.0)
    ],
  ),
};

@swidget
Widget NeumorContainer({
  EdgeInsetsGeometry padding,
  EdgeInsetsGeometry margin,
  NeumorVariation variation = NeumorVariation.flat,
  BoxDecoration decoration,
  Widget child,
  double width,
  double height,
}) {
  final finalizedDecoration = NeumorDecorationMap[variation].copyWith(
    color: decoration?.color,
    image: decoration?.image,
    border: decoration?.border,
    borderRadius: decoration?.borderRadius,
    boxShadow: decoration?.boxShadow,
    gradient: decoration?.gradient,
    backgroundBlendMode: decoration?.backgroundBlendMode,
    shape: decoration?.shape,
  );
  return Container(
    width: width,
    height: height,
    margin: margin,
    padding: padding,
    decoration: finalizedDecoration,
    child: child,
  );
}
