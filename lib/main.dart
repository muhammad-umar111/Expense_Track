import 'package:expense_tracker/AuthenticationPage.dart/SignUp.dart';
import 'package:expense_tracker/Pages.dart/dash_board/ExpenseFormScreen.dart';
import 'package:expense_tracker/RouteSettings.dart';
import 'package:expense_tracker/expence_list_bloc/fetch_expense_list_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => FetchExpenseListBloc(),)],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: generateRoute,
        initialRoute:SignUPPage.pageName
      ),
    );
  }
}


