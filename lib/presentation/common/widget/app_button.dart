import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key,
      this.text,
      required this.onPressed,
      this.outlined = false,
      this.textStyle,
      this.color,
      this.child,
      this.splash});

  final String? text;
  final Function() onPressed;
  final bool outlined;
  final TextStyle? textStyle;
  final Color? color;
  final Widget? child;
  final Color? splash;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.s50,
      child: TextButton(
        onPressed: onPressed,
        style: outlined
            ? TextButton.styleFrom(
                side: BorderSide(
                  color: color ?? ColorManager.white,
                  width: AppSize.s1,
                ),
                foregroundColor: outlined
                    ? (color ?? ColorManager.white)
                    : ColorManager.white,
              )
            : TextButton.styleFrom(
                backgroundColor: color ?? ColorManager.secondary,
                foregroundColor: outlined
                    ? (color ?? ColorManager.transparent)
                    : ColorManager.transparent,
              ),
        child: child ??
            Text(
              text ?? '',
              style: textStyle ?? AppTextStyles.appButtonTextStyle(context),
            ),
      ),
    );
  }
}
