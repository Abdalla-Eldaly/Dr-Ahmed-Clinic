import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/data/response/responses.dart';

import '../network/api.dart';

abstract class RemoteDataSource {
  Future<void> login({
    required LoginRequest loginRequest,
  });

  Future<void> resetPassword({
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
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(
      this._firestore, this._firebaseAuth, this._appServicesClient);

  @override
  Future<void> login({required LoginRequest loginRequest}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: loginRequest.email,
      password: loginRequest.password,
    );
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
}
