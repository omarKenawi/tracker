import 'package:bloc/bloc.dart';

import '../models/expenses_model.dart';
import '../repositories/expense_repository.dart';
import 'expenses_state.dart';
import 'local_storage.dart';

class YearlyExpenseCubit extends Cubit<YearlyExpenseState> {
  final ExpenseRepository expenseRepository;
  final LocalCacheService cacheService;

  YearlyExpenseCubit(this.expenseRepository, this.cacheService) : super(YearlyExpenseInitial()) {
    _loadLocalData();
  }

  Future<void> fetchYearlyExpense() async {
    try {
      emit(YearlyExpenseLoading());
      YearlyExpense? yearlyExpense = await expenseRepository.fetchYearlyExpense();
      if (yearlyExpense != null) {
        await cacheService.saveYearlyExpense(yearlyExpense);
        emit(YearlyExpenseLoaded(yearlyExpense));
      } else {
        emit(YearlyExpenseError("No data found"));
      }
    } catch (e) {
      emit(YearlyExpenseError(e.toString()));
    }
  }

  void _loadLocalData() async {
    final localExpense = await cacheService.getYearlyExpense();
    if (localExpense != null) {
      emit(YearlyExpenseLoaded(localExpense));
    } else {
      emit(YearlyExpenseLoading());
    }
  }
}
