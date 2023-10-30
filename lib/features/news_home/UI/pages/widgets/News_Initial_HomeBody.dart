import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/category_screen/UI/pages/Home_category_screen.dart';
import 'package:news_app/features/category_screen/UI/pages/category_screen.dart';
import 'package:news_app/features/news_home/UI/pages/widgets/FlutterNews_RichText.dart';
import 'package:news_app/features/news_home/cubit/fetch_sourceMediaList_cubit.dart';
import 'package:news_app/features/news_home/resources/enum/source_enum.dart';
import 'package:provider/provider.dart';


class NewsInitialHomeBody extends StatefulWidget {
  const NewsInitialHomeBody({super.key});

  @override
  State<NewsInitialHomeBody> createState() => _NewsInitialHomeBodyState();
}

class _NewsInitialHomeBodyState extends State<NewsInitialHomeBody> {
  SourceFilter? selectedMenu;
  String sourceId = "bbc-news";
  List<String> categoryId =[
    "general",
    "entertainment",
    "health",
    "sports",
    "business",
    "technology"
  ];
  
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:7 ,
      child: Scaffold(
        appBar: AppBar(
         iconTheme: const IconThemeData(color:Colors.black),
         toolbarHeight: 70,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 2,
          title: const TitleRichText(),
          leading: IconButton(
            onPressed: (){}, 
            icon: const Icon(Icons.menu)
          ),
          actions: [
            PopupMenuButton<SourceFilter>(
                initialValue: selectedMenu,
                onSelected: (SourceFilter item) {
                  if (SourceFilter.bbcNews.name == item.name) {
                    sourceId = "bbc-news";
                  }
                  if (SourceFilter.abcNews.name == item.name) {
                    sourceId = "abc-news";
                  }

                  if (SourceFilter.alzeraNews.name == item.name) {
                    sourceId = 'al-jazeera-english';
                  }
                  if (SourceFilter.cnnNews.name == item.name) {
                    sourceId = 'cnn';
                  }
                  // ignore: avoid_single_cascade_in_expression_statements
                  context.read<FetchSourceMediaListCubit>()
                    ..fetchSourceMediaList(sourceId: sourceId);
                },
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                itemBuilder: ((context) => <PopupMenuEntry<SourceFilter>>[
                      const PopupMenuItem(
                          value: SourceFilter.bbcNews, child: Text("BBC")),
                      const PopupMenuItem(
                          value: SourceFilter.abcNews, child: Text("ABC")),
                       const PopupMenuItem(
                          value: SourceFilter.alzeraNews, child: Text("Aljazeera-Eng")),
                     const PopupMenuItem(
                          value: SourceFilter.cnnNews, child: Text("CNN")),
                ]))
          ],
          bottom:  const TabBar(
              isScrollable: true,
              labelColor: Color.fromARGB(255, 224, 7, 18),
              unselectedLabelColor: Colors.black,
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: "Josefin Sans",
                  fontWeight: FontWeight.w600),
              indicatorColor: Color.fromARGB(255, 255, 60, 0),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                  Tab(
                  text: "Home",
                  
                ),
                Tab(
                  text: "General",
                ),
                Tab(
                  text: "Entertainment",
                ),
                Tab(
                  text: "Health",
                ),
                 Tab(
                  text: "Sports",
                 ),
                 Tab(
                  text: "Business",
                 ),
                 Tab(
                  text: "Technology",
                 )
              
              
              ]),
        ),
        body:  TabBarView(
            children:[
                const HomeCategoryScreen(),
                CategoryScreen(
                categoryId: categoryId[0],
                ),
                CategoryScreen(
                categoryId: categoryId[1]
                ),
                CategoryScreen(
                  categoryId: categoryId[2]
                ),
                CategoryScreen(
                categoryId: categoryId[3]
              ),
                CategoryScreen(
              categoryId:categoryId[4]
             ),
                CategoryScreen(
              categoryId:categoryId[5]
             )
              ]

           ),  
    ),
    );
  }
}
