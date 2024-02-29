import 'package:flutter/material.dart';
import 'package:taskmate/showNotes.dart';
import 'package:taskmate/writeNotes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> tabs = [
    WriteNotes(),
    ShowNotes(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Taskmate",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 236, 110, 211),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 236, 110, 211),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add_rounded), label: "Write Notes"),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_sharp), label: "Show Notes")
        ],
      ),
    );
  }
}
