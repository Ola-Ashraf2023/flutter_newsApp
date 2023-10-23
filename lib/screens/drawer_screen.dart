import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/shared/styles/colors.dart';

class DrawerScreen  extends StatefulWidget {
  Function onDrawerSelect;
  static const int Categories=1;
  static const int Settings=2;

  DrawerScreen(this.onDrawerSelect);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //width: MediaQuery.of(context).size.width*0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(color: MyColors.mainColor,child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text("News App!",textAlign:TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),),
          ),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){widget.onDrawerSelect(DrawerScreen.Categories);},
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.list,
                      color: Color(0xff303030),
                    ),
                  ),
                  Text(
                    "Categories".tr(),
                    style: GoogleFonts.poppins(
                        color: Color(0xff303030),
                        fontWeight: FontWeight.w700,
                        fontSize: 27),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                widget.onDrawerSelect(DrawerScreen.Settings);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.settings,
                      color: Color(0xff303030),
                    ),
                  ),
                  Text("Settings".tr(),
                      style: GoogleFonts.poppins(
                          color: Color(0xff303030),
                          fontWeight: FontWeight.w700,
                          fontSize: 27))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
