// // ignore: depend_on_referenced_packages

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}

// import 'package:english_words/english_words.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyAppState(),
//       child: MaterialApp(
//         title: 'Namer App',
//         theme: ThemeData(
//           colorScheme: ColorScheme.fromSwatch(
//             primarySwatch: Colors.deepOrange,
//           ),
//         ),
//         home: MyHomePage(),
//       ),
//     );
//   }
// }

// class MyAppState extends ChangeNotifier {
//   late WordPair _current = generateWordPair();

//   WordPair get current => _current;

//   void generateRandomPair() {
//     _current = generateWordPair();
//     notifyListeners();
//   }
// }

// WordPair generateWordPair() {
//   return WordPair.random();
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var appState = context.watch<MyAppState>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Namer App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'A random idea:',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             Text(
//               appState.current.asPascalCase,
//               style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 appState.generateRandomPair();
//               },
//               child: Text('Generate New Idea Again'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // This is a basic Flutter app that generates a random pair of English words and displays them on the screen. The app uses the english_words package to generate the random pair and the provider package for state management.

// // The MyApp widget is the root widget of the app and it sets up the ChangeNotifierProvider with an instance of MyAppState. MyAppState is the state management class that generates the random word pair and provides it to the rest of the app. It extends ChangeNotifier to allow it to notify the app when the state changes.

// // The MyHomePage widget is the main screen of the app and it displays the current random word pair along with a button to generate a new one. It uses the context.watch method to listen for changes to MyAppState and update the UI accordingly.

// // Overall, this app is a simple example of how to use the provider package for state management in a Flutter app.

