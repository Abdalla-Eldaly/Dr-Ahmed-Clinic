import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';
@Freezed()
class LoginObject with _$LoginObject{

  factory LoginObject(String email , String password) = _LoginObject;

}