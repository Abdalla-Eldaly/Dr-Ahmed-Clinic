import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/data/response/responses.dart';

import '../network/api.dart';

abstract class RemoteDataSource {
  Future<bool> getAppStatus();

  Future<void> registerToDataBase({
    required String firstName,
    required String lastName,
    required String gender,
    required int age,
    required String email,
    required String phoneNumber,
    required String job,
    required DateTime createdAt,
  });

  Future<AuthenticationResponse> loginwithApi(LoginRequest loginRequest);

  Future<void> registerToAuth({
    required String email,
    required String password,
  });

  // Future<bool> isUserInDataBase(String email);

  Future<void> login({
    required String email,
    required String password,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(this._firestore, this._firebaseAuth, this._appServicesClient);

  @override
  Future<bool> getAppStatus() async {
    late bool appStatus;
    await _firestore
        .collection('GlobalVariables')
        .doc('variables')
        .get()
        .then((value) {
      appStatus = value.data()?['appStatus'];
    });
    return appStatus;
  }

  @override
  Future<void> registerToDataBase({
    required String firstName,
    required String lastName,
    required String gender,
    required int age,
    required String email,
    required String phoneNumber,
    required String job,
    required DateTime createdAt,
  }) async {
    await _firestore.collection('users').doc(email).set({
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'age': age,
      'email': email,
      'phone_number': phoneNumber,
      'job': job,
      'created_at': createdAt,
    });
  }

  @override
  Future<void> registerToAuth({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> login({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<AuthenticationResponse> loginwithApi(LoginRequest loginRequest)async {
  return await _appServicesClient.login(loginRequest.email, loginRequest.password);
  }
}
