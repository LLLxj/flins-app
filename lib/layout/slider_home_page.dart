import 'package:flutter/material.dart';
import 'package:huoshan_app/views/search/index.dart';
import 'package:huoshan_app/router/routes.dart';
import 'package:huoshan_app/api/home.dart';


class SliderHomePage extends StatefulWidget {
  @override
  _SliderHomePageState createState() => _SliderHomePageState();
}

class _SliderHomePageState extends State<SliderHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  final _SelectTextColor = const Color(0xFF44BA59);

  final tabs = [
    '首页', '推荐', '推荐1',
  ];

  var list = [
    { 'title': '少儿疾病', 'status': true, 'subjectCode': 'children' },
    { 'title': '新冠肺炎', 'status': false, 'subjectCode': 'ncov' },
    { 'title': '女性疾病', 'status': false, 'subjectCode': 'mammary' },
    { 'title': '健康专题', 'status': false, 'subjectCode': 'healthy' },
    { 'title': '甲状腺', 'status': false, 'subjectCode': 'thyroid' }
  ];

  var params = {
    'page': { 
      'currentPage': 1,
      'pageSize': 6
    },
    'subjectCode': 'children',
    'type': 2
  };

  var deseaseList = [];

  @override
  void initState () {
    super.initState();
    _getDataList();
    _tabController = TabController(vsync: this, length: tabs.length);
    _tabController.addListener(() {
      // print(_tabController.index);
      final index = _tabController.index;
      // print(list[index]);
      setState(() {
        deseaseList = [];
        params['subjectCode'] = list[index]['subjectCode'];
      });
      _getDataList();
    });
  }

  @override
  void dispose () {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          elevation: 1,
          actions: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              // decoration: new BoxDecoration(
              //   color: _SelectTextColor,
              // ),
              // child: SearchPage(),
            ),
          ],
          bottom: _buildTabBar()
        ),
        preferredSize: Size.fromHeight(50.0),
      ),
      body: _builderTabBarView()
    );
  }

  Widget _buildTabBar () => TabBar(
    isScrollable: true,
    controller: _tabController,
    indicatorColor: Colors.red, // 下划线颜色
    tabs: tabs.map((e) => Tab(
      text: e
    )).toList()
  );

  Widget _builderTabBarView () => TabBarView(
    controller: _tabController,
    children: tabs.map((e) => Container(
      decoration: new BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.red),
      ),
      child: ListView(
        children: deseaseList.map((item) => Container(
          // height: MediaQuery.of(context).size.height / 4,
          child: Text(item['name']),
        )).toList()
      )
    )).toList(),
  );

  void _getDataList () {
    Home.deseaseList(params).then((data){
      if (data['code'] == '0000') {
        setState(() {
          deseaseList = data['data']['page']['datas'];
        });
      }
    });
  }
}