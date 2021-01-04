import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/utils/adapt_size.dart';

class HealthyManage extends StatefulWidget {
  @override
  _HealthyManageState createState() => _HealthyManageState();
}

class _HealthyManageState extends State<HealthyManage> {

  var _info = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 25),
      child: Column(
        children: [
          Container(
            width: ScreenUtil().setWidth(275.0),
            child: Image.asset(
              'assets/images/home/health_manage.png',
              fit: BoxFit.fitWidth
            )
          ),
          GestureDetector(
            onTap: (){
              toPageMorePrivilege();
            },
            child: Container(
              width: ScreenUtil().setWidth(690.0),
              margin: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/home/home_banner.png',
                    fit: BoxFit.fitWidth
                  ),
                  
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '在线体检室 智能问诊 心理测评',
                          style: new TextStyle(
                            fontSize: ScreenUtil().setSp(33.0),
                            color: Colors.white
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 13),
                          child: Text(
                            '查看更多特权',
                            style: new TextStyle(
                              fontSize: ScreenUtil().setSp(28.0),
                              color: Colors.white
                            ),
                          )
                        )
                        
                      ]
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }

  toPageMorePrivilege () {
    print("跳转特权页面");
    setState(() {
      _info = 'aaa';
    });
    print(_info);
  }
}