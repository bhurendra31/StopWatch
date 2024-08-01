// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/More_Programs/Stopwatch.dart';
// import 'package:flutter_application_1/More_Programs/Timer.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  const MaterialApp(
//       debugShowCheckedModeBanner: false,
//      home: StopwatchPage()
//     //  home: TimerPageWidget(),
          
//     );
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_1/More_Programs/Stopwatch.dart';
// // import 'package:flutter_application_1/More_Programs/Timer.dart';
// // // import 'Stopwatch.dart';
// // // import 'timer.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Stopwatch & Timer',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => StopwatchPage(),
// //         '/timer': (context) => TimerPageWidget(),
// //       },
// //     );
// //   }
// // }


//### Step 3: Set Up Navigation in `main.dart`

//In your `main.dart`, use a `BottomNavigationBar` to switch between the Stopwatch and Timer pages.

//```dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/More_Programs/Stopwatch.dart';
import 'package:flutter_application_1/More_Programs/Timer.dart';
//import 'stopwatch.dart';
//import 'timer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch & Timer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    StopwatchPage(),
    TimerPageWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
         backgroundColor: Colors.black,
         unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: "Stopwatch",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Timer",
          ),
        ],
      ),
    );
  }
}