import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/category_screen/cubit/fetch_categoryList_cubit.dart';
import 'package:news_app/features/news_home/UI/pages/widgets/News_Initial_HomeBody.dart';
import 'package:news_app/features/news_home/cubit/fetch_sourceMediaList_cubit.dart';
import 'package:news_app/features/news_home/cubit/fetch_topheadlines_cubit.dart';
import 'package:news_app/features/news_home/resources/repositary/news_repositary.dart';

class NewsInitialHomeScreen extends StatelessWidget {
  final String sourceId;
  const NewsInitialHomeScreen({super.key,required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchTopHeadlinesNewsCubit(
              repositary: context.read<NewsRepositary>())
            ..fetchTopHeadlinesNews(),
        ),
        BlocProvider(
          create: (context) => FetchSourceMediaListCubit(
            repositary: context.read<NewsRepositary>()
          )..fetchSourceMediaList(sourceId: "bbc-news"),
        ),
       BlocProvider(
          create: (context) => FetchNewsCategoryListCubit(
            repositary: context.read<NewsRepositary>()
          )..fetchNewsCategoryList(categoryId: sourceId),
        ),
      ],
      child: const NewsInitialHomeBody(),
    );
  }
}
