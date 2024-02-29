import 'package:flutter/material.dart';

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

  final List<Map<String, dynamic>> task = [
    {
      'id': 1,
      'title': 'Swim',
      'description': 'I need to go swimming to reduce weight'
    },
    {
      'id': 2,
      'title': 'Run',
      'description':
          'I need to go running to improve endurance I need to go running to improve endurance I need to go running to improve endurance'
    },
    {
      'id': 3,
      'title': 'Study',
      'description': 'I need to study for my upcoming exam'
    },
    {
      'id': 4,
      'title': 'Sleep',
      'description':
          'I need to get enough sleep for better health I need to get enough sleep for better health I need to get enough sleep for better health'
    },
  ];

  @override
  Widget build(BuildContext context) {
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
