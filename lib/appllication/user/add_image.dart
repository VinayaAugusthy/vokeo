import 'package:flutter/foundation.dart';

class ImageState extends ChangeNotifier {
  String _imagePath = "";

  String get imagePath => _imagePath;

  void setImagePath(String path) {
    _imagePath = path;
    notifyListeners();
  }
}
