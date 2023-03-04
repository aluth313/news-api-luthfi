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

      emit(NewsLoading());
      try {
        final articles = await _newsServices.fetchNews(category);
        emit(NewsHasData(articles));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });

    on<SearchNews>((event, emit) async {
      final query = event.query;

      emit(NewsLoading());
      try {
        final articles = await _newsServices.searchNews(query);
        emit(NewsHasData(articles));
      } catch (e) {
        emit(NewsError(e.toString()));
      }
    });
  }
}
