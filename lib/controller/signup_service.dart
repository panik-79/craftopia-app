import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser({
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // Create user with Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save user data to Firestore with the provided role
      await _firestore.collection('users').doc(userCredential.user?.uid).set({
        'email': email,
        'role': role,
      });
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }
}