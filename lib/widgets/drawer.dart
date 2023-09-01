import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vpn_basic_project/helpers/pref.dart';
import 'package:vpn_basic_project/helpers/url_launcher.dart';
import 'package:vpn_basic_project/main.dart';
import 'package:vpn_basic_project/screens/InAppWebView.dart';
import 'package:vpn_basic_project/screens/about_us.dart';
import 'package:vpn_basic_project/screens/splash_screen.dart';

import '../screens/connect.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Menu",
                style: TextStyle(
                    color: Theme.of(context).lightText,
                    fontWeight: FontWeight.w700,
                    fontSize: 24),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => AboutUsScreen(),
                  ),
                ),
                child: Text(
                  "About us",
                  style: TextStyle(
                      color: Theme.of(context).lightText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => InAppWebView(url: "https://brandokonnect.com/privacy.php",name: 'Privacy Policy'),
                      ),
                    ),
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      color: Theme.of(context).lightText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => InAppWebView(url: "https://brandokonnect.com/referrals.php",name: 'Referrals'),
                      ),
                    ),

                child: Text(
                  "Referrals",
                  style: TextStyle(
                      color: Theme.of(context).lightText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => InAppWebView(url: "https://brandokonnect.com/subscribe.php", name: 'Subscribe'),
                      ),
                    ),
                child: Text(
                  "Subscribe",
                  style: TextStyle(
                      color: Theme.of(context).lightText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => InAppWebView(url: "https://brandokonnect.com/bank.php", name: 'Bank'),
                      ),
                    ),
                child: Text(
                  "Bank",
                  style: TextStyle(
                      color: Theme.of(context).lightText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  /// Setting [isLogin] to false
                  Pref.isLogin = !Pref.isLogin;

                  Get.offAll(SplashScreen());
                },
                child: Text(
                  "Logout",
                  style: TextStyle(
                      color: Theme.of(context).lightText,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  "assets/images/facebook.svg",
                  "assets/images/twitter.svg",
                  "assets/images/instagram.svg",
                  "assets/images/telegram.svg"
                ].map((e) => SvgPicture.asset(e)).toList(),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
