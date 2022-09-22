import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/src/screens/recent_note.dart';
import 'package:noteapp/src/widgets/button.dart';

class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  bool annual = true;
  bool monthly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 238, 226, 1),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        'Notely Premium',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          color: const Color.fromRGBO(64, 59, 54, 1),
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/close.png'))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('assets/sub.png'),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      'Start Using Notely \nwith Premium Benefits',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: const Color.fromRGBO(64, 59, 54, 1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: EachRow(
                      text: 'Save unlimited notes to a single project',
                    ),
                  ),
                  const Center(
                    child: EachRow(
                      text: 'Create unlimited projects and teams',
                    ),
                  ),
                  const Center(
                    child: EachRow(
                      text: 'Daily backups to keep your data safe',
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            monthly = false;
                            annual = true;
                          });
                        },
                        child: EachSub(
                          amount: '79.99',
                          duration: 'per year',
                          period: 'Annual',
                          selected: annual,
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            monthly = true;
                            annual = false;
                          });
                        },
                        child: EachSub(
                          amount: '7.99',
                          duration: 'per month',
                          period: 'Monthly',
                          selected: monthly,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            ),
            AppButton(
              text: 'SUBSCRIBE',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RecentNotes();
                }));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Restore Purchase',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color.fromRGBO(217, 97, 76, 1),
                  )),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class EachRow extends StatelessWidget {
  final String text;
  const EachRow({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30),
      width: MediaQuery.of(context).size.width,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/check.png'),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: GoogleFonts.nunito(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: const Color.fromRGBO(90, 82, 102, 1),
            ),
          ),
        ],
      ),
    );
  }
}

class EachSub extends StatelessWidget {
  final bool selected;
  final String period, duration, amount;
  const EachSub(
      {Key? key,
      required this.selected,
      required this.period,
      required this.duration,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        height: 147,
        width: 147,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? const Color.fromRGBO(244, 127, 107, 1)
                  : Colors.white,
              width: 5,
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              period,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: const Color.fromRGBO(90, 82, 102, 1),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              '\$$amount',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w900,
                fontSize: 28,
                color: const Color.fromRGBO(90, 82, 102, 1),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              duration,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w800,
                fontSize: 14,
                color: const Color.fromRGBO(90, 82, 102, 1),
              ),
            ),
          ],
        ));
  }
}
