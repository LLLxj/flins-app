// import 'dart:js';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:huoshan_app/api/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetail extends StatefulWidget {
  ArticleDetail({Key key, this.id}) : super(key: key);
  var id;
  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  var articleInfo = '';
  void initState() {
    // TODO: implement initState
    // childData的值可以在 initState中通过widget.childData拿到。
    // print('--111');
    // print(widget.id);
    // print('--222');
    getData(widget.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情'),
        elevation: 1,
        centerTitle: true,
      ),
      body: Container(
        child: WebView(
          // initialUrl: "http://mp.flins.com.cn/mbbearing/details?id=509",
          // initialUrl: "http://www.liuzijian.cn/suibi/58.html",
          // initialUrl: "https://www.scohmed.com/details?id=364",
          // initialUrl: "https://www.flins.com.cn/newsDetails2.html",
          // initialUrl: "https://www.flins.com.cn/",
        )
        // child: Text(articleInfo)
      )
    );
  }

  getData (item) {
    var params = {
      'id': item
    };
    Home.articleDetail(params).then((data){
      if (data['code'] == '0000') {
        var result = data['data']['content'];
        var jsonResult = json.decode(result);
        // print(ab);
        var content = jsonResult[0]['text'];
        setState(() {
          articleInfo = content;
        });
        // print(result);
        // print(result is String);
        // List<String> sss = result.split('}');
        // print(sss);
        // print(sss is String);
        // print(sss['0']['0']['text']);
        // setState(() {
        //   articleInfo = data['data']['page']['datas'];
        // });
      }
    });
  }
}