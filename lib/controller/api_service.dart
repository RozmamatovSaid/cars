import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/car_model.dart';

class ApiService {
  final String _baseUrl =
      "https://cars-129bf-default-rtdb.asia-southeast1.firebasedatabase.app";

  //Get method
  Future<List<CarModel>> fetchCars() async {
    final url = Uri.parse("$_baseUrl/cars.json");
    final response = await http.get(url);
    final List<CarModel> allCars = [];

    if (response.statusCode != 200) {
      throw Exception("${response.statusCode} Error");
    }
    final decodeData = jsonDecode(response.body) as Map;
    decodeData.forEach((key, value) {
      final data = value;
      data["id"] = key;
      allCars.add(CarModel.fromJson(data));
    });
    return allCars;
  }

  Future<void> addCar(CarModel car) async {
    final url = Uri.parse("$_baseUrl/cars.json");

    final response = await http.post(
      url,
      body: jsonEncode(car.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode != 200 && response.statusCode != 201) {
      throw Exception("Post Status Code ${response.statusCode}");
    } else {
      print("Post Successfully");
    }
  }
}
