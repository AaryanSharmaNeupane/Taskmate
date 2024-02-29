import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/notes_list_provider.dart';
import 'package:uuid/uuid.dart';

class WriteNotes extends StatelessWidget {
  WriteNotes({super.key});
  final _title = TextEditingController();
  final _description = TextEditingController();

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
              controller: _title,
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
              controller: _description,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Provider.of<NotesListProvider>(context, listen: false)
                    .addNotes({
                  "id": const Uuid()
                      .v4(), //Here, Uuid package is used to create a universally unique id
                  "title": _title.text,
                  "description": _description.text,
                });
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("Notes Saved")));
                _title.clear();
                _description.clear();
              },
              child: const Text("Save")),
        ],
      ),
    );
  }
}
