part of 'sort_bloc.dart';

@immutable
abstract class SortEvent {}

class IsSorted extends SortEvent {
  final bool isSorted;

  IsSorted(this.isSorted);
}

class SortedInitial extends SortEvent {}
