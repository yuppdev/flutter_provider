import 'package:flutter/material.dart';
import 'package:flutter_up/counter/counter_presenter.dart';
import 'package:flutter_up/counter/counter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Demo MVP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements CounterView {
  int count = 0;
  CounterPresenter? presenter;
  _MyHomePageState() {
    presenter = CounterPresenter();
    presenter!.attachView(this);

  }

  @override
  void dispose() {
    super.dispose();
    if(presenter != null) {
      presenter!.deAttachView();
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                presenter!.decrement();
              },
              child: const Text(' - ')
            ),
            const SizedBox(width: 20,),
            Text(count.toString()),
            const SizedBox(width: 20,),
            ElevatedButton(
                onPressed: () {
                  presenter!.increment();
                },
                child: const Text(' + ')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void onDecrement(int value) {
    setState(() {
      count = value;
    });
  }

  @override
  void onIncrement(int value) {
    setState(() {
      count = value;
    });
  }
}
