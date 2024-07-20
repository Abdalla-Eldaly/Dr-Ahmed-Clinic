import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zag_nights/data/network/requests.dart';

import '../../domain/models/enums.dart';

abstract class RemoteDataSource {
  Future<void> login({
    required LoginRequest loginRequest,
  });

  Future<void> addPatient({
    required PatientRequest patientRequest,
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

  Future<Stream<List<Map<String, dynamic>>>> getPatientDataByDate({
    required DateTime date,
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  RemoteDataSourceImpl(
    this._firestore,
    this._firebaseAuth,
  );

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
  Future<void> resetPassword({required String email}) async {
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

  @override
  Future<void> addPatient({required PatientRequest patientRequest}) async {
    await _firestore.collection('patients').doc(patientRequest.uid).set({
      'uid': patientRequest.uid,
      'name': patientRequest.name,
      'age': patientRequest.age,
      'phone': patientRequest.phone,
      'gender': patientRequest.gender,
      'address': patientRequest.address,
      'services': patientRequest.services,
      'create_At': DateTime.now(),
    });
  }

  @override
  Future<Stream<List<Map<String, dynamic>>>> getPatientDataByDate({
    required DateTime date,
  }) async {
    // Define the start and end timestamps for the date range
    DateTime startOfDay = DateTime(date.year, date.month, date.day, 0, 0, 0); // 12 AM
    DateTime endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59, 999, 999); // 11:59:59.999 PM

    // Convert DateTime to Timestamp
    Timestamp startTimestamp = Timestamp.fromDate(startOfDay);
    Timestamp endTimestamp = Timestamp.fromDate(endOfDay);



    return _firestore
        .collection('patients')
        .where('create_At', isGreaterThanOrEqualTo: startTimestamp)
        .where('create_At', isLessThan: endTimestamp)
        .snapshots()
        .map(
          (querySnapshot) {

        return querySnapshot.docs
            .map(
              (doc) {

            return doc.data();
          },
        )
            .toList();
      },
    );
  }


}
