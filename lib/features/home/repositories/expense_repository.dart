import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/expenses_model.dart';

class ExpenseRepository {
  final FirebaseFirestore firestore;
  final String userId;

  ExpenseRepository({required this.firestore, required this.userId});

  Future<YearlyExpense?> fetchYearlyExpense() async {
    try {
        DocumentSnapshot doc = await firestore.collection('users').doc(userId).get();
      if (doc.exists) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          YearlyExpense yearlyExpense = YearlyExpense.fromMap(data['expenses']);
        return yearlyExpense;
      }
    } catch (e) {
      print("Error fetching data: $e");
    }
    return null;
  }
}
