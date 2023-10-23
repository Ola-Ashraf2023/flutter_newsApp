import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:news/shared/styles/colors.dart';

class CategoryModel{
  String id;
  Color color;
  String txt;
  String imagePath;
  CategoryModel(this.id,this.color,this.txt,this.imagePath);

  static List<CategoryModel> getCategories(){
    return [
      CategoryModel('business', MyColors.businessOrange, "Business".tr(),
          "assets/images/bussines.png"),
      CategoryModel('health', MyColors.healthPink, "Health".tr(),
          "assets/images/health.png"),
      CategoryModel('science', MyColors.scienceYellow, "Science".tr(),
          "assets/images/science.png"),
      CategoryModel('sports', MyColors.sportsRed, "Sports".tr(),
          "assets/images/sports.png"),
      CategoryModel('general', MyColors.environBlue, "General".tr(),
          "assets/images/environment.png"),
      CategoryModel('entertainment', MyColors.politicsBlue,
          "Entertainment".tr(), "assets/images/Politics.png"),
    ];
  }
}