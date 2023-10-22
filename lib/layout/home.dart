import 'package:flutter/material.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/screens/tab_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName="home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News App"),),
      body: FutureBuilder(
        future:ApiManager.getSources() ,
        builder:(context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          var sources=snapshot.data?.sources??[];
          return MyTabController(sources);
        },
      ),
    );
  }
}
