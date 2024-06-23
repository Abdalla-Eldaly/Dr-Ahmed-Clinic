import 'package:firebase_auth/firebase_auth.dart';

import '../../app/date_ntp.dart';
import '../network/app_prefs.dart';

// const String _onBoardingFirstTimeKey = "onBoardingFirstTimeKey";

abstract class CacheDataSource {

  // Future<bool> getOnBoardingFirstTime();
  User? getSignedUser();

  Future<void> logout();

}

class CacheDataSourceImpl implements CacheDataSource {
  // final AppPrefs _preferences;
  // final DateNTP _dateNTP;
  final FirebaseAuth _firebaseAuth;

  CacheDataSourceImpl(/*this._preferences, this._dateNTP, */this._firebaseAuth);

  @override
  User? getSignedUser() {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }



  // @override
  // Future<void> setOnBoardingFirstTime() async {
  //   await _preferences.setBool(_onBoardingFirstTimeKey, true);
  // }

}
