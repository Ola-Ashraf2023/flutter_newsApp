import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_item.dart';
import 'package:news/shared/styles/colors.dart';

class CategoryScreen extends StatelessWidget {
  Function onCategorySelect;
  CategoryScreen(this.onCategorySelect);
  @override
  Widget build(BuildContext context) {
    var categories=CategoryModel.getCategories();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Pick your category of interest",style: GoogleFonts.poppins(color: MyColors.titleColor, fontWeight: FontWeight.w700,fontSize: 22),),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 12,crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: (){
                      onCategorySelect(categories[index]);
                    },
                    child: CategoryItem(categories[index], index));
            },),
          )
        ],
      ),
    );
    return const Placeholder();
  }
}
