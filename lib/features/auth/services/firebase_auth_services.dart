import 'package:firebase_auth/firebase_auth.dart';
import 'package:tracker/features/home/services/local_storage.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final LocalCacheService localCacheService=LocalCacheService();

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occurred: $e");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Some error occurred: $e");
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      await localCacheService.clearYearlyExpense();
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
