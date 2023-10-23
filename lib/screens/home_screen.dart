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
      future:ApiManager.getSources(categoryModel.id) ,
      builder:(context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        var sources=snapshot.data?.sources??[];
        return MyTabController(sources,keyword);
      },
    );
  }
}
