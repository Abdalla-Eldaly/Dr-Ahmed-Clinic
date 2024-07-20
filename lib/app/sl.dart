import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zag_nights/domain/usecase/add_patieint_usecase.dart';
import 'package:zag_nights/domain/usecase/get_patients_usecase.dart';
import '../data/data_source/cache_data_source.dart';
import '../data/data_source/local_data_source.dart';
import '../data/data_source/remote_data_source.dart';
import '../data/data_source/runtime_data_source.dart';
import '../data/network/api.dart';
import '../data/network/app_prefs.dart';
import '../data/network/assets_loader.dart';
import '../data/network/dio_factory.dart';
import '../data/network/fireaut_factory.dart';
import '../data/network/firestore_factory.dart';
import '../data/network/network_info.dart';
import '../data/repository/repository_impl.dart';
import '../domain/repository/repository.dart';

import '../domain/usecase/get_current_user_usecase.dart';
import '../domain/usecase/get_signeduser_usecase.dart';
import '../domain/usecase/login_usecase.dart';

import '../domain/usecase/logout_usecase.dart';
import '../domain/usecase/register_usecase.dart';
import '../domain/usecase/resetPassword_usecase.dart';
import '../domain/usecase/sign_in_with_google_usecase.dart';
import '../presentation/common/data_intent/data_intent.dart';
import 'date_ntp.dart';

final sl = GetIt.instance;

Future<void> initAppModule() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<DateNTP>(() => DateNTPImpl());
  sl.registerLazySingleton<AppPrefs>(() => AppPrefsImpl(sharedPreferences));

  sl.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnection()));

  // sl.registerLazySingleton<GSheetFactory>(() => GSheetFactoryImpl());
  sl.registerLazySingleton<UserManager>(() => UserManager());

  sl.registerLazySingleton<AssetsLoader>(() => AssetsLoaderImpl());

  var dio = await DioFactory().getDio();
  sl.registerLazySingleton<Dio>(() => dio);

  var firestore = await FirestoreFactoryImpl().create();
  sl.registerLazySingleton<FirebaseFirestore>(() => firestore);

  var fireAuth = await FireAuthFactoryImpl().create();
  sl.registerLazySingleton<FirebaseAuth>(() => fireAuth);

  sl.registerLazySingleton<GetCurrentUserUseCase>(() => GetCurrentUserUseCase(sl()));


  sl.registerLazySingleton<AppServicesClient>(() => AppServiceClientImpl(sl()));
  sl.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(sl(), sl(), ));
  sl.registerLazySingleton<RuntimeDataSource>(() => RuntimeDataSourceImpl());
  sl.registerLazySingleton<CacheDataSource>(
        () => CacheDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(sl(), sl(), sl(),sl()));
}




void initLoginUseCase() {
  if (GetIt.instance.isRegistered<LoginUseCase>() == false) {
    sl.registerFactory<LoginUseCase>(() => LoginUseCase(sl()));
  }
}
void initRegisterUseCase() {
  if (GetIt.instance.isRegistered<RegisteruseCase>() == false) {
    sl.registerFactory<RegisteruseCase>(() => RegisteruseCase(sl()));
  }
}
void initPasswordResetUseCase() {
  if (GetIt.instance.isRegistered<ResetPasswordUseCase>() == false) {
    sl.registerFactory<ResetPasswordUseCase>(() => ResetPasswordUseCase(sl()));
  }
}
void initGetSignedUserUseCase() {
  if (GetIt.instance.isRegistered<GetSignedUserUseCase>() == false) {
    sl.registerFactory<GetSignedUserUseCase>(() => GetSignedUserUseCase(sl()));
  }
}
void initSignWithGoogleUseCase() {
  if (GetIt.instance.isRegistered<SignWithGoogleUseCase>() == false) {
    sl.registerFactory<SignWithGoogleUseCase>(
            () => SignWithGoogleUseCase(sl()));
  }
}

void initLogOutUseCase() {
  if (GetIt.instance.isRegistered<LogoutUseCase>() == false) {
    sl.registerFactory<LogoutUseCase>(() => LogoutUseCase(sl()));
  }
}
void initAddPatientUseCase() {
  if (GetIt.instance.isRegistered<AddPatientUseCase>() == false) {
    sl.registerFactory<AddPatientUseCase>(() => AddPatientUseCase(sl()));
  }
}
void initGetPatientUseCase() {
  if (GetIt.instance.isRegistered<GetAllPatientUseCase>() == false) {
    sl.registerFactory<GetAllPatientUseCase>(() => GetAllPatientUseCase(sl()));
  }
}