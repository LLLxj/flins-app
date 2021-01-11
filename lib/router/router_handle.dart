import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:huoshan_app/component/home/article_detail/index.dart';
import 'package:huoshan_app/component/empty/index.dart';


Handler articleDetail = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return ArticleDetail();
  }
);

Handler emptyHandle = Handler(
  handlerFunc: (BuildContext context,Map<String,List<String>> params){
    return EmptyPage();
  }
);
