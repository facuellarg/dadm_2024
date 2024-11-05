import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: HomePage(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {
  var greeting = 'Hello World!';

  void addExclamation() {
    greeting += '!';
    notifyListeners();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var appState = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('DADM 2024'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: Text(appState.greeting),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          appState.addExclamation();
        },
        tooltip: "EMOTIOOOOOONNN",
        child: Icon(Icons.emoji_emotions),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: theme.colorScheme.primary,
        child: Container(
          height: 50.0,
        ),
      ),
    );
  }
}
