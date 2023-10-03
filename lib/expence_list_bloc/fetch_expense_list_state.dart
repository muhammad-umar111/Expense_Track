part of 'fetch_expense_list_bloc.dart';

@immutable
sealed class FetchExpenseListState {}

final class FetchExpenseListInitial extends FetchExpenseListState {}

final class FetchExpenseListLoadingState extends FetchExpenseListState{}

final class FetchExpenseListLoadedState extends FetchExpenseListState{
  final List<ExpenseModel> list;
  FetchExpenseListLoadedState({required this. list});
}


final class FetchExpenseListErrorState extends FetchExpenseListState{
  final String errorMessage;
  FetchExpenseListErrorState({required this.errorMessage});

}

