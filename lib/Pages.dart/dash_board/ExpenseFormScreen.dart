import 'package:expense_tracker/Pages.dart/ExpenseList.dart';
import 'package:expense_tracker/Pages.dart/dash_board/header_widget_of_dashboard.dart';
import 'package:expense_tracker/expence_list_bloc/fetch_expense_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models.dart/ExpenseModel.dart';

class ExpenseFormPage extends StatefulWidget {
  static const String pageName = '/ExpenseFormPage';
  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseFormPage> {

  @override
  void initState() {
    super.initState();
    context.read<FetchExpenseListBloc>().add(EventFetchExpenseList());
  }
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue,),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height*0.02,),
               const HeaderWidgetOfDashBoard(),
                 BlocBuilder<FetchExpenseListBloc, FetchExpenseListState>(
                            builder: (context, state) {
                              if (state is FetchExpenseListInitial) {
                                return const Center(child: CircularProgressIndicator(),) ;
                              }
                              else{
                                if (state is FetchExpenseListLoadingState) {
                                  return const Center(child: CircularProgressIndicator(),) ; 
                                }
                                else{
                                  if (state is FetchExpenseListLoadedState) {
                                    return SizedBox(height: height*0.55, width: width*0.95, child: ExpenseList(list: state.list),) ;
                                  }
                                  else{
                                    var errorMessage = (state as FetchExpenseListErrorState).errorMessage;
                                    return Center(child: Text(errorMessage),) ;
                                  }
                                }
                              }
                            },
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
