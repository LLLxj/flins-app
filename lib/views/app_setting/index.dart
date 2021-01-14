import 'package:flutter/material.dart';
import 'package:huoshan_app/provider/theme.dart';
import 'package:provider/provider.dart';

class AppSetting extends StatefulWidget {
  @override
  _AppSettingState createState() => _AppSettingState();
}

class _AppSettingState extends State<AppSetting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('主题色设置'),
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: _settingList()
    );
  }

  Widget _settingList () {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(height: 10,),
          _buildItem(context, '深色模式', 0),
          Divider(height: 1),
          _buildItem(context, '浅色模式', 1),
          Divider(height: 1),
          _buildItem(context, '跟随系统', 2),
        ],
      )
    );
  }

  Widget _buildItem (BuildContext context, String title, int index) => Consumer<GlobalTheme>(
    builder: (context, globalTheme, child) {
      return ListTile(
        // leading: Icon(
        //   icon,
        //   color: Theme.of(context).primaryColor,
        // ),
        title: Text(title),
        trailing: index == globalTheme.themeValue ? Icon(
          Icons.chevron_right,
          color: Theme.of(context).primaryColor
        ): null,
        onTap: () {
          // setState(() {
          //   themeValue = index;
          // });
          Provider.of<GlobalTheme>(context, listen: false).setTheme(index);
        },
      );
    },
  );
  

  // Widget _buildItem (BuildContext context, String title, int index) => ListTile(
  //   // leading: Icon(
  //   //   icon,
  //   //   color: Theme.of(context).primaryColor,
  //   // ),
  //   title: Text(title),
  //   trailing: index == activeIndex ? Icon(
  //     Icons.chevron_right,
  //     color: Theme.of(context).primaryColor
  //   ): null,
  //   onTap: () {
  //     setState(() {
  //       activeIndex = index;
  //     });
  //     Provider.of<GlobalTheme>(context, listen: false).setTheme(index);
  //   },
  // );
}