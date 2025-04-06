import 'package:cars/controller/api_service.dart';
import 'package:cars/model/car_model.dart';
import 'package:flutter/material.dart';

class TextItem extends StatelessWidget {
  const TextItem({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      ),
    );
  }
}
