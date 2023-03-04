part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {}

class CategoryFilterNews extends CategoryEvent {
  final String category;

  CategoryFilterNews(this.category);
}

class CategoryFilterEmpty extends CategoryEvent {}
