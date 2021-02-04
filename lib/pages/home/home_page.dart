import 'package:Whatsup/components/molecules/button/button.dart';
import 'package:Whatsup/constants/colors/app_colors.dart';
import 'package:Whatsup/models/counter/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

@swidget
Widget HomePage({BuildContext context, String title}) {
  final counterModel = context.watch<CounterModel>();
  return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppButton(
                  context: context,
                  label: '${counterModel.counter}',
                  onPressed: () {
                    counterModel.increment();
                  },
                )
              ],
            ),
          ],
        )),
      ));
}
