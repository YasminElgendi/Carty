import 'package:flutter/material.dart';
import 'package:flutter_application_1/Signin_screen.dart';
import 'package:flutter_application_1/Signup_screen.dart';
import 'package:flutter_application_1/l10n/app_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.appTitle ,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 143, 118, 183),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Welcome text
          Text(
            AppLocalizations.of(context)!.welcome ,
            style: TextStyle(
              fontFamily: "Suwannaphum",
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Color.fromARGB(255, 114, 93, 149),
            ),
          ),
          Text(
            AppLocalizations.of(context)!.shoppingBuddy,
            style: TextStyle(
              fontFamily: "Suwannaphum",
              fontSize: 20,
              color: Color.fromARGB(255, 143, 118, 183),
            ),
          ),
          const SizedBox(height: 40),

          // Row of images with animation
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AnimatedImage(
                image: Image.asset(
                  "assets/images/centella.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 20),
              _AnimatedImage(
                image: Image.network(
                  "https://sourcebeauty.com/cdn/shop/files/Centella-Skin-Light-Cleansing-Oil-200Ml-source-beauty-egypt_b962823f-091b-487f-94ed-7c07049a0ae9_1000x.png?v=1755009450",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Row of Animated Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AnimatedButton(
                label: AppLocalizations.of(context)!.signUp,
                backgroundColor: const Color.fromARGB(255, 143, 118, 183),
                onPressed: () {
                  Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SignupScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  );
                },
              ),

              const SizedBox(width: 20),

              _AnimatedButton(
                label: AppLocalizations.of(context)!.signIn,
                backgroundColor: const Color.fromARGB(255, 144, 142, 142),
                onPressed: () {
                  Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 600),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        SigninScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// Reusable animated image widget
class _AnimatedImage extends StatefulWidget {
  final Image image;

  const _AnimatedImage({super.key, required this.image});

  @override
  State<_AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<_AnimatedImage> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: _isPressed
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: widget.image,
          ),
        ),
      ),
    );
  }
}

/// Reusable animated button widget
class _AnimatedButton extends StatefulWidget {
  final String label;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const _AnimatedButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  State<_AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<_AnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onPressed();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: widget.backgroundColor,
            boxShadow: _isPressed
                ? [
                    const BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ]
                : [],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: "Suwannaphum",
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
