import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/notes_list_provider.dart';

class ShowNotes extends StatelessWidget {
  ShowNotes({super.key});

  //If the description length is more than 90, this function truncates the length of the description
  String _truncateDescription(String description) {
    if (description.length > 90) {
      return "${description.substring(0, 90)}...";
    } else {
      return description;
    }
  }

  void showFullNotes(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("hey"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<NotesListProvider>(context).notes;
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: task.length,
        itemBuilder: ((context, index) {
          return InkWell(
            onTap: () => showFullNotes(context),
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task[index]['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      _truncateDescription(task[index]['description']),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
