import 'package:whatsup/models/user/user_model.dart';
import 'package:whatsup/service/firebase/auth/authentication_service.dart';
import 'package:flutter/material.dart';

enum LoginStatus {
  smsVerification,
  authenicated,
  unauthenicated,
}

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({@required AuthenicationService authenicationService}) {
    _authenicationService = authenicationService;
    subscribeToUserChangesFromAuthenicationService(authenicationService);
  }

  AuthenicationService _authenicationService;

  UserModel currUser;

  LoginStatus loginStatus;

  void subscribeToUserChangesFromAuthenicationService(
      AuthenicationService authenicationService) {
    final UserModel user = _authenicationService.getCurrentUser();
    if (user != null) {
      currUser = user;
      loginStatus = LoginStatus.unauthenicated;
    }
    _authenicationService.userStateChanges().listen((userModel) {
      currUser = userModel;
      if (currUser != null) {
        loginStatus = LoginStatus.authenicated;
      } else {
        loginStatus = LoginStatus.unauthenicated;
      }
      notifyListeners();
    });
  }

  Future<void> signInWithGoogle() async {
    final UserModel user = await _authenicationService.signInWithGoogle();
    if (user != null) {
      currUser = user;
      loginStatus = LoginStatus.authenicated;
      notifyListeners();
    }
  }

  Future<void> signInWithFacebook() async {
    final UserModel user = await _authenicationService.signInWithFacebook();
    if (user != null) {
      currUser = user;
      loginStatus = LoginStatus.authenicated;
      notifyListeners();
    }
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await _authenicationService.signInWithPhoneNumber(
        phoneNumber: phoneNumber,
        codeSentCallback: () {
          loginStatus = LoginStatus.smsVerification;
          notifyListeners();
        });
  }

  Future<void> signOut() async {
    await _authenicationService.signOut();
    loginStatus = LoginStatus.unauthenicated;
    notifyListeners();
  }

  Future<void> verifySmsCode(String smsCode) async {
    await _authenicationService.verifySmsCode(smsCode);
  }
}
