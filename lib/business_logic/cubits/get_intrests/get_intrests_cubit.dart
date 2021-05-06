import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timeliner/data/repositories/article_repository.dart';

part 'get_intrests_state.dart';

class GetIntrestsCubit extends Cubit<GetIntrestsState> {
  ArticleRepository articleRepository;
  GetIntrestsCubit() : super(GetIntrestsInitial()) {
    this.articleRepository = ArticleRepository();
  }

  Future<void> getArticlesFromIntrests(List<String> intrests) async {
    emit(GetIntrestsLoading());
    try {
      if (intrests.isEmpty) {
        emit(GetIntrestsEmpty());
      } else {
        var results = await articleRepository.fetchArticlesByTerm(intrests);
        print(results);
        emit(GetIntrestsSuccess(data: results));
      }
    } catch (e) {
      print(e.toString());
      emit(GetIntrestsFailed(message: e.toString()));
    }
  }
}
