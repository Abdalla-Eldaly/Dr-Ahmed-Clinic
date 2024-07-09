import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';

import '../../resources/values_manager.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.label,
    required this.hint,
    this.isObscured = false,
    this.iconData,
    this.textInputType = TextInputType.text,
    this.backgroundColor,
    this.hintTextStyle,
    this.labelTextStyle,
    this.cursorColor = ColorManager.tertiary,
    this.readOnly = false,
    this.validation,
    this.onTap,
    this.maxLines, this.prefixIcon, this.inputFormatters, this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final bool isObscured;
  final String? label;
  final String hint;
  final TextInputType textInputType;
  final IconData? iconData;
  final IconData? prefixIcon;
  final Color? backgroundColor;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final Color cursorColor;
  final bool readOnly;
  final int? maxLines;
  final String? Function(String?)? validation;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late bool hidden = widget.isObscured;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Text(
                widget.label!,
                style: widget.labelTextStyle ??
                    AppTextStyles.authLabelTextStyle(context),
              )
            : const SizedBox(),
        TextFormField(
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,

          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          readOnly: widget.readOnly,
          style:
              widget.hintTextStyle ?? AppTextStyles.authHintTextStyle(context),
          obscureText: hidden,
          keyboardType: widget.textInputType,
          obscuringCharacter: '*',

          cursorColor: widget.cursorColor,
          onTap: widget.onTap,
          onEditingComplete: () {
            widget.focusNode?.unfocus();
            if (widget.nextFocus != null) {
              FocusScope.of(context).requestFocus(widget.nextFocus);
            }
          },
          textInputAction: widget.nextFocus == null
              ? TextInputAction.done
              : TextInputAction.next,
          validator: (value) {
            if (widget.validation == null) {
              setState(() {
                errorText = null;
              });
            } else {
              setState(() {
                errorText = widget.validation!(value);
              });
            }
            return errorText;
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(AppPadding.p12),
            hintText: widget.hint,

            prefixIcon: Icon(widget.prefixIcon),
            suffixIcon: widget.isObscured
                ? IconButton(
                    onPressed: () {
                      setState(
                        () {
                          hidden = !hidden;
                        },
                      );
                    },
                    iconSize: AppSize.s24,
                    splashRadius: AppSize.s1,
                    isSelected: !hidden,
                    color: widget.cursorColor,
                    selectedIcon: const Icon(CupertinoIcons.eye),
                    icon: const Icon(CupertinoIcons.eye_slash),
                  )
                : null,
            hintStyle: widget.hintTextStyle ??
                AppTextStyles.authHintTextStyle(context),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                borderSide: BorderSide(color: ColorManager.tertiary)),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                borderSide: BorderSide(color: ColorManager.tertiary)),
            enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                borderSide: BorderSide(color: ColorManager.tertiary)),
            focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                borderSide: BorderSide(color: ColorManager.tertiary)),
            errorStyle: const TextStyle(
              fontSize: AppSize.s0,
              color: ColorManager.transparent,
            ),
            errorBorder: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(AppSize.s5)),
                borderSide: BorderSide(color: ColorManager.error)),
          ),
        ),
        errorText == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p8,
                  left: AppPadding.p8,
                ),
                child: Text(
                  errorText!,
                  style: AppTextStyles.authErrorTextStyle(context),
                ),
              ),
      ],
    );
  }
}
