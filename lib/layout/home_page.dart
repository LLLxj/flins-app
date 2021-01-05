import 'package:flutter/material.dart';
import 'package:huoshan_app/component/home/special_theme/index.dart';
import 'package:huoshan_app/component/home/recommend/index.dart';
import 'package:huoshan_app/component/home/healthy_manage/index.dart';
import 'package:huoshan_app/component/home/desease_theme/index.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   top: true,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       foregroundColor: Colors.white,
    //       title: Text('松果医服'),
    //       backgroundColor: Colors.black,
    //       elevation: 1,
    //       centerTitle: true,
    //     ),
    //     body: HomeContent()
    //   )
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text('松果医服'),
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: HomeContent()
    );
  }
}

class HomeContent extends StatefulWidget { // 专题
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    // return CustomScrollView(
    //   scrollDirection: Axis.vertical,
    //   reverse: false,
    //   slivers: <Widget>[
    //     _buildTest()
    //     // SpecialTheme()
    //   ],
    // );
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Column(
          children: [
            SpecialTheme(), // 三栏专题
            Recommend(), // 松果推荐
            HealthyManage(), // 健康管家
            DeseaseTheme() // 疾病专题
          ],
        )
      )
    );
  }
}