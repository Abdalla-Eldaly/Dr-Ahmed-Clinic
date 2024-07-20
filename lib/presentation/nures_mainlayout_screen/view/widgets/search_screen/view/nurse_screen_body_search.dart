import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zag_nights/domain/models/model.dart';

import '../../../../../common/data_intent/data_intent.dart';
import '../../../../../common/widget/main_search.dart';
import '../../../../../common/widget/main_text_field.dart';
import '../../../../../common/widget/search_item.dart';
import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/color_manager.dart';
import '../../../../../resources/strings_manager.dart';
import '../../../../../resources/values_manager.dart';

class PatientSearchScreen extends StatefulWidget {
  const PatientSearchScreen({super.key});

  @override
  State<PatientSearchScreen> createState() => _PatientSearchScreenState();
}

class _PatientSearchScreenState extends State<PatientSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late Stream<QuerySnapshot> _searchStream;

  @override
  void initState() {
    super.initState();
    _searchStream = FirebaseFirestore.instance.collection('patients').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: AppSize.s35,),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: MainSearch(
              controller: _searchController,
              leadingIcon: Icons.search,
              onChanged: (value) {
                setState(
                      () {
                    if (value.isNotEmpty) {
                      _searchStream = FirebaseFirestore.instance
                          .collection('patients')
                          .where('name',
                          isGreaterThanOrEqualTo: value.toLowerCase())
                          .snapshots();
                    }
                  },
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _searchStream,
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p50),
                    child: Lottie.asset(LottieAssets.loading),
                  );
                }
                if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(AppPadding.p50),
                    child: Lottie.asset(LottieAssets.error),
                  );                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const SizedBox();
                }
                final items =
                snapshot.data!.docs.map((DocumentSnapshot document) {
                  final Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
                  return GestureDetector(
                    onTap: () {
                      // DataIntent.pushHome(HomeModel.fromMap(data));
                      // Navigator.pushNamed(context, Routes.homeDetailsRoute);
                    },
                    child: SearchHomeItem(patient: PatientModel.fromMap(data),
                      // home: HomeModel.fromMap(data),
                    ),
                  );
                }).toList();

                return ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return items[index];
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      indent: 22,
                      thickness: .5,
                      endIndent: 22,
                      color: Colors.grey,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
