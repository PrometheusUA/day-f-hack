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
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup',
      routes: {
        '/signup': (context) => const SignUpPage(),
        '/signin': (context) => const SignInPage(),
        '/signintwo': (context) => const SignUpPageTwo(),
        '/home': (context) => const HomePage()
      },
      theme: ThemeData(),
    ),
  );
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
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    double width = MediaQuery.of(context).size.width;
    return KeyboardVisibilityBuilder(builder: (context1, visible) {
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
              Spacer(flex: 1),
              Column(
                children: [
                  //#region Logo
                  Container(
                    alignment: Alignment.topCenter,
                    width: width * 0.4,
                    child: SvgPicture.asset('assets/image/logo.svg'),
                  ),
                  //#endregion
                  //#region Sign in
                  Visibility(
                    visible: height > 350,
                    child: Container(
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
                  ) //#endregion
                ],
              ),
              Spacer(flex: 2),
              Container(
                alignment: Alignment.center,
                width: width * 0.86,
                child: Column(
                  children: [
                    //#region Email
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
                    //#endregion
                    //#region Password
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
                    //#endregion
                    //#region Confirm password
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
                    //#endregion
                    //#region Register
                    Container(
                      width: width * 0.86,
                      height: 48.37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.37),
                        color: const Color.fromRGBO(48, 35, 174, 1),
                      ),
                      margin: const EdgeInsets.only(top: 9),
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Navigator.pushNamed(context, '/signintwo'),
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
                    //#endregion
                  ],
                ),
              ),
              Spacer(flex: 1),
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
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                //#region Logo
                AnimatedContainer(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: height * (visible ? 0.1 : 0.2)),
                  duration: const Duration(milliseconds: 150),
                  width: width * 0.4,
                  child: SvgPicture.asset('assets/image/logo.svg'),
                ),
                //#endregion
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
                  margin: EdgeInsets.only(top: height * (visible ? 0.23 : 0.3)),
                  width: width * 0.86,
                  child: Column(
                    children: [
                      //#region Email
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
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.45)),
                            contentPadding:
                                const EdgeInsets.only(left: 14.5, bottom: 9),
                          ),
                        ),
                      ),
                      //#endregion
                      //#region Password
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
                                color:
                                    const Color.fromRGBO(255, 255, 255, 0.45)),
                            contentPadding:
                                const EdgeInsets.only(left: 14.5, bottom: 9),
                          ),
                        ),
                      ),
                      //#endregion
                      //#region Sign in
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
                              style:
                                  GoogleFonts.montserrat(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                      //#endregion
                    ],
                  ),
                ),
                //#region Back
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 36, left: width * 0.07),
                  child: GestureDetector(
                    onTap: () => {Navigator.pop(context)},
                    child: Text(
                      'Back',
                      style: GoogleFonts.montserrat(
                          color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
                //#endregion
              ],
            ),
          ),
        ),
      );
    });
  }
}

class SignUpPageTwo extends StatefulWidget {
  const SignUpPageTwo({Key? key}) : super(key: key);

  @override
  _SignInTwoPageState createState() => _SignInTwoPageState();
}

