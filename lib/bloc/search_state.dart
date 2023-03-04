part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchEmpty extends SearchState {}

class SearchNotEmpty extends SearchState {
  final String query;

  SearchNotEmpty(this.query);

  @override
  List<Object> get props => [query];
}
