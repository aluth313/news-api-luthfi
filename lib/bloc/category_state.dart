part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

class CategoryFilter extends CategoryState {
  final String category;

  CategoryFilter(this.category);

  @override
  List<Object> get props => [category];
}

class CategoryEmpty extends CategoryState {}
