import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/domain/usecase/add_patieint_usecase.dart';
import 'package:zag_nights/presentation/base/base_cubit.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/home/viewmodel/states/nurse-home_states.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';

import '../../../../../base/base_states.dart';

class HomeNurseViewModel extends BaseCubit
    implements HomeNurseViewModelInput, HomeNurseViewModelOutput {
  static HomeNurseViewModel get(BuildContext context) =>
      BlocProvider.of<HomeNurseViewModel>(context);

  final AddPatientUseCase _addPatientUseCase;

  HomeNurseViewModel(this._addPatientUseCase);

  final TextEditingController _getPatientName = TextEditingController();

  final TextEditingController _getPatientAge = TextEditingController();

  final TextEditingController _getPatientGender = TextEditingController();

  final TextEditingController _getPatientAddress = TextEditingController();

  final TextEditingController _getPatientPhone = TextEditingController();

  final TextEditingController _getPatientServices = TextEditingController();

  final TextEditingController _getPatientAddressSearch =
      TextEditingController();
  @override
  void start() {}

  Future<void> addPatient() async {
    emit(LoadingState(displayType: DisplayType.popUpDialog));
    await _addPatientUseCase(AddPatientUseCaseInput(
        _getPatientName.text.toLowerCase().trim(),
        _getPatientAge.text,
        _getPatientPhone.text,
        _getPatientGender.text,
        _getPatientAddress.text.toLowerCase().trim(),
        _getPatientServices.text.toLowerCase().trim())).then(
          (value) {
        value.fold(
              (l) {
            emit(ErrorState(failure: l, displayType: DisplayType.popUpDialog));
          },
              (r) {
                emit(StopLoadingState());
            emit(SuccessState(AppStrings.addPatientMessage.tr()));

            _getPatientName.clear();

            _getPatientAge.clear();

            _getPatientPhone.clear();

            _getPatientGender.clear();

            _getPatientAddress.clear();

            _getPatientServices.clear();

          },
        );
      },
    );
  }

  @override
  TextEditingController get getPatientAddress => _getPatientAddress;

  @override
  TextEditingController get getPatientAge => _getPatientAge;

  @override
  TextEditingController get getPatientGender => _getPatientGender;

  @override
  TextEditingController get getPatientName => _getPatientName;

  @override
  TextEditingController get getPatientPhone => _getPatientPhone;

  @override
  TextEditingController get getPatientServices => _getPatientServices;

  @override
  TextEditingController get getPatientAddressSearch => _getPatientAddressSearch;
}

abstract class HomeNurseViewModelInput {}

abstract class HomeNurseViewModelOutput {
  TextEditingController get getPatientName;

  TextEditingController get getPatientAge;

  TextEditingController get getPatientGender;

  TextEditingController get getPatientAddress;

  TextEditingController get getPatientPhone;

  TextEditingController get getPatientServices;

  TextEditingController get getPatientAddressSearch;
}
