import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zag_nights/app/extensions.dart';
import 'package:zag_nights/domain/models/model.dart';
import 'package:zag_nights/presentation/base/base_states.dart';

import '../../nures_mainlayout_screen/viewmodel/nurse_viewmodel.dart';
import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';


class SearchHomeItem extends StatelessWidget {
  const SearchHomeItem({
    super.key,
    required this.patient,
  });

  final PatientModel patient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppMargin.m10),
      color: ColorManager.white,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: AppSize.s10),
            SizedBox(
              width: context.width() - AppSize.s180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          patient.name,

                        ),
                      ),
                    ],
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    patient.age,

                  ), Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    patient.address,

                  ), Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    patient.services,

                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
