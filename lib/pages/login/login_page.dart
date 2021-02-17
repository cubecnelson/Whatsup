import 'dart:ui';

import 'package:whatsup/components/molecules/button/button.dart';
import 'package:whatsup/components/atoms/neumor_container/neumor_container.dart';
import 'package:whatsup/components/molecules/textfield/textfield.dart';
import 'package:whatsup/components/organisms/icon_button/icon_button.dart';
import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:whatsup/viewmodels/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  String phoneNumber = '';

  void onPhoneLoginPressed(
      {LoginViewModel loginViewModel, String phoneNumber}) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return;
    }
    loginViewModel.signInWithPhoneNumber(phoneNumber);
  }

  void onGoogleLoginPressed({LoginViewModel loginViewModel}) {
    loginViewModel.signInWithGoogle();
  }

  void onFacebookLoginPressed({LoginViewModel loginViewModel}) {
    loginViewModel.signInWithFacebook();
  }

  Widget buildPhoneNumberLoginModule(
      {BuildContext context, void Function() onLoginPressed}) {
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
                    onChange: (text) {
                      phoneNumber = text;
                    },
                    context: context,
                    hintText: 'Phone Number'),
              ),
              AppButton(
                context: context,
                label: 'Login',
                onPressed: onLoginPressed,
              ),
            ],
          ),
        ));
  }

  Widget buildSocialLoginModule({
    BuildContext context,
    void Function() onGoogleLoginPressed,
    void Function() onFacebookLoginPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AppIconButton(
              context: context,
              color: AppColors.facebookBlue,
              onPressed: onFacebookLoginPressed,
              iconName: 'facebook'),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: AppIconButton(
              context: context,
              iconName: 'google_plus',
              onPressed: onGoogleLoginPressed,
            )),
      ],
    );
  }

  Widget buildSloganModule({BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        'Let’s Get into Your Own Community',
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

  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildSloganModule(context: context),
              buildPhoneNumberLoginModule(
                  context: context,
                  onLoginPressed: () {
                    onPhoneLoginPressed(
                        loginViewModel: loginViewModel,
                        phoneNumber: phoneNumber);
                  }),
              buildSocialLoginModule(
                  context: context,
                  onFacebookLoginPressed: () {
                    onFacebookLoginPressed(loginViewModel: loginViewModel);
                  },
                  onGoogleLoginPressed: () {
                    onGoogleLoginPressed(loginViewModel: loginViewModel);
                  })
            ],
          ),
        ));
  }
}
