import 'package:cars/controller/controller.dart';
import 'package:cars/model/car_model.dart';

class ApiService {
  final Controller _controller = Controller();

  Future<List<CarModel>> getCars() async {
    return _controller.fetchCars();
  }

  Future<void> addCar(CarModel car) async {
    await _controller.addCar(car);
  }

  Future<void> deleteCar(String id) async {
    await _controller.deleteCar(id);
  }

  Future<void> updateCar(CarModel model) async {
    await _controller.updateCar(model);
  }
}
