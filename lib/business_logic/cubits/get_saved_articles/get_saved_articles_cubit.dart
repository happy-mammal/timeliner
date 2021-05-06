import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'get_saved_articles_state.dart';

class GetSavedArticlesCubit extends Cubit<GetSavedArticlesState> {
  ArticleRepository articleRepository;
  GetSavedArticlesCubit() : super(GetSavedArticlesInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getSavedArticles(List<String> articleIds) async {
    emit(GetSavedArticlesLoading());
    try {
      var results = [];

      results = await articleRepository.fetchArticlesById(articleIds);

      emit(GetSavedArticlesSuccess(articles: results));
    } catch (e) {
      emit(GetSavedArticlesFailed(message: e.toString()));
    }
  }
}
