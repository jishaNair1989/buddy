import 'package:flutter/material.dart';

import '../../../view_model/home_view_model.dart';

ListView homeBuilder(HomeViewModel homeController) {
  return ListView.builder(
    physics: const BouncingScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 22,
                  child: ClipOval(
                    child: Image.network(
                        homeController.homeDatas[index].user?.picture ?? ''),
                  ),
                ),
                title: Text(
                  homeController.homeDatas[index].user?.username ??
                      'Name is not available',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ),
              Container(
                height: 350,
                width: 450,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Image.network(
                    homeController.homeDatas[index].images!.first.url
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
  );
}
