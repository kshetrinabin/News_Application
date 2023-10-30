
import 'package:news_app/common/constant/constant_url.dart';

class News {
    String sourceId;
    String sourceName;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;
    String content;

    News({
        required this.sourceId,
        required this.sourceName,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
    });


factory News.fromMap(Map<String,dynamic>map){
  return News(
    sourceId: (map['source'] as Map<String,dynamic>)["id"] ?? "",
   sourceName : (map['source'] as Map<String, dynamic>)["name"]?? "",
    author: map["author"] ?? "", 
    title: map["title"], 
    description: map["description"] ?? "not available", 
    url: map["url"] , 
    urlToImage: map["urlToImage"] ?? "${Constant.url_image}", 
    publishedAt:DateTime.parse(map["publishedAt"]), 
    content: map["content"] ?? "not available !!"
  );
}
}
