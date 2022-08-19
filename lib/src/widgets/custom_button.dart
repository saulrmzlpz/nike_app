import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.height = 50,
    this.width = 150,
    this.color = Colors.orange,
  }) : super(key: key);

  final String text;
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: color,
        shape: const StadiumBorder(),
        minimumSize: Size(width, height),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
