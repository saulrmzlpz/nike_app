import 'package:flutter/material.dart';

class SneakerDescription extends StatelessWidget {
  const SneakerDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          Text(description, style: const TextStyle(color: Colors.black54, height: 1.4)),
        ],
      ),
    );
  }
}
