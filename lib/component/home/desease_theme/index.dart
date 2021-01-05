import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/api/home.dart';
// import 'package:huoshan_app/utils/loading_utils.dart';

class DeseaseTheme extends StatefulWidget {
  @override
  _DeseaseThemeState createState() => _DeseaseThemeState();
}

class _DeseaseThemeState extends State<DeseaseTheme> {

  final borderColor = const Color(0xFFE4E4E4);
  final itemContentColor = const Color(0xFF121212);

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
  void initState() {
    getDatas();
    super.initState();
  }

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
          _buildTabbar(), // 切换头部
          _buildTabContent() // 切换内容
        ]
      )
    );
  }

  Widget _buildTabbar() { // 切换按钮
    return Container(
      width: ScreenUtil().setWidth(720.0),
      margin: const EdgeInsets.only(top: 10.0),
      decoration: new BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.red),
      ),
      // height: Adapt.px(74),
      height: ScreenUtil().setWidth(74.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        reverse: false,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return  GestureDetector(
            onTap: () {
              getActiveStatus(list[index]);
            },
            child: Container(
              alignment: Alignment.center,
              width: ScreenUtil().setWidth(150.0),
              margin: const EdgeInsets.only(right: 10.0),
              height: ScreenUtil().setWidth(74.0),
              decoration: new BoxDecoration(
                color: Colors.blue,
                gradient: new LinearGradient(colors: [
                  Color.fromRGBO(89, 68, 237, 1),
                  Color.fromRGBO(50, 79, 242, 1)
                ]),
                borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
              ),
              child: Text(
                list[index]['title'],
                style: new TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                  fontWeight: FontWeight.bold,
                  color: list[index]['status'] == true ? Colors.white : Colors.black
                ),
              )
            )
          );
        },
      )
    );
  }
 
  Widget _buildTabContent () { // 切换的内容
    return Container(
      width: ScreenUtil().setWidth(720.0),
      margin: const EdgeInsets.only(top: 15.0, bottom: 25.0),
      decoration: new BoxDecoration(
      ),
      child: Wrap(
        runSpacing: 15.0,
        spacing: 10.0,
        children: deseaseList.map((item) => Container(
          width: ScreenUtil().setWidth(350.0),
          decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(8.0)),
            border: new Border.all(width: 1.0, color: borderColor),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(topRight: new Radius.circular(8.0), topLeft: new Radius.circular(8.0)),
                child: Image.network(
                  item['contentCoverUrl'],
                  width: ScreenUtil().setWidth(347.0),
                  height: ScreenUtil().setHeight(197.0),
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: ScreenUtil().setWidth(300.0),
                margin: const EdgeInsets.only(left: 12, top: 13, bottom: 30),
                height: ScreenUtil().setHeight(80.0),
                alignment: Alignment.topLeft,
                child: Text(
                  item['name'],
                  softWrap: true,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: new TextStyle(
                    color: itemContentColor,
                    fontSize: ScreenUtil().setSp(28)
                  )
                )
              )
            ]
          )
        )).toList()
      )
    );
  }

  void getDatas () {
    Home.deseaseList(params).then((data){
      if (data['code'] == '0000') {
        setState(() {
          deseaseList = data['data']['page']['datas'];
        });
      }
    });
  }

  getActiveStatus (data) {
    list.forEach((item) { 
      item['status'] = false;
      if (item['title'] == data['title']) {
        item['status'] = true;
        setState(() {
          params['subjectCode'] = data['subjectCode'];
          item['status'] = true;
        });
      }
    });
    getDatas();
  }
}