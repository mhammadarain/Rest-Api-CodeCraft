import 'package:api_practice_codecraft/screens/list%20post/screen_complex_list.dart';
import 'package:api_practice_codecraft/screens/list%20post/screen_list_post.dart';
import 'package:api_practice_codecraft/screens/list%20post/screen_list_without_model.dart';
import 'package:api_practice_codecraft/screens/list%20post/screen_todo_list.dart';
import 'package:api_practice_codecraft/screens/list%20post/screen_user_data.dart';
import 'package:api_practice_codecraft/screens/multi%20post/multi_data_screen.dart';
import 'package:api_practice_codecraft/screens/multi%20post/multi_data_without_model_screen.dart';
import 'package:api_practice_codecraft/screens/single%20post/screen_with_model.dart';
import 'package:api_practice_codecraft/screens/single%20post/screen_without_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenComplexList()
    );
  }
}

