import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:whatsup/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenicationService {
  AuthenicationService._newInstance();

  static final AuthenicationService _instance =
      AuthenicationService._newInstance();

  static AuthenicationService get instance => _instance;

  String phoneVerificationId;

  UserModel getCurrentUser() {
    if (FirebaseAuth.instance.currentUser == null) return null;
    return loadUserModel(FirebaseAuth.instance.currentUser.uid);
  }

  Stream<UserModel> userStateChanges() {
    return FirebaseAuth.instance.authStateChanges().asyncMap((user) {
      if (user == null) {
        return null;
      }
      return loadUserModel(user.uid);
    });
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<UserModel> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    final UserCredential user =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return loadUserModel(user.user.uid);
  }

  Future<void> signInWithPhoneNumber(
      {String phoneNumber, Function codeSentCallback}) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+852$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        phoneVerificationId = verificationId;
        codeSentCallback();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<UserModel> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    final UserCredential user = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);

    return loadUserModel(user.user.uid);
  }

  Future<void> verifySmsCode(String smsCode) async {
    if (phoneVerificationId == null || smsCode == null) {
      throw Error();
    }

    // Create a PhoneAuthCredential with the code
    final AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: phoneVerificationId, smsCode: smsCode);

    // Sign the user in (or link) with the credential
    await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
  }

  UserModel loadUserModel(String uid) {
    // TODO: load the user by id
    return UserModel(
      id: uid,
      lastName: 'Cheung',
      firstName: 'Nelson',
      phoneNumber: 'xxxx-xxxx',
      email: 'email',
    );
  }
}
