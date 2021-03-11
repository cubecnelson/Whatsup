import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:whatsup/components/molecules/button/button.dart';
import 'package:whatsup/viewmodels/login/login_viewmodel.dart';

// ignore: must_be_immutable
class WUSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginViewModel loginViewModel = Provider.of<LoginViewModel>(context);
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
                    })
              ]),
        ));
  }
}
