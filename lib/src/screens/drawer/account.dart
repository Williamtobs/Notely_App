import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
            Center(
              child: Text(
                'NOTELY',
                style: GoogleFonts.titanOne(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: const Color.fromRGBO(64, 59, 54, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                width: 160,
                height: 160,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(229, 213, 197, 1),
                  image: DecorationImage(
                    image: AssetImage('assets/profile.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'William Tobi',
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                  color: const Color.fromRGBO(64, 59, 54, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
                child: Text('Lagos, Nigeria',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: const Color.fromRGBO(64, 59, 54, 1),
                    ))),
            const SizedBox(
              height: 20,
            ),
            const EachTiles(
              image: 'assets/award.png',
              title: 'Buy premium',
            ),
            const EachTiles(
              image: 'assets/pencil.png',
              title: 'Edit Profile',
            ),
            const EachTiles(
              image: 'assets/contrast.png',
              title: 'App Theme',
            ),
            const EachTiles(
              image: 'assets/bell.png',
              title: 'Notification',
            ),
            const EachTiles(
              image: 'assets/folder-check.png',
              title: 'Security',
            ),
            const EachTiles(
              image: 'assets/logout.png',
              title: 'Log out',
            ),
          ],
        ),
      ),
    );
  }
}

class EachTiles extends StatelessWidget {
  final String title, image;
  const EachTiles({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromRGBO(255, 253, 250, 1),
              ),
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: const Color.fromRGBO(64, 59, 54, 1),
              ),
            ),
            const Spacer(),
            Image.asset('assets/arrow-right.png'),
          ],
        ),
      ),
    );
  }
}
