import 'package:podcast_search/podcast_search.dart';

class PodcastRepository {
  Future<Podcast> getPodcastData() async {
    final rssFeedUrl = 'https://anchor.fm/s/daf584/podcast/rss';
    Podcast podcast = await Podcast.loadFeed(url: rssFeedUrl);
    return podcast;
  }
}
