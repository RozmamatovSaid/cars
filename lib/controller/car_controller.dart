import 'package:cars/controller/api_service.dart';
import 'package:cars/model/car_model.dart';

class CarController {
  final ApiService _apiService = ApiService();

  Future<List<CarModel>> getCars() async {
    return _apiService.fetchCars();
  }
}
