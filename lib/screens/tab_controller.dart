import 'package:flutter/material.dart';
import 'package:news/screens/My_tab.dart';

import '../models/SourceResponse.dart';

class MyTabController extends StatefulWidget {

  List<Sources> sources;
  MyTabController(this.sources);

  @override
  State<MyTabController> createState() => _MyTabControllerState();
}

class _MyTabControllerState extends State<MyTabController> {
  int idx=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.sources.length,
        child: TabBar(
          onTap: (index){
            idx=index;
            setState(() {

            });
          },
          indicatorColor: Colors.transparent,
          isScrollable: true,
          tabs: widget.sources.map((source) => Tab(child: MyTab(source.name,widget.sources.indexOf(source)==idx),)).toList(),

        ));
  }
}
