part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsEmpty extends NewsState {}

class NewsLoading extends NewsState {}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object> get props => [message];
}

class NewsHasData extends NewsState {
  final List<Article> result;

  NewsHasData(this.result);

  @override
  List<Object> get props => [result];
}
