// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Carty App';

  @override
  String get welcome => 'Welcome to Carty';

  @override
  String get shoppingBuddy => 'Your Everyday Shopping Buddy';

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get allProducts => 'All Products';

  @override
  String get ourProducts => 'Our Products';

  @override
  String get hotOffers => 'Hot Offers';

  @override
  String addedToCart(Object product) {
    return '$product added to your cart';
  }

  @override
  String removedFromCart(Object product) {
    return '$product removed from your cart';
  }

  @override
  String get signIn => 'Sign In';

  @override
  String get welcomeBack => 'Welcome Back!';

  @override
  String get signInToCarty => 'Sign In to Carty';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get emailEmptyError => 'Email can\'t be empty';

  @override
  String get emailAtError => 'Email should contain @';

  @override
  String get emailDotError => 'Email should contain a domain (e.g. .com)';

  @override
  String get emailStartEndError => 'Email can\'t start or end with @ or .';

  @override
  String get passwordError => 'Password should at least contain 6 characters';

  @override
  String get welcomeDialogTitle => 'Welcome Back!';

  @override
  String get welcomeDialogContent => 'Account sign-in successfully.';

  @override
  String get close => 'Close';

  @override
  String get signUp => 'Sign Up';

  @override
  String get createAccount => 'Create an Account';

  @override
  String get joinCarty => 'Join Carty today!';

  @override
  String get fullName => 'Full Name';

  @override
  String get nameEmptyError => 'Please enter your name';

  @override
  String get nameCapitalError => 'First letter must be uppercase';

  @override
  String get emailInvalidError => 'Email is not valid';

  @override
  String get confirmPasswordLabel => 'Confirm Password';

  @override
  String get passwordMatchError => 'Passwords should match';

  @override
  String get welcomeOnboard => 'Welcome onboard!';

  @override
  String get accountCreated => 'Account Created Successfully.';

  @override
  String get createAccountButton => 'Create Account';
}
