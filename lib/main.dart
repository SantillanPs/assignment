import 'package:flutter/material.dart';
import 'profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
              height: 1000,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: SignInForm()),
              )),
        ),
      ),
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => SignInFormState();
}

class LoadingButton extends StatefulWidget {
  const LoadingButton({super.key});

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  bool isLoading = false;

  void handleClick() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Profile()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: GestureDetector(
        onTap: isLoading ? null : handleClick,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 130, 83, 241),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: isLoading
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    )
                  : Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
        ),
      ),
    );
  }
}

class SignInFormState extends State<SignInForm> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Text(
            "Create an account",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: RichText(
                text: TextSpan(style: TextStyle(), children: [
              TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 130, 83, 241),
                      fontWeight: FontWeight.bold))
            ]))),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: TextField(
            decoration: InputDecoration(
                labelText: "Email address",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextField(
            obscureText: _isObscured,
            decoration: InputDecoration(
                labelText: "Password",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: SizedBox(
            width: 300,
            height: 30,
            child: Text(
              "Recovery Password",
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
          ),
        ),
        LoadingButton(),
        Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Row(
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "or sign up with",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Expanded(
                    child: Divider(
                  color: Colors.grey,
                  thickness: 1,
                ))
              ],
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 221, 221, 221),
                        width: 1)),
                child: Icon(Icons.person),
              ),
              Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 221, 221, 221),
                        width: 1)),
                child: Icon(Icons.apple),
              ),
              Container(
                height: 50,
                width: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 221, 221, 221),
                        width: 1)),
                child: Icon(Icons.facebook),
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.all(0),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "By clicking Create account you agree to Recognize",
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                      text: "Terms of use",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 130, 83, 241),
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: " and ", style: TextStyle(color: Colors.black)),
                  TextSpan(
                      text: "Privacy policy",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 130, 83, 241),
                          fontWeight: FontWeight.bold))
                ])))
      ],
    );
  }
}
