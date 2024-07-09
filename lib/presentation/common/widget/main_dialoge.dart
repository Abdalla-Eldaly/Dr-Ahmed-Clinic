import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:zag_nights/presentation/resources/constants_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';

import '../../resources/color_manager.dart';
import '../../resources/text_styles.dart';

void showRegisterDialog(
    BuildContext context, {
      required void Function(String) onSelect,
      required String title,
      required List<String> items,
    }) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.registerDialogTitleTextStyle(context),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: ColorManager.primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: AppConstants.dialogDur),
            childAnimationBuilder: (widget) => SlideAnimation(
              horizontalOffset: AppSize.s50,
              child: FadeInAnimation(
                child: widget,
              ),
            ),
            children: items.map((e) {
              return ListTile(
                onTap: () {
                  HapticFeedback.lightImpact();
                  Navigator.pop(context);
                  onSelect(e);
                },
                splashColor: ColorManager.primary.withOpacity(0.2),
                title: Text(
                  e,
                  style: AppTextStyles.registerDialogItemTextStyle(context),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: ColorManager.primary),
              );
            }).toList(),
          ),
        ),
      ),
      backgroundColor: ColorManager.white,
    ),
  );
}
