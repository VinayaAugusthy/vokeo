import 'package:flutter/material.dart';
import 'package:vokeo/presentation/widget/search_field.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            size.width / 14,
          ),
          child: Column(
            children: [
              searchField(),
            ],
          ),
        ),
      ),
    );
  }
}
