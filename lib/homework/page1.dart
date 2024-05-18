import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_39/homework/page2.dart';
import 'package:lesson_39/homework/page3.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Map<String, dynamic>? user;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? emailError;
  String? passwordError;
  String userError = "";

  void login() {
    // ma'lumotlarni olamiz va tekshiramiz
    validateEmail();
    validatePassword();

    if (emailError == null && passwordError == null) {
      if (user == null) {
        userError = "Foydalanuvchi topilmadi, iltimos ro'yxatdan o'ting";
        setState(() {});
      } else {
        if (user!['email'] == emailController.text &&
            user!['password'] == passwordController.text) {

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) {
                return const Page3();
              },
            ),
          );
        } else {
          userError = "Email yoki parol xato";
          setState(() {});
        }
      }
    }
  }

  void validateEmail() {
    String email = emailController.text;

    setState(() {
      if (email.isEmpty) {
        emailError = "Iltimos elektron pochta kiriting";
      } else if (!email.contains("@") ||
          !email.substring(email.indexOf("@")).contains(".")) {
        emailError = "To'g'ri elektron pochta kiriting";
      } else {
        emailError = null;
      }
    });
  }

  void validatePassword() {
    String password = passwordController.text;

    setState(() {
      if (password.isEmpty) {
        passwordError = "Iltimos parol kiriting";
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 28,
              ),
              child: Text(
                "Welcome Back",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Text(
                "Let's Login to Connect your email",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ),
            Gap(40),
            if (userError.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    userError,
                    style: const TextStyle(color: Colors.red),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
                  hintText: "Elektron pochta",
                  labelText: "Elektron pochta",
                  errorText: emailError,
                ),
                onChanged: (value) {
                  validateEmail();
                },
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.eye_slash),
                  ),
                  hintText: "Parol",
                  labelText: "Parol",
                  errorText: passwordError,
                ),
                onChanged: (value) {
                  validatePassword();
                },
                onSubmitted: (value) {
                  login();
                },
              ),
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have an account ?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return Page2();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Sign up here",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue.shade800,
                    ),
                  ),
                )
              ],
            ),
            Gap(200),
            Center(
              child: Container(
                width: 380,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ElevatedButton(
                  child: Text("LOGIN"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  onPressed: login,
                ),
              ),
            ),
            Gap(15),
            const Image(
              image: AssetImage("assets/apple.png"),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Teerms of Use ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "By Continuing you can log in",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
