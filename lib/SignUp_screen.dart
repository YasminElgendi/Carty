import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_screen.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

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
        title: Text(AppLocalizations.of(context)!.signUp)
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
                Text(
                    AppLocalizations.of(context)!.createAccount,
                    style: TextStyle(
                      fontFamily: "Suwannaphum",
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Color.fromARGB(255, 114, 93, 149),
                    ),
                  ),
            
                Text(
                    AppLocalizations.of(context)!.joinCarty,
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
                    decoration: InputDecoration(labelText: AppLocalizations.of(context)!.fullName),
                    controller: _nameController,
                    validator: (value) {
                    //null in case valid, string in case false
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.nameEmptyError;
                    }
                    if (value[0] != value[0].toUpperCase()) {
                      return AppLocalizations.of(context)!.nameCapitalError;
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
                      if(value!.isEmpty || !value.contains("@") ||
                       !value.contains(".") ||
                        value.startsWith("@") || value.endsWith("@") || 
                        value.startsWith(".") || value.endsWith(".")
                        )
                      {
                        return AppLocalizations.of(context)!.emailInvalidError;
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if(value != _passwordController.text)
                      {
                        return AppLocalizations.of(context)!.passwordMatchError;
                      }
                      return null;
                    },
                    obscureText: hiddenPassword,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.confirmPasswordLabel,
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
                          title: Text( AppLocalizations.of(context)!.welcomeOnboard),
                          content: Text(AppLocalizations.of(context)!.accountCreated ),
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
                              child: Text( AppLocalizations.of(context)!.close),
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
                      AppLocalizations.of(context)!.createAccountButton,
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
