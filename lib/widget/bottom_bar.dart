import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huoshan_app/layout/home_page.dart';
import 'package:huoshan_app/layout/person_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBottom extends StatefulWidget {
  @override
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> with SingleTickerProviderStateMixin{

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('首页',style:TextStyle(fontSize: 14.0))
    ),
    BottomNavigationBarItem(
      icon:Icon(CupertinoIcons.home),
      title:Text('我的',style:TextStyle(fontSize: 14.0))
    )
  ];

  final List tabBodies = [
    HomePage(),
    PersonPage()
  ];
  int _currentIndex = 0;
  var currentPage;

  Widget _getBottom() {
    return Scaffold(
      backgroundColor: Color.fromRGBO(112, 188, 178, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        type:BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            currentPage = tabBodies[_currentIndex];
          });
        },
      ),
      body:IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          HomePage(),
          PersonPage()
        ]
      ),
    );
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Color.fromRGBO(112, 188, 178, 1.0),
    //     bottomNavigationBar: BottomNavigationBar(
    //       backgroundColor: Colors.red,
    //       type:BottomNavigationBarType.fixed,
    //       currentIndex: _currentIndex,
    //       items: bottomTabs,
    //       onTap: (index) {
    //         setState(() {
    //           _currentIndex = index;
    //           currentPage = tabBodies[_currentIndex];
    //         });
    //       },
    //     ),
    //     body:IndexedStack(
    //       index: _currentIndex,
    //       children: <Widget>[
    //         HomePage(),
    //         PersonPage()
    //       ]
    //     ),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width:750, height:1334)..init(context);
    return Stack(
      children: <Widget>[
        Scaffold( // 原方案
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: bottomTabs,
            // fixedColor: Colors.red, // 选中颜色
            onTap: (index) {
              setState(() {
                _currentIndex = index;
                currentPage = tabBodies[_currentIndex];
              });
            },
          ),
          body:IndexedStack(
            index: _currentIndex,
            children: <Widget>[
              HomePage(),
              PersonPage()
            ]
          ),
          // body: currentPage,
        )
        // PageView(
        //   physics: neverScroll,
        //   controller: _controller,
        //   children: <Widget>[
        //     HomePage(),
        //     PersonPage()
        //   ],
        // )
      ],
    );
  }
}

