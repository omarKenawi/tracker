import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/expenses_model.dart';

class LocalCacheService {
  Future<void> saveYearlyExpense(YearlyExpense expense) async {
    final prefs = await SharedPreferences.getInstance();
    final expenseJson = jsonEncode(expense.toMap());
    print(expenseJson);
    await prefs.setString('yearly_expense', expenseJson);
  }

  Future<YearlyExpense?> getYearlyExpense() async {
    final prefs = await SharedPreferences.getInstance();
    final expenseJson = prefs.getString('yearly_expense');
    if (expenseJson != null) {
      final Map<String, dynamic> expenseMap = jsonDecode(expenseJson);
      return YearlyExpense.fromMap(expenseMap);
    }
    return null;
  }

  Future<void> clearYearlyExpense() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('yearly_expense');
  }
}
