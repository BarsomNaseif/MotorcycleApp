class Categorie {
  String? _image;
  String? _name;
  List<Subcategory>? _subcategory;

  Categorie({String? image, String? name, List<Subcategory>? subcategory}) {
    if (image != null) {
      this._image = image;
    }
    if (name != null) {
      this._name = name;
    }
    if (subcategory != null) {
      this._subcategory = subcategory;
    }
  }

  String? get image => _image;
  set image(String? image) => _image = image;
  String? get name => _name;
  set name(String? name) => _name = name;
  List<Subcategory>? get subcategory => _subcategory;
  set subcategory(List<Subcategory>? subcategory) => _subcategory = subcategory;

  Categorie.fromJson(Map<String, dynamic> json) {
    _image = json['image'];
    _name = json['name'];
    if (json['subcategory'] != null) {
      _subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        _subcategory!.add(new Subcategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this._image;
    data['name'] = this._name;
    if (this._subcategory != null) {
      data['subcategory'] = this._subcategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subcategory {
  String? _idsubcategory;
  String? _brand;
  String? _model;
  String? _price;
  String? _rating;
  String? _videoreview;
  String? _viewSpecsDetails;
  List<String>? _image;

  Subcategory(
      {String? idsubcategory,
      String? brand,
      String? model,
      String? price,
      String? rating,
      String? videoreview,
      String? viewSpecsDetails,
      List<String>? image}) {
    if (idsubcategory != null) {
      this._idsubcategory = idsubcategory;
    }
    if (brand != null) {
      this._brand = brand;
    }
    if (model != null) {
      this._model = model;
    }
    if (price != null) {
      this._price = price;
    }
    if (rating != null) {
      this._rating = rating;
    }
    if (videoreview != null) {
      this._videoreview = videoreview;
    }
    if (viewSpecsDetails != null) {
      this._viewSpecsDetails = viewSpecsDetails;
    }
    if (image != null) {
      this._image = image;
    }
  }

  String? get idsubcategory => _idsubcategory;
  set idsubcategory(String? idsubcategory) => _idsubcategory = idsubcategory;
  String? get brand => _brand;
  set brand(String? brand) => _brand = brand;
  String? get model => _model;
  set model(String? model) => _model = model;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get rating => _rating;
  set rating(String? rating) => _rating = rating;
  String? get videoreview => _videoreview;
  set videoreview(String? videoreview) => _videoreview = videoreview;
  String? get viewSpecsDetails => _viewSpecsDetails;
  set viewSpecsDetails(String? viewSpecsDetails) =>
      _viewSpecsDetails = viewSpecsDetails;
  List<String>? get image => _image;
  set image(List<String>? image) => _image = image;

  Subcategory.fromJson(Map<String, dynamic> json) {
    _idsubcategory = json['idsubcategory'];
    _brand = json['brand'];
    _model = json['model'];
    _price = json['price'];
    _rating = json['rating'];
    _videoreview = json['videoreview'];
    _viewSpecsDetails = json['ViewSpecsDetails'];
    _image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idsubcategory'] = this._idsubcategory;
    data['brand'] = this._brand;
    data['model'] = this._model;
    data['price'] = this._price;
    data['rating'] = this._rating;
    data['videoreview'] = this._videoreview;
    data['ViewSpecsDetails'] = this._viewSpecsDetails;
    data['image'] = this._image;
    return data;
  }
}