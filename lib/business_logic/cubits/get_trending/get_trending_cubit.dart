import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'get_trending_state.dart';

class GetTrendingCubit extends Cubit<GetTrendingState> {
  ArticleRepository articleRepository;
  GetTrendingCubit() : super(GetTrendingInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getTrending() async {
    print('GET TRENDING');
    emit(GetTrendingLoading());
    try {
      var result = await articleRepository.fetchTrending();
      emit(GetTrendingSuccess(data: result));
    } catch (e) {
      emit(GetTrendingFailed(message: e.toString()));
    }
  }
}
