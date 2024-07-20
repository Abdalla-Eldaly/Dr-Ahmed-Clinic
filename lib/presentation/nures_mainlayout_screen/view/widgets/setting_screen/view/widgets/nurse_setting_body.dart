import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/viewmodel/nurse_viewmodel.dart';

class NurseSettingBody extends StatelessWidget {
  const NurseSettingBody({super.key, required this.viewModel});
  final NurseViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {
          viewModel.logout();
        }, icon: Icon(Icons.logout_sharp))
      ],
    );
  }
}
