import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';
import 'package:taskmate/Screens/home.dart';
import 'package:taskmate/Screens/show_full_notes.dart';
import 'package:taskmate/Screens/write_notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesListProvider(),
      child: MaterialApp(
        title: 'Taskmate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (context) => const ShowNotes(),
          WriteNotes.routeName: (context) => WriteNotes(),
        },
      ),
    );
  }
}
