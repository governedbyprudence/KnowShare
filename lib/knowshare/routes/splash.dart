import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/provider/syscheck.dart';
import 'package:knowshare_app/knowshare/routes/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';
class splashScreenRoute extends StatefulWidget {
  const splashScreenRoute({Key? key}) : super(key: key);
  static const routeName = "/splash";
  @override
  _splashScreenRouteState createState() => _splashScreenRouteState();
}

class _splashScreenRouteState extends State<splashScreenRoute> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: Icon(Icons.photo),
      duration: Duration(seconds: 3),
      done: Done(
        homeScreenRoute(),
      ),
    );
  }
}
