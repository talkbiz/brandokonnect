import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:vpn_basic_project/helpers/pref.dart';
import 'package:vpn_basic_project/screens/connect.dart';
import 'package:vpn_basic_project/screens/home_screen.dart';

import '../helpers/ad_helper.dart';
import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key, this.routeName});
  final String? routeName;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      //exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      AdHelper.precacheInterstitialAd();
      AdHelper.precacheNativeAd();

      if (Pref.isLogin) {

        Get.off(() => HomeScreen());
      } else {

        if (widget.routeName != null) {
          // routeName is empty when user login
          // brandokonnet://dashboard
          if (!widget.routeName!.contains('/')) {

            Pref.isLogin = !Pref.isLogin;
            Get.off(() => HomeScreen());
          } else {

            Get.off(() => ConnectScreen());
          }
        } else {

          Get.off(() => ConnectScreen());
        }
      }

      //navigate to home
     // Get.off(() => ConnectScreen());
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    //initializing media query (for getting device screen size)
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          //app logo
          Positioned(
              left: mq.width * .3,
              top: mq.height * .2,
              width: mq.width * .4,
              child: Image.asset('assets/images/logo.png')),
        ],
      ),
    );
  }
}
