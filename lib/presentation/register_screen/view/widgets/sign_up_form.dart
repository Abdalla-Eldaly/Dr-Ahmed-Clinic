// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:zag_nights/app/App_Defults.dart';
// import 'package:zag_nights/presentation/common/validators/validators.dart';
// import 'package:zag_nights/presentation/common/widget/main_text_field.dart';
// import 'package:zag_nights/presentation/login_screen/view/widgets/login_page_form.dart';
// import 'package:zag_nights/presentation/resources/strings_manager.dart';
// import 'package:zag_nights/presentation/resources/values_manager.dart';
// import 'sign_up_button.dart';
//
// class SignUpForm extends StatelessWidget {
//   const SignUpForm({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(AppMargin.m16),
//       padding: const EdgeInsets.all(AppPadding.p14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: AppDefults.boxShadow,
//         borderRadius: AppDefults.borderRadius,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Name"),
//           const SizedBox(height: 8),
//           TextFormField(
//             textInputAction: TextInputAction.next,
//           ),
//           const SizedBox(height: AppPadding.p14),
//           const Text("E-Mail"),
//           const SizedBox(height: 8),
//           TextFormField(
//             textInputAction: TextInputAction.next,
//             keyboardType: TextInputType.emailAddress,
//             inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//           ),
//           const SizedBox(height: AppPadding.p14),
//           const Text("Password"),
//           const SizedBox(height: 8),
//           MainTextField(
//             maxLines: 1,
//             focusNode: LoginPageForm.passwordFocusNode,
//             validation: AppValidators.validateLogin,
//             isObscured: true,
//             hint: AppStrings.registerScreenPasswordHint.tr(),
//             iconData: Icons.remove_red_eye_outlined,
//             textInputType: TextInputType.text,
//           ),
//           const SizedBox(height: AppPadding.p14),
//           SignUpButton(onPressed: () {},),
//           const SizedBox(height: AppPadding.p14),
//         ],
//       ),
//     );
//   }
// }
