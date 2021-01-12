import 'package:Whatsup/models/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenication {
  static Stream<UserModel> userStateChanges() {
    return FirebaseAuth.instance.authStateChanges().asyncMap((user) {
      if (user == null) {
        return null;
      }
      return loadUserModel(user.uid);
    });
  }

  static Future<UserCredential> signInWithGoogle() async {
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
    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  static Future<void> signInWithPhoneNumber(String phoneNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  static UserModel loadUserModel(String uid) {
    // TODO: load the user by id
    return UserModel(
        id: uid,
        lastName: 'Cheung',
        firstName: 'Nelson',
        phoneNumber: 'xxxx-xxxx',
        email: 'email');
  }
}
