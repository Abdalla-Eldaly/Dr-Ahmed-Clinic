import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/setting/view/nures_setting_screen.dart';
import 'package:zag_nights/presentation/resources/assets_manager.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../../resources/routes_manager.dart';
import '../../../resources/text_styles.dart';
import '../../viewmodel/nurse_viewmodel.dart';
import 'home/view/nurse_home_screen.dart';
import 'search/view/nurse_screen_body_search.dart';

class NurseScreenBody extends StatefulWidget {
  const NurseScreenBody({
    super.key,
    required this.viewModel,
  });

  final NurseViewModel viewModel;

  @override
  _NurseScreenBodyState createState() => _NurseScreenBodyState();
}

class _NurseScreenBodyState extends State<NurseScreenBody>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  String formattedDate = DateFormat('MM/dd/yyyy').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedItem(Widget child) {
    return SlideTransition(
      position: _animation,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Row(
              children: [
                _buildAnimatedItem(
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    width: AppSize.s50,
                    height: AppSize.s50,
                    child: Image.asset(ImageAssets.femaleAvatar),
                  ),
                ),
                const Spacer(),
                _buildAnimatedItem(
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: SvgPicture.asset(SVGAssets.menu),
                  ),
                ),
              ],
            ),
          ),
          _buildAnimatedItem(
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, Routes.s);
              },
              child: Container(
                height: AppSize.s50,
                width: MediaQuery.of(context).size.width * .80,
                decoration: BoxDecoration(
                  color: ColorManager.tertiary.withOpacity(.60),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: AppSize.s10),
                    const Icon(
                      Icons.search,
                      color: ColorManager.secondary,
                    ),
                    const SizedBox(width: AppSize.s5),
                    Text(
                      AppStrings.nurseScreenSearchHint.tr(),
                      style: AppTextStyles.nurseSearchTextStyle(context),
                    ),
                    const Spacer(),
                    const Icon(Icons.tune, color: ColorManager.secondary),
                    const SizedBox(width: AppSize.s10),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s20),
          _buildAnimatedItem(
            Text(
              'Dr / Ahmed Eldaly',
              style: AppTextStyles.generalTextStyle(
                context,
                ColorManager.gray,
                FontSize.f18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
            child: _buildAnimatedItem(
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(AppSize.s24),
                  border: Border.all(
                      color: ColorManager.secondary, width: AppSize.s2),
                ),
                child: ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(AppSize.s22),
                  child: Image.asset(
                    ImageAssets.nurseScreenHome,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSize.s10,),
          _buildAnimatedItem(
             SizedBox(
               height: AppSize.s60,
               child: Row(
                children: [
                  const SizedBox(width: AppSize.s15,),

                  Expanded(
                    child: Container(
                      height: AppSize.s70,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorManager.secondary.withOpacity(.5),
                            width: AppSize.s1),
                        borderRadius: BorderRadius.circular(AppSize.s16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: FittedBox(
                          child: Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: ColorManager.secondary,
                                size: AppSize.s18,
                              ),
                              Text(
                                AppStrings.patient.tr(),
                                style: AppTextStyles.smallNurseTextStyle(context),
                              ),
                              const SizedBox(
                                width: AppSize.s5,
                              ),
                              Text(
                                '10',
                                style: AppTextStyles.smallNurseTextStyleNumber(
                                    context),
                              ),
                              const SizedBox(width: AppSize.s10,),

                              SvgPicture.asset(SVGAssets.patient),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.s15,),
                  Expanded(
                    child: Container(
                      height: AppSize.s70,

                      decoration: BoxDecoration(
                        border: Border.all(
                            color: ColorManager.secondary.withOpacity(.5),
                            width: AppSize.s1),
                        borderRadius: BorderRadius.circular(AppSize.s16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(AppPadding.p12),
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text(formattedDate,
                                  style:
                                      AppTextStyles.smallNurseTextStyle(context)),
                              const SizedBox(width: AppSize.s10,),

                              SvgPicture.asset(SVGAssets.calender),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.s15,),

                ],
                           ),
             ),
          )
        ],
      ),
    );
  }
}
