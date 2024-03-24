class Brand_model {
  String? image;
  String? name;
  List<Items>? items;

  Brand_model({this.image, this.name, this.items});

  Brand_model.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? idItems;
  String? brand;
  String? model;
  String? price;
  String? rating;
  String? videoreview;
  String? viewSpecsDetails;
  List<String>? image;

  Items(
      {this.idItems,
      this.brand,
      this.model,
      this.price,
      this.rating,
      this.videoreview,
      this.viewSpecsDetails,
      this.image});

  Items.fromJson(Map<String, dynamic> json) {
    idItems = json['idItems'];
    brand = json['brand'];
    model = json['model'];
    price = json['price'];
    rating = json['rating'];
    videoreview = json['videoreview'];
    viewSpecsDetails = json['ViewSpecsDetails'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idItems'] = this.idItems;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['videoreview'] = this.videoreview;
    data['ViewSpecsDetails'] = this.viewSpecsDetails;
    data['image'] = this.image;
    return data;
  }
}
