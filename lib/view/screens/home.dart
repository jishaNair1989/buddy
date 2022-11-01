import 'package:buddy1/view/screens/widgets/bottom_nav.dart';
import 'package:buddy1/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import '../../services/get_post_service.dart';
import '../../utils/colors.dart';
import '../../view_model/bottomNav_view_model.dart';
import '../../view_model/home_view_model.dart';

class MainProfile extends StatelessWidget {
  const MainProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const storage = FlutterSecureStorage();
    final signupController = Provider.of<SignUpViewModel>(context);
    final provider = Provider.of<BottomNavigationBarProvider>(context);

    final homeController = Provider.of<HomeView>(context);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: KColors.kThemePink,
          title: const Text('BUDDY '
              // '${signupController.firstNameController.text.toUpperCase()}',
              ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () async {
                GetPostsService().getPostRepo(context);
              },
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
              onPressed: () {
                homeController.onLogoutButton(context);
              },
            ),
          ],
        ),
      ),
      body: homeController.homeDatas.isEmpty
          ? const Center(
              child: Text('No data'),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 22,
                            child: ClipOval(
                              child: Image.network(homeController
                                      .homeDatas[index].user?.picture ??
                                  ''),
                            ),
                          ),
                          title: Text(
                            homeController.homeDatas[index].user!.username!,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert)),
                        ),
                        Container(
                          height: 350,
                          width: 450,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Image.network(
                              homeController.homeDatas[index].images?.first.url
                                  // homeController.homeDatas[index].images?.url
                                  ??
                                  '',
                              fit: BoxFit.cover),
                        ),
                        ListTile(
                            leading: Text(
                          homeController.homeDatas[index].createdAt.toString(),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ))
                      ],
                    ),
                  ),
                );
              },
              itemCount: homeController.homeDatas.length,
              // children: [
              // StoryBar(),
              // PostsView(),
              // ]
            ),
      bottomNavigationBar: CurvedNavBar(provider),
    ));
  }
}
