import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourceResponse.dart';

const String base="newsapi.org";
const String endpoint="/v2/top-headlines/sources";
const String apiKey="4d0f4fbda7b642e4a444d3d595cdb8a9";
class ApiManager{
  static Future<SourceResponse> getSources() async {
    Uri url=Uri.https(base,endpoint,{"apiKey":apiKey});
    http.Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourceResponse sourceResponse=SourceResponse.fromJson(jsonData);
    return sourceResponse;
  }

  static Future<NewsDataModel> getNewsData(String sourceId) async {
    Uri url=Uri.https(base,"/v2/everything",{"apiKey":apiKey,"sources":sourceId});
    http.Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    NewsDataModel newsDataModel=NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}