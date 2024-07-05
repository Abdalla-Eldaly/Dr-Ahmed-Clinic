import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/color_manager.dart';
import '../../resources/langauge_manager.dart';
import '../../resources/values_manager.dart';

AppBar buildMainAppBar(BuildContext context, Widget? title,
    [Color color = ColorManager.transparent]) {
  return AppBar(
    toolbarHeight: AppSize.s80,
    backgroundColor: color,
    systemOverlayStyle:SystemUiOverlayStyle.dark ,
    centerTitle: false,
    title: title, 
    scrolledUnderElevation: AppSize.s0,
    bottom: PreferredSize(
      preferredSize:  const Size.fromHeight(AppSize.s1_2),
      child: Container(
        color: ColorManager.tertiary ,
        height: AppSize.s1_2,
      ),
    ),
    actions: title is Text
        ? [
      IconButton(
        icon: const Icon(Icons.language_rounded,color: ColorManager.tertiary,size: AppSize.s35,),
        onPressed: () {
          AppLanguages.toggleLocal(context);
        },
      ),
    ]
        : null,
    elevation: AppSize.s0,
    shadowColor: const Color.fromRGBO(0, 0, 0, 0.25),
  );
}