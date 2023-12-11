import 'package:board/models/board_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:board/widgets/board.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrap MaterialApp with ChangeNotifierProvider
    return ChangeNotifierProvider(
      create: (context) => BoardModel(), // Provide your BoardModel
      child: MaterialApp(
        title: 'Board',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BoardHomePage(title: 'The board app'),
      ),
    );
  }
}

class BoardHomePage extends StatefulWidget {
  const BoardHomePage({super.key, required this.title});

  final String title;

  @override
  State<BoardHomePage> createState() => _BoardHomePageState();
}

class _BoardHomePageState extends State<BoardHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Board(),
    );
  }
}
