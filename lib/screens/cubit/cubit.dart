import 'dart:convert';
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/screens/cubit/states.dart';

import '../../models/SourceResponse.dart';
import '../../models/category_model.dart';
import '../../shared/network/remote/api_manager.dart';
import '../drawer_screen.dart';
import '../repo/repository.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Sources> sources = [];
  List<Articles> articles = [];
  CategoryModel? categoryModel;
  var dest = 0;
  int idx = 0;
  String keyWord = "";
  bool searchVis = false;

  void changeSrc(int value) {
    emit(HomeInitState());
    idx = value;
    emit(HomeChangeSourceState());
  }

  void changeSearchVis(bool value) {
    emit(HomeInitState());
    searchVis = value;
    emit(HomeChangeSearchVisState());
  }

  void changeKeyword(String key) {
    emit(HomeInitState());
    keyWord = key;
    emit(HomeChangeKeywordState());
  }

  void onCategorySelected(categoryData) {
    print(categoryData.toString());
    emit(HomeInitState());
    categoryModel = categoryData;
    print(
        "-------------------------------------------------------------------");
    print(categoryModel?.id ?? "null");
    emit(HomeChangeCategoryState());
    dest = 2;
    emit(HomeChangeDestState());
  }

  void onDrawerSelected(number) {
    emit(HomeInitState());
    if (number == DrawerScreen.Categories) {
      dest = 0;
      emit(HomeChangeDestState());
      categoryModel = null;
      emit(HomeChangeCategoryState());
      //setState(() {});
    }
    if (number == DrawerScreen.Settings) {
      //categoryModel=null;
      dest = 1;
      emit(HomeChangeDestState());
      //setState(() {});
    }
  }

  Future<void> getSources(Locale? locale) async {
    try {
      emit(HomeSourcesLoadingState());
      SourceResponse sourceResponse =
          await homeRepo.getSources(categoryModel?.id ?? "general");
      sources = sourceResponse.sources ?? [];
      emit(HomeSourcesSuccessState());
    } catch (e) {
      print(e.toString());
      emit(HomeSourcesErrorState());
    }
  }

  Future<void> getNewsData(Locale? locale) async {
    try {
      emit(HomeNewsDataLoadingState());
      NewsDataModel newsDataModel =
          await homeRepo.getNews(sources[idx].id ?? "", keyWord);
      articles = newsDataModel.articles ?? [];
      emit(HomeNewsDataSuccessState());
    } catch (e) {
      print(e.toString());
      emit(HomeNewsDataErrorState());
    }
  }
}
