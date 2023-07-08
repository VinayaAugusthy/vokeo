import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  TextEditingController searchController = TextEditingController();
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
              CupertinoSearchTextField(
                controller: searchController,
                backgroundColor:
                    const Color.fromARGB(255, 199, 192, 192).withOpacity(0.4),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
