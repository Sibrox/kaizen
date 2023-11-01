import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen/models/second_survey/bloc/second_survey_bloc.dart';
import 'package:kaizen/models/shop/bloc/shop_bloc.dart';
import 'package:kaizen/models/shop/shop.dart';
import 'package:kaizen/models/user/bloc/user_bloc.dart';
import 'package:kaizen/models/user/user.dart';
import 'package:kaizen/screens/shop_screen.dart';
import 'models/main_survey/bloc/main_survey_bloc.dart';

void main() {
  runApp(const Kaizen());
}

class Kaizen extends StatelessWidget {
  const Kaizen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaizen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          body: MultiBlocProvider(
              providers: [
            BlocProvider<MainSurveyBloc>(
                create: (context) => MainSurveyBloc()
                  ..add(
                      EventLoadInfos("assets/jsons/ita/main_questions.json"))),
            BlocProvider<SecondSurveyBloc>(
                lazy: false,
                create: (context) => SecondSurveyBloc()
                  ..add(EventLoadSecondSurvey(
                      "assets/jsons/ita/second_questions.json"))),
            BlocProvider<ShopBloc>(
                lazy: false, create: (context) => ShopBloc(Shop(rewards: []))),
            BlocProvider<UserBloc>(
                lazy: false, create: (context) => UserBloc(const User(credits: 100, rewardsHistory: []))
            )
          ],
              child: const ShopScreen())),
    );
  }
}
