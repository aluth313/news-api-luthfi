import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sort_event.dart';
part 'sort_state.dart';

class SortBloc extends Bloc<SortEvent, SortState> {
  SortBloc() : super(SortInitial()) {
    on<IsSorted>((event, emit) async {
      final isSorted = event.isSorted;
      emit(isSorted ? IsSortedNews() : IsNotSortedNews());
    });
  }
}
