import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/setting_screen/view/widgets/nurse_setting_body.dart';

import '../../../../../../app/sl.dart';
import '../../../../../base/base_states.dart';
import '../../../../../resources/routes_manager.dart';
import '../../../../viewmodel/nurse_viewmodel.dart';
import '../../../../viewmodel/states/nurse_states.dart';

class NurseSettingScreen extends StatelessWidget {
  const NurseSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NurseViewModel(sl(),sl())..start(),
      child: BlocConsumer<NurseViewModel, BaseStates>(
        listener: (context, state) {
          if (state is LogoutState) {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, Routes.loginRoute);
          }
        },
        builder: (context, state) {
          return NurseSettingBody(viewModel: NurseViewModel.get(context));
        },
      ),
    );
  }
}
