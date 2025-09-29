import 'package:flutter/material.dart';
import 'package:flutter_application_1/Welcome_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carty App',
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Suwannaphum",
        useMaterial3: false,
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: const WelcomeScreen(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 143, 118, 183),
            onPressed: () {
              Locale newLocale =
                  _locale.languageCode == 'en'
                      ? const Locale('ar')
                      : const Locale('en');
              setLocale(newLocale);
            },
            child: const Icon(Icons.language, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

