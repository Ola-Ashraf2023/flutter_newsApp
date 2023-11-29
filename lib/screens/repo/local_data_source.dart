import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/screens/repo/repository.dart';

class LocalDataSource implements HomeRepo {
  @override
  Future<NewsDataModel> getNews(String sourceId, String keyWord) {
    throw UnimplementedError();
  }

  @override
  Future<SourceResponse> getSources(String category) {
    throw UnimplementedError();
  }
}
