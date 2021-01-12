import 'package:Whatsup/models/counter/counter_model.dart';
import 'package:Whatsup/service/firebase/auth/auth.dart';
import 'package:Whatsup/service/firebase/firebase_init.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home/home_page.dart';

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
          primarySwatch: Colors.blue,
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
              return HomePage(
                  context: context, title: 'Flutter Demo Home Page');
            },
          ),
        ));
  }
}
