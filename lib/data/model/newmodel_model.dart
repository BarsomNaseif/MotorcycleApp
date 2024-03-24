class newmodel_model {
  String? id;
  String? brand;
  String? model;
  String? price;
  String? rating;
  String? videoreview;
  String? viewSpecsDetails;
  List<String>? image;
  String? engine;
  String? horse;
  String? speed;
  String? tank;
  String? year;

  newmodel_model(
      {this.id,
      this.brand,
      this.model,
      this.price,
      this.rating,
      this.videoreview,
      this.viewSpecsDetails,
      this.image,
      this.engine,
      this.horse,
      this.speed,
      this.tank,
      this.year});

  newmodel_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    price = json['price'];
    rating = json['rating'];
    videoreview = json['videoreview'];
    viewSpecsDetails = json['ViewSpecsDetails'];
    image = json['image'].cast<String>();
    engine = json['engine'];
    horse = json['horse'];
    speed = json['speed'];
    tank = json['tank'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['videoreview'] = this.videoreview;
    data['ViewSpecsDetails'] = this.viewSpecsDetails;
    data['image'] = this.image;
    data['engine'] = this.engine;
    data['horse'] = this.horse;
    data['speed'] = this.speed;
    data['tank'] = this.tank;
    data['year'] = this.year;
    return data;
  }
}