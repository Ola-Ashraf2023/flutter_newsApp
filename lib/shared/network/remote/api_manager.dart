import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourceResponse.dart';

const String base = "newsapi.org";
const String endpoint = "/v2/top-headlines/sources";
const String apiKey = "02a3864c98174e25a6c88f5310e4870d";

class ApiManager {
  static Future<SourceResponse> getSources(
      String? category, Locale? locale) async {
    Uri url = Uri.https(base, endpoint, {
      "apiKey": apiKey,
      "category": category,
      "language": locale!.languageCode
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SourceResponse sourceResponse = SourceResponse.fromJson(jsonData);
    return sourceResponse;
  }

  static Future<NewsDataModel> getNewsData(
      String sourceId, String keyword, Locale? locale) async {
    Uri url = Uri.https(base, "/v2/everything", {
      "apiKey": apiKey,
      "sources": sourceId,
      "q": keyword,
      "language": locale!.languageCode
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(jsonData);
    return newsDataModel;
  }
}