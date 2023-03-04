part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class FetchNews extends NewsEvent {
  final String category;

  FetchNews(this.category);
}

class SearchNews extends NewsEvent {
  final String query;

  SearchNews(this.query);
}
