import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowshare_app/knowshare/provider/Auth/auth.dart';
import 'package:knowshare_app/knowshare/routes/homescreen.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

import '../provider/Auth/auth.dart';

class loginScreenRoute extends StatefulWidget {
  static const routeName = "login";
  const loginScreenRoute({Key? key}) : super(key: key);

  @override
  State<loginScreenRoute> createState() => _loginScreenRouteState();
}

class _loginScreenRouteState extends State<loginScreenRoute> {

  @override
  Widget build(BuildContext context) {
    return Consumer<authProvider>(
      builder: (context,auth,child){
        if(auth.state == authState.waiting){
          return Container(alignment:Alignment.center,child: const CircularProgressIndicator(),);
        }
        if(auth.state == authState.loggedIn){
         return const homeScreenRoute();
        }
        return Scaffold(
          body: Stack(
            children: [
              if(auth.state == authState.error)
              const Positioned.fill(child:Text("Some Error occurred")),
              Positioned.fill(top: 80.h,child: Container(
                alignment: Alignment.center,
                child: SignInButton(buttonType: ButtonType.google,
                    onPressed: (){
                      //print(context.watch<authProvider>().state);
                      context.read<authProvider>().login();
                    }),
              )
              )
            ],
          ),
        );
      },
    );
  }
}
