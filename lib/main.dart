import 'package:flutter/material.dart';
import 'package:locationapp/screens/view/homePage.dart';
import 'package:provider/provider.dart';

import 'screens/provider/homeProvider.dart';

void main(){
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Class_Provider>(create: (context)=>Class_Provider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/':(context)=>permission_Page(),
          },
        ),
      )
  );
}