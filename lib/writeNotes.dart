import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/notes_list_provider.dart';

class WriteNotes extends StatelessWidget {
  WriteNotes({super.key});
  var title = TextEditingController();
  var description = TextEditingController();

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
              controller: title,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const ListTile(
            title: Text("Note"),
          ),
          ListTile(
            title: TextField(
              controller: description,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          ElevatedButton(
              onPressed: () =>
                  Provider.of<NotesListProvider>(context, listen: false)
                      .addNotes({
                    "id": 100,
                    "title": title.text,
                    "description": description.text,
                  }),
              child: const Text("Save")),
        ],
      ),
    );
  }
}
