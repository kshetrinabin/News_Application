import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/common/bloc/common_state.dart';
import 'package:news_app/features/news_details/UI/pages/news_details_screen.dart';
import 'package:news_app/features/news_home/UI/pages/widgets/news_card.dart';
import 'package:news_app/features/news_home/UI/pages/widgets/source_newsmedia_listCard.dart';
import 'package:news_app/features/news_home/cubit/fetch_sourceMediaList_cubit.dart';
import 'package:news_app/features/news_home/cubit/fetch_topheadlines_cubit.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class HomeCategoryBody extends StatefulWidget {
  const HomeCategoryBody({super.key});

  @override
  State<HomeCategoryBody> createState() => _HomeCategoryBodyState();
}

class _HomeCategoryBodyState extends State<HomeCategoryBody> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SingleChildScrollView(
       child: Container(
         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Column(
               children: [
                 BlocBuilder<FetchSourceMediaListCubit, CommonState>(
                   builder: (context, state) {
                     if (state is CommonErrorState) {
                       return Center(
                         child: Text(state.message),
                       );
                     } else if (state is CommonSuccessState<List<News>>) {
                       return SizedBox(
                         height: 285,
                         child: ListView.builder(
                           scrollDirection: Axis.horizontal,
                           itemCount: state.itemData.length,
                           itemBuilder: (context, index) {
                             return SourceMediaListCard(
                                 item: state.itemData[index],
                              onPressed: () {
                                 Navigator.of(context).push(
                                   PageTransition(
                                     child: NewsDetailsScreen(
                                       item: state.itemData[index],
                                     ),
                                     type: PageTransitionType.fade));
                               },
                             );
                           },
                         ),
                       );
                    //  } else {
                    //    return const CupertinoActivityIndicator();
                    //  }
                   } else{
                      return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                      height: 250,
                      width: 350,
                      // width: MediaQuery.of(context).size.width,
                      color: Colors.white,
              ), 
              
              );
                    }
                   },
                 ),
                 const SizedBox(
                   height: 6,
                 ),
                 BlocBuilder<FetchTopHeadlinesNewsCubit, CommonState>(
                   builder: (context, state) {
                     if (state is CommonErrorState) {
                       return Center(
                         child: Text(state.message),
                       );
                     } else if (state is CommonSuccessState<List<News>>) {
                       return ListView.builder(
                           itemCount: state.itemData.length,
                           shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                           itemBuilder: (context, index) {
                             return NewsCard(
                               item: state.itemData[index],
                               onPressed: () {
                                 Navigator.of(context).push(PageTransition(
                                     child: NewsDetailsScreen(
                                       item: state.itemData[index],
                                     ),
                                     type: PageTransitionType.fade));
                               },
                             );
                           });
                     } else {
                       return const Center(
                         child: CupertinoActivityIndicator(),
                       );
                     }
                   },
                 )
               ],
             ),
           ],
         ),
       ),
       
     ),
   );
  }
}