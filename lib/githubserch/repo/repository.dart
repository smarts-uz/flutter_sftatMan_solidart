import 'package:flutter_solidart_testapp/githubserch/models/search_result.dart';
import 'package:flutter_solidart_testapp/githubserch/service/client.dart';
import 'package:flutter_solidart_testapp/githubserch/service/in_memory_cache.dart';

class GithubRepository {
  GithubRepository({
    required this.client,
    required this.cache,
  });

  final InMemoryCache cache;
  final GithubClient client;

  Future<SearchResult> search(String term) async {
    return await cache.fetch(() => client.search(term));
  }
}
