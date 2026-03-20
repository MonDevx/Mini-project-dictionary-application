# 📖 Mini Project Dictionary Application

A bilingual **English ↔ Thai** dictionary mobile application built with Flutter. Search words, listen to pronunciations, save favorites, and review your search history — all in one clean, easy-to-use app.

---

## ✨ Features

- 🔍 **Smart Search** — TypeAhead autocomplete for both English and Thai words
- 🔊 **Text-to-Speech** — Hear correct pronunciation of any word
- ⭐ **Favorites** — Save words you want to remember
- 🕓 **History** — Review your past searches
- 🌐 **Multi-language UI** — Interface available in English and Thai
- 📋 **Copy to Clipboard** — Copy words with one tap
- 🗑️ **Swipe to Delete** — Remove individual history/favorite items with a swipe

---

## 📱 Screenshots

<p align="left">
  <img src="screenshot/สกรีนช็อต 2020-11-16 232853.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234649.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234720.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234739.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234755.png" width="150" height="auto">
</p>
<p align="left">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234817.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234834.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234850.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234919.png" width="150" height="auto">
  <img src="screenshot/สกรีนช็อต 2020-11-16 234930.png" width="150" height="auto">
</p>

---

## 🛠️ Tech Stack

| Category | Technology |
|----------|-----------|
| Framework | Flutter |
| Language | Dart |
| State Management | GetX |
| Database | SQLite (sqflite) |
| Local Storage | SharedPreferences + GetStorage |
| Search | flutter_typeahead |
| Text-to-Speech | flutter_tts |
| Localization | flutter_sheet_localization |
| Font | Prompt |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (>=2.7.0)
- Android SDK or Xcode (for iOS builds)

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/MonDevx/Mini-project-dictionary-application.git
cd Mini-project-dictionary-application

# 2. Install dependencies
flutter pub get

# 3. Run the application
flutter run
```

### Build

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release
```

---

## 📂 Project Structure

```
lib/
├── constants/       # App configuration and global settings
├── controllers/     # GetX controllers (language switching)
├── helpers/         # SQLite database helper
├── localization/    # Multi-language support (English & Thai)
├── models/          # Data models (Eng2th, Th2eng)
├── screens/
│   ├── home/        # Search screen
│   ├── history/     # Search history screen
│   ├── favorite/    # Favorites screen
│   └── setting/     # Settings screen
├── widgets/         # Reusable widgets (drawer, loading)
└── main.dart        # App entry point
```

---

## 📦 Version

**Current version: 1.1.0+2**

### Changelog

#### v1.1.0
- Replace deprecated `FlatButton` / `RaisedButton` with `TextButton` / `ElevatedButton`
- Replace deprecated `FlatButton.icon` in drawer with `ListTile` (standard drawer pattern)
- Rename widget classes to follow Dart `UpperCamelCase` naming convention
- Add clear (✕) button to the search input field
- Improve empty states in History and Favorites with descriptive icons
- Add delete icon to swipe-to-dismiss background in History and Favorites
- Reduce excessive top padding on word result cards
- Remove unnecessary `new` keyword usage (Dart 2 style)
- Fix typo: `patttern` → `pattern`
- Update project description in `pubspec.yaml`

#### v1.0.0
- Initial release

---

## 📄 License

MIT License — see [LICENSE](LICENSE) for details.

© 2020 peemapod neamkur
