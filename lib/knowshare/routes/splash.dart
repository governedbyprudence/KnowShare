import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/provider/Auth/auth.dart';
import 'package:knowshare_app/knowshare/provider/syscheck.dart';
import 'package:knowshare_app/knowshare/routes/home.dart';
import 'package:knowshare_app/knowshare/routes/homescreen.dart';
import 'package:knowshare_app/knowshare/routes/login.dart';
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
    return Consumer<authProvider>(
      builder:(context,auth,child)=>SplashView(
        logo:const Icon(Icons.photo),
        duration:const Duration(seconds: 3),
        done: Done(
          auth.state==authState.loggedIn?const homeScreenRoute():const loginScreenRoute()
        ),
      ),
    );
  }
}
