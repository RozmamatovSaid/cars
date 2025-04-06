import 'package:cars/controller/car_controller.dart';
import 'package:cars/model/car_model.dart';
import 'package:cars/view/widgets/text_item.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.image,
    required this.model,
    required this.year,
    required this.speed,
    required this.price,
    required this.editOnPressed,
    required this.deleteOnPressed,
  });

  final String image;
  final String model;
  final int year;
  final int speed;
  final num price;
  final VoidCallback editOnPressed, deleteOnPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: EdgeInsets.only(bottom: 20),
      width: 350,
      // height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 4),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.network(image, width: 300, height: 150, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextItem(title: "Model: $model"),
                  TextItem(title: "Year: $year"),
                  TextItem(title: "Speed: $speed km/h"),
                  TextItem(title: "Price: $price\$"),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: editOnPressed,
                    icon: Icon(Icons.edit, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: deleteOnPressed,
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
