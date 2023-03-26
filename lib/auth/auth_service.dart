import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/home_page.dart';
import 'package:login_app/pages/welocome_page.dart';

class AuthService {
  //handle auth state
  handleAuthState() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return const HomePage();
        } else {
          return const WelcomePage();
        }
      },
    );
  }

  //sign in with google
  signInWithGoogle() async {
    //trigger authentication
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    //get auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    //create new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    //after sign in return user credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  //sign out
  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
