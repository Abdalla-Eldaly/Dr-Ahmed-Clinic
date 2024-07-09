import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:zag_nights/presentation/common/widget/main_text_field.dart';
import 'package:zag_nights/presentation/resources/strings_manager.dart';

import '../../../../../../common/widget/app_button.dart';
import '../../../../../../resources/color_manager.dart';
import '../../../../../../resources/text_styles.dart';
import '../../../../../../resources/values_manager.dart';

class SearchFuncationalityState extends StatefulWidget {
  const SearchFuncationalityState({
    super.key,
    // required this.viewModel,
  });

  // final AddTripViewModel viewModel;

  @override
  State<SearchFuncationalityState> createState() =>
      _SearchFuncationalityStateState();
}

class _SearchFuncationalityStateState extends State<SearchFuncationalityState> {
  List<String> locations = [
    "بنها",
    "كفر شكر",
    "طوخ",
    "قليوب",
    "شبين القناطر",
    "القناطر الخيرية",
    "الخانكة",
    "قها",
    "كفر الجزار",
    "مرصفا",
    "ميت عاصم",
    "ورورة",
    "بطا",
    "سندنهور",
    "كفر مناقرة",
    "كفر الشموت",
    "جمجرة",
    "عزبة نجيب",
    "كفر أبو زاهر",
    "كفر علي شرف الدين",
    "ميت الحوفيين",
    "دملو",
    "دجوي",
    "شبلنجة",
    "منشية دياب",
    "الرملة",
    "بتمدة",
    "نامول",
    "كفر الحصة",
    "مجول",
    "كفر فرسيس",
    "ميت راضي",
    "ميت السباع",
    "العمار الكبرى",
    "العمار الصغرى",
    "تصفا",
    "ترسا",
    "مشتهر",
    "كفر عابد"
  ];
  bool isSearching = false;
  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = [];
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredList = [];
        isSearching = false;
      });
      return;
    }

    final normalizedQuery = query.toLowerCase();

    List<String> exactMatches = locations
        .where((governorate) =>
    governorate.toLowerCase() == normalizedQuery)
        .toList();

    List<String> fuzzyMatches = locations
        .where((governorate) =>
    governorate.toLowerCase().contains(normalizedQuery) ||
        normalizedQuery.contains(governorate.toLowerCase()) ||
        _fuzzyMatch(normalizedQuery, governorate.toLowerCase()))
        .toList();

    List<String> searchResults = [...exactMatches, ...fuzzyMatches];

    setState(() {
      filteredList = searchResults;
      isSearching = searchResults.contains(query);
    });
  }

  bool _fuzzyMatch(String query, String text) {
    final distance = levenshtein(query, text);
    return distance <= 3;
  }

  int levenshtein(String a, String b) {
    final m = a.length, n = b.length;
    var dp = List.generate(m + 1, (_) => List<int>.filled(n + 1, 0));

    for (var i = 0; i <= m; i++) {
      for (var j = 0; j <= n; j++) {
        if (i == 0) {
          dp[i][j] = j;
        } else if (j == 0) {
          dp[i][j] = i;
        } else if (a[i - 1] == b[j - 1]) {
          dp[i][j] = dp[i - 1][j - 1];
        } else {
          dp[i][j] =
              1 + _minOfThree(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]);
        }
      }
    }
    return dp[m][n];
  }

  int _minOfThree(int a, int b, int c) {
    return min(min(a, b), c);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: MainTextField(
                hintTextStyle: AppTextStyles.createAccountTextStyle(context),
                // controller: widget.viewModel.getToSearchController,
                onChanged: (value) {
                  filterSearchResults(value);
                },
                prefixIcon: Icons.search,
                hint: AppStrings.nurseScreenSearchHint.tr(),
              ),
            ),
            const SizedBox(width: AppSize.s12,)
          ],
        ),
        SizedBox(
          height: AppSize.s50,
          child: ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isSearching = true;
                    // widget.viewModel.getToSearchController.text =
                    // filteredList[index];
                  });
                },
                child: ListTile(
                  title: Text(
                    filteredList[index],
                    style: AppTextStyles.createAccountTextStyle(context),
                  ),
                ),
              );
            },
          ),
        ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .35,
              child: AppButton(
                textStyle: AppTextStyles.baseStatesMessageTextStyle(context),
                color: ColorManager.secondary,
                text: AppStrings.confirm.tr(),
                onPressed: () {
                  // widget.viewModel.getToController.text = widget.viewModel.getToSearchController.text;
                  // widget.viewModel.getToSearchController.clear();

                  Navigator.pop(context);
                },
              ),
            ),
          ),
      ],
    );
  }
}
