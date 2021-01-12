import 'package:Whatsup/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

enum NeumorVariation { flat, concave, convex, pressed }

final NeumorDecorationMap = {
  NeumorVariation.flat: const BoxDecoration(
    color: AppColors.background,
    boxShadow: [
      BoxShadow(
          color: Colors.black26, offset: Offset(4.0, 4.0), blurRadius: 8.0),
      BoxShadow(
          color: Colors.white, offset: Offset(-4.0, -4.0), blurRadius: 8.0)
    ],
  )
};

@swidget
Widget NeumorContainer({
  NeumorVariation variation = NeumorVariation.flat,
  BoxDecoration decoration,
  Widget child,
}) {
  final finalizedDecoration =
      NeumorDecorationMap[NeumorVariation.flat].copyWith(
    color: decoration.color,
    image: decoration.image,
    border: decoration.border,
    borderRadius: decoration.borderRadius,
    boxShadow: decoration.boxShadow,
    gradient: decoration.gradient,
    backgroundBlendMode: decoration.backgroundBlendMode,
    shape: decoration.shape,
  );
  return Container(
    decoration: finalizedDecoration,
    child: child,
  );
}
