import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'second_screen.dart';

class HomeScreen extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: const TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              child: const Text('Decrease Number'),
              onPressed: () {
                context.read<CounterProvider>().subs();
              },
            ),

            ElevatedButton(
              child: const Text('Go to second screen'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SecondScreen())
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<CounterProvider>().add();
        },
      ),
    );
  }
}