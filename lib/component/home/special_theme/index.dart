import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      height: ScreenUtil().setHeight(140.0),
      decoration: BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.blue),
        color: const Color(0xFFF1F1F1)
      ),
      child: Center(
        child: Container(
          width: ScreenUtil().setWidth(720.0),
          height: ScreenUtil().setHeight(100.0),
          alignment: Alignment.center,
          child: GridView.count(
            shrinkWrap: true,
            physics: new NeverScrollableScrollPhysics(), //禁止内部滚动
            crossAxisSpacing: 15.0,
            crossAxisCount: 3,
            children: list.map((item) => _buildTheme(item)).toList()
          )
        )
      )
    );
  }
}

Container _buildTheme(item) => Container(
  child: ConstrainedBox(
    constraints: BoxConstraints(
      maxHeight: ScreenUtil().setHeight(100.0)
    ),
    child: Stack(
      overflow: Overflow.clip,
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(100.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
          ),
          child: Image.asset(
            item['src'],
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 14),
          child: Text(
            item['title'],
            style: new TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(32.0),
              letterSpacing: 1.0
            ),
          )
        ),
        Container(
          margin: const EdgeInsets.only(left: 10, top: 50),
          padding: const EdgeInsets.only(left: 3.0, right: 3.0),
          decoration: new BoxDecoration(
            color: Colors.green
          ),
          child: Text(
            item['secTitle'],
            style: new TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(16.0),
            )
          )
        )
      ]
    )
  )
);

