import 'package:Whatsup/components/atoms/neumor_container/neumor_container.dart';
import 'package:Whatsup/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

@swidget
Widget AppTextfield({
  bool obscureText = false,
  BuildContext context,
  Function(String) onChange,
  String text,
  String hintText,
}) {
  return NeumorContainer(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    variation: NeumorVariation.concave,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onChanged: onChange,
          controller: TextEditingController(text: text),
          cursorColor: AppColors.primary,
          obscureText: obscureText,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: hintText,
          ),
        )),
  );
}