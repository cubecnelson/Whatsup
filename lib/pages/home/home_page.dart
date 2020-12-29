import 'package:Whatsup/models/counter/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

@swidget
Widget HomePage({BuildContext context, String title}) {
  final counterModel = context.watch<CounterModel>();
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            onPressed: () {
              counterModel.increment();
            },
            child: Text(
              '${counterModel.counter}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      ),
    ),
  );
}
