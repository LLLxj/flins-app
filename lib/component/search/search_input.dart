import 'package:flutter/material.dart';

class SearchInput extends StatefulWidget {
  @override
  _SearchInputState createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  TextEditingController _controller=TextEditingController();//文本控制器
  @override
  Widget build(BuildContext context) => Center(
    child: Container(
      decoration: new BoxDecoration(
        // border: new Border.all(width: 1.0, color: Colors.red),
      ),
      height: 35,
      child: TextField(
        autofocus: false, //自动聚焦，闪游标
        controller: _controller,
        maxLines: 1,
        decoration: InputDecoration( // 输入框装饰
          contentPadding: EdgeInsets.all(0),
          filled: true, // 填满
          fillColor: Colors.white, // 白色
          prefixIcon:  Icon(Icons.search), // 前标
          // contentPadding: EdgeInsets.only(right: 0), // 调整文字边距
          border: UnderlineInputBorder(
            borderSide: BorderSide.none, // 去边线
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          hintText: "搜点啥...", // 提示
          hintStyle: TextStyle(fontSize: 14) // 提示样式
        ),
        onChanged: (str) => getValue(str),
        // onChanged: (str) => BlocProvider.of<SearchBloc>(context)
        //     .add(SearchWidgetEvent(args:SearchArgs(name: str,stars: [1,2,3,4,5]))),

        onSubmitted: (str) { // 提交后
          FocusScope.of(context).requestFocus(FocusNode()); // 收起键盘
          // _controller.clear();
        },
      )
    )
  );
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  getValue (item) {
    print(item);
  }
}
