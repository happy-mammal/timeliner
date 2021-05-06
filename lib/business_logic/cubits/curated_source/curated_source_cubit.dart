import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'curated_source_state.dart';

class CuratedSourceCubit extends Cubit<CuratedSourceState> {
  ArticleRepository articleRepository;
  CuratedSourceCubit() : super(CuratedSourceInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getCuratedSourceFeed(String source, int limit) async {
    emit(CuratedSourceLoading());
    try {
      var result = await articleRepository.fetchArticlesFromSource(source, limit);
      emit(CuratedSourceSuccess(data: result));
    } catch (e) {
      emit(CuratedSourceFailed(message: e.toString()));
    }
  }
}
