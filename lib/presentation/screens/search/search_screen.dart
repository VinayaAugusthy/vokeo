import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/screens/search/widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: size.width / 20,
            top: size.width / 14,
            right: size.width / 20,
          ),
          child: Column(
            children: [
              searchField(),
              kheight30,
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/dhoni.jpeg'),
                      ),
                      title: Text('Username'),
                    );
                  },
                  itemCount: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
