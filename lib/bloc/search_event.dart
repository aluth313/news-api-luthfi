part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchNewsWithQuery extends SearchEvent {
  final String query;

  SearchNewsWithQuery(this.query);
}

class SearchNewsEmpty extends SearchEvent {}
