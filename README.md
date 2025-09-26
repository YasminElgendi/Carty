# 🛍️ Carty App

Carty App is a Flutter-based shopping application that provides an interactive and modern shopping experience.  
It demonstrates UI design, animations, state management, and internationalization (English + Arabic support).

---

## 📖 Project Overview

Carty App allows users to browse products, view featured items, and explore hot offers with smooth animations.  
It includes **sign-up** and **sign-in** pages with validation, animated navigation, and shopping cart functionality.  
The app also supports multiple languages via Flutter localization (`intl`).

---

## ✨ Features

- **Welcome Screen**
  - Animated images and buttons
  - Navigation to Sign-Up / Sign-In pages

- **Sign Up & Sign In**
  - Form validation (email + password)
  - Password visibility toggle
  - Animated fade transition into the shopping home page

- **Shopping Home Screen**
  - `AppBar` titled **Our Products**
  - Featured products in a **PageView** with dots indicator
  - Responsive **GridView** showing products
    - Animated scaling + shadow effect on tap
    - Cart button to add/remove products (with SnackBar feedback)
  - **Hot Offers** section using `ListView.builder`
    - Each offer includes an image, title, subtitle, and label
    - Hover/tap animations for interactivity

- **Animations**
  - Button press scaling animations
  - Product and offer cards expand slightly with shadows when tapped
  - Smooth fade navigation between screens

- **Localization**
  - Full support for **English** and **Arabic**
  - `.arb` files used for translations
  - No hardcoded strings in UI

---

## 📸 Screenshots

> Add your screenshots inside `assets/screenshots/` and link them here.

| Welcome Screen | Sign-Up Screen | Home Screen |
|----------------|----------------|-------------|
| ![Welcome](assets/screenshots/welcome.png) | ![Sign Up](assets/screenshots/signup.png) | ![Home](assets/screenshots/home.png) |

---

## ⚙️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/carty_app.git
   cd carty_app

2. **Install dependencies** 
   `flutter pub get`


3. **Add assets**

  Place your images inside assets/images/
  Example:
      ```assets/images/product1.png
      assets/images/product2.png
      assets/images/featured1.jpeg```


3. **Ensure your pubspec.yaml includes:**

    `flutter:
    assets:
        - assets/images/
        - assets/screenshots/`


4. **Run the app**
    `flutter run`


5. **Localization setup**
  To regenerate localization files after editing .arb:
        `flutter gen-l10n`


##  📂 Project Structure
```
lib/
│── main.dart                # App entry point
│── Welcome_screen.dart      # Welcome page with animations
│── Signup_screen.dart       # Sign-Up page with validation
│── Signin_screen.dart       # Sign-In page with validation
│── Home_screen.dart         # Shopping home with products & offers
│── l10n/intl_en.arb         # English strings
│── l10n/intl_ar.arb         # Arabic strings
│── generated/l10n.dart      # Auto-generated localization file
assets/
│── images/                  # Product and featured images
│── fonts/                   # App Font
│── screenshots/             # App screenshots


## 🚀 Future Enhancements

- Persistent cart using local storage
- Backend integration (Firebase / REST API)
- Profile & orders history & Tracking
- Dark mode

## 👨‍💻 Author
Developed by Yasmin Elgendi with ❤️ in Flutter.
