// ignore_for_file: file_names
import 'package:buddy1/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/size.dart';
import 'converse_view_model.dart';
import '../view/screens/widgets/conversation_card.dart';
import '../view/screens/widgets/shimmer.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final conversationProvider = Provider.of<ConverseViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          backgroundColor: KColors.kThemeYello,
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => Dismissible(
              key: Key(index.toString()),
              child: Selector<ConverseViewModel, bool>(
                selector: (_, obj) => obj.isLoading,
                builder: ((__, isLoading, _) {
                  return conversationProvider.isLoading
                      ? Column(
                          children: [
                            ShimmerEffect(
                              height: size.height / 10,
                              width: double.infinity,
                            ),
                            KSizedBox.kHeigh_20,
                            // const Loading(
                            //   color: KColors.kGreyColor,
                            // )
                          ],
                        )
                      : conversationProvider.allMsg.isEmpty
                          ? Column(
                              children: [
                                ShimmerEffect(
                                  height: size.height / 10,
                                  width: double.infinity,
                                ),
                                KSizedBox.kHeigh_5,
                              ],
                            )
                          : ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: conversationProvider.allMsg.length,
                              itemBuilder: ((_, index) {
                                return ConversationCard(
                                  thread: conversationProvider.allMsg[index],
                                );
                              }),
                              separatorBuilder: ((_, __) {
                                return KSizedBox.kHeigh_10;
                              }),
                            );
                }),
              )),
          itemCount: 10,
        ));
  }
}
