import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/common_state.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:news_app/features/news_home/resources/repositary/news_repositary.dart';

class FetchSourceMediaListCubit extends Cubit<CommonState> {
  final NewsRepositary repositary;
  FetchSourceMediaListCubit({required this.repositary}) : super(CommonInitialState());

  fetchSourceMediaList({required String sourceId})async{
    emit(CommonLoadingState());
    final res = await repositary.fetchSourceMediaList(sourceId: sourceId);
    res.fold(
      (error) => emit(CommonErrorState(message: error)), 
      (data) => emit(CommonSuccessState<List<News>>(itemData: data))
  );
  }
}