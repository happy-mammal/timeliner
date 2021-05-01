import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  ArticleRepository articleRepository;
  SearchCubit() : super(SearchInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getSearchResults(String term, String limit) async {
    emit(SearchLoading());
    try {
      var results = [];
      if (term.isEmpty) {
        results = await articleRepository.fetchLatest();
      } else {
        results = await articleRepository.fetchArticles(term, limit);
      }
      emit(SearchSuccess(data: results));
    } catch (e) {
      emit(SearchFailed(message: e.toString()));
    }
  }
}
