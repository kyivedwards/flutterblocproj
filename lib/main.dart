import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocproj/cubit/app_cubit_logics.dart';
import 'package:flutterblocproj/cubit/app_cubits.dart';
import 'package:flutterblocproj/pages/detail_page.dart';
import 'package:flutterblocproj/pages/home_page.dart';
import 'package:flutterblocproj/pages/navpages/main_page.dart';
import 'package:flutterblocproj/pages/navpages/my_page.dart';
import 'package:flutterblocproj/pages/services/data_services.dart';
import 'package:flutterblocproj/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color:Colors.black
            ),
            elevation: 0,
            backgroundColor: Colors.white
          )
        ),
        home: BlocProvider<AppCubits>(
          create: (context)=>AppCubits(
            data: DataServices(),
          ),
          //access/create cubit states
          child: AppCubitLogics(),
        )
        );
  }
}