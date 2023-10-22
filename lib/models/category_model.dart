import 'dart:ui';

import 'package:news/shared/styles/colors.dart';

class CategoryModel{
  String id;
  Color color;
  String txt;
  String imagePath;
  CategoryModel(this.id,this.color,this.txt,this.imagePath);

  static List<CategoryModel> getCategories(){
    return[
      CategoryModel('business', MyColors.businessOrange, "Business", "assets/images/bussines.png"),
      CategoryModel('health', MyColors.healthPink, "Health", "assets/images/health.png"),
      CategoryModel('science', MyColors.scienceYellow, "Science", "assets/images/science.png"),
      CategoryModel('sports', MyColors.sportsRed, "Sports", "assets/images/sports.png"),
      CategoryModel('general', MyColors.environBlue, "General", "assets/images/environment.png"),
      CategoryModel('entertainment', MyColors.politicsBlue, "Entertainment", "assets/images/Politics.png"),
    ];
  }
}