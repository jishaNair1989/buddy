import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          toolbarHeight: 80,
          // title: const Text('S E A R C H',style: TextStyle(color: Colors.black54),),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black54,
              )),
          backgroundColor: Colors.grey[300],
          elevation: 0,
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              style: const TextStyle(height: 1),
              decoration: InputDecoration(
                  labelText: 'Search',
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
              onChanged: (String? value) {
                // provider.searchFilter(value);
              },
            ),
          ),
          SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: const [
              // Consumer<SearchProvider>(
              //     builder: (context, value, Widget? child) {
              ListTile(),
// return ListView.separated(
//                       shrinkWrap: true,
//                       physics: const ClampingScrollPhysics(),
//                       scrollDirection: Axis.vertical,
//                       itemBuilder: (context, index) {
//                         final data = value.temp[index];
//                         return NewBox(
//                           child: ListTile(
//                             leading: QueryArtworkWidget(
//                                 nullArtworkWidget: const Icon(Icons.music_note),
//                                 artworkFit: BoxFit.cover,
//                                 id: data.id,
//                                 type: ArtworkType.AUDIO),
//                             title: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Text(
//                                 data.title,
//                                 style: const TextStyle(color: Colors.black),
//                               ),
//                             ),
//                             onTap: () {
//                               final searchIndex = createSearchIndex(data);
//                               FocusScope.of(context).unfocus();
//                               GetSongs.player.setAudioSource(
//                                   GetSongs.createSongList(MusicHomeScreen.song),
//                                   initialIndex: searchIndex);
//                               GetSongs.player.play();
//                               Navigator.of(context).push(MaterialPageRoute(
//                                   builder: (ctx) => SongPageScreen(
//                                       playerSong: MusicHomeScreen.song)));
//                             },
//                           ),
//                         );
//                       },
//                       separatorBuilder: (ctx, index) {
//                         return const Divider();
//                       },
//                       itemCount: provider.temp.length);
//                 }),
//               ],
//             ),
              //   ),
              // ),
            ]),
          ))
        ]));

  }
}
