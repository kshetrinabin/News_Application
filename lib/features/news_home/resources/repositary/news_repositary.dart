
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/common/constant/constant_url.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';

class NewsRepositary{

Future<Either<String,List<News>>> fetchNewsList({bool isLoading = true})async{
  try{
    final response = await Dio().get("https://newsapi.org/v2/top-headlines?country=us&apiKey=${Constant.apikey}");
    final result = List.from(response.data["articles"]).map((e) => News.fromMap(e)).toList();
    return Right(result);

  }on DioException catch(e){
    return Left(e.toString());
  }
}
Future<Either<String,News>> fetchNewsDetails()async{
  try{
    final response = await Dio().get("https://newsapi.org/v2/top-headlines?country=us&apiKey=${Constant.apikey}");
    final result = News.fromMap(response.data["articles"]);
    return Right(result);

  }on DioException catch(e){
    return Left(e.toString());
  }
  
}
Future<Either<String,List<News>>> fetchSourceMediaList({required String sourceId})async{
  try{
    final response = await Dio().get("https://newsapi.org/v2/top-headlines?sources=$sourceId&apiKey=${Constant.apikey}");
    final result = List.from(response.data["articles"]).map((e) => News.fromMap(e)).toList();
    return Right(result);

  }on DioException catch(e){
    return Left(e.toString());
  }
}

Future<Either<String,List<News>>> fetchCategoryList({required String categoryId})async{
  try{
    final response = await Dio().get("https://newsapi.org/v2/everything?q=$categoryId&apiKey=${Constant.apikey}");
    final result = List.from(response.data["articles"]).map((e) => News.fromMap(e)).toList();
    return Right(result);

  }on DioException catch(e){
    return Left(e.toString());
  }
}

}