import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourceResponse.dart';

const String base="newsapi.org";
const String endpoint="/v2/top-headlines/sources";
const String apiKey="df1bd8c4bf634fdfb689cfcc34365e7d";
class ApiManager{
  static Future<SourceResponse> getSources(String ? category) async {
    Uri url=Uri.https(base,endpoint,{"apiKey":apiKey,"category":category});
    http.Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourceResponse sourceResponse=SourceResponse.fromJson(jsonData);
    return sourceResponse;
  }

  static Future<NewsDataModel> getNewsData(String sourceId, String keyword) async {
    Uri url=Uri.https(base,"/v2/everything",{"apiKey":apiKey,"sources":sourceId, "q":keyword});
    http.Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    NewsDataModel newsDataModel=NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}