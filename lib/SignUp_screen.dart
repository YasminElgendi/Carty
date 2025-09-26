import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool hiddenPassword = true;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up")
      ),

      body: 
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
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
                const SizedBox(height: 20,),
                const Text(
                    "Create an Account",
                    style: TextStyle(
                      fontFamily: "Suwannaphum",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 114, 93, 149),
                    ),
                  ),
            
                const Text(
                    "Join Carty today!",
                    style: TextStyle(
                      fontFamily: "Suwannaphum",
                      fontSize: 20,
                      color:  Color.fromARGB(255, 143, 118, 183),
                    ),
                  ),
            
                const SizedBox(height: 10,),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "Full Name"),
                    controller: _nameController,
                    validator: (value) {
                    //null in case valid, string in case false
                    if (value == null || value.isEmpty) {
                      return "Please enter your name";
                    }
                    if (value[0] != value[0].toUpperCase()) {
                      return "First letter must be uppercase";
                    }
                    return null;
                    },
                    
                  ),
          
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                    //null in case valid, string in case false
                      if(value!.isEmpty || !value.contains("@"))
                      {
                        return "Email is not valid";
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if(value != _passwordController.text)
                      {
                        return "Password should match";
                      }
                      return null;
                    },
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      suffixIcon: IconButton(
                        onPressed: togglePassword,
                        icon: Icon(hiddenPassword? Icons.visibility : Icons.visibility_off)
                      )
                    ),
                  ),
                ),
            
                const SizedBox(height: 10),
            
                ElevatedButton(
                    onPressed: () {
                      if(_formKey.currentState!.validate())
                      {
                        showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text("Welcome onboard!"),
                          content: Text("Account Created Successfully."),
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
                      "Create Account",
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
