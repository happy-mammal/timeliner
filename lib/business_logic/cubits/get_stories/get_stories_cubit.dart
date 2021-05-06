import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'get_stories_state.dart';

class GetStoriesCubit extends Cubit<GetStoriesState> {
  ArticleRepository articleRepository;
  GetStoriesCubit() : super(GetStoriesInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getStories() async {
    emit(GetStoriesLoading());
    try {
      var result = await articleRepository.fetchStories();

      emit(GetStoriesSuccess(data: result));
    } catch (e) {
      emit(GetStoriesFailed(message: e.toString()));
    }
  }
}
