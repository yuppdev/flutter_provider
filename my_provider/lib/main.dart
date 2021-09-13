import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'mydrawer.dart';

void main(List<String> args) {
  runApp(ChangeNotifierProvider(
    create: (context) => MySettings(),
    child: MyApp(),
  ));
}

class MySettings extends ChangeNotifier {
  bool _isDark = false;
  get isDark => _isDark;
  void setBrightness(value) {
    _isDark = value;
    notifyListeners();
  }

  bool isSwitched = false;

  String text = "Hello";
  bool isChangeText = false;

  Color color = Colors.blue;
  bool isChangeColor = false;

  void changeText() {
    if (isChangeText == true) {
      isChangeText = false;
      text = "Hello";
    } else {
      isChangeText = true;
      text = "Text after change: \'Welcome to myApp?\'";
    }
    notifyListeners();
  }

  void changeColor() {
    if (isChangeColor == true) {
      isChangeColor = false;
      color = Colors.blue;
    } else {
      isChangeColor = true;
      color = Colors.red;
    }
    notifyListeners();
  }

  void changeSwitch() {
    if (isSwitched == true) {
      isSwitched = false;
    } else {
      isSwitched = true;
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App demo',
      theme: ThemeData(
        brightness: context.watch<MySettings>().isDark
            ? Brightness.dark
            : Brightness.light,
        primaryColor: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<MySettings>(builder: (context, mySettings, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: mySettings.color,
          title: const Text('Provider'),
        ),
        drawer: const MyDrawer(),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(mySettings.text),
            ElevatedButton(
                onPressed: () {
                  mySettings.changeText();
                },
                child: const Text('Change Text')),
            Switch(
              value: mySettings.isSwitched,
              onChanged: (value) {
                mySettings.changeSwitch();
              },
              // activeTrackColor: Colors.lightGreenAccent,
              // activeColor: Colors.green,
            ),
          ],
        )),
      );
    });
  }
}

// class DrawerWidget extends StatelessWidget {
//   const DrawerWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Container(
//         color: Colors.grey,
//         child: Column(
//           children: [
//             // Container(
//             //   margin: const EdgeInsets.symmetric(vertical: 20),
//             //   width: 130,
//             //   height: 130,
//             //   decoration: BoxDecoration(
//             //     border: Border.all(width: 1, color: Colors.grey),
//             //     shape: BoxShape.circle,
//             //     image: const DecorationImage(
//             //       fit: BoxFit.cover,
//             //       image: AssetImage('assets/images/football.jpg')
//             //     )
//             //   ),
//             // ),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 20),
//               decoration: const BoxDecoration(
//                 color: Colors.green,
//                 // borderRadius: BorderRadius.circular(100)
//               ),
//               child: const Center(
//                 child: SizedBox(
//                   height: 130,
//                   width: 130,
//                   child: CircleAvatar(
//                     backgroundImage:
//                         AssetImage('assets/images/football.jpg'),
//                   ),
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//                 // mySettings.setBrightness(!mySettings.isDark);
//                 context.read<MySettings>().setBrightness(!context.watch<MySettings>().isDark);
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(top: 1.0),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [Colors.orange, Colors.white, Colors.white70]),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           // icon: Image.asset('assets/icons/brightness.png'),
//                           icon: const Icon(Icons.brightness_medium_outlined),
//                         ),
//                         // const SizedBox(width: 8,),
//                         const Text(
//                           'Change Brightness',
//                           style:
//                               TextStyle(fontSize: 18, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     Switch(
//                       value: context.watch<MySettings>().isDark,
//                       onChanged: (value) {
//                         context.read<MySettings>().setBrightness(value);
//                       },
//                       activeTrackColor: Colors.lightGreenAccent,
//                       activeColor: Colors.green,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//                 // mySettings.changeText();
//                 context.read<MySettings>().changeText();
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(top: 1.0),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [Colors.orange, Colors.white, Colors.white70]),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.text_fields_outlined),
//                         ),
//                         const Text(
//                           'Change text',
//                           style:
//                               TextStyle(fontSize: 18, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     Switch(
//                       // value: mySettings.isChangeText,
//                       value: context.watch<MySettings>().isChangeText,
//                       onChanged: (value) {
//                         // mySettings.changeText();
//                         context.read<MySettings>().changeText();
//                       },
//                       activeTrackColor: Colors.lightGreenAccent,
//                       activeColor: Colors.green,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//                 // mySettings.changeColor();
//                 Provider.of<MySettings>(context, listen: false).changeColor();
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(top: 1.0),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [Colors.orange, Colors.white, Colors.white70]),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.color_lens_outlined),
//                         ),
//                         const Text(
//                           'Change color',
//                           style:
//                               TextStyle(fontSize: 18, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     Switch(
//                       // value: mySettings.isChangeColor,
//                       value: context.watch<MySettings>().isChangeColor,
//                       onChanged: (value) {
//                         // mySettings.changeColor();
//                         Provider.of<MySettings>(context, listen: false).changeColor();
//                       },
//                       activeTrackColor: Colors.lightGreenAccent,
//                       activeColor: Colors.green,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Container(
//                 margin: const EdgeInsets.only(top: 1.0),
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                       colors: [Colors.orange, Colors.white, Colors.white70]),
//                   color: Colors.white,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.logout),
//                     ),
//                     const Text(
//                       'Log out',
//                       style: TextStyle(fontSize: 18, color: Colors.black),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
