import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/usecase/register_usecase.dart';
import 'package:zag_nights/presentation/register_screen/states/register_states.dart';

import '../../../domain/models/enums.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';
import '../../common/data_intent/data_intent.dart';
import '../../resources/strings_manager.dart';

class RegistereViewmodel extends BaseCubit
    implements RegisterViewModelOutput, RegisterViewModelInput {
  final RegisteruseCase _registeruseCase;
  late UserRole _registerType;

  RegistereViewmodel(this._registeruseCase);
  static RegistereViewmodel get(BuildContext context) =>
      BlocProvider.of<RegistereViewmodel>(context);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode passwordconfirmationFocusNode = FocusNode();

  final TextEditingController _passwordconfirmationController =
      TextEditingController();

  @override
  TextEditingController get getNameController => _nameController;
  @override
  TextEditingController get getEmailController => _emailController;
  @override
  TextEditingController get getPasswordController => _passwordController;

  @override
  TextEditingController get getPasswordConfirmationController =>
      _passwordconfirmationController;
  User? _fireAuthUser;
  String? _fireAuthUsername;
  String? _fireAuthEmail;

  @override
  void start() {
    _fireAuthUser = DataIntent.getFireAuthUser();
    _fireAuthUsername = _fireAuthUser?.displayName;
    _fireAuthEmail = _fireAuthUser?.email;
    _registerType = DataIntent.getUserRole()!;
    if (_registerType == UserRole.doctor) {
      emit(RegisterDoctorState());
    } else {
      emit(RegisterNurseState());
    }
  }

  Future<void> register() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    await _registeruseCase(
      RegisterUsecaseInput(
        username: _fireAuthUsername ?? _nameController.text.trim(),
        email: _fireAuthEmail ?? _emailController.text.trim(),
        password:
            _fireAuthUser == null ? _passwordController.text.trim() : null,
        userType: _registerType,
      ),
    ).then(
      (value) {
        value.fold(
          (l) {
            emit(
              ErrorState(
                failure: l,
                displayType: DisplayType.popUpDialog,
              ),
            );
          },
          (r) {
            if (_registerType == UserRole.doctor) {
              emit(RegisterDoctorState());
              emit(SuccessState(AppStrings.successOperation.tr()));

            } else {

              emit(RegisterNurseState());
              emit(SuccessState(AppStrings.successOperation.tr()));

            }
          },
        );
      },
    );
  }

  @override
  UserRole get getRegisterType => _registerType;

  @override
  String? get getFireAuthEmail => _fireAuthEmail;

  @override
  User? get getFireAuthUser => _fireAuthUser;

  @override
  String? get getFireAuthUsername => _fireAuthUsername;
}

abstract class RegisterViewModelInput {}

abstract class RegisterViewModelOutput {
  TextEditingController get getNameController;

  TextEditingController get getEmailController;

  TextEditingController get getPasswordController;

  TextEditingController get getPasswordConfirmationController;

  User? get getFireAuthUser;

  String? get getFireAuthUsername;

  String? get getFireAuthEmail;

  UserRole get getRegisterType;
}
