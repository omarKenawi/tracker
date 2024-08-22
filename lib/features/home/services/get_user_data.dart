import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final User? user = FirebaseAuth.instance.currentUser;

Future<void> getUserData() async {
  if (user == null) return;

  try {
    String _uid = user!.uid;
    print('_uid');
    print(_uid);
    DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(_uid).get();

    if (userData.exists) {
      // Access user data
      Map<String, dynamic> data = userData.data() as Map<String, dynamic>;
      print('User data: $data');
    } else {
      print('No user data found');
    }
  } catch (e) {
    print('Error fetching user data: $e');
  }
}
