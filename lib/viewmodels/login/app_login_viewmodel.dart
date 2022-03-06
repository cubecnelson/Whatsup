import 'package:flutter/material.dart';
import 'package:whatsup/models/user/user_model.dart';
import 'package:whatsup/service/firebase/auth/authentication_service.dart';

enum AppLoginStatus {
  smsVerification,
  authenicated,
  unauthenicated,
}

class AppLoginViewModel extends ChangeNotifier {
  AppLoginViewModel({required AuthenicationService authenicationService}) {
    _authenicationService = authenicationService;
    subscribeToUserChangesFromAuthenicationService();
  }

  late AuthenicationService _authenicationService;

  late UserModel? currUser;

  late AppLoginStatus loginStatus;

  void subscribeToUserChangesFromAuthenicationService() async {
    final UserModel? user = await _authenicationService.getCurrentUser();
    currUser = user;
    loginStatus = AppLoginStatus.unauthenicated;
    _authenicationService.userStateChanges().listen((userModel) {
      currUser = userModel;
      if (currUser != null) {
        loginStatus = AppLoginStatus.authenicated;
      } else {
        loginStatus = AppLoginStatus.unauthenicated;
      }
      notifyListeners();
    });
  }

  Future<void> signInWithGoogle() async {
    final UserModel user = await _authenicationService.signInWithGoogle();
    currUser = user;
    loginStatus = AppLoginStatus.authenicated;
    notifyListeners();
  }

  Future<void> signInWithFacebook() async {
    final UserModel user = await _authenicationService.signInWithFacebook();
    currUser = user;
    loginStatus = AppLoginStatus.authenicated;
    notifyListeners();
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _authenicationService.signInWithPhoneNumber(
      phoneNumber: phoneNumber,
      codeSentCallback: () {
        loginStatus = AppLoginStatus.smsVerification;
        notifyListeners();
      },
    );
  }

  Future<void> signOut() async {
    await _authenicationService.signOut();
    loginStatus = AppLoginStatus.unauthenicated;
    notifyListeners();
  }

  Future<void> verifySmsCode(String smsCode) async {
    await _authenicationService.verifySmsCode(smsCode);
  }
}
