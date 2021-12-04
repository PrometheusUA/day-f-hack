import 'dart:convert';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/signup',
    routes: {
      '/signup': (context) => const SignUpPage(),
      '/signin': (context) => const SignInPage(),
    },
  ));
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return KeyboardVisibilityBuilder(builder: (context, visible) {
      return Scaffold(
        body: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(3, 64, 156, 1),
                Color.fromRGBO(1, 0, 54, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(top: height * 0.2),
                width: width * 0.4,
                child: SvgPicture.asset('/image/logo.svg'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 23),
                child: GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/signin')},
                  child: RichText(
                    textDirection: TextDirection.ltr,
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.6),
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign in",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.23),
                width: width * 0.86,
                child: Column(
                  children: [
                    Container(
                      height: 37,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.09),
                          borderRadius: BorderRadius.circular(5.37)),
                      child: TextFormField(
                        initialValue: '',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.5)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.45)),
                          contentPadding:
                              const EdgeInsets.only(left: 14.5, bottom: 9),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4.3),
                      height: 37,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.09),
                          borderRadius: BorderRadius.circular(5.37)),
                      child: TextFormField(
                        initialValue: '',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.5)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Create password',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.45)),
                          contentPadding:
                              const EdgeInsets.only(left: 14.5, bottom: 9),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 4.3),
                      height: 37,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.09),
                          borderRadius: BorderRadius.circular(5.37)),
                      child: TextFormField(
                        initialValue: '',
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.5)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Repeat password',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.45)),
                          contentPadding:
                              const EdgeInsets.only(left: 14.5, bottom: 9),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.86,
                      height: 48.37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.37),
                        color: const Color.fromRGBO(48, 35, 174, 1),
                      ),
                      margin: const EdgeInsets.only(top: 9),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Register",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(3, 64, 156, 1),
              Color.fromRGBO(1, 0, 54, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: height * 0.2),
              width: width * 0.4,
              child: SvgPicture.asset('/image/logo.svg'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 23),
              child: GestureDetector(
                onTap: () => {},
                child: Text(
                  'It`s good to see you again!',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.3),
              width: width * 0.86,
              child: Column(
                children: [
                  Container(
                    height: 37,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.09),
                        borderRadius: BorderRadius.circular(5.37)),
                    child: TextFormField(
                      initialValue: '',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 0.5)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.45)),
                        contentPadding:
                            const EdgeInsets.only(left: 14.5, bottom: 9),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4.3),
                    height: 37,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.09),
                        borderRadius: BorderRadius.circular(5.37)),
                    child: TextFormField(
                      initialValue: '',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(255, 255, 255, 0.5)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Create password',
                        hintStyle: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.45)),
                        contentPadding:
                            const EdgeInsets.only(left: 14.5, bottom: 9),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.86,
                    height: 48.37,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.37),
                      color: const Color.fromRGBO(48, 35, 174, 1),
                    ),
                    margin: const EdgeInsets.only(top: 9),
                    child: GestureDetector(
                      onTap: () => {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Sign In",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 36, left: width * 0.07),
              child: GestureDetector(
                onTap: () => {Navigator.pop(context)},
                child: Text(
                  'Back',
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
