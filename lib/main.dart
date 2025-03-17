import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myfitnessapp/Dashboard/dashboard.dart';
import 'package:myfitnessapp/sign_up.dart';
import 'package:myfitnessapp/splash_screen.dart';

// void main() {
//   runApp( MyApp());
// }

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //       apiKey: "AIzaSyDsvfErLtIe1LrrlMFUwEV7ChLH9PeVlU4",
  //       appId: "1:862743419655:android:6c99a781f9a4252a7103a2",
  //       messagingSenderId: "862743419655",
  //       projectId: "myfitnessapp-7a1f9",
  //       // Your web Firebase config options
  //     ),
  //   );
  // } else {
  //   await Firebase.initializeApp();
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});



//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
     
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
 
//     return Scaffold(
//       appBar: AppBar(
      
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(

//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
