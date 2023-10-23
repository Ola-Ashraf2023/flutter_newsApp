import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  CategoryItem(this.categoryModel,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: categoryModel.color,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),bottomLeft: index.isEven?Radius.circular(25):Radius.zero,bottomRight: index.isOdd?Radius.circular(25):Radius.zero)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(categoryModel.imagePath,height: 110,),
          Expanded(child: Container(child: Center(child: Text(categoryModel.txt,style: GoogleFonts.exo(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w400),))))
        ],
      ),
    );
  }
}
