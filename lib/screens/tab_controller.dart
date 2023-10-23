import 'package:flutter/material.dart';
import 'package:news/screens/My_tab.dart';
import 'package:news/screens/news_card.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../models/SourceResponse.dart';

class MyTabController extends StatefulWidget {

  String keyword;
  List<Sources> sources;
  MyTabController(this.sources,this.keyword);

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  int idx=0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(length: widget.sources.length,
            child: TabBar(
              onTap: (index){
                idx=index;
                setState(() {

                });
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sources.map((source) => Tab(child: MyTab(source.name,widget.sources.indexOf(source)==idx),)).toList(),

            )),
        FutureBuilder(future: ApiManager.getNewsData(widget.sources[idx].id??"",widget.keyword), builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          var news=snapshot.data?.articles??[];
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return NewsCard(news[index]);
            },itemCount: news.length,),
          );
        },)
      ],
    );
  }
}
