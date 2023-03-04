part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}

class FetchNews extends NewsEvent {
  final String category;
  final bool isSorted;

  FetchNews(this.category, this.isSorted);
}

class SearchNews extends NewsEvent {
  final String query;
  final bool isSorted;

  SearchNews(this.query, this.isSorted);
}
