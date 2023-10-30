import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/category_screen/UI/widgets/category_body.dart';
import 'package:news_app/features/category_screen/cubit/fetch_categoryList_cubit.dart';
import 'package:news_app/features/news_home/resources/repositary/news_repositary.dart';

class CategoryScreen extends StatefulWidget {
  final String categoryId;
  const CategoryScreen({super.key,required this.categoryId});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => FetchNewsCategoryListCubit(
        repositary: context.read<NewsRepositary>()
        )..fetchNewsCategoryList(categoryId:widget.categoryId ),
      child: const CategoryBody(),
    );
  }
}
