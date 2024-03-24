class Favorite_model {
  late String name, image, model, price, id;
  double? rating;
  Favorite_model({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    this.rating,
  });
  Favorite_model.fromJson(Map<String, dynamic> map) {
    // ignore: unnecessary_null_comparison
    if (map == null) {
      return;
    }
    rating = map['rating'];
    price = map['price'];
    name = map['name'];
    image = map['image'];
    // model = map['model'];
    id = map['id'];
  }
  tojson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      // 'model': model,
      'id': id,
      'rating': rating,
    };
  }
}
