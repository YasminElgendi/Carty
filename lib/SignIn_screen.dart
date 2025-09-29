import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.signIn)
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
                Text(
                     AppLocalizations.of(context)!.welcomeBack,
                    style: const TextStyle(
                      fontFamily: "Suwannaphum",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 114, 93, 149),
                    ),
                  ),
            
                Text(
                    AppLocalizations.of(context)!.signInToCarty,
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
                          return AppLocalizations.of(context)!.emailEmptyError;
                        }
                        // Check if contains @
                        if (!value.contains("@")) {
                          return AppLocalizations.of(context)!.emailAtError;
                        }
                        // Check if contains dot
                        if (!value.contains(".")) {
                          return AppLocalizations.of(context)!.emailDotError;
                        }
                        // Check if starts/ends properly
                        if (value.startsWith("@") || value.endsWith("@")) {
                          return AppLocalizations.of(context)!.emailStartEndError;
                        }
                        if (value.startsWith(".") || value.endsWith(".")) {
                          return AppLocalizations.of(context)!.emailStartEndError;
                        }
                        return null;
                    },
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.emailLabel),
                  ),
          
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if(value!.length < 6)
                      {
                        return AppLocalizations.of(context)!.passwordError;
                      }
                      return null;
                    },
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.passwordLabel,
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
                          title: Text(AppLocalizations.of(context)!.welcomeDialogTitle),
                          content: Text(AppLocalizations.of(context)!.welcomeDialogContent),
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
                              
                              child: Text(AppLocalizations.of(context)!.close),
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
                    child: Text(
                      AppLocalizations.of(context)!.signIn,
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
