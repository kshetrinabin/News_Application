import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/common_state.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:news_app/features/news_home/resources/repositary/news_repositary.dart';

class FetchTopHeadlinesNewsCubit extends Cubit<CommonState> {
 final NewsRepositary repositary;
  FetchTopHeadlinesNewsCubit({required this.repositary}) : super(CommonInitialState());
  
    
    fetchTopHeadlinesNews()async{
     emit(CommonLoadingState());
    final res = await repositary.fetchNewsList();
    res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState<List<News>>(itemData: data))
    );
    }
   
  }

 
