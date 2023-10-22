import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerScreen  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Icon(Icons.list,color: Color(0xff303030),),Text("Categories",style: GoogleFonts.poppins(color: Color(0xff303030),fontWeight: FontWeight.w700,fontSize: 27),)],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Icon(Icons.settings,color: Color(0xff303030),),Text("Settings",style: GoogleFonts.poppins(color: Color(0xff303030),fontWeight: FontWeight.w700,fontSize: 27))],
            ),
          ),
        ],
      ),
    );
  }
}
