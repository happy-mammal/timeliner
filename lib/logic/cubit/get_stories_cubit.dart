import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repository/ArticleRepository.dart';

part 'get_stories_state.dart';

class GetStoriesCubit extends Cubit<GetStoriesState> {
  ArticleRepository articleRepository;
  GetStoriesCubit() : super(GetStoriesInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getStories() async {
    print("I AM HERE");
    emit(GetStoriesLoading());
    try {
      print("I AM TRYING");
      var result = await articleRepository.fetchStories();
      emit(GetStoriesSuccess(data: result));
    } catch (e) {
      emit(GetStoriesFailed(message: e.toString()));
    }
  }
}
