import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_luthfi/models/article.dart';
import 'package:news_app_luthfi/services/news_services.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsServices _newsServices;

  NewsBloc(this._newsServices) : super(NewsLoading()) {
    on<FetchNews>((event, emit) async {
      final category = event.category;
      final isSorted = event.isSorted;

      emit(NewsLoading());
      try {
        final articles = await _newsServices.fetchNews(category, isSorted);
        articles.isNotEmpty ? emit(NewsHasData(articles)) : emit(NewsEmpty());
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });

    on<SearchNews>((event, emit) async {
      final query = event.query;
      final isSorted = event.isSorted;

      emit(NewsLoading());
      try {
        final articles = await _newsServices.searchNews(query, isSorted);
        articles.isNotEmpty ? emit(NewsHasData(articles)) : emit(NewsEmpty());
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
