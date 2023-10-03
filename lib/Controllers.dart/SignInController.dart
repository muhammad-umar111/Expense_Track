 import 'package:expense_tracker/Pages.dart/dash_board/ExpenseFormScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void signInWithEmailPassword(BuildContext context,String email,String password)async{
  try {
   await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password:password
  ).then((value) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return ExpenseFormPage();
    },));
  });

} on FirebaseAuthException catch (e) {
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
 
}
  }
//    signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

