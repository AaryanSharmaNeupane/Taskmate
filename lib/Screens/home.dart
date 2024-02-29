import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';
import 'package:taskmate/Screens/show_full_notes.dart';
import 'package:taskmate/Screens/write_notes.dart';

class ShowNotes extends StatelessWidget {
  const ShowNotes({super.key});

  //If the description length is more than 90, this function truncates the length of the description
  String _truncateDescription(String description) {
    if (description.length > 90) {
      return "${description.substring(0, 90)}...";
    } else {
      return description;
    }
  }

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
      body: Consumer<NotesListProvider>(
        builder: (context, notesProvider, child) => GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: notesProvider.notes.length,
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ShowFullNotes(
                        id: notesProvider.notes[index]['id'],
                        title: notesProvider.notes[index]['title'],
                        description: notesProvider.notes[index]['description'],
                      ),
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notesProvider.notes[index]['title'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          _truncateDescription(
                              notesProvider.notes[index]['description']),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(WriteNotes.routeName),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: const Color.fromARGB(255, 236, 110, 211),
        child: const Icon(Icons.add),
      ),
    );
  }
}
