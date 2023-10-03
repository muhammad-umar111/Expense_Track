import 'package:expense_tracker/Pages.dart/dash_board/ad_capital_amount.dart';
import 'package:expense_tracker/Pages.dart/dash_board/ad_expense_dialog.dart';
import 'package:flutter/material.dart';

class HeaderWidgetOfDashBoard extends StatelessWidget {
  const HeaderWidgetOfDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height*0.3, width: width*0.95, decoration: BoxDecoration(color: Colors.blueGrey,borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.blue)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,crossAxisAlignment: CrossAxisAlignment.end,children: [
    ElevatedButton(onPressed: () {
       showDialog(context: context, builder: (context) {
           return  SizedBox(
            height: height*0.4,
            width: width*0.9,
            child: const AdExpenseDialog()) ;
         }, );
    }, child:const Text('Add Expense')),
       SizedBox(height: height*0.1,),
       ElevatedButton(onPressed: () {
           showDialog(context: context, builder: (context) {
           return AdCapitalAmountDialog();
         },);
       }, child:const Text('Add Amount'))
    ]),
    ) ;
  }
}