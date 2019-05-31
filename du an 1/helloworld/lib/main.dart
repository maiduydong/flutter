import 'package:helloworld/data.dart';
import 'package:helloworld/detail.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter/rendering.dart';

void main() {
//  debugPaintSizeEnabled = true;
//  debugPaintBaselinesEnabled = true;
//  debugPaintPointersEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.green,
        platform: TargetPlatform.iOS,
      ),
      home: Home(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  ///Generate parameterized route --> e.g: detail/some book title
  generateRoute(RouteSettings settings) {
    final path = settings.name.split('/');
    final title = path[1];

    Book book = books.firstWhere((it) => it.title == title);
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => Detail(book),
    );
  }
}