import 'package:flutter/material.dart';
import 'package:huoshan_app/widget/bottom_bar.dart';
import 'package:huoshan_app/views/splash_advertise/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huoshan_app/router/routes.dart';
import 'package:huoshan_app/provider/theme.dart';
import 'package:provider/provider.dart';

// import 'package:fluro/fluro.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GlobalTheme())
      ],
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<GlobalTheme>(
      builder: (context, globalTheme, child) {
        return MaterialApp(
          title: '首页',
          theme: ThemeData(
            // brightness: globalTheme.theme == 1 ? Brightness.dark : Brightness.light,
            brightness: globalTheme.theme,
            // brightness: Brightness.light,
            // backgroundColor: Colors.white,S
            // brightness: Brightness.dark, // 子页面主题色 dark -黑色
            // primaryColor: Colors.pink,
          ),
          onGenerateRoute: FireRouter.generateRoute,
          // home: Text('${globalTheme.theme}')
          home: MyHomePage(title: 'Flutter'),
          // home: Theme(
          //   data: Theme.of(context).copyWith(accentColor: Colors.red),
          //   // data: ThemeData(accentColor: Colors.yellow),
          //   child: MyHomePage(title: 'Flutter Demo Home Page'),
          // )
        );
      },
    );
    // ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // Router router = Router();
    // Routes.configureRoutes(router);
    // Application.router=router;
    // return MaterialApp(
    //   title: '首页',
    //   theme: ThemeData(
    //     // brightness: Provider.of<GlobalTheme>(context),
    //     // brightness: Brightness.light,
    //     // backgroundColor: Colors.white,
    //     // brightness: Brightness.dark, // 子页面主题色 dark -黑色
    //     // primaryColor: Colors.pink,
    //   ),
    //   onGenerateRoute: FireRouter.generateRoute,
    //   home: MyHomePage(title: 'Flutter Demo Home Page'),
    //   // home: Theme(
    //   //   data: Theme.of(context).copyWith(accentColor: Colors.red),
    //   //   // data: ThemeData(accentColor: Colors.yellow),
    //   //   child: MyHomePage(title: 'Flutter Demo Home Page'),
    //   // )
    // );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
      // child: NavBottom()
      child: SplashAdvertise()
    );
    // return MaterialApp(
    //   theme: ThemeData(
    //     // primarySwatch: Colors.pink,
    //   ),
    //   home: NavBottom()
    // );
  }
    
}
