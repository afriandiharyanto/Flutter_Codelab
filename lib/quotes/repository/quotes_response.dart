class Quotes {
  int? id;
  Originator? originator;
  String? languageCode;
  String? content;
  String? url;
  List<String>? tags;

  Quotes(
      {this.id,
      this.originator,
      this.languageCode,
      this.content,
      this.url,
      this.tags});

  Quotes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originator = json['originator'] != null
        ? Originator.fromJson(json['originator'])
        : null;
    languageCode = json['language_code'];
    content = json['content'];
    url = json['url'];
    tags = json['tags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (originator != null) {
      data['originator'] = originator!.toJson();
    }
    data['language_code'] = languageCode;
    data['content'] = content;
    data['url'] = url;
    data['tags'] = tags;
    return data;
  }
}

class Originator {
  int? id;
  String? languageCode;
  String? description;
  int? masterId;
  String? name;
  String? url;

  Originator(
      {this.id,
      this.languageCode,
      this.description,
      this.masterId,
      this.name,
      this.url});

  Originator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['language_code'];
    description = json['description'];
    masterId = json['master_id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language_code'] = languageCode;
    data['description'] = description;
    data['master_id'] = masterId;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
