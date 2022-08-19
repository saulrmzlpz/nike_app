import 'package:flutter/material.dart';
import 'package:nike_app/src/models/sneaker_model.dart';
import 'package:nike_app/src/screens/sneaker_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SneakerModel()),
      ],
      child: const MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nike App',
      home: SneakerScreen(),
    );
  }
}
