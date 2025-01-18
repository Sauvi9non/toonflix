import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  //왜 static 쓰는거지...? 아니 static이 그냥 공기마냥 실행되던말든 처음부터 존재하는 그런 거인건 아는데
  // static...그러면 하나만 객체 생성해도 ok라는 건가
  //data fetch
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //API 요청
  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    //baseUrl에 요청 보내려면 일단 http 패키지 설치해야함
    //패키지는 pub.dev 에서 npm 같은 개념 https://pub.dev/
    final response = await http.get(
        url); //Sends an HTTP GET request with the given headers to the given URL.
    //get은 Future 타입의 Response를
    // Future는 미래에 받을 값을 알려준다. Promise 같은 것
    // 동기로 처리하길 원한다.  서버 응답때까지 기다려ㅓㅓㅓ
    // await -> 기다려, 비동기 함수(async)내에서만 -> Promise,Future 반환하는
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error(); //아니면 에러 발생
  }

  //API가 반환한 JSON 콘솔에 출력
}
