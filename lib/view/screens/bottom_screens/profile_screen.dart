import 'package:flutter/material.dart';

import '../../../extensions/testTb.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   get homeController => null;

//   @override
//   Widget build(BuildContext context) {
//     final homeController = Provider.of<HomeView>(context);
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: KColors.kThemePink,
//           title: const Text('BUDDY '
//               // '${signupController.firstNameController.text.toUpperCase()}',
//               ),
//           automaticallyImplyLeading: false,
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 //GetPostsService().getPostRepo(context);
//               },
//               icon: const Icon(Icons.settings),
//             ),
//             TextButton(
//                 onPressed: () {
//                   homeController.onLogoutButton(context);
//                 },
//                 child: const Text(
//                   'Logout',
//                   style: TextStyle(color: KColors.kWhiteColor, fontSize: 17),
//                 ))
//             // IconButton(
//             //   icon: const Icon(Icons.logout),
//             //   tooltip: 'Logout',
//             //   onPressed: () {
//             //     homeController.onLogoutButton(context);
//             //   },
//             // ),
//           ],
//         ),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//           child: Container(
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     const CircleAvatar(
//                       radius: 40,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 40),
//                       child: Column(
//                         children: const [
//                           TextWidget(),
//                           Text('Mail'),
//                           Text('Phone'),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Text('www.fsdfs.com'),
//                 const Text('Checkout'),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// class TextWidget extends StatelessWidget {
//   const TextWidget({
//     Key? key,
//     this.size,
//     this.fw,
//   }) : super(key: key);
//   final double? size;
//   final FontWeight? fw;
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'Name',
//       style: TextStyle(fontSize: size, fontWeight: fw),
//     );
//   }
// }

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: const [
          // ProfileWidget(
          //   heiht: math.max(size.height * .3, size.width * .3),
          // ),
          ProfilePostView()
        ],
      ),
    );
  }
}

class ProfilePostView extends StatefulWidget {
  const ProfilePostView({Key? key}) : super(key: key);

  @override
  State<ProfilePostView> createState() => _ProfilePostViewState();
}

class _ProfilePostViewState extends State<ProfilePostView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TabBar(
                  indicator: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(blurRadius: 10)]),
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.dashboard,
                        color: Colors.black,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        //FontAwesomeIcons.tag,
                        Icons.tag,
                        color: Colors.black,
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: const TabBarView(children: [
                PostView(conut: 14),
                PostView(
                  conut: 3,
                ),
              ]),
            ),
          ],
        ));
  }
}

class PostView extends StatelessWidget {
  const PostView({Key? key, required this.conut}) : super(key: key);
  final int conut;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 60),
        physics: const ClampingScrollPhysics(),

        // shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 7, mainAxisSpacing: 7),
        itemCount: conut,
        itemBuilder: (context, index) {
          return SizedBox(
            width: double.infinity,
            height: 100,
            child: Image.network(
              TestDB.postUrls[index < 4 ? index : 3],
              fit: BoxFit.cover,
            ),
          );
        });
  }
}
