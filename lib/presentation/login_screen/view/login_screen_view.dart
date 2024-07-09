import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../app/sl.dart';
import '../../base/base_states.dart';
import '../../base/cubit_builder.dart';
import '../../base/cubit_listener.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/text_styles.dart';
import '../states/login_states.dart';
import '../viewmodel/login_viewmodel.dart';
import 'widgets/login_body.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => LoginViewModel(sl(),sl(),sl() ,sl())..start(),
        child: BlocConsumer<LoginViewModel, BaseStates>(
          listener: (context, state) {
            if(state is ErrorState){
              Navigator.pop(context);
            }
           else if(state is DoctorLoginState){
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.doctorMainLayoutRoute,
                ModalRoute.withName('/'),
              );
            }

            else if(state is NurseLoginState){
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.nurseMainLayoutRoute,
                ModalRoute.withName('/'),
              );
            }

            else if (state is SocialLoginState) {
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.selectionRoute);
            }
            else if (state is ResetPasswordState) {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: ColorManager.primary,
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(LottieAssets.success),
                        Text(
                          'Password reset link sent! check your email',
                          style: AppTextStyles.baseStatesMessageTextStyle(
                              context, ColorManager.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              );
            }

            baseListener(context, state);
          },
          builder: (context, state) {
            return baseBuilder(
              context,
              state,
              LoginBody(
                viewModel: LoginViewModel.get(context),
              ),
            );
          },
        ),
      ),
    );
  }
}