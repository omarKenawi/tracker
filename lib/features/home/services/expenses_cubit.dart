import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expenses_model.dart';
import 'expenses_state.dart';
import 'local_storage.dart';

class YearlyExpenseCubit extends Cubit<YearlyExpenseState> {
  final FirebaseFirestore firestore;
  final String userId;
  final LocalCacheService cacheService;

  YearlyExpenseCubit(this.firestore, this.userId, this.cacheService) : super(YearlyExpenseInitial()) {
    _loadLocalData();
  }

  Future<void> fetchYearlyExpense() async {
    try {
      emit(YearlyExpenseLoading());

      DocumentSnapshot doc = await firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        YearlyExpense yearlyExpense = YearlyExpense.fromMap(data['expenses']);


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