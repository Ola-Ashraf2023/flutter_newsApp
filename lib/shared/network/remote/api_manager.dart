import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse> getSources() async {
    Uri url=Uri.https("newsapi.org","/v2/top-headlines/sources",{"apiKey":"4d0f4fbda7b642e4a444d3d595cdb8a9"});
    http.Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourceResponse sourceResponse=SourceResponse.fromJson(jsonData);
    return sourceResponse;
  }
}