import 'package:buddy1/view_model/signup_view_model.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    final signupController =
        Provider.of<SignUpViewModel>(context, listen: false);
    final provider = Provider.of<BottomNavigationBarProvider>(context);

    final homeController = Provider.of<HomeView>(context, listen: false);
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        //body: const SafeArea(child: Text('main')), // here the desired height
        child: AppBar(
          backgroundColor: KColors.kThemeYellow,
          title: const Text('BUDDY '
              // '${signupController.firstNameController.text.toUpperCase()}',
              ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () async {
                print('pressed.....................');
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
      body: ListView(physics: const BouncingScrollPhysics(), children: const [
        // StoryBar(),
        PostsView(),
      ]),
      bottomNavigationBar: CurvedNavigationBar(
        // key: bottomNavigationKey,
        //index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.add_circle_rounded, size: 30),
          Icon(Icons.notifications, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: KColors.kThemeYellow,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),

        onTap: (index) {
          provider.currentIndex = index;
        },
        letIndexChange: (index) => true,
      ),
    ));
  }
}

class PostsView extends StatelessWidget {
  const PostsView({Key? key}) : super(key: key);
  // final posts = TestDB.stories;

  @override
  Widget build(BuildContext context) {
    final posts = GetPostsService().getPostRepo(context);
    final homeController = Provider.of<HomeView>(context, listen: false);

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: homeController.allPost.length,
      itemBuilder: (context, index) => const PostCardl(),
    );
  }
}

class PostCardl extends StatelessWidget {
  const PostCardl({
    Key? key,
  }) : super(key: key);
  // final UserStory post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: Column(
        children: [
          Card(
            elevation: 10,
            clipBehavior: Clip.hardEdge,
            // margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                _buildHeader(context, context),
                _buildContent(context, context),
              ],
            ),
          ),
          _buildFooter()
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.favorite, color: Colors.red)),
                  const Text(
                    '1.2 K',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  IconButton(
                      padding: const EdgeInsets.all(3),
                      constraints: const BoxConstraints(),
                      onPressed: () {},
                      icon: const Icon(Icons.chat_bubble_outline)),
                  const Text(
                    '520',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  // const SizedBox(width: 10),
                  // IconButton(
                  //     padding: const EdgeInsets.all(3),
                  //     constraints: const BoxConstraints(),
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.send)),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  ListTile _buildHeader(context, index) {
    final homeController = Provider.of<HomeView>(context, listen: false);

    return ListTile(
      visualDensity: const VisualDensity(vertical: 0.01),
      leading: CircleAvatar(
          backgroundImage:
              NetworkImage(homeController.allPost[index].images.toString())),
      title: Text(
        homeController.allPost[index].text.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // subtitle: const Text(''),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }

  Padding _buildContent(context, index) {
    final homeController = Provider.of<HomeView>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100),
        child: Image.network(
          homeController.allPost[index].comments.toString(),
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
