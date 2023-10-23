import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_screen.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/tab_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../screens/drawer_screen.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName="home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool searchVis=false;
  String keyWord="";
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
        elevation: 0.0,
        shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(bottomRight:Radius.circular(20) ,bottomLeft:Radius.circular(30) ),
      ),
      actions: [

        Stack(
          alignment: Alignment.center,
          children: [
            if(!searchVis)IconButton(icon: Icon(Icons.search),onPressed: (){
                   searchVis=true;
                   setState(() {

                   });
            },),
            if(searchVis) SizedBox(
              width: MediaQuery.of(context).size.width*0.98,
              height: 50,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  prefixIcon: InkWell(
                      onTap: (){
                        searchVis=false;
                        setState(() {
                          
                        });
                      },
                      child: Icon(Icons.cancel_outlined)),
                  suffixIcon: InkWell(
                      onTap: () {
                       // searchVis=false;
                        keyWord=searchController.text;
                        setState(() {

                        });
                       // print("my keyword is ${keyWord}");
                      },
                      child: Icon(Icons.search)),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ],
        ),

      ],

      ),
      drawer:DrawerScreen(onDrawerSelected) ,
      body: categoryModel==null?CategoryScreen(onCategorySelected):HomeScreen(categoryModel!,keyWord),
    );
  }

  CategoryModel ?categoryModel;

  void onCategorySelected(categoryData){
    categoryModel=categoryData;
    setState(() {});
  }

  void onDrawerSelected(number){
    if(number==DrawerScreen.Categories){
      categoryModel=null;
     // setState(() {});
    }
    setState(() {Navigator.pop(context);});
  }
}
