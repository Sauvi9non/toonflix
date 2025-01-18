import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    print(webtoons);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.black,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 10,
        title: const Text(
          "Today's toon",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return makeList(snapshot);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        print(index);
        return Text(
          webtoon.title,
          style: const TextStyle(
            fontSize: 50,
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 50,
      ),
    );
  }
}
