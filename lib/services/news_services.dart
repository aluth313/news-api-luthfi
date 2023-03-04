import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_luthfi/models/article.dart';

class NewsServices {
  final String baseUrl = 'https://newsapi.org/v2';
  final String apiKey = '5797017a125a4007a1e0bc73917ccecf';
  http.Client client = http.Client();

  Future<List<Article>> fetchNews(String category, {bool? sortBy}) async {
    String urlApi = sortBy != null
        ? '$baseUrl/top-headlines?country=id&category=$category&sortBy=publishedAt&apiKey=$apiKey'
        : '$baseUrl/top-headlines?country=id&category=$category&apiKey=$apiKey';
    final response = await client.get(Uri.parse(urlApi));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Error');
    }
  }

  Future<List<Article>> searchNews(String query, {bool? sortBy}) async {
    String urlApi = sortBy != null
        ? '$baseUrl/everything?q=$query&sortBy=publishedAt&apiKey=$apiKey'
        : '$baseUrl/everything?q=$query&apiKey=$apiKey';
    final response = await client.get(Uri.parse(urlApi));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Error');
    }
  }

  Future<List<Article>> sortNews(String sortBy) async {
    final response = await client
        .get(Uri.parse('$baseUrl/everything?q=$sortBy&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
