import 'package:flutter/material.dart';
// import 'package:huoshan_app/router/router_handle.dart';
import 'package:huoshan_app/router/router_effect.dart';
import 'package:huoshan_app/component/home/article_detail/index.dart';
import 'package:huoshan_app/layout/home_page.dart';


// import 'package:fluro/fluro.dart';

class FireRouter {
  static const String root = '/';
  static const String pageArticleDetail = 'articleDetail';
  static const String pageEmpty = 'emptyPage';
  static const String articleDetail = 'ArticleDetail';
  static const String homePage = 'HomePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // setting 接收两个参数 name arguments
    switch (settings.name) {
      case articleDetail:
        return Right2LeftRouter(child: new ArticleDetail(id: settings.arguments));
      case homePage:
        return Right2LeftRouter(child: HomePage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
    
  }

  // static void configureRoutes(Router router){
  //   router.notFoundHandler= new Handler(
  //     handlerFunc: (BuildContext context,Map<String,List<String>> params){
  //       print('ERROR====>ROUTE WAS NOT FONUND!!!');
  //     }
  //   );
  //   router.define(pageArticleDetail, handler: articleDetail);
  // }
}