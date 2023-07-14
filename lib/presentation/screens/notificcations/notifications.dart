import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../widget/search_field.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
              kheight30,
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(),
                      title: Text('_ann liked your post'),
                      trailing: Text('20m'),
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
