import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  void login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/register'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        if (kDebugMode) {
          print(data);
        }
        if (kDebugMode) {
          print('account created successfully');
        }
      } else {
        if (kDebugMode) {
          print('failed');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Sign Up Api')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                // keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: const InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  login(emailcontroller.text.toString(),
                      passwordcontroller.text.toString());
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text('Sign Up'),
                  ),
                ),
              )
            ],
          ), 
        ));
  }
}
