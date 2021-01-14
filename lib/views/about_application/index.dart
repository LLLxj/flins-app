import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/router/routes.dart';


class AboutApplication extends StatefulWidget {
  @override
  _AboutApplicationState createState() => _AboutApplicationState();
}

class _AboutApplicationState extends State<AboutApplication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于应用'),
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: _appDescList()
    );
  }

  Widget _appDescList () {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              width: ScreenUtil().setWidth(250.0),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitWidth
              ),
            ),
            onDoubleTap: () {
              toPage(FireRouter.easterEggs);
            },
          )
          
          // SizedBox(height: 10,),
          // _buildItem(context, '深色模式', 0),
          // Divider(height: 1),
          // _buildItem(context, '浅色模式', 1),
          // Divider(height: 1),
          // _buildItem(context, '跟随系统', 2),
        ],
      )
    );
  }

  Widget _buildItem (BuildContext context, String title, int index) => ListTile(
    // leading: Icon(
    //   icon,
    //   color: Theme.of(context).primaryColor,
    // ),
    title: Text(title),
    trailing: Icon(
      Icons.chevron_right,
      color: Theme.of(context).primaryColor
    ),
    onTap: () {
      // setState(() {
      //   themeValue = index;
      // });
      // Provider.of<GlobalTheme>(context, listen: false).setTheme(index);
    },
  );

  toPage (item) {
    if (item != null && item.isNotEmpty) {
      Navigator.of(context).pushNamed(item);
      // if (onTap != null) onTap();
    }
  }
}