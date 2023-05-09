import 'package:abd/layout/news_app/cubit/cubit.dart';
import 'package:abd/layout/shop_app/cubit/cubit.dart';
import 'package:abd/layout/shop_app/shop_layout.dart';
import 'package:abd/layout/todo_app/todo_layout.dart';
import 'package:abd/shared/bloc_observer.dart';
import 'package:abd/shared/cubit/cubit.dart';
import 'package:abd/shared/cubit/states.dart';
import 'package:abd/shared/network/local/cache_helper.dart';
import 'package:abd/shared/network/remote/dio_helper.dart';
import 'package:abd/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'modules/shop_app/login/shop_login_screen.dart';
import 'modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'shared/bloc_observer.dart';
import 'shared/components/constants.dart';

void main() {
  BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      DioHelper.init();
      await CacheHelper.init();
      bool? isDark = CacheHelper.getData(key: 'isDark');
      Widget widget;
      bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
      token = CacheHelper.getData(key: 'tokenshop');
      if (onBoarding != null) {
        if (token != null)
          widget = ShopLayout();
        else
          widget = ShopLoginScreen();
      } else {
        widget = OnBoardingScreen();
      }

      runApp(MyApp(
        isDark: isDark,
        widget: widget,
      ));
      //53f69a5c30f640adbaa7cfea1b593334
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? widget;
  MyApp({this.isDark, this.widget});
  @override
  Widget build(BuildContext context) {
    // widget == null ? isonBordingnull = true : isonBordingnull = false;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getBusiness(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..changeAppMode(ismode: isDark),
        ),
        BlocProvider(
          create: (context) => ShopCubit()
            ..getHomeData()
            ..getCategories()
            ..getFavorites()
            ..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) => {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.light : ThemeMode.dark,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
