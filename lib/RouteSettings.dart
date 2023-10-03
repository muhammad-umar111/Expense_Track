import 'package:expense_tracker/AuthenticationPage.dart/SignUp.dart';
import 'package:expense_tracker/Pages.dart/dash_board/ExpenseFormScreen.dart';
import 'package:flutter/material.dart';
import 'AuthenticationPage.dart/SignIn.dart';

Route generateRoute(RouteSettings settings){
  
    if(settings.name==SignInPage.pageName){
    return MaterialPageRoute(builder: (context) {
      return const SignInPage();
    },);
  }else if (settings.name==ExpenseFormPage.pageName){
  return MaterialPageRoute(builder: (context) {
      return  ExpenseFormPage();
    },);
  }
  else{
    return   MaterialPageRoute(builder: (context) {
      return  SignUPPage();
    },);;
  }
}