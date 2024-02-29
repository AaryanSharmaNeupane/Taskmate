import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';

class ShowFullNotes extends StatelessWidget {
  final String id, title, description;
  const ShowFullNotes(
      {super.key,
      required this.id,
      required this.title,
      required this.description});
  static const routeName = "/show_full_notes";

  @override
  Widget build(BuildContext context) {
    // final note = Provider.of<NotesListProvider>(context).notes;
    // late String title;
    // late String description;

    // for (int index = 0; index < note.length; index++) {
    //   if (note[index]['id'] == noteId) {
    //     title = note[index]['title'];
    //     description = note[index]['description'];
    //   }
    // }

    void deleteNote(String id) {
      Provider.of<NotesListProvider>(context, listen: false).deleteNotes(id);
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Taskmate",
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            IconButton(
              onPressed: () => deleteNote(id),
              icon: const Icon(Icons.delete_forever_rounded),
              color: Colors.white,
            )
          ],
          backgroundColor: const Color.fromARGB(255, 236, 110, 211),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("Edit"))
              ],
            ),
          ),
        ));
  }
}
