import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_screen.dart';
import 'package:news/screens/tab_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName="home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App"),
        elevation: 0.0,
        shape: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.only(bottomRight:Radius.circular(20) ,bottomLeft:Radius.circular(30) ),
      ),),
      //drawer:DrawerScreen() ,
      body: FutureBuilder(
        future:ApiManager.getSources(categoryModel?.id??"general") ,
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          var sources=snapshot.data?.sources??[];
          return categoryModel==null?CategoryScreen(onCategorySelected):MyTabController(sources);
        },
      ),
    );
  }

  CategoryModel ?categoryModel;

  void onCategorySelected(categoryData){
    categoryModel=categoryData;
    setState(() {

    });
  }
}
