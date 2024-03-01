import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';
import 'package:taskmate/Screens/home.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class WriteNotes extends StatelessWidget {
  WriteNotes({super.key});

  static const routeName = "/write_notes";
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  void saveNotes(context, title, description, editId) {
    if (editId != "") {
      Provider.of<NotesListProvider>(context, listen: false)
          .editNotes(title, description, editId);
      Provider.of<NotesListProvider>(context, listen: false).setEditID = "";
      Navigator.of(context)
          .pushNamedAndRemoveUntil(ShowNotes.routeName, (route) => false);
    } else {
      Provider.of<NotesListProvider>(context, listen: false).addNotes({
        "id": const Uuid()
            .v4(), //Here, Uuid package is used to create a universally unique id
        "title": title,
        "description": description,
      });
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Notes Saved")));
    _title.clear();
    _description.clear();
  }

  @override
  Widget build(BuildContext context) {
    //This is done to pass the title, description value into the tesxtbox while performing edit

    NotesListProvider notesProvider =
        Provider.of<NotesListProvider>(context, listen: false);
    String editId = notesProvider.getEditId;

    if (editId != "") {
      for (int index = 0; index < notesProvider.notes.length; index++) {
        if (notesProvider.notes[index]["id"] == editId) {
          _title =
              TextEditingController(text: notesProvider.notes[index]['title']);
          _description = TextEditingController(
              text: notesProvider.notes[index]['description']);
        }
      }
    }
    //

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Taskmate",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromARGB(255, 236, 110, 211),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("Title"),
          ),
          ListTile(
            title: TextField(
              controller: _title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () =>
                  saveNotes(context, _title.text, _description.text, editId),
              child: const Text("Save")),
        ],
      ),
    );
  }
}
