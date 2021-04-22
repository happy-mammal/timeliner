import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repository/ArticleRepository.dart';

part 'curated_source_feed_state.dart';

class CuratedSourceFeedCubit extends Cubit<CuratedSourceFeedState> {
  ArticleRepository articleRepository;
  CuratedSourceFeedCubit() : super(CuratedSourceFeedInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getCuratedSourceFeed() async {
    emit(CuratedSourceFeedLoading());
    try {
      var result = await articleRepository.fetchArticlesFromSource("", "");
      emit(CuratedSourceFeedSuccess(data: result));
    } catch (e) {
      emit(CuratedSourceFeedFailed(message: e.toString()));
    }
  }
}
