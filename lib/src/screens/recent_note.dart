import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/src/screens/drawer/account.dart';
import 'package:noteapp/src/screens/each_note.dart';
import 'package:noteapp/src/util/notes.dart';
import 'package:noteapp/src/widgets/button.dart';

class RecentNotes extends StatefulWidget {
  const RecentNotes({Key? key}) : super(key: key);

  @override
  State<RecentNotes> createState() => _RecentNotesState();
}

class _RecentNotesState extends State<RecentNotes> {
  Stream getNote() async* {
    yield note;
  }

  Stream? notes;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    notes = getNote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const AccountScreen(),
      //floatingActionButton: ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const EachNoteEditing(),
            ),
          );
        },
        backgroundColor: const Color.fromRGBO(217, 97, 76, 1),
        child: const Icon(Icons.add),
      ),
      backgroundColor: const Color.fromRGBO(248, 238, 226, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                InkWell(
                    onTap: () {
                      _key.currentState!.openDrawer();
                    },
                    child: Image.asset('assets/drawer.png')),
                const Spacer(),
                Text(
                  'All Notes',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    color: const Color.fromRGBO(64, 59, 54, 1),
                  ),
                ),
                const Spacer(),
                InkWell(child: Image.asset('assets/search.png'))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            StreamBuilder(
                stream: getNote(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(
                          color: Color.fromRGBO(217, 97, 76, 1)),
                    );
                  } else if (snapshot.hasData) {
                    final data = snapshot.data as List;
                    return Expanded(
                      child: GridView.builder(
                        itemCount: data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 10),
                        itemBuilder: (BuildContext context, int index) {
                          return EachNotes(
                              title: data[index]['title'],
                              position: index,
                              body: data[index]['content']);
                        },
                      ),
                    );
                  } else {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Image.asset('assets/create_note.png'),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Create Your First Note',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: const Color.fromRGBO(64, 59, 54, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'Add a note about anything (your thoughts on '
                              'climate change, or your history essay) and '
                              'share it witht the world.',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: const Color.fromRGBO(64, 59, 54, 1),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          AppButton(
                            text: 'Create A Note',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const EachNoteEditing(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text('Import Notes',
                                style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                  color: const Color.fromRGBO(217, 97, 76, 1),
                                )),
                          ),
                          const SizedBox(height: 50)
                        ],
                      ),
                    );
                  }
                }))
          ],
        ),
      ),
    );
  }
}

class EachNotes extends StatelessWidget {
  final String title, body;
  final int position;
  const EachNotes(
      {Key? key,
      required this.title,
      required this.body,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EachNoteEditing(
                      title: title,
                      body: body,
                      position: position,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.5,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                color: const Color.fromRGBO(89, 85, 80, 1),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Flexible(
              child: Text(
                body,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: const Color.fromRGBO(89, 85, 80, 1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
