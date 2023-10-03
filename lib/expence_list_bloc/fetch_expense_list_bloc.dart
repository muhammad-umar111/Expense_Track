import 'package:bloc/bloc.dart';
import 'package:expense_tracker/Controllers.dart/firebaseService.dart';
import 'package:expense_tracker/Models.dart/ExpenseModel.dart';
import 'package:meta/meta.dart';

part 'fetch_expense_list_event.dart';
part 'fetch_expense_list_state.dart';

class FetchExpenseListBloc extends Bloc<FetchExpenseListEvent, FetchExpenseListState> {
  FetchExpenseListBloc() : super(FetchExpenseListInitial()) {
    on<EventFetchExpenseList>((event, emit) async {
      try {
        emit(FetchExpenseListLoadingState());
        var list = await FirebaseService().getExpenses();
        emit(FetchExpenseListLoadedState(list: list));
      } catch (e) {
        emit(FetchExpenseListErrorState(errorMessage: e.toString()));
      }
    });
  }
}
