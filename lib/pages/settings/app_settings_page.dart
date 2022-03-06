import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsup/components/molecules/button/button.dart';
import 'package:whatsup/viewmodels/login/app_login_viewmodel.dart';

// ignore: must_be_immutable
class AppSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLoginViewModel loginViewModel =
        Provider.of<AppLoginViewModel>(context);
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('Settings'),
                AppButton(
                    label: 'Logout',
                    context: context,
                    onPressed: () {
                      Future.delayed(const Duration(microseconds: 500),
                          () async {
                        await loginViewModel.signOut();
                      });
                    },)
              ],),
        ),);
  }
}
