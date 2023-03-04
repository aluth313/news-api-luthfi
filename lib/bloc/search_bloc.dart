import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchEmpty()) {
    on<SearchNewsWithQuery>((event, emit) async {
      final query = event.query;
      emit(query.isNotEmpty ? SearchNotEmpty(query) : SearchEmpty());
    });

    on<SearchNewsEmpty>((event, emit) async {
      emit(SearchEmpty());
    });
  }
}
