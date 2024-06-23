import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';
import '../../resources/values_manager.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.focusNode,
    this.nextFocus,
    required this.controller,
    required this.validator,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
  });

  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;
  final void Function()? onTap;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool hidden = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      validator: widget.validator,
      cursorColor: ColorManager.tertiary,
      cursorWidth: AppSize.s1,
      selectionControls: CupertinoTextSelectionControls(),
      style: AppTextStyles.textFieldValueTextStyle(context),
      obscureText: hidden,
      textInputAction: widget.nextFocus == null
          ? TextInputAction.done
          : TextInputAction.next,
      keyboardType: widget.keyboardType,
      onEditingComplete: () {
        widget.focusNode.unfocus();
        if (widget.nextFocus != null) {
          widget.nextFocus!.requestFocus();
        }
      },
      decoration: InputDecoration(
        label: Text(
          widget.label,
          style: AppTextStyles.textFieldLabelTextStyle(context),
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    hidden = !hidden;
                  });
                },
                iconSize: AppSize.s24,
                splashRadius: AppSize.s1,
                isSelected: !hidden,
                color: ColorManager.white,
                selectedIcon: const Icon(CupertinoIcons.eye),
                icon: const Icon(CupertinoIcons.eye_slash),
              )
            : null,
      ),
    );
  }
}
