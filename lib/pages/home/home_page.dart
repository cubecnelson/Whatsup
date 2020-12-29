import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/widgets.dart';

@swidget
Widget HomePage({BuildContext context, String title}) {
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Hello World',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    ),
  );
}
