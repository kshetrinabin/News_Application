// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final News item;
  final VoidCallback ? onPressed;
   const NewsCard({
    Key? key,
    required this.item,
   this.onPressed,
  }) : super(key: key);
  
  _launchUrl(String host) async {
    Uri url = Uri.parse(host);
  if (await canLaunchUrl(url)) {
    await launchUrl(url,mode: LaunchMode.platformDefault);
  }else{
    throw Exception('Could not launch $url');
  }
}
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: onPressed,
        child: Card(
          elevation: 1,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 80),
                padding: const EdgeInsets.only(top: 10,bottom: 6,left: 24,right: 8),
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),             
                      ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                     _launchUrl(item.url);
                      },
                      child: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                 RichText(
                      text: TextSpan(
                        text: "Source: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w400
                        ),
                        children: [
                          TextSpan(
                            text: 
                            item.sourceName
                          )
                        ]
                      )
                      ), 
                      SizedBox(height: 4,),
                    RichText(
                      text: TextSpan(
                        text: "publishedAt: ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade800,
                          fontWeight: FontWeight.w400
                        ),
                        children: [
                          TextSpan(
                            text:    Jiffy.parseFromDateTime(
                            item.publishedAt.toLocal()
                          ).format(
                            pattern: "MMMM dd, yyyy"
                          ),
                     
                          )
                        ]
                      )
                      )
                  ],
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
            child: FadeInImage(
                  image:NetworkImage(item.urlToImage) ,
                  placeholder: const AssetImage("assets/images/placeholder.jpg"),
                  fit: BoxFit.cover,
                  width: 95,
               ),
            )
            ],
          ),
        ),
      ),
    );
  }
}
