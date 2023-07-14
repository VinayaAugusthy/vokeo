// import 'package:flutter/material.dart';
// import 'package:vokeo/core/constants/colors.dart';
// import 'package:vokeo/core/constants/constants.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(size.width / 8),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               kheight20,
//               const Text(
//                 'Username',
//                 style: textBold,
//               ),
//               kheight20,
//               const Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                   ),
//                   Spacer(),
//                   Column(
//                     children: [
//                       Text(
//                         '215',
//                         style: textBold,
//                       ),
//                       Text(
//                         'Followers',
//                         style: textBold,
//                       ),
//                     ],
//                   ),
//                   Spacer(),
//                   Column(
//                     children: [
//                       Text(
//                         '1000',
//                         style: textBold,
//                       ),
//                       Text(
//                         'Following',
//                         style: textBold,
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               kheight30,
//               Row(
//                 children: [
//                   Padding(
//                     padding: EdgeInsets.all(size.width / 10),
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: const Text(
//                         'Edit Profile',
//                         style: textBold,
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.settings,
//                         color: appColor,
//                       ))
//                 ],
//               ),
//               const Expanded(
//                 // color: appColor,
//                 child: DefaultTabController(
//                   length: 2,
//                   child: SingleChildScrollView(
//                     child: TabBar(tabs: [
//                       Tab(
//                         icon: Icon(
//                           Icons.image,
//                           color: appColor,
//                         ),
//                       ),
//                       Tab(
//                         icon: Icon(
//                           Icons.bookmark,
//                           color: appColor,
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: TabBarView(children: [
//                   Center(
//                     child: Text('Posts'),
//                   ),
//                   Center(
//                     child: Text('Saved'),
//                   )
//                 ]),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:vokeo/core/constants/colors.dart';
import 'package:vokeo/core/constants/constants.dart';
import 'package:vokeo/presentation/screens/profile/widgets/profile_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                kheight20,
                const Text(
                  'Username',
                  style: textBold,
                ),
                kheight20,
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 34,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/dhoni.jpeg'),
                    ),
                    kWidth30,
                    Column(
                      children: [
                        Text(
                          '215',
                          style: textBold,
                        ),
                        Text(
                          'Followers',
                          style: textBold,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          '1000',
                          style: textBold,
                        ),
                        Text(
                          'Following',
                          style: textBold,
                        ),
                      ],
                    ),
                  ],
                ),
                kheight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Edit Profile',
                        style: textBold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: appColor,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      const TabBar(
                        tabs: [
                          Tab(
                            icon: Icon(
                              Icons.image,
                              color: appColor,
                            ),
                          ),
                          Tab(
                            icon: Icon(
                              Icons.bookmark,
                              color: appColor,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            profileGrid(),
                            profileGrid(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
