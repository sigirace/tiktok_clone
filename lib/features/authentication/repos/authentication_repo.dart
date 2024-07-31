import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user {
    return _firebaseAuth.currentUser;
  }

  bool get isLoggedIn {
    return user != null;
  }

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  Future<void> signUp(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}

final authRepo = Provider(
  (ref) {
    return AuthenticationRepository();
  },
);

final authState = StreamProvider(
  (ref) {
    final repo = ref.read(authRepo);
    return repo.authStateChanges();
  },
);
