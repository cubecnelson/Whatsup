import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseInit extends StatefulWidget {
  const FirebaseInit({@required this.child});
  final Widget child;

  @override
  _FirebaseInitState createState() => _FirebaseInitState();
}

class _FirebaseInitState extends State<FirebaseInit> {
  bool _initialized = false;
  String _error;

  Future<void> initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (err) {
      setState(() {
        _error = '$err';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (_error != null) {
      return Center(child: Text(_error));
    }
    if (!_initialized) {
      return const Center(child: CircularProgressIndicator());
    }

    return widget.child;
  }
}
