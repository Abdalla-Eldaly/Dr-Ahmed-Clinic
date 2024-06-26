import 'dart:async';
import 'package:zag_nights/domain/usecase/login_usecase.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/common/freeze/freezed_data_class.dart';
import '../../base/base_states.dart';

class LoginViewModel extends BaseCubit
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final LoginUseCase loginUseCase;

  LoginViewModel(this.loginUseCase);

  var loginObject = LoginObject("", "");

  @override
  void start() {}

  void dispose() {
    _userStreamController.close();
    _passwordStreamController.close();
  }

  @override
  Sink get email => _userStreamController.sink;

  @override
  login() async {
    (await loginUseCase.call(LoginUseCaseInput(
            email: loginObject.email, password: loginObject.password)))
        .fold((l) {
      emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));

    }, (r) {

    });
  }

  @override
  Sink get password => _passwordStreamController.sink;

  @override
  setPassword(String password) {
    _passwordStreamController.add(password);
    loginObject = loginObject.copyWith(password: password);
  }

  @override
  setUserName(String email) {
    _userStreamController.add(email);
    loginObject = loginObject.copyWith(email: email);
  }

  @override
  Stream<bool> get getEmail =>
      _userStreamController.stream.map((email) => isValidemail(email));

  @override
  Stream<bool> get getPassword => _passwordStreamController.stream
      .map((password) => isValidPassword(password));

  bool isValidPassword(String password) {
    return password.isNotEmpty;
  }

  bool isValidemail(String email) {
    return email.isNotEmpty;
  }
}

abstract class LoginViewModelInput {
  setUserName(String email);
  setPassword(String password);
  login();
  Sink get email;
  Sink get password;
}

abstract class LoginViewModelOutput {
  Stream<bool> get getEmail;
  Stream<bool> get getPassword;
}
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';

class LoginViewModel extends BaseCubit
    implements LoginViewModelInput, LoginViewModelOutput {
  static LoginViewModel get(BuildContext context) =>
      BlocProvider.of<LoginViewModel>(context);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void start() {}

  @override
  TextEditingController get getEmailController => _emailController;

  @override
  TextEditingController get getPasswordController => _passwordController;


  Future<void> login() async{

  }
}

abstract class LoginViewModelInput {}

abstract class LoginViewModelOutput {
  TextEditingController get getEmailController;
  TextEditingController get getPasswordController;
}
