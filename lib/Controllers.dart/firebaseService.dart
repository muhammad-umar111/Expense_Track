import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Models.dart/ExpenseModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  FirebaseFirestore firestore=FirebaseFirestore.instance;

  Future<void> uploadExpence(ExpenseModel expense) async {
   await firestore.collection('Expense').doc().set(
    {
      'id':expense.id,
      'title': expense.title,
      'amount': expense.amount,
      'date':expense.date,
      'description':expense.description,
      'category':expense.category,

    }
    , SetOptions(merge: true));
  }

 Future<List<ExpenseModel>> getExpenses() async {
    List<ExpenseModel> list = [];
   await firestore.collection('Expense').get().then((value) {
      for (var i = 0; i < value.docs.length; i++) {
        list.add(ExpenseModel.fromMap(value.docs[i].data()));
      }
    } );
    return list;
  }

  uploadCapitalAmount(String capitalAmount) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
   var email= preferences.getString('email');
   await firestore.collection('Capital Amount').doc(email).set(
     {
      'capitalAmount':capitalAmount
     }, SetOptions(merge: true));
  }
}