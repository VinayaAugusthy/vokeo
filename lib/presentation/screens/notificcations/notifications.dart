import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Notifications',
                style: textBold,
              ),
              kheight30,
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return const ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/dhoni.jpeg'),
                      ),
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
