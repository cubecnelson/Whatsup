import 'package:Whatsup/constants/colors/app_colors.dart';
import 'package:Whatsup/models/counter/counter_model.dart';
import 'package:Whatsup/pages/login/login_page.dart';
import 'package:Whatsup/service/firebase/auth/auth.dart';
import 'package:Whatsup/service/firebase/firebase_init.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryDark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FirebaseInit(
          child: MultiProvider(
            providers: [
              StreamProvider(
                create: (_) => Authenication.userStateChanges(),
              ),
              ChangeNotifierProvider(
                create: (_) => CounterModel(0),
              )
            ],
            builder: (context, widget) {
              return LoginPage(
                  context: context, title: 'Flutter Demo Home Page');
            },
          ),
        ));
  }
}
