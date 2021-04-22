import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repository/ArticleRepository.dart';

part 'curated_category_feed_state.dart';

class CuratedCategoryFeedCubit extends Cubit<CuratedCategoryFeedState> {
  ArticleRepository articleRepository;
  CuratedCategoryFeedCubit() : super(CuratedCategoryFeedInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getCuratedCategoryFeed() async {
    emit(CuratedCategoryFeedLoading());
    try {
      var result = await articleRepository.fetchArticlesFromCategory("", "");
      emit(CuratedCategoryFeedSuccess(data: result));
    } catch (e) {
      emit(CuratedCategoryFeedFailed(message: e.toString()));
    }
  }
}
