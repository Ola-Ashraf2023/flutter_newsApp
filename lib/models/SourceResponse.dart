class SourceResponse {

  String? status;
  String? message;
  String? code;
  List<Sources>? sources;


  SourceResponse({
      this.status,
      this.sources,
      this.code,
      this.message});

  SourceResponse.fromJson(dynamic json) {
    status = json['status'];
    message=json['message'];
    code=json['code'];
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Sources.fromJson(v));
      });
    }
  }


}
class Sources {
  Sources({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,});

  Sources.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;


}