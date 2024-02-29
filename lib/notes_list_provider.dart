import 'package:flutter/material.dart';

class NotesListProvider extends ChangeNotifier {
  List<Map<String, dynamic>> notes = [
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

  void addNotes(note) {
    notes.add(note);
  }
}
