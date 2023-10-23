import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/tab_controller.dart';

import '../shared/network/remote/api_manager.dart';

class HomeScreen  extends StatelessWidget {
  CategoryModel categoryModel;
  String keyword;
  HomeScreen(this.categoryModel,this.keyword);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(
          categoryModel.id, EasyLocalization.of(context)!.currentLocale),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong".tr()));
        }

        var sources = snapshot.data?.sources ?? [];
        return MyTabController(
            sources, keyword, EasyLocalization.of(context)!.currentLocale);
      },
    );
  }
}
