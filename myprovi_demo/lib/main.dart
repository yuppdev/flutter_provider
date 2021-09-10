import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'home_screen.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (_) => CounterProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomeScreen()
        ),
      )
  );
}







