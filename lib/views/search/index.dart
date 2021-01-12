import 'package:flutter/material.dart';
import 'package:huoshan_app/views/search/search_input.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: _buildSliverContent(),
          )
        ]
      ),
    );
  }

  Widget _buildSliverAppBar () {
    return SliverAppBar(
      pinned: true,
      title: SearchInput(),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Icon(Icons.home),
          // child: Icon(TolyIcon.icon_sound),
        )
      ],
    );
  }

  Widget _buildSliverContent () => GestureDetector(
    onTap: () {
       hideKeyUp();
    },
    child: Container(
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: Colors.red),
      ),
      child: Text('1111')
    )
  );

  void hideKeyUp () {
    FocusScopeNode currentFocus = FocusScope.of(context);
    print('1111sdffdf');
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  }
  
}