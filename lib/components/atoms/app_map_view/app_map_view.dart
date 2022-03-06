// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

const accessToken =
    // ignore: lines_longer_than_80_chars
    'pk.eyJ1IjoiY3ViZWNuZWxzb24iLCJhIjoiY2sxa2s5c3ozMG9rYzNjcDVyZ29wMWdkOCJ9.quX4MDcOLJP2YImk2JoXOw';

final LatLngBounds sydneyBounds = LatLngBounds(
  southwest: const LatLng(-34.022631, 150.620685),
  northeast: const LatLng(-33.571835, 151.325952),
);

// ignore: must_be_immutable
class AppMapView extends StatefulWidget {
  late LatLng latLng;

  @override
  State createState() => AppMapViewState();
}

class AppMapViewState extends State<AppMapView> {
  late MapboxMapController mapController;

  // ignore: use_setters_to_change_properties
  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      styleString: 'mapbox://styles/cubecnelson/ckmam57p94q5r17qyrvi9w7j2',
      accessToken: accessToken,
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      myLocationTrackingMode: MyLocationTrackingMode.Tracking,
      myLocationRenderMode: MyLocationRenderMode.NORMAL,
      initialCameraPosition: const CameraPosition(
        target: LatLng(22.2887427, 114.2184066),
        zoom: 15.0,
      ),
      onStyleLoadedCallback: onStyleLoadedCallback,
    );
  }

  void onStyleLoadedCallback() {}
}
