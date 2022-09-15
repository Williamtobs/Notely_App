import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/src/screens/subscription/subscription.dart';
import 'package:noteapp/src/widgets/app_textfield.dart';

import '../widgets/button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text(
                        'Create a free account',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                          color: const Color.fromRGBO(64, 59, 54, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        'Join Notely for free. Create and share \n'
                        'unlimited notes with your friends.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: const Color.fromRGBO(89, 85, 80, 1),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Text('Full Name',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: const Color.fromRGBO(64, 59, 54, 1),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const AppTextField(
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Email Address',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: const Color.fromRGBO(64, 59, 54, 1),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const AppTextField(
                      obscure: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Password',
                        style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: const Color.fromRGBO(64, 59, 54, 1),
                        )),
                    const SizedBox(
                      height: 5,
                    ),
                    const AppTextField(
                      obscure: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
            AppButton(
              text: 'Create Account',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Subscription();
                }));
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text('Already have an account?',
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
