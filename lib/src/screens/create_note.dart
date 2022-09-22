import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/src/screens/recent_note.dart';
import 'package:noteapp/src/widgets/button.dart';

class CreateNote extends StatelessWidget {
  const CreateNote({Key? key}) : super(key: key);

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
                    // onTap: () {
                    //   Navigator.pop(context);
                    // },
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
                InkWell(
                    // onTap: () {
                    //   Navigator.pop(context);
                    // },
                    child: Image.asset('assets/search.png'))
              ],
            ),
            Expanded(
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RecentNotes();
                      }));
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
            )
          ],
        ),
      ),
    );
  }
}
