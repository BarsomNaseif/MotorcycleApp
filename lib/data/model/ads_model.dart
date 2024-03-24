class ads_model {
  List<String>? image;

  ads_model({this.image});

  ads_model.fromJson(Map<String, dynamic> json) {
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}