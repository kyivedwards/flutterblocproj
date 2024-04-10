import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterblocproj/cubit/app_cubit_states.dart';
import 'package:flutterblocproj/cubit/app_cubits.dart';
import 'package:flutterblocproj/pages/detail_page.dart';
import 'package:flutterblocproj/pages/home_page.dart';
import 'package:flutterblocproj/pages/navpages/main_page.dart';
import 'package:flutterblocproj/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //pass app cubits and cubit states
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if(state is DetailState){
            return DetailPage();
          }if(state is WelcomeState){
            return WelcomePage();
          }if(state is LoadedState){
            return MainPage();
          }if(state is LoadingState){
            //show buffering icon
            return Center(child: CircularProgressIndicator(),);
          }else {
            return Container();
          }
        },
        ),
    );
  }
}