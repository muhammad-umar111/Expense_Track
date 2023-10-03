 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void createAccountUsingPassword(BuildContext context,String email,String password)async{
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email:email ,
    password: password,
  );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
    // Google SignIn

// signInWithGoogle() async {
//   try {
//      // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//    await FirebaseAuth.instance.signInWithCredential(credential);
//   } catch (e) {
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
//   }
 
// }