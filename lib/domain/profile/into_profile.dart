import 'package:flutter/material.dart';

class DpSetterModel extends ChangeNotifier {
  String _imagePath = '';
  String get imagePath => _imagePath;
  void setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }
}
