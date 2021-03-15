import 'dart:ui';

import 'package:whatsup/components/molecules/button/button.dart';
import 'package:whatsup/components/atoms/neumor_container/neumor_container.dart';
import 'package:whatsup/components/molecules/textfield/textfield.dart';
import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:whatsup/viewmodels/login/app_login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SmsVerificationPage extends StatelessWidget {
  List<String> smsCode = List.filled(6, '');

  Widget buildSmsVerificationModule({@required BuildContext context}) {
    final AppLoginViewModel loginViewModel = Provider.of(context);
    return NeumorContainer(
        padding: const EdgeInsets.all(4.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(4),
                child: AppTextfield(
                    width: 48,
                    height: 48,
                    maxLength: 1,
                    onReachMaxLength: () {
                      FocusScope.of(context).nextFocus();
                    },
                    onChange: (text) {
                      smsCode[0] = text;
                    },
                    context: context),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: AppTextfield(
                    width: 48,
                    height: 48,
                    maxLength: 1,
                    onChange: (text) {
                      smsCode[1] = text;
                    },
                    onReachMaxLength: () {
                      FocusScope.of(context).nextFocus();
                    },
                    context: context),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: AppTextfield(
                    width: 48,
                    height: 48,
                    maxLength: 1,
                    onChange: (text) {
                      smsCode[2] = text;
                    },
                    onReachMaxLength: () {
                      FocusScope.of(context).nextFocus();
                    },
                    context: context),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: AppTextfield(
                    width: 48,
                    height: 48,
                    maxLength: 1,
                    onChange: (text) {
                      smsCode[3] = text;
                    },
                    onReachMaxLength: () {
                      FocusScope.of(context).nextFocus();
                    },
                    context: context),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: AppTextfield(
                    width: 48,
                    height: 48,
                    maxLength: 1,
                    onChange: (text) {
                      smsCode[4] = text;
                    },
                    onReachMaxLength: () {
                      FocusScope.of(context).nextFocus();
                    },
                    context: context),
              ),
              Container(
                margin: const EdgeInsets.all(4),
                child: AppTextfield(
                    width: 48,
                    height: 48,
                    maxLength: 1,
                    onChange: (text) {
                      smsCode[5] = text;
                    },
                    onReachMaxLength: () {
                      if (!smsCode.any((element) => element.isEmpty)) {
                        loginViewModel.verifySmsCode(smsCode.join());
                      }
                    },
                    context: context),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final AppLoginViewModel loginViewModel = Provider.of(context);
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildSmsVerificationModule(context: context),
              AppButton(
                context: context,
                label: 'Back',
                onPressed: () {
                  Navigator.of(context).pop();
                  loginViewModel.signOut();
                },
              ),
            ],
          ),
        ));
  }
}
