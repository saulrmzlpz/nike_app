import 'package:flutter/material.dart';

class SneakerModel with ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _size = 9.0;

  String get assetImage => _assetImage;

  set assetImage(String valor) {
    _assetImage = valor;
    notifyListeners();
  }

  double get size => _size;

  set size(double s) {
    _size = s;
    notifyListeners();
  }
}
