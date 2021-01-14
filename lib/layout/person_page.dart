import 'package:flutter/material.dart';
import 'package:huoshan_app/component/icons/index.dart';
import 'package:huoshan_app/router/routes.dart';
class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {

  final functionList = [
    { 'title': '应用设置', 'route': 'setting' },
    { 'title': '数据统计', 'route': 'counting' },
    { 'title': '我的收藏', 'route': 'collect' },
    { 'title': '版本信息', 'route': 'version' },
    { 'title': '关于应用', 'route': 'aboutApplication' }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: _buildFunctionList()
    );
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   decoration: new BoxDecoration(
    //     border: new Border.all(width: 1.0, color: Colors.red),
    //   ),
    //   child: CustomScrollView(
    //     slivers: <Widget>[
    //       _buildPersonPageAppBar(),
    //       _buildFunctionList()
    //     ],
    //   ),
    // );
  }

  Widget _buildPersonPageAppBar() {
    return SliverAppBar(
      pinned: true,
      leading: _buildLeading(),
      elevation: 6, //影深
      expandedHeight: 220.0,
      // forceElevated: innerBoxIsScrolled, //为true时展开有阴影
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Image.asset(
          "assets/images/goods/caver.webp",
          fit: BoxFit.cover,
        ),
      )
    );
  }

  Widget _buildLeading () => Container(
    child: Text('aaaa')
  );

  Widget _buildFunctionList () {
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 10,),
          _buildItem(context, TolyIcon.icon_them, '应用设置', FireRouter.appSetting),
          _buildItem(context, TolyIcon.icon_collect, '我的收藏', FireRouter.appSetting),
          Divider(height: 1,),
          _buildItem(context, Icons.update, '版本信息', FireRouter.appSetting),
          _buildItem(context, Icons.info, '关于应用', FireRouter.aboutApplication),
          // _buildItem(context, Icons.info, '关于应用', UnitRouter.about_app),
        ],
      )
    );
  }

  Widget _buildItem (BuildContext context, IconData icon, String title, String linkTo, {VoidCallback onTap}) => ListTile(
    onTap: () {
      if (linkTo != null && linkTo.isNotEmpty) {
        Navigator.of(context).pushNamed(linkTo);
        if(onTap!=null) onTap();
      }
    },
    leading: Icon(
      icon,
      color: Theme.of(context).primaryColor,
    ),
    title: Text(title),
    trailing: Icon(
      Icons.chevron_right,
      color: Theme.of(context).primaryColor
    ),
  );
}