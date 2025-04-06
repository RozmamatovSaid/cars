import 'package:cars/controller/car_controller.dart';
import 'package:cars/view/screens/app_bar_widget.dart';
import 'package:cars/view/widgets/cars_card.dart';
import 'package:flutter/material.dart';

class CarScreen extends StatefulWidget {
  const CarScreen({super.key});

  @override
  State<CarScreen> createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  final _formKey = GlobalKey<FormState>();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _speedController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageController = TextEditingController();

  CarController carController = CarController();
  late List<TextEditingController> controllers = [];

  @override
  void initState() {
    controllers = [
      _modelController,
      _yearController,
      _speedController,
      _priceController,
      _imageController,
    ];
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidget(
        onPressed:
            () => showDialog(
              context: context,
              barrierDismissible: true,
              builder:
                  (context) => Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 10,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Form(
                              key: _formKey,
                              child: Column(
                                spacing: 10,
                                children: [
                                  TextFormField(
                                    controller: _modelController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter model',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "model not entered";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _yearController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter year',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "year not entered";
                                      }
                                      return null;
                                    },
                                  ),

                                  TextFormField(
                                    controller: _speedController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter speed',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "speed not entered";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _priceController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter price',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "price not entered";
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _imageController,
                                    decoration: InputDecoration(
                                      labelText: 'Enter image Url',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "image Url not entered";
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    for (var i in controllers) {
                                      i.clear();
                                    }
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  child: Text('close'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      for (var i in controllers) {
                                        i.clear();
                                      }
                                      Navigator.pop(context);
                                      setState(() {});
                                    }
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            ),
      ),
      body: FutureBuilder(
        future: carController.getCars(),
        builder: (context, snapshot) {
          var cars = snapshot.data;
          return snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : cars == null || (cars.isEmpty)
              ? CircularProgressIndicator()
              : ListView.builder(
                padding: EdgeInsets.only(top: 20),
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: CarCard(
                      image: cars[index].image,
                      model: cars[index].model,
                      year: cars[index].year,
                      speed: cars[index].speed,
                      price: cars[index].price,
                      editOnPressed: () {},
                      deleteOnPressed: () {},
                    ),
                  );
                },
              );
        },
      ),
    );
  }
}
