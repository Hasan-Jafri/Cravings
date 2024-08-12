import "package:firebase_auth/firebase_auth.dart";

class AuthService {
  // get instance of firebaseauth
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;
  // get current user
  User? getCurrentUser() {
    return _fireBaseAuth.currentUser;
  }

  // sign in
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      // Sign user in
      UserCredential userCredential = await _fireBaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // Catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      // Sign user up
      UserCredential userCredential = await _fireBaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    }
    // Catch errors
    on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // logout
  Future<void> signOut() async {
    return await _fireBaseAuth.signOut();
  }
}
