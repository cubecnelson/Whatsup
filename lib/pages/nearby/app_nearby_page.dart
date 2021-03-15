import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:whatsup/components/atoms/app_map_view/app_map_view.dart';
import 'package:whatsup/constants/colors/app_colors.dart';

class AppNearbyPage extends StatelessWidget {
  Widget buildAppMapView({LatLng latLng}) {
    return AppMapView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          padding: const EdgeInsets.all(0.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: buildAppMapView(),
                )
              ]),
        ));
  }
}
