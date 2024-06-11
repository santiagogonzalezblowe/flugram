import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  AuthenticationRepository(
    this._firebaseAuth,
    this._googleSignIn,
    this._firestore,
  );

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();

    final googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final userCredential = await _firebaseAuth.signInWithCredential(credential);

    final user = userCredential.user;

    if (user == null) throw Exception('Google sign in failed');

    await _createUserData(user);
  }

  Future<UserCredential> signInWithApple() async {
    throw UnimplementedError();
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    final userCredentials = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredentials.user;

    if (user == null) throw Exception('User creation failed');

    await _createUserData(user);
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();
  }

  Future<void> _createUserData(User user) async {
    final userDoc = _firestore.collection('users').doc(user.uid);
    final userSnapshot = await userDoc.get();

    if (!userSnapshot.exists) {
      await userDoc.set(
        {
          'email': user.email,
          'name': user.displayName,
          'photoUrl': user.photoURL,
          'flugrams': [],
        },
      );
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;
}
