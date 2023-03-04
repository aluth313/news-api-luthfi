import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_luthfi/models/article.dart';

class NewsServices {
  final String baseUrl = 'https://newsapi.org/v2';
  final String apiKey = '8cb20d9aa9bb4a37a33bf61d60ca4a18';
  http.Client client = http.Client();

  Future<List<Article>> fetchNews(String category, bool sortBy) async {
    String urlApi = sortBy == true
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

  Future<List<Article>> searchNews(String query, bool sortBy) async {
    String urlApi = sortBy == true
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
