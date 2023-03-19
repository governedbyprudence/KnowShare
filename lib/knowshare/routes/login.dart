// import 'package:flutter/cupertino.dart';
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
      builder: (context, auth, child) {
        if (auth.state == authState.waiting) {
          return Container(
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          );
        }
        if (auth.state == authState.loggedIn) {
          return const homeScreenRoute();
        }
        return Scaffold(
          body: Container(
              // padding:EdgeInsets.symmetric(vertical: 30),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade800,
                    Colors.greenAccent.shade400,
                    Colors.lightGreen.shade400,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Login",
                          style:
                              TextStyle(color: Colors.white, fontSize: 30.sp),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome Back",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),

                      child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Color.fromRGBO(172, 120, 85, 0.294),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade200))),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Email or Phone number",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  auth.login();
                                },
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromARGB(255, 45, 128, 121),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                        
                                    ),
                                    
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 70,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                            color: Colors.grey.shade400),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )),
                      // color: Colors.white,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
