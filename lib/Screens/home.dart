import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';
import 'package:taskmate/Screens/show_full_notes.dart';
import 'package:taskmate/Screens/write_notes.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  static const routeName = "/show-notes";

  //If the description length is more than 82, this function truncates the length of the description
  String _truncateDescription(String description) {
    if (description.length > 82) {
      return "${description.substring(0, 82)}...";
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Consumer<NotesListProvider>(
        builder: (context, notesProvider, child) => notesProvider.notes.isEmpty
            ? const Center(
                child: Text(
                  "You don't have any notes!!😔",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : GridView.builder(
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
                            description: notesProvider.notes[index]
                                ['description'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Theme.of(context).primaryColorDark,
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notesProvider.notes[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Theme.of(context).primaryColorLight,
                              ),
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
        onPressed: () {
          Provider.of<NotesListProvider>(context, listen: false).setEditID = "";
          Navigator.of(context).pushNamed(WriteNotes.routeName);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Theme.of(context).primaryColorLight,
        child: const Icon(Icons.add),
      ),
    );
  }
}
