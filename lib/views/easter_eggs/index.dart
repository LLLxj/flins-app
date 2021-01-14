import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/config/index.dart';
import 'dart:io';
import 'package:device_info/device_info.dart';

class EasterEggs extends StatefulWidget {
  @override
  _EasterEggsState createState() => _EasterEggsState();
}

class _EasterEggsState extends State<EasterEggs> {

  final apiUrl = Config.getApiurl();
  var api = '';
  var iosDeviceInfo = {};
  var androidDeviceInfo = {};

  @override
  void initState() {
    getDeviceInfo();
    setState(() {
      api = apiUrl;
    });
    super.initState();
  }

  void getDeviceInfo() async{
    DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
    print(deviceInfo);
    print(Platform);
    if(Platform.isIOS){
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      print('----');
      print(iosDeviceInfo);
      setState(() {
        iosDeviceInfo = iosDeviceInfo;
      });
      // print(iosDeviceInfo);
    }else if(Platform.isAndroid){
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      setState(() {
        androidDeviceInfo = androidDeviceInfo;
      });
      // print(androidDeviceInfo);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('开发者彩蛋'),
        elevation: 1,
        centerTitle: true,
      ),
      body: _columnList()
    );
  }

  Widget _columnList () {
    return Container(
      decoration: new BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.red)
      ),
      // alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: <Widget>[
              _buildItem(context, 'dev', 'http://mp.flins.com.cn', 1),
              Divider(height: 1),
              _buildItem(context, 'uat', 'https://api.flins.com.cn', 2),
              Divider(height: 1),
              _buildItem(context, 'prod', 'https://www.scohmed.com', 3),
            ],
          ),
          Positioned(
            bottom: 30,
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(650.0),
              height: ScreenUtil().setHeight(60.0),
              decoration: new BoxDecoration(
                color: Colors.white,
                gradient: new LinearGradient(colors: [
                  Color.fromRGBO(89, 68, 237, 1),
                  Color.fromRGBO(50, 79, 242, 1)
                ]),
                // borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
              ),
              child: Text(
                '重新登录即可成效',
                style: new TextStyle(
                  color: Colors.white
                )
              )
            )
          )
        ],
      ) 
    );
  }
  Widget _buildItem (BuildContext context, String title, String value, int index) => GestureDetector(
    onTap: () {
      print(value);
      Config.setApiurl(index);
      setState(() {
        api = value;
      });
    },
    child: Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20, right: 20),
      decoration: new BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.red)
      ),
      child: Row(
        children: [
          Text(title),
          Expanded(
            child: api == value ? Container(
              alignment: Alignment.centerRight,
              child: Text('当前-->') 
            ): Container()
          ),
          Text(value),
        ],
      ),
      // trailing: Container(
      //   child: Row(
      //     children: <Widget>[
      //       // api == value ? Text('当前-->') : Text(''),
      //       Text(value)
      //     ]
      //   )
      // ),
      
      // trailing: Icon(
      //   Icons.chevron_right,
      //   color: Theme.of(context).primaryColor
      // ),
    )
  );
}