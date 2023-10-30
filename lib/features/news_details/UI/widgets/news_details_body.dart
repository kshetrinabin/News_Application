// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';
import 'package:share_plus/share_plus.dart';

class NewsDetailsBody extends StatefulWidget {
  final News item;
  const NewsDetailsBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<NewsDetailsBody> createState() => _NewsDetailsBodyState();
}

class _NewsDetailsBodyState extends State<NewsDetailsBody> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
         icon: const Icon(CupertinoIcons.back,color: Colors.black,size: 30,)
         )
         ,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.save,
                color: Colors.black,
              )),
          const SizedBox(
            width: 4,
          ),
          IconButton(
              onPressed: () {
                Share.share("Read more about this news: ${widget.item.url}");
              },
              icon: const Icon(
                Icons.share,
                color: Colors.black,
              )),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:NetworkImage(widget.item.urlToImage,),
                    fit: BoxFit.cover,
                    
                  )
                ),
              
              ),
              Positioned(
                top: 195,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 16),
                  height: MediaQuery.of(context).size.height * 0.7,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32))),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        widget.item.publishedAt.toLocal())
                                    .format(pattern: "MMMM dd, yyyy "),
                              )
                            
                            ])),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.pink),
                        ),
                       
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          widget.item.description,
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "Content",
                          style: TextStyle(
                            color: Colors.pink,
                            fontSize: 22,
                            fontWeight: FontWeight.w800
                          ),
                          ),
                       const SizedBox(
                          height: 6,
                        ),
                      Text(
                          widget.item.content,
                          style: const TextStyle(fontSize: 20),
                        ),
                       const SizedBox(
                          height: 18,
                        ),
                          
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
         
        
    );
  }
}
