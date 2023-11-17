import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourceResponse.dart';

const String base = "newsapi.org";
const String endpoint = "/v2/top-headlines/sources";
const String apiKey = "02a3864c98174e25a6c88f5310e4870d";

class ApiManager {}