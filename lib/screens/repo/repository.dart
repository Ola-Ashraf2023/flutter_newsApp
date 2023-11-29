import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourceResponse.dart';

abstract class HomeRepo {
  Future<SourceResponse> getSources(String category);

  Future<NewsDataModel> getNews(String sourceId, String keyWord);
}
