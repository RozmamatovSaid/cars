class CarModel {
  final String id;
  final String model;
  final int year;
  final int speed;
  final num price;
  final String image;

  CarModel({
    required this.id,
    required this.model,
    required this.price,
    required this.image,
    required this.speed,
    required this.year,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      model: json['model'],
      price: json['price'],
      image: json['image'],
      speed: json['speed'],
      year: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "model": model,
      "price": price,
      "image": image,
      "speed": speed,
      "year": year,
    };
  }
}
