import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/patient_screen/view/widgets/patient_screen_body.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/nurse_viewmodel.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/nurse_viewmodel.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/nurse_viewmodel.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/nurse_viewmodel.dart';
import 'package:zag_nights/presentation/resources/routes_manager.dart';

import '../../../../../../app/sl.dart';
import '../../../../../../domain/models/model.dart';
import '../../../../../base/base_states.dart';
import '../../../../../base/cubit_builder.dart';
import '../../../../../base/cubit_listener.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/font_manager.dart';
import '../../../../../resources/styles_manager.dart';
import '../../../../../resources/values_manager.dart';
import '../viewmodel/patient_viewmodel.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () {
        Navigator.pop(context);
      }, icon: Icon(Icons.arrow_forward)),
       ),
      body: SizedBox(
        width: AppSize.infinity,
        height: AppSize.infinity,
        child: BlocProvider(
          create: (context) => PatientViewModel()..start(),
          child: BlocConsumer<PatientViewModel, BaseStates>(
            listener: (context, state) {
              PatientViewModel viewModel = PatientViewModel.get(context);

               if (state is SuccessState) {
                Navigator.pop(context);
              }
              baseListener(context, state);
            },
            builder: (context, state) {
              return baseBuilder(context, state,  PatientBodyScreen(viewModel: PatientViewModel.get(context)));
            },
          ),
        ),
      ),
    );
  }
}
