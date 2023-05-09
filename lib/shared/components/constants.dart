import 'package:abd/modules/shop_app/login/shop_login_screen.dart';
import 'package:abd/shared/network/local/cache_helper.dart';
import 'package:flutter/material.dart';

String apiNewskey = '53f69a5c30f640adbaa7cfea1b593334';

void signOut(context) {
  CacheHelper.removeData(key: "tokenshop").then((value) {
    if (value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ShopLoginScreen(),
          ),
          (route) => false);
    }
  });
}

String? token;
