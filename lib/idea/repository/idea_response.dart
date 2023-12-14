class Idea {
  String? activity;
  double? accessibility;
  String? type;
  int? participants;
  double? price;

  Idea({
    this.activity,
    this.accessibility,
    this.type,
    this.participants,
    this.price,
  });

  Idea.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    accessibility = json['accessibility'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['accessibility'] = accessibility;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    return data;
  }
}
