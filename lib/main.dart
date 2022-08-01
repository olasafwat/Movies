import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/provider/GetPopular.dart';
import 'controller/provider/GetTopRate.dart';
import 'view/components/card/CardPopular.dart';
import 'view/screens/HomeScreen/HomeScreen.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_)=> GetPopular()),
        ChangeNotifierProvider(create: (_)=> GetTopRate()),
      ],

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
