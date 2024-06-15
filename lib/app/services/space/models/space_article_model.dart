class SpaceArticleModel {
  const SpaceArticleModel({
    required this.id,
    required this.title,
    required this.url,
    required this.imageUrl,
    required this.newsSite,
    required this.summary,
    required this.publishedAt,
    required this.updatedAt,
    required this.featured,
    required this.launches,
    required this.events,
  });

  factory SpaceArticleModel.fromJson(Map<String, dynamic> json) =>
      SpaceArticleModel(
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        imageUrl: json['image_url'] as String,
        newsSite: json['news_site'] as String,
        summary: json['summary'] as String,
        publishedAt: DateTime.parse(json['published_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        featured: json['featured'] as bool,
        launches: (json['launches'] as List<dynamic>?)
                ?.map((item) => Launches.fromJson(item as Map<String, dynamic>))
                .toList() ??
            [],
        events: (json['events'] as List<dynamic>?)
                ?.map((item) => Events.fromJson(item as Map<String, dynamic>))
                .toList() ??
            [],
      );

  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final DateTime publishedAt;
  final DateTime updatedAt;
  final bool featured;
  final List<Launches> launches;
  final List<Events> events;
}

class Launches {
  Launches({
    required this.launchId,
    required this.provider,
  });

  factory Launches.fromJson(Map<String, dynamic> json) => Launches(
        launchId: json['launch_id'],
        provider: json['provider'],
      );

  final String launchId;
  final String provider;

  Map<String, dynamic> toJson() => {
        'launch_id': launchId,
        'provider': provider,
      };
}

class Events {
  Events({
    required this.eventId,
    required this.provider,
  });

  factory Events.fromJson(Map<String, dynamic> json) => Events(
        eventId: json['event_id'],
        provider: json['provider'],
      );

  final int eventId;
  final String provider;

  Map<String, dynamic> toJson() => {
        'event_id': eventId,
        'provider': provider,
      };
}
