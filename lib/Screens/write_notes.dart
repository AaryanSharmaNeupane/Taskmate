import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';
import 'package:taskmate/Screens/home.dart';
import 'package:taskmate/Widgets/notes_form.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class WriteNotes extends StatelessWidget {
  WriteNotes({super.key});

  static const routeName = "/write_notes";

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String imagePath = "";

  void saveNotes(context, title, description, editId) {
    if (editId != "") {
      if (Provider.of<NotesListProvider>(context, listen: false).getImagePath !=
              "" &&
          Provider.of<NotesListProvider>(context, listen: false).getImagePath !=
              imagePath) {
        imagePath =
            Provider.of<NotesListProvider>(context, listen: false).getImagePath;
      }
      Provider.of<NotesListProvider>(context, listen: false)
          .editNotes(title, description, editId, imagePath);
      Provider.of<NotesListProvider>(context, listen: false).setEditID = "";
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Home.routeName, (route) => false);
    } else {
      Provider.of<NotesListProvider>(context, listen: false).addNotes({
        "id": const Uuid()
            .v4(), //Here, Uuid package is used to create a universally unique id
        "title": title,
        "description": description,
        "imgPath":
            Provider.of<NotesListProvider>(context, listen: false).getImagePath
      });
    }
    Provider.of<NotesListProvider>(context, listen: false).setImagePath = "";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          "Notes Saved",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(seconds: 1),
      ),
    );
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
          title =
              TextEditingController(text: notesProvider.notes[index]['title']);
          description = TextEditingController(
              text: notesProvider.notes[index]['description']);
          imagePath = notesProvider.notes[index]['imgPath'];
        }
      }
    }
    //

    return Scaffold(
        appBar: AppBar(
          title: const Text("Taskmate",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        body: Column(
          children: [
            notesForm(context, title, description, imagePath),
            const SizedBox(
              height: 1,
            ),
            ElevatedButton(
              onPressed: () {
                if (title.text != "" || description.text != "") {
                  saveNotes(context, title.text, description.text, editId);
                  title.clear();
                  description.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        "Must fill title or description",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 198, 7, 7),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}
