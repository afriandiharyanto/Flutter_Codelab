class Idea {
  String? activity;
  double? accessibility;
  String? type;
  int? participants;
  double? price;

  Idea(
      {this.activity,
      this.accessibility,
      this.type,
      this.participants,
      this.price});

  Idea.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    accessibility = json['accessibility'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activity'] = this.activity;
    data['accessibility'] = this.accessibility;
    data['type'] = this.type;
    data['participants'] = this.participants;
    data['price'] = this.price;
    return data;
  }
}