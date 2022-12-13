// @dart=2.9
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shopapp/DioHelper.dart';
import 'package:shopapp/OnBoarding.dart';
import 'package:shopapp/Settings.dart';
import 'package:shopapp/Sharedpreference.dart';
import 'package:shopapp/components.dart';
import 'package:shopapp/shopCubit.dart';
import 'package:shopapp/themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Layout.dart';
import 'bloc_observer.dart';
import 'logIn.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  Widget widget;
  bool onBoarding=CacheHelper.getData(key: 'onBoarding');
   token=CacheHelper.getData(key: 'token');
if(onBoarding!=null)
  {
    if(token!=null) widget =Layout();
    else widget=LogIn();
  }
else
  {
    widget=OnBoardingScreen();
  }


  runApp(MyApp(

    startWidget: widget,
  ));
}



class MyApp extends StatelessWidget
{

  final bool isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    this.startWidget,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopCubit()..getHomeData()..getCategories()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
       // darkTheme: darkTheme,
        // themeMode:
        // NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,

        home:startWidget,
      ),
    );
  }
}