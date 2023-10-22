import 'package:flutter/material.dart';
import 'package:news/shared/styles/colors.dart';

import '../models/SourceResponse.dart';

class MyTab extends StatelessWidget {

  String? txt;
  bool active;
  MyTab(this.txt,this.active);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(color:MyColors.mainColor),
        color: active? MyColors.mainColor: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Tab(child: Text(txt??"",style: TextStyle(color: active? Colors.white:MyColors.mainColor),),),
    );
  }
}
