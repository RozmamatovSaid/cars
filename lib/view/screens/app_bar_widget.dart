import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Text(
        "Cars",
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Container(
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            child: IconButton(onPressed: onPressed, icon: Icon(Icons.add_sharp)),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
