import 'package:flutter/material.dart';
import 'package:huoshan_app/widget/bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '首页',
      theme: ThemeData(
        brightness: Brightness.dark
        // primarySwatch: Colors.pink,
      ),
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
    return MaterialApp(
      theme: ThemeData(
        // primarySwatch: Colors.pink,
      ),
      home: NavBottom()
    );
  }
}
