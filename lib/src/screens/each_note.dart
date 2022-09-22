import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/src/screens/recent_note.dart';
import 'package:noteapp/src/util/notes.dart';

class EachNoteEditing extends StatefulWidget {
  final String? title, body;
  final int? position;
  const EachNoteEditing({Key? key, this.title, this.body, this.position})
      : super(key: key);

  @override
  State<EachNoteEditing> createState() => _EachNoteEditingState();
}

class _EachNoteEditingState extends State<EachNoteEditing> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _bodyController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title ?? '');
    _bodyController = TextEditingController(text: widget.body ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(248, 238, 226, 1),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/arrow-left.png')),
                  const Spacer(),
                  Text(
                    'Edit Note',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                      color: const Color.fromRGBO(64, 59, 54, 1),
                    ),
                  ),
                  const Spacer(),
                  FocusedMenuHolder(
                      menuWidth: MediaQuery.of(context).size.width * 0.50,
                      blurSize: 5.0,
                      menuItemExtent: 45,
                      menuBoxDecoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      duration: const Duration(milliseconds: 100),
                      openWithTap: true,
                      animateMenuItems: true,
                      blurBackgroundColor: Colors.black54,
                      menuItems: <FocusedMenuItem>[
                        FocusedMenuItem(
                            title: const Text('Save'),
                            trailingIcon: const Icon(Icons.save),
                            onPressed: () {
                              if (_titleController.text.isNotEmpty) {
                                if (widget.position == null) {
                                  if (note == null) {
                                    note = [
                                      {
                                        'title': _titleController.text,
                                        'content': _bodyController.text
                                      }
                                    ];
                                  } else {
                                    note!.add({
                                      'title': _titleController.text,
                                      'content': _bodyController.text
                                    });
                                  }
                                } else {
                                  note![widget.position!] = {
                                    'title': _titleController.text,
                                    'content': _bodyController.text
                                  };
                                }
                                Navigator.pushAndRemoveUntil(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const RecentNotes();
                                }), (route) => false);
                              }
                            }),
                        FocusedMenuItem(
                            title: const Text('Delete'),
                            trailingIcon: const Icon(Icons.delete),
                            onPressed: () {
                              if (note!.length == 1) {
                                note = null;
                              } else if (widget.position != null) {
                                note!.removeAt(widget.position!);
                              }
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(builder: (context) {
                                return const RecentNotes();
                              }), (route) => false);
                            }),
                      ],
                      onPressed: () {},
                      child: Image.asset('assets/more.png'))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _titleController,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w900,
                  fontSize: 24,
                  color: const Color.fromRGBO(64, 59, 54, 1),
                ),
                decoration: const InputDecoration(
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Color.fromRGBO(64, 59, 54, 1),
                  ),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  textAlign: TextAlign.justify,
                  controller: _bodyController,
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: const Color.fromRGBO(64, 59, 54, 1),
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Notes',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: Color.fromRGBO(64, 59, 54, 1),
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
