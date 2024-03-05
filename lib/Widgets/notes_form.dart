import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taskmate/Provider/notes_list_provider.dart';

Widget notesForm(context, title, description, imgPath) {
  File savedImagePath;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    savedImagePath = File(image.path);
    Provider.of<NotesListProvider>(context, listen: false).setImagePath =
        savedImagePath.path;
  }

  // String recentClicked = Provider.of<NotesListProvider>(context).getImagePath;

  return Flexible(
    child: ListView(
      shrinkWrap: true,
      children: [
        ListTile(
          title: Text(
            "Title",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          title: TextField(
            controller: title,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).primaryColorDark,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            "Note",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        ListTile(
          title: TextField(
            maxLines: 5,
            controller: description,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).primaryColorDark,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        ListTile(
          title: Consumer<NotesListProvider>(
            builder: (context, value, _) {
              return Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => pickImage(),
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        border: Border.all(
                          width: 1,
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: value.getImagePath.isEmpty && imgPath.isEmpty
                          ? const Icon(
                              Icons.add_a_photo,
                              size: 40,
                              color: Colors.teal,
                            )
                          : value.getImagePath.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(value.getImagePath),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(imgPath),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    ),
  );
}
