import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/base_states.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/home/view/nurse_home_screen.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/nurse_body.dart';

import 'package:zag_nights/presentation/resources/color_manager.dart';
import 'package:zag_nights/presentation/resources/font_manager.dart';
import 'package:zag_nights/presentation/resources/text_styles.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';
import '../../../app/sl.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../viewmodel/nurse_viewmodel.dart';
import '../viewmodel/states/nurse_states.dart';

class NurseMainLayOutScreen extends StatefulWidget {
  const NurseMainLayOutScreen({super.key});

  @override
  State<NurseMainLayOutScreen> createState() => _NurseMainLayOutScreenState();
}

class _NurseMainLayOutScreenState extends State<NurseMainLayOutScreen> {
  int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        toolbarHeight: AppSize.s2,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: ColorManager.gray,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width * .4,
        child: FloatingActionButton(
          backgroundColor: ColorManager.tertiary.withOpacity(.6),
          onPressed: () {
            Navigator.pushNamed(context, Routes.nurseHomeScreenRoute);

            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const NurseHomeScreen();
            // },));
          },
          child: FittedBox(
              child: Text(
            AppStrings.addPatient.tr(),
            style: AppTextStyles.generalTextStyle(
                context, ColorManager.gray, FontSize.f22),
          )),
        ),
      ),
      body: BlocProvider(
        create: (_) => NurseViewModel(sl())..start(),
        child: BlocConsumer<NurseViewModel, BaseStates>(
          listener: (context, state) {
            if (state is LogoutState) {
              Navigator.pop(context);
              Navigator.pushReplacementNamed(context, Routes.loginRoute);
            }
          },
          builder: (context, state) {
            return NurseScreenBody(viewModel: NurseViewModel.get(context));
          },
        ),
      ),

    );
  }
}
