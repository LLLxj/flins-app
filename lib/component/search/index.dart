import 'package:flutter/material.dart';
import 'package:huoshan_app/component/search/search_input.dart';

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
}