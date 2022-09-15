import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final bool obscure;
  const AppTextField({Key? key, required this.obscure}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 253, 250, 1),
        border: Border.all(
          color: const Color.fromRGBO(242, 229, 213, 1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: TextFormField(
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: const Color.fromRGBO(89, 85, 80, 1),
          ),
          obscureText: obscure,
          obscuringCharacter: '#',
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
          ),
        ),
      ),
    );
  }
}
