import 'package:flutter/material.dart';
import 'package:sigma_task/models/database.dart';
import 'screens/main_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=>SpacesDatabase(),
          child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(),
      ),
    );
  }
}
