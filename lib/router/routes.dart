import 'package:flutter/material.dart';
// import 'package:huoshan_app/router/router_handle.dart';
import 'package:huoshan_app/router/router_effect.dart';
import 'package:huoshan_app/component/home/article_detail/index.dart';
import 'package:huoshan_app/layout/home_page.dart';
import 'package:huoshan_app/views/search/index.dart';
import 'package:huoshan_app/views/app_setting/index.dart';
import 'package:huoshan_app/views/about_application/index.dart';
import 'package:huoshan_app/views/easter_eggs/index.dart';
import 'package:huoshan_app/views/login/index.dart';
import 'package:huoshan_app/widget/bottom_bar.dart';

// import 'package:fluro/fluro.dart';

class FireRouter {
  static const String root = '/';
  static const String navBottom = 'NavBottom';
  static const String pageArticleDetail = 'articleDetail';
  static const String pageEmpty = 'EmptyPage';
  static const String articleDetail = 'ArticleDetail';
  static const String homePage = 'HomePage';
  static const String searchPage = 'SearchPage';
  static const String appSetting = 'AppSetting';
  static const String aboutApplication = 'AboutApplication';
  static const String easterEggs = 'EasterEggs';
  static const String loginPage = 'LoginPage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    // setting 接收两个参数 name arguments
    switch (settings.name) {
      case navBottom: // 底部导航
        return Right2LeftRouter(child: new NavBottom());
      case articleDetail: // 文章详情
        return Right2LeftRouter(child: new ArticleDetail(id: settings.arguments));
      case homePage:
        return Right2LeftRouter(child: HomePage());
      case searchPage: // 搜索页面
        return Right2LeftRouter(child: SearchPage());
      case appSetting: // 应用设置
        return Right2LeftRouter(child: AppSetting());
      case aboutApplication: // 关于我们
        return Right2LeftRouter(child: AboutApplication());
      case easterEggs: // 开发者彩蛋
        return Right2LeftRouter(child: EasterEggs());
      case loginPage: // 登录页面
        return Bottom2TopRouter(child: LoginPage());
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