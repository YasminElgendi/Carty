import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool hiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In")
      ),

      body: 
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 120),
            decoration: BoxDecoration(
              color: Colors.white, // rectangle background
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),

          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontFamily: "Suwannaphum",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 114, 93, 149),
                    ),
                  ),
            
                const Text(
                    "Sign In to Carty",
                    style: TextStyle(
                      fontFamily: "Suwannaphum",
                      fontSize: 20,
                      color:  Color.fromARGB(255, 143, 118, 183),
                    ),
                  ),
            
                const SizedBox(height: 40,),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) { //null in case valid, string in case false
                       //Check if it field is empty
                       if (value == null || value.isEmpty) {
                          return "Email can't be empty";
                        }
                        // Check if contains @
                        if (!value.contains("@")) {
                          return "Email should contain @";
                        }
                        // Check if contains dot
                        if (!value.contains(".")) {
                          return "Email should contain a domain (e.g. .com)";
                        }
                        // Check if starts/ends properly
                        if (value.startsWith("@") || value.endsWith("@")) {
                          return "Email can't start or end with @";
                        }
                        if (value.startsWith(".") || value.endsWith(".")) {
                          return "Email can't start or end with .";
                        }
                        return null;
                    },
                    decoration: InputDecoration(labelText: "Email"),
                  ),
          
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if(value!.length < 6)
                      {
                        return "Password should at least contain 6 characters";
                      }
                      return null;
                    },
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                      labelText: "Password",
                      suffixIcon: IconButton(
                        onPressed: togglePassword,
                        icon: Icon(hiddenPassword? Icons.visibility : Icons.visibility_off)
                      )
                    ),
                  ),
                ),
            
                const SizedBox(height: 40),
            
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate())
                      {
                        showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Welcome Back!"),
                          content: Text("Account sign-in successfully."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // close dialog
                                Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  transitionDuration: const Duration(milliseconds: 600),
                                  pageBuilder: (context, animation, secondaryAnimation) =>
                                      ShoppingHomeScreen(),
                                  transitionsBuilder:
                                      (context, animation, secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                              },
                              
                              child: Text("Close"),
                            ),
                          ],
                        ),
                        );
                      }
                    },
                 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 143, 118, 183),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      ),
                      
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        fontFamily: "Suwannaphum",
                        fontSize: 20,
                      ),
                    ),
                  ),
            
            ],),
          ),
        ),
      ),
    );
  }

  togglePassword(){
    hiddenPassword = !hiddenPassword;
    setState(() {});
  }
}
