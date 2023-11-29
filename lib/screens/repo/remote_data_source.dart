import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/screens/repo/repository.dart';

import '../../models/SourceResponse.dart';
import '../../shared/network/remote/api_manager.dart';

class RemoteDataSource implements HomeRepo {
  @override
  @override
  Future<SourceResponse> getSources(String category) async {
    Uri url = Uri.https(base, endpoint,
        {"apiKey": apiKey, "category": category, "language": "en"});
    print("inside get sources-----------------------");
    //print(categoryModel?.id);
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonData);
    return sourceResponse;
  }

  @override
  Future<NewsDataModel> getNews(String sourceId, String keyWord) async {
    Uri url = Uri.https(base, "/v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
      "q": keyWord,
      "language": "en"
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}