class _SignInTwoPageState extends State<SignUpPageTwo> {
  String type = 'Student';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    double width = MediaQuery.of(context).size.width;
    return KeyboardVisibilityBuilder(builder: (context1, visible) {
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
              const Spacer(
                flex: 1,
              ),
              Column(
                children: [
                  //#region Logo
                  Container(
                    alignment: Alignment.topCenter,
                    width: width * 0.4,
                    child: SvgPicture.asset('assets/image/logo.svg'),
                  ),
                  //#endregion
                  Visibility(
                    visible: height > 350,
                    child: Container(
                      margin: const EdgeInsets.only(top: 23),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Text(
                          'The best solutions from the best team',
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.86,
                child: Column(
                  children: [
                    //#region Job
                    Container(
                      height: 37,
                      width: width * 0.86,
                      padding: const EdgeInsets.only(left: 14.33),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.09),
                          borderRadius: BorderRadius.circular(5.37)),
                      child: IgnorePointer(
                        ignoring: true,
                        child: DropdownButton<String>(
                          dropdownColor: Colors.black,
                          value: type,
                          underline: Container(),
                          icon: Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(right: 6),
                              child: const Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.arrow_drop_down)),
                            ),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(255, 255, 255, 0.45),
                            fontSize: 16,
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              type = newValue!;
                            });
                          },
                          items: <String>['Student', 'Teacher', 'Other']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    //#endregion
                    //#region First Name
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
                          hintText: 'First Name',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.45)),
                          contentPadding:
                              const EdgeInsets.only(left: 14.5, bottom: 9),
                        ),
                      ),
                    ),
                    //#endregion
                    //#region Last Name
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
                          hintText: 'Last Name',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.45)),
                          contentPadding:
                              const EdgeInsets.only(left: 14.5, bottom: 9),
                        ),
                      ),
                    ),
                    //#endregion
                    //#region Username
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
                          hintText: 'Create username',
                          hintStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(255, 255, 255, 0.45)),
                          contentPadding:
                              const EdgeInsets.only(left: 14.5, bottom: 9),
                        ),
                      ),
                    ),
                    //#endregion
                    //#region Start
                    Container(
                      width: width * 0.86,
                      height: 48.37,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.37),
                        color: const Color.fromRGBO(48, 35, 174, 1),
                      ),
                      margin: const EdgeInsets.only(top: 9),
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed("/home"),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Start using FASA",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                    //#endregion
                  ],
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      );
    });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
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
      child: Scaffold(
        //#region Appbar
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 6, left: 10),
            child: Text(
              "Hi Egor!",
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          toolbarHeight: 100,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(
                Icons.notifications_outlined,
                size: 25,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(top: 31, right: 22),
              width: 38,
              height: 38,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(19)),
              child: Image.asset("assets/image/acc.png"),
            )
          ],
        ),
        //#endregion
        backgroundColor: Colors.transparent,
        //#region BottomBar
        bottomNavigationBar: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13), color: Colors.white),
          margin: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 11, bottom: 11),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: index == 0
                          ? const Color.fromRGBO(61, 68, 231, 1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.home_rounded,
                    color: index == 0
                        ? Colors.white
                        : const Color.fromRGBO(209, 209, 209, 1),
                  ),
                ),
                onTap: () => setState(() => index = 0),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 11, bottom: 11),
                  height: 45,
                  width: 45,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: index == 1
                          ? const Color.fromRGBO(61, 68, 231, 1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12)),
                  child: SvgPicture.asset(
                    "assets/image/menu.svg",
                    color: index == 1
                        ? Colors.white
                        : const Color.fromRGBO(209, 209, 209, 1),
                  ),
                ),
                onTap: () => setState(() => index = 1),
              ),
              GestureDetector(
                child: Container(
                  margin: const EdgeInsets.only(top: 11, bottom: 11),
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: index == 2
                          ? const Color.fromRGBO(61, 68, 231, 1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12)),
                  child: Icon(
                    Icons.person_rounded,
                    color: index == 2
                        ? Colors.white
                        : const Color.fromRGBO(209, 209, 209, 1),
                  ),
                ),
                onTap: () => setState(() => index = 2),
              ),
            ],
          ),
        ),
        //#endregion
        body: Column(
          children: [
            SizedBox(
              height: 146,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      margin: const EdgeInsets.only(left: 22),
                      height: 146,
                      width: 71,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 23),
                            alignment: Alignment.center,
                            height: 93,
                            width: 67,
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.24),
                                borderRadius: BorderRadius.circular(13)),
                            child: const Icon(
                              Icons.add,
                              size: 24,
                              color: Color.fromRGBO(61, 68, 231, 1),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 9),
                            child: Text(
                              "Add event",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (index != 10) {
                    return Container(
                      height: 146,
                      width: 71,
                      color: Colors.transparent,
                      child: Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 23),
                            alignment: Alignment.center,
                            height: 93,
                            width: 67,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage("assets/image/Background.png"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(13)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            height: 93,
                            width: 67,
                            child: Stack(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 22),
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: [
                                      Text(
                                        "17:00",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "18/12/2021",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 62),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.schedule_rounded,
                                          color: Colors.white, size: 10),
                                      const SizedBox(width: 3),
                                      Text("7d:8Hr",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 14,
                                              color: Colors.white))
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 8.5,
                                  height: 8.5,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(69, 239, 54, 1),
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.5)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                    left: 13,
                                  ),
                                  width: 8.5,
                                  height: 8.5,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(255, 33, 219, 1),
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(5.5)),
                                  child: const Icon(Icons.priority_high_rounded,
                                      size: 6, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(top: 127),
                            child: Text(
                              "Add event",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Container(width: 0);
                  }
                },
                separatorBuilder: (context, index) => Container(width: 30),
                itemCount: 11,
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Flexible(
              child: Container(
                width: width * 0.875,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 13, left: 15),
                      child: Image.asset(
                        "assets/image/weather.png",
                        height: 47 + height * 0.01,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20, left: 85),
                      child: Text(
                        "Weather 06.12.2021\n+21°, Windy",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      margin: const EdgeInsets.only(top: 13, right: 18),
                      child: Text(
                        "21:37",
                        style: GoogleFonts.montserrat(
                            fontSize: 40, fontWeight: FontWeight.w300),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(bottom: 21, left: 21),
                      child: Text(
                        "Phrase of the day:\nЕврей не делает репосты потому что у него нет кнопки поделиться.",
                        style: GoogleFonts.montserrat(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Flexible(
              child: Container(
                width: width * 0.875,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 58,
                        height: 58,
                        margin: const EdgeInsets.only(top: 19, right: 21),
                        child: Image.asset("assets/image/image1.png"),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 21, left: 19),
                      child: Text(
                        "Weekly statistics:",
                        style: GoogleFonts.montserrat(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 55, left: 21),
                      child: Text(
                        "Tasks done 23",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 75, left: 21),
                      child: Text(
                        "Tasks left 7",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: const EdgeInsets.only(bottom: 20, left: 21),
                      child: Text(
                        "Your productivity is higher than N% of users.",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
