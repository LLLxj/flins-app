import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/router/routes.dart';
import 'package:huoshan_app/widget/bottom_bar.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var sendCode = '发送验证码';
  var codeTextColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   decoration: new BoxDecoration(
    //     border: new Border.all(width: 1.0, color: Colors.red)
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   '登录',
        //   style: new TextStyle(
        //     color: Colors.black
        //   )
        // ),
        actions: [
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                // border: new Border.all(width: 1.0, color: Colors.red)
              ),
              child: Text(
                '注册',
                style: new TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  // fontWeight: FontWeight.bold
                )
              )
            )
          )
        ],
        elevation: 0,
        // centerTitle: true,
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
      ),
      body: _buildLoginPage()
    );
  }

  Widget _buildLoginPage () {
    return Container(
      // width: MediaQuery.of(context).size.width,
      width: ScreenUtil().setWidth(750.0),
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      decoration: new BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.red)
        // color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '你好,',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            '欢迎来到',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: 80),
          Text(
            '账号登录',
            style: new TextStyle(
              color: Colors.black,
              fontSize: 16
            )
          ),
          Container( // 手机号输入框
            // alignment: Alignment.center,
            // height: ScreenUtil().setHeight(60.0),
            margin: const EdgeInsets.only(top: 20),
            child: TextField(
              autofocus: false, //自动聚焦，闪游标
              // controller: _controller,
              maxLines: 1,
              // style: TextStyle(textBaseline: TextBaseline.alphabetic),
              decoration: InputDecoration( // 输入框装饰
                // contentPadding: EdgeInsets.only(top: 2.0),
                filled: true, // 填满
                fillColor: Colors.white, // 白色
                // prefixIcon:  Icon(Icons.search), // 前标
                // contentPadding: EdgeInsets.only(right: 0), // 调整文字边距
                // border: UnderlineInputBorder(
                //   // border: new Border.all(width: 1.0, color: Colors.red),
                //   borderSide: BorderSide.none, // 去边线
                //   // borderSide: BorderSide(color: Colors.deepOrange),
                //   borderRadius: BorderRadius.all(Radius.circular(5)),
                // ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepOrange),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                hintText: "请输入手机号", // 提示
                hintStyle: TextStyle(fontSize: 14) // 提示样式
              ),
              onChanged: (str) => getPhone(str),
              // onChanged: (str) => BlocProvider.of<SearchBloc>(context)
              //     .add(SearchWidgetEvent(args:SearchArgs(name: str,stars: [1,2,3,4,5]))),

              onSubmitted: (str) { // 提交后
                FocusScope.of(context).requestFocus(FocusNode()); // 收起键盘
                // _controller.clear();
              }
            )
          ),
          Container( // 验证码输入框
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(400.0),
                  child: TextField(
                    autofocus: false, //自动聚焦，闪游标
                    // controller: _controller,
                    maxLines: 1,
                    // style: TextStyle(textBaseline: TextBaseline.alphabetic),
                    decoration: InputDecoration( // 输入框装饰
                      // contentPadding: EdgeInsets.only(top: 2.0),
                      filled: true, // 填满
                      fillColor: Colors.white, // 白色
                      // prefixIcon:  Icon(Icons.search), // 前标
                      // contentPadding: EdgeInsets.only(right: 0), // 调整文字边距
                      // border: UnderlineInputBorder(
                      //   // border: new Border.all(width: 1.0, color: Colors.red),
                      //   borderSide: BorderSide.none, // 去边线
                      //   // borderSide: BorderSide(color: Colors.deepOrange),
                      //   borderRadius: BorderRadius.all(Radius.circular(5)),
                      // ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      hintText: "请输入手机号", // 提示
                      hintStyle: TextStyle(fontSize: 14) // 提示样式
                    ),
                    onChanged: (str) => getPhone(str),
                    // onChanged: (str) => BlocProvider.of<SearchBloc>(context)
                    //     .add(SearchWidgetEvent(args:SearchArgs(name: str,stars: [1,2,3,4,5]))),

                    onSubmitted: (str) { // 提交后
                      FocusScope.of(context).requestFocus(FocusNode()); // 收起键盘
                      // _controller.clear();
                    }
                  )
                ),
                GestureDetector(
                  child: Container(
                    width: ScreenUtil().setWidth(200.0),
                    height: ScreenUtil().setHeight(80.0),
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30),
                    decoration: new BoxDecoration(
                      border: new Border.all(width: 1.0, color: codeTextColor),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      // color: Colors.white
                    ),
                    child: Text(
                      sendCode,
                      style: new TextStyle(
                        color: codeTextColor,
                        // fontSize: 20,
                        // fontWeight: FontWeight.bold
                      )
                    ),
                  ),
                  onTap: () => getCode(),
                )
              ]
            )
          ),
          GestureDetector( // 登录按钮
            child: Container( 
              margin: const EdgeInsets.only(top: 20),
              height: ScreenUtil().setHeight(80.0),
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Text(
                '登录',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18
                )
              )
            ),
            onTap: () => toLogin(FireRouter.navBottom),
          )
        ]
      )
    );
  }

  void getPhone (item) {
    print(item);
  }

  void getCode () {
    print('-获取手机号验证码');
  }

  void toLogin(linkTo) {
    print('登录操作');
    Navigator.pushAndRemoveUntil(context,
      new MaterialPageRoute(builder: (BuildContext context) {
        return NavBottom();
      }), (route) => route == null
    );
    // if (linkTo != null && linkTo.isNotEmpty) {
    //   Navigator.of(context).pushNamed(linkTo);
    //   Navigator.of(context).pushReplacement(linkTo);
    //   Navigator.of(context).popUntil(linkTo);
    //   Navigator.pushAndRemoveUntil(context, linkTo, (Route<dynamic> r) => false);
    // }
  }
}