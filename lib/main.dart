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

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);

    }else {
      favorites.add(current);
    }
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children :[
          SafeArea(
            child: NavigationRail(
              extended: false,
              destinations: [
                NavigationRailDestination(icon: Icon(Icons.home), label: Text('Home'),),
                NavigationRailDestination(icon: Icon(Icons.home), label: Text('Favorites'),),         ]
              ],
              selectedIndex: 0,
              onDestinationSelected: (value) {
                print('selected: $value');
              },
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: GeneratorPage(),

            ),
          )
        ]
      )
    )
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context )
}
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontSize: 24,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: pair.asPascalCase,
        ),
      ),
    );
  }
}

// import 'package:english_words/english_words.dart';: Imports the english_words package, which is used to generate random word pairs.
// import 'package:flutter/material.dart';: Imports the Flutter material library, which contains various widgets and utilities for building material design applications.
// import 'package:provider/provider.dart';: Imports the provider package, which is used to manage the application state.
// void main() {...}: The entry point of the application. It calls runApp to run the MyApp widget.
// class MyApp extends StatelessWidget {...}: A stateless widget that represents the root of the application. It uses the ChangeNotifierProvider widget to create an instance of the MyAppState class and make it available to all descendant widgets.
// create: (context) => MyAppState(),: The create parameter of ChangeNotifierProvider takes a callback function that returns the value of the provider. In this case, the callback creates an instance of the MyAppState class.
// child: MaterialApp(...): The child widget of ChangeNotifierProvider is a MaterialApp, which provides various material design components and styles for the application.
// theme: ThemeData(...): The theme parameter of MaterialApp is used to set the theme of the application. In this case, it sets the primary color to deep orange.
// home: MyHomePage(),: The home parameter of MaterialApp specifies the widget to be displayed as the home screen of the application. In this case, it is MyHomePage.
// class MyAppState extends ChangeNotifier {...}: A ChangeNotifier class that holds the state of the application. It has a single property current that holds a randomly generated word pair.
// var current = WordPair.random();: The current property is initialized with a randomly generated word pair.
// class MyHomePage extends StatelessWidget {...}: A stateless widget that represents the home screen of the application. It uses the watch method provided by the context object to listen for changes in the application state.
// var appState = context.watch<MyAppState>();: The watch method takes a generic type parameter that specifies the type of the state to be watched. In this case, it is MyAppState. The watch method returns the current state of the specified type and triggers a rebuild when the state changes.
// Text('A random idea:'): A Text widget that displays the label "A random idea:" on the screen.
// Text(appState.current.asLowerCase): A Text widget that displays the randomly generated word pair in lowercase letters on the screen