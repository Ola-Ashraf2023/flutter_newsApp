import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/screens/My_tab.dart';
import 'package:news/screens/news_card.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../models/SourceResponse.dart';
import 'cubit/cubit.dart';

class MyTabController extends StatelessWidget {
  String keyword;
  Locale? locale;

  //Function onNewsSelect;

  MyTabController(this.keyword, this.locale);

  @override
  Widget build(BuildContext context) {
    return HomeCubit.get(context).sources.isEmpty
        ? Center(
            child: Text(
            "No News Available",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ))
        : Column(
            children: [
              DefaultTabController(
                  length: HomeCubit.get(context).sources.length,
                  child: TabBar(
                    onTap: (index) {
                      HomeCubit.get(context).changeSrc(index);
                    },
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    tabs: HomeCubit.get(context)
                        .sources
                        .map((source) => Tab(
                              child: MyTab(
                                  source.name,
                                  HomeCubit.get(context)
                                          .sources
                                          .indexOf(source) ==
                                      HomeCubit.get(context).idx),
                            ))
                        .toList(),
                  )),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsCard(HomeCubit.get(context).articles[index]);
                  },
                  itemCount: HomeCubit.get(context).articles.length,
                ),
              )
            ],
    );
  }
}
