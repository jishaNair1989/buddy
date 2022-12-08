import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/colors.dart';
import '../../../view_model/home_view_model.dart';
import '../widgets/home_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final signupController = Provider.of<SignUpViewModel>(context);
    // final provider = Provider.of<BottomNavigationBarProvider>(context);

    final homeController = Provider.of<HomeViewModel>(context);
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
                // GetPostsService().getPostRepo(context);
              },
              icon: const Icon(Icons.notifications),
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
          : homeBuilder(homeController),
    ));
  }
}
