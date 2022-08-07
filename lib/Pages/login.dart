import 'package:flutter/material.dart';
import 'package:learningapp/Utilities/routes.dart';

// ignore: use_key_in_widget_constructors
class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String name = "";
  bool changeButton = false;
  final _formkKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.pushNamed(context, MyRoutes.HomeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formkKey,
          child: Column(
            children: [
              Image.asset(
                "assets/images/loginimage.png",
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: ((value) {
                          name = value;
                          setState(() {});
                        })),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                      minLines: 6,
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Material(
                      color: Colors.deepPurple,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 8),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          width: changeButton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,

                          // decoration: BoxDecoration(
                          //     //shape:
                          //     //changeButton ? BoxShape.circle : BoxShape.rectangle,
                          //     ),

                          child: changeButton
                              ? const Icon(Icons.done)
                              : const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 18),
                                ),
                        ),
                      ),
                    )
                    // ElevatedButton(
                    //     style: TextButton.styleFrom(),
                    //     onPressed: () =>
                    //         {Navigator.pushNamed(context, MyRoutes.HomeRoute)},
                    //     child: const Text("login")),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
