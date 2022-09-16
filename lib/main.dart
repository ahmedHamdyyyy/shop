import 'package:aaaaaa/bloc/bloc/cubit.dart';
import 'package:aaaaaa/bloc/bloc/stute.dart';
import 'package:aaaaaa/local/cach_helper.dart';
import 'package:aaaaaa/local/dio.dart';
import 'package:aaaaaa/screens/Home_layout.dart';
import 'package:aaaaaa/shared/bloc/cubit.dart';
import 'package:aaaaaa/shared/bloc/status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHealper.init();
  Diohlper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  //NewsCubit()..getsports()
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getsports()),
        BlocProvider( create: (BuildContext context) => bloc(),),

      ],
      child: BlocConsumer<bloc, appstatus>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                drawerTheme: DrawerThemeData(
                  backgroundColor:bloc.get(context).isDark?HexColor("333739"):Colors.white,
                 ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: Colors.white,
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.black),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white,
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                drawerTheme: DrawerThemeData(
                  backgroundColor:bloc.get(context).isDark? HexColor("333739") :Colors.white,

                ),
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor("333739"),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange),
                appBarTheme: AppBarTheme(
                  iconTheme: IconThemeData(color: Colors.white),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor("333739"),
                      statusBarIconBrightness: Brightness.dark),
                  backgroundColor: HexColor("333739"),
                  elevation: 0.0,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor("333739"),
                ),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: bloc.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: const HomeLayOutl(),
            );
          }),
    );
  }
}
