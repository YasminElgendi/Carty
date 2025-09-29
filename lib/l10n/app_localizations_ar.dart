// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تطبيق كارتي';

  @override
  String get welcome => 'مرحباً بك في كارتي';

  @override
  String get shoppingBuddy => 'رفيقك للتسوق اليومي';

  @override
  String get featuredProducts => 'منتجات مميزة';

  @override
  String get allProducts => 'كل المنتجات';

  @override
  String get ourProducts => 'منتجاتنا';

  @override
  String get hotOffers => 'العروض الساخنة';

  @override
  String addedToCart(Object product) {
    return 'تمت إضافة $product إلى عربة التسوق';
  }

  @override
  String removedFromCart(Object product) {
    return 'تمت إزالة $product من سلة التسوق';
  }

  @override
  String get signIn => 'تسجيل الدخول';

  @override
  String get welcomeBack => 'مرحبًا بعودتك!';

  @override
  String get signInToCarty => 'سجّل الدخول إلى كارتي';

  @override
  String get emailLabel => 'البريد الإلكتروني';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get emailEmptyError => 'لا يمكن أن يكون البريد الإلكتروني فارغًا';

  @override
  String get emailAtError => 'يجب أن يحتوي البريد الإلكتروني على @';

  @override
  String get emailDotError => 'يجب أن يحتوي البريد الإلكتروني على نطاق (مثل .com)';

  @override
  String get emailStartEndError => 'لا يمكن أن يبدأ أو ينتهي البريد الإلكتروني بـ @ أو .';

  @override
  String get passwordError => 'يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل';

  @override
  String get welcomeDialogTitle => 'مرحبًا بعودتك!';

  @override
  String get welcomeDialogContent => 'تم تسجيل الدخول بنجاح.';

  @override
  String get close => 'إغلاق';

  @override
  String get signUp => 'إنشاء حساب';

  @override
  String get createAccount => 'أنشئ حسابًا جديدًا';

  @override
  String get joinCarty => 'انضم إلى كارتي اليوم!';

  @override
  String get fullName => 'الاسم الكامل';

  @override
  String get nameEmptyError => 'من فضلك أدخل اسمك';

  @override
  String get nameCapitalError => 'يجب أن يبدأ الاسم بحرف كبير';

  @override
  String get emailInvalidError => 'البريد الإلكتروني غير صالح';

  @override
  String get confirmPasswordLabel => 'تأكيد كلمة المرور';

  @override
  String get passwordMatchError => 'يجب أن تتطابق كلمتا المرور';

  @override
  String get welcomeOnboard => 'مرحبًا بك!';

  @override
  String get accountCreated => 'تم إنشاء الحساب بنجاح.';

  @override
  String get createAccountButton => 'إنشاء حساب';
}
