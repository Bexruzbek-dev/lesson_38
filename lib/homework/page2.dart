import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  String name = "";
  String email = "";
  String password = "";
  String passwordConfirm = "";

  void register() {
    if (formKey.currentState!.validate()) {
      // ma'lumotlarni saqlaymiz va ro'yxatdan o'tkazamiz
      formKey.currentState!.save();

      Map<String, dynamic> user = {
        "name": name,
        "email": email,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };

      Navigator.of(context).pop(user);
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos ism kiriting";
    } else if (value.length < 4) {
      return "Iltimos uzunroq ism kiriting";
    }

    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos elektron pochta kiriting";
    } else if (!value.contains("@") ||
        !value.substring(value.indexOf("@")).contains(".")) {
      return "To'g'ri elektron pochta kiriting";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parol kiriting";
    } else if (value.length < 8) {
      return "Iltimos eng kamida 8ta element kiriting";
    }

    return null;
  }

  String? validatePasswordConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return "Iltimos parolni tasdiqlang";
    } else if (value != passwordController.text) {
      return "Parollar mos kelmadi";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 30,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.symmetric(),
                  child: Text(
                    "Create your account for your schedule",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Ism",
                      labelText: "Ism",
                      prefixIcon: Icon(
                        Icons.person,
                      )),
                  validator: validateName,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      name = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Elektron pochta",
                    labelText: "Elektron pochta",
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: validateEmail,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      email = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Parol",
                    labelText: "Parol",
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: Icon(CupertinoIcons.eye_slash),
                  ),
                  validator: validatePassword,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      password = newValue;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Parol tasdiqlang",
                    labelText: "Parol tasdiqlang",
                    prefixIcon: Icon(Icons.key),
                    suffixIcon: Icon(CupertinoIcons.eye_slash),
                  ),
                  validator: validatePasswordConfirm,
                  onSaved: (newValue) {
                    if (newValue != null && newValue.isNotEmpty) {
                      passwordConfirm = newValue;
                    }
                  },
                  onFieldSubmitted: (value) {
                    register();
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "You have an account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Sign in here",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 90),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    child: const Text("Continue"),
                  ),
                ),
                Gap(10),
                const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "By Continuing you can log in",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Terms of Use & Privacy Policy",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
