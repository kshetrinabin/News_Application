import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class SourceMediaListCard extends StatelessWidget {
  final News item;
  final VoidCallback ? onPressed;
  const SourceMediaListCard({super.key,required this.item,this.onPressed});
  
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
        return InkWell(
          onTap: onPressed,
          child: Card(
            elevation: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              height: 100,
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.sourceName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 14,),
                  Image.network(
                     item.urlToImage,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      _launchUrl(item.url);
                    },
                    child: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  RichText(
                      text: TextSpan(
                          text: "publishedAt: ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w400),
                          children: [
                          TextSpan(
                              text: Jiffy.parseFromDateTime(
                              item.publishedAt.toLocal()
                            ).format(
                              pattern: "MMMM dd, yyyy "
                            ),
                       
                            )
                      ]))
                ],
              ),
            ),
          ),
        );
  
  }
}
