import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_luthfi/services/news_services.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final NewsServices _newsServices;

  CategoryBloc(this._newsServices) : super(CategoryEmpty()) {
    on<CategoryFilterNews>((event, emit) async {
      final category = event.category;

      emit(CategoryFilter(category));
      // try {
      //   final articles = await _newsServices.fetchNews(category);
      //   emit(NewsHasData(articles));
      // } catch (e) {
      //   emit(NewsError(e.toString()));
      // }
    });
  }
}
