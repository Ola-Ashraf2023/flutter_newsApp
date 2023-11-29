import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:news/screens/category_screen.dart';
import 'package:news/screens/cubit/cubit.dart';
import 'package:news/screens/cubit/states.dart';
import 'package:news/screens/repo/remote_data_source.dart';
import 'package:news/screens/settings_screen.dart';
import 'package:news/screens/tab_controller.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../screens/drawer_screen.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = "home";
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(RemoteDataSource()),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, Object? state) {
          if (state is HomeSourcesLoadingState ||
              state is HomeNewsDataLoadingState) {
            showDialog(
              barrierDismissible: true,
              context: context,
              builder: (context) => const AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Center(child: CircularProgressIndicator()),
              ),
            );
          } else if (state is HomeChangeCategoryState) {
            HomeCubit.get(context).getSources(Locale("en"));
          } else if (state is HomeChangeKeywordState) {
            HomeCubit.get(context).getSources(Locale("en"));
          } else if (state is HomeChangeSourceState) {
            HomeCubit.get(context)
                .getNewsData(EasyLocalization.of(context)?.currentLocale);
          } else if (state is HomeSourcesSuccessState) {
            HomeCubit.get(context)
                .getNewsData(EasyLocalization.of(context)?.currentLocale);
            Navigator.pop(context);
          } else if (state is HomeNewsDataSuccessState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("News App".tr()),
              elevation: 0.0,
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(30)),
              ),
              actions: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    if (!HomeCubit.get(context).searchVis)
                      IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () {
                          HomeCubit.get(context).changeSearchVis(true);
                        },
                      ),
                    if (HomeCubit.get(context).searchVis)
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.98,
                        height: 50,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            prefixIcon: InkWell(
                                onTap: () {
                                  HomeCubit.get(context).changeSearchVis(false);
                                  HomeCubit.get(context).changeKeyword("");
                                },
                                child: Icon(Icons.cancel_outlined)),
                            suffixIcon: InkWell(
                                onTap: () {
                                  HomeCubit.get(context)
                                      .changeKeyword(searchController.text);
                                },
                                child: Icon(Icons.search)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            drawer: DrawerScreen(HomeCubit.get(context).onDrawerSelected),
            body: HomeCubit.get(context).dest == 0
                ? CategoryScreen(HomeCubit.get(context).onCategorySelected)
                : HomeCubit.get(context).dest == 1
                    ? SettingsScreen()
                    : MyTabController(HomeCubit.get(context).keyWord,
                        EasyLocalization.of(context)!.currentLocale),
          );
        },
      ),
    );
  }
}
