part of 'sort_bloc.dart';

@immutable
abstract class SortState {}

class SortInitial extends SortState {}

class IsSortedNews extends SortState {}

class IsNotSortedNews extends SortState {}
