import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/data/response/responses.dart';

import '../../domain/models/enums.dart';
import '../network/api.dart';

abstract class RemoteDataSource {
  Future<void> login({
    required LoginRequest loginRequest,
  });
  Future<User?> signInWithGoogle(GoogleSignInAccount? googleAccount);

  Future<GoogleSignInAccount?> selectGoogleAccount();


  Future<void> resetPassword({
    required String email,
});

  Future<RegisteredBeforeError?> doesUserExists({
    required String email,
  });

  Future<void> saveDoctorToDataBase({
   required String id,
   required String name,
   required String email,
   required String? password,
  });
  Future<Map<String, dynamic>?> getUserData({
    required String email,
  });
  Future<void> saveNurseToDataBase({
   required String id,
   required String name,
   required String email,
   required String? password,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  RemoteDataSourceImpl(
      this._firestore, this._firebaseAuth,);

  @override
  Future<void> login({required LoginRequest loginRequest}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );
  }
  @override
  Future<User?> signInWithGoogle(GoogleSignInAccount? googleAccount) async {
    GoogleSignInAuthentication? googleAuth =
    await googleAccount?.authentication;

    OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  @override
  Future<void> saveDoctorToDataBase({
    required String id,
    required String name,
    required String email,
    required String? password,
  }) async {
    await _firestore.collection('users').doc(id).set({
      'id': id,
      'user_name': name,
      'email': email,
      'user_type': 'doctor',
    });
    if (password != null) {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
  }

  @override
  Future<void> saveNurseToDataBase({
    required String id,
    required String name,
    required String email,
    required String? password,
  }) async {
    await _firestore.collection('users').doc(id).set({
      'id': id,
      'user_name': name,
      'email': email,
      'user_type': 'nurse',

    });
    if (password != null) {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserData({
    required String email,
  }) async {
    Map<String, dynamic>? user;
    await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then(
          (value) {
        user = value.docs.firstOrNull?.data();
      },
    );
    return user;
  }

  @override
  Future<void> resetPassword({required String email}) async{
   await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<GoogleSignInAccount?> selectGoogleAccount() async {
    return await GoogleSignIn().signIn();
  }
  @override
  Future<RegisteredBeforeError?> doesUserExists({
    required String email,
  }) async {
    bool emailUsed = false;
    await _firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get()
        .then(
          (value) {
        if (value.docs.isNotEmpty) {
          emailUsed = true;
        }
      },
    );

    if (emailUsed) {
      return RegisteredBeforeError.emailUsed;
    } else {
      return null;
    }
  }

}
