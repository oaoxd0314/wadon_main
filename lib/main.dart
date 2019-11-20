import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wadone_main/bloc/pagebloc.dart';
import 'package:wadone_main/ui/page/InitPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => PageBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: InitPage(),
      ),
    );
  }
}