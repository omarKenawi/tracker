import '../models/expenses_model.dart';

abstract class YearlyExpenseState {}

class YearlyExpenseInitial extends YearlyExpenseState {}

class YearlyExpenseLoading extends YearlyExpenseState {}

class YearlyExpenseLoaded extends YearlyExpenseState {
  final YearlyExpense yearlyExpense;
  YearlyExpenseLoaded(this.yearlyExpense);
}

class YearlyExpenseError extends YearlyExpenseState {
  final String error;
  YearlyExpenseError(this.error);
}