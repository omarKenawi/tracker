import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/expenses_model.dart';

class UserDataService {
  final User? user = FirebaseAuth.instance.currentUser;

  Future<Expense?> getUserData() async {
    if (user == null) return null;

    try {
      String _uid = user!.uid;
      print('_uid');
      print(_uid);
      DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(_uid).get();

      if (userData.exists) {
        // Access user data
        Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
        print('User data: $data');

        // Convert Firestore data to Expenses object
        return Expense.fromMap(data);
      } else {
        print('No user data found');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
