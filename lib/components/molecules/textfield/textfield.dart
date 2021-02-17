import 'package:whatsup/components/atoms/neumor_container/neumor_container.dart';
import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

@swidget
Widget AppTextfield({
  bool obscureText = false,
  BuildContext context,
  Function(String) onChange,
  Function onReachMaxLength,
  String text,
  String hintText,
  double width,
  double height,
  int maxLength,
}) {
  return NeumorContainer(
    width: width,
    height: height,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    variation: NeumorVariation.concave,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onChanged: (text) {
            if (onChange != null) onChange(text);
            if (onReachMaxLength != null && text.length >= maxLength) {
              onReachMaxLength();
            }
          },
          maxLength: maxLength,
          controller: TextEditingController(text: text),
          cursorColor: AppColors.primary,
          obscureText: obscureText,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
              fillColor: AppColors.facebookBlue,
              border: InputBorder.none,
              labelText: hintText,
              counterText: ''),
        )),
  );
}
