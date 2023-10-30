// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:news_app/features/news_details/UI/widgets/news_details_body.dart';
import 'package:news_app/features/news_home/resources/model/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final News item;
  NewsDetailsScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsDetailsBody(item: item,);
  }
}
