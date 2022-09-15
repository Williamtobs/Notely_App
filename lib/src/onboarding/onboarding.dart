import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/src/auth/signup.dart';
import 'package:noteapp/src/widgets/button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);

  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(248, 238, 226, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                'NOTELY',
                style: GoogleFonts.titanOne(
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                  color: const Color.fromRGBO(64, 59, 54, 1),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: PageView(
                  controller: controller,
                  children: const [
                    EachSlides(
                        title: "World’s Safest And Largest Digital Notebook",
                        description:
                            "Notely is the world’s safest, largest and intelligent "
                            "digital notebook. Join over 10M+ users already using Notely.",
                        image: 'assets/onboard.png'),
                    EachSlides(
                        title: "World’s Safest And Largest Digital Notebook",
                        description:
                            "Notely is the world’s safest, largest and intelligent "
                            "digital notebook. Join over 10M+ users already using Notely.",
                        image: 'assets/onboard.png'),
                    EachSlides(
                        title: "World’s Safest And Largest Digital Notebook",
                        description:
                            "Notely is the world’s safest, largest and intelligent "
                            "digital notebook. Join over 10M+ users already using Notely.",
                        image: 'assets/onboard.png'),
                  ],
                ),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ScrollingDotsEffect(
                  spacing: 4,
                  radius: 4,
                  dotColor: Color.fromRGBO(217, 97, 76, 0.5),
                  activeDotColor: Color.fromRGBO(217, 97, 76, 1),
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              AppButton(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignupScreen();
                  }));
                },
                text: 'Get Started',
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Already have an account?',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: const Color.fromRGBO(217, 97, 76, 1),
                  )),
              const SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}

class EachSlides extends StatelessWidget {
  final String title, description, image;
  const EachSlides(
      {Key? key,
      required this.title,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 194,
          width: MediaQuery.of(context).size.width * 0.7,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w900,
            fontSize: 24,
            color: const Color.fromRGBO(64, 59, 54, 1),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: const Color.fromRGBO(89, 85, 80, 1),
          ),
        ),
      ],
    );
  }
}
