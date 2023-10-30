
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/common_state.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:news_app/features/news_home/resources/repositary/news_repositary.dart';

class FetchNewsDetailsCubit extends Cubit<CommonState> {
  final NewsRepositary repositary;
  FetchNewsDetailsCubit({required this.repositary}) : super(CommonInitialState());

  fetchNewsDetails()async{
    emit(CommonLoadingState());
    final res = await repositary.fetchNewsDetails();
    res.fold(
      (eror) => emit(CommonErrorState(message: eror)), 
      (data) => emit(CommonSuccessState<News>(itemData: data))
    );
  }
}