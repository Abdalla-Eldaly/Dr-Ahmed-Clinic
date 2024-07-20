import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';

class MainSearch extends StatelessWidget {
  const MainSearch({
    super.key,
    this.hintText,
    this.leadingIcon,
    this.trailingIcon,
    this.controller,
    this.onSubmit,
    this.onChanged,
  });

  final String? hintText;
  final IconData? leadingIcon;
  final Widget? trailingIcon;
  final TextEditingController? controller;
  final Function? onSubmit;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            cursorColor: ColorManager.green,
            onChanged: onChanged,
            style: AppTextStyles.nurseSearchTextStyle(context),
            onSubmitted: (value) {
              if (onSubmit != null) {
                onSubmit!(value);
              }
            },
            decoration: InputDecoration(
              prefixIcon: Icon(leadingIcon),
              prefixIconColor: ColorManager.green,
              hintText: hintText,
              border: InputBorder.none,
              fillColor: Colors.transparent,
              filled: false,
            ),
          ),
        ),
      ],
    );
  }
}
