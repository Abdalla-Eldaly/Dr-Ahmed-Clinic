import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zag_nights/presentation/base/cubit_builder.dart';
import 'package:zag_nights/presentation/register_screen/view/widgets/register_body.dart';
import 'package:zag_nights/presentation/register_screen/viewmodel/register_viewmodel.dart';

import '../../../app/sl.dart';
import '../../base/base_states.dart';
import '../../base/cubit_listener.dart';
import '../../resources/routes_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) => RegistereViewmodel(sl(), )..start(),

          child: BlocConsumer<RegistereViewmodel, BaseStates>(
            listener: (context, state) {
              if (state is ErrorState) {
                Navigator.pop(context);
              } else if (state is SuccessState) {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.mainLayoutRoute,
                  ModalRoute.withName('/'),
                );
              }
              baseListener(context, state);
            },
            builder: (context, state) {
              return baseBuilder(context, state, RegisterBody(viewModel: RegistereViewmodel.get(context),) );
            },
          )),
    );
  }
}
