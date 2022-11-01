import 'package:buddy1/view/screens/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../extensions/testDb.dart';
import '../../model/user_story.dart';
import '../../services/get_post_service.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../view_model/bottomNav_view_model.dart';
import '../../view_model/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavigationBarProvider>(context);
    final homeController = Provider.of<HomeView>(context);

    return Scaffold(
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
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        //StoryBar(),
        PostsView(),
      ]),
      bottomNavigationBar: CurvedNavBar(provider),
    );
  }
}

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  final posts = TestDB.stories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 60),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) => PostCardl(post: posts[index]),
    );
  }
}

class PostCardl extends StatelessWidget {
  const PostCardl({Key? key, required this.post}) : super(key: key);
  final UserStory post;
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
                _buildHeader(),
                _buildContent(),
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

  ListTile _buildHeader() {
    return ListTile(
      visualDensity: const VisualDensity(vertical: 0.01),
      leading: CircleAvatar(
          backgroundImage:
              NetworkImage(post.avatar ?? Constants.defaultAvathar)),
      title: Text(
        post.userName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      // subtitle: const Text(''),
      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
    );
  }

  Padding _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 100),
        child: Image.network(
          post.contents[0].contentUri,
          width: double.infinity,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
