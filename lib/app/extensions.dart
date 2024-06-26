import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zag_nights/app/constants.dart';
import 'package:zag_nights/presentation/resources/langauge_manager.dart';

extension BuildContextExt on BuildContext {
  double width() => MediaQuery.of(this).size.width;

  double height() => MediaQuery.of(this).size.height;

  double minDim() =>
      min(MediaQuery.of(this).size.width, MediaQuery.of(this).size.height);

  Languages get language => AppLanguages.getCurrentLang(this);
}

extension NonNullString on String?{
  String orEmpty(){
    if(this == null){
      return Constants.empty;
    }else{
      return this!;
    }
  }
}

extension NonNullInt on int?{
  int orZero(){
    if(this == null){
      return Constants.zero;
    }else{
      return this!;
    }
  }
}


