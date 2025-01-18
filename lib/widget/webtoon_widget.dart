import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              // fullscreenDialog: true,
              builder: (context) =>
                  DetailScreen(title: title, thumb: thumb, id: id),
            ));
      }, //대부분의 동작을 감지하도록 해준다.
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    offset: const Offset(5, 5),
                    color: Colors.black.withAlpha(150),
                  ),
                ],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              clipBehavior: Clip.hardEdge,
              width: 250,
              child: Image.network(
                thumb,
                headers: {'Referer': 'https://comic.naver.com'},
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
