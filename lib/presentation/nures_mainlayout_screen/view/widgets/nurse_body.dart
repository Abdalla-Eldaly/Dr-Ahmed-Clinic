import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zag_nights/presentation/nures_mainlayout_screen/view/widgets/setting/view/nures_setting_screen.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';
import 'package:zag_nights/presentation/resources/values_manager.dart';
import '../../../resources/color_manager.dart';
import '../../../resources/font_manager.dart';
import '../../viewmodel/nurse_viewmodel.dart';
import 'home/view/nurse_home_screen.dart';
import 'search/view/nurse_screen_body_search.dart';

class NurseScreenBody extends StatefulWidget {
  const NurseScreenBody({super.key, required this.viewModel});

  final NurseViewModel viewModel;

  @override
  State<NurseScreenBody> createState() => _NurseScreenBodyState();
}

class _NurseScreenBodyState extends State<NurseScreenBody> {
  List<Widget> tabs = [
    const NurseHomeScreen(),
    const NurseScreenBodySearch(),
    const NurseSettingScreen()
  ];
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorManager.tertiary,
        selectedFontSize: FontSize.f15,
        selectedItemColor: ColorManager.gray,
        selectedIconTheme: const IconThemeData(color: ColorManager.gray),
        unselectedItemColor: ColorManager.black,
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        currentIndex: selectedTabIndex,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.home,
                size: AppSize.s28,
                color: ColorManager.black,
              ),
              label: AppStrings.home.tr()),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.search,
                size: AppSize.s28,
                color: ColorManager.black,
              ),
              label: AppStrings.nurseScreenSearch.tr()),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(
                Icons.settings_sharp,
                size: AppSize.s28,
                color: ColorManager.black,
              ),
              label: AppStrings.nurseScreenSearch.tr()),
        ],
      ),
    );
  }
}
