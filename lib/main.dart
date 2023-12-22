import 'package:board/models/board_model.dart';
import 'package:board/models/edit_mode_model.dart'; // Import EditModeModel
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
    // Use MultiProvider to provide both BoardModel and EditModeModel
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BoardModel()),
        ChangeNotifierProvider(create: (context) => EditModeModel()),
      ],
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
    // Access the EditModeModel using Provider
    final editModeModel = Provider.of<EditModeModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(editModeModel.isEditMode ? Icons.check : Icons.edit),
            onPressed: () => editModeModel.toggleEditMode(),
            tooltip: editModeModel.isEditMode ? 'Finish Editing' : 'Edit Layout',
          ),
        ],
      ),
      body: const Board(),
    );
  }
}
