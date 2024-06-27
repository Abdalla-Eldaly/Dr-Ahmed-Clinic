import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zag_nights/data/network/requests.dart';
import 'package:zag_nights/data/response/responses.dart';

import '../network/api.dart';

abstract class RemoteDataSource {
Future<void> login({
 required String email,required String password});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  final AppServicesClient _appServicesClient;

  RemoteDataSourceImpl(this._firestore, this._firebaseAuth, this._appServicesClient);



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


}
