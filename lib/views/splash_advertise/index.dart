import 'package:flutter/material.dart';
import 'package:huoshan_app/router/routes.dart';

class SplashAdvertise extends StatefulWidget {
  @override
  _SplashAdvertiseState createState() => _SplashAdvertiseState();
}

class _SplashAdvertiseState extends State<SplashAdvertise> {

  @override
  void initState() {
    autoNavigator();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void autoNavigator () {
    Future.delayed(Duration(milliseconds: 5000)).then((e) {
      Navigator.of(context).pushReplacementNamed(FireRouter.navBottom);
    });
  }

  void navigator () {
    Navigator.of(context).pushReplacementNamed(FireRouter.navBottom);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: Colors.red),
        color: Colors.white
      ),
      child: GestureDetector(
        // onTap: () => navigator(),
        child: Text('开场动画')
      )
    );
  }
}