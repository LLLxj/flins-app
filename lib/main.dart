import 'package:flutter/material.dart';
import 'package:huoshan_app/widget/bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:huoshan_app/router/routes.dart';
// import 'package:fluro/fluro.dart';
// import 'package:huoshan_app/router/application.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // Router router = Router();
    // Routes.configureRoutes(router);
    // Application.router=router;
    return MaterialApp(
      title: '首页',
      theme: ThemeData(
        // brightness: Brightness.dark // 子页面主题色 dark -黑色
        // primarySwatch: Colors.pink,
      ),
      onGenerateRoute: FireRouter.generateRoute,
      home: Theme(
        data: ThemeData(accentColor: Colors.yellow),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      child: NavBottom()
    );
    // return MaterialApp(
    //   theme: ThemeData(
    //     // primarySwatch: Colors.pink,
    //   ),
    //   home: NavBottom()
    // );
  }
    
}
