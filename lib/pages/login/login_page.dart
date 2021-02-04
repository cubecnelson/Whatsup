import 'dart:ui';

import 'package:Whatsup/components/molecules/button/button.dart';
import 'package:Whatsup/components/atoms/neumor_container/neumor_container.dart';
import 'package:Whatsup/components/molecules/textfield/textfield.dart';
import 'package:Whatsup/components/organisms/icon_button/icon_button.dart';
import 'package:Whatsup/constants/colors/app_colors.dart';
import 'package:Whatsup/models/counter/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

@swidget
Widget LoginPage({BuildContext context, String title}) {
  final counterModel = context.watch<CounterModel>();

  Widget buildPhoneNumberLoginModule() {
    return NeumorContainer(
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 32),
                child: AppTextfield(
                    onChange: (text) {},
                    context: context,
                    hintText: 'Phone Number'),
              ),
              AppButton(
                context: context,
                label: 'Login',
                onPressed: () {
                  counterModel.increment();
                },
              ),
            ],
          ),
        ));
  }

  Widget buildSocialLoginModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppIconButton(
              context: context,
              color: AppColors.facebookBlue,
              iconName: 'facebook'),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppIconButton(context: context, iconName: 'google_plus')),
      ],
    );
  }

  Widget buildSloganModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        "Let’s Get into Your Own Community",
        style: Theme.of(context).textTheme.headline4.merge(
              const TextStyle(
                fontFamily: 'OpenSansHebrewCondensed',
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
      ),
    );
  }

  return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildSloganModule(),
            buildPhoneNumberLoginModule(),
            buildSocialLoginModule()
          ],
        ),
      ));
}
