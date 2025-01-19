import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widget/episode_widget.dart';

import '../models/webtoon_episode_model.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  //여기서는 Homescreen에서 한 것처럼 getToonById를 할 수 없다.
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: widget.id,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 7,
                            offset: const Offset(5, 5),
                            color: Colors.black.withAlpha(150),
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                      ),
                      clipBehavior: Clip.hardEdge,
                      width: 250,
                      child: Image.network(
                        widget.thumb,
                        headers: {'Referer': 'https://comic.naver.com'},
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            "${snapshot.data!.genre} / ${snapshot.data!.age}",
                            style: const TextStyle(fontSize: 16),
                          )
                        ],
                      );
                    }
                    return const Text("...");
                  }),
              const SizedBox(
                height: 25,
              ),
              FutureBuilder(
                  future: episodes,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data!);
                      return Column(
                        //어차피 에피소드 10개만 해줘서...
                        children: [
                          for (var episode in snapshot.data!)
                            Episode(episode: episode, webtoonId: widget.id)
                        ],
                      );
                    }
                    return const Text("No data");
                  })
            ],
          ),
        ),
      ),
    ); //홈 스크린을 떠날거라서 Scaffold 다시 그려줘야한다.
  }
}
