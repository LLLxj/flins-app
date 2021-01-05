import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/utils/adapt_size.dart';

class SpecialTheme extends StatefulWidget {
  @override
  _SpecialThemeState createState() => _SpecialThemeState();
}

class _SpecialThemeState extends State<SpecialTheme> {

  // final _UnselectTextColor = const Color(0xFF6F6F6);
  final list = [
    { 'title': '疫情专题', 'src': 'assets/images/home/project_1.png', 'secTitle': '专区' },
    { 'title': '少儿常见病', 'src': 'assets/images/home/project_2.png', 'secTitle': '专区' },
    { 'title': '其他疾病', 'src': 'assets/images/home/project_3.png', 'secTitle': '专区' }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750.0),
      height: ScreenUtil().setHeight(145.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1)
      ),
      // child: Center(
      child: Container(
        width: ScreenUtil().setWidth(720.0),
        margin: const EdgeInsets.only(left: 15),
        height: ScreenUtil().setHeight(100.0),
        child: Row(
          children: list.map((item) => _buildTheme(item)).toList()
        )
        // child: GridView.count(
        //   shrinkWrap: true,
        //   physics: new NeverScrollableScrollPhysics(), //禁止内部滚动
        //   crossAxisSpacing: 15.0,
        //   crossAxisCount: 3,
        //   children: list.map((item) => _buildTheme(item)).toList()
        // )
      )
      // )
    );
  }

  Widget _buildTheme(item) {
    return Container(
      width: ScreenUtil().setWidth(220.0),
      height: Adapt.px(125),
      // height: ScreenUtil().setHeight(125.0),
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(220.0),
            height: ScreenUtil().setHeight(125.0),
            decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(30.0)),
            ),
            child: Image.asset(
              item['src'],
              fit: BoxFit.cover,
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(left: 10, top: 10),
          //   child: Column(
          //     children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 12),
            child: Text(
              item['title'],
              style: new TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(34.0),
                letterSpacing: 1.0
              ),
            )
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 45),
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            decoration: new BoxDecoration(
              color: Colors.green
            ),
            child: Text(
              item['secTitle'],
              style: new TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18.0),
              )
            )
          )
        ]
      ),
          // )
      //   ]
      // ) 
    );
  }
}

// Container _buildTheme(item) => Container(
