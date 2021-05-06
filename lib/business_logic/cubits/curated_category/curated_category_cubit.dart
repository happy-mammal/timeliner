import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'curated_category_state.dart';

class CuratedCategoryCubit extends Cubit<CuratedCategoryState> {
  ArticleRepository articleRepository;
  CuratedCategoryCubit() : super(CuratedCategoryInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getCuratedCategoryFeed(String category, int limit) async {
    emit(CuratedCategoryLoading());
    try {
      var result = await articleRepository.fetchArticlesFromCategory(category, limit);

      emit(CuratedCategorySuccess(data: result));
    } catch (e) {
      emit(CuratedCategoryFailed(message: e.toString()));
    }
  }
}
