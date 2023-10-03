  import 'dart:math';

import 'package:expense_tracker/Controllers.dart/firebaseService.dart';
import 'package:expense_tracker/Models.dart/ExpenseModel.dart';
import 'package:expense_tracker/Utils.dart/randomIdGenerator.dart';

FirebaseService firebaseService=FirebaseService();


  void submitForm(String title,double amount,String description,String dateTime,String category) {
    
firebaseService.uploadExpence(
  ExpenseModel(id:generateRandomId() ,
   title: title, 
   amount: amount,
    date: dateTime, 
    description: description,
     category: category));
      // Save the expense to Firebase
      // You would need to implement Firebase code here
  }
