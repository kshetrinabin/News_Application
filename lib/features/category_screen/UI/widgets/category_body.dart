import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/common_state.dart';
import 'package:news_app/features/category_screen/cubit/fetch_categoryList_cubit.dart';
import 'package:news_app/features/news_details/UI/pages/news_details_screen.dart';
import 'package:news_app/features/news_home/UI/pages/widgets/news_card.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:page_transition/page_transition.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FetchNewsCategoryListCubit, CommonState>(
        builder: (context, state) {
          if(state is CommonErrorState){
            return Center(
              child: Text(
                state.message
              ),
            );
          }else if(state is CommonSuccessState<List<News>>){
           return ListView.builder(
              itemCount: state.itemData.length,
              itemBuilder: (context,index){
                return NewsCard(
                  item:state.itemData[index],
                  onPressed: () {
                    Navigator.of(context).push(
                      PageTransition(
                        child: NewsDetailsScreen(
                          item: state.itemData[index]
                          ), 
                        type: PageTransitionType.fade
                      )
                    );
                  },
                );
              }
                 );
          }else{
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }
         
        },
      ),
    );
  }
}