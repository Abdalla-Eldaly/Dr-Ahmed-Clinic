import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';

class AppDefults{

  static BorderRadius borderRadius = BorderRadius.circular(AppSize.s15);


  static List<BoxShadow> boxShadow = [
    BoxShadow(
      blurRadius: 10,
      spreadRadius: 0,
      offset: const Offset(0, 2),
      color: Colors.black.withOpacity(0.04),
    ),
  ];

  static BorderRadius topSheetRadius = const BorderRadius.only(
    bottomLeft: Radius.circular(AppSize.s15),
    bottomRight: Radius.circular(AppSize.s15),
  );
}