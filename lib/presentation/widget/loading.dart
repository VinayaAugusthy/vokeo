import 'package:flutter/material.dart';

circularProgress() {
  return const Center(child: CircularProgressIndicator());
}

linearProgress() {
  return const Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: LinearProgressIndicator(),
  );
}
