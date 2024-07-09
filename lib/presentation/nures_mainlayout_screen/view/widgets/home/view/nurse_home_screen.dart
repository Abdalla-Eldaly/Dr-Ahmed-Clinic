import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/home/view/widgets/home_body.dart';
import '../../../../../../app/sl.dart';
import '../../../../../base/base_states.dart';
import '../../../../../base/cubit_builder.dart';
import '../../../../../base/cubit_listener.dart';
import '../../../../../resources/strings_manager.dart';
import '../viewmodel/home_nurse_viewmodel.dart';
import '../viewmodel/states/nurse-home_states.dart';

class NurseHomeScreen extends StatelessWidget {
  const NurseHomeScreen({super.key, });

  static final genderList = [
    AppStrings.patientMale.tr(),
    AppStrings.patientFemale.tr(),
  ];
  static final servicesList = [
    AppStrings.patientServices1,
    AppStrings.patientServices2,
    AppStrings.patientServices3,
    AppStrings.patientServices4,
    AppStrings.patientServices5,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => HomeNurseViewModel(sl())..start(),
        child: BlocConsumer<HomeNurseViewModel, BaseStates>(
          listener: (context, state) {
            if (state is ErrorState) {
              Navigator.pop(context);
            }

            else if (state is StopLoadingState) {
              Navigator.pop(context);
            }

            baseListener(context, state);
          },
          builder: (context, state) {
            return baseBuilder(
              context,
              state,
              NurseHomeBody(
                viewModel: HomeNurseViewModel.get(context),
              ),
            );
          },
        ),
      ),
    );
  }
}
