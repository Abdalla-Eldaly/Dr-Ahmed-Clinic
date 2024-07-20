import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/patient_screen/viewmodel/patient_viewmodel.dart';

import '../../../../../../../app/sl.dart';
import '../../../../../../../domain/models/model.dart';
import '../../../../../../base/base_states.dart';
import '../../../../../../resources/assets_manager.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/values_manager.dart';
import '../../../../../viewmodel/nurse_viewmodel.dart';

class PatientBodyScreen extends StatelessWidget {
  const PatientBodyScreen({super.key, required this.viewModel,});
  final PatientViewModel viewModel ;

  @override
  Widget build(BuildContext context) {
    PatientViewModel viewModel = PatientViewModel.get(context);
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s100,
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: (context.width() - AppSize.s62) * .2,
                            child: const Center(
                              child: CircleAvatar(
                                backgroundColor: ColorManager.lightGreen,
                                radius: AppSize.s8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.s20),
            StreamBuilder<List<PatientModel>>(
              stream: viewModel.getPatientStream,
              builder: (context, patientsSnapshot) {
                if (patientsSnapshot.hasData && patientsSnapshot.data!.isNotEmpty) {
                  print("Received data: ${patientsSnapshot.data}"); // Debug print
                  print("Received data length: ${patientsSnapshot.data!.length}"); // Debug print
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: patientsSnapshot.data!.length,
                    itemBuilder: (context, index) {
                      PatientModel patient = patientsSnapshot.data![index];
                      return Text(patient.name);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: AppSize.s20);
                    },
                  );
                } else if (patientsSnapshot.hasData) {
                  return Lottie.asset(LottieAssets.empty);
                } else if (patientsSnapshot.hasError) {
                  return Lottie.asset(LottieAssets.error, repeat: false);
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p50),
                    child: Lottie.asset(LottieAssets.loading),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
