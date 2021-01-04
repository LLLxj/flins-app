import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('松果医服'),
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.black,
        elevation: 1,
        centerTitle: true,
      ),
      body: Container(
        child: Text('我的')
      )
    );
    // return Container(
    //   child: Text('我的')
    //   // child: WebView(
    //   //   initialUrl: "https://www.flins.com.cn/",
    //   // )
    // );
  }
}