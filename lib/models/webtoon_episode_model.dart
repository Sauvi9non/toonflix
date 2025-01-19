class WebtoonEpisodeModel {
  final String id, title, rating, date, thumb;

  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'], //""이긴해...
        id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
