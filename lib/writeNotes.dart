import 'package:flutter/material.dart';

class WriteNotes extends StatelessWidget {
  const WriteNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const ListTile(
            title: Text("Title"),
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          const ListTile(
            title: Text("Note"),
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Save")),
        ],
      ),
    );
  }
}
