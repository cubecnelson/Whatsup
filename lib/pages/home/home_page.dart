import 'package:whatsup/components/molecules/button/button.dart';
import 'package:whatsup/constants/colors/app_colors.dart';
import 'package:whatsup/viewmodels/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of(context);
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Home'),
                AppButton(
                    label: 'Logout',
                    context: context,
                    onPressed: () {
                      Future.delayed(const Duration(microseconds: 500),
                          () async {
                        await loginViewModel.signOut();
                      });
                    })
              ]),
        ));
  }
}
