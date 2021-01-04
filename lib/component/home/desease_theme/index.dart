import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeseaseTheme extends StatefulWidget {
  @override
  _DeseaseThemeState createState() => _DeseaseThemeState();
}

class _DeseaseThemeState extends State<DeseaseTheme> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: ScreenUtil().setWidth(202.0),
            child: Image.asset(
              'assets/images/home/desease.png',
              fit: BoxFit.fitWidth
            )
          ),
        ]
      )
    );
  }
}