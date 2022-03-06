import 'package:flutter/material.dart';
import 'package:whatsup/components/atoms/neumor_container/neumor_container.dart';
import 'package:whatsup/constants/colors/app_colors.dart';

Widget AppTextfield({
  bool obscureText = false,
  required BuildContext context,
  Function(String)? onChange,
  Function? onReachMaxLength,
  String? text,
  String? hintText,
  double? width,
  double? height,
  int? maxLength,
}) {
  return NeumorContainer(
    width: width,
    height: height,
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),),
    variation: NeumorVariation.concave,
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: TextField(
          onChanged: (text) {
            if (onChange != null) {
              onChange(text);
            }
            if (maxLength != null &&
                text.length >= maxLength &&
                onReachMaxLength != null) {
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
              counterText: '',),
        ),),
  );
}
