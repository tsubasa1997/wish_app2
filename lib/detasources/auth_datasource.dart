import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authDatasourceProvider = Provider((_) => AuthDatasource());

class AuthDatasource {
  final _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> createUser(
      String email,
      String password,
      ) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user != null) {
      FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'id': user.uid,
      });
    }
  }

  Stream<String?> getUid() async* {
    yield* _auth.authStateChanges().map((User? user) {
      if (user == null) {
        return null;
      } else {
        final userCredential = _auth.currentUser;
        final userId = userCredential?.uid;
        return userId;
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

}