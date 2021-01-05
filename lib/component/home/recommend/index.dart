import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/utils/adapt_size.dart';

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {

  final list = [
    { 'title': '44我是新冠肺炎医疗资讯标题名称', 'content': '44我是新冠肺炎医疗资讯摘要我是新冠肺炎医疗资讯摘要我是新冠肺炎医疗资讯摘要我是新冠肺炎医疗资讯摘要我是新冠肺炎医疗资讯摘要我是新冠肺炎医疗资讯摘要我是新冠肺炎医疗资讯摘要' },
    { 'title': '22我是新冠肺炎疾病保险资讯标题', 'content': '332我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要' },
    { 'title': '33我是甲状腺专题 的医疗资讯', 'content': '33我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要我是摘要' },
  ];

  final itemBorderColor = const Color(0xFFe4e4e4);
  final itemTitleColor = const Color(0xFF2C313B);
  final itemContentColor = const Color(0xFF666666);
  final borderColor = const Color(0xFFF9F9F9);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(720.0),
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: BorderSide(
            color: borderColor,
            width: 4.0,
            style: BorderStyle.solid
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: ScreenUtil().setWidth(202.0),
            child: Image.asset(
              'assets/images/home/recommend.png',
              fit: BoxFit.fitWidth
            )
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
            // height: ScreenUtil().setHeight(228.0),
            height: Adapt.px(234),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              reverse: false,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return _buildItem(list[index]);
              },
            )
          )
        ],
      )
    );
  }

  Widget _buildItem(item) {
    return Container(
      width: ScreenUtil().setWidth(320.0),
      margin: const EdgeInsets.only(right: 10.0),
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: itemBorderColor),
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: ScreenUtil().setWidth(200.0),
            margin: const EdgeInsets.only(top: 10, left: 9),
            child: Text(
              item['title'],
              softWrap: true,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: new TextStyle(
                color: itemTitleColor,
                fontSize: ScreenUtil().setSp(30)
              )
            )
          ),
          Container(
            width: ScreenUtil().setWidth(280.0),
            margin: const EdgeInsets.only(top: 6.0, left: 9.0),
            child: Text(
              item['content'],
              softWrap: true,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: new TextStyle(
                color: itemContentColor,
                fontSize: Adapt.px(24),
                fontWeight: FontWeight.normal
              )
            )
          )
        ]
      )
    );
  }
}